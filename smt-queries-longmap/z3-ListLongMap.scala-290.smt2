; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4766 () Bool)

(assert start!4766)

(declare-fun b_free!1329 () Bool)

(declare-fun b_next!1329 () Bool)

(assert (=> start!4766 (= b_free!1329 (not b_next!1329))))

(declare-fun tp!5459 () Bool)

(declare-fun b_and!2187 () Bool)

(assert (=> start!4766 (= tp!5459 b_and!2187)))

(declare-fun b!36764 () Bool)

(declare-fun res!22254 () Bool)

(declare-fun e!23228 () Bool)

(assert (=> b!36764 (=> (not res!22254) (not e!23228))))

(declare-datatypes ((B!736 0))(
  ( (B!737 (val!868 Int)) )
))
(declare-datatypes ((tuple2!1396 0))(
  ( (tuple2!1397 (_1!709 (_ BitVec 64)) (_2!709 B!736)) )
))
(declare-datatypes ((List!972 0))(
  ( (Nil!969) (Cons!968 (h!1536 tuple2!1396) (t!3709 List!972)) )
))
(declare-datatypes ((ListLongMap!973 0))(
  ( (ListLongMap!974 (toList!502 List!972)) )
))
(declare-fun lm!252 () ListLongMap!973)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!453 (ListLongMap!973 (_ BitVec 64)) Bool)

(assert (=> b!36764 (= res!22254 (contains!453 lm!252 k0!388))))

(declare-fun b!36765 () Bool)

(declare-fun res!22253 () Bool)

(assert (=> b!36765 (=> (not res!22253) (not e!23228))))

(declare-fun head!840 (List!972) tuple2!1396)

(assert (=> b!36765 (= res!22253 (not (= (_1!709 (head!840 (toList!502 lm!252))) k0!388)))))

(declare-fun b!36766 () Bool)

(declare-fun e!23230 () Bool)

(declare-fun lt!13596 () ListLongMap!973)

(assert (=> b!36766 (= e!23230 (not (contains!453 lt!13596 k0!388)))))

(declare-fun b!36767 () Bool)

(declare-fun e!23229 () Bool)

(declare-fun tp!5458 () Bool)

(assert (=> b!36767 (= e!23229 tp!5458)))

(declare-fun b!36769 () Bool)

(assert (=> b!36769 (= e!23228 e!23230)))

(declare-fun res!22255 () Bool)

(assert (=> b!36769 (=> res!22255 e!23230)))

(declare-fun p!304 () Int)

(declare-fun forall!168 (List!972 Int) Bool)

(assert (=> b!36769 (= res!22255 (not (forall!168 (toList!502 lt!13596) p!304)))))

(declare-fun tail!93 (ListLongMap!973) ListLongMap!973)

(assert (=> b!36769 (= lt!13596 (tail!93 lm!252))))

(declare-fun res!22257 () Bool)

(assert (=> start!4766 (=> (not res!22257) (not e!23228))))

(assert (=> start!4766 (= res!22257 (forall!168 (toList!502 lm!252) p!304))))

(assert (=> start!4766 e!23228))

(declare-fun inv!1623 (ListLongMap!973) Bool)

(assert (=> start!4766 (and (inv!1623 lm!252) e!23229)))

(assert (=> start!4766 tp!5459))

(assert (=> start!4766 true))

(declare-fun b!36768 () Bool)

(declare-fun res!22256 () Bool)

(assert (=> b!36768 (=> (not res!22256) (not e!23228))))

(declare-fun isEmpty!191 (ListLongMap!973) Bool)

(assert (=> b!36768 (= res!22256 (not (isEmpty!191 lm!252)))))

(assert (= (and start!4766 res!22257) b!36764))

(assert (= (and b!36764 res!22254) b!36768))

(assert (= (and b!36768 res!22256) b!36765))

(assert (= (and b!36765 res!22253) b!36769))

(assert (= (and b!36769 (not res!22255)) b!36766))

(assert (= start!4766 b!36767))

(declare-fun m!29617 () Bool)

(assert (=> b!36764 m!29617))

(declare-fun m!29619 () Bool)

(assert (=> b!36768 m!29619))

(declare-fun m!29621 () Bool)

(assert (=> b!36766 m!29621))

(declare-fun m!29623 () Bool)

