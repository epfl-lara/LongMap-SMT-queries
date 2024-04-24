; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4730 () Bool)

(assert start!4730)

(declare-fun b_free!1321 () Bool)

(declare-fun b_next!1321 () Bool)

(assert (=> start!4730 (= b_free!1321 (not b_next!1321))))

(declare-fun tp!5425 () Bool)

(declare-fun b_and!2163 () Bool)

(assert (=> start!4730 (= tp!5425 b_and!2163)))

(declare-fun res!22147 () Bool)

(declare-fun e!23094 () Bool)

(assert (=> start!4730 (=> (not res!22147) (not e!23094))))

(declare-datatypes ((B!728 0))(
  ( (B!729 (val!864 Int)) )
))
(declare-datatypes ((tuple2!1370 0))(
  ( (tuple2!1371 (_1!696 (_ BitVec 64)) (_2!696 B!728)) )
))
(declare-datatypes ((List!954 0))(
  ( (Nil!951) (Cons!950 (h!1518 tuple2!1370) (t!3679 List!954)) )
))
(declare-datatypes ((ListLongMap!941 0))(
  ( (ListLongMap!942 (toList!486 List!954)) )
))
(declare-fun lm!252 () ListLongMap!941)

(declare-fun p!304 () Int)

(declare-fun forall!164 (List!954 Int) Bool)

(assert (=> start!4730 (= res!22147 (forall!164 (toList!486 lm!252) p!304))))

(assert (=> start!4730 e!23094))

(declare-fun e!23093 () Bool)

(declare-fun inv!1614 (ListLongMap!941) Bool)

(assert (=> start!4730 (and (inv!1614 lm!252) e!23093)))

(assert (=> start!4730 tp!5425))

(assert (=> start!4730 true))

(declare-fun b!36563 () Bool)

(declare-fun res!22148 () Bool)

