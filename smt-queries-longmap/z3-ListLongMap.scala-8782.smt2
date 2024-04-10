; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106806 () Bool)

(assert start!106806)

(declare-fun b!1267529 () Bool)

(declare-fun e!722090 () Bool)

(declare-fun tp_is_empty!32607 () Bool)

(declare-fun tp!96626 () Bool)

(assert (=> b!1267529 (= e!722090 (and tp_is_empty!32607 tp!96626))))

(declare-fun b!1267530 () Bool)

(declare-fun res!843765 () Bool)

(declare-fun e!722089 () Bool)

(assert (=> b!1267530 (=> (not res!843765) (not e!722089))))

(declare-datatypes ((B!2086 0))(
  ( (B!2087 (val!16378 Int)) )
))
(declare-datatypes ((tuple2!21274 0))(
  ( (tuple2!21275 (_1!10648 (_ BitVec 64)) (_2!10648 B!2086)) )
))
(declare-datatypes ((List!28370 0))(
  ( (Nil!28367) (Cons!28366 (h!29575 tuple2!21274) (t!41897 List!28370)) )
))
(declare-fun l!874 () List!28370)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!686 (List!28370 (_ BitVec 64)) Bool)

(assert (=> b!1267530 (= res!843765 (not (containsKey!686 l!874 key!235)))))

(declare-fun b!1267531 () Bool)

(declare-fun ListPrimitiveSize!161 (List!28370) Int)

(assert (=> b!1267531 (= e!722089 (>= (ListPrimitiveSize!161 (t!41897 l!874)) (ListPrimitiveSize!161 l!874)))))

(declare-fun res!843762 () Bool)

(assert (=> start!106806 (=> (not res!843762) (not e!722089))))

(declare-fun isStrictlySorted!827 (List!28370) Bool)

(assert (=> start!106806 (= res!843762 (isStrictlySorted!827 l!874))))

(assert (=> start!106806 e!722089))

(assert (=> start!106806 e!722090))

(assert (=> start!106806 true))

(declare-fun b!1267532 () Bool)

(declare-fun res!843766 () Bool)

(assert (=> b!1267532 (=> (not res!843766) (not e!722089))))

(assert (=> b!1267532 (= res!843766 (isStrictlySorted!827 (t!41897 l!874)))))

(declare-fun b!1267533 () Bool)

(declare-fun res!843764 () Bool)

(assert (=> b!1267533 (=> (not res!843764) (not e!722089))))

(assert (=> b!1267533 (= res!843764 (not (containsKey!686 (t!41897 l!874) key!235)))))

(declare-fun b!1267534 () Bool)

(declare-fun res!843763 () Bool)

(assert (=> b!1267534 (=> (not res!843763) (not e!722089))))

(get-info :version)

(assert (=> b!1267534 (= res!843763 ((_ is Cons!28366) l!874))))

(assert (= (and start!106806 res!843762) b!1267530))

(assert (= (and b!1267530 res!843765) b!1267534))

(assert (= (and b!1267534 res!843763) b!1267532))

(assert (= (and b!1267532 res!843766) b!1267533))

(assert (= (and b!1267533 res!843764) b!1267531))

(assert (= (and start!106806 ((_ is Cons!28366) l!874)) b!1267529))

(declare-fun m!1166769 () Bool)

(assert (=> b!1267531 m!1166769))

(declare-fun m!1166771 () Bool)

(assert (=> b!1267531 m!1166771))

(declare-fun m!1166773 () Bool)

(assert (=> b!1267532 m!1166773))

(declare-fun m!1166775 () Bool)

(assert (=> b!1267533 m!1166775))

(declare-fun m!1166777 () Bool)

(assert (=> start!106806 m!1166777))

(declare-fun m!1166779 () Bool)

(assert (=> b!1267530 m!1166779))

(check-sat (not b!1267530) (not start!106806) (not b!1267529) (not b!1267532) (not b!1267531) (not b!1267533) tp_is_empty!32607)
(check-sat)
(get-model)

(declare-fun d!139491 () Bool)

(declare-fun lt!574332 () Int)

