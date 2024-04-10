; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107858 () Bool)

(assert start!107858)

(declare-fun b!1274904 () Bool)

(declare-fun res!847466 () Bool)

(declare-fun e!727643 () Bool)

(assert (=> b!1274904 (=> (not res!847466) (not e!727643))))

(declare-datatypes ((B!2168 0))(
  ( (B!2169 (val!16680 Int)) )
))
(declare-datatypes ((tuple2!21442 0))(
  ( (tuple2!21443 (_1!10732 (_ BitVec 64)) (_2!10732 B!2168)) )
))
(declare-datatypes ((List!28606 0))(
  ( (Nil!28603) (Cons!28602 (h!29811 tuple2!21442) (t!42139 List!28606)) )
))
(declare-fun l!595 () List!28606)

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274904 (= res!847466 (and (not (= (_1!10732 (h!29811 l!595)) key!173)) (is-Cons!28602 l!595)))))

(declare-fun res!847468 () Bool)

(assert (=> start!107858 (=> (not res!847468) (not e!727643))))

(declare-fun isStrictlySorted!858 (List!28606) Bool)

(assert (=> start!107858 (= res!847468 (isStrictlySorted!858 l!595))))

(assert (=> start!107858 e!727643))

(declare-fun e!727645 () Bool)

(assert (=> start!107858 e!727645))

(assert (=> start!107858 true))

(declare-fun b!1274905 () Bool)

(declare-fun e!727644 () Bool)

(assert (=> b!1274905 (= e!727643 e!727644)))

(declare-fun res!847467 () Bool)

(assert (=> b!1274905 (=> res!847467 e!727644)))

(declare-fun lt!575304 () List!28606)

(assert (=> b!1274905 (= res!847467 (not (isStrictlySorted!858 lt!575304)))))

(declare-fun $colon$colon!664 (List!28606 tuple2!21442) List!28606)

(declare-fun removeStrictlySorted!182 (List!28606 (_ BitVec 64)) List!28606)

(assert (=> b!1274905 (= lt!575304 ($colon$colon!664 (removeStrictlySorted!182 (t!42139 l!595) key!173) (h!29811 l!595)))))

(declare-fun b!1274906 () Bool)

(declare-fun containsKey!703 (List!28606 (_ BitVec 64)) Bool)

(assert (=> b!1274906 (= e!727644 (containsKey!703 lt!575304 key!173))))

(declare-fun b!1274907 () Bool)

(declare-fun tp_is_empty!33211 () Bool)

(declare-fun tp!98057 () Bool)

(assert (=> b!1274907 (= e!727645 (and tp_is_empty!33211 tp!98057))))

(assert (= (and start!107858 res!847468) b!1274904))

(assert (= (and b!1274904 res!847466) b!1274905))

(assert (= (and b!1274905 (not res!847467)) b!1274906))

(assert (= (and start!107858 (is-Cons!28602 l!595)) b!1274907))

(declare-fun m!1171393 () Bool)

(assert (=> start!107858 m!1171393))

(declare-fun m!1171395 () Bool)

(assert (=> b!1274905 m!1171395))

(declare-fun m!1171397 () Bool)

(assert (=> b!1274905 m!1171397))

(assert (=> b!1274905 m!1171397))

(declare-fun m!1171399 () Bool)

(assert (=> b!1274905 m!1171399))

(declare-fun m!1171401 () Bool)

(assert (=> b!1274906 m!1171401))

(push 1)

(assert (not b!1274907))

(assert (not b!1274906))

(assert (not b!1274905))

(assert (not start!107858))

(assert tp_is_empty!33211)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140247 () Bool)

(declare-fun res!847497 () Bool)

(declare-fun e!727674 () Bool)

(assert (=> d!140247 (=> res!847497 e!727674)))

(assert (=> d!140247 (= res!847497 (or (is-Nil!28603 l!595) (is-Nil!28603 (t!42139 l!595))))))

(assert (=> d!140247 (= (isStrictlySorted!858 l!595) e!727674)))

(declare-fun b!1274942 () Bool)

(declare-fun e!727675 () Bool)

(assert (=> b!1274942 (= e!727674 e!727675)))

(declare-fun res!847498 () Bool)

(assert (=> b!1274942 (=> (not res!847498) (not e!727675))))

(assert (=> b!1274942 (= res!847498 (bvslt (_1!10732 (h!29811 l!595)) (_1!10732 (h!29811 (t!42139 l!595)))))))

(declare-fun b!1274943 () Bool)

(assert (=> b!1274943 (= e!727675 (isStrictlySorted!858 (t!42139 l!595)))))

