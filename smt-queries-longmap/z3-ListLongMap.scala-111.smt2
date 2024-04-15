; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1926 () Bool)

(assert start!1926)

(declare-fun res!10287 () Bool)

(declare-fun e!7777 () Bool)

(assert (=> start!1926 (=> (not res!10287) (not e!7777))))

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

(declare-fun isStrictlySorted!69 (List!381) Bool)

(assert (=> start!1926 (= res!10287 (isStrictlySorted!69 l!522))))

(assert (=> start!1926 e!7777))

(declare-fun e!7778 () Bool)

(assert (=> start!1926 e!7778))

(declare-fun tp_is_empty!643 () Bool)

(assert (=> start!1926 tp_is_empty!643))

(declare-fun b!12978 () Bool)

(declare-fun res!10288 () Bool)

(assert (=> b!12978 (=> (not res!10288) (not e!7777))))

(declare-fun value!159 () B!464)

(get-info :version)

(assert (=> b!12978 (= res!10288 (and ((_ is Cons!377) l!522) (= (_2!228 (h!943 l!522)) value!159)))))

(declare-fun b!12979 () Bool)

(assert (=> b!12979 (= e!7777 (not (isStrictlySorted!69 (t!2774 l!522))))))

(declare-fun b!12980 () Bool)

(declare-fun tp!2123 () Bool)

(assert (=> b!12980 (= e!7778 (and tp_is_empty!643 tp!2123))))

(assert (= (and start!1926 res!10287) b!12978))

(assert (= (and b!12978 res!10288) b!12979))

(assert (= (and start!1926 ((_ is Cons!377) l!522)) b!12980))

(declare-fun m!8901 () Bool)

(assert (=> start!1926 m!8901))

(declare-fun m!8903 () Bool)

(assert (=> b!12979 m!8903))

(check-sat (not b!12979) (not start!1926) (not b!12980) tp_is_empty!643)
(check-sat)
(get-model)

(declare-fun d!1933 () Bool)

(declare-fun res!10305 () Bool)

(declare-fun e!7795 () Bool)

(assert (=> d!1933 (=> res!10305 e!7795)))

(assert (=> d!1933 (= res!10305 (or ((_ is Nil!378) (t!2774 l!522)) ((_ is Nil!378) (t!2774 (t!2774 l!522)))))))

(assert (=> d!1933 (= (isStrictlySorted!69 (t!2774 l!522)) e!7795)))

(declare-fun b!13003 () Bool)

(declare-fun e!7796 () Bool)

(assert (=> b!13003 (= e!7795 e!7796)))

(declare-fun res!10306 () Bool)

(assert (=> b!13003 (=> (not res!10306) (not e!7796))))

(assert (=> b!13003 (= res!10306 (bvslt (_1!228 (h!943 (t!2774 l!522))) (_1!228 (h!943 (t!2774 (t!2774 l!522))))))))

(declare-fun b!13004 () Bool)

(assert (=> b!13004 (= e!7796 (isStrictlySorted!69 (t!2774 (t!2774 l!522))))))

(assert (= (and d!1933 (not res!10305)) b!13003))

(assert (= (and b!13003 res!10306) b!13004))

(declare-fun m!8913 () Bool)

(assert (=> b!13004 m!8913))

(assert (=> b!12979 d!1933))

(declare-fun d!1937 () Bool)

(declare-fun res!10307 () Bool)

(declare-fun e!7797 () Bool)

(assert (=> d!1937 (=> res!10307 e!7797)))

(assert (=> d!1937 (= res!10307 (or ((_ is Nil!378) l!522) ((_ is Nil!378) (t!2774 l!522))))))

(assert (=> d!1937 (= (isStrictlySorted!69 l!522) e!7797)))

(declare-fun b!13005 () Bool)

(declare-fun e!7798 () Bool)

(assert (=> b!13005 (= e!7797 e!7798)))

(declare-fun res!10308 () Bool)

(assert (=> b!13005 (=> (not res!10308) (not e!7798))))

(assert (=> b!13005 (= res!10308 (bvslt (_1!228 (h!943 l!522)) (_1!228 (h!943 (t!2774 l!522)))))))

(declare-fun b!13006 () Bool)

(assert (=> b!13006 (= e!7798 (isStrictlySorted!69 (t!2774 l!522)))))

(assert (= (and d!1937 (not res!10307)) b!13005))

(assert (= (and b!13005 res!10308) b!13006))

(assert (=> b!13006 m!8903))

(assert (=> start!1926 d!1937))

(declare-fun b!13011 () Bool)

(declare-fun e!7801 () Bool)

(declare-fun tp!2132 () Bool)

(assert (=> b!13011 (= e!7801 (and tp_is_empty!643 tp!2132))))

(assert (=> b!12980 (= tp!2123 e!7801)))

(assert (= (and b!12980 ((_ is Cons!377) (t!2774 l!522))) b!13011))

(check-sat (not b!13006) (not b!13004) (not b!13011) tp_is_empty!643)
(check-sat)
