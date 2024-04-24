; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85448 () Bool)

(assert start!85448)

(declare-fun res!663986 () Bool)

(declare-fun e!560821 () Bool)

(assert (=> start!85448 (=> (not res!663986) (not e!560821))))

(declare-datatypes ((List!20897 0))(
  ( (Nil!20894) (Cons!20893 (h!22061 (_ BitVec 64)) (t!29890 List!20897)) )
))
(declare-fun l!3519 () List!20897)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5791 (List!20897 (_ BitVec 64)) Bool)

(assert (=> start!85448 (= res!663986 (not (contains!5791 l!3519 e!29)))))

(assert (=> start!85448 e!560821))

(assert (=> start!85448 true))

(declare-fun b!993836 () Bool)

(declare-fun e!560822 () Bool)

(assert (=> b!993836 (= e!560821 e!560822)))

(declare-fun res!663984 () Bool)

(assert (=> b!993836 (=> (not res!663984) (not e!560822))))

(declare-datatypes ((tuple2!14998 0))(
  ( (tuple2!14999 (_1!7510 (_ BitVec 64)) (_2!7510 List!20897)) )
))
(declare-datatypes ((Option!550 0))(
  ( (Some!549 (v!14373 tuple2!14998)) (None!548) )
))
(declare-fun lt!440720 () Option!550)

(declare-fun isEmpty!765 (Option!550) Bool)

(assert (=> b!993836 (= res!663984 (not (isEmpty!765 lt!440720)))))

(declare-fun unapply!31 (List!20897) Option!550)

(assert (=> b!993836 (= lt!440720 (unapply!31 l!3519))))

(declare-fun b!993837 () Bool)

(declare-fun e!560823 () Bool)

(assert (=> b!993837 (= e!560822 e!560823)))

(declare-fun res!663985 () Bool)

(assert (=> b!993837 (=> (not res!663985) (not e!560823))))

(declare-fun lt!440719 () tuple2!14998)

(assert (=> b!993837 (= res!663985 (not (contains!5791 (_2!7510 lt!440719) e!29)))))

(declare-fun get!15747 (Option!550) tuple2!14998)

(assert (=> b!993837 (= lt!440719 (get!15747 lt!440720))))

(declare-fun b!993838 () Bool)

(declare-fun ListPrimitiveSize!94 (List!20897) Int)

(assert (=> b!993838 (= e!560823 (>= (ListPrimitiveSize!94 (_2!7510 lt!440719)) (ListPrimitiveSize!94 l!3519)))))

(assert (= (and start!85448 res!663986) b!993836))

(assert (= (and b!993836 res!663984) b!993837))

(assert (= (and b!993837 res!663985) b!993838))

(declare-fun m!921947 () Bool)

(assert (=> start!85448 m!921947))

(declare-fun m!921949 () Bool)

(assert (=> b!993836 m!921949))

(declare-fun m!921951 () Bool)

(assert (=> b!993836 m!921951))

(declare-fun m!921953 () Bool)

(assert (=> b!993837 m!921953))

(declare-fun m!921955 () Bool)

(assert (=> b!993837 m!921955))

(declare-fun m!921957 () Bool)

(assert (=> b!993838 m!921957))

(declare-fun m!921959 () Bool)

(assert (=> b!993838 m!921959))

(check-sat (not b!993836) (not b!993838) (not b!993837) (not start!85448))
(check-sat)
(get-model)

(declare-fun d!118683 () Bool)

(get-info :version)

(assert (=> d!118683 (= (isEmpty!765 lt!440720) (not ((_ is Some!549) lt!440720)))))

(assert (=> b!993836 d!118683))

(declare-fun d!118687 () Bool)

(assert (=> d!118687 (= (unapply!31 l!3519) (ite ((_ is Nil!20894) l!3519) None!548 (Some!549 (tuple2!14999 (h!22061 l!3519) (t!29890 l!3519)))))))

(assert (=> b!993836 d!118687))

(declare-fun d!118691 () Bool)

(declare-fun lt!440742 () Int)

(assert (=> d!118691 (>= lt!440742 0)))

(declare-fun e!560854 () Int)

(assert (=> d!118691 (= lt!440742 e!560854)))

(declare-fun c!101072 () Bool)

(assert (=> d!118691 (= c!101072 ((_ is Nil!20894) (_2!7510 lt!440719)))))

(assert (=> d!118691 (= (ListPrimitiveSize!94 (_2!7510 lt!440719)) lt!440742)))

(declare-fun b!993875 () Bool)

(assert (=> b!993875 (= e!560854 0)))

(declare-fun b!993876 () Bool)

(assert (=> b!993876 (= e!560854 (+ 1 (ListPrimitiveSize!94 (t!29890 (_2!7510 lt!440719)))))))