(assert (= (and d!140247 (not res!847497)) b!1274942))

(assert (= (and b!1274942 res!847498) b!1274943))

(declare-fun m!1171425 () Bool)

(assert (=> b!1274943 m!1171425))

(assert (=> start!107858 d!140247))

(declare-fun d!140253 () Bool)

(declare-fun res!847503 () Bool)

(declare-fun e!727684 () Bool)

(assert (=> d!140253 (=> res!847503 e!727684)))

(assert (=> d!140253 (= res!847503 (and (is-Cons!28602 lt!575304) (= (_1!10732 (h!29811 lt!575304)) key!173)))))

(assert (=> d!140253 (= (containsKey!703 lt!575304 key!173) e!727684)))

(declare-fun b!1274956 () Bool)

(declare-fun e!727685 () Bool)

(assert (=> b!1274956 (= e!727684 e!727685)))

(declare-fun res!847504 () Bool)

(assert (=> b!1274956 (=> (not res!847504) (not e!727685))))

(assert (=> b!1274956 (= res!847504 (and (or (not (is-Cons!28602 lt!575304)) (bvsle (_1!10732 (h!29811 lt!575304)) key!173)) (is-Cons!28602 lt!575304) (bvslt (_1!10732 (h!29811 lt!575304)) key!173)))))

(declare-fun b!1274957 () Bool)

(assert (=> b!1274957 (= e!727685 (containsKey!703 (t!42139 lt!575304) key!173))))

(assert (= (and d!140253 (not res!847503)) b!1274956))

(assert (= (and b!1274956 res!847504) b!1274957))

(declare-fun m!1171427 () Bool)

(assert (=> b!1274957 m!1171427))

(assert (=> b!1274906 d!140253))

(declare-fun d!140257 () Bool)

(declare-fun res!847505 () Bool)

(declare-fun e!727686 () Bool)

(assert (=> d!140257 (=> res!847505 e!727686)))

(assert (=> d!140257 (= res!847505 (or (is-Nil!28603 lt!575304) (is-Nil!28603 (t!42139 lt!575304))))))

(assert (=> d!140257 (= (isStrictlySorted!858 lt!575304) e!727686)))

(declare-fun b!1274958 () Bool)

(declare-fun e!727687 () Bool)

(assert (=> b!1274958 (= e!727686 e!727687)))

(declare-fun res!847506 () Bool)

(assert (=> b!1274958 (=> (not res!847506) (not e!727687))))

(assert (=> b!1274958 (= res!847506 (bvslt (_1!10732 (h!29811 lt!575304)) (_1!10732 (h!29811 (t!42139 lt!575304)))))))

(declare-fun b!1274959 () Bool)

(assert (=> b!1274959 (= e!727687 (isStrictlySorted!858 (t!42139 lt!575304)))))

(assert (= (and d!140257 (not res!847505)) b!1274958))

(assert (= (and b!1274958 res!847506) b!1274959))

(declare-fun m!1171429 () Bool)

(assert (=> b!1274959 m!1171429))

(assert (=> b!1274905 d!140257))

(declare-fun d!140259 () Bool)

(assert (=> d!140259 (= ($colon$colon!664 (removeStrictlySorted!182 (t!42139 l!595) key!173) (h!29811 l!595)) (Cons!28602 (h!29811 l!595) (removeStrictlySorted!182 (t!42139 l!595) key!173)))))

(assert (=> b!1274905 d!140259))

(declare-fun d!140261 () Bool)

(declare-fun e!727716 () Bool)

(assert (=> d!140261 e!727716))

(declare-fun res!847526 () Bool)

(assert (=> d!140261 (=> (not res!847526) (not e!727716))))

(declare-fun lt!575316 () List!28606)

(assert (=> d!140261 (= res!847526 (isStrictlySorted!858 lt!575316))))

(declare-fun e!727718 () List!28606)

(assert (=> d!140261 (= lt!575316 e!727718)))

(declare-fun c!123903 () Bool)

(assert (=> d!140261 (= c!123903 (and (is-Cons!28602 (t!42139 l!595)) (= (_1!10732 (h!29811 (t!42139 l!595))) key!173)))))

(assert (=> d!140261 (isStrictlySorted!858 (t!42139 l!595))))

(assert (=> d!140261 (= (removeStrictlySorted!182 (t!42139 l!595) key!173) lt!575316)))

(declare-fun b!1274996 () Bool)

(assert (=> b!1274996 (= e!727718 (t!42139 (t!42139 l!595)))))

(declare-fun b!1274997 () Bool)