(assert (=> b!36769 m!29623))

(declare-fun m!29625 () Bool)

(assert (=> b!36769 m!29625))

(declare-fun m!29627 () Bool)

(assert (=> b!36765 m!29627))

(declare-fun m!29629 () Bool)

(assert (=> start!4766 m!29629))

(declare-fun m!29631 () Bool)

(assert (=> start!4766 m!29631))

(check-sat (not b_next!1329) (not start!4766) (not b!36767) (not b!36766) (not b!36765) (not b!36768) (not b!36769) (not b!36764) b_and!2187)
(check-sat b_and!2187 (not b_next!1329))
(get-model)

(declare-fun d!5559 () Bool)

(declare-fun isEmpty!195 (List!972) Bool)

(assert (=> d!5559 (= (isEmpty!191 lm!252) (isEmpty!195 (toList!502 lm!252)))))

(declare-fun bs!1410 () Bool)

(assert (= bs!1410 d!5559))

(declare-fun m!29651 () Bool)

(assert (=> bs!1410 m!29651))

(assert (=> b!36768 d!5559))

(declare-fun d!5567 () Bool)

(declare-fun res!22277 () Bool)

(declare-fun e!23244 () Bool)

(assert (=> d!5567 (=> res!22277 e!23244)))

(get-info :version)

(assert (=> d!5567 (= res!22277 ((_ is Nil!969) (toList!502 lt!13596)))))

(assert (=> d!5567 (= (forall!168 (toList!502 lt!13596) p!304) e!23244)))

(declare-fun b!36792 () Bool)

(declare-fun e!23245 () Bool)

(assert (=> b!36792 (= e!23244 e!23245)))

(declare-fun res!22278 () Bool)

(assert (=> b!36792 (=> (not res!22278) (not e!23245))))

(declare-fun dynLambda!169 (Int tuple2!1396) Bool)

(assert (=> b!36792 (= res!22278 (dynLambda!169 p!304 (h!1536 (toList!502 lt!13596))))))

(declare-fun b!36793 () Bool)

(assert (=> b!36793 (= e!23245 (forall!168 (t!3709 (toList!502 lt!13596)) p!304))))

(assert (= (and d!5567 (not res!22277)) b!36792))

(assert (= (and b!36792 res!22278) b!36793))

(declare-fun b_lambda!1785 () Bool)

(assert (=> (not b_lambda!1785) (not b!36792)))

(declare-fun t!3712 () Bool)

(declare-fun tb!725 () Bool)

(assert (=> (and start!4766 (= p!304 p!304) t!3712) tb!725))

(declare-fun result!1249 () Bool)

(assert (=> tb!725 (= result!1249 true)))

(assert (=> b!36792 t!3712))

(declare-fun b_and!2191 () Bool)

(assert (= b_and!2187 (and (=> t!3712 result!1249) b_and!2191)))

(declare-fun m!29655 () Bool)

(assert (=> b!36792 m!29655))

(declare-fun m!29657 () Bool)

(assert (=> b!36793 m!29657))

(assert (=> b!36769 d!5567))

(declare-fun d!5571 () Bool)

(declare-fun tail!95 (List!972) List!972)

(assert (=> d!5571 (= (tail!93 lm!252) (ListLongMap!974 (tail!95 (toList!502 lm!252))))))

(declare-fun bs!1412 () Bool)

(assert (= bs!1412 d!5571))

(declare-fun m!29659 () Bool)

(assert (=> bs!1412 m!29659))

(assert (=> b!36769 d!5571))

(declare-fun d!5573 () Bool)

(declare-fun e!23277 () Bool)

(assert (=> d!5573 e!23277))

(declare-fun res!22300 () Bool)

(assert (=> d!5573 (=> res!22300 e!23277)))

(declare-fun lt!13637 () Bool)

(assert (=> d!5573 (= res!22300 (not lt!13637))))

(declare-fun lt!13639 () Bool)

(assert (=> d!5573 (= lt!13637 lt!13639)))

(declare-datatypes ((Unit!830 0))(
  ( (Unit!831) )
))
(declare-fun lt!13636 () Unit!830)

(declare-fun e!23276 () Unit!830)

(assert (=> d!5573 (= lt!13636 e!23276)))

(declare-fun c!4212 () Bool)

