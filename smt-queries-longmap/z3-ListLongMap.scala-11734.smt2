; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137600 () Bool)

(assert start!137600)

(declare-fun b!1582231 () Bool)

(declare-fun res!1080959 () Bool)

(declare-fun e!882983 () Bool)

(assert (=> b!1582231 (=> (not res!1080959) (not e!882983))))

(declare-datatypes ((B!2746 0))(
  ( (B!2747 (val!19735 Int)) )
))
(declare-datatypes ((tuple2!25638 0))(
  ( (tuple2!25639 (_1!12830 (_ BitVec 64)) (_2!12830 B!2746)) )
))
(declare-datatypes ((List!36855 0))(
  ( (Nil!36852) (Cons!36851 (h!38394 tuple2!25638) (t!51769 List!36855)) )
))
(declare-fun l!1356 () List!36855)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!956 (List!36855 (_ BitVec 64)) Bool)

(assert (=> b!1582231 (= res!1080959 (not (containsKey!956 l!1356 key!387)))))

(declare-fun res!1080960 () Bool)

(assert (=> start!137600 (=> (not res!1080960) (not e!882983))))

(declare-fun isStrictlySorted!1110 (List!36855) Bool)

(assert (=> start!137600 (= res!1080960 (isStrictlySorted!1110 l!1356))))

(assert (=> start!137600 e!882983))

(declare-fun e!882982 () Bool)

(assert (=> start!137600 e!882982))

(assert (=> start!137600 true))

(declare-fun b!1582233 () Bool)

(declare-fun ListPrimitiveSize!203 (List!36855) Int)

(assert (=> b!1582233 (= e!882983 (>= (ListPrimitiveSize!203 (t!51769 l!1356)) (ListPrimitiveSize!203 l!1356)))))

(declare-fun b!1582234 () Bool)

(declare-fun tp_is_empty!39291 () Bool)

(declare-fun tp!114698 () Bool)

(assert (=> b!1582234 (= e!882982 (and tp_is_empty!39291 tp!114698))))

(declare-fun b!1582232 () Bool)

(declare-fun res!1080958 () Bool)

(assert (=> b!1582232 (=> (not res!1080958) (not e!882983))))

(get-info :version)

(assert (=> b!1582232 (= res!1080958 (not ((_ is Nil!36852) l!1356)))))

(assert (= (and start!137600 res!1080960) b!1582231))

(assert (= (and b!1582231 res!1080959) b!1582232))

(assert (= (and b!1582232 res!1080958) b!1582233))

(assert (= (and start!137600 ((_ is Cons!36851) l!1356)) b!1582234))

(declare-fun m!1452787 () Bool)

(assert (=> b!1582231 m!1452787))

(declare-fun m!1452789 () Bool)

(assert (=> start!137600 m!1452789))

(declare-fun m!1452791 () Bool)

(assert (=> b!1582233 m!1452791))

(declare-fun m!1452793 () Bool)

(assert (=> b!1582233 m!1452793))

(check-sat (not start!137600) tp_is_empty!39291 (not b!1582234) (not b!1582233) (not b!1582231))
(check-sat)
(get-model)

(declare-fun d!166931 () Bool)

(declare-fun res!1080974 () Bool)

(declare-fun e!882994 () Bool)

(assert (=> d!166931 (=> res!1080974 e!882994)))

(assert (=> d!166931 (= res!1080974 (or ((_ is Nil!36852) l!1356) ((_ is Nil!36852) (t!51769 l!1356))))))

(assert (=> d!166931 (= (isStrictlySorted!1110 l!1356) e!882994)))

(declare-fun b!1582251 () Bool)

(declare-fun e!882995 () Bool)

(assert (=> b!1582251 (= e!882994 e!882995)))

(declare-fun res!1080975 () Bool)

(assert (=> b!1582251 (=> (not res!1080975) (not e!882995))))

(assert (=> b!1582251 (= res!1080975 (bvslt (_1!12830 (h!38394 l!1356)) (_1!12830 (h!38394 (t!51769 l!1356)))))))

(declare-fun b!1582252 () Bool)

(assert (=> b!1582252 (= e!882995 (isStrictlySorted!1110 (t!51769 l!1356)))))

(assert (= (and d!166931 (not res!1080974)) b!1582251))

