; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85228 () Bool)

(assert start!85228)

(declare-fun res!663558 () Bool)

(declare-fun e!560148 () Bool)

(assert (=> start!85228 (=> (not res!663558) (not e!560148))))

(declare-datatypes ((List!20900 0))(
  ( (Nil!20897) (Cons!20896 (h!22058 (_ BitVec 64)) (t!29901 List!20900)) )
))
(declare-fun l!3519 () List!20900)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5761 (List!20900 (_ BitVec 64)) Bool)

(assert (=> start!85228 (= res!663558 (not (contains!5761 l!3519 e!29)))))

(assert (=> start!85228 e!560148))

(assert (=> start!85228 true))

(declare-fun b!992832 () Bool)

(declare-fun e!560147 () Bool)

(assert (=> b!992832 (= e!560148 e!560147)))

(declare-fun res!663557 () Bool)

(assert (=> b!992832 (=> (not res!663557) (not e!560147))))

(declare-datatypes ((tuple2!14984 0))(
  ( (tuple2!14985 (_1!7503 (_ BitVec 64)) (_2!7503 List!20900)) )
))
(declare-datatypes ((Option!547 0))(
  ( (Some!546 (v!14365 tuple2!14984)) (None!545) )
))
(declare-fun lt!440308 () Option!547)

(declare-fun isEmpty!754 (Option!547) Bool)

(assert (=> b!992832 (= res!663557 (not (isEmpty!754 lt!440308)))))

(declare-fun unapply!26 (List!20900) Option!547)

(assert (=> b!992832 (= lt!440308 (unapply!26 l!3519))))

(declare-fun b!992833 () Bool)

(assert (=> b!992833 (= e!560147 false)))

(declare-fun lt!440307 () Bool)

(declare-fun get!15707 (Option!547) tuple2!14984)

(assert (=> b!992833 (= lt!440307 (contains!5761 (_2!7503 (get!15707 lt!440308)) e!29))))

(assert (= (and start!85228 res!663558) b!992832))

(assert (= (and b!992832 res!663557) b!992833))

(declare-fun m!920531 () Bool)

(assert (=> start!85228 m!920531))

(declare-fun m!920533 () Bool)

(assert (=> b!992832 m!920533))

(declare-fun m!920535 () Bool)

(assert (=> b!992832 m!920535))

(declare-fun m!920537 () Bool)

(assert (=> b!992833 m!920537))

(declare-fun m!920539 () Bool)

(assert (=> b!992833 m!920539))

(check-sat (not start!85228) (not b!992832) (not b!992833))
(check-sat)
