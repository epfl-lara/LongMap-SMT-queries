; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113780 () Bool)

(assert start!113780)

(declare-fun k!387 () (_ BitVec 64))

(declare-datatypes ((B!2192 0))(
  ( (B!2193 (val!18885 Int)) )
))
(declare-datatypes ((tuple2!24364 0))(
  ( (tuple2!24365 (_1!12193 (_ BitVec 64)) (_2!12193 B!2192)) )
))
(declare-datatypes ((List!31503 0))(
  ( (Nil!31500) (Cons!31499 (h!32708 tuple2!24364) (t!46161 List!31503)) )
))
(declare-datatypes ((ListLongMap!22021 0))(
  ( (ListLongMap!22022 (toList!11026 List!31503)) )
))
(declare-fun contains!9212 (ListLongMap!22021 (_ BitVec 64)) Bool)

(assert (=> start!113780 (contains!9212 (ListLongMap!22022 Nil!31500) k!387)))

(assert (=> start!113780 true))

(declare-fun bs!38724 () Bool)

(assert (= bs!38724 start!113780))

(declare-fun m!1237399 () Bool)

(assert (=> bs!38724 m!1237399))

(push 1)

(assert (not start!113780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144853 () Bool)

(declare-fun e!768040 () Bool)

(assert (=> d!144853 e!768040))

(declare-fun res!895624 () Bool)

(assert (=> d!144853 (=> res!895624 e!768040)))

(declare-fun lt!596933 () Bool)

(assert (=> d!144853 (= res!895624 (not lt!596933))))

(declare-fun lt!596926 () Bool)

(assert (=> d!144853 (= lt!596933 lt!596926)))

(declare-datatypes ((Unit!44225 0))(
  ( (Unit!44226) )
))
(declare-fun lt!596934 () Unit!44225)

(declare-fun e!768039 () Unit!44225)

(assert (=> d!144853 (= lt!596934 e!768039)))

(declare-fun c!126692 () Bool)

(assert (=> d!144853 (= c!126692 lt!596926)))

(declare-fun containsKey!748 (List!31503 (_ BitVec 64)) Bool)

(assert (=> d!144853 (= lt!596926 (containsKey!748 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(assert (=> d!144853 (= (contains!9212 (ListLongMap!22022 Nil!31500) k!387) lt!596933)))

(declare-fun b!1350128 () Bool)

(declare-fun lt!596935 () Unit!44225)

(assert (=> b!1350128 (= e!768039 lt!596935)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!494 (List!31503 (_ BitVec 64)) Unit!44225)

(assert (=> b!1350128 (= lt!596935 (lemmaContainsKeyImpliesGetValueByKeyDefined!494 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(declare-datatypes ((Option!778 0))(
  ( (Some!777 (v!21532 B!2192)) (None!776) )
))
(declare-fun isDefined!533 (Option!778) Bool)

(declare-fun getValueByKey!726 (List!31503 (_ BitVec 64)) Option!778)

(assert (=> b!1350128 (isDefined!533 (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(declare-fun b!1350129 () Bool)

(declare-fun Unit!44230 () Unit!44225)

(assert (=> b!1350129 (= e!768039 Unit!44230)))

(declare-fun b!1350130 () Bool)

(assert (=> b!1350130 (= e!768040 (isDefined!533 (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387)))))

(assert (= (and d!144853 c!126692) b!1350128))

(assert (= (and d!144853 (not c!126692)) b!1350129))

(assert (= (and d!144853 (not res!895624)) b!1350130))

(declare-fun m!1237409 () Bool)

(assert (=> d!144853 m!1237409))

(declare-fun m!1237415 () Bool)

(assert (=> b!1350128 m!1237415))

(declare-fun m!1237421 () Bool)

(assert (=> b!1350128 m!1237421))

(assert (=> b!1350128 m!1237421))

(declare-fun m!1237427 () Bool)

(assert (=> b!1350128 m!1237427))

(assert (=> b!1350130 m!1237421))

(assert (=> b!1350130 m!1237421))

(assert (=> b!1350130 m!1237427))

(assert (=> start!113780 d!144853))

(push 1)

(assert (not b!1350130))

(assert (not b!1350128))

(assert (not d!144853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144861 () Bool)

(declare-fun isEmpty!1101 (Option!778) Bool)

(assert (=> d!144861 (= (isDefined!533 (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387)) (not (isEmpty!1101 (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))))

(declare-fun bs!38727 () Bool)

(assert (= bs!38727 d!144861))

(assert (=> bs!38727 m!1237421))

(declare-fun m!1237429 () Bool)

(assert (=> bs!38727 m!1237429))

(assert (=> b!1350130 d!144861))

(declare-fun b!1350149 () Bool)

(declare-fun e!768054 () Option!778)

(declare-fun e!768055 () Option!778)

(assert (=> b!1350149 (= e!768054 e!768055)))

(declare-fun c!126698 () Bool)

(assert (=> b!1350149 (= c!126698 (and (is-Cons!31499 (toList!11026 (ListLongMap!22022 Nil!31500))) (not (= (_1!12193 (h!32708 (toList!11026 (ListLongMap!22022 Nil!31500)))) k!387))))))

(declare-fun d!144863 () Bool)

(declare-fun c!126697 () Bool)

(assert (=> d!144863 (= c!126697 (and (is-Cons!31499 (toList!11026 (ListLongMap!22022 Nil!31500))) (= (_1!12193 (h!32708 (toList!11026 (ListLongMap!22022 Nil!31500)))) k!387)))))

(assert (=> d!144863 (= (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387) e!768054)))

(declare-fun b!1350150 () Bool)

(assert (=> b!1350150 (= e!768055 (getValueByKey!726 (t!46161 (toList!11026 (ListLongMap!22022 Nil!31500))) k!387))))

(declare-fun b!1350148 () Bool)

(assert (=> b!1350148 (= e!768054 (Some!777 (_2!12193 (h!32708 (toList!11026 (ListLongMap!22022 Nil!31500))))))))

(declare-fun b!1350151 () Bool)

(assert (=> b!1350151 (= e!768055 None!776)))

(assert (= (and d!144863 c!126697) b!1350148))

(assert (= (and d!144863 (not c!126697)) b!1350149))

(assert (= (and b!1350149 c!126698) b!1350150))

(assert (= (and b!1350149 (not c!126698)) b!1350151))

(declare-fun m!1237437 () Bool)

(assert (=> b!1350150 m!1237437))

(assert (=> b!1350130 d!144863))

(declare-fun d!144871 () Bool)

(assert (=> d!144871 (isDefined!533 (getValueByKey!726 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(declare-fun lt!596944 () Unit!44225)

(declare-fun choose!1989 (List!31503 (_ BitVec 64)) Unit!44225)

(assert (=> d!144871 (= lt!596944 (choose!1989 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(declare-fun e!768065 () Bool)

(assert (=> d!144871 e!768065))

(declare-fun res!895639 () Bool)

(assert (=> d!144871 (=> (not res!895639) (not e!768065))))

(declare-fun isStrictlySorted!886 (List!31503) Bool)

(assert (=> d!144871 (= res!895639 (isStrictlySorted!886 (toList!11026 (ListLongMap!22022 Nil!31500))))))

(assert (=> d!144871 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!494 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387) lt!596944)))

(declare-fun b!1350165 () Bool)

(assert (=> b!1350165 (= e!768065 (containsKey!748 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387))))

(assert (= (and d!144871 res!895639) b!1350165))

(assert (=> d!144871 m!1237421))

(assert (=> d!144871 m!1237421))

(assert (=> d!144871 m!1237427))

(declare-fun m!1237447 () Bool)

(assert (=> d!144871 m!1237447))

(declare-fun m!1237449 () Bool)

(assert (=> d!144871 m!1237449))

(assert (=> b!1350165 m!1237409))

(assert (=> b!1350128 d!144871))

(assert (=> b!1350128 d!144861))

(assert (=> b!1350128 d!144863))

(declare-fun d!144879 () Bool)

(declare-fun res!895644 () Bool)

(declare-fun e!768078 () Bool)

(assert (=> d!144879 (=> res!895644 e!768078)))

(assert (=> d!144879 (= res!895644 (and (is-Cons!31499 (toList!11026 (ListLongMap!22022 Nil!31500))) (= (_1!12193 (h!32708 (toList!11026 (ListLongMap!22022 Nil!31500)))) k!387)))))

(assert (=> d!144879 (= (containsKey!748 (toList!11026 (ListLongMap!22022 Nil!31500)) k!387) e!768078)))

