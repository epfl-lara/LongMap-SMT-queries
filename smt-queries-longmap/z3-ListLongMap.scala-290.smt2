; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4760 () Bool)

(assert start!4760)

(declare-fun b_free!1327 () Bool)

(declare-fun b_next!1327 () Bool)

(assert (=> start!4760 (= b_free!1327 (not b_next!1327))))

(declare-fun tp!5453 () Bool)

(declare-fun b_and!2175 () Bool)

(assert (=> start!4760 (= tp!5453 b_and!2175)))

(declare-fun res!22198 () Bool)

(declare-fun e!23168 () Bool)

(assert (=> start!4760 (=> (not res!22198) (not e!23168))))

(declare-datatypes ((B!734 0))(
  ( (B!735 (val!867 Int)) )
))
(declare-datatypes ((tuple2!1376 0))(
  ( (tuple2!1377 (_1!699 (_ BitVec 64)) (_2!699 B!734)) )
))
(declare-datatypes ((List!957 0))(
  ( (Nil!954) (Cons!953 (h!1521 tuple2!1376) (t!3688 List!957)) )
))
(declare-datatypes ((ListLongMap!947 0))(
  ( (ListLongMap!948 (toList!489 List!957)) )
))
(declare-fun lm!252 () ListLongMap!947)

(declare-fun p!304 () Int)

(declare-fun forall!167 (List!957 Int) Bool)

(assert (=> start!4760 (= res!22198 (forall!167 (toList!489 lm!252) p!304))))

(assert (=> start!4760 e!23168))

(declare-fun e!23167 () Bool)

(declare-fun inv!1622 (ListLongMap!947) Bool)

(assert (=> start!4760 (and (inv!1622 lm!252) e!23167)))

(assert (=> start!4760 tp!5453))

(assert (=> start!4760 true))

(declare-fun b!36674 () Bool)

(declare-fun e!23169 () Bool)

(assert (=> b!36674 (= e!23168 e!23169)))

(declare-fun res!22199 () Bool)

(assert (=> b!36674 (=> res!22199 e!23169)))

(declare-fun lt!13549 () ListLongMap!947)

(assert (=> b!36674 (= res!22199 (not (forall!167 (toList!489 lt!13549) p!304)))))

(declare-fun tail!92 (ListLongMap!947) ListLongMap!947)

(assert (=> b!36674 (= lt!13549 (tail!92 lm!252))))

(declare-fun b!36675 () Bool)

(declare-fun res!22201 () Bool)