(assert (=> d!139491 (>= lt!574332 0)))

(declare-fun e!722113 () Int)

(assert (=> d!139491 (= lt!574332 e!722113)))

(declare-fun c!123565 () Bool)

(assert (=> d!139491 (= c!123565 ((_ is Nil!28367) (t!41897 l!874)))))

(assert (=> d!139491 (= (ListPrimitiveSize!161 (t!41897 l!874)) lt!574332)))

(declare-fun b!1267571 () Bool)

(assert (=> b!1267571 (= e!722113 0)))

(declare-fun b!1267572 () Bool)

(assert (=> b!1267572 (= e!722113 (+ 1 (ListPrimitiveSize!161 (t!41897 (t!41897 l!874)))))))

(assert (= (and d!139491 c!123565) b!1267571))

(assert (= (and d!139491 (not c!123565)) b!1267572))

(declare-fun m!1166795 () Bool)

(assert (=> b!1267572 m!1166795))

(assert (=> b!1267531 d!139491))

(declare-fun d!139497 () Bool)

(declare-fun lt!574333 () Int)

(assert (=> d!139497 (>= lt!574333 0)))

(declare-fun e!722114 () Int)

(assert (=> d!139497 (= lt!574333 e!722114)))

(declare-fun c!123566 () Bool)

(assert (=> d!139497 (= c!123566 ((_ is Nil!28367) l!874))))

(assert (=> d!139497 (= (ListPrimitiveSize!161 l!874) lt!574333)))

(declare-fun b!1267573 () Bool)

(assert (=> b!1267573 (= e!722114 0)))

(declare-fun b!1267574 () Bool)

(assert (=> b!1267574 (= e!722114 (+ 1 (ListPrimitiveSize!161 (t!41897 l!874))))))

(assert (= (and d!139497 c!123566) b!1267573))

(assert (= (and d!139497 (not c!123566)) b!1267574))

(assert (=> b!1267574 m!1166769))

(assert (=> b!1267531 d!139497))

(declare-fun d!139501 () Bool)

(declare-fun res!843818 () Bool)

(declare-fun e!722151 () Bool)

(assert (=> d!139501 (=> res!843818 e!722151)))

(assert (=> d!139501 (= res!843818 (and ((_ is Cons!28366) l!874) (= (_1!10648 (h!29575 l!874)) key!235)))))

(assert (=> d!139501 (= (containsKey!686 l!874 key!235) e!722151)))

(declare-fun b!1267623 () Bool)

(declare-fun e!722152 () Bool)

(assert (=> b!1267623 (= e!722151 e!722152)))

(declare-fun res!843819 () Bool)

(assert (=> b!1267623 (=> (not res!843819) (not e!722152))))

(assert (=> b!1267623 (= res!843819 (and (or (not ((_ is Cons!28366) l!874)) (bvsle (_1!10648 (h!29575 l!874)) key!235)) ((_ is Cons!28366) l!874) (bvslt (_1!10648 (h!29575 l!874)) key!235)))))

(declare-fun b!1267624 () Bool)

(assert (=> b!1267624 (= e!722152 (containsKey!686 (t!41897 l!874) key!235))))

(assert (= (and d!139501 (not res!843818)) b!1267623))

(assert (= (and b!1267623 res!843819) b!1267624))

(assert (=> b!1267624 m!1166775))

(assert (=> b!1267530 d!139501))

(declare-fun d!139517 () Bool)

(declare-fun res!843820 () Bool)

(declare-fun e!722153 () Bool)

(assert (=> d!139517 (=> res!843820 e!722153)))

(assert (=> d!139517 (= res!843820 (and ((_ is Cons!28366) (t!41897 l!874)) (= (_1!10648 (h!29575 (t!41897 l!874))) key!235)))))

(assert (=> d!139517 (= (containsKey!686 (t!41897 l!874) key!235) e!722153)))

(declare-fun b!1267625 () Bool)

(declare-fun e!722154 () Bool)

(assert (=> b!1267625 (= e!722153 e!722154)))

(declare-fun res!843821 () Bool)

(assert (=> b!1267625 (=> (not res!843821) (not e!722154))))