(assert (= (and b!1582251 res!1080975) b!1582252))

(declare-fun m!1452803 () Bool)

(assert (=> b!1582252 m!1452803))

(assert (=> start!137600 d!166931))

(declare-fun d!166937 () Bool)

(declare-fun lt!677055 () Int)

(assert (=> d!166937 (>= lt!677055 0)))

(declare-fun e!883008 () Int)

(assert (=> d!166937 (= lt!677055 e!883008)))

(declare-fun c!146644 () Bool)

(assert (=> d!166937 (= c!146644 ((_ is Nil!36852) (t!51769 l!1356)))))

(assert (=> d!166937 (= (ListPrimitiveSize!203 (t!51769 l!1356)) lt!677055)))

(declare-fun b!1582267 () Bool)

(assert (=> b!1582267 (= e!883008 0)))

(declare-fun b!1582268 () Bool)

(assert (=> b!1582268 (= e!883008 (+ 1 (ListPrimitiveSize!203 (t!51769 (t!51769 l!1356)))))))

(assert (= (and d!166937 c!146644) b!1582267))

(assert (= (and d!166937 (not c!146644)) b!1582268))

(declare-fun m!1452807 () Bool)

(assert (=> b!1582268 m!1452807))

(assert (=> b!1582233 d!166937))

(declare-fun d!166941 () Bool)

(declare-fun lt!677056 () Int)

(assert (=> d!166941 (>= lt!677056 0)))

(declare-fun e!883011 () Int)

(assert (=> d!166941 (= lt!677056 e!883011)))

(declare-fun c!146645 () Bool)

(assert (=> d!166941 (= c!146645 ((_ is Nil!36852) l!1356))))

(assert (=> d!166941 (= (ListPrimitiveSize!203 l!1356) lt!677056)))

(declare-fun b!1582271 () Bool)

(assert (=> b!1582271 (= e!883011 0)))

(declare-fun b!1582272 () Bool)

(assert (=> b!1582272 (= e!883011 (+ 1 (ListPrimitiveSize!203 (t!51769 l!1356))))))

(assert (= (and d!166941 c!146645) b!1582271))

(assert (= (and d!166941 (not c!146645)) b!1582272))

(assert (=> b!1582272 m!1452791))

(assert (=> b!1582233 d!166941))

(declare-fun d!166943 () Bool)

(declare-fun res!1080998 () Bool)

(declare-fun e!883026 () Bool)

(assert (=> d!166943 (=> res!1080998 e!883026)))

(assert (=> d!166943 (= res!1080998 (and ((_ is Cons!36851) l!1356) (= (_1!12830 (h!38394 l!1356)) key!387)))))

(assert (=> d!166943 (= (containsKey!956 l!1356 key!387) e!883026)))

(declare-fun b!1582291 () Bool)

(declare-fun e!883027 () Bool)

(assert (=> b!1582291 (= e!883026 e!883027)))

(declare-fun res!1080999 () Bool)

(assert (=> b!1582291 (=> (not res!1080999) (not e!883027))))

(assert (=> b!1582291 (= res!1080999 (and (or (not ((_ is Cons!36851) l!1356)) (bvsle (_1!12830 (h!38394 l!1356)) key!387)) ((_ is Cons!36851) l!1356) (bvslt (_1!12830 (h!38394 l!1356)) key!387)))))

(declare-fun b!1582292 () Bool)

(assert (=> b!1582292 (= e!883027 (containsKey!956 (t!51769 l!1356) key!387))))

(assert (= (and d!166943 (not res!1080998)) b!1582291))

(assert (= (and b!1582291 res!1080999) b!1582292))

(declare-fun m!1452815 () Bool)

(assert (=> b!1582292 m!1452815))

(assert (=> b!1582231 d!166943))

(declare-fun b!1582297 () Bool)

(declare-fun e!883030 () Bool)

(declare-fun tp!114704 () Bool)

(assert (=> b!1582297 (= e!883030 (and tp_is_empty!39291 tp!114704))))

(assert (=> b!1582234 (= tp!114698 e!883030)))

(assert (= (and b!1582234 ((_ is Cons!36851) (t!51769 l!1356))) b!1582297))

(check-sat (not b!1582297) (not b!1582272) tp_is_empty!39291 (not b!1582252) (not b!1582268) (not b!1582292))
(check-sat)
