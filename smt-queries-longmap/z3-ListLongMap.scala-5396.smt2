; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71988 () Bool)

(assert start!71988)

(declare-fun res!568969 () Bool)

(declare-fun e!466533 () Bool)

(assert (=> start!71988 (=> (not res!568969) (not e!466533))))

(declare-datatypes ((B!1180 0))(
  ( (B!1181 (val!7672 Int)) )
))
(declare-datatypes ((tuple2!10204 0))(
  ( (tuple2!10205 (_1!5113 (_ BitVec 64)) (_2!5113 B!1180)) )
))
(declare-datatypes ((List!15977 0))(
  ( (Nil!15974) (Cons!15973 (h!17104 tuple2!10204) (t!22348 List!15977)) )
))
(declare-fun l!390 () List!15977)

(declare-fun isStrictlySorted!447 (List!15977) Bool)

(assert (=> start!71988 (= res!568969 (isStrictlySorted!447 l!390))))

(assert (=> start!71988 e!466533))

(declare-fun e!466532 () Bool)

(assert (=> start!71988 e!466532))

(declare-fun b!836271 () Bool)

(declare-fun res!568970 () Bool)

(assert (=> b!836271 (=> (not res!568970) (not e!466533))))

(get-info :version)

(assert (=> b!836271 (= res!568970 ((_ is Cons!15973) l!390))))

(declare-fun b!836272 () Bool)

(assert (=> b!836272 (= e!466533 (not (isStrictlySorted!447 (t!22348 l!390))))))

(declare-fun b!836273 () Bool)

(declare-fun tp_is_empty!15249 () Bool)

(declare-fun tp!47408 () Bool)

(assert (=> b!836273 (= e!466532 (and tp_is_empty!15249 tp!47408))))

(assert (= (and start!71988 res!568969) b!836271))

(assert (= (and b!836271 res!568970) b!836272))

(assert (= (and start!71988 ((_ is Cons!15973) l!390)) b!836273))

(declare-fun m!781643 () Bool)

(assert (=> start!71988 m!781643))

(declare-fun m!781645 () Bool)

(assert (=> b!836272 m!781645))

(check-sat (not start!71988) (not b!836272) (not b!836273) tp_is_empty!15249)
(check-sat)
(get-model)

(declare-fun d!107551 () Bool)

(declare-fun res!568989 () Bool)

(declare-fun e!466552 () Bool)

(assert (=> d!107551 (=> res!568989 e!466552)))

(assert (=> d!107551 (= res!568989 (or ((_ is Nil!15974) l!390) ((_ is Nil!15974) (t!22348 l!390))))))

(assert (=> d!107551 (= (isStrictlySorted!447 l!390) e!466552)))

(declare-fun b!836295 () Bool)

(declare-fun e!466553 () Bool)

(assert (=> b!836295 (= e!466552 e!466553)))

(declare-fun res!568990 () Bool)

(assert (=> b!836295 (=> (not res!568990) (not e!466553))))

(assert (=> b!836295 (= res!568990 (bvslt (_1!5113 (h!17104 l!390)) (_1!5113 (h!17104 (t!22348 l!390)))))))

(declare-fun b!836296 () Bool)

(assert (=> b!836296 (= e!466553 (isStrictlySorted!447 (t!22348 l!390)))))

(assert (= (and d!107551 (not res!568989)) b!836295))

(assert (= (and b!836295 res!568990) b!836296))

(assert (=> b!836296 m!781645))

(assert (=> start!71988 d!107551))

(declare-fun d!107559 () Bool)

(declare-fun res!568995 () Bool)

(declare-fun e!466558 () Bool)

(assert (=> d!107559 (=> res!568995 e!466558)))

(assert (=> d!107559 (= res!568995 (or ((_ is Nil!15974) (t!22348 l!390)) ((_ is Nil!15974) (t!22348 (t!22348 l!390)))))))

(assert (=> d!107559 (= (isStrictlySorted!447 (t!22348 l!390)) e!466558)))

(declare-fun b!836301 () Bool)

(declare-fun e!466559 () Bool)

(assert (=> b!836301 (= e!466558 e!466559)))

(declare-fun res!568996 () Bool)

(assert (=> b!836301 (=> (not res!568996) (not e!466559))))

(assert (=> b!836301 (= res!568996 (bvslt (_1!5113 (h!17104 (t!22348 l!390))) (_1!5113 (h!17104 (t!22348 (t!22348 l!390))))))))

(declare-fun b!836302 () Bool)

(assert (=> b!836302 (= e!466559 (isStrictlySorted!447 (t!22348 (t!22348 l!390))))))

(assert (= (and d!107559 (not res!568995)) b!836301))

(assert (= (and b!836301 res!568996) b!836302))

(declare-fun m!781653 () Bool)

(assert (=> b!836302 m!781653))

(assert (=> b!836272 d!107559))

(declare-fun b!836318 () Bool)

(declare-fun e!466569 () Bool)

(declare-fun tp!47417 () Bool)

(assert (=> b!836318 (= e!466569 (and tp_is_empty!15249 tp!47417))))

(assert (=> b!836273 (= tp!47408 e!466569)))

(assert (= (and b!836273 ((_ is Cons!15973) (t!22348 l!390))) b!836318))

(check-sat (not b!836296) (not b!836302) (not b!836318) tp_is_empty!15249)
(check-sat)
