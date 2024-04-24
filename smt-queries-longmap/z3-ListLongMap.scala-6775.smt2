; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85364 () Bool)

(assert start!85364)

(declare-fun res!663859 () Bool)

(declare-fun e!560687 () Bool)

(assert (=> start!85364 (=> (not res!663859) (not e!560687))))

(declare-datatypes ((List!20885 0))(
  ( (Nil!20882) (Cons!20881 (h!22049 (_ BitVec 64)) (t!29878 List!20885)) )
))
(declare-fun l!3519 () List!20885)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5779 (List!20885 (_ BitVec 64)) Bool)

(assert (=> start!85364 (= res!663859 (not (contains!5779 l!3519 e!29)))))

(assert (=> start!85364 e!560687))

(assert (=> start!85364 true))

(declare-fun b!993693 () Bool)

(declare-fun e!560688 () Bool)

(assert (=> b!993693 (= e!560687 e!560688)))

(declare-fun res!663860 () Bool)

(assert (=> b!993693 (=> (not res!663860) (not e!560688))))

(declare-datatypes ((tuple2!14980 0))(
  ( (tuple2!14981 (_1!7501 (_ BitVec 64)) (_2!7501 List!20885)) )
))
(declare-datatypes ((Option!541 0))(
  ( (Some!540 (v!14355 tuple2!14980)) (None!539) )
))
(declare-fun lt!440642 () Option!541)

(declare-fun isEmpty!756 (Option!541) Bool)

(assert (=> b!993693 (= res!663860 (not (isEmpty!756 lt!440642)))))

(declare-fun unapply!22 (List!20885) Option!541)

(assert (=> b!993693 (= lt!440642 (unapply!22 l!3519))))

(declare-fun b!993694 () Bool)

(declare-fun isDefined!388 (Option!541) Bool)

(assert (=> b!993694 (= e!560688 (not (isDefined!388 lt!440642)))))

(assert (= (and start!85364 res!663859) b!993693))

(assert (= (and b!993693 res!663860) b!993694))

(declare-fun m!921773 () Bool)

(assert (=> start!85364 m!921773))

(declare-fun m!921775 () Bool)

(assert (=> b!993693 m!921775))

(declare-fun m!921777 () Bool)

(assert (=> b!993693 m!921777))

(declare-fun m!921779 () Bool)

(assert (=> b!993694 m!921779))

(check-sat (not start!85364) (not b!993693) (not b!993694))
(check-sat)
(get-model)

(declare-fun d!118609 () Bool)

(declare-fun lt!440655 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!451 (List!20885) (InoxSet (_ BitVec 64)))

(assert (=> d!118609 (= lt!440655 (select (content!451 l!3519) e!29))))

(declare-fun e!560713 () Bool)

(assert (=> d!118609 (= lt!440655 e!560713)))

(declare-fun res!663885 () Bool)

(assert (=> d!118609 (=> (not res!663885) (not e!560713))))

(get-info :version)

(assert (=> d!118609 (= res!663885 ((_ is Cons!20881) l!3519))))

(assert (=> d!118609 (= (contains!5779 l!3519 e!29) lt!440655)))

(declare-fun b!993719 () Bool)

(declare-fun e!560714 () Bool)

(assert (=> b!993719 (= e!560713 e!560714)))

(declare-fun res!663886 () Bool)

(assert (=> b!993719 (=> res!663886 e!560714)))

(assert (=> b!993719 (= res!663886 (= (h!22049 l!3519) e!29))))

(declare-fun b!993720 () Bool)

(assert (=> b!993720 (= e!560714 (contains!5779 (t!29878 l!3519) e!29))))

(assert (= (and d!118609 res!663885) b!993719))

(assert (= (and b!993719 (not res!663886)) b!993720))

(declare-fun m!921797 () Bool)

(assert (=> d!118609 m!921797))

(declare-fun m!921799 () Bool)

(assert (=> d!118609 m!921799))

(declare-fun m!921801 () Bool)

(assert (=> b!993720 m!921801))

(assert (=> start!85364 d!118609))

(declare-fun d!118615 () Bool)

(assert (=> d!118615 (= (isEmpty!756 lt!440642) (not ((_ is Some!540) lt!440642)))))

(assert (=> b!993693 d!118615))

(declare-fun d!118619 () Bool)

(assert (=> d!118619 (= (unapply!22 l!3519) (ite ((_ is Nil!20882) l!3519) None!539 (Some!540 (tuple2!14981 (h!22049 l!3519) (t!29878 l!3519)))))))

(assert (=> b!993693 d!118619))

(declare-fun d!118627 () Bool)

(assert (=> d!118627 (= (isDefined!388 lt!440642) (not (isEmpty!756 lt!440642)))))

(declare-fun bs!28250 () Bool)

(assert (= bs!28250 d!118627))

(assert (=> bs!28250 m!921775))

(assert (=> b!993694 d!118627))

(check-sat (not d!118609) (not b!993720) (not d!118627))
(check-sat)