(assert (=> b!36563 (=> (not res!22148) (not e!23094))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!439 (ListLongMap!941 (_ BitVec 64)) Bool)

(assert (=> b!36563 (= res!22148 (contains!439 lm!252 k0!388))))

(declare-fun b!36564 () Bool)

(declare-fun size!1291 (List!954) Int)

(assert (=> b!36564 (= e!23094 (< (size!1291 (toList!486 lm!252)) 0))))

(declare-fun b!36565 () Bool)

(declare-fun tp!5426 () Bool)

(assert (=> b!36565 (= e!23093 tp!5426)))

(assert (= (and start!4730 res!22147) b!36563))

(assert (= (and b!36563 res!22148) b!36564))

(assert (= start!4730 b!36565))

(declare-fun m!29377 () Bool)

(assert (=> start!4730 m!29377))

(declare-fun m!29379 () Bool)

(assert (=> start!4730 m!29379))

(declare-fun m!29381 () Bool)

(assert (=> b!36563 m!29381))

(declare-fun m!29383 () Bool)

(assert (=> b!36564 m!29383))

(check-sat (not start!4730) (not b_next!1321) (not b!36564) b_and!2163 (not b!36565) (not b!36563))
(check-sat b_and!2163 (not b_next!1321))
(get-model)

(declare-fun d!5497 () Bool)

(declare-fun res!22165 () Bool)

(declare-fun e!23114 () Bool)

(assert (=> d!5497 (=> res!22165 e!23114)))

(get-info :version)

(assert (=> d!5497 (= res!22165 ((_ is Nil!951) (toList!486 lm!252)))))

(assert (=> d!5497 (= (forall!164 (toList!486 lm!252) p!304) e!23114)))

(declare-fun b!36594 () Bool)

(declare-fun e!23115 () Bool)

(assert (=> b!36594 (= e!23114 e!23115)))

(declare-fun res!22166 () Bool)

(assert (=> b!36594 (=> (not res!22166) (not e!23115))))

(declare-fun dynLambda!162 (Int tuple2!1370) Bool)

(assert (=> b!36594 (= res!22166 (dynLambda!162 p!304 (h!1518 (toList!486 lm!252))))))

(declare-fun b!36595 () Bool)

(assert (=> b!36595 (= e!23115 (forall!164 (t!3679 (toList!486 lm!252)) p!304))))

(assert (= (and d!5497 (not res!22165)) b!36594))

(assert (= (and b!36594 res!22166) b!36595))

(declare-fun b_lambda!1757 () Bool)

(assert (=> (not b_lambda!1757) (not b!36594)))

(declare-fun t!3683 () Bool)

(declare-fun tb!713 () Bool)

(assert (=> (and start!4730 (= p!304 p!304) t!3683) tb!713))

(declare-fun result!1231 () Bool)

(assert (=> tb!713 (= result!1231 true)))

(assert (=> b!36594 t!3683))

(declare-fun b_and!2169 () Bool)

(assert (= b_and!2163 (and (=> t!3683 result!1231) b_and!2169)))

(declare-fun m!29403 () Bool)

(assert (=> b!36594 m!29403))

(declare-fun m!29405 () Bool)

(assert (=> b!36595 m!29405))

(assert (=> start!4730 d!5497))

(declare-fun d!5501 () Bool)

(declare-fun isStrictlySorted!163 (List!954) Bool)

(assert (=> d!5501 (= (inv!1614 lm!252) (isStrictlySorted!163 (toList!486 lm!252)))))

(declare-fun bs!1401 () Bool)

(assert (= bs!1401 d!5501))

(declare-fun m!29407 () Bool)

(assert (=> bs!1401 m!29407))

(assert (=> start!4730 d!5501))

(declare-fun d!5503 () Bool)

(declare-fun lt!13527 () Int)

(assert (=> d!5503 (>= lt!13527 0)))

(declare-fun e!23126 () Int)

(assert (=> d!5503 (= lt!13527 e!23126)))

(declare-fun c!4179 () Bool)

(assert (=> d!5503 (= c!4179 ((_ is Nil!951) (toList!486 lm!252)))))

(assert (=> d!5503 (= (size!1291 (toList!486 lm!252)) lt!13527)))

(declare-fun b!36613 () Bool)

(assert (=> b!36613 (= e!23126 0)))

(declare-fun b!36614 () Bool)

(assert (=> b!36614 (= e!23126 (+ 1 (size!1291 (t!3679 (toList!486 lm!252)))))))

(assert (= (and d!5503 c!4179) b!36613))

(assert (= (and d!5503 (not c!4179)) b!36614))

(declare-fun m!29417 () Bool)

(assert (=> b!36614 m!29417))

(assert (=> b!36564 d!5503))

(declare-fun d!5507 () Bool)

(declare-fun e!23157 () Bool)

(assert (=> d!5507 e!23157))

(declare-fun res!22187 () Bool)

(assert (=> d!5507 (=> res!22187 e!23157)))

(declare-fun lt!13543 () Bool)

(assert (=> d!5507 (= res!22187 (not lt!13543))))

(declare-fun lt!13544 () Bool)

(assert (=> d!5507 (= lt!13543 lt!13544)))

(declare-datatypes ((Unit!827 0))(
  ( (Unit!828) )
))
(declare-fun lt!13545 () Unit!827)

(declare-fun e!23156 () Unit!827)

(assert (=> d!5507 (= lt!13545 e!23156)))

(declare-fun c!4186 () Bool)

(assert (=> d!5507 (= c!4186 lt!13544)))

(declare-fun containsKey!44 (List!954 (_ BitVec 64)) Bool)

(assert (=> d!5507 (= lt!13544 (containsKey!44 (toList!486 lm!252) k0!388))))

(assert (=> d!5507 (= (contains!439 lm!252 k0!388) lt!13543)))

(declare-fun b!36654 () Bool)

(declare-fun lt!13546 () Unit!827)

(assert (=> b!36654 (= e!23156 lt!13546)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!41 (List!954 (_ BitVec 64)) Unit!827)

(assert (=> b!36654 (= lt!13546 (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!486 lm!252) k0!388))))

(declare-datatypes ((Option!86 0))(
  ( (Some!85 (v!1954 B!728)) (None!84) )
))
(declare-fun isDefined!42 (Option!86) Bool)

(declare-fun getValueByKey!80 (List!954 (_ BitVec 64)) Option!86)

(assert (=> b!36654 (isDefined!42 (getValueByKey!80 (toList!486 lm!252) k0!388))))

(declare-fun b!36655 () Bool)

(declare-fun Unit!829 () Unit!827)

(assert (=> b!36655 (= e!23156 Unit!829)))

(declare-fun b!36656 () Bool)

(assert (=> b!36656 (= e!23157 (isDefined!42 (getValueByKey!80 (toList!486 lm!252) k0!388)))))

(assert (= (and d!5507 c!4186) b!36654))

(assert (= (and d!5507 (not c!4186)) b!36655))

(assert (= (and d!5507 (not res!22187)) b!36656))

(declare-fun m!29441 () Bool)

(assert (=> d!5507 m!29441))

(declare-fun m!29443 () Bool)

(assert (=> b!36654 m!29443))

(declare-fun m!29445 () Bool)

(assert (=> b!36654 m!29445))

(assert (=> b!36654 m!29445))

(declare-fun m!29447 () Bool)

(assert (=> b!36654 m!29447))

(assert (=> b!36656 m!29445))

(assert (=> b!36656 m!29445))

(assert (=> b!36656 m!29447))

(assert (=> b!36563 d!5507))

(declare-fun b!36661 () Bool)

(declare-fun e!23160 () Bool)

(declare-fun tp_is_empty!1655 () Bool)

(declare-fun tp!5447 () Bool)

(assert (=> b!36661 (= e!23160 (and tp_is_empty!1655 tp!5447))))

(assert (=> b!36565 (= tp!5426 e!23160)))

(assert (= (and b!36565 ((_ is Cons!950) (toList!486 lm!252))) b!36661))

(declare-fun b_lambda!1767 () Bool)

(assert (= b_lambda!1757 (or (and start!4730 b_free!1321) b_lambda!1767)))

(check-sat (not b!36661) tp_is_empty!1655 (not b!36656) (not b_lambda!1767) (not b!36654) (not d!5507) (not b!36595) b_and!2169 (not b!36614) (not d!5501) (not b_next!1321))
(check-sat b_and!2169 (not b_next!1321))