(assert (=> d!5573 (= c!4212 lt!13639)))

(declare-fun containsKey!47 (List!972 (_ BitVec 64)) Bool)

(assert (=> d!5573 (= lt!13639 (containsKey!47 (toList!502 lm!252) k0!388))))

(assert (=> d!5573 (= (contains!453 lm!252 k0!388) lt!13637)))

(declare-fun b!36833 () Bool)

(declare-fun lt!13638 () Unit!830)

(assert (=> b!36833 (= e!23276 lt!13638)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!44 (List!972 (_ BitVec 64)) Unit!830)

(assert (=> b!36833 (= lt!13638 (lemmaContainsKeyImpliesGetValueByKeyDefined!44 (toList!502 lm!252) k0!388))))

(declare-datatypes ((Option!89 0))(
  ( (Some!88 (v!1957 B!736)) (None!87) )
))
(declare-fun isDefined!45 (Option!89) Bool)

(declare-fun getValueByKey!83 (List!972 (_ BitVec 64)) Option!89)

(assert (=> b!36833 (isDefined!45 (getValueByKey!83 (toList!502 lm!252) k0!388))))

(declare-fun b!36834 () Bool)

(declare-fun Unit!832 () Unit!830)

(assert (=> b!36834 (= e!23276 Unit!832)))

(declare-fun b!36835 () Bool)

(assert (=> b!36835 (= e!23277 (isDefined!45 (getValueByKey!83 (toList!502 lm!252) k0!388)))))

(assert (= (and d!5573 c!4212) b!36833))

(assert (= (and d!5573 (not c!4212)) b!36834))

(assert (= (and d!5573 (not res!22300)) b!36835))

(declare-fun m!29695 () Bool)

(assert (=> d!5573 m!29695))

(declare-fun m!29697 () Bool)

(assert (=> b!36833 m!29697))

(declare-fun m!29699 () Bool)

(assert (=> b!36833 m!29699))

(assert (=> b!36833 m!29699))

(declare-fun m!29701 () Bool)

(assert (=> b!36833 m!29701))

(assert (=> b!36835 m!29699))

(assert (=> b!36835 m!29699))

(assert (=> b!36835 m!29701))

(assert (=> b!36764 d!5573))

(declare-fun d!5587 () Bool)

(assert (=> d!5587 (= (head!840 (toList!502 lm!252)) (h!1536 (toList!502 lm!252)))))

(assert (=> b!36765 d!5587))

(declare-fun d!5593 () Bool)

(declare-fun res!22304 () Bool)

(declare-fun e!23282 () Bool)

(assert (=> d!5593 (=> res!22304 e!23282)))

(assert (=> d!5593 (= res!22304 ((_ is Nil!969) (toList!502 lm!252)))))

(assert (=> d!5593 (= (forall!168 (toList!502 lm!252) p!304) e!23282)))

(declare-fun b!36841 () Bool)

(declare-fun e!23283 () Bool)

(assert (=> b!36841 (= e!23282 e!23283)))

(declare-fun res!22305 () Bool)

(assert (=> b!36841 (=> (not res!22305) (not e!23283))))

(assert (=> b!36841 (= res!22305 (dynLambda!169 p!304 (h!1536 (toList!502 lm!252))))))

(declare-fun b!36842 () Bool)

(assert (=> b!36842 (= e!23283 (forall!168 (t!3709 (toList!502 lm!252)) p!304))))

(assert (= (and d!5593 (not res!22304)) b!36841))

(assert (= (and b!36841 res!22305) b!36842))

(declare-fun b_lambda!1793 () Bool)

(assert (=> (not b_lambda!1793) (not b!36841)))

(declare-fun t!3720 () Bool)

(declare-fun tb!733 () Bool)

(assert (=> (and start!4766 (= p!304 p!304) t!3720) tb!733))

(declare-fun result!1257 () Bool)

(assert (=> tb!733 (= result!1257 true)))

(assert (=> b!36841 t!3720))

(declare-fun b_and!2199 () Bool)

(assert (= b_and!2191 (and (=> t!3720 result!1257) b_and!2199)))

(declare-fun m!29719 () Bool)

(assert (=> b!36841 m!29719))

(declare-fun m!29721 () Bool)

(assert (=> b!36842 m!29721))

(assert (=> start!4766 d!5593))

(declare-fun d!5597 () Bool)

(declare-fun isStrictlySorted!179 (List!972) Bool)

(assert (=> d!5597 (= (inv!1623 lm!252) (isStrictlySorted!179 (toList!502 lm!252)))))

(declare-fun bs!1416 () Bool)

(assert (= bs!1416 d!5597))

(declare-fun m!29727 () Bool)

(assert (=> bs!1416 m!29727))

(assert (=> start!4766 d!5597))

(declare-fun d!5601 () Bool)

(declare-fun e!23290 () Bool)

(assert (=> d!5601 e!23290))

(declare-fun res!22308 () Bool)

(assert (=> d!5601 (=> res!22308 e!23290)))

(declare-fun lt!13645 () Bool)

(assert (=> d!5601 (= res!22308 (not lt!13645))))

(declare-fun lt!13647 () Bool)

(assert (=> d!5601 (= lt!13645 lt!13647)))

(declare-fun lt!13644 () Unit!830)

(declare-fun e!23289 () Unit!830)

(assert (=> d!5601 (= lt!13644 e!23289)))

(declare-fun c!4214 () Bool)

(assert (=> d!5601 (= c!4214 lt!13647)))

(assert (=> d!5601 (= lt!13647 (containsKey!47 (toList!502 lt!13596) k0!388))))

(assert (=> d!5601 (= (contains!453 lt!13596 k0!388) lt!13645)))

(declare-fun b!36850 () Bool)

(declare-fun lt!13646 () Unit!830)

(assert (=> b!36850 (= e!23289 lt!13646)))

(assert (=> b!36850 (= lt!13646 (lemmaContainsKeyImpliesGetValueByKeyDefined!44 (toList!502 lt!13596) k0!388))))

(assert (=> b!36850 (isDefined!45 (getValueByKey!83 (toList!502 lt!13596) k0!388))))

(declare-fun b!36851 () Bool)

(declare-fun Unit!835 () Unit!830)

(assert (=> b!36851 (= e!23289 Unit!835)))

(declare-fun b!36852 () Bool)

(assert (=> b!36852 (= e!23290 (isDefined!45 (getValueByKey!83 (toList!502 lt!13596) k0!388)))))

(assert (= (and d!5601 c!4214) b!36850))

(assert (= (and d!5601 (not c!4214)) b!36851))

(assert (= (and d!5601 (not res!22308)) b!36852))

(declare-fun m!29731 () Bool)

(assert (=> d!5601 m!29731))

(declare-fun m!29733 () Bool)

(assert (=> b!36850 m!29733))

(declare-fun m!29735 () Bool)

(assert (=> b!36850 m!29735))

(assert (=> b!36850 m!29735))

(declare-fun m!29737 () Bool)

(assert (=> b!36850 m!29737))

(assert (=> b!36852 m!29735))

(assert (=> b!36852 m!29735))

(assert (=> b!36852 m!29737))

(assert (=> b!36766 d!5601))

(declare-fun b!36862 () Bool)

(declare-fun e!23296 () Bool)

(declare-fun tp_is_empty!1661 () Bool)

(declare-fun tp!5474 () Bool)

(assert (=> b!36862 (= e!23296 (and tp_is_empty!1661 tp!5474))))

(assert (=> b!36767 (= tp!5458 e!23296)))

(assert (= (and b!36767 ((_ is Cons!968) (toList!502 lm!252))) b!36862))

(declare-fun b_lambda!1805 () Bool)

(assert (= b_lambda!1793 (or (and start!4766 b_free!1329) b_lambda!1805)))

(declare-fun b_lambda!1807 () Bool)

(assert (= b_lambda!1785 (or (and start!4766 b_free!1329) b_lambda!1807)))

(check-sat (not b!36835) (not b!36850) (not b_next!1329) (not d!5573) (not b_lambda!1807) (not d!5601) (not d!5559) (not d!5571) tp_is_empty!1661 (not b!36862) (not b_lambda!1805) (not b!36793) (not b!36842) (not b!36833) (not b!36852) b_and!2199 (not d!5597))
(check-sat b_and!2199 (not b_next!1329))
(get-model)

(declare-fun d!5603 () Bool)

(assert (=> d!5603 (= (tail!95 (toList!502 lm!252)) (t!3709 (toList!502 lm!252)))))

(assert (=> d!5571 d!5603))

(declare-fun d!5607 () Bool)

(declare-fun res!22309 () Bool)

(declare-fun e!23297 () Bool)

(assert (=> d!5607 (=> res!22309 e!23297)))

(assert (=> d!5607 (= res!22309 ((_ is Nil!969) (t!3709 (toList!502 lm!252))))))

(assert (=> d!5607 (= (forall!168 (t!3709 (toList!502 lm!252)) p!304) e!23297)))

(declare-fun b!36863 () Bool)

(declare-fun e!23298 () Bool)

(assert (=> b!36863 (= e!23297 e!23298)))

(declare-fun res!22310 () Bool)

(assert (=> b!36863 (=> (not res!22310) (not e!23298))))

(assert (=> b!36863 (= res!22310 (dynLambda!169 p!304 (h!1536 (t!3709 (toList!502 lm!252)))))))

(declare-fun b!36864 () Bool)

(assert (=> b!36864 (= e!23298 (forall!168 (t!3709 (t!3709 (toList!502 lm!252))) p!304))))

(assert (= (and d!5607 (not res!22309)) b!36863))

(assert (= (and b!36863 res!22310) b!36864))

(declare-fun b_lambda!1809 () Bool)

(assert (=> (not b_lambda!1809) (not b!36863)))

(declare-fun t!3724 () Bool)

(declare-fun tb!737 () Bool)

(assert (=> (and start!4766 (= p!304 p!304) t!3724) tb!737))

(declare-fun result!1267 () Bool)

(assert (=> tb!737 (= result!1267 true)))

(assert (=> b!36863 t!3724))

(declare-fun b_and!2203 () Bool)

(assert (= b_and!2199 (and (=> t!3724 result!1267) b_and!2203)))

(declare-fun m!29739 () Bool)

(assert (=> b!36863 m!29739))

(declare-fun m!29741 () Bool)

(assert (=> b!36864 m!29741))

(assert (=> b!36842 d!5607))

(declare-fun d!5609 () Bool)

(assert (=> d!5609 (= (isEmpty!195 (toList!502 lm!252)) ((_ is Nil!969) (toList!502 lm!252)))))

(assert (=> d!5559 d!5609))

(declare-fun d!5613 () Bool)

(declare-fun res!22321 () Bool)

(declare-fun e!23313 () Bool)

(assert (=> d!5613 (=> res!22321 e!23313)))

(assert (=> d!5613 (= res!22321 (or ((_ is Nil!969) (toList!502 lm!252)) ((_ is Nil!969) (t!3709 (toList!502 lm!252)))))))

(assert (=> d!5613 (= (isStrictlySorted!179 (toList!502 lm!252)) e!23313)))

(declare-fun b!36883 () Bool)

(declare-fun e!23314 () Bool)

(assert (=> b!36883 (= e!23313 e!23314)))

(declare-fun res!22322 () Bool)

(assert (=> b!36883 (=> (not res!22322) (not e!23314))))

(assert (=> b!36883 (= res!22322 (bvslt (_1!709 (h!1536 (toList!502 lm!252))) (_1!709 (h!1536 (t!3709 (toList!502 lm!252))))))))

(declare-fun b!36884 () Bool)

(assert (=> b!36884 (= e!23314 (isStrictlySorted!179 (t!3709 (toList!502 lm!252))))))

(assert (= (and d!5613 (not res!22321)) b!36883))

(assert (= (and b!36883 res!22322) b!36884))

(declare-fun m!29747 () Bool)

(assert (=> b!36884 m!29747))

(assert (=> d!5597 d!5613))

(declare-fun d!5617 () Bool)

(assert (=> d!5617 (isDefined!45 (getValueByKey!83 (toList!502 lm!252) k0!388))))

(declare-fun lt!13653 () Unit!830)

(declare-fun choose!227 (List!972 (_ BitVec 64)) Unit!830)

(assert (=> d!5617 (= lt!13653 (choose!227 (toList!502 lm!252) k0!388))))

(declare-fun e!23326 () Bool)

(assert (=> d!5617 e!23326))

(declare-fun res!22332 () Bool)

(assert (=> d!5617 (=> (not res!22332) (not e!23326))))

(assert (=> d!5617 (= res!22332 (isStrictlySorted!179 (toList!502 lm!252)))))

(assert (=> d!5617 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!44 (toList!502 lm!252) k0!388) lt!13653)))

