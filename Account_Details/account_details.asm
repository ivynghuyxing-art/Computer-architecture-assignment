title       assignment      account management

.model      small
.stack      64

.data
	logo_account		db 13,10,"=========================="
           		        db 13,10,"        .--------."
            		    db 13,10,"        |   O    |"
            		    db 13,10,"        |  /|\   |"
            		    db 13,10,"        |  / \   |"
            		    db 13,10,"        '--------'"
            		    db 13,10,"      ACCOUNT MANAGEMENT"
            		    db 13,10,"==========================$"

	msg_account         db 13,10,"=========================="
            		    db 13,10,"    Account Management"
            		    db 13,10,"==========================$"
	msg_view	        db 13,10,"1. View Account Details$"
	msg_update          db 13,10,"2. Update Account$"
	msg_change          db 13,10,"3. Change Password$"
	msg_back            db 13,10,"4. Back$"
	msg_choice1         db 13,10,"Enter your choice (1 to 4) : $"


	msg_details         db 13,10,"=========================="
		                db 13,10,"      Account Details"
		                db 13,10,"==========================$"
	msg_username1       db 13,10,"Username        : $"
	msg_email1          db 13,10,"Email           : $"
	msg_phone1          db 13,10,"Phone Number    : $"
	msg_current         db 13,10,"Current Balance : RM $"
	msg_return1         db 13,10,13,10,"Press ENTER to return to Account Management...$"


	msg_updateacc       db 13,10,"=========================="
			            db 13,10,"      Update Account"
			            db 13,10,"==========================$"
	msg_username2       db 13,10,"1. Username$"
	msg_phone2          db 13,10,"2. Phone Number$"
	msg_email2          db 13,10,"3. Email$"
	msg_back2           db 13,10,"4. Back$"
	msg_choice2         db 13,10,"Enter your choice (1 to 4) : $"
	msg_invalid         db 13,10,"Invalid choice! Please try again!$"
	msg_currentname     db 13,10,"Current Username     : $"
	msg_newname         db 13,10,"New Username         : $"
	msg_currentphone    db 13,10,"Current Phone Number : $"
	msg_newphone        db 13,10,"New Phone Number     : $"
	msg_currentemail    db 13,10,"Current Email        : $"
	msg_newemail        db 13,10,"New Email            : $"
	msg_updatesuccess   db 13,10,"Update successful!$"
	msg_invalid2        db 13,10,"Username cannot be same as current!$"
	msg_invalid3        db 13,10,"Phone number cannot be same as current!$"
	msg_invalid4        db 13,10,"Email cannot be same as current!$"


	msg_changepass      db 13,10,"=========================="
		                db 13,10,"      Change Password"
		                db 13,10,"==========================$"
	msg_currentpass     db 13,10,"Current Password : $"
	msg_newpass         db 13,10,"New Password     : $"
	msg_confirmpass     db 13,10,"Confirm Password : $"
	msg_invalid5        db 13,10,"Password must contain uppercase, lowercase, special character and number!$"
	msg_valid           db 13,10,"Update successful!$"
	msg_invalid6        db 13,10,"Password cannot be same as current!$"
	msg_invalid7        db 13,10,"Password does not match!$"

current_balance     dw ?