(assert (=> b!36675 (=> (not res!22201) (not e!23168))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!442 (ListLongMap!947 (_ BitVec 64)) Bool)

(assert (=> b!36675 (= res!22201 (contains!442 lm!252 k0!388))))

(declare-fun b!36676 () Bool)

(declare-fun tp!5452 () Bool)

(assert (=> b!36676 (= e!23167 tp!5452)))

(declare-fun b!36677 () Bool)

(declare-fun res!22202 () Bool)

(assert (=> b!36677 (=> (not res!22202) (not e!23168))))

(declare-fun isEmpty!191 (ListLongMap!947) Bool)

(assert (=> b!36677 (= res!22202 (not (isEmpty!191 lm!252)))))

(declare-fun b!36678 () Bool)

(assert (=> b!36678 (= e!23169 (not (contains!442 lt!13549 k0!388)))))

(declare-fun b!36679 () Bool)

(declare-fun res!22200 () Bool)

(assert (=> b!36679 (=> (not res!22200) (not e!23168))))

(declare-fun head!837 (List!957) tuple2!1376)

(assert (=> b!36679 (= res!22200 (not (= (_1!699 (head!837 (toList!489 lm!252))) k0!388)))))

(assert (= (and start!4760 res!22198) b!36675))

(assert (= (and b!36675 res!22201) b!36677))

(assert (= (and b!36677 res!22202) b!36679))

(assert (= (and b!36679 res!22200) b!36674))

(assert (= (and b!36674 (not res!22199)) b!36678))

(assert (= start!4760 b!36676))

(declare-fun m!29449 () Bool)

(assert (=> start!4760 m!29449))

(declare-fun m!29451 () Bool)

(assert (=> start!4760 m!29451))

(declare-fun m!29453 () Bool)

(assert (=> b!36677 m!29453))

(declare-fun m!29455 () Bool)

(assert (=> b!36678 m!29455))

(declare-fun m!29457 () Bool)

(assert (=> b!36674 m!29457))

(declare-fun m!29459 () Bool)

(assert (=> b!36674 m!29459))

(declare-fun m!29461 () Bool)

(assert (=> b!36679 m!29461))

(declare-fun m!29463 () Bool)

(assert (=> b!36675 m!29463))

(check-sat (not b!36674) (not b!36677) (not b!36676) (not b_next!1327) b_and!2175 (not b!36678) (not b!36679) (not b!36675) (not start!4760))
(check-sat b_and!2175 (not b_next!1327))
(get-model)

(declare-fun d!5520 () Bool)

(declare-fun e!23197 () Bool)

(assert (=> d!5520 e!23197))

(declare-fun res!22237 () Bool)

(assert (=> d!5520 (=> res!22237 e!23197)))

(declare-fun lt!13575 () Bool)

(assert (=> d!5520 (= res!22237 (not lt!13575))))

(declare-fun lt!13572 () Bool)

(assert (=> d!5520 (= lt!13575 lt!13572)))

(declare-datatypes ((Unit!830 0))(
  ( (Unit!831) )
))
(declare-fun lt!13574 () Unit!830)

(declare-fun e!23196 () Unit!830)

(assert (=> d!5520 (= lt!13574 e!23196)))

(declare-fun c!4191 () Bool)

(assert (=> d!5520 (= c!4191 lt!13572)))

(declare-fun containsKey!45 (List!957 (_ BitVec 64)) Bool)

(assert (=> d!5520 (= lt!13572 (containsKey!45 (toList!489 lt!13549) k0!388))))

(assert (=> d!5520 (= (contains!442 lt!13549 k0!388) lt!13575)))

(declare-fun b!36728 () Bool)

(declare-fun lt!13573 () Unit!830)

(assert (=> b!36728 (= e!23196 lt!13573)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!42 (List!957 (_ BitVec 64)) Unit!830)

(assert (=> b!36728 (= lt!13573 (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!489 lt!13549) k0!388))))

(declare-datatypes ((Option!87 0))(
  ( (Some!86 (v!1955 B!734)) (None!85) )
))
(declare-fun isDefined!43 (Option!87) Bool)

(declare-fun getValueByKey!81 (List!957 (_ BitVec 64)) Option!87)

(assert (=> b!36728 (isDefined!43 (getValueByKey!81 (toList!489 lt!13549) k0!388))))

(declare-fun b!36729 () Bool)

(declare-fun Unit!834 () Unit!830)

(assert (=> b!36729 (= e!23196 Unit!834)))

(declare-fun b!36730 () Bool)

(assert (=> b!36730 (= e!23197 (isDefined!43 (getValueByKey!81 (toList!489 lt!13549) k0!388)))))

(assert (= (and d!5520 c!4191) b!36728))

(assert (= (and d!5520 (not c!4191)) b!36729))

(assert (= (and d!5520 (not res!22237)) b!36730))

(declare-fun m!29499 () Bool)

(assert (=> d!5520 m!29499))

(declare-fun m!29503 () Bool)

(assert (=> b!36728 m!29503))

(declare-fun m!29507 () Bool)

(assert (=> b!36728 m!29507))

(assert (=> b!36728 m!29507))

(declare-fun m!29511 () Bool)

(assert (=> b!36728 m!29511))

(assert (=> b!36730 m!29507))

(assert (=> b!36730 m!29507))

(assert (=> b!36730 m!29511))

(assert (=> b!36678 d!5520))

(declare-fun d!5529 () Bool)

(declare-fun isEmpty!195 (List!957) Bool)

(assert (=> d!5529 (= (isEmpty!191 lm!252) (isEmpty!195 (toList!489 lm!252)))))

(declare-fun bs!1408 () Bool)

(assert (= bs!1408 d!5529))

(declare-fun m!29515 () Bool)

(assert (=> bs!1408 m!29515))

(assert (=> b!36677 d!5529))

(declare-fun d!5533 () Bool)

(assert (=> d!5533 (= (head!837 (toList!489 lm!252)) (h!1521 (toList!489 lm!252)))))

(assert (=> b!36679 d!5533))

(declare-fun d!5535 () Bool)

(declare-fun res!22252 () Bool)

(declare-fun e!23216 () Bool)

(assert (=> d!5535 (=> res!22252 e!23216)))

(get-info :version)

(assert (=> d!5535 (= res!22252 ((_ is Nil!954) (toList!489 lt!13549)))))

(assert (=> d!5535 (= (forall!167 (toList!489 lt!13549) p!304) e!23216)))

(declare-fun b!36753 () Bool)

(declare-fun e!23217 () Bool)

(assert (=> b!36753 (= e!23216 e!23217)))

(declare-fun res!22253 () Bool)

(assert (=> b!36753 (=> (not res!22253) (not e!23217))))

(declare-fun dynLambda!165 (Int tuple2!1376) Bool)

(assert (=> b!36753 (= res!22253 (dynLambda!165 p!304 (h!1521 (toList!489 lt!13549))))))

(declare-fun b!36754 () Bool)

(assert (=> b!36754 (= e!23217 (forall!167 (t!3688 (toList!489 lt!13549)) p!304))))

(assert (= (and d!5535 (not res!22252)) b!36753))

(assert (= (and b!36753 res!22253) b!36754))

(declare-fun b_lambda!1771 () Bool)

(assert (=> (not b_lambda!1771) (not b!36753)))

(declare-fun t!3694 () Bool)

(declare-fun tb!721 () Bool)

(assert (=> (and start!4760 (= p!304 p!304) t!3694) tb!721))

(declare-fun result!1245 () Bool)

(assert (=> tb!721 (= result!1245 true)))

(assert (=> b!36753 t!3694))

(declare-fun b_and!2183 () Bool)

(assert (= b_and!2175 (and (=> t!3694 result!1245) b_and!2183)))

(declare-fun m!29531 () Bool)

(assert (=> b!36753 m!29531))

(declare-fun m!29533 () Bool)

(assert (=> b!36754 m!29533))

(assert (=> b!36674 d!5535))

(declare-fun d!5543 () Bool)

(declare-fun tail!95 (List!957) List!957)

(assert (=> d!5543 (= (tail!92 lm!252) (ListLongMap!948 (tail!95 (toList!489 lm!252))))))

(declare-fun bs!1410 () Bool)

(assert (= bs!1410 d!5543))

(declare-fun m!29543 () Bool)

(assert (=> bs!1410 m!29543))

(assert (=> b!36674 d!5543))

(declare-fun d!5549 () Bool)

(declare-fun e!23227 () Bool)

(assert (=> d!5549 e!23227))

(declare-fun res!22261 () Bool)

(assert (=> d!5549 (=> res!22261 e!23227)))

(declare-fun lt!13599 () Bool)

(assert (=> d!5549 (= res!22261 (not lt!13599))))

(declare-fun lt!13596 () Bool)

(assert (=> d!5549 (= lt!13599 lt!13596)))

(declare-fun lt!13598 () Unit!830)

(declare-fun e!23226 () Unit!830)

(assert (=> d!5549 (= lt!13598 e!23226)))

(declare-fun c!4197 () Bool)

(assert (=> d!5549 (= c!4197 lt!13596)))

(assert (=> d!5549 (= lt!13596 (containsKey!45 (toList!489 lm!252) k0!388))))

(assert (=> d!5549 (= (contains!442 lm!252 k0!388) lt!13599)))

(declare-fun b!36764 () Bool)

(declare-fun lt!13597 () Unit!830)

(assert (=> b!36764 (= e!23226 lt!13597)))

(assert (=> b!36764 (= lt!13597 (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!489 lm!252) k0!388))))