(declare-fun b!36898 () Bool)

(assert (=> b!36898 (= e!23326 (containsKey!47 (toList!502 lm!252) k0!388))))

(assert (= (and d!5617 res!22332) b!36898))

(assert (=> d!5617 m!29699))

(assert (=> d!5617 m!29699))

(assert (=> d!5617 m!29701))

(declare-fun m!29763 () Bool)

(assert (=> d!5617 m!29763))

(assert (=> d!5617 m!29727))

(assert (=> b!36898 m!29695))

(assert (=> b!36833 d!5617))

(declare-fun d!5633 () Bool)

(declare-fun isEmpty!198 (Option!89) Bool)

(assert (=> d!5633 (= (isDefined!45 (getValueByKey!83 (toList!502 lm!252) k0!388)) (not (isEmpty!198 (getValueByKey!83 (toList!502 lm!252) k0!388))))))

(declare-fun bs!1421 () Bool)

(assert (= bs!1421 d!5633))

(assert (=> bs!1421 m!29699))

(declare-fun m!29769 () Bool)

(assert (=> bs!1421 m!29769))

(assert (=> b!36833 d!5633))

(declare-fun b!36940 () Bool)

(declare-fun e!23355 () Option!89)

(assert (=> b!36940 (= e!23355 (getValueByKey!83 (t!3709 (toList!502 lm!252)) k0!388))))

