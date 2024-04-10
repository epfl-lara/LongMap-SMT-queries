; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4764 () Bool)

(assert start!4764)

(declare-fun b_free!1327 () Bool)

(declare-fun b_next!1327 () Bool)

(assert (=> start!4764 (= b_free!1327 (not b_next!1327))))

(declare-fun tp!5452 () Bool)

(declare-fun b_and!2185 () Bool)

(assert (=> start!4764 (= tp!5452 b_and!2185)))

(declare-fun b!36746 () Bool)

(declare-fun e!23219 () Bool)

(declare-datatypes ((B!734 0))(
  ( (B!735 (val!867 Int)) )
))
(declare-datatypes ((tuple2!1394 0))(
  ( (tuple2!1395 (_1!708 (_ BitVec 64)) (_2!708 B!734)) )
))
(declare-datatypes ((List!971 0))(
  ( (Nil!968) (Cons!967 (h!1535 tuple2!1394) (t!3708 List!971)) )
))
(declare-datatypes ((ListLongMap!971 0))(
  ( (ListLongMap!972 (toList!501 List!971)) )
))
(declare-fun lt!13593 () ListLongMap!971)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!452 (ListLongMap!971 (_ BitVec 64)) Bool)

(assert (=> b!36746 (= e!23219 (not (contains!452 lt!13593 k!388)))))

(declare-fun res!22238 () Bool)

(declare-fun e!23220 () Bool)

(assert (=> start!4764 (=> (not res!22238) (not e!23220))))

(declare-fun lm!252 () ListLongMap!971)

(declare-fun p!304 () Int)

(declare-fun forall!167 (List!971 Int) Bool)

(assert (=> start!4764 (= res!22238 (forall!167 (toList!501 lm!252) p!304))))

(assert (=> start!4764 e!23220))

(declare-fun e!23221 () Bool)

(declare-fun inv!1622 (ListLongMap!971) Bool)

(assert (=> start!4764 (and (inv!1622 lm!252) e!23221)))

(assert (=> start!4764 tp!5452))

(assert (=> start!4764 true))

(declare-fun b!36747 () Bool)

(assert (=> b!36747 (= e!23220 e!23219)))

(declare-fun res!22239 () Bool)

(assert (=> b!36747 (=> res!22239 e!23219)))

(assert (=> b!36747 (= res!22239 (not (forall!167 (toList!501 lt!13593) p!304)))))

(declare-fun tail!92 (ListLongMap!971) ListLongMap!971)

(assert (=> b!36747 (= lt!13593 (tail!92 lm!252))))

(declare-fun b!36748 () Bool)

(declare-fun res!22240 () Bool)

(assert (=> b!36748 (=> (not res!22240) (not e!23220))))

(assert (=> b!36748 (= res!22240 (contains!452 lm!252 k!388))))

(declare-fun b!36749 () Bool)

(declare-fun res!22242 () Bool)

(assert (=> b!36749 (=> (not res!22242) (not e!23220))))

(declare-fun head!839 (List!971) tuple2!1394)

(assert (=> b!36749 (= res!22242 (not (= (_1!708 (head!839 (toList!501 lm!252))) k!388)))))

(declare-fun b!36750 () Bool)

(declare-fun tp!5453 () Bool)

(assert (=> b!36750 (= e!23221 tp!5453)))

(declare-fun b!36751 () Bool)

(declare-fun res!22241 () Bool)

(assert (=> b!36751 (=> (not res!22241) (not e!23220))))

(declare-fun isEmpty!190 (ListLongMap!971) Bool)

(assert (=> b!36751 (= res!22241 (not (isEmpty!190 lm!252)))))

(assert (= (and start!4764 res!22238) b!36748))

(assert (= (and b!36748 res!22240) b!36751))

(assert (= (and b!36751 res!22241) b!36749))

(assert (= (and b!36749 res!22242) b!36747))

(assert (= (and b!36747 (not res!22239)) b!36746))

(assert (= start!4764 b!36750))

(declare-fun m!29601 () Bool)

(assert (=> start!4764 m!29601))

(declare-fun m!29603 () Bool)

(assert (=> start!4764 m!29603))

(declare-fun m!29605 () Bool)

(assert (=> b!36751 m!29605))

(declare-fun m!29607 () Bool)

(assert (=> b!36748 m!29607))