(declare-fun e!727717 () List!28606)

(assert (=> b!1274997 (= e!727718 e!727717)))

(declare-fun c!123902 () Bool)

(assert (=> b!1274997 (= c!123902 (and (is-Cons!28602 (t!42139 l!595)) (not (= (_1!10732 (h!29811 (t!42139 l!595))) key!173))))))

(declare-fun b!1274998 () Bool)

(assert (=> b!1274998 (= e!727717 ($colon$colon!664 (removeStrictlySorted!182 (t!42139 (t!42139 l!595)) key!173) (h!29811 (t!42139 l!595))))))

(declare-fun b!1274999 () Bool)

(assert (=> b!1274999 (= e!727717 Nil!28603)))

(declare-fun b!1275000 () Bool)

(assert (=> b!1275000 (= e!727716 (not (containsKey!703 lt!575316 key!173)))))

(assert (= (and d!140261 c!123903) b!1274996))

(assert (= (and d!140261 (not c!123903)) b!1274997))

(assert (= (and b!1274997 c!123902) b!1274998))

(assert (= (and b!1274997 (not c!123902)) b!1274999))

(assert (= (and d!140261 res!847526) b!1275000))

(declare-fun m!1171445 () Bool)

(assert (=> d!140261 m!1171445))

(assert (=> d!140261 m!1171425))

(declare-fun m!1171447 () Bool)

(assert (=> b!1274998 m!1171447))

(assert (=> b!1274998 m!1171447))

(declare-fun m!1171449 () Bool)

(assert (=> b!1274998 m!1171449))

(declare-fun m!1171451 () Bool)

(assert (=> b!1275000 m!1171451))

(assert (=> b!1274905 d!140261))

(declare-fun b!1275013 () Bool)

(declare-fun e!727725 () Bool)

(declare-fun tp!98069 () Bool)

(assert (=> b!1275013 (= e!727725 (and tp_is_empty!33211 tp!98069))))

(assert (=> b!1274907 (= tp!98057 e!727725)))

(assert (= (and b!1274907 (is-Cons!28602 (t!42139 l!595))) b!1275013))

(push 1)

(assert (not b!1274998))

(assert (not b!1274943))

(assert (not b!1274957))

(assert (not d!140261))

(assert (not b!1274959))

(assert tp_is_empty!33211)

(assert (not b!1275000))