(declare-fun b!36941 () Bool)

(assert (=> b!36941 (= e!23355 None!87)))

(declare-fun d!5641 () Bool)

(declare-fun c!4233 () Bool)

(assert (=> d!5641 (= c!4233 (and ((_ is Cons!968) (toList!502 lm!252)) (= (_1!709 (h!1536 (toList!502 lm!252))) k0!388)))))

(declare-fun e!23354 () Option!89)

(assert (=> d!5641 (= (getValueByKey!83 (toList!502 lm!252) k0!388) e!23354)))

(declare-fun b!36939 () Bool)

(assert (=> b!36939 (= e!23354 e!23355)))

(declare-fun c!4234 () Bool)

(assert (=> b!36939 (= c!4234 (and ((_ is Cons!968) (toList!502 lm!252)) (not (= (_1!709 (h!1536 (toList!502 lm!252))) k0!388))))))

(declare-fun b!36938 () Bool)

(assert (=> b!36938 (= e!23354 (Some!88 (_2!709 (h!1536 (toList!502 lm!252)))))))

(assert (= (and d!5641 c!4233) b!36938))

(assert (= (and d!5641 (not c!4233)) b!36939))

(assert (= (and b!36939 c!4234) b!36940))

(assert (= (and b!36939 (not c!4234)) b!36941))

