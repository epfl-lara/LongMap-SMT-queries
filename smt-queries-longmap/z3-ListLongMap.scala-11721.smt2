; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137176 () Bool)

(assert start!137176)

(declare-fun b!1580530 () Bool)

(declare-fun res!1079747 () Bool)

(declare-fun e!881752 () Bool)

(assert (=> b!1580530 (=> (not res!1079747) (not e!881752))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2668 0))(
  ( (B!2669 (val!19696 Int)) )
))
(declare-datatypes ((tuple2!25520 0))(
  ( (tuple2!25521 (_1!12771 (_ BitVec 64)) (_2!12771 B!2668)) )
))
(declare-datatypes ((List!36816 0))(
  ( (Nil!36813) (Cons!36812 (h!38355 tuple2!25520) (t!51730 List!36816)) )
))
(declare-fun l!1390 () List!36816)

(declare-fun value!194 () B!2668)

(declare-fun contains!10488 (List!36816 tuple2!25520) Bool)

(assert (=> b!1580530 (= res!1079747 (contains!10488 l!1390 (tuple2!25521 key!405 value!194)))))

(declare-fun e!881751 () Bool)

(declare-fun b!1580531 () Bool)

(declare-datatypes ((Option!904 0))(
  ( (Some!903 (v!22404 B!2668)) (None!902) )
))
(declare-fun getValueByKey!815 (List!36816 (_ BitVec 64)) Option!904)

(assert (=> b!1580531 (= e!881751 (not (= (getValueByKey!815 l!1390 key!405) (Some!903 value!194))))))

(declare-fun b!1580532 () Bool)

(declare-fun e!881753 () Bool)

(declare-fun tp_is_empty!39213 () Bool)

(declare-fun tp!114489 () Bool)

(assert (=> b!1580532 (= e!881753 (and tp_is_empty!39213 tp!114489))))

(declare-fun b!1580533 () Bool)

(assert (=> b!1580533 (= e!881752 e!881751)))

(declare-fun res!1079744 () Bool)

(assert (=> b!1580533 (=> (not res!1079744) (not e!881751))))

(declare-datatypes ((tuple2!25522 0))(
  ( (tuple2!25523 (_1!12772 tuple2!25520) (_2!12772 List!36816)) )
))
(declare-datatypes ((Option!905 0))(
  ( (Some!904 (v!22405 tuple2!25522)) (None!903) )
))
(declare-fun lt!676789 () Option!905)

(declare-fun isEmpty!1167 (Option!905) Bool)

(assert (=> b!1580533 (= res!1079744 (not (isEmpty!1167 lt!676789)))))

(declare-fun unapply!83 (List!36816) Option!905)

(assert (=> b!1580533 (= lt!676789 (unapply!83 l!1390))))

(declare-fun res!1079748 () Bool)

(assert (=> start!137176 (=> (not res!1079748) (not e!881752))))

(declare-fun isStrictlySorted!1074 (List!36816) Bool)

(assert (=> start!137176 (= res!1079748 (isStrictlySorted!1074 l!1390))))

(assert (=> start!137176 e!881752))

(assert (=> start!137176 e!881753))

(assert (=> start!137176 true))

(assert (=> start!137176 tp_is_empty!39213))

(declare-fun b!1580534 () Bool)

(declare-fun res!1079745 () Bool)

(assert (=> b!1580534 (=> (not res!1079745) (not e!881751))))

(get-info :version)

(declare-fun get!26794 (Option!905) tuple2!25522)

(assert (=> b!1580534 (= res!1079745 ((_ is Nil!36813) (_2!12772 (get!26794 lt!676789))))))

(declare-fun b!1580535 () Bool)

(declare-fun res!1079746 () Bool)

(assert (=> b!1580535 (=> (not res!1079746) (not e!881752))))

(declare-fun containsKey!920 (List!36816 (_ BitVec 64)) Bool)

(assert (=> b!1580535 (= res!1079746 (containsKey!920 l!1390 key!405))))

(assert (= (and start!137176 res!1079748) b!1580535))

(assert (= (and b!1580535 res!1079746) b!1580530))

(assert (= (and b!1580530 res!1079747) b!1580533))

