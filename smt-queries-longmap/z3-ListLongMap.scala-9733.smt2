; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115504 () Bool)

(assert start!115504)

(declare-fun res!908676 () Bool)

(declare-fun e!774706 () Bool)

(assert (=> start!115504 (=> (not res!908676) (not e!774706))))

(declare-datatypes ((List!31888 0))(
  ( (Nil!31885) (Cons!31884 (h!33102 (_ BitVec 64)) (t!46574 List!31888)) )
))
(declare-datatypes ((tuple2!24444 0))(
  ( (tuple2!24445 (_1!12233 (_ BitVec 64)) (_2!12233 List!31888)) )
))
(declare-datatypes ((Option!784 0))(
  ( (Some!783 (v!21583 tuple2!24444)) (None!782) )
))
(declare-fun lt!601569 () Option!784)

(declare-fun isEmpty!1116 (Option!784) Bool)

(assert (=> start!115504 (= res!908676 (not (isEmpty!1116 lt!601569)))))

(declare-fun l!3677 () List!31888)

(declare-fun unapply!55 (List!31888) Option!784)

(assert (=> start!115504 (= lt!601569 (unapply!55 l!3677))))

(assert (=> start!115504 e!774706))

(assert (=> start!115504 true))

(declare-fun b!1365859 () Bool)

(declare-fun ListPrimitiveSize!172 (List!31888) Int)

(declare-fun get!22756 (Option!784) tuple2!24444)

(assert (=> b!1365859 (= e!774706 (>= (ListPrimitiveSize!172 (_2!12233 (get!22756 lt!601569))) (ListPrimitiveSize!172 l!3677)))))

(assert (= (and start!115504 res!908676) b!1365859))

(declare-fun m!1250929 () Bool)

(assert (=> start!115504 m!1250929))

(declare-fun m!1250931 () Bool)

(assert (=> start!115504 m!1250931))

(declare-fun m!1250933 () Bool)

(assert (=> b!1365859 m!1250933))

(declare-fun m!1250935 () Bool)

(assert (=> b!1365859 m!1250935))

(declare-fun m!1250937 () Bool)

(assert (=> b!1365859 m!1250937))

(check-sat (not b!1365859) (not start!115504))
(check-sat)
(get-model)

(declare-fun d!146919 () Bool)

(declare-fun lt!601580 () Int)

(assert (=> d!146919 (>= lt!601580 0)))

(declare-fun e!774717 () Int)

(assert (=> d!146919 (= lt!601580 e!774717)))

(declare-fun c!128043 () Bool)

(get-info :version)

(assert (=> d!146919 (= c!128043 ((_ is Nil!31885) (_2!12233 (get!22756 lt!601569))))))

(assert (=> d!146919 (= (ListPrimitiveSize!172 (_2!12233 (get!22756 lt!601569))) lt!601580)))

(declare-fun b!1365874 () Bool)

(assert (=> b!1365874 (= e!774717 0)))

(declare-fun b!1365875 () Bool)

(assert (=> b!1365875 (= e!774717 (+ 1 (ListPrimitiveSize!172 (t!46574 (_2!12233 (get!22756 lt!601569))))))))

(assert (= (and d!146919 c!128043) b!1365874))

(assert (= (and d!146919 (not c!128043)) b!1365875))

(declare-fun m!1250959 () Bool)

(assert (=> b!1365875 m!1250959))

(assert (=> b!1365859 d!146919))

(declare-fun d!146925 () Bool)

(assert (=> d!146925 (= (get!22756 lt!601569) (v!21583 lt!601569))))

(assert (=> b!1365859 d!146925))

(declare-fun d!146929 () Bool)

(declare-fun lt!601584 () Int)

(assert (=> d!146929 (>= lt!601584 0)))

(declare-fun e!774721 () Int)

(assert (=> d!146929 (= lt!601584 e!774721)))

(declare-fun c!128047 () Bool)

(assert (=> d!146929 (= c!128047 ((_ is Nil!31885) l!3677))))

(assert (=> d!146929 (= (ListPrimitiveSize!172 l!3677) lt!601584)))

(declare-fun b!1365882 () Bool)

(assert (=> b!1365882 (= e!774721 0)))

(declare-fun b!1365883 () Bool)

(assert (=> b!1365883 (= e!774721 (+ 1 (ListPrimitiveSize!172 (t!46574 l!3677))))))

(assert (= (and d!146929 c!128047) b!1365882))

(assert (= (and d!146929 (not c!128047)) b!1365883))

(declare-fun m!1250963 () Bool)

(assert (=> b!1365883 m!1250963))

(assert (=> b!1365859 d!146929))

(declare-fun d!146933 () Bool)

(assert (=> d!146933 (= (isEmpty!1116 lt!601569) (not ((_ is Some!783) lt!601569)))))

(assert (=> start!115504 d!146933))

(declare-fun d!146939 () Bool)

(assert (=> d!146939 (= (unapply!55 l!3677) (ite ((_ is Nil!31885) l!3677) None!782 (Some!783 (tuple2!24445 (h!33102 l!3677) (t!46574 l!3677)))))))

(assert (=> start!115504 d!146939))

(check-sat (not b!1365883) (not b!1365875))
(check-sat)