(declare-fun m!29783 () Bool)

(assert (=> b!36940 m!29783))

(assert (=> b!36833 d!5641))

(assert (=> b!36835 d!5633))

(assert (=> b!36835 d!5641))

(declare-fun d!5653 () Bool)

(declare-fun res!22350 () Bool)

(declare-fun e!23359 () Bool)

(assert (=> d!5653 (=> res!22350 e!23359)))

(assert (=> d!5653 (= res!22350 ((_ is Nil!969) (t!3709 (toList!502 lt!13596))))))

(assert (=> d!5653 (= (forall!168 (t!3709 (toList!502 lt!13596)) p!304) e!23359)))

(declare-fun b!36945 () Bool)

(declare-fun e!23360 () Bool)

(assert (=> b!36945 (= e!23359 e!23360)))

(declare-fun res!22351 () Bool)

(assert (=> b!36945 (=> (not res!22351) (not e!23360))))

(assert (=> b!36945 (= res!22351 (dynLambda!169 p!304 (h!1536 (t!3709 (toList!502 lt!13596)))))))

(declare-fun b!36946 () Bool)

(assert (=> b!36946 (= e!23360 (forall!168 (t!3709 (t!3709 (toList!502 lt!13596))) p!304))))

(assert (= (and d!5653 (not res!22350)) b!36945))

(assert (= (and b!36945 res!22351) b!36946))

(declare-fun b_lambda!1821 () Bool)

(assert (=> (not b_lambda!1821) (not b!36945)))

