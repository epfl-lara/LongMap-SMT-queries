; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85232 () Bool)

(assert start!85232)

(declare-fun res!663486 () Bool)

(declare-fun e!560047 () Bool)

(assert (=> start!85232 (=> (not res!663486) (not e!560047))))

(declare-datatypes ((List!20940 0))(
  ( (Nil!20937) (Cons!20936 (h!22098 (_ BitVec 64)) (t!29932 List!20940)) )
))
(declare-fun l!3519 () List!20940)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5739 (List!20940 (_ BitVec 64)) Bool)

(assert (=> start!85232 (= res!663486 (not (contains!5739 l!3519 e!29)))))

(assert (=> start!85232 e!560047))

(assert (=> start!85232 true))

(declare-fun b!992650 () Bool)

(declare-fun e!560048 () Bool)

(assert (=> b!992650 (= e!560047 e!560048)))

(declare-fun res!663487 () Bool)

(assert (=> b!992650 (=> (not res!663487) (not e!560048))))

(declare-datatypes ((tuple2!15068 0))(
  ( (tuple2!15069 (_1!7545 (_ BitVec 64)) (_2!7545 List!20940)) )
))
(declare-datatypes ((Option!552 0))(
  ( (Some!551 (v!14369 tuple2!15068)) (None!550) )
))
(declare-fun lt!440099 () Option!552)

(declare-fun isEmpty!761 (Option!552) Bool)

(assert (=> b!992650 (= res!663487 (not (isEmpty!761 lt!440099)))))

(declare-fun unapply!28 (List!20940) Option!552)

(assert (=> b!992650 (= lt!440099 (unapply!28 l!3519))))

(declare-fun b!992651 () Bool)

(declare-fun get!15708 (Option!552) tuple2!15068)

(assert (=> b!992651 (= e!560048 (contains!5739 (_2!7545 (get!15708 lt!440099)) e!29))))

(assert (= (and start!85232 res!663486) b!992650))

(assert (= (and b!992650 res!663487) b!992651))

(declare-fun m!919829 () Bool)

(assert (=> start!85232 m!919829))

(declare-fun m!919831 () Bool)

(assert (=> b!992650 m!919831))

(declare-fun m!919833 () Bool)

(assert (=> b!992650 m!919833))

(declare-fun m!919835 () Bool)

(assert (=> b!992651 m!919835))

(declare-fun m!919837 () Bool)

(assert (=> b!992651 m!919837))

(check-sat (not b!992651) (not b!992650) (not start!85232))
(check-sat)
(get-model)

(declare-fun d!118133 () Bool)

(declare-fun lt!440110 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!456 (List!20940) (InoxSet (_ BitVec 64)))

(assert (=> d!118133 (= lt!440110 (select (content!456 (_2!7545 (get!15708 lt!440099))) e!29))))

(declare-fun e!560069 () Bool)

(assert (=> d!118133 (= lt!440110 e!560069)))

(declare-fun res!663509 () Bool)

(assert (=> d!118133 (=> (not res!663509) (not e!560069))))

(get-info :version)

(assert (=> d!118133 (= res!663509 ((_ is Cons!20936) (_2!7545 (get!15708 lt!440099))))))

(assert (=> d!118133 (= (contains!5739 (_2!7545 (get!15708 lt!440099)) e!29) lt!440110)))

(declare-fun b!992672 () Bool)

(declare-fun e!560071 () Bool)

(assert (=> b!992672 (= e!560069 e!560071)))

(declare-fun res!663508 () Bool)

(assert (=> b!992672 (=> res!663508 e!560071)))

(assert (=> b!992672 (= res!663508 (= (h!22098 (_2!7545 (get!15708 lt!440099))) e!29))))

(declare-fun b!992673 () Bool)

(assert (=> b!992673 (= e!560071 (contains!5739 (t!29932 (_2!7545 (get!15708 lt!440099))) e!29))))

(assert (= (and d!118133 res!663509) b!992672))

(assert (= (and b!992672 (not res!663508)) b!992673))

(declare-fun m!919861 () Bool)

(assert (=> d!118133 m!919861))

(declare-fun m!919867 () Bool)

(assert (=> d!118133 m!919867))

(declare-fun m!919869 () Bool)

(assert (=> b!992673 m!919869))

(assert (=> b!992651 d!118133))

(declare-fun d!118143 () Bool)

(assert (=> d!118143 (= (get!15708 lt!440099) (v!14369 lt!440099))))

(assert (=> b!992651 d!118143))

(declare-fun d!118147 () Bool)

(assert (=> d!118147 (= (isEmpty!761 lt!440099) (not ((_ is Some!551) lt!440099)))))

(assert (=> b!992650 d!118147))

(declare-fun d!118151 () Bool)

(assert (=> d!118151 (= (unapply!28 l!3519) (ite ((_ is Nil!20937) l!3519) None!550 (Some!551 (tuple2!15069 (h!22098 l!3519) (t!29932 l!3519)))))))

(assert (=> b!992650 d!118151))

(declare-fun d!118155 () Bool)

(declare-fun lt!440115 () Bool)

(assert (=> d!118155 (= lt!440115 (select (content!456 l!3519) e!29))))

(declare-fun e!560079 () Bool)

(assert (=> d!118155 (= lt!440115 e!560079)))

(declare-fun res!663519 () Bool)

(assert (=> d!118155 (=> (not res!663519) (not e!560079))))

(assert (=> d!118155 (= res!663519 ((_ is Cons!20936) l!3519))))

(assert (=> d!118155 (= (contains!5739 l!3519 e!29) lt!440115)))

(declare-fun b!992682 () Bool)

(declare-fun e!560080 () Bool)

(assert (=> b!992682 (= e!560079 e!560080)))

(declare-fun res!663518 () Bool)

(assert (=> b!992682 (=> res!663518 e!560080)))

(assert (=> b!992682 (= res!663518 (= (h!22098 l!3519) e!29))))

(declare-fun b!992683 () Bool)

(assert (=> b!992683 (= e!560080 (contains!5739 (t!29932 l!3519) e!29))))

(assert (= (and d!118155 res!663519) b!992682))

(assert (= (and b!992682 (not res!663518)) b!992683))

(declare-fun m!919877 () Bool)

(assert (=> d!118155 m!919877))

(declare-fun m!919879 () Bool)

(assert (=> d!118155 m!919879))

(declare-fun m!919881 () Bool)

(assert (=> b!992683 m!919881))

(assert (=> start!85232 d!118155))

(check-sat (not b!992683) (not b!992673) (not d!118133) (not d!118155))
(check-sat)