(assert (=> b!36764 (isDefined!43 (getValueByKey!81 (toList!489 lm!252) k0!388))))

(declare-fun b!36765 () Bool)

(declare-fun Unit!839 () Unit!830)

(assert (=> b!36765 (= e!23226 Unit!839)))

(declare-fun b!36766 () Bool)

(assert (=> b!36766 (= e!23227 (isDefined!43 (getValueByKey!81 (toList!489 lm!252) k0!388)))))

(assert (= (and d!5549 c!4197) b!36764))

(assert (= (and d!5549 (not c!4197)) b!36765))

(assert (= (and d!5549 (not res!22261)) b!36766))

(declare-fun m!29547 () Bool)

(assert (=> d!5549 m!29547))

(declare-fun m!29549 () Bool)

(assert (=> b!36764 m!29549))

(declare-fun m!29553 () Bool)

(assert (=> b!36764 m!29553))

(assert (=> b!36764 m!29553))

(declare-fun m!29555 () Bool)

(assert (=> b!36764 m!29555))

(assert (=> b!36766 m!29553))

(assert (=> b!36766 m!29553))

(assert (=> b!36766 m!29555))

(assert (=> b!36675 d!5549))

(declare-fun d!5553 () Bool)

(declare-fun res!22262 () Bool)