(assert (= (and b!1580533 res!1079744) b!1580534))

(assert (= (and b!1580534 res!1079745) b!1580531))

(assert (= (and start!137176 ((_ is Cons!36812) l!1390)) b!1580532))

(declare-fun m!1451907 () Bool)

(assert (=> b!1580535 m!1451907))

(declare-fun m!1451909 () Bool)

(assert (=> start!137176 m!1451909))

(declare-fun m!1451911 () Bool)

(assert (=> b!1580531 m!1451911))

(declare-fun m!1451913 () Bool)

(assert (=> b!1580534 m!1451913))

(declare-fun m!1451915 () Bool)

(assert (=> b!1580533 m!1451915))

(declare-fun m!1451917 () Bool)

(assert (=> b!1580533 m!1451917))

(declare-fun m!1451919 () Bool)

(assert (=> b!1580530 m!1451919))

(check-sat tp_is_empty!39213 (not b!1580534) (not b!1580530) (not b!1580533) (not b!1580535) (not b!1580532) (not start!137176) (not b!1580531))
(check-sat)
(get-model)

(declare-fun b!1580574 () Bool)

(declare-fun e!881775 () Option!904)

(assert (=> b!1580574 (= e!881775 (Some!903 (_2!12771 (h!38355 l!1390))))))

(declare-fun b!1580577 () Bool)

(declare-fun e!881776 () Option!904)

(assert (=> b!1580577 (= e!881776 None!902)))

(declare-fun d!166435 () Bool)

(declare-fun c!146541 () Bool)

(assert (=> d!166435 (= c!146541 (and ((_ is Cons!36812) l!1390) (= (_1!12771 (h!38355 l!1390)) key!405)))))

(assert (=> d!166435 (= (getValueByKey!815 l!1390 key!405) e!881775)))

(declare-fun b!1580575 () Bool)

(assert (=> b!1580575 (= e!881775 e!881776)))

(declare-fun c!146542 () Bool)

(assert (=> b!1580575 (= c!146542 (and ((_ is Cons!36812) l!1390) (not (= (_1!12771 (h!38355 l!1390)) key!405))))))

(declare-fun b!1580576 () Bool)

(assert (=> b!1580576 (= e!881776 (getValueByKey!815 (t!51730 l!1390) key!405))))

(assert (= (and d!166435 c!146541) b!1580574))

(assert (= (and d!166435 (not c!146541)) b!1580575))

(assert (= (and b!1580575 c!146542) b!1580576))

(assert (= (and b!1580575 (not c!146542)) b!1580577))

(declare-fun m!1451935 () Bool)

(assert (=> b!1580576 m!1451935))

(assert (=> b!1580531 d!166435))

(declare-fun d!166441 () Bool)

(declare-fun lt!676797 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!834 (List!36816) (InoxSet tuple2!25520))

(assert (=> d!166441 (= lt!676797 (select (content!834 l!1390) (tuple2!25521 key!405 value!194)))))

(declare-fun e!881793 () Bool)

(assert (=> d!166441 (= lt!676797 e!881793)))

(declare-fun res!1079782 () Bool)

(assert (=> d!166441 (=> (not res!1079782) (not e!881793))))

(assert (=> d!166441 (= res!1079782 ((_ is Cons!36812) l!1390))))

(assert (=> d!166441 (= (contains!10488 l!1390 (tuple2!25521 key!405 value!194)) lt!676797)))

(declare-fun b!1580596 () Bool)

(declare-fun e!881794 () Bool)

(assert (=> b!1580596 (= e!881793 e!881794)))

(declare-fun res!1079783 () Bool)

(assert (=> b!1580596 (=> res!1079783 e!881794)))

(assert (=> b!1580596 (= res!1079783 (= (h!38355 l!1390) (tuple2!25521 key!405 value!194)))))

(declare-fun b!1580597 () Bool)

(assert (=> b!1580597 (= e!881794 (contains!10488 (t!51730 l!1390) (tuple2!25521 key!405 value!194)))))

(assert (= (and d!166441 res!1079782) b!1580596))

(assert (= (and b!1580596 (not res!1079783)) b!1580597))

(declare-fun m!1451941 () Bool)

(assert (=> d!166441 m!1451941))

