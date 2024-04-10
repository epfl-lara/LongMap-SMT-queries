; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132438 () Bool)

(assert start!132438)

(declare-datatypes ((B!2220 0))(
  ( (B!2221 (val!19196 Int)) )
))
(declare-datatypes ((tuple2!24768 0))(
  ( (tuple2!24769 (_1!12395 (_ BitVec 64)) (_2!12395 B!2220)) )
))
(declare-datatypes ((List!36230 0))(
  ( (Nil!36227) (Cons!36226 (h!37672 tuple2!24768) (t!50951 List!36230)) )
))
(declare-fun lt!669740 () List!36230)

(declare-datatypes ((ListLongMap!22377 0))(
  ( (ListLongMap!22378 (toList!11204 List!36230)) )
))
(declare-fun lm!249 () ListLongMap!22377)

(declare-fun e!865019 () Bool)

(declare-fun b!1553628 () Bool)

(declare-fun a0!49 () (_ BitVec 64))

(declare-datatypes ((Option!817 0))(
  ( (Some!816 (v!22001 B!2220)) (None!815) )
))
(declare-fun getValueByKey!741 (List!36230 (_ BitVec 64)) Option!817)

(assert (=> b!1553628 (= e!865019 (= (getValueByKey!741 lt!669740 a0!49) (getValueByKey!741 (toList!11204 lm!249) a0!49)))))

(declare-fun b!1553629 () Bool)

(declare-fun res!1063379 () Bool)

(declare-fun e!865022 () Bool)

(assert (=> b!1553629 (=> (not res!1063379) (not e!865022))))

(declare-fun containsKey!763 (List!36230 (_ BitVec 64)) Bool)

(assert (=> b!1553629 (= res!1063379 (containsKey!763 (toList!11204 lm!249) a0!49))))

(declare-fun res!1063377 () Bool)

(assert (=> start!132438 (=> (not res!1063377) (not e!865022))))

(declare-fun contains!10146 (ListLongMap!22377 (_ BitVec 64)) Bool)

(assert (=> start!132438 (= res!1063377 (contains!10146 lm!249 a0!49))))

(assert (=> start!132438 e!865022))

(declare-fun e!865021 () Bool)

(declare-fun inv!57313 (ListLongMap!22377) Bool)

(assert (=> start!132438 (and (inv!57313 lm!249) e!865021)))

(assert (=> start!132438 true))

(declare-fun tp_is_empty!38231 () Bool)

(assert (=> start!132438 tp_is_empty!38231))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2220)

(declare-fun b!1553630 () Bool)

(declare-fun e!865020 () Bool)

(declare-fun +!5014 (ListLongMap!22377 tuple2!24768) ListLongMap!22377)

(assert (=> b!1553630 (= e!865020 (contains!10146 (+!5014 lm!249 (tuple2!24769 a!523 b!96)) a0!49))))

(declare-fun isDefined!554 (Option!817) Bool)

(assert (=> b!1553630 (isDefined!554 (getValueByKey!741 (toList!11204 lm!249) a0!49))))

(declare-datatypes ((Unit!51753 0))(
  ( (Unit!51754) )
))
(declare-fun lt!669739 () Unit!51753)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!506 (List!36230 (_ BitVec 64)) Unit!51753)

(assert (=> b!1553630 (= lt!669739 (lemmaContainsKeyImpliesGetValueByKeyDefined!506 (toList!11204 lm!249) a0!49))))

(declare-fun b!1553631 () Bool)

(declare-fun tp!112125 () Bool)

(assert (=> b!1553631 (= e!865021 tp!112125)))

(declare-fun b!1553632 () Bool)

(assert (=> b!1553632 (= e!865022 (not e!865020))))

(declare-fun res!1063381 () Bool)

(assert (=> b!1553632 (=> res!1063381 e!865020)))

(declare-fun isStrictlySorted!893 (List!36230) Bool)

(assert (=> b!1553632 (= res!1063381 (not (isStrictlySorted!893 (toList!11204 lm!249))))))

(assert (=> b!1553632 e!865019))

(declare-fun res!1063378 () Bool)

(assert (=> b!1553632 (=> (not res!1063378) (not e!865019))))

(assert (=> b!1553632 (= res!1063378 (containsKey!763 lt!669740 a0!49))))

(declare-fun insertStrictlySorted!509 (List!36230 (_ BitVec 64) B!2220) List!36230)