(declare-fun e!23228 () Bool)

(assert (=> d!5553 (=> res!22262 e!23228)))

(assert (=> d!5553 (= res!22262 ((_ is Nil!954) (toList!489 lm!252)))))

(assert (=> d!5553 (= (forall!167 (toList!489 lm!252) p!304) e!23228)))

(declare-fun b!36767 () Bool)

(declare-fun e!23229 () Bool)

(assert (=> b!36767 (= e!23228 e!23229)))

(declare-fun res!22263 () Bool)

(assert (=> b!36767 (=> (not res!22263) (not e!23229))))

(assert (=> b!36767 (= res!22263 (dynLambda!165 p!304 (h!1521 (toList!489 lm!252))))))

(declare-fun b!36768 () Bool)

(assert (=> b!36768 (= e!23229 (forall!167 (t!3688 (toList!489 lm!252)) p!304))))

(assert (= (and d!5553 (not res!22262)) b!36767))

(assert (= (and b!36767 res!22263) b!36768))

(declare-fun b_lambda!1775 () Bool)

(assert (=> (not b_lambda!1775) (not b!36767)))

(declare-fun t!3698 () Bool)

(declare-fun tb!725 () Bool)

(assert (=> (and start!4760 (= p!304 p!304) t!3698) tb!725))

(declare-fun result!1249 () Bool)

(assert (=> tb!725 (= result!1249 true)))

(assert (=> b!36767 t!3698))

(declare-fun b_and!2187 () Bool)

(assert (= b_and!2183 (and (=> t!3698 result!1249) b_and!2187)))

(declare-fun m!29559 () Bool)

(assert (=> b!36767 m!29559))

(declare-fun m!29561 () Bool)

(assert (=> b!36768 m!29561))

(assert (=> start!4760 d!5553))

(declare-fun d!5557 () Bool)

(declare-fun isStrictlySorted!166 (List!957) Bool)

(assert (=> d!5557 (= (inv!1622 lm!252) (isStrictlySorted!166 (toList!489 lm!252)))))

(declare-fun bs!1413 () Bool)

(assert (= bs!1413 d!5557))

(declare-fun m!29569 () Bool)

(assert (=> bs!1413 m!29569))

(assert (=> start!4760 d!5557))

(declare-fun b!36781 () Bool)

(declare-fun e!23238 () Bool)

(declare-fun tp_is_empty!1657 () Bool)

(declare-fun tp!5470 () Bool)

(assert (=> b!36781 (= e!23238 (and tp_is_empty!1657 tp!5470))))

(assert (=> b!36676 (= tp!5452 e!23238)))

(assert (= (and b!36676 ((_ is Cons!953) (toList!489 lm!252))) b!36781))

(declare-fun b_lambda!1781 () Bool)

(assert (= b_lambda!1775 (or (and start!4760 b_free!1327) b_lambda!1781)))

(declare-fun b_lambda!1783 () Bool)

(assert (= b_lambda!1771 (or (and start!4760 b_free!1327) b_lambda!1783)))

(check-sat tp_is_empty!1657 (not b!36764) (not d!5543) (not d!5557) (not b_lambda!1781) (not d!5549) (not b_lambda!1783) (not d!5529) b_and!2187 (not d!5520) (not b!36730) (not b!36768) (not b!36728) (not b!36766) (not b_next!1327) (not b!36781) (not b!36754))
(check-sat b_and!2187 (not b_next!1327))
(get-model)

(declare-fun d!5567 () Bool)

(declare-fun res!22273 () Bool)

(declare-fun e!23249 () Bool)

(assert (=> d!5567 (=> res!22273 e!23249)))