(declare-fun m!29609 () Bool)

(assert (=> b!36747 m!29609))

(declare-fun m!29611 () Bool)

(assert (=> b!36747 m!29611))

(declare-fun m!29613 () Bool)

(assert (=> b!36749 m!29613))

(declare-fun m!29615 () Bool)

(assert (=> b!36746 m!29615))

(push 1)

(assert (not b!36749))

(assert (not b!36747))

(assert (not b_next!1327))

(assert (not b!36750))

(assert (not b!36748))

(assert b_and!2185)

(assert (not b!36746))

(assert (not start!4764))

(assert (not b!36751))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2185)

(assert (not b_next!1327))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5563 () Bool)

(assert (=> d!5563 (= (head!839 (toList!501 lm!252)) (h!1535 (toList!501 lm!252)))))

(assert (=> b!36749 d!5563))

(declare-fun d!5565 () Bool)

(declare-fun isEmpty!194 (List!971) Bool)

(assert (=> d!5565 (= (isEmpty!190 lm!252) (isEmpty!194 (toList!501 lm!252)))))

(declare-fun bs!1411 () Bool)

(assert (= bs!1411 d!5565))

(declare-fun m!29653 () Bool)

(assert (=> bs!1411 m!29653))

(assert (=> b!36751 d!5565))

(declare-fun d!5569 () Bool)

(declare-fun e!23260 () Bool)

(assert (=> d!5569 e!23260))

(declare-fun res!22288 () Bool)

(assert (=> d!5569 (=> res!22288 e!23260)))

(declare-fun lt!13622 () Bool)

(assert (=> d!5569 (= res!22288 (not lt!13622))))

(declare-fun lt!13621 () Bool)

(assert (=> d!5569 (= lt!13622 lt!13621)))

(declare-datatypes ((Unit!826 0))(
  ( (Unit!827) )
))
(declare-fun lt!13620 () Unit!826)

(declare-fun e!23261 () Unit!826)

(assert (=> d!5569 (= lt!13620 e!23261)))

(declare-fun c!4208 () Bool)

(assert (=> d!5569 (= c!4208 lt!13621)))

(declare-fun containsKey!46 (List!971 (_ BitVec 64)) Bool)

(assert (=> d!5569 (= lt!13621 (containsKey!46 (toList!501 lt!13593) k!388))))

(assert (=> d!5569 (= (contains!452 lt!13593 k!388) lt!13622)))

(declare-fun b!36813 () Bool)

(declare-fun lt!13623 () Unit!826)

