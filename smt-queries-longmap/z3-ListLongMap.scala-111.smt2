; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1926 () Bool)

(assert start!1926)

(declare-fun res!10286 () Bool)

(declare-fun e!7774 () Bool)

(assert (=> start!1926 (=> (not res!10286) (not e!7774))))

(declare-datatypes ((B!464 0))(
  ( (B!465 (val!330 Int)) )
))
(declare-datatypes ((tuple2!456 0))(
  ( (tuple2!457 (_1!228 (_ BitVec 64)) (_2!228 B!464)) )
))
(declare-datatypes ((List!381 0))(
  ( (Nil!378) (Cons!377 (h!943 tuple2!456) (t!2774 List!381)) )
))
(declare-fun l!522 () List!381)

(declare-fun isStrictlySorted!66 (List!381) Bool)

(assert (=> start!1926 (= res!10286 (isStrictlySorted!66 l!522))))

(assert (=> start!1926 e!7774))

(declare-fun e!7773 () Bool)

(assert (=> start!1926 e!7773))

(declare-fun tp_is_empty!643 () Bool)

(assert (=> start!1926 tp_is_empty!643))

(declare-fun b!12972 () Bool)

(declare-fun res!10285 () Bool)

(assert (=> b!12972 (=> (not res!10285) (not e!7774))))

(declare-fun value!159 () B!464)

(get-info :version)

(assert (=> b!12972 (= res!10285 (and ((_ is Cons!377) l!522) (= (_2!228 (h!943 l!522)) value!159)))))

(declare-fun b!12973 () Bool)

(assert (=> b!12973 (= e!7774 (not (isStrictlySorted!66 (t!2774 l!522))))))

(declare-fun b!12974 () Bool)

(declare-fun tp!2123 () Bool)

(assert (=> b!12974 (= e!7773 (and tp_is_empty!643 tp!2123))))

(assert (= (and start!1926 res!10286) b!12972))

(assert (= (and b!12972 res!10285) b!12973))

(assert (= (and start!1926 ((_ is Cons!377) l!522)) b!12974))

(declare-fun m!8901 () Bool)

(assert (=> start!1926 m!8901))

(declare-fun m!8903 () Bool)

(assert (=> b!12973 m!8903))

(check-sat (not b!12973) (not start!1926) (not b!12974) tp_is_empty!643)
(check-sat)
(get-model)

(declare-fun d!1930 () Bool)

(declare-fun res!10307 () Bool)

(declare-fun e!7795 () Bool)

(assert (=> d!1930 (=> res!10307 e!7795)))

(assert (=> d!1930 (= res!10307 (or ((_ is Nil!378) (t!2774 l!522)) ((_ is Nil!378) (t!2774 (t!2774 l!522)))))))

(assert (=> d!1930 (= (isStrictlySorted!66 (t!2774 l!522)) e!7795)))

(declare-fun b!13001 () Bool)

(declare-fun e!7797 () Bool)

(assert (=> b!13001 (= e!7795 e!7797)))

(declare-fun res!10309 () Bool)

(assert (=> b!13001 (=> (not res!10309) (not e!7797))))

(assert (=> b!13001 (= res!10309 (bvslt (_1!228 (h!943 (t!2774 l!522))) (_1!228 (h!943 (t!2774 (t!2774 l!522))))))))

(declare-fun b!13003 () Bool)

(assert (=> b!13003 (= e!7797 (isStrictlySorted!66 (t!2774 (t!2774 l!522))))))

(assert (= (and d!1930 (not res!10307)) b!13001))

(assert (= (and b!13001 res!10309) b!13003))

(declare-fun m!8913 () Bool)

(assert (=> b!13003 m!8913))

(assert (=> b!12973 d!1930))

(declare-fun d!1935 () Bool)

(declare-fun res!10311 () Bool)

(declare-fun e!7799 () Bool)

(assert (=> d!1935 (=> res!10311 e!7799)))

(assert (=> d!1935 (= res!10311 (or ((_ is Nil!378) l!522) ((_ is Nil!378) (t!2774 l!522))))))

(assert (=> d!1935 (= (isStrictlySorted!66 l!522) e!7799)))

(declare-fun b!13005 () Bool)

(declare-fun e!7800 () Bool)

(assert (=> b!13005 (= e!7799 e!7800)))

(declare-fun res!10312 () Bool)

(assert (=> b!13005 (=> (not res!10312) (not e!7800))))

(assert (=> b!13005 (= res!10312 (bvslt (_1!228 (h!943 l!522)) (_1!228 (h!943 (t!2774 l!522)))))))

(declare-fun b!13006 () Bool)

(assert (=> b!13006 (= e!7800 (isStrictlySorted!66 (t!2774 l!522)))))

(assert (= (and d!1935 (not res!10311)) b!13005))

(assert (= (and b!13005 res!10312) b!13006))

(assert (=> b!13006 m!8903))

(assert (=> start!1926 d!1935))

(declare-fun b!13018 () Bool)

(declare-fun e!7808 () Bool)

(declare-fun tp!2135 () Bool)

(assert (=> b!13018 (= e!7808 (and tp_is_empty!643 tp!2135))))

(assert (=> b!12974 (= tp!2123 e!7808)))

(assert (= (and b!12974 ((_ is Cons!377) (t!2774 l!522))) b!13018))

(check-sat (not b!13006) (not b!13003) (not b!13018) tp_is_empty!643)
(check-sat)