(assert (=> d!5567 (= res!22273 (and ((_ is Cons!953) (toList!489 lm!252)) (= (_1!699 (h!1521 (toList!489 lm!252))) k0!388)))))

(assert (=> d!5567 (= (containsKey!45 (toList!489 lm!252) k0!388) e!23249)))

(declare-fun b!36795 () Bool)

(declare-fun e!23250 () Bool)

(assert (=> b!36795 (= e!23249 e!23250)))

(declare-fun res!22274 () Bool)

(assert (=> b!36795 (=> (not res!22274) (not e!23250))))

(assert (=> b!36795 (= res!22274 (and (or (not ((_ is Cons!953) (toList!489 lm!252))) (bvsle (_1!699 (h!1521 (toList!489 lm!252))) k0!388)) ((_ is Cons!953) (toList!489 lm!252)) (bvslt (_1!699 (h!1521 (toList!489 lm!252))) k0!388)))))

(declare-fun b!36796 () Bool)

(assert (=> b!36796 (= e!23250 (containsKey!45 (t!3688 (toList!489 lm!252)) k0!388))))

(assert (= (and d!5567 (not res!22273)) b!36795))

(assert (= (and b!36795 res!22274) b!36796))

(declare-fun m!29587 () Bool)

(assert (=> b!36796 m!29587))

(assert (=> d!5549 d!5567))

(declare-fun d!5569 () Bool)

(declare-fun isEmpty!197 (Option!87) Bool)

(assert (=> d!5569 (= (isDefined!43 (getValueByKey!81 (toList!489 lm!252) k0!388)) (not (isEmpty!197 (getValueByKey!81 (toList!489 lm!252) k0!388))))))

(declare-fun bs!1416 () Bool)

(assert (= bs!1416 d!5569))

(assert (=> bs!1416 m!29553))

(declare-fun m!29589 () Bool)

(assert (=> bs!1416 m!29589))

(assert (=> b!36766 d!5569))

(declare-fun b!36808 () Bool)

(declare-fun e!23256 () Option!87)

(assert (=> b!36808 (= e!23256 None!85)))

(declare-fun b!36806 () Bool)

(declare-fun e!23255 () Option!87)

(assert (=> b!36806 (= e!23255 e!23256)))

(declare-fun c!4204 () Bool)

(assert (=> b!36806 (= c!4204 (and ((_ is Cons!953) (toList!489 lm!252)) (not (= (_1!699 (h!1521 (toList!489 lm!252))) k0!388))))))

(declare-fun b!36807 () Bool)

(assert (=> b!36807 (= e!23256 (getValueByKey!81 (t!3688 (toList!489 lm!252)) k0!388))))

(declare-fun b!36805 () Bool)

(assert (=> b!36805 (= e!23255 (Some!86 (_2!699 (h!1521 (toList!489 lm!252)))))))

(declare-fun d!5571 () Bool)

(declare-fun c!4203 () Bool)

(assert (=> d!5571 (= c!4203 (and ((_ is Cons!953) (toList!489 lm!252)) (= (_1!699 (h!1521 (toList!489 lm!252))) k0!388)))))

(assert (=> d!5571 (= (getValueByKey!81 (toList!489 lm!252) k0!388) e!23255)))

(assert (= (and d!5571 c!4203) b!36805))

(assert (= (and d!5571 (not c!4203)) b!36806))

(assert (= (and b!36806 c!4204) b!36807))

(assert (= (and b!36806 (not c!4204)) b!36808))

(declare-fun m!29591 () Bool)

(assert (=> b!36807 m!29591))

(assert (=> b!36766 d!5571))

(declare-fun d!5573 () Bool)

(declare-fun res!22279 () Bool)

(declare-fun e!23261 () Bool)

(assert (=> d!5573 (=> res!22279 e!23261)))

(assert (=> d!5573 (= res!22279 (or ((_ is Nil!954) (toList!489 lm!252)) ((_ is Nil!954) (t!3688 (toList!489 lm!252)))))))

(assert (=> d!5573 (= (isStrictlySorted!166 (toList!489 lm!252)) e!23261)))

(declare-fun b!36813 () Bool)

(declare-fun e!23262 () Bool)

(assert (=> b!36813 (= e!23261 e!23262)))

(declare-fun res!22280 () Bool)

(assert (=> b!36813 (=> (not res!22280) (not e!23262))))