(assert (=> b!36813 (= e!23261 lt!13623)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!43 (List!971 (_ BitVec 64)) Unit!826)

(assert (=> b!36813 (= lt!13623 (lemmaContainsKeyImpliesGetValueByKeyDefined!43 (toList!501 lt!13593) k!388))))

(declare-datatypes ((Option!88 0))(
  ( (Some!87 (v!1956 B!734)) (None!86) )
))
(declare-fun isDefined!44 (Option!88) Bool)

(declare-fun getValueByKey!82 (List!971 (_ BitVec 64)) Option!88)

(assert (=> b!36813 (isDefined!44 (getValueByKey!82 (toList!501 lt!13593) k!388))))

(declare-fun b!36814 () Bool)

(declare-fun Unit!829 () Unit!826)

(assert (=> b!36814 (= e!23261 Unit!829)))

(declare-fun b!36815 () Bool)

(assert (=> b!36815 (= e!23260 (isDefined!44 (getValueByKey!82 (toList!501 lt!13593) k!388)))))

(assert (= (and d!5569 c!4208) b!36813))

(assert (= (and d!5569 (not c!4208)) b!36814))

(assert (= (and d!5569 (not res!22288)) b!36815))

(declare-fun m!29669 () Bool)

(assert (=> d!5569 m!29669))

(declare-fun m!29671 () Bool)

(assert (=> b!36813 m!29671))

(declare-fun m!29673 () Bool)

(assert (=> b!36813 m!29673))

(assert (=> b!36813 m!29673))

(declare-fun m!29675 () Bool)

(assert (=> b!36813 m!29675))

(assert (=> b!36815 m!29673))

(assert (=> b!36815 m!29673))

(assert (=> b!36815 m!29675))

(assert (=> b!36746 d!5569))

(declare-fun d!5577 () Bool)

(declare-fun res!22297 () Bool)

(declare-fun e!23272 () Bool)

(assert (=> d!5577 (=> res!22297 e!23272)))

(assert (=> d!5577 (= res!22297 (is-Nil!968 (toList!501 lt!13593)))))

(assert (=> d!5577 (= (forall!167 (toList!501 lt!13593) p!304) e!23272)))

(declare-fun b!36828 () Bool)

(declare-fun e!23273 () Bool)

(assert (=> b!36828 (= e!23272 e!23273)))

(declare-fun res!22298 () Bool)

(assert (=> b!36828 (=> (not res!22298) (not e!23273))))

(declare-fun dynLambda!170 (Int tuple2!1394) Bool)

(assert (=> b!36828 (= res!22298 (dynLambda!170 p!304 (h!1535 (toList!501 lt!13593))))))

(declare-fun b!36829 () Bool)

(assert (=> b!36829 (= e!23273 (forall!167 (t!3708 (toList!501 lt!13593)) p!304))))

(assert (= (and d!5577 (not res!22297)) b!36828))

(assert (= (and b!36828 res!22298) b!36829))

(declare-fun b_lambda!1789 () Bool)

(assert (=> (not b_lambda!1789) (not b!36828)))

(declare-fun t!3716 () Bool)

(declare-fun tb!729 () Bool)

(assert (=> (and start!4764 (= p!304 p!304) t!3716) tb!729))

(declare-fun result!1253 () Bool)

(assert (=> tb!729 (= result!1253 true)))

(assert (=> b!36828 t!3716))

(declare-fun b_and!2195 () Bool)

(assert (= b_and!2185 (and (=> t!3716 result!1253) b_and!2195)))

(declare-fun m!29685 () Bool)

(assert (=> b!36828 m!29685))

(declare-fun m!29689 () Bool)

(assert (=> b!36829 m!29689))

(assert (=> b!36747 d!5577))

(declare-fun d!5583 () Bool)

(declare-fun tail!96 (List!971) List!971)

(assert (=> d!5583 (= (tail!92 lm!252) (ListLongMap!972 (tail!96 (toList!501 lm!252))))))

(declare-fun bs!1414 () Bool)

(assert (= bs!1414 d!5583))

(declare-fun m!29707 () Bool)

(assert (=> bs!1414 m!29707))

(assert (=> b!36747 d!5583))

(declare-fun d!5591 () Bool)

(declare-fun e!23280 () Bool)

(assert (=> d!5591 e!23280))

(declare-fun res!22303 () Bool)

(assert (=> d!5591 (=> res!22303 e!23280)))

(declare-fun lt!13642 () Bool)

(assert (=> d!5591 (= res!22303 (not lt!13642))))

(declare-fun lt!13641 () Bool)

(assert (=> d!5591 (= lt!13642 lt!13641)))

(declare-fun lt!13640 () Unit!826)

(declare-fun e!23281 () Unit!826)

(assert (=> d!5591 (= lt!13640 e!23281)))

(declare-fun c!4213 () Bool)

(assert (=> d!5591 (= c!4213 lt!13641)))

(assert (=> d!5591 (= lt!13641 (containsKey!46 (toList!501 lm!252) k!388))))

(assert (=> d!5591 (= (contains!452 lm!252 k!388) lt!13642)))

(declare-fun b!36838 () Bool)

(declare-fun lt!13643 () Unit!826)

(assert (=> b!36838 (= e!23281 lt!13643)))

(assert (=> b!36838 (= lt!13643 (lemmaContainsKeyImpliesGetValueByKeyDefined!43 (toList!501 lm!252) k!388))))

(assert (=> b!36838 (isDefined!44 (getValueByKey!82 (toList!501 lm!252) k!388))))

(declare-fun b!36839 () Bool)

(declare-fun Unit!833 () Unit!826)

(assert (=> b!36839 (= e!23281 Unit!833)))

(declare-fun b!36840 () Bool)

(assert (=> b!36840 (= e!23280 (isDefined!44 (getValueByKey!82 (toList!501 lm!252) k!388)))))

(assert (= (and d!5591 c!4213) b!36838))

(assert (= (and d!5591 (not c!4213)) b!36839))

(assert (= (and d!5591 (not res!22303)) b!36840))

(declare-fun m!29709 () Bool)

(assert (=> d!5591 m!29709))

(declare-fun m!29711 () Bool)

(assert (=> b!36838 m!29711))

(declare-fun m!29713 () Bool)

(assert (=> b!36838 m!29713))

(assert (=> b!36838 m!29713))

(declare-fun m!29715 () Bool)

(assert (=> b!36838 m!29715))

(assert (=> b!36840 m!29713))

(assert (=> b!36840 m!29713))

(assert (=> b!36840 m!29715))

(assert (=> b!36748 d!5591))

(declare-fun d!5595 () Bool)

(declare-fun res!22306 () Bool)

(declare-fun e!23284 () Bool)

(assert (=> d!5595 (=> res!22306 e!23284)))

(assert (=> d!5595 (= res!22306 (is-Nil!968 (toList!501 lm!252)))))

(assert (=> d!5595 (= (forall!167 (toList!501 lm!252) p!304) e!23284)))

(declare-fun b!36843 () Bool)

(declare-fun e!23285 () Bool)

(assert (=> b!36843 (= e!23284 e!23285)))

(declare-fun res!22307 () Bool)

(assert (=> b!36843 (=> (not res!22307) (not e!23285))))

(assert (=> b!36843 (= res!22307 (dynLambda!170 p!304 (h!1535 (toList!501 lm!252))))))

(declare-fun b!36844 () Bool)

(assert (=> b!36844 (= e!23285 (forall!167 (t!3708 (toList!501 lm!252)) p!304))))

(assert (= (and d!5595 (not res!22306)) b!36843))

(assert (= (and b!36843 res!22307) b!36844))

(declare-fun b_lambda!1795 () Bool)

(assert (=> (not b_lambda!1795) (not b!36843)))

(declare-fun t!3722 () Bool)

(declare-fun tb!735 () Bool)

(assert (=> (and start!4764 (= p!304 p!304) t!3722) tb!735))

(declare-fun result!1261 () Bool)

(assert (=> tb!735 (= result!1261 true)))

(assert (=> b!36843 t!3722))

(declare-fun b_and!2201 () Bool)

(assert (= b_and!2195 (and (=> t!3722 result!1261) b_and!2201)))

(declare-fun m!29723 () Bool)

(assert (=> b!36843 m!29723))

(declare-fun m!29725 () Bool)

(assert (=> b!36844 m!29725))

(assert (=> start!4764 d!5595))

(declare-fun d!5599 () Bool)

(declare-fun isStrictlySorted!180 (List!971) Bool)

(assert (=> d!5599 (= (inv!1622 lm!252) (isStrictlySorted!180 (toList!501 lm!252)))))

(declare-fun bs!1417 () Bool)

(assert (= bs!1417 d!5599))

(declare-fun m!29729 () Bool)

(assert (=> bs!1417 m!29729))

(assert (=> start!4764 d!5599))

(declare-fun b!36859 () Bool)

(declare-fun e!23293 () Bool)

(declare-fun tp_is_empty!1659 () Bool)

(declare-fun tp!5471 () Bool)

(assert (=> b!36859 (= e!23293 (and tp_is_empty!1659 tp!5471))))

(assert (=> b!36750 (= tp!5453 e!23293)))

(assert (= (and b!36750 (is-Cons!967 (toList!501 lm!252))) b!36859))

(declare-fun b_lambda!1801 () Bool)

(assert (= b_lambda!1795 (or (and start!4764 b_free!1327) b_lambda!1801)))

(declare-fun b_lambda!1803 () Bool)

(assert (= b_lambda!1789 (or (and start!4764 b_free!1327) b_lambda!1803)))

(push 1)

(assert (not b!36838))

(assert (not b!36829))

(assert (not b!36844))

(assert (not d!5569))

(assert (not b!36859))

(assert (not b_next!1327))

(assert tp_is_empty!1659)

(assert (not b!36813))

(assert b_and!2201)

(assert (not b!36840))

(assert (not b_lambda!1801))

(assert (not b!36815))

(assert (not d!5599))

(assert (not b_lambda!1803))

(assert (not d!5565))

(assert (not d!5591))

(assert (not d!5583))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2201)