(declare-fun t!3732 () Bool)

(declare-fun tb!745 () Bool)

(assert (=> (and start!4766 (= p!304 p!304) t!3732) tb!745))

(declare-fun result!1275 () Bool)

(assert (=> tb!745 (= result!1275 true)))

(assert (=> b!36945 t!3732))

(declare-fun b_and!2211 () Bool)

(assert (= b_and!2203 (and (=> t!3732 result!1275) b_and!2211)))

(declare-fun m!29789 () Bool)

(assert (=> b!36945 m!29789))

(declare-fun m!29791 () Bool)

(assert (=> b!36946 m!29791))

(assert (=> b!36793 d!5653))

(declare-fun d!5657 () Bool)

(declare-fun res!22362 () Bool)

(declare-fun e!23371 () Bool)

(assert (=> d!5657 (=> res!22362 e!23371)))

(assert (=> d!5657 (= res!22362 (and ((_ is Cons!968) (toList!502 lt!13596)) (= (_1!709 (h!1536 (toList!502 lt!13596))) k0!388)))))

(assert (=> d!5657 (= (containsKey!47 (toList!502 lt!13596) k0!388) e!23371)))

(declare-fun b!36957 () Bool)

(declare-fun e!23372 () Bool)

(assert (=> b!36957 (= e!23371 e!23372)))

(declare-fun res!22363 () Bool)

(assert (=> b!36957 (=> (not res!22363) (not e!23372))))

(assert (=> b!36957 (= res!22363 (and (or (not ((_ is Cons!968) (toList!502 lt!13596))) (bvsle (_1!709 (h!1536 (toList!502 lt!13596))) k0!388)) ((_ is Cons!968) (toList!502 lt!13596)) (bvslt (_1!709 (h!1536 (toList!502 lt!13596))) k0!388)))))

(declare-fun b!36958 () Bool)

(assert (=> b!36958 (= e!23372 (containsKey!47 (t!3709 (toList!502 lt!13596)) k0!388))))

(assert (= (and d!5657 (not res!22362)) b!36957))

(assert (= (and b!36957 res!22363) b!36958))

(declare-fun m!29795 () Bool)

(assert (=> b!36958 m!29795))

(assert (=> d!5601 d!5657))

(declare-fun d!5663 () Bool)

(assert (=> d!5663 (isDefined!45 (getValueByKey!83 (toList!502 lt!13596) k0!388))))

(declare-fun lt!13655 () Unit!830)

(assert (=> d!5663 (= lt!13655 (choose!227 (toList!502 lt!13596) k0!388))))

(declare-fun e!23375 () Bool)

(assert (=> d!5663 e!23375))

(declare-fun res!22366 () Bool)

(assert (=> d!5663 (=> (not res!22366) (not e!23375))))

(assert (=> d!5663 (= res!22366 (isStrictlySorted!179 (toList!502 lt!13596)))))

(assert (=> d!5663 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!44 (toList!502 lt!13596) k0!388) lt!13655)))

(declare-fun b!36961 () Bool)

(assert (=> b!36961 (= e!23375 (containsKey!47 (toList!502 lt!13596) k0!388))))

(assert (= (and d!5663 res!22366) b!36961))

(assert (=> d!5663 m!29735))

(assert (=> d!5663 m!29735))

(assert (=> d!5663 m!29737))

(declare-fun m!29797 () Bool)

(assert (=> d!5663 m!29797))

(declare-fun m!29799 () Bool)

(assert (=> d!5663 m!29799))

(assert (=> b!36961 m!29731))

(assert (=> b!36850 d!5663))

(declare-fun d!5665 () Bool)

(assert (=> d!5665 (= (isDefined!45 (getValueByKey!83 (toList!502 lt!13596) k0!388)) (not (isEmpty!198 (getValueByKey!83 (toList!502 lt!13596) k0!388))))))

(declare-fun bs!1422 () Bool)

(assert (= bs!1422 d!5665))

(assert (=> bs!1422 m!29735))

(declare-fun m!29801 () Bool)

(assert (=> bs!1422 m!29801))

(assert (=> b!36850 d!5665))

(declare-fun b!36965 () Bool)

(declare-fun e!23378 () Option!89)

(assert (=> b!36965 (= e!23378 (getValueByKey!83 (t!3709 (toList!502 lt!13596)) k0!388))))