(declare-fun m!1451945 () Bool)

(assert (=> d!166441 m!1451945))

(declare-fun m!1451947 () Bool)

(assert (=> b!1580597 m!1451947))

(assert (=> b!1580530 d!166441))

(declare-fun d!166449 () Bool)

(declare-fun res!1079796 () Bool)

(declare-fun e!881811 () Bool)

(assert (=> d!166449 (=> res!1079796 e!881811)))

(assert (=> d!166449 (= res!1079796 (and ((_ is Cons!36812) l!1390) (= (_1!12771 (h!38355 l!1390)) key!405)))))

(assert (=> d!166449 (= (containsKey!920 l!1390 key!405) e!881811)))

(declare-fun b!1580618 () Bool)

(declare-fun e!881812 () Bool)

(assert (=> b!1580618 (= e!881811 e!881812)))

(declare-fun res!1079797 () Bool)

(assert (=> b!1580618 (=> (not res!1079797) (not e!881812))))

(assert (=> b!1580618 (= res!1079797 (and (or (not ((_ is Cons!36812) l!1390)) (bvsle (_1!12771 (h!38355 l!1390)) key!405)) ((_ is Cons!36812) l!1390) (bvslt (_1!12771 (h!38355 l!1390)) key!405)))))

(declare-fun b!1580619 () Bool)

(assert (=> b!1580619 (= e!881812 (containsKey!920 (t!51730 l!1390) key!405))))

(assert (= (and d!166449 (not res!1079796)) b!1580618))

(assert (= (and b!1580618 res!1079797) b!1580619))

(declare-fun m!1451955 () Bool)

(assert (=> b!1580619 m!1451955))

(assert (=> b!1580535 d!166449))

(declare-fun d!166455 () Bool)

(assert (=> d!166455 (= (get!26794 lt!676789) (v!22405 lt!676789))))

(assert (=> b!1580534 d!166455))

(declare-fun d!166459 () Bool)

(declare-fun res!1079804 () Bool)

(declare-fun e!881821 () Bool)

(assert (=> d!166459 (=> res!1079804 e!881821)))

(assert (=> d!166459 (= res!1079804 (or ((_ is Nil!36813) l!1390) ((_ is Nil!36813) (t!51730 l!1390))))))

(assert (=> d!166459 (= (isStrictlySorted!1074 l!1390) e!881821)))

(declare-fun b!1580630 () Bool)

(declare-fun e!881822 () Bool)

(assert (=> b!1580630 (= e!881821 e!881822)))

(declare-fun res!1079805 () Bool)

(assert (=> b!1580630 (=> (not res!1079805) (not e!881822))))

(assert (=> b!1580630 (= res!1079805 (bvslt (_1!12771 (h!38355 l!1390)) (_1!12771 (h!38355 (t!51730 l!1390)))))))

(declare-fun b!1580631 () Bool)

(assert (=> b!1580631 (= e!881822 (isStrictlySorted!1074 (t!51730 l!1390)))))

(assert (= (and d!166459 (not res!1079804)) b!1580630))

(assert (= (and b!1580630 res!1079805) b!1580631))

(declare-fun m!1451961 () Bool)

(assert (=> b!1580631 m!1451961))

(assert (=> start!137176 d!166459))

(declare-fun d!166471 () Bool)

(assert (=> d!166471 (= (isEmpty!1167 lt!676789) (not ((_ is Some!904) lt!676789)))))

(assert (=> b!1580533 d!166471))

(declare-fun d!166473 () Bool)

(assert (=> d!166473 (= (unapply!83 l!1390) (ite ((_ is Nil!36813) l!1390) None!903 (Some!904 (tuple2!25523 (h!38355 l!1390) (t!51730 l!1390)))))))

(assert (=> b!1580533 d!166473))

(declare-fun b!1580648 () Bool)

(declare-fun e!881837 () Bool)

(declare-fun tp!114495 () Bool)

(assert (=> b!1580648 (= e!881837 (and tp_is_empty!39213 tp!114495))))

(assert (=> b!1580532 (= tp!114489 e!881837)))

(assert (= (and b!1580532 ((_ is Cons!36812) (t!51730 l!1390))) b!1580648))