(assert (not b_next!1327))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5605 () Bool)

(declare-fun res!22315 () Bool)

(declare-fun e!23303 () Bool)

(assert (=> d!5605 (=> res!22315 e!23303)))

(assert (=> d!5605 (= res!22315 (or (is-Nil!968 (toList!501 lm!252)) (is-Nil!968 (t!3708 (toList!501 lm!252)))))))

(assert (=> d!5605 (= (isStrictlySorted!180 (toList!501 lm!252)) e!23303)))

(declare-fun b!36869 () Bool)

(declare-fun e!23304 () Bool)

(assert (=> b!36869 (= e!23303 e!23304)))

(declare-fun res!22316 () Bool)

(assert (=> b!36869 (=> (not res!22316) (not e!23304))))

(assert (=> b!36869 (= res!22316 (bvslt (_1!708 (h!1535 (toList!501 lm!252))) (_1!708 (h!1535 (t!3708 (toList!501 lm!252))))))))

(declare-fun b!36870 () Bool)

(assert (=> b!36870 (= e!23304 (isStrictlySorted!180 (t!3708 (toList!501 lm!252))))))

(assert (= (and d!5605 (not res!22315)) b!36869))

(assert (= (and b!36869 res!22316) b!36870))

(declare-fun m!29743 () Bool)