(assert (=> b!36813 (= res!22280 (bvslt (_1!699 (h!1521 (toList!489 lm!252))) (_1!699 (h!1521 (t!3688 (toList!489 lm!252))))))))

(declare-fun b!36814 () Bool)

(assert (=> b!36814 (= e!23262 (isStrictlySorted!166 (t!3688 (toList!489 lm!252))))))

(assert (= (and d!5573 (not res!22279)) b!36813))

(assert (= (and b!36813 res!22280) b!36814))

(declare-fun m!29593 () Bool)

(assert (=> b!36814 m!29593))

(assert (=> d!5557 d!5573))

(declare-fun d!5575 () Bool)

(assert (=> d!5575 (isDefined!43 (getValueByKey!81 (toList!489 lt!13549) k0!388))))

(declare-fun lt!13606 () Unit!830)

(declare-fun choose!227 (List!957 (_ BitVec 64)) Unit!830)

(assert (=> d!5575 (= lt!13606 (choose!227 (toList!489 lt!13549) k0!388))))

(declare-fun e!23265 () Bool)

(assert (=> d!5575 e!23265))

(declare-fun res!22283 () Bool)

(assert (=> d!5575 (=> (not res!22283) (not e!23265))))

(assert (=> d!5575 (= res!22283 (isStrictlySorted!166 (toList!489 lt!13549)))))

(assert (=> d!5575 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!489 lt!13549) k0!388) lt!13606)))

(declare-fun b!36817 () Bool)

(assert (=> b!36817 (= e!23265 (containsKey!45 (toList!489 lt!13549) k0!388))))

(assert (= (and d!5575 res!22283) b!36817))

(assert (=> d!5575 m!29507))

(assert (=> d!5575 m!29507))

(assert (=> d!5575 m!29511))

(declare-fun m!29595 () Bool)

(assert (=> d!5575 m!29595))

(declare-fun m!29597 () Bool)

(assert (=> d!5575 m!29597))

(assert (=> b!36817 m!29499))

(assert (=> b!36728 d!5575))

(declare-fun d!5577 () Bool)

(assert (=> d!5577 (= (isDefined!43 (getValueByKey!81 (toList!489 lt!13549) k0!388)) (not (isEmpty!197 (getValueByKey!81 (toList!489 lt!13549) k0!388))))))

(declare-fun bs!1417 () Bool)

(assert (= bs!1417 d!5577))

(assert (=> bs!1417 m!29507))

(declare-fun m!29599 () Bool)

(assert (=> bs!1417 m!29599))

(assert (=> b!36728 d!5577))

(declare-fun b!36821 () Bool)

(declare-fun e!23267 () Option!87)

(assert (=> b!36821 (= e!23267 None!85)))

(declare-fun b!36819 () Bool)

(declare-fun e!23266 () Option!87)

(assert (=> b!36819 (= e!23266 e!23267)))

(declare-fun c!4206 () Bool)

(assert (=> b!36819 (= c!4206 (and ((_ is Cons!953) (toList!489 lt!13549)) (not (= (_1!699 (h!1521 (toList!489 lt!13549))) k0!388))))))

(declare-fun b!36820 () Bool)

(assert (=> b!36820 (= e!23267 (getValueByKey!81 (t!3688 (toList!489 lt!13549)) k0!388))))

(declare-fun b!36818 () Bool)

(assert (=> b!36818 (= e!23266 (Some!86 (_2!699 (h!1521 (toList!489 lt!13549)))))))

(declare-fun d!5579 () Bool)

(declare-fun c!4205 () Bool)

(assert (=> d!5579 (= c!4205 (and ((_ is Cons!953) (toList!489 lt!13549)) (= (_1!699 (h!1521 (toList!489 lt!13549))) k0!388)))))

(assert (=> d!5579 (= (getValueByKey!81 (toList!489 lt!13549) k0!388) e!23266)))

(assert (= (and d!5579 c!4205) b!36818))

(assert (= (and d!5579 (not c!4205)) b!36819))

(assert (= (and b!36819 c!4206) b!36820))

(assert (= (and b!36819 (not c!4206)) b!36821))

(declare-fun m!29601 () Bool)

(assert (=> b!36820 m!29601))

(assert (=> b!36728 d!5579))

