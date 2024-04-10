; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2192 () Bool)

(assert start!2192)

(declare-fun b!14745 () Bool)

(assert (=> b!14745 true))

(declare-fun res!11335 () Bool)

(declare-fun e!8856 () Bool)

(assert (=> b!14745 (=> res!11335 e!8856)))

(declare-fun lambda!179 () Int)

(declare-datatypes ((B!556 0))(
  ( (B!557 (val!376 Int)) )
))
(declare-datatypes ((tuple2!552 0))(
  ( (tuple2!553 (_1!276 (_ BitVec 64)) (_2!276 B!556)) )
))
(declare-datatypes ((List!431 0))(
  ( (Nil!428) (Cons!427 (h!993 tuple2!552) (t!2833 List!431)) )
))
(declare-fun forall!99 (List!431 Int) Bool)

(assert (=> b!14745 (= res!11335 (not (forall!99 Nil!428 lambda!179)))))

(declare-fun res!11333 () Bool)

(declare-fun e!8858 () Bool)

(assert (=> start!2192 (=> (not res!11333) (not e!8858))))

(declare-fun l!522 () List!431)

(declare-fun isStrictlySorted!118 (List!431) Bool)

(assert (=> start!2192 (= res!11333 (isStrictlySorted!118 l!522))))

(assert (=> start!2192 e!8858))

(declare-fun e!8854 () Bool)

(assert (=> start!2192 e!8854))

(declare-fun tp_is_empty!735 () Bool)

(assert (=> start!2192 tp_is_empty!735))

(declare-fun b!14746 () Bool)

(declare-fun e!8855 () Bool)

(declare-fun e!8857 () Bool)

(assert (=> b!14746 (= e!8855 e!8857)))

(declare-fun res!11331 () Bool)

(assert (=> b!14746 (= res!11331 false)))

(assert (=> b!14746 (=> (not res!11331) (not e!8857))))

(declare-fun b!14747 () Bool)

(declare-fun tp!2366 () Bool)

(assert (=> b!14747 (= e!8854 (and tp_is_empty!735 tp!2366))))

(declare-fun b!14748 () Bool)

(assert (=> b!14748 (= e!8856 e!8855)))

(declare-fun c!1397 () Bool)

(declare-fun isEmpty!106 (List!431) Bool)

(assert (=> b!14748 (= c!1397 (isEmpty!106 l!522))))

(declare-fun b!14749 () Bool)

(declare-fun head!795 (List!431) tuple2!552)

(assert (=> b!14749 (= e!8857 (bvslt (_1!276 (head!795 Nil!428)) (_1!276 (head!795 l!522))))))

(declare-fun b!14750 () Bool)

(declare-fun res!11332 () Bool)

(assert (=> b!14750 (=> (not res!11332) (not e!8858))))

(declare-fun value!159 () B!556)

(get-info :version)

(assert (=> b!14750 (= res!11332 (and (or (not ((_ is Cons!427) l!522)) (not (= (_2!276 (h!993 l!522)) value!159))) (or (not ((_ is Cons!427) l!522)) (= (_2!276 (h!993 l!522)) value!159)) ((_ is Nil!428) l!522)))))

(declare-fun b!14751 () Bool)

(assert (=> b!14751 (= e!8858 e!8856)))

(declare-fun res!11334 () Bool)

(assert (=> b!14751 (=> res!11334 e!8856)))

(assert (=> b!14751 (= res!11334 false)))

(declare-fun b!14752 () Bool)

(assert (=> b!14752 (= e!8855 false)))

(assert (= (and start!2192 res!11333) b!14750))

(assert (= (and b!14750 res!11332) b!14751))

(assert (= (and b!14751 (not res!11334)) b!14745))

(assert (= (and b!14745 (not res!11335)) b!14748))

(assert (= (and b!14748 c!1397) b!14752))

(assert (= (and b!14748 (not c!1397)) b!14746))

(assert (= (and b!14746 res!11331) b!14749))

(assert (= (and start!2192 ((_ is Cons!427) l!522)) b!14747))

(declare-fun m!9861 () Bool)

(assert (=> b!14745 m!9861))

(declare-fun m!9863 () Bool)

(assert (=> start!2192 m!9863))

(declare-fun m!9865 () Bool)

(assert (=> b!14748 m!9865))

(declare-fun m!9867 () Bool)

(assert (=> b!14749 m!9867))

(declare-fun m!9869 () Bool)

(assert (=> b!14749 m!9869))

(check-sat (not b!14749) (not start!2192) (not b!14748) tp_is_empty!735 (not b!14745) (not b!14747))
(check-sat)
(get-model)

(declare-fun d!2419 () Bool)

(assert (not d!2419))

(assert (=> b!14749 d!2419))

(declare-fun d!2421 () Bool)

(assert (=> d!2421 (= (head!795 l!522) (h!993 l!522))))

(assert (=> b!14749 d!2421))

(declare-fun d!2423 () Bool)

(assert (=> d!2423 (= (isEmpty!106 l!522) ((_ is Nil!428) l!522))))

(assert (=> b!14748 d!2423))

(declare-fun d!2425 () Bool)

(declare-fun res!11379 () Bool)

(declare-fun e!8908 () Bool)

(assert (=> d!2425 (=> res!11379 e!8908)))

(assert (=> d!2425 (= res!11379 (or ((_ is Nil!428) l!522) ((_ is Nil!428) (t!2833 l!522))))))

(assert (=> d!2425 (= (isStrictlySorted!118 l!522) e!8908)))

(declare-fun b!14819 () Bool)

(declare-fun e!8909 () Bool)

(assert (=> b!14819 (= e!8908 e!8909)))

(declare-fun res!11380 () Bool)

(assert (=> b!14819 (=> (not res!11380) (not e!8909))))

(assert (=> b!14819 (= res!11380 (bvslt (_1!276 (h!993 l!522)) (_1!276 (h!993 (t!2833 l!522)))))))

(declare-fun b!14820 () Bool)

(assert (=> b!14820 (= e!8909 (isStrictlySorted!118 (t!2833 l!522)))))

(assert (= (and d!2425 (not res!11379)) b!14819))

(assert (= (and b!14819 res!11380) b!14820))

(declare-fun m!9893 () Bool)

(assert (=> b!14820 m!9893))

(assert (=> start!2192 d!2425))

(declare-fun d!2427 () Bool)

(declare-fun res!11385 () Bool)

(declare-fun e!8914 () Bool)

(assert (=> d!2427 (=> res!11385 e!8914)))