(assert (=> b!36870 m!29743))

(assert (=> d!5599 d!5605))

(declare-fun d!5611 () Bool)

(declare-fun isEmpty!196 (Option!88) Bool)

(assert (=> d!5611 (= (isDefined!44 (getValueByKey!82 (toList!501 lt!13593) k!388)) (not (isEmpty!196 (getValueByKey!82 (toList!501 lt!13593) k!388))))))

(declare-fun bs!1418 () Bool)

(assert (= bs!1418 d!5611))

(assert (=> bs!1418 m!29673))

(declare-fun m!29745 () Bool)

(assert (=> bs!1418 m!29745))

(assert (=> b!36815 d!5611))

(declare-fun b!36885 () Bool)

(declare-fun e!23315 () Option!88)

(assert (=> b!36885 (= e!23315 (Some!87 (_2!708 (h!1535 (toList!501 lt!13593)))))))

(declare-fun b!36888 () Bool)

(declare-fun e!23316 () Option!88)

(assert (=> b!36888 (= e!23316 None!86)))

(declare-fun b!36887 () Bool)

(assert (=> b!36887 (= e!23316 (getValueByKey!82 (t!3708 (toList!501 lt!13593)) k!388))))

(declare-fun b!36886 () Bool)

(assert (=> b!36886 (= e!23315 e!23316)))

(declare-fun c!4220 () Bool)

(assert (=> b!36886 (= c!4220 (and (is-Cons!967 (toList!501 lt!13593)) (not (= (_1!708 (h!1535 (toList!501 lt!13593))) k!388))))))

(declare-fun d!5615 () Bool)

(declare-fun c!4219 () Bool)

(assert (=> d!5615 (= c!4219 (and (is-Cons!967 (toList!501 lt!13593)) (= (_1!708 (h!1535 (toList!501 lt!13593))) k!388)))))

(assert (=> d!5615 (= (getValueByKey!82 (toList!501 lt!13593) k!388) e!23315)))

(assert (= (and d!5615 c!4219) b!36885))

(assert (= (and d!5615 (not c!4219)) b!36886))

(assert (= (and b!36886 c!4220) b!36887))

(assert (= (and b!36886 (not c!4220)) b!36888))

(declare-fun m!29749 () Bool)

(assert (=> b!36887 m!29749))

(assert (=> b!36815 d!5615))

(declare-fun d!5619 () Bool)

(declare-fun res!22323 () Bool)

(declare-fun e!23317 () Bool)

(assert (=> d!5619 (=> res!22323 e!23317)))

(assert (=> d!5619 (= res!22323 (is-Nil!968 (t!3708 (toList!501 lm!252))))))

(assert (=> d!5619 (= (forall!167 (t!3708 (toList!501 lm!252)) p!304) e!23317)))

(declare-fun b!36889 () Bool)

(declare-fun e!23318 () Bool)

(assert (=> b!36889 (= e!23317 e!23318)))

(declare-fun res!22324 () Bool)

(assert (=> b!36889 (=> (not res!22324) (not e!23318))))

(assert (=> b!36889 (= res!22324 (dynLambda!170 p!304 (h!1535 (t!3708 (toList!501 lm!252)))))))

(declare-fun b!36890 () Bool)