(assert (not b!1275013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140275 () Bool)

(declare-fun res!847538 () Bool)

(declare-fun e!727742 () Bool)

(assert (=> d!140275 (=> res!847538 e!727742)))

(assert (=> d!140275 (= res!847538 (and (is-Cons!28602 lt!575316) (= (_1!10732 (h!29811 lt!575316)) key!173)))))

(assert (=> d!140275 (= (containsKey!703 lt!575316 key!173) e!727742)))

(declare-fun b!1275034 () Bool)

(declare-fun e!727743 () Bool)

(assert (=> b!1275034 (= e!727742 e!727743)))

(declare-fun res!847539 () Bool)

(assert (=> b!1275034 (=> (not res!847539) (not e!727743))))

(assert (=> b!1275034 (= res!847539 (and (or (not (is-Cons!28602 lt!575316)) (bvsle (_1!10732 (h!29811 lt!575316)) key!173)) (is-Cons!28602 lt!575316) (bvslt (_1!10732 (h!29811 lt!575316)) key!173)))))

(declare-fun b!1275035 () Bool)

(assert (=> b!1275035 (= e!727743 (containsKey!703 (t!42139 lt!575316) key!173))))

(assert (= (and d!140275 (not res!847538)) b!1275034))

(assert (= (and b!1275034 res!847539) b!1275035))

(declare-fun m!1171465 () Bool)

(assert (=> b!1275035 m!1171465))

(assert (=> b!1275000 d!140275))

(declare-fun d!140277 () Bool)

(declare-fun res!847540 () Bool)

(declare-fun e!727744 () Bool)

(assert (=> d!140277 (=> res!847540 e!727744)))

(assert (=> d!140277 (= res!847540 (or (is-Nil!28603 lt!575316) (is-Nil!28603 (t!42139 lt!575316))))))

(assert (=> d!140277 (= (isStrictlySorted!858 lt!575316) e!727744)))

(declare-fun b!1275036 () Bool)

(declare-fun e!727745 () Bool)

(assert (=> b!1275036 (= e!727744 e!727745)))

(declare-fun res!847541 () Bool)

(assert (=> b!1275036 (=> (not res!847541) (not e!727745))))

(assert (=> b!1275036 (= res!847541 (bvslt (_1!10732 (h!29811 lt!575316)) (_1!10732 (h!29811 (t!42139 lt!575316)))))))

(declare-fun b!1275037 () Bool)

(assert (=> b!1275037 (= e!727745 (isStrictlySorted!858 (t!42139 lt!575316)))))

(assert (= (and d!140277 (not res!847540)) b!1275036))

(assert (= (and b!1275036 res!847541) b!1275037))

(declare-fun m!1171467 () Bool)

(assert (=> b!1275037 m!1171467))

(assert (=> d!140261 d!140277))

(declare-fun d!140279 () Bool)

(declare-fun res!847542 () Bool)

(declare-fun e!727746 () Bool)

(assert (=> d!140279 (=> res!847542 e!727746)))

(assert (=> d!140279 (= res!847542 (or (is-Nil!28603 (t!42139 l!595)) (is-Nil!28603 (t!42139 (t!42139 l!595)))))))

(assert (=> d!140279 (= (isStrictlySorted!858 (t!42139 l!595)) e!727746)))

(declare-fun b!1275038 () Bool)

(declare-fun e!727747 () Bool)

(assert (=> b!1275038 (= e!727746 e!727747)))

(declare-fun res!847543 () Bool)

(assert (=> b!1275038 (=> (not res!847543) (not e!727747))))

(assert (=> b!1275038 (= res!847543 (bvslt (_1!10732 (h!29811 (t!42139 l!595))) (_1!10732 (h!29811 (t!42139 (t!42139 l!595))))))))

(declare-fun b!1275039 () Bool)

(assert (=> b!1275039 (= e!727747 (isStrictlySorted!858 (t!42139 (t!42139 l!595))))))

(assert (= (and d!140279 (not res!847542)) b!1275038))

(assert (= (and b!1275038 res!847543) b!1275039))

(declare-fun m!1171469 () Bool)

(assert (=> b!1275039 m!1171469))

(assert (=> d!140261 d!140279))

(assert (=> b!1274943 d!140279))

(declare-fun d!140281 () Bool)

(declare-fun res!847544 () Bool)

(declare-fun e!727748 () Bool)

(assert (=> d!140281 (=> res!847544 e!727748)))

(assert (=> d!140281 (= res!847544 (and (is-Cons!28602 (t!42139 lt!575304)) (= (_1!10732 (h!29811 (t!42139 lt!575304))) key!173)))))

(assert (=> d!140281 (= (containsKey!703 (t!42139 lt!575304) key!173) e!727748)))

(declare-fun b!1275040 () Bool)

(declare-fun e!727749 () Bool)

(assert (=> b!1275040 (= e!727748 e!727749)))

(declare-fun res!847545 () Bool)

(assert (=> b!1275040 (=> (not res!847545) (not e!727749))))

(assert (=> b!1275040 (= res!847545 (and (or (not (is-Cons!28602 (t!42139 lt!575304))) (bvsle (_1!10732 (h!29811 (t!42139 lt!575304))) key!173)) (is-Cons!28602 (t!42139 lt!575304)) (bvslt (_1!10732 (h!29811 (t!42139 lt!575304))) key!173)))))

(declare-fun b!1275041 () Bool)

(assert (=> b!1275041 (= e!727749 (containsKey!703 (t!42139 (t!42139 lt!575304)) key!173))))

(assert (= (and d!140281 (not res!847544)) b!1275040))

(assert (= (and b!1275040 res!847545) b!1275041))

(declare-fun m!1171471 () Bool)

(assert (=> b!1275041 m!1171471))

(assert (=> b!1274957 d!140281))

(declare-fun d!140283 () Bool)

(declare-fun res!847546 () Bool)

(declare-fun e!727750 () Bool)

(assert (=> d!140283 (=> res!847546 e!727750)))

(assert (=> d!140283 (= res!847546 (or (is-Nil!28603 (t!42139 lt!575304)) (is-Nil!28603 (t!42139 (t!42139 lt!575304)))))))

(assert (=> d!140283 (= (isStrictlySorted!858 (t!42139 lt!575304)) e!727750)))

(declare-fun b!1275042 () Bool)

(declare-fun e!727751 () Bool)

(assert (=> b!1275042 (= e!727750 e!727751)))

(declare-fun res!847547 () Bool)

(assert (=> b!1275042 (=> (not res!847547) (not e!727751))))

(assert (=> b!1275042 (= res!847547 (bvslt (_1!10732 (h!29811 (t!42139 lt!575304))) (_1!10732 (h!29811 (t!42139 (t!42139 lt!575304))))))))

(declare-fun b!1275043 () Bool)

(assert (=> b!1275043 (= e!727751 (isStrictlySorted!858 (t!42139 (t!42139 lt!575304))))))

(assert (= (and d!140283 (not res!847546)) b!1275042))

(assert (= (and b!1275042 res!847547) b!1275043))

(declare-fun m!1171473 () Bool)

(assert (=> b!1275043 m!1171473))

(assert (=> b!1274959 d!140283))

(declare-fun d!140285 () Bool)

(assert (=> d!140285 (= ($colon$colon!664 (removeStrictlySorted!182 (t!42139 (t!42139 l!595)) key!173) (h!29811 (t!42139 l!595))) (Cons!28602 (h!29811 (t!42139 l!595)) (removeStrictlySorted!182 (t!42139 (t!42139 l!595)) key!173)))))

(assert (=> b!1274998 d!140285))

(declare-fun d!140287 () Bool)

(declare-fun e!727752 () Bool)

(assert (=> d!140287 e!727752))

(declare-fun res!847548 () Bool)

(assert (=> d!140287 (=> (not res!847548) (not e!727752))))

(declare-fun lt!575320 () List!28606)

(assert (=> d!140287 (= res!847548 (isStrictlySorted!858 lt!575320))))

(declare-fun e!727754 () List!28606)

(assert (=> d!140287 (= lt!575320 e!727754)))

(declare-fun c!123911 () Bool)

(assert (=> d!140287 (= c!123911 (and (is-Cons!28602 (t!42139 (t!42139 l!595))) (= (_1!10732 (h!29811 (t!42139 (t!42139 l!595)))) key!173)))))

(assert (=> d!140287 (isStrictlySorted!858 (t!42139 (t!42139 l!595)))))

(assert (=> d!140287 (= (removeStrictlySorted!182 (t!42139 (t!42139 l!595)) key!173) lt!575320)))

(declare-fun b!1275044 () Bool)

(assert (=> b!1275044 (= e!727754 (t!42139 (t!42139 (t!42139 l!595))))))

(declare-fun b!1275045 () Bool)

(declare-fun e!727753 () List!28606)

(assert (=> b!1275045 (= e!727754 e!727753)))

(declare-fun c!123910 () Bool)

(assert (=> b!1275045 (= c!123910 (and (is-Cons!28602 (t!42139 (t!42139 l!595))) (not (= (_1!10732 (h!29811 (t!42139 (t!42139 l!595)))) key!173))))))

(declare-fun b!1275046 () Bool)

(assert (=> b!1275046 (= e!727753 ($colon$colon!664 (removeStrictlySorted!182 (t!42139 (t!42139 (t!42139 l!595))) key!173) (h!29811 (t!42139 (t!42139 l!595)))))))

(declare-fun b!1275047 () Bool)

(assert (=> b!1275047 (= e!727753 Nil!28603)))

(declare-fun b!1275048 () Bool)

(assert (=> b!1275048 (= e!727752 (not (containsKey!703 lt!575320 key!173)))))

(assert (= (and d!140287 c!123911) b!1275044))

(assert (= (and d!140287 (not c!123911)) b!1275045))

(assert (= (and b!1275045 c!123910) b!1275046))

(assert (= (and b!1275045 (not c!123910)) b!1275047))

(assert (= (and d!140287 res!847548) b!1275048))

(declare-fun m!1171475 () Bool)

(assert (=> d!140287 m!1171475))

(assert (=> d!140287 m!1171469))

(declare-fun m!1171477 () Bool)

(assert (=> b!1275046 m!1171477))

(assert (=> b!1275046 m!1171477))

(declare-fun m!1171479 () Bool)

(assert (=> b!1275046 m!1171479))

(declare-fun m!1171481 () Bool)

(assert (=> b!1275048 m!1171481))

(assert (=> b!1274998 d!140287))

(declare-fun b!1275049 () Bool)

(declare-fun e!727755 () Bool)

(declare-fun tp!98073 () Bool)

(assert (=> b!1275049 (= e!727755 (and tp_is_empty!33211 tp!98073))))

(assert (=> b!1275013 (= tp!98069 e!727755)))

(assert (= (and b!1275013 (is-Cons!28602 (t!42139 (t!42139 l!595)))) b!1275049))

(push 1)

(assert (not b!1275049))

(assert (not b!1275048))

(assert (not d!140287))

(assert (not b!1275043))

(assert (not b!1275039))

(assert (not b!1275037))

(assert (not b!1275035))

(assert (not b!1275046))

(assert tp_is_empty!33211)

(assert (not b!1275041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