(assert (=> b!1553632 (= lt!669740 (insertStrictlySorted!509 (toList!11204 lm!249) a!523 b!96))))

(declare-fun lt!669738 () Unit!51753)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!6 (List!36230 (_ BitVec 64) B!2220 (_ BitVec 64)) Unit!51753)

(assert (=> b!1553632 (= lt!669738 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!6 (toList!11204 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553633 () Bool)

(declare-fun res!1063380 () Bool)

(assert (=> b!1553633 (=> (not res!1063380) (not e!865022))))

(assert (=> b!1553633 (= res!1063380 (not (= a0!49 a!523)))))

(assert (= (and start!132438 res!1063377) b!1553633))

(assert (= (and b!1553633 res!1063380) b!1553629))

(assert (= (and b!1553629 res!1063379) b!1553632))

(assert (= (and b!1553632 res!1063378) b!1553628))

(assert (= (and b!1553632 (not res!1063381)) b!1553630))

(assert (= start!132438 b!1553631))

(declare-fun m!1432285 () Bool)

(assert (=> b!1553629 m!1432285))

(declare-fun m!1432287 () Bool)

(assert (=> b!1553628 m!1432287))

(declare-fun m!1432289 () Bool)

(assert (=> b!1553628 m!1432289))

(assert (=> b!1553630 m!1432289))

(declare-fun m!1432291 () Bool)

(assert (=> b!1553630 m!1432291))

(assert (=> b!1553630 m!1432289))

(declare-fun m!1432293 () Bool)

(assert (=> b!1553630 m!1432293))

(assert (=> b!1553630 m!1432291))

(declare-fun m!1432295 () Bool)

(assert (=> b!1553630 m!1432295))

(declare-fun m!1432297 () Bool)

(assert (=> b!1553630 m!1432297))

(declare-fun m!1432299 () Bool)

(assert (=> start!132438 m!1432299))

(declare-fun m!1432301 () Bool)

(assert (=> start!132438 m!1432301))

(declare-fun m!1432303 () Bool)

(assert (=> b!1553632 m!1432303))

(declare-fun m!1432305 () Bool)

(assert (=> b!1553632 m!1432305))

(declare-fun m!1432307 () Bool)

(assert (=> b!1553632 m!1432307))

(declare-fun m!1432309 () Bool)

(assert (=> b!1553632 m!1432309))

(push 1)

(assert (not b!1553628))

(assert tp_is_empty!38231)

(assert (not b!1553631))

(assert (not b!1553632))

(assert (not b!1553629))

(assert (not b!1553630))

(assert (not start!132438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161574 () Bool)

(declare-fun res!1063390 () Bool)

(declare-fun e!865031 () Bool)

(assert (=> d!161574 (=> res!1063390 e!865031)))

(assert (=> d!161574 (= res!1063390 (or (is-Nil!36227 (toList!11204 lm!249)) (is-Nil!36227 (t!50951 (toList!11204 lm!249)))))))

(assert (=> d!161574 (= (isStrictlySorted!893 (toList!11204 lm!249)) e!865031)))

(declare-fun b!1553642 () Bool)

(declare-fun e!865032 () Bool)

(assert (=> b!1553642 (= e!865031 e!865032)))

(declare-fun res!1063391 () Bool)

(assert (=> b!1553642 (=> (not res!1063391) (not e!865032))))

(assert (=> b!1553642 (= res!1063391 (bvslt (_1!12395 (h!37672 (toList!11204 lm!249))) (_1!12395 (h!37672 (t!50951 (toList!11204 lm!249))))))))

(declare-fun b!1553643 () Bool)

(assert (=> b!1553643 (= e!865032 (isStrictlySorted!893 (t!50951 (toList!11204 lm!249))))))

(assert (= (and d!161574 (not res!1063390)) b!1553642))

(assert (= (and b!1553642 res!1063391) b!1553643))

(declare-fun m!1432311 () Bool)

(assert (=> b!1553643 m!1432311))

(assert (=> b!1553632 d!161574))

(declare-fun d!161579 () Bool)

(declare-fun res!1063398 () Bool)

(declare-fun e!865039 () Bool)

(assert (=> d!161579 (=> res!1063398 e!865039)))

(assert (=> d!161579 (= res!1063398 (and (is-Cons!36226 lt!669740) (= (_1!12395 (h!37672 lt!669740)) a0!49)))))

(assert (=> d!161579 (= (containsKey!763 lt!669740 a0!49) e!865039)))

(declare-fun b!1553650 () Bool)

(declare-fun e!865040 () Bool)

(assert (=> b!1553650 (= e!865039 e!865040)))

(declare-fun res!1063399 () Bool)

(assert (=> b!1553650 (=> (not res!1063399) (not e!865040))))

(assert (=> b!1553650 (= res!1063399 (and (or (not (is-Cons!36226 lt!669740)) (bvsle (_1!12395 (h!37672 lt!669740)) a0!49)) (is-Cons!36226 lt!669740) (bvslt (_1!12395 (h!37672 lt!669740)) a0!49)))))

(declare-fun b!1553651 () Bool)

(assert (=> b!1553651 (= e!865040 (containsKey!763 (t!50951 lt!669740) a0!49))))

(assert (= (and d!161579 (not res!1063398)) b!1553650))

(assert (= (and b!1553650 res!1063399) b!1553651))

(declare-fun m!1432315 () Bool)

(assert (=> b!1553651 m!1432315))

(assert (=> b!1553632 d!161579))

(declare-fun b!1553701 () Bool)

(declare-fun res!1063420 () Bool)

(declare-fun e!865077 () Bool)

(assert (=> b!1553701 (=> (not res!1063420) (not e!865077))))

(declare-fun lt!669755 () List!36230)

(assert (=> b!1553701 (= res!1063420 (containsKey!763 lt!669755 a!523))))

(declare-fun b!1553702 () Bool)

(declare-fun e!865076 () List!36230)

(declare-fun e!865074 () List!36230)

(assert (=> b!1553702 (= e!865076 e!865074)))

(declare-fun c!143277 () Bool)

(assert (=> b!1553702 (= c!143277 (and (is-Cons!36226 (toList!11204 lm!249)) (= (_1!12395 (h!37672 (toList!11204 lm!249))) a!523)))))

(declare-fun b!1553703 () Bool)

(declare-fun call!71381 () List!36230)

(assert (=> b!1553703 (= e!865074 call!71381)))

(declare-fun e!865075 () List!36230)

(declare-fun c!143278 () Bool)

(declare-fun b!1553704 () Bool)

(assert (=> b!1553704 (= e!865075 (ite c!143277 (t!50951 (toList!11204 lm!249)) (ite c!143278 (Cons!36226 (h!37672 (toList!11204 lm!249)) (t!50951 (toList!11204 lm!249))) Nil!36227)))))

(declare-fun d!161583 () Bool)

(assert (=> d!161583 e!865077))

(declare-fun res!1063419 () Bool)

(assert (=> d!161583 (=> (not res!1063419) (not e!865077))))

(assert (=> d!161583 (= res!1063419 (isStrictlySorted!893 lt!669755))))

(assert (=> d!161583 (= lt!669755 e!865076)))

(declare-fun c!143280 () Bool)

(assert (=> d!161583 (= c!143280 (and (is-Cons!36226 (toList!11204 lm!249)) (bvslt (_1!12395 (h!37672 (toList!11204 lm!249))) a!523)))))

(assert (=> d!161583 (isStrictlySorted!893 (toList!11204 lm!249))))

(assert (=> d!161583 (= (insertStrictlySorted!509 (toList!11204 lm!249) a!523 b!96) lt!669755)))

(declare-fun bm!71377 () Bool)

(declare-fun call!71380 () List!36230)

(assert (=> bm!71377 (= call!71380 call!71381)))

(declare-fun b!1553705 () Bool)

(declare-fun e!865073 () List!36230)

(assert (=> b!1553705 (= e!865073 call!71380)))

(declare-fun b!1553706 () Bool)

(assert (=> b!1553706 (= c!143278 (and (is-Cons!36226 (toList!11204 lm!249)) (bvsgt (_1!12395 (h!37672 (toList!11204 lm!249))) a!523)))))

(assert (=> b!1553706 (= e!865074 e!865073)))

(declare-fun b!1553707 () Bool)

(assert (=> b!1553707 (= e!865073 call!71380)))

(declare-fun b!1553708 () Bool)

(declare-fun call!71382 () List!36230)

(assert (=> b!1553708 (= e!865076 call!71382)))

(declare-fun bm!71378 () Bool)

(declare-fun $colon$colon!945 (List!36230 tuple2!24768) List!36230)

(assert (=> bm!71378 (= call!71382 ($colon$colon!945 e!865075 (ite c!143280 (h!37672 (toList!11204 lm!249)) (tuple2!24769 a!523 b!96))))))

(declare-fun c!143279 () Bool)

(assert (=> bm!71378 (= c!143279 c!143280)))

(declare-fun b!1553709 () Bool)

(assert (=> b!1553709 (= e!865075 (insertStrictlySorted!509 (t!50951 (toList!11204 lm!249)) a!523 b!96))))

(declare-fun bm!71379 () Bool)

(assert (=> bm!71379 (= call!71381 call!71382)))

(declare-fun b!1553710 () Bool)

(declare-fun contains!10147 (List!36230 tuple2!24768) Bool)

(assert (=> b!1553710 (= e!865077 (contains!10147 lt!669755 (tuple2!24769 a!523 b!96)))))

(assert (= (and d!161583 c!143280) b!1553708))

(assert (= (and d!161583 (not c!143280)) b!1553702))

(assert (= (and b!1553702 c!143277) b!1553703))

(assert (= (and b!1553702 (not c!143277)) b!1553706))

(assert (= (and b!1553706 c!143278) b!1553707))

(assert (= (and b!1553706 (not c!143278)) b!1553705))

(assert (= (or b!1553707 b!1553705) bm!71377))

(assert (= (or b!1553703 bm!71377) bm!71379))

(assert (= (or b!1553708 bm!71379) bm!71378))

(assert (= (and bm!71378 c!143279) b!1553709))

(assert (= (and bm!71378 (not c!143279)) b!1553704))

(assert (= (and d!161583 res!1063419) b!1553701))

(assert (= (and b!1553701 res!1063420) b!1553710))

(declare-fun m!1432321 () Bool)

(assert (=> d!161583 m!1432321))

(assert (=> d!161583 m!1432303))

(declare-fun m!1432323 () Bool)

(assert (=> b!1553710 m!1432323))

(declare-fun m!1432325 () Bool)

(assert (=> b!1553709 m!1432325))

(declare-fun m!1432327 () Bool)

(assert (=> b!1553701 m!1432327))

(declare-fun m!1432329 () Bool)

(assert (=> bm!71378 m!1432329))

(assert (=> b!1553632 d!161583))

(declare-fun d!161593 () Bool)

(declare-fun e!865101 () Bool)

(assert (=> d!161593 e!865101))

(declare-fun res!1063434 () Bool)

(assert (=> d!161593 (=> (not res!1063434) (not e!865101))))

(assert (=> d!161593 (= res!1063434 (= (containsKey!763 (insertStrictlySorted!509 (toList!11204 lm!249) a!523 b!96) a0!49) (containsKey!763 (toList!11204 lm!249) a0!49)))))

(declare-fun lt!669760 () Unit!51753)

(declare-fun choose!2040 (List!36230 (_ BitVec 64) B!2220 (_ BitVec 64)) Unit!51753)

(assert (=> d!161593 (= lt!669760 (choose!2040 (toList!11204 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865100 () Bool)

(assert (=> d!161593 e!865100))

(declare-fun res!1063433 () Bool)

(assert (=> d!161593 (=> (not res!1063433) (not e!865100))))

(assert (=> d!161593 (= res!1063433 (isStrictlySorted!893 (toList!11204 lm!249)))))

(assert (=> d!161593 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!6 (toList!11204 lm!249) a!523 b!96 a0!49) lt!669760)))

(declare-fun b!1553747 () Bool)

(assert (=> b!1553747 (= e!865100 (not (= a!523 a0!49)))))

(declare-fun b!1553748 () Bool)

(assert (=> b!1553748 (= e!865101 (= (getValueByKey!741 (insertStrictlySorted!509 (toList!11204 lm!249) a!523 b!96) a0!49) (getValueByKey!741 (toList!11204 lm!249) a0!49)))))

(assert (= (and d!161593 res!1063433) b!1553747))

(assert (= (and d!161593 res!1063434) b!1553748))

(assert (=> d!161593 m!1432307))

(assert (=> d!161593 m!1432303))

(declare-fun m!1432335 () Bool)

(assert (=> d!161593 m!1432335))

(assert (=> d!161593 m!1432285))

(assert (=> d!161593 m!1432307))

(declare-fun m!1432337 () Bool)

(assert (=> d!161593 m!1432337))

(assert (=> b!1553748 m!1432307))

(assert (=> b!1553748 m!1432307))

(declare-fun m!1432339 () Bool)

(assert (=> b!1553748 m!1432339))

(assert (=> b!1553748 m!1432289))

(assert (=> b!1553632 d!161593))

(declare-fun d!161599 () Bool)

(declare-fun e!865116 () Bool)

(assert (=> d!161599 e!865116))

(declare-fun res!1063443 () Bool)

(assert (=> d!161599 (=> res!1063443 e!865116)))

(declare-fun lt!669770 () Bool)

(assert (=> d!161599 (= res!1063443 (not lt!669770))))

(declare-fun lt!669773 () Bool)

(assert (=> d!161599 (= lt!669770 lt!669773)))

(declare-fun lt!669772 () Unit!51753)

(declare-fun e!865115 () Unit!51753)

(assert (=> d!161599 (= lt!669772 e!865115)))

(declare-fun c!143299 () Bool)

(assert (=> d!161599 (= c!143299 lt!669773)))

(assert (=> d!161599 (= lt!669773 (containsKey!763 (toList!11204 lm!249) a0!49))))

(assert (=> d!161599 (= (contains!10146 lm!249 a0!49) lt!669770)))

(declare-fun b!1553769 () Bool)

(declare-fun lt!669771 () Unit!51753)

(assert (=> b!1553769 (= e!865115 lt!669771)))

(assert (=> b!1553769 (= lt!669771 (lemmaContainsKeyImpliesGetValueByKeyDefined!506 (toList!11204 lm!249) a0!49))))

(assert (=> b!1553769 (isDefined!554 (getValueByKey!741 (toList!11204 lm!249) a0!49))))

(declare-fun b!1553770 () Bool)

(declare-fun Unit!51755 () Unit!51753)

(assert (=> b!1553770 (= e!865115 Unit!51755)))

(declare-fun b!1553771 () Bool)

(assert (=> b!1553771 (= e!865116 (isDefined!554 (getValueByKey!741 (toList!11204 lm!249) a0!49)))))

(assert (= (and d!161599 c!143299) b!1553769))

(assert (= (and d!161599 (not c!143299)) b!1553770))

(assert (= (and d!161599 (not res!1063443)) b!1553771))

(assert (=> d!161599 m!1432285))

(assert (=> b!1553769 m!1432297))

(assert (=> b!1553769 m!1432289))

(assert (=> b!1553769 m!1432289))

(assert (=> b!1553769 m!1432293))

(assert (=> b!1553771 m!1432289))

(assert (=> b!1553771 m!1432289))

(assert (=> b!1553771 m!1432293))

(assert (=> start!132438 d!161599))

(declare-fun d!161605 () Bool)

(assert (=> d!161605 (= (inv!57313 lm!249) (isStrictlySorted!893 (toList!11204 lm!249)))))

(declare-fun bs!44658 () Bool)

(assert (= bs!44658 d!161605))

(assert (=> bs!44658 m!1432303))

(assert (=> start!132438 d!161605))

(declare-fun b!1553782 () Bool)

(declare-fun e!865122 () Option!817)

(assert (=> b!1553782 (= e!865122 (getValueByKey!741 (t!50951 lt!669740) a0!49))))

(declare-fun b!1553780 () Bool)

(declare-fun e!865121 () Option!817)

(assert (=> b!1553780 (= e!865121 (Some!816 (_2!12395 (h!37672 lt!669740))))))

(declare-fun b!1553781 () Bool)

(assert (=> b!1553781 (= e!865121 e!865122)))

(declare-fun c!143305 () Bool)

(assert (=> b!1553781 (= c!143305 (and (is-Cons!36226 lt!669740) (not (= (_1!12395 (h!37672 lt!669740)) a0!49))))))

(declare-fun b!1553783 () Bool)

(assert (=> b!1553783 (= e!865122 None!815)))

(declare-fun d!161609 () Bool)

(declare-fun c!143304 () Bool)

(assert (=> d!161609 (= c!143304 (and (is-Cons!36226 lt!669740) (= (_1!12395 (h!37672 lt!669740)) a0!49)))))

(assert (=> d!161609 (= (getValueByKey!741 lt!669740 a0!49) e!865121)))

(assert (= (and d!161609 c!143304) b!1553780))

(assert (= (and d!161609 (not c!143304)) b!1553781))

(assert (= (and b!1553781 c!143305) b!1553782))

(assert (= (and b!1553781 (not c!143305)) b!1553783))

(declare-fun m!1432355 () Bool)

(assert (=> b!1553782 m!1432355))

(assert (=> b!1553628 d!161609))

(declare-fun b!1553786 () Bool)

(declare-fun e!865124 () Option!817)

(assert (=> b!1553786 (= e!865124 (getValueByKey!741 (t!50951 (toList!11204 lm!249)) a0!49))))

(declare-fun b!1553784 () Bool)

(declare-fun e!865123 () Option!817)

(assert (=> b!1553784 (= e!865123 (Some!816 (_2!12395 (h!37672 (toList!11204 lm!249)))))))

(declare-fun b!1553785 () Bool)

(assert (=> b!1553785 (= e!865123 e!865124)))

(declare-fun c!143307 () Bool)

(assert (=> b!1553785 (= c!143307 (and (is-Cons!36226 (toList!11204 lm!249)) (not (= (_1!12395 (h!37672 (toList!11204 lm!249))) a0!49))))))

(declare-fun b!1553787 () Bool)

(assert (=> b!1553787 (= e!865124 None!815)))

(declare-fun d!161611 () Bool)

(declare-fun c!143306 () Bool)

(assert (=> d!161611 (= c!143306 (and (is-Cons!36226 (toList!11204 lm!249)) (= (_1!12395 (h!37672 (toList!11204 lm!249))) a0!49)))))

(assert (=> d!161611 (= (getValueByKey!741 (toList!11204 lm!249) a0!49) e!865123)))

(assert (= (and d!161611 c!143306) b!1553784))

(assert (= (and d!161611 (not c!143306)) b!1553785))

(assert (= (and b!1553785 c!143307) b!1553786))

(assert (= (and b!1553785 (not c!143307)) b!1553787))

(declare-fun m!1432357 () Bool)

(assert (=> b!1553786 m!1432357))

(assert (=> b!1553628 d!161611))

(declare-fun d!161613 () Bool)

(declare-fun res!1063444 () Bool)

(declare-fun e!865125 () Bool)

(assert (=> d!161613 (=> res!1063444 e!865125)))

(assert (=> d!161613 (= res!1063444 (and (is-Cons!36226 (toList!11204 lm!249)) (= (_1!12395 (h!37672 (toList!11204 lm!249))) a0!49)))))

(assert (=> d!161613 (= (containsKey!763 (toList!11204 lm!249) a0!49) e!865125)))

(declare-fun b!1553788 () Bool)

(declare-fun e!865126 () Bool)

(assert (=> b!1553788 (= e!865125 e!865126)))

(declare-fun res!1063445 () Bool)

(assert (=> b!1553788 (=> (not res!1063445) (not e!865126))))

(assert (=> b!1553788 (= res!1063445 (and (or (not (is-Cons!36226 (toList!11204 lm!249))) (bvsle (_1!12395 (h!37672 (toList!11204 lm!249))) a0!49)) (is-Cons!36226 (toList!11204 lm!249)) (bvslt (_1!12395 (h!37672 (toList!11204 lm!249))) a0!49)))))

(declare-fun b!1553789 () Bool)

(assert (=> b!1553789 (= e!865126 (containsKey!763 (t!50951 (toList!11204 lm!249)) a0!49))))

(assert (= (and d!161613 (not res!1063444)) b!1553788))

(assert (= (and b!1553788 res!1063445) b!1553789))

(declare-fun m!1432359 () Bool)

(assert (=> b!1553789 m!1432359))

(assert (=> b!1553629 d!161613))

(assert (=> b!1553630 d!161611))

(declare-fun d!161615 () Bool)

(declare-fun isEmpty!1135 (Option!817) Bool)

(assert (=> d!161615 (= (isDefined!554 (getValueByKey!741 (toList!11204 lm!249) a0!49)) (not (isEmpty!1135 (getValueByKey!741 (toList!11204 lm!249) a0!49))))))

(declare-fun bs!44659 () Bool)

(assert (= bs!44659 d!161615))

(assert (=> bs!44659 m!1432289))

(declare-fun m!1432361 () Bool)

(assert (=> bs!44659 m!1432361))

(assert (=> b!1553630 d!161615))

(declare-fun d!161617 () Bool)

(assert (=> d!161617 (isDefined!554 (getValueByKey!741 (toList!11204 lm!249) a0!49))))

(declare-fun lt!669780 () Unit!51753)

(declare-fun choose!2042 (List!36230 (_ BitVec 64)) Unit!51753)

(assert (=> d!161617 (= lt!669780 (choose!2042 (toList!11204 lm!249) a0!49))))

(declare-fun e!865139 () Bool)

(assert (=> d!161617 e!865139))

(declare-fun res!1063452 () Bool)

(assert (=> d!161617 (=> (not res!1063452) (not e!865139))))

(assert (=> d!161617 (= res!1063452 (isStrictlySorted!893 (toList!11204 lm!249)))))

(assert (=> d!161617 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!506 (toList!11204 lm!249) a0!49) lt!669780)))

(declare-fun b!1553808 () Bool)

(assert (=> b!1553808 (= e!865139 (containsKey!763 (toList!11204 lm!249) a0!49))))

(assert (= (and d!161617 res!1063452) b!1553808))

(assert (=> d!161617 m!1432289))

(assert (=> d!161617 m!1432289))

(assert (=> d!161617 m!1432293))

(declare-fun m!1432363 () Bool)

(assert (=> d!161617 m!1432363))

(assert (=> d!161617 m!1432303))

(assert (=> b!1553808 m!1432285))

(assert (=> b!1553630 d!161617))

(declare-fun d!161619 () Bool)

(declare-fun e!865143 () Bool)

(assert (=> d!161619 e!865143))

(declare-fun res!1063455 () Bool)

(assert (=> d!161619 (=> res!1063455 e!865143)))

(declare-fun lt!669782 () Bool)

(assert (=> d!161619 (= res!1063455 (not lt!669782))))

(declare-fun lt!669785 () Bool)

(assert (=> d!161619 (= lt!669782 lt!669785)))

(declare-fun lt!669784 () Unit!51753)

(declare-fun e!865142 () Unit!51753)

(assert (=> d!161619 (= lt!669784 e!865142)))

(declare-fun c!143314 () Bool)

(assert (=> d!161619 (= c!143314 lt!669785)))

(assert (=> d!161619 (= lt!669785 (containsKey!763 (toList!11204 (+!5014 lm!249 (tuple2!24769 a!523 b!96))) a0!49))))

(assert (=> d!161619 (= (contains!10146 (+!5014 lm!249 (tuple2!24769 a!523 b!96)) a0!49) lt!669782)))

(declare-fun b!1553811 () Bool)

(declare-fun lt!669783 () Unit!51753)

(assert (=> b!1553811 (= e!865142 lt!669783)))

(assert (=> b!1553811 (= lt!669783 (lemmaContainsKeyImpliesGetValueByKeyDefined!506 (toList!11204 (+!5014 lm!249 (tuple2!24769 a!523 b!96))) a0!49))))

(assert (=> b!1553811 (isDefined!554 (getValueByKey!741 (toList!11204 (+!5014 lm!249 (tuple2!24769 a!523 b!96))) a0!49))))

(declare-fun b!1553812 () Bool)

(declare-fun Unit!51757 () Unit!51753)

(assert (=> b!1553812 (= e!865142 Unit!51757)))

(declare-fun b!1553813 () Bool)

(assert (=> b!1553813 (= e!865143 (isDefined!554 (getValueByKey!741 (toList!11204 (+!5014 lm!249 (tuple2!24769 a!523 b!96))) a0!49)))))

(assert (= (and d!161619 c!143314) b!1553811))

(assert (= (and d!161619 (not c!143314)) b!1553812))

(assert (= (and d!161619 (not res!1063455)) b!1553813))

(declare-fun m!1432365 () Bool)

(assert (=> d!161619 m!1432365))

(declare-fun m!1432367 () Bool)

(assert (=> b!1553811 m!1432367))

(declare-fun m!1432369 () Bool)

(assert (=> b!1553811 m!1432369))

(assert (=> b!1553811 m!1432369))

(declare-fun m!1432371 () Bool)

(assert (=> b!1553811 m!1432371))

(assert (=> b!1553813 m!1432369))

(assert (=> b!1553813 m!1432369))

(assert (=> b!1553813 m!1432371))

(assert (=> b!1553630 d!161619))

(declare-fun d!161621 () Bool)

(declare-fun e!865165 () Bool)

(assert (=> d!161621 e!865165))

(declare-fun res!1063469 () Bool)

(assert (=> d!161621 (=> (not res!1063469) (not e!865165))))

(declare-fun lt!669795 () ListLongMap!22377)

(assert (=> d!161621 (= res!1063469 (contains!10146 lt!669795 (_1!12395 (tuple2!24769 a!523 b!96))))))

(declare-fun lt!669796 () List!36230)

(assert (=> d!161621 (= lt!669795 (ListLongMap!22378 lt!669796))))

(declare-fun lt!669798 () Unit!51753)

(declare-fun lt!669797 () Unit!51753)

(assert (=> d!161621 (= lt!669798 lt!669797)))

(assert (=> d!161621 (= (getValueByKey!741 lt!669796 (_1!12395 (tuple2!24769 a!523 b!96))) (Some!816 (_2!12395 (tuple2!24769 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!375 (List!36230 (_ BitVec 64) B!2220) Unit!51753)

(assert (=> d!161621 (= lt!669797 (lemmaContainsTupThenGetReturnValue!375 lt!669796 (_1!12395 (tuple2!24769 a!523 b!96)) (_2!12395 (tuple2!24769 a!523 b!96))))))

(assert (=> d!161621 (= lt!669796 (insertStrictlySorted!509 (toList!11204 lm!249) (_1!12395 (tuple2!24769 a!523 b!96)) (_2!12395 (tuple2!24769 a!523 b!96))))))

(assert (=> d!161621 (= (+!5014 lm!249 (tuple2!24769 a!523 b!96)) lt!669795)))

(declare-fun b!1553854 () Bool)

(declare-fun res!1063468 () Bool)

(assert (=> b!1553854 (=> (not res!1063468) (not e!865165))))

(assert (=> b!1553854 (= res!1063468 (= (getValueByKey!741 (toList!11204 lt!669795) (_1!12395 (tuple2!24769 a!523 b!96))) (Some!816 (_2!12395 (tuple2!24769 a!523 b!96)))))))

(declare-fun b!1553855 () Bool)

(assert (=> b!1553855 (= e!865165 (contains!10147 (toList!11204 lt!669795) (tuple2!24769 a!523 b!96)))))

(assert (= (and d!161621 res!1063469) b!1553854))

(assert (= (and b!1553854 res!1063468) b!1553855))

(declare-fun m!1432385 () Bool)

(assert (=> d!161621 m!1432385))

(declare-fun m!1432387 () Bool)

(assert (=> d!161621 m!1432387))

(declare-fun m!1432389 () Bool)

(assert (=> d!161621 m!1432389))

(declare-fun m!1432391 () Bool)

(assert (=> d!161621 m!1432391))

(declare-fun m!1432393 () Bool)

(assert (=> b!1553854 m!1432393))

(declare-fun m!1432395 () Bool)

(assert (=> b!1553855 m!1432395))

(assert (=> b!1553630 d!161621))

(declare-fun b!1553860 () Bool)

(declare-fun e!865168 () Bool)

(declare-fun tp!112128 () Bool)

(assert (=> b!1553860 (= e!865168 (and tp_is_empty!38231 tp!112128))))

(assert (=> b!1553631 (= tp!112125 e!865168)))

(assert (= (and b!1553631 (is-Cons!36226 (toList!11204 lm!249))) b!1553860))

(push 1)

(assert (not d!161599))

(assert (not d!161617))

(assert (not b!1553813))

(assert (not b!1553782))

(assert (not b!1553710))

(assert (not b!1553651))

(assert (not b!1553701))

(assert (not d!161605))

(assert (not b!1553860))

(assert (not b!1553854))

(assert (not b!1553808))

(assert (not b!1553811))

(assert (not d!161615))

(assert tp_is_empty!38231)

(assert (not b!1553789))

(assert (not d!161583))

(assert (not d!161593))

(assert (not b!1553748))

(assert (not b!1553769))

(assert (not b!1553643))

(assert (not b!1553786))

(assert (not b!1553855))

(assert (not d!161621))

(assert (not b!1553771))

(assert (not b!1553709))

(assert (not bm!71378))

(assert (not d!161619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