(assert (=> b!36890 (= e!23318 (forall!167 (t!3708 (t!3708 (toList!501 lm!252))) p!304))))

(assert (= (and d!5619 (not res!22323)) b!36889))

(assert (= (and b!36889 res!22324) b!36890))

(declare-fun b_lambda!1811 () Bool)

(assert (=> (not b_lambda!1811) (not b!36889)))

(declare-fun t!3726 () Bool)

(declare-fun tb!739 () Bool)

(assert (=> (and start!4764 (= p!304 p!304) t!3726) tb!739))

(declare-fun result!1269 () Bool)

(assert (=> tb!739 (= result!1269 true)))

(assert (=> b!36889 t!3726))

(declare-fun b_and!2205 () Bool)

(assert (= b_and!2201 (and (=> t!3726 result!1269) b_and!2205)))

(declare-fun m!29751 () Bool)

(assert (=> b!36889 m!29751))

(declare-fun m!29753 () Bool)

(assert (=> b!36890 m!29753))

(assert (=> b!36844 d!5619))

(declare-fun d!5621 () Bool)

(assert (=> d!5621 (isDefined!44 (getValueByKey!82 (toList!501 lm!252) k!388))))

(declare-fun lt!13652 () Unit!826)

(declare-fun choose!226 (List!971 (_ BitVec 64)) Unit!826)

(assert (=> d!5621 (= lt!13652 (choose!226 (toList!501 lm!252) k!388))))

(declare-fun e!23325 () Bool)

(assert (=> d!5621 e!23325))

(declare-fun res!22331 () Bool)

(assert (=> d!5621 (=> (not res!22331) (not e!23325))))

(assert (=> d!5621 (= res!22331 (isStrictlySorted!180 (toList!501 lm!252)))))

(assert (=> d!5621 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!43 (toList!501 lm!252) k!388) lt!13652)))

(declare-fun b!36897 () Bool)

(assert (=> b!36897 (= e!23325 (containsKey!46 (toList!501 lm!252) k!388))))

(assert (= (and d!5621 res!22331) b!36897))

(assert (=> d!5621 m!29713))

(assert (=> d!5621 m!29713))

(assert (=> d!5621 m!29715))

(declare-fun m!29759 () Bool)

(assert (=> d!5621 m!29759))

(assert (=> d!5621 m!29729))

(assert (=> b!36897 m!29709))

(assert (=> b!36838 d!5621))

(declare-fun d!5629 () Bool)

(assert (=> d!5629 (= (isDefined!44 (getValueByKey!82 (toList!501 lm!252) k!388)) (not (isEmpty!196 (getValueByKey!82 (toList!501 lm!252) k!388))))))

(declare-fun bs!1419 () Bool)

(assert (= bs!1419 d!5629))

(assert (=> bs!1419 m!29713))

(declare-fun m!29761 () Bool)

(assert (=> bs!1419 m!29761))

(assert (=> b!36838 d!5629))

(declare-fun b!36899 () Bool)

(declare-fun e!23327 () Option!88)

(assert (=> b!36899 (= e!23327 (Some!87 (_2!708 (h!1535 (toList!501 lm!252)))))))

(declare-fun b!36902 () Bool)

(declare-fun e!23328 () Option!88)

(assert (=> b!36902 (= e!23328 None!86)))

(declare-fun b!36901 () Bool)

(assert (=> b!36901 (= e!23328 (getValueByKey!82 (t!3708 (toList!501 lm!252)) k!388))))

(declare-fun b!36900 () Bool)

(assert (=> b!36900 (= e!23327 e!23328)))

(declare-fun c!4222 () Bool)

(assert (=> b!36900 (= c!4222 (and (is-Cons!967 (toList!501 lm!252)) (not (= (_1!708 (h!1535 (toList!501 lm!252))) k!388))))))

(declare-fun d!5631 () Bool)

(declare-fun c!4221 () Bool)

(assert (=> d!5631 (= c!4221 (and (is-Cons!967 (toList!501 lm!252)) (= (_1!708 (h!1535 (toList!501 lm!252))) k!388)))))

(assert (=> d!5631 (= (getValueByKey!82 (toList!501 lm!252) k!388) e!23327)))

(assert (= (and d!5631 c!4221) b!36899))

(assert (= (and d!5631 (not c!4221)) b!36900))