(declare-fun d!5581 () Bool)

(declare-fun res!22284 () Bool)

(declare-fun e!23268 () Bool)

(assert (=> d!5581 (=> res!22284 e!23268)))

(assert (=> d!5581 (= res!22284 (and ((_ is Cons!953) (toList!489 lt!13549)) (= (_1!699 (h!1521 (toList!489 lt!13549))) k0!388)))))

(assert (=> d!5581 (= (containsKey!45 (toList!489 lt!13549) k0!388) e!23268)))

(declare-fun b!36822 () Bool)

(declare-fun e!23269 () Bool)

(assert (=> b!36822 (= e!23268 e!23269)))

(declare-fun res!22285 () Bool)

(assert (=> b!36822 (=> (not res!22285) (not e!23269))))

(assert (=> b!36822 (= res!22285 (and (or (not ((_ is Cons!953) (toList!489 lt!13549))) (bvsle (_1!699 (h!1521 (toList!489 lt!13549))) k0!388)) ((_ is Cons!953) (toList!489 lt!13549)) (bvslt (_1!699 (h!1521 (toList!489 lt!13549))) k0!388)))))

(declare-fun b!36823 () Bool)

(assert (=> b!36823 (= e!23269 (containsKey!45 (t!3688 (toList!489 lt!13549)) k0!388))))

(assert (= (and d!5581 (not res!22284)) b!36822))

(assert (= (and b!36822 res!22285) b!36823))

(declare-fun m!29603 () Bool)

(assert (=> b!36823 m!29603))

(assert (=> d!5520 d!5581))

(declare-fun d!5583 () Bool)

(assert (=> d!5583 (= (isEmpty!195 (toList!489 lm!252)) ((_ is Nil!954) (toList!489 lm!252)))))

(assert (=> d!5529 d!5583))

(declare-fun d!5585 () Bool)

(assert (=> d!5585 (= (tail!95 (toList!489 lm!252)) (t!3688 (toList!489 lm!252)))))

(assert (=> d!5543 d!5585))

(declare-fun d!5587 () Bool)

(declare-fun res!22286 () Bool)

(declare-fun e!23270 () Bool)

(assert (=> d!5587 (=> res!22286 e!23270)))

(assert (=> d!5587 (= res!22286 ((_ is Nil!954) (t!3688 (toList!489 lt!13549))))))

(assert (=> d!5587 (= (forall!167 (t!3688 (toList!489 lt!13549)) p!304) e!23270)))

(declare-fun b!36824 () Bool)

(declare-fun e!23271 () Bool)

(assert (=> b!36824 (= e!23270 e!23271)))

(declare-fun res!22287 () Bool)

(assert (=> b!36824 (=> (not res!22287) (not e!23271))))

(assert (=> b!36824 (= res!22287 (dynLambda!165 p!304 (h!1521 (t!3688 (toList!489 lt!13549)))))))

(declare-fun b!36825 () Bool)

(assert (=> b!36825 (= e!23271 (forall!167 (t!3688 (t!3688 (toList!489 lt!13549))) p!304))))

(assert (= (and d!5587 (not res!22286)) b!36824))

(assert (= (and b!36824 res!22287) b!36825))

(declare-fun b_lambda!1793 () Bool)

(assert (=> (not b_lambda!1793) (not b!36824)))

(declare-fun t!3704 () Bool)

(declare-fun tb!731 () Bool)

(assert (=> (and start!4760 (= p!304 p!304) t!3704) tb!731))

(declare-fun result!1261 () Bool)

(assert (=> tb!731 (= result!1261 true)))

(assert (=> b!36824 t!3704))

(declare-fun b_and!2193 () Bool)

(assert (= b_and!2187 (and (=> t!3704 result!1261) b_and!2193)))

(declare-fun m!29605 () Bool)

(assert (=> b!36824 m!29605))

(declare-fun m!29607 () Bool)

(assert (=> b!36825 m!29607))

(assert (=> b!36754 d!5587))

(declare-fun d!5591 () Bool)

(declare-fun res!22288 () Bool)

(declare-fun e!23272 () Bool)

(assert (=> d!5591 (=> res!22288 e!23272)))

(assert (=> d!5591 (= res!22288 ((_ is Nil!954) (t!3688 (toList!489 lm!252))))))

