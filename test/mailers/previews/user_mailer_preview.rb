# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        UserMailer.with(user: User.first).welcome_email
    end

    def daily_email
        u = User.last
        new_fav_items = TopicIdeaSet.where(topic: u.fav_topics).where("created_at > ?", Time.now.beginning_of_day - 1.day)
        new_followers = u.followers.where("user_user_relations.created_at > ?", Time.now.beginning_of_day - 1.day)
        UserMailer.with(user: u, new_followers: new_followers, new_fav_items: new_fav_items).daily_email
    end

    def follow_email
        UserMailer.with(user: User.first, follower: User.last).follow_email
    end
end
