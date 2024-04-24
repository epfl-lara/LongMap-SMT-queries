; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137804 () Bool)

(assert start!137804)

(declare-fun b!1583754 () Bool)

(declare-fun e!883847 () Bool)

(declare-datatypes ((B!2690 0))(
  ( (B!2691 (val!19707 Int)) )
))
(declare-datatypes ((tuple2!25624 0))(
  ( (tuple2!25625 (_1!12823 (_ BitVec 64)) (_2!12823 B!2690)) )
))
(declare-datatypes ((List!36859 0))(
  ( (Nil!36856) (Cons!36855 (h!38416 tuple2!25624) (t!51765 List!36859)) )
))
(declare-datatypes ((tuple2!25626 0))(
  ( (tuple2!25627 (_1!12824 tuple2!25624) (_2!12824 List!36859)) )
))
(declare-datatypes ((Option!915 0))(
  ( (Some!914 (v!22424 tuple2!25626)) (None!913) )
))
(declare-fun lt!677814 () Option!915)

(get-info :version)

(declare-fun get!26857 (Option!915) tuple2!25626)

(assert (=> b!1583754 (= e!883847 (not ((_ is Nil!36856) (_2!12824 (get!26857 lt!677814)))))))

(declare-fun b!1583755 () Bool)

(declare-fun res!1081201 () Bool)

(declare-fun e!883846 () Bool)

(assert (=> b!1583755 (=> (not res!1081201) (not e!883846))))

(declare-fun l!1390 () List!36859)

(declare-fun lt!677813 () tuple2!25624)

(declare-fun contains!10544 (List!36859 tuple2!25624) Bool)

(assert (=> b!1583755 (= res!1081201 (contains!10544 (t!51765 l!1390) lt!677813))))

(declare-fun b!1583756 () Bool)

(declare-fun e!883844 () Bool)

(declare-fun tp_is_empty!39235 () Bool)

(declare-fun tp!114561 () Bool)

(assert (=> b!1583756 (= e!883844 (and tp_is_empty!39235 tp!114561))))

(declare-fun b!1583758 () Bool)

(declare-fun res!1081195 () Bool)

(declare-fun e!883845 () Bool)