(assert (=> b!1267625 (= res!843821 (and (or (not ((_ is Cons!28366) (t!41897 l!874))) (bvsle (_1!10648 (h!29575 (t!41897 l!874))) key!235)) ((_ is Cons!28366) (t!41897 l!874)) (bvslt (_1!10648 (h!29575 (t!41897 l!874))) key!235)))))

(declare-fun b!1267626 () Bool)

(assert (=> b!1267626 (= e!722154 (containsKey!686 (t!41897 (t!41897 l!874)) key!235))))

(assert (= (and d!139517 (not res!843820)) b!1267625))

(assert (= (and b!1267625 res!843821) b!1267626))

(declare-fun m!1166807 () Bool)

(assert (=> b!1267626 m!1166807))

(assert (=> b!1267533 d!139517))

(declare-fun d!139519 () Bool)

(declare-fun res!843826 () Bool)

(declare-fun e!722159 () Bool)

(assert (=> d!139519 (=> res!843826 e!722159)))

(assert (=> d!139519 (= res!843826 (or ((_ is Nil!28367) l!874) ((_ is Nil!28367) (t!41897 l!874))))))

(assert (=> d!139519 (= (isStrictlySorted!827 l!874) e!722159)))

(declare-fun b!1267631 () Bool)

(declare-fun e!722160 () Bool)

(assert (=> b!1267631 (= e!722159 e!722160)))

(declare-fun res!843827 () Bool)

(assert (=> b!1267631 (=> (not res!843827) (not e!722160))))

(assert (=> b!1267631 (= res!843827 (bvslt (_1!10648 (h!29575 l!874)) (_1!10648 (h!29575 (t!41897 l!874)))))))

(declare-fun b!1267632 () Bool)

(assert (=> b!1267632 (= e!722160 (isStrictlySorted!827 (t!41897 l!874)))))

(assert (= (and d!139519 (not res!843826)) b!1267631))

(assert (= (and b!1267631 res!843827) b!1267632))

(assert (=> b!1267632 m!1166773))

(assert (=> start!106806 d!139519))

(declare-fun d!139521 () Bool)

(declare-fun res!843828 () Bool)

(declare-fun e!722161 () Bool)

(assert (=> d!139521 (=> res!843828 e!722161)))

(assert (=> d!139521 (= res!843828 (or ((_ is Nil!28367) (t!41897 l!874)) ((_ is Nil!28367) (t!41897 (t!41897 l!874)))))))

(assert (=> d!139521 (= (isStrictlySorted!827 (t!41897 l!874)) e!722161)))

(declare-fun b!1267633 () Bool)

(declare-fun e!722162 () Bool)

(assert (=> b!1267633 (= e!722161 e!722162)))

(declare-fun res!843829 () Bool)

(assert (=> b!1267633 (=> (not res!843829) (not e!722162))))

(assert (=> b!1267633 (= res!843829 (bvslt (_1!10648 (h!29575 (t!41897 l!874))) (_1!10648 (h!29575 (t!41897 (t!41897 l!874))))))))

(declare-fun b!1267634 () Bool)

(assert (=> b!1267634 (= e!722162 (isStrictlySorted!827 (t!41897 (t!41897 l!874))))))

(assert (= (and d!139521 (not res!843828)) b!1267633))

(assert (= (and b!1267633 res!843829) b!1267634))

(declare-fun m!1166809 () Bool)

(assert (=> b!1267634 m!1166809))

(assert (=> b!1267532 d!139521))

(declare-fun b!1267639 () Bool)

(declare-fun e!722165 () Bool)

(declare-fun tp!96638 () Bool)

(assert (=> b!1267639 (= e!722165 (and tp_is_empty!32607 tp!96638))))

(assert (=> b!1267529 (= tp!96626 e!722165)))

(assert (= (and b!1267529 ((_ is Cons!28366) (t!41897 l!874))) b!1267639))

(check-sat (not b!1267632) (not b!1267574) (not b!1267572) (not b!1267634) (not b!1267626) tp_is_empty!32607 (not b!1267639) (not b!1267624))
(check-sat)