(declare-fun b!36966 () Bool)

(assert (=> b!36966 (= e!23378 None!87)))

(declare-fun d!5667 () Bool)

(declare-fun c!4235 () Bool)

(assert (=> d!5667 (= c!4235 (and ((_ is Cons!968) (toList!502 lt!13596)) (= (_1!709 (h!1536 (toList!502 lt!13596))) k0!388)))))

(declare-fun e!23377 () Option!89)

(assert (=> d!5667 (= (getValueByKey!83 (toList!502 lt!13596) k0!388) e!23377)))

(declare-fun b!36964 () Bool)

(assert (=> b!36964 (= e!23377 e!23378)))

(declare-fun c!4236 () Bool)

(assert (=> b!36964 (= c!4236 (and ((_ is Cons!968) (toList!502 lt!13596)) (not (= (_1!709 (h!1536 (toList!502 lt!13596))) k0!388))))))

(declare-fun b!36963 () Bool)

(assert (=> b!36963 (= e!23377 (Some!88 (_2!709 (h!1536 (toList!502 lt!13596)))))))

(assert (= (and d!5667 c!4235) b!36963))

(assert (= (and d!5667 (not c!4235)) b!36964))

(assert (= (and b!36964 c!4236) b!36965))

(assert (= (and b!36964 (not c!4236)) b!36966))

(declare-fun m!29809 () Bool)

(assert (=> b!36965 m!29809))

(assert (=> b!36850 d!5667))

(declare-fun d!5673 () Bool)

(declare-fun res!22368 () Bool)

(declare-fun e!23381 () Bool)

(assert (=> d!5673 (=> res!22368 e!23381)))

(assert (=> d!5673 (= res!22368 (and ((_ is Cons!968) (toList!502 lm!252)) (= (_1!709 (h!1536 (toList!502 lm!252))) k0!388)))))

(assert (=> d!5673 (= (containsKey!47 (toList!502 lm!252) k0!388) e!23381)))

(declare-fun b!36971 () Bool)

(declare-fun e!23382 () Bool)

(assert (=> b!36971 (= e!23381 e!23382)))

(declare-fun res!22369 () Bool)

(assert (=> b!36971 (=> (not res!22369) (not e!23382))))

(assert (=> b!36971 (= res!22369 (and (or (not ((_ is Cons!968) (toList!502 lm!252))) (bvsle (_1!709 (h!1536 (toList!502 lm!252))) k0!388)) ((_ is Cons!968) (toList!502 lm!252)) (bvslt (_1!709 (h!1536 (toList!502 lm!252))) k0!388)))))

(declare-fun b!36972 () Bool)

(assert (=> b!36972 (= e!23382 (containsKey!47 (t!3709 (toList!502 lm!252)) k0!388))))

(assert (= (and d!5673 (not res!22368)) b!36971))

(assert (= (and b!36971 res!22369) b!36972))

(declare-fun m!29813 () Bool)

(assert (=> b!36972 m!29813))

(assert (=> d!5573 d!5673))

(assert (=> b!36852 d!5665))

(assert (=> b!36852 d!5667))

(declare-fun b!36975 () Bool)

(declare-fun e!23385 () Bool)

(declare-fun tp!5476 () Bool)

(assert (=> b!36975 (= e!23385 (and tp_is_empty!1661 tp!5476))))

(assert (=> b!36862 (= tp!5474 e!23385)))

(assert (= (and b!36862 ((_ is Cons!968) (t!3709 (toList!502 lm!252)))) b!36975))

(declare-fun b_lambda!1823 () Bool)

(assert (= b_lambda!1809 (or (and start!4766 b_free!1329) b_lambda!1823)))

(declare-fun b_lambda!1825 () Bool)

(assert (= b_lambda!1821 (or (and start!4766 b_free!1329) b_lambda!1825)))

(check-sat (not b!36958) (not b!36898) (not b_next!1329) (not b!36965) (not b_lambda!1807) b_and!2211 (not d!5633) (not d!5665) (not b!36972) (not b!36946) (not b!36864) (not b_lambda!1825) (not d!5663) (not b!36961) (not b!36975) (not b!36940) (not d!5617) (not b_lambda!1823) tp_is_empty!1661 (not b!36884) (not b_lambda!1805))