(assert (=> d!5591 (= (forall!167 (t!3688 (toList!489 lm!252)) p!304) e!23272)))

(declare-fun b!36826 () Bool)

(declare-fun e!23273 () Bool)

(assert (=> b!36826 (= e!23272 e!23273)))

(declare-fun res!22289 () Bool)

(assert (=> b!36826 (=> (not res!22289) (not e!23273))))

(assert (=> b!36826 (= res!22289 (dynLambda!165 p!304 (h!1521 (t!3688 (toList!489 lm!252)))))))

(declare-fun b!36827 () Bool)

(assert (=> b!36827 (= e!23273 (forall!167 (t!3688 (t!3688 (toList!489 lm!252))) p!304))))

(assert (= (and d!5591 (not res!22288)) b!36826))

(assert (= (and b!36826 res!22289) b!36827))

(declare-fun b_lambda!1795 () Bool)

(assert (=> (not b_lambda!1795) (not b!36826)))

(declare-fun t!3706 () Bool)

(declare-fun tb!733 () Bool)

(assert (=> (and start!4760 (= p!304 p!304) t!3706) tb!733))

(declare-fun result!1263 () Bool)

(assert (=> tb!733 (= result!1263 true)))

(assert (=> b!36826 t!3706))

(declare-fun b_and!2195 () Bool)

(assert (= b_and!2193 (and (=> t!3706 result!1263) b_and!2195)))

(declare-fun m!29609 () Bool)

(assert (=> b!36826 m!29609))

(declare-fun m!29611 () Bool)

(assert (=> b!36827 m!29611))

(assert (=> b!36768 d!5591))

(declare-fun d!5593 () Bool)

(assert (=> d!5593 (isDefined!43 (getValueByKey!81 (toList!489 lm!252) k0!388))))

(declare-fun lt!13607 () Unit!830)

(assert (=> d!5593 (= lt!13607 (choose!227 (toList!489 lm!252) k0!388))))

(declare-fun e!23274 () Bool)

(assert (=> d!5593 e!23274))

(declare-fun res!22290 () Bool)

(assert (=> d!5593 (=> (not res!22290) (not e!23274))))

(assert (=> d!5593 (= res!22290 (isStrictlySorted!166 (toList!489 lm!252)))))

(assert (=> d!5593 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!489 lm!252) k0!388) lt!13607)))

(declare-fun b!36828 () Bool)

(assert (=> b!36828 (= e!23274 (containsKey!45 (toList!489 lm!252) k0!388))))

(assert (= (and d!5593 res!22290) b!36828))

(assert (=> d!5593 m!29553))

(assert (=> d!5593 m!29553))

(assert (=> d!5593 m!29555))

(declare-fun m!29613 () Bool)

(assert (=> d!5593 m!29613))

(assert (=> d!5593 m!29569))

(assert (=> b!36828 m!29547))

(assert (=> b!36764 d!5593))

(assert (=> b!36764 d!5569))

(assert (=> b!36764 d!5571))

(assert (=> b!36730 d!5577))

(assert (=> b!36730 d!5579))

(declare-fun b!36829 () Bool)

(declare-fun e!23275 () Bool)

(declare-fun tp!5475 () Bool)

(assert (=> b!36829 (= e!23275 (and tp_is_empty!1657 tp!5475))))

(assert (=> b!36781 (= tp!5470 e!23275)))

(assert (= (and b!36781 ((_ is Cons!953) (t!3688 (toList!489 lm!252)))) b!36829))

(declare-fun b_lambda!1797 () Bool)

(assert (= b_lambda!1793 (or (and start!4760 b_free!1327) b_lambda!1797)))

(declare-fun b_lambda!1799 () Bool)

(assert (= b_lambda!1795 (or (and start!4760 b_free!1327) b_lambda!1799)))

(check-sat tp_is_empty!1657 (not b!36820) (not b!36825) (not b_lambda!1797) (not b!36817) (not d!5575) (not b_lambda!1799) (not d!5577) b_and!2195 (not b!36829) (not b_lambda!1781) (not b!36814) (not b!36828) (not b!36827) (not d!5569) (not b_lambda!1783) (not b!36807) (not b!36796) (not b_next!1327) (not b!36823) (not d!5593))
(check-sat b_and!2195 (not b_next!1327))