(check-sat (not b!1580576) (not d!166441) tp_is_empty!39213 (not b!1580631) (not b!1580619) (not b!1580648) (not b!1580597))
(check-sat)
(get-model)

(declare-fun d!166477 () Bool)

(declare-fun c!146553 () Bool)

(assert (=> d!166477 (= c!146553 ((_ is Nil!36813) l!1390))))

(declare-fun e!881846 () (InoxSet tuple2!25520))

(assert (=> d!166477 (= (content!834 l!1390) e!881846)))

(declare-fun b!1580663 () Bool)

(assert (=> b!1580663 (= e!881846 ((as const (Array tuple2!25520 Bool)) false))))

(declare-fun b!1580664 () Bool)

(assert (=> b!1580664 (= e!881846 ((_ map or) (store ((as const (Array tuple2!25520 Bool)) false) (h!38355 l!1390) true) (content!834 (t!51730 l!1390))))))

(assert (= (and d!166477 c!146553) b!1580663))

(assert (= (and d!166477 (not c!146553)) b!1580664))

(declare-fun m!1451971 () Bool)

(assert (=> b!1580664 m!1451971))

(declare-fun m!1451973 () Bool)

(assert (=> b!1580664 m!1451973))

(assert (=> d!166441 d!166477))

(declare-fun lt!676802 () Bool)

(declare-fun d!166479 () Bool)

(assert (=> d!166479 (= lt!676802 (select (content!834 (t!51730 l!1390)) (tuple2!25521 key!405 value!194)))))

(declare-fun e!881847 () Bool)

(assert (=> d!166479 (= lt!676802 e!881847)))

(declare-fun res!1079818 () Bool)

(assert (=> d!166479 (=> (not res!1079818) (not e!881847))))

(assert (=> d!166479 (= res!1079818 ((_ is Cons!36812) (t!51730 l!1390)))))

(assert (=> d!166479 (= (contains!10488 (t!51730 l!1390) (tuple2!25521 key!405 value!194)) lt!676802)))

(declare-fun b!1580665 () Bool)

(declare-fun e!881848 () Bool)

(assert (=> b!1580665 (= e!881847 e!881848)))

(declare-fun res!1079819 () Bool)

(assert (=> b!1580665 (=> res!1079819 e!881848)))

(assert (=> b!1580665 (= res!1079819 (= (h!38355 (t!51730 l!1390)) (tuple2!25521 key!405 value!194)))))

(declare-fun b!1580666 () Bool)

(assert (=> b!1580666 (= e!881848 (contains!10488 (t!51730 (t!51730 l!1390)) (tuple2!25521 key!405 value!194)))))

(assert (= (and d!166479 res!1079818) b!1580665))

(assert (= (and b!1580665 (not res!1079819)) b!1580666))

(assert (=> d!166479 m!1451973))

(declare-fun m!1451975 () Bool)

(assert (=> d!166479 m!1451975))

(declare-fun m!1451977 () Bool)

(assert (=> b!1580666 m!1451977))

(assert (=> b!1580597 d!166479))

(declare-fun d!166481 () Bool)

(declare-fun res!1079820 () Bool)

(declare-fun e!881849 () Bool)

(assert (=> d!166481 (=> res!1079820 e!881849)))

(assert (=> d!166481 (= res!1079820 (and ((_ is Cons!36812) (t!51730 l!1390)) (= (_1!12771 (h!38355 (t!51730 l!1390))) key!405)))))

(assert (=> d!166481 (= (containsKey!920 (t!51730 l!1390) key!405) e!881849)))

(declare-fun b!1580667 () Bool)

(declare-fun e!881850 () Bool)

(assert (=> b!1580667 (= e!881849 e!881850)))

(declare-fun res!1079821 () Bool)

(assert (=> b!1580667 (=> (not res!1079821) (not e!881850))))

(assert (=> b!1580667 (= res!1079821 (and (or (not ((_ is Cons!36812) (t!51730 l!1390))) (bvsle (_1!12771 (h!38355 (t!51730 l!1390))) key!405)) ((_ is Cons!36812) (t!51730 l!1390)) (bvslt (_1!12771 (h!38355 (t!51730 l!1390))) key!405)))))

(declare-fun b!1580668 () Bool)