(assert (= (and b!36900 c!4222) b!36901))

(assert (= (and b!36900 (not c!4222)) b!36902))

(declare-fun m!29767 () Bool)

(assert (=> b!36901 m!29767))

(assert (=> b!36838 d!5631))

(declare-fun d!5637 () Bool)

(assert (=> d!5637 (= (tail!96 (toList!501 lm!252)) (t!3708 (toList!501 lm!252)))))

(assert (=> d!5583 d!5637))

(declare-fun d!5639 () Bool)

(assert (=> d!5639 (= (isEmpty!194 (toList!501 lm!252)) (is-Nil!968 (toList!501 lm!252)))))

(assert (=> d!5565 d!5639))

(assert (=> b!36840 d!5629))

(assert (=> b!36840 d!5631))

(declare-fun d!5643 () Bool)

(assert (=> d!5643 (isDefined!44 (getValueByKey!82 (toList!501 lt!13593) k!388))))

(declare-fun lt!13654 () Unit!826)

(assert (=> d!5643 (= lt!13654 (choose!226 (toList!501 lt!13593) k!388))))

(declare-fun e!23329 () Bool)

(assert (=> d!5643 e!23329))

(declare-fun res!22333 () Bool)

(assert (=> d!5643 (=> (not res!22333) (not e!23329))))

(assert (=> d!5643 (= res!22333 (isStrictlySorted!180 (toList!501 lt!13593)))))

(assert (=> d!5643 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!43 (toList!501 lt!13593) k!388) lt!13654)))

(declare-fun b!36905 () Bool)

(assert (=> b!36905 (= e!23329 (containsKey!46 (toList!501 lt!13593) k!388))))

(assert (= (and d!5643 res!22333) b!36905))

(assert (=> d!5643 m!29673))

(assert (=> d!5643 m!29673))

(assert (=> d!5643 m!29675))

(declare-fun m!29771 () Bool)

(assert (=> d!5643 m!29771))

(declare-fun m!29773 () Bool)

(assert (=> d!5643 m!29773))

(assert (=> b!36905 m!29669))

(assert (=> b!36813 d!5643))

(assert (=> b!36813 d!5611))

(assert (=> b!36813 d!5615))

(declare-fun d!5645 () Bool)

(declare-fun res!22338 () Bool)

(declare-fun e!23344 () Bool)

(assert (=> d!5645 (=> res!22338 e!23344)))

(assert (=> d!5645 (= res!22338 (and (is-Cons!967 (toList!501 lt!13593)) (= (_1!708 (h!1535 (toList!501 lt!13593))) k!388)))))

(assert (=> d!5645 (= (containsKey!46 (toList!501 lt!13593) k!388) e!23344)))

(declare-fun b!36928 () Bool)

(declare-fun e!23345 () Bool)

(assert (=> b!36928 (= e!23344 e!23345)))

(declare-fun res!22339 () Bool)

(assert (=> b!36928 (=> (not res!22339) (not e!23345))))

(assert (=> b!36928 (= res!22339 (and (or (not (is-Cons!967 (toList!501 lt!13593))) (bvsle (_1!708 (h!1535 (toList!501 lt!13593))) k!388)) (is-Cons!967 (toList!501 lt!13593)) (bvslt (_1!708 (h!1535 (toList!501 lt!13593))) k!388)))))

(declare-fun b!36929 () Bool)

(assert (=> b!36929 (= e!23345 (containsKey!46 (t!3708 (toList!501 lt!13593)) k!388))))

(assert (= (and d!5645 (not res!22338)) b!36928))

(assert (= (and b!36928 res!22339) b!36929))

(declare-fun m!29777 () Bool)

(assert (=> b!36929 m!29777))

(assert (=> d!5569 d!5645))

(declare-fun d!5649 () Bool)

(declare-fun res!22344 () Bool)

(declare-fun e!23350 () Bool)

(assert (=> d!5649 (=> res!22344 e!23350)))

(assert (=> d!5649 (= res!22344 (and (is-Cons!967 (toList!501 lm!252)) (= (_1!708 (h!1535 (toList!501 lm!252))) k!388)))))

(assert (=> d!5649 (= (containsKey!46 (toList!501 lm!252) k!388) e!23350)))

(declare-fun b!36932 () Bool)

(declare-fun e!23351 () Bool)