(assert (=> b!1583758 (=> (not res!1081195) (not e!883845))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!932 (List!36859 (_ BitVec 64)) Bool)

(assert (=> b!1583758 (= res!1081195 (containsKey!932 l!1390 key!405))))

(declare-fun b!1583759 () Bool)

(declare-fun ListPrimitiveSize!196 (List!36859) Int)

(assert (=> b!1583759 (= e!883846 (>= (ListPrimitiveSize!196 (t!51765 l!1390)) (ListPrimitiveSize!196 l!1390)))))

(declare-fun b!1583760 () Bool)

(declare-fun e!883843 () Bool)

(assert (=> b!1583760 (= e!883845 e!883843)))

(declare-fun res!1081200 () Bool)

(assert (=> b!1583760 (=> (not res!1081200) (not e!883843))))

(assert (=> b!1583760 (= res!1081200 (contains!10544 l!1390 lt!677813))))

(declare-fun value!194 () B!2690)

(assert (=> b!1583760 (= lt!677813 (tuple2!25625 key!405 value!194))))

(declare-fun b!1583761 () Bool)

(declare-fun res!1081196 () Bool)

(assert (=> b!1583761 (=> (not res!1081196) (not e!883846))))

(declare-fun isStrictlySorted!1073 (List!36859) Bool)

(assert (=> b!1583761 (= res!1081196 (isStrictlySorted!1073 (t!51765 l!1390)))))

(declare-fun b!1583762 () Bool)

(declare-fun res!1081199 () Bool)

(assert (=> b!1583762 (=> (not res!1081199) (not e!883846))))

(assert (=> b!1583762 (= res!1081199 (containsKey!932 (t!51765 l!1390) key!405))))

(declare-fun b!1583763 () Bool)

(assert (=> b!1583763 (= e!883843 e!883846)))

(declare-fun res!1081197 () Bool)

(assert (=> b!1583763 (=> (not res!1081197) (not e!883846))))

(assert (=> b!1583763 (= res!1081197 e!883847)))

(declare-fun res!1081198 () Bool)

(assert (=> b!1583763 (=> res!1081198 e!883847)))

(declare-fun isEmpty!1181 (Option!915) Bool)

(assert (=> b!1583763 (= res!1081198 (isEmpty!1181 lt!677814))))

(declare-fun unapply!94 (List!36859) Option!915)

(assert (=> b!1583763 (= lt!677814 (unapply!94 l!1390))))

(declare-fun b!1583757 () Bool)

(declare-fun res!1081194 () Bool)

(assert (=> b!1583757 (=> (not res!1081194) (not e!883846))))

(assert (=> b!1583757 (= res!1081194 (and (or (not ((_ is Cons!36855) l!1390)) (not (= (_1!12823 (h!38416 l!1390)) key!405))) ((_ is Cons!36855) l!1390)))))

(declare-fun res!1081202 () Bool)

(assert (=> start!137804 (=> (not res!1081202) (not e!883845))))

(assert (=> start!137804 (= res!1081202 (isStrictlySorted!1073 l!1390))))

(assert (=> start!137804 e!883845))

(assert (=> start!137804 e!883844))

(assert (=> start!137804 true))

(assert (=> start!137804 tp_is_empty!39235))

(assert (= (and start!137804 res!1081202) b!1583758))

(assert (= (and b!1583758 res!1081195) b!1583760))

(assert (= (and b!1583760 res!1081200) b!1583763))

(assert (= (and b!1583763 (not res!1081198)) b!1583754))

(assert (= (and b!1583763 res!1081197) b!1583757))

(assert (= (and b!1583757 res!1081194) b!1583761))

(assert (= (and b!1583761 res!1081196) b!1583762))

(assert (= (and b!1583762 res!1081199) b!1583755))

(assert (= (and b!1583755 res!1081201) b!1583759))

(assert (= (and start!137804 ((_ is Cons!36855) l!1390)) b!1583756))

(declare-fun m!1454625 () Bool)

(assert (=> b!1583758 m!1454625))

(declare-fun m!1454627 () Bool)

(assert (=> b!1583754 m!1454627))

(declare-fun m!1454629 () Bool)

(assert (=> b!1583760 m!1454629))

(declare-fun m!1454631 () Bool)

(assert (=> b!1583762 m!1454631))

(declare-fun m!1454633 () Bool)

(assert (=> start!137804 m!1454633))

(declare-fun m!1454635 () Bool)

(assert (=> b!1583761 m!1454635))

(declare-fun m!1454637 () Bool)

(assert (=> b!1583759 m!1454637))

(declare-fun m!1454639 () Bool)

(assert (=> b!1583759 m!1454639))

(declare-fun m!1454641 () Bool)

(assert (=> b!1583755 m!1454641))

(declare-fun m!1454643 () Bool)

(assert (=> b!1583763 m!1454643))

(declare-fun m!1454645 () Bool)

(assert (=> b!1583763 m!1454645))

(check-sat (not b!1583762) (not b!1583761) tp_is_empty!39235 (not b!1583758) (not b!1583756) (not b!1583760) (not b!1583754) (not b!1583763) (not b!1583759) (not start!137804) (not b!1583755))
(check-sat)
(get-model)

(declare-fun d!167403 () Bool)

(assert (=> d!167403 (= (get!26857 lt!677814) (v!22424 lt!677814))))

(assert (=> b!1583754 d!167403))

(declare-fun d!167405 () Bool)

(declare-fun res!1081261 () Bool)

(declare-fun e!883884 () Bool)

(assert (=> d!167405 (=> res!1081261 e!883884)))

(assert (=> d!167405 (= res!1081261 (or ((_ is Nil!36856) l!1390) ((_ is Nil!36856) (t!51765 l!1390))))))

(assert (=> d!167405 (= (isStrictlySorted!1073 l!1390) e!883884)))

(declare-fun b!1583832 () Bool)

(declare-fun e!883885 () Bool)

(assert (=> b!1583832 (= e!883884 e!883885)))

(declare-fun res!1081262 () Bool)

(assert (=> b!1583832 (=> (not res!1081262) (not e!883885))))

(assert (=> b!1583832 (= res!1081262 (bvslt (_1!12823 (h!38416 l!1390)) (_1!12823 (h!38416 (t!51765 l!1390)))))))

(declare-fun b!1583833 () Bool)

(assert (=> b!1583833 (= e!883885 (isStrictlySorted!1073 (t!51765 l!1390)))))

(assert (= (and d!167405 (not res!1081261)) b!1583832))

(assert (= (and b!1583832 res!1081262) b!1583833))

(assert (=> b!1583833 m!1454635))

(assert (=> start!137804 d!167405))

(declare-fun d!167411 () Bool)

(declare-fun lt!677833 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!832 (List!36859) (InoxSet tuple2!25624))

(assert (=> d!167411 (= lt!677833 (select (content!832 l!1390) lt!677813))))

(declare-fun e!883902 () Bool)

(assert (=> d!167411 (= lt!677833 e!883902)))

(declare-fun res!1081278 () Bool)

(assert (=> d!167411 (=> (not res!1081278) (not e!883902))))

(assert (=> d!167411 (= res!1081278 ((_ is Cons!36855) l!1390))))

(assert (=> d!167411 (= (contains!10544 l!1390 lt!677813) lt!677833)))

(declare-fun b!1583852 () Bool)

(declare-fun e!883903 () Bool)

(assert (=> b!1583852 (= e!883902 e!883903)))

(declare-fun res!1081277 () Bool)

(assert (=> b!1583852 (=> res!1081277 e!883903)))

(assert (=> b!1583852 (= res!1081277 (= (h!38416 l!1390) lt!677813))))

(declare-fun b!1583853 () Bool)

(assert (=> b!1583853 (= e!883903 (contains!10544 (t!51765 l!1390) lt!677813))))

(assert (= (and d!167411 res!1081278) b!1583852))

(assert (= (and b!1583852 (not res!1081277)) b!1583853))

(declare-fun m!1454693 () Bool)

(assert (=> d!167411 m!1454693))

(declare-fun m!1454695 () Bool)

(assert (=> d!167411 m!1454695))

(assert (=> b!1583853 m!1454641))

(assert (=> b!1583760 d!167411))

(declare-fun d!167421 () Bool)

(declare-fun lt!677834 () Bool)

(assert (=> d!167421 (= lt!677834 (select (content!832 (t!51765 l!1390)) lt!677813))))

(declare-fun e!883904 () Bool)

(assert (=> d!167421 (= lt!677834 e!883904)))

(declare-fun res!1081280 () Bool)

(assert (=> d!167421 (=> (not res!1081280) (not e!883904))))

(assert (=> d!167421 (= res!1081280 ((_ is Cons!36855) (t!51765 l!1390)))))

(assert (=> d!167421 (= (contains!10544 (t!51765 l!1390) lt!677813) lt!677834)))

(declare-fun b!1583854 () Bool)

(declare-fun e!883905 () Bool)

(assert (=> b!1583854 (= e!883904 e!883905)))

(declare-fun res!1081279 () Bool)

(assert (=> b!1583854 (=> res!1081279 e!883905)))

(assert (=> b!1583854 (= res!1081279 (= (h!38416 (t!51765 l!1390)) lt!677813))))

(declare-fun b!1583855 () Bool)

(assert (=> b!1583855 (= e!883905 (contains!10544 (t!51765 (t!51765 l!1390)) lt!677813))))

(assert (= (and d!167421 res!1081280) b!1583854))

(assert (= (and b!1583854 (not res!1081279)) b!1583855))

(declare-fun m!1454697 () Bool)

(assert (=> d!167421 m!1454697))

(declare-fun m!1454699 () Bool)

(assert (=> d!167421 m!1454699))

(declare-fun m!1454701 () Bool)

(assert (=> b!1583855 m!1454701))

(assert (=> b!1583755 d!167421))

(declare-fun d!167425 () Bool)

(declare-fun res!1081283 () Bool)

(declare-fun e!883908 () Bool)

(assert (=> d!167425 (=> res!1081283 e!883908)))

(assert (=> d!167425 (= res!1081283 (or ((_ is Nil!36856) (t!51765 l!1390)) ((_ is Nil!36856) (t!51765 (t!51765 l!1390)))))))

(assert (=> d!167425 (= (isStrictlySorted!1073 (t!51765 l!1390)) e!883908)))

(declare-fun b!1583858 () Bool)

(declare-fun e!883909 () Bool)

(assert (=> b!1583858 (= e!883908 e!883909)))

(declare-fun res!1081284 () Bool)

(assert (=> b!1583858 (=> (not res!1081284) (not e!883909))))

(assert (=> b!1583858 (= res!1081284 (bvslt (_1!12823 (h!38416 (t!51765 l!1390))) (_1!12823 (h!38416 (t!51765 (t!51765 l!1390))))))))

(declare-fun b!1583859 () Bool)

(assert (=> b!1583859 (= e!883909 (isStrictlySorted!1073 (t!51765 (t!51765 l!1390))))))

(assert (= (and d!167425 (not res!1081283)) b!1583858))

(assert (= (and b!1583858 res!1081284) b!1583859))

(declare-fun m!1454703 () Bool)

(assert (=> b!1583859 m!1454703))

(assert (=> b!1583761 d!167425))

(declare-fun d!167427 () Bool)

(declare-fun res!1081295 () Bool)

(declare-fun e!883920 () Bool)

(assert (=> d!167427 (=> res!1081295 e!883920)))

(assert (=> d!167427 (= res!1081295 (and ((_ is Cons!36855) (t!51765 l!1390)) (= (_1!12823 (h!38416 (t!51765 l!1390))) key!405)))))

(assert (=> d!167427 (= (containsKey!932 (t!51765 l!1390) key!405) e!883920)))

(declare-fun b!1583870 () Bool)

(declare-fun e!883921 () Bool)

(assert (=> b!1583870 (= e!883920 e!883921)))

(declare-fun res!1081296 () Bool)

(assert (=> b!1583870 (=> (not res!1081296) (not e!883921))))

(assert (=> b!1583870 (= res!1081296 (and (or (not ((_ is Cons!36855) (t!51765 l!1390))) (bvsle (_1!12823 (h!38416 (t!51765 l!1390))) key!405)) ((_ is Cons!36855) (t!51765 l!1390)) (bvslt (_1!12823 (h!38416 (t!51765 l!1390))) key!405)))))

(declare-fun b!1583871 () Bool)

(assert (=> b!1583871 (= e!883921 (containsKey!932 (t!51765 (t!51765 l!1390)) key!405))))

(assert (= (and d!167427 (not res!1081295)) b!1583870))

(assert (= (and b!1583870 res!1081296) b!1583871))

(declare-fun m!1454705 () Bool)

(assert (=> b!1583871 m!1454705))

(assert (=> b!1583762 d!167427))

(declare-fun d!167437 () Bool)

(assert (=> d!167437 (= (isEmpty!1181 lt!677814) (not ((_ is Some!914) lt!677814)))))

(assert (=> b!1583763 d!167437))

(declare-fun d!167443 () Bool)

(assert (=> d!167443 (= (unapply!94 l!1390) (ite ((_ is Nil!36856) l!1390) None!913 (Some!914 (tuple2!25627 (h!38416 l!1390) (t!51765 l!1390)))))))

(assert (=> b!1583763 d!167443))

(declare-fun d!167447 () Bool)

(declare-fun res!1081307 () Bool)

(declare-fun e!883934 () Bool)

(assert (=> d!167447 (=> res!1081307 e!883934)))

(assert (=> d!167447 (= res!1081307 (and ((_ is Cons!36855) l!1390) (= (_1!12823 (h!38416 l!1390)) key!405)))))

(assert (=> d!167447 (= (containsKey!932 l!1390 key!405) e!883934)))

(declare-fun b!1583886 () Bool)

(declare-fun e!883935 () Bool)

(assert (=> b!1583886 (= e!883934 e!883935)))

(declare-fun res!1081308 () Bool)

(assert (=> b!1583886 (=> (not res!1081308) (not e!883935))))

(assert (=> b!1583886 (= res!1081308 (and (or (not ((_ is Cons!36855) l!1390)) (bvsle (_1!12823 (h!38416 l!1390)) key!405)) ((_ is Cons!36855) l!1390) (bvslt (_1!12823 (h!38416 l!1390)) key!405)))))

(declare-fun b!1583887 () Bool)

(assert (=> b!1583887 (= e!883935 (containsKey!932 (t!51765 l!1390) key!405))))

(assert (= (and d!167447 (not res!1081307)) b!1583886))

(assert (= (and b!1583886 res!1081308) b!1583887))

(assert (=> b!1583887 m!1454631))

(assert (=> b!1583758 d!167447))

(declare-fun d!167451 () Bool)

(declare-fun lt!677843 () Int)

(assert (=> d!167451 (>= lt!677843 0)))

(declare-fun e!883944 () Int)

(assert (=> d!167451 (= lt!677843 e!883944)))

(declare-fun c!147394 () Bool)

(assert (=> d!167451 (= c!147394 ((_ is Nil!36856) (t!51765 l!1390)))))

(assert (=> d!167451 (= (ListPrimitiveSize!196 (t!51765 l!1390)) lt!677843)))

(declare-fun b!1583900 () Bool)

(assert (=> b!1583900 (= e!883944 0)))

(declare-fun b!1583901 () Bool)

(assert (=> b!1583901 (= e!883944 (+ 1 (ListPrimitiveSize!196 (t!51765 (t!51765 l!1390)))))))

(assert (= (and d!167451 c!147394) b!1583900))

(assert (= (and d!167451 (not c!147394)) b!1583901))

(declare-fun m!1454713 () Bool)

(assert (=> b!1583901 m!1454713))

(assert (=> b!1583759 d!167451))

(declare-fun d!167457 () Bool)

(declare-fun lt!677844 () Int)

(assert (=> d!167457 (>= lt!677844 0)))

(declare-fun e!883945 () Int)

(assert (=> d!167457 (= lt!677844 e!883945)))

(declare-fun c!147395 () Bool)

(assert (=> d!167457 (= c!147395 ((_ is Nil!36856) l!1390))))

(assert (=> d!167457 (= (ListPrimitiveSize!196 l!1390) lt!677844)))

(declare-fun b!1583902 () Bool)

(assert (=> b!1583902 (= e!883945 0)))

(declare-fun b!1583903 () Bool)

(assert (=> b!1583903 (= e!883945 (+ 1 (ListPrimitiveSize!196 (t!51765 l!1390))))))

(assert (= (and d!167457 c!147395) b!1583902))

(assert (= (and d!167457 (not c!147395)) b!1583903))

(assert (=> b!1583903 m!1454637))

(assert (=> b!1583759 d!167457))

(declare-fun b!1583914 () Bool)

(declare-fun e!883954 () Bool)

(declare-fun tp!114570 () Bool)

(assert (=> b!1583914 (= e!883954 (and tp_is_empty!39235 tp!114570))))

(assert (=> b!1583756 (= tp!114561 e!883954)))

(assert (= (and b!1583756 ((_ is Cons!36855) (t!51765 l!1390))) b!1583914))

(check-sat (not b!1583833) (not b!1583901) (not d!167421) (not b!1583887) (not b!1583871) (not b!1583853) (not d!167411) (not b!1583859) (not b!1583903) (not b!1583855) (not b!1583914) tp_is_empty!39235)
(check-sat)