(assert (=> b!1580668 (= e!881850 (containsKey!920 (t!51730 (t!51730 l!1390)) key!405))))

(assert (= (and d!166481 (not res!1079820)) b!1580667))

(assert (= (and b!1580667 res!1079821) b!1580668))

(declare-fun m!1451979 () Bool)

(assert (=> b!1580668 m!1451979))

(assert (=> b!1580619 d!166481))

(declare-fun d!166483 () Bool)

(declare-fun res!1079822 () Bool)

(declare-fun e!881851 () Bool)

(assert (=> d!166483 (=> res!1079822 e!881851)))

(assert (=> d!166483 (= res!1079822 (or ((_ is Nil!36813) (t!51730 l!1390)) ((_ is Nil!36813) (t!51730 (t!51730 l!1390)))))))

(assert (=> d!166483 (= (isStrictlySorted!1074 (t!51730 l!1390)) e!881851)))

(declare-fun b!1580669 () Bool)

(declare-fun e!881852 () Bool)

(assert (=> b!1580669 (= e!881851 e!881852)))

(declare-fun res!1079823 () Bool)

(assert (=> b!1580669 (=> (not res!1079823) (not e!881852))))

(assert (=> b!1580669 (= res!1079823 (bvslt (_1!12771 (h!38355 (t!51730 l!1390))) (_1!12771 (h!38355 (t!51730 (t!51730 l!1390))))))))

(declare-fun b!1580670 () Bool)

(assert (=> b!1580670 (= e!881852 (isStrictlySorted!1074 (t!51730 (t!51730 l!1390))))))

(assert (= (and d!166483 (not res!1079822)) b!1580669))

(assert (= (and b!1580669 res!1079823) b!1580670))

(declare-fun m!1451981 () Bool)

(assert (=> b!1580670 m!1451981))

(assert (=> b!1580631 d!166483))

(declare-fun b!1580671 () Bool)

(declare-fun e!881853 () Option!904)

(assert (=> b!1580671 (= e!881853 (Some!903 (_2!12771 (h!38355 (t!51730 l!1390)))))))

(declare-fun b!1580674 () Bool)

(declare-fun e!881854 () Option!904)

(assert (=> b!1580674 (= e!881854 None!902)))

(declare-fun d!166485 () Bool)

(declare-fun c!146554 () Bool)

(assert (=> d!166485 (= c!146554 (and ((_ is Cons!36812) (t!51730 l!1390)) (= (_1!12771 (h!38355 (t!51730 l!1390))) key!405)))))

(assert (=> d!166485 (= (getValueByKey!815 (t!51730 l!1390) key!405) e!881853)))

(declare-fun b!1580672 () Bool)

(assert (=> b!1580672 (= e!881853 e!881854)))

(declare-fun c!146555 () Bool)

(assert (=> b!1580672 (= c!146555 (and ((_ is Cons!36812) (t!51730 l!1390)) (not (= (_1!12771 (h!38355 (t!51730 l!1390))) key!405))))))

(declare-fun b!1580673 () Bool)

(assert (=> b!1580673 (= e!881854 (getValueByKey!815 (t!51730 (t!51730 l!1390)) key!405))))

(assert (= (and d!166485 c!146554) b!1580671))

(assert (= (and d!166485 (not c!146554)) b!1580672))

(assert (= (and b!1580672 c!146555) b!1580673))

(assert (= (and b!1580672 (not c!146555)) b!1580674))

(declare-fun m!1451983 () Bool)

(assert (=> b!1580673 m!1451983))

(assert (=> b!1580576 d!166485))

(declare-fun b!1580675 () Bool)

(declare-fun e!881855 () Bool)

(declare-fun tp!114502 () Bool)

(assert (=> b!1580675 (= e!881855 (and tp_is_empty!39213 tp!114502))))

(assert (=> b!1580648 (= tp!114495 e!881855)))

(assert (= (and b!1580648 ((_ is Cons!36812) (t!51730 (t!51730 l!1390)))) b!1580675))

(check-sat tp_is_empty!39213 (not d!166479) (not b!1580664) (not b!1580670) (not b!1580675) (not b!1580666) (not b!1580673) (not b!1580668))
(check-sat)