(assert (=> b!36932 (= e!23350 e!23351)))

(declare-fun res!22345 () Bool)

(assert (=> b!36932 (=> (not res!22345) (not e!23351))))

(assert (=> b!36932 (= res!22345 (and (or (not (is-Cons!967 (toList!501 lm!252))) (bvsle (_1!708 (h!1535 (toList!501 lm!252))) k!388)) (is-Cons!967 (toList!501 lm!252)) (bvslt (_1!708 (h!1535 (toList!501 lm!252))) k!388)))))

(declare-fun b!36933 () Bool)

(assert (=> b!36933 (= e!23351 (containsKey!46 (t!3708 (toList!501 lm!252)) k!388))))

(assert (= (and d!5649 (not res!22344)) b!36932))

(assert (= (and b!36932 res!22345) b!36933))

(declare-fun m!29779 () Bool)

(assert (=> b!36933 m!29779))

(assert (=> d!5591 d!5649))

(declare-fun d!5651 () Bool)

(declare-fun res!22346 () Bool)

(declare-fun e!23352 () Bool)

(assert (=> d!5651 (=> res!22346 e!23352)))

(assert (=> d!5651 (= res!22346 (is-Nil!968 (t!3708 (toList!501 lt!13593))))))

(assert (=> d!5651 (= (forall!167 (t!3708 (toList!501 lt!13593)) p!304) e!23352)))

(declare-fun b!36936 () Bool)

(declare-fun e!23353 () Bool)

(assert (=> b!36936 (= e!23352 e!23353)))

(declare-fun res!22347 () Bool)

(assert (=> b!36936 (=> (not res!22347) (not e!23353))))

(assert (=> b!36936 (= res!22347 (dynLambda!170 p!304 (h!1535 (t!3708 (toList!501 lt!13593)))))))

(declare-fun b!36937 () Bool)

(assert (=> b!36937 (= e!23353 (forall!167 (t!3708 (t!3708 (toList!501 lt!13593))) p!304))))

(assert (= (and d!5651 (not res!22346)) b!36936))

(assert (= (and b!36936 res!22347) b!36937))

(declare-fun b_lambda!1815 () Bool)

(assert (=> (not b_lambda!1815) (not b!36936)))

(declare-fun t!3730 () Bool)

(declare-fun tb!743 () Bool)

(assert (=> (and start!4764 (= p!304 p!304) t!3730) tb!743))

(declare-fun result!1273 () Bool)

(assert (=> tb!743 (= result!1273 true)))

(assert (=> b!36936 t!3730))

(declare-fun b_and!2209 () Bool)

(assert (= b_and!2205 (and (=> t!3730 result!1273) b_and!2209)))

(declare-fun m!29781 () Bool)

(assert (=> b!36936 m!29781))

(declare-fun m!29785 () Bool)

(assert (=> b!36937 m!29785))

(assert (=> b!36829 d!5651))

(declare-fun b!36944 () Bool)

(declare-fun e!23358 () Bool)

(declare-fun tp!5475 () Bool)

(assert (=> b!36944 (= e!23358 (and tp_is_empty!1659 tp!5475))))

(assert (=> b!36859 (= tp!5471 e!23358)))

(assert (= (and b!36859 (is-Cons!967 (t!3708 (toList!501 lm!252)))) b!36944))

(declare-fun b_lambda!1817 () Bool)

(assert (= b_lambda!1811 (or (and start!4764 b_free!1327) b_lambda!1817)))

(declare-fun b_lambda!1819 () Bool)

(assert (= b_lambda!1815 (or (and start!4764 b_free!1327) b_lambda!1819)))

(push 1)

(assert b_and!2209)

(assert (not b_lambda!1817))

(assert (not b!36887))

(assert (not d!5629))

(assert (not b_lambda!1803))

(assert (not b!36944))

(assert (not b!36933))

(assert (not b!36905))

(assert (not b!36897))

(assert (not b_lambda!1801))

(assert (not b!36870))

(assert (not b!36937))

(assert (not d!5611))

(assert (not b!36901))

(assert (not b_next!1327))

(assert (not b_lambda!1819))

(assert (not b!36890))

(assert tp_is_empty!1659)

(assert (not d!5621))

(assert (not b!36929))

(assert (not d!5643))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2209)

(assert (not b_next!1327))

(check-sat)

(pop 1)