(assert (= (and d!118691 c!101072) b!993875))

(assert (= (and d!118691 (not c!101072)) b!993876))

(declare-fun m!921999 () Bool)

(assert (=> b!993876 m!921999))

(assert (=> b!993838 d!118691))

(declare-fun d!118699 () Bool)

(declare-fun lt!440743 () Int)

(assert (=> d!118699 (>= lt!440743 0)))

(declare-fun e!560855 () Int)

(assert (=> d!118699 (= lt!440743 e!560855)))

(declare-fun c!101073 () Bool)

(assert (=> d!118699 (= c!101073 ((_ is Nil!20894) l!3519))))

(assert (=> d!118699 (= (ListPrimitiveSize!94 l!3519) lt!440743)))

(declare-fun b!993877 () Bool)

(assert (=> b!993877 (= e!560855 0)))

(declare-fun b!993878 () Bool)

(assert (=> b!993878 (= e!560855 (+ 1 (ListPrimitiveSize!94 (t!29890 l!3519))))))

(assert (= (and d!118699 c!101073) b!993877))

(assert (= (and d!118699 (not c!101073)) b!993878))

(declare-fun m!922001 () Bool)

(assert (=> b!993878 m!922001))

(assert (=> b!993838 d!118699))

(declare-fun d!118703 () Bool)

(declare-fun lt!440753 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!461 (List!20897) (InoxSet (_ BitVec 64)))

(assert (=> d!118703 (= lt!440753 (select (content!461 (_2!7510 lt!440719)) e!29))))

(declare-fun e!560870 () Bool)

(assert (=> d!118703 (= lt!440753 e!560870)))

(declare-fun res!664021 () Bool)

(assert (=> d!118703 (=> (not res!664021) (not e!560870))))

(assert (=> d!118703 (= res!664021 ((_ is Cons!20893) (_2!7510 lt!440719)))))

(assert (=> d!118703 (= (contains!5791 (_2!7510 lt!440719) e!29) lt!440753)))

(declare-fun b!993897 () Bool)

(declare-fun e!560871 () Bool)

(assert (=> b!993897 (= e!560870 e!560871)))

(declare-fun res!664022 () Bool)

(assert (=> b!993897 (=> res!664022 e!560871)))

(assert (=> b!993897 (= res!664022 (= (h!22061 (_2!7510 lt!440719)) e!29))))

(declare-fun b!993898 () Bool)

(assert (=> b!993898 (= e!560871 (contains!5791 (t!29890 (_2!7510 lt!440719)) e!29))))

(assert (= (and d!118703 res!664021) b!993897))

(assert (= (and b!993897 (not res!664022)) b!993898))

(declare-fun m!922013 () Bool)

(assert (=> d!118703 m!922013))

(declare-fun m!922015 () Bool)

(assert (=> d!118703 m!922015))

(declare-fun m!922017 () Bool)

(assert (=> b!993898 m!922017))

(assert (=> b!993837 d!118703))

(declare-fun d!118715 () Bool)

(assert (=> d!118715 (= (get!15747 lt!440720) (v!14373 lt!440720))))

(assert (=> b!993837 d!118715))

(declare-fun d!118719 () Bool)

(declare-fun lt!440755 () Bool)

(assert (=> d!118719 (= lt!440755 (select (content!461 l!3519) e!29))))

(declare-fun e!560874 () Bool)

(assert (=> d!118719 (= lt!440755 e!560874)))

(declare-fun res!664025 () Bool)

(assert (=> d!118719 (=> (not res!664025) (not e!560874))))

(assert (=> d!118719 (= res!664025 ((_ is Cons!20893) l!3519))))

(assert (=> d!118719 (= (contains!5791 l!3519 e!29) lt!440755)))

(declare-fun b!993901 () Bool)

(declare-fun e!560875 () Bool)

(assert (=> b!993901 (= e!560874 e!560875)))

(declare-fun res!664026 () Bool)

(assert (=> b!993901 (=> res!664026 e!560875)))

(assert (=> b!993901 (= res!664026 (= (h!22061 l!3519) e!29))))

(declare-fun b!993902 () Bool)

(assert (=> b!993902 (= e!560875 (contains!5791 (t!29890 l!3519) e!29))))

(assert (= (and d!118719 res!664025) b!993901))

(assert (= (and b!993901 (not res!664026)) b!993902))

(declare-fun m!922025 () Bool)

(assert (=> d!118719 m!922025))

(declare-fun m!922027 () Bool)

(assert (=> d!118719 m!922027))

(declare-fun m!922029 () Bool)

(assert (=> b!993902 m!922029))

(assert (=> start!85448 d!118719))

(check-sat (not b!993878) (not d!118719) (not d!118703) (not b!993898) (not b!993902) (not b!993876))
(check-sat)
