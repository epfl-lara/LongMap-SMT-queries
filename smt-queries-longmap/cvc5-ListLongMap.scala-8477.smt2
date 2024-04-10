; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103218 () Bool)

(assert start!103218)

(declare-fun b!1239056 () Bool)

(declare-fun res!826608 () Bool)

(declare-fun e!702167 () Bool)

(assert (=> b!1239056 (=> (not res!826608) (not e!702167))))

(declare-datatypes ((array!79853 0))(
  ( (array!79854 (arr!38528 (Array (_ BitVec 32) (_ BitVec 64))) (size!39064 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79853)

(declare-datatypes ((List!27301 0))(
  ( (Nil!27298) (Cons!27297 (h!28506 (_ BitVec 64)) (t!40764 List!27301)) )
))
(declare-fun acc!846 () List!27301)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79853 (_ BitVec 32) List!27301) Bool)

(assert (=> b!1239056 (= res!826608 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun e!702165 () Bool)

(declare-fun b!1239057 () Bool)

(assert (=> b!1239057 (= e!702165 (not (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))))

(declare-fun res!826614 () Bool)

(assert (=> start!103218 (=> (not res!826614) (not e!702167))))

(assert (=> start!103218 (= res!826614 (and (bvslt (size!39064 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39064 a!3835))))))

(assert (=> start!103218 e!702167))

(declare-fun array_inv!29376 (array!79853) Bool)

(assert (=> start!103218 (array_inv!29376 a!3835)))

(assert (=> start!103218 true))

(declare-fun b!1239058 () Bool)

(declare-fun res!826612 () Bool)

(assert (=> b!1239058 (=> (not res!826612) (not e!702167))))

(declare-fun contains!7363 (List!27301 (_ BitVec 64)) Bool)

(assert (=> b!1239058 (= res!826612 (not (contains!7363 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239059 () Bool)

(assert (=> b!1239059 (= e!702167 e!702165)))

(declare-fun res!826611 () Bool)

(assert (=> b!1239059 (=> (not res!826611) (not e!702165))))

(assert (=> b!1239059 (= res!826611 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39064 a!3835))))))

(declare-datatypes ((Unit!41161 0))(
  ( (Unit!41162) )
))
(declare-fun lt!561579 () Unit!41161)

(declare-fun e!702168 () Unit!41161)

(assert (=> b!1239059 (= lt!561579 e!702168)))

(declare-fun c!121084 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239059 (= c!121084 (validKeyInArray!0 (select (arr!38528 a!3835) from!3213)))))

(declare-fun b!1239060 () Bool)

(declare-fun res!826609 () Bool)

(assert (=> b!1239060 (=> (not res!826609) (not e!702167))))

(assert (=> b!1239060 (= res!826609 (not (contains!7363 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239061 () Bool)

(declare-fun Unit!41163 () Unit!41161)

(assert (=> b!1239061 (= e!702168 Unit!41163)))

(declare-fun b!1239062 () Bool)

(declare-fun lt!561578 () Unit!41161)

(assert (=> b!1239062 (= e!702168 lt!561578)))

(declare-fun lt!561580 () List!27301)

(assert (=> b!1239062 (= lt!561580 (Cons!27297 (select (arr!38528 a!3835) from!3213) acc!846))))

(declare-fun lt!561577 () Unit!41161)

(declare-fun lemmaListSubSeqRefl!0 (List!27301) Unit!41161)

(assert (=> b!1239062 (= lt!561577 (lemmaListSubSeqRefl!0 lt!561580))))

(declare-fun subseq!617 (List!27301 List!27301) Bool)

(assert (=> b!1239062 (subseq!617 lt!561580 lt!561580)))

(declare-fun lt!561581 () Unit!41161)

(declare-fun subseqTail!104 (List!27301 List!27301) Unit!41161)

(assert (=> b!1239062 (= lt!561581 (subseqTail!104 lt!561580 lt!561580))))

(assert (=> b!1239062 (subseq!617 acc!846 lt!561580)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79853 List!27301 List!27301 (_ BitVec 32)) Unit!41161)

(assert (=> b!1239062 (= lt!561578 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561580 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239062 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239063 () Bool)

(declare-fun res!826610 () Bool)

(assert (=> b!1239063 (=> (not res!826610) (not e!702167))))

(declare-fun noDuplicate!1960 (List!27301) Bool)

(assert (=> b!1239063 (= res!826610 (noDuplicate!1960 acc!846))))

(declare-fun b!1239064 () Bool)

(declare-fun res!826613 () Bool)

(assert (=> b!1239064 (=> (not res!826613) (not e!702167))))

(assert (=> b!1239064 (= res!826613 (not (= from!3213 (bvsub (size!39064 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239065 () Bool)

(declare-fun res!826615 () Bool)

(assert (=> b!1239065 (=> (not res!826615) (not e!702167))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239065 (= res!826615 (contains!7363 acc!846 k!2925))))

(assert (= (and start!103218 res!826614) b!1239063))

(assert (= (and b!1239063 res!826610) b!1239060))

(assert (= (and b!1239060 res!826609) b!1239058))

(assert (= (and b!1239058 res!826612) b!1239056))

(assert (= (and b!1239056 res!826608) b!1239065))

(assert (= (and b!1239065 res!826615) b!1239064))

(assert (= (and b!1239064 res!826613) b!1239059))

(assert (= (and b!1239059 c!121084) b!1239062))

(assert (= (and b!1239059 (not c!121084)) b!1239061))

(assert (= (and b!1239059 res!826611) b!1239057))

(declare-fun m!1142575 () Bool)

(assert (=> b!1239065 m!1142575))

(declare-fun m!1142577 () Bool)

(assert (=> b!1239060 m!1142577))

(declare-fun m!1142579 () Bool)

(assert (=> start!103218 m!1142579))

(declare-fun m!1142581 () Bool)

(assert (=> b!1239059 m!1142581))

(assert (=> b!1239059 m!1142581))

(declare-fun m!1142583 () Bool)

(assert (=> b!1239059 m!1142583))

(declare-fun m!1142585 () Bool)

(assert (=> b!1239056 m!1142585))

(declare-fun m!1142587 () Bool)

(assert (=> b!1239062 m!1142587))

(declare-fun m!1142589 () Bool)

(assert (=> b!1239062 m!1142589))

(declare-fun m!1142591 () Bool)

(assert (=> b!1239062 m!1142591))

(declare-fun m!1142593 () Bool)

(assert (=> b!1239062 m!1142593))

(declare-fun m!1142595 () Bool)

(assert (=> b!1239062 m!1142595))

(declare-fun m!1142597 () Bool)

(assert (=> b!1239062 m!1142597))

(assert (=> b!1239062 m!1142581))

(assert (=> b!1239057 m!1142597))

(declare-fun m!1142599 () Bool)

(assert (=> b!1239063 m!1142599))

(declare-fun m!1142601 () Bool)

(assert (=> b!1239058 m!1142601))

(push 1)

(assert (not b!1239056))

(assert (not b!1239062))

(assert (not b!1239065))

(assert (not b!1239060))

(assert (not b!1239059))

(assert (not b!1239063))

(assert (not b!1239058))

(assert (not b!1239057))

(assert (not start!103218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135969 () Bool)

(declare-fun lt!561619 () Bool)

(declare-fun content!594 (List!27301) (Set (_ BitVec 64)))

(assert (=> d!135969 (= lt!561619 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!594 acc!846)))))

(declare-fun e!702219 () Bool)

(assert (=> d!135969 (= lt!561619 e!702219)))

(declare-fun res!826690 () Bool)

(assert (=> d!135969 (=> (not res!826690) (not e!702219))))

(assert (=> d!135969 (= res!826690 (is-Cons!27297 acc!846))))

(assert (=> d!135969 (= (contains!7363 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561619)))

(declare-fun b!1239152 () Bool)

(declare-fun e!702220 () Bool)

(assert (=> b!1239152 (= e!702219 e!702220)))

(declare-fun res!826691 () Bool)

(assert (=> b!1239152 (=> res!826691 e!702220)))

(assert (=> b!1239152 (= res!826691 (= (h!28506 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239153 () Bool)

(assert (=> b!1239153 (= e!702220 (contains!7363 (t!40764 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135969 res!826690) b!1239152))

(assert (= (and b!1239152 (not res!826691)) b!1239153))

(declare-fun m!1142677 () Bool)

(assert (=> d!135969 m!1142677))

(declare-fun m!1142679 () Bool)

(assert (=> d!135969 m!1142679))

(declare-fun m!1142681 () Bool)

(assert (=> b!1239153 m!1142681))

(assert (=> b!1239060 d!135969))

(declare-fun d!135975 () Bool)

(declare-fun lt!561620 () Bool)

(assert (=> d!135975 (= lt!561620 (set.member k!2925 (content!594 acc!846)))))

(declare-fun e!702221 () Bool)

(assert (=> d!135975 (= lt!561620 e!702221)))

(declare-fun res!826692 () Bool)

(assert (=> d!135975 (=> (not res!826692) (not e!702221))))

(assert (=> d!135975 (= res!826692 (is-Cons!27297 acc!846))))

(assert (=> d!135975 (= (contains!7363 acc!846 k!2925) lt!561620)))

(declare-fun b!1239154 () Bool)

(declare-fun e!702222 () Bool)

(assert (=> b!1239154 (= e!702221 e!702222)))

(declare-fun res!826693 () Bool)

(assert (=> b!1239154 (=> res!826693 e!702222)))

(assert (=> b!1239154 (= res!826693 (= (h!28506 acc!846) k!2925))))

(declare-fun b!1239155 () Bool)

(assert (=> b!1239155 (= e!702222 (contains!7363 (t!40764 acc!846) k!2925))))

(assert (= (and d!135975 res!826692) b!1239154))

(assert (= (and b!1239154 (not res!826693)) b!1239155))

(assert (=> d!135975 m!1142677))

(declare-fun m!1142683 () Bool)

(assert (=> d!135975 m!1142683))

(declare-fun m!1142685 () Bool)

(assert (=> b!1239155 m!1142685))

(assert (=> b!1239065 d!135975))

(declare-fun d!135977 () Bool)

(declare-fun res!826712 () Bool)

(declare-fun e!702255 () Bool)

(assert (=> d!135977 (=> res!826712 e!702255)))

(assert (=> d!135977 (= res!826712 (bvsge from!3213 (size!39064 a!3835)))))

(assert (=> d!135977 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702255)))

(declare-fun b!1239202 () Bool)

(declare-fun e!702258 () Bool)

(declare-fun e!702256 () Bool)

(assert (=> b!1239202 (= e!702258 e!702256)))

(declare-fun c!121105 () Bool)

(assert (=> b!1239202 (= c!121105 (validKeyInArray!0 (select (arr!38528 a!3835) from!3213)))))

(declare-fun b!1239203 () Bool)

(declare-fun call!61084 () Bool)

(assert (=> b!1239203 (= e!702256 call!61084)))

(declare-fun b!1239204 () Bool)

(assert (=> b!1239204 (= e!702256 call!61084)))

(declare-fun b!1239205 () Bool)

(declare-fun e!702257 () Bool)

(assert (=> b!1239205 (= e!702257 (contains!7363 acc!846 (select (arr!38528 a!3835) from!3213)))))

(declare-fun b!1239206 () Bool)

(assert (=> b!1239206 (= e!702255 e!702258)))

(declare-fun res!826714 () Bool)

(assert (=> b!1239206 (=> (not res!826714) (not e!702258))))

(assert (=> b!1239206 (= res!826714 (not e!702257))))

(declare-fun res!826713 () Bool)

(assert (=> b!1239206 (=> (not res!826713) (not e!702257))))

(assert (=> b!1239206 (= res!826713 (validKeyInArray!0 (select (arr!38528 a!3835) from!3213)))))

(declare-fun bm!61081 () Bool)

(assert (=> bm!61081 (= call!61084 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121105 (Cons!27297 (select (arr!38528 a!3835) from!3213) acc!846) acc!846)))))

(assert (= (and d!135977 (not res!826712)) b!1239206))

(assert (= (and b!1239206 res!826713) b!1239205))

(assert (= (and b!1239206 res!826714) b!1239202))

(assert (= (and b!1239202 c!121105) b!1239203))

(assert (= (and b!1239202 (not c!121105)) b!1239204))

(assert (= (or b!1239203 b!1239204) bm!61081))

(assert (=> b!1239202 m!1142581))

(assert (=> b!1239202 m!1142581))

(assert (=> b!1239202 m!1142583))

(assert (=> b!1239205 m!1142581))

(assert (=> b!1239205 m!1142581))

(declare-fun m!1142703 () Bool)

(assert (=> b!1239205 m!1142703))

(assert (=> b!1239206 m!1142581))

(assert (=> b!1239206 m!1142581))

(assert (=> b!1239206 m!1142583))

(assert (=> bm!61081 m!1142581))

(declare-fun m!1142705 () Bool)

(assert (=> bm!61081 m!1142705))

(assert (=> b!1239056 d!135977))

(declare-fun d!135983 () Bool)

(assert (=> d!135983 (= (array_inv!29376 a!3835) (bvsge (size!39064 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103218 d!135983))

(declare-fun d!135985 () Bool)

(declare-fun res!826721 () Bool)

(declare-fun e!702265 () Bool)

(assert (=> d!135985 (=> res!826721 e!702265)))

(assert (=> d!135985 (= res!826721 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39064 a!3835)))))

(assert (=> d!135985 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702265)))

(declare-fun b!1239213 () Bool)

(declare-fun e!702268 () Bool)

(declare-fun e!702266 () Bool)

(assert (=> b!1239213 (= e!702268 e!702266)))

(declare-fun c!121106 () Bool)

(assert (=> b!1239213 (= c!121106 (validKeyInArray!0 (select (arr!38528 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239214 () Bool)

(declare-fun call!61085 () Bool)

(assert (=> b!1239214 (= e!702266 call!61085)))

(declare-fun b!1239215 () Bool)

(assert (=> b!1239215 (= e!702266 call!61085)))

(declare-fun e!702267 () Bool)

(declare-fun b!1239216 () Bool)

(assert (=> b!1239216 (= e!702267 (contains!7363 acc!846 (select (arr!38528 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239217 () Bool)

(assert (=> b!1239217 (= e!702265 e!702268)))

(declare-fun res!826723 () Bool)

(assert (=> b!1239217 (=> (not res!826723) (not e!702268))))

(assert (=> b!1239217 (= res!826723 (not e!702267))))

(declare-fun res!826722 () Bool)

(assert (=> b!1239217 (=> (not res!826722) (not e!702267))))

(assert (=> b!1239217 (= res!826722 (validKeyInArray!0 (select (arr!38528 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61082 () Bool)

(assert (=> bm!61082 (= call!61085 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121106 (Cons!27297 (select (arr!38528 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(assert (= (and d!135985 (not res!826721)) b!1239217))

(assert (= (and b!1239217 res!826722) b!1239216))

(assert (= (and b!1239217 res!826723) b!1239213))

(assert (= (and b!1239213 c!121106) b!1239214))

(assert (= (and b!1239213 (not c!121106)) b!1239215))

(assert (= (or b!1239214 b!1239215) bm!61082))

(declare-fun m!1142713 () Bool)

(assert (=> b!1239213 m!1142713))

(assert (=> b!1239213 m!1142713))

(declare-fun m!1142715 () Bool)

(assert (=> b!1239213 m!1142715))

(assert (=> b!1239216 m!1142713))

(assert (=> b!1239216 m!1142713))

(declare-fun m!1142719 () Bool)

(assert (=> b!1239216 m!1142719))

(assert (=> b!1239217 m!1142713))

(assert (=> b!1239217 m!1142713))

(assert (=> b!1239217 m!1142715))

(assert (=> bm!61082 m!1142713))

(declare-fun m!1142721 () Bool)

(assert (=> bm!61082 m!1142721))

(assert (=> b!1239062 d!135985))

(declare-fun b!1239258 () Bool)

(declare-fun e!702302 () Unit!41161)

(declare-fun Unit!41172 () Unit!41161)

(assert (=> b!1239258 (= e!702302 Unit!41172)))

(declare-fun b!1239259 () Bool)

(declare-fun e!702304 () Unit!41161)

(declare-fun call!61092 () Unit!41161)

(assert (=> b!1239259 (= e!702304 call!61092)))

(declare-fun bm!61089 () Bool)

(declare-fun c!121119 () Bool)

(assert (=> bm!61089 (= call!61092 (subseqTail!104 (ite c!121119 lt!561580 (t!40764 lt!561580)) (t!40764 lt!561580)))))

(declare-fun b!1239260 () Bool)

(declare-fun Unit!41173 () Unit!41161)

(assert (=> b!1239260 (= e!702304 Unit!41173)))

(declare-fun d!135993 () Bool)

(declare-fun tail!169 (List!27301) List!27301)

(assert (=> d!135993 (subseq!617 (tail!169 lt!561580) lt!561580)))

(declare-fun lt!561642 () Unit!41161)

(assert (=> d!135993 (= lt!561642 e!702302)))

(declare-fun c!121118 () Bool)

(assert (=> d!135993 (= c!121118 (and (is-Cons!27297 lt!561580) (is-Cons!27297 lt!561580)))))

(declare-fun e!702299 () Bool)

(assert (=> d!135993 e!702299))

(declare-fun res!826744 () Bool)

(assert (=> d!135993 (=> (not res!826744) (not e!702299))))

(declare-fun isEmpty!1017 (List!27301) Bool)

(assert (=> d!135993 (= res!826744 (not (isEmpty!1017 lt!561580)))))

(assert (=> d!135993 (= (subseqTail!104 lt!561580 lt!561580) lt!561642)))

(declare-fun b!1239261 () Bool)

(assert (=> b!1239261 (= e!702299 (subseq!617 lt!561580 lt!561580))))

(declare-fun b!1239262 () Bool)

(declare-fun e!702300 () Unit!41161)

(assert (=> b!1239262 (= e!702300 call!61092)))

(declare-fun b!1239263 () Bool)

(declare-fun c!121117 () Bool)

(assert (=> b!1239263 (= c!121117 (not (isEmpty!1017 (t!40764 lt!561580))))))

(assert (=> b!1239263 (= e!702300 e!702304)))

(declare-fun b!1239264 () Bool)

(assert (=> b!1239264 (= e!702302 e!702300)))

(assert (=> b!1239264 (= c!121119 (subseq!617 lt!561580 (t!40764 lt!561580)))))

(assert (= (and d!135993 res!826744) b!1239261))

(assert (= (and d!135993 c!121118) b!1239264))

(assert (= (and d!135993 (not c!121118)) b!1239258))

(assert (= (and b!1239264 c!121119) b!1239262))

(assert (= (and b!1239264 (not c!121119)) b!1239263))

(assert (= (and b!1239263 c!121117) b!1239259))

(assert (= (and b!1239263 (not c!121117)) b!1239260))

(assert (= (or b!1239262 b!1239259) bm!61089))

(declare-fun m!1142751 () Bool)

(assert (=> b!1239263 m!1142751))

(declare-fun m!1142753 () Bool)

(assert (=> d!135993 m!1142753))

(assert (=> d!135993 m!1142753))

(declare-fun m!1142755 () Bool)

(assert (=> d!135993 m!1142755))

(declare-fun m!1142757 () Bool)

(assert (=> d!135993 m!1142757))

(declare-fun m!1142759 () Bool)

(assert (=> b!1239264 m!1142759))

(assert (=> b!1239261 m!1142589))

(declare-fun m!1142761 () Bool)

(assert (=> bm!61089 m!1142761))

(assert (=> b!1239062 d!135993))

(declare-fun d!136011 () Bool)

(assert (=> d!136011 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561645 () Unit!41161)

(declare-fun choose!80 (array!79853 List!27301 List!27301 (_ BitVec 32)) Unit!41161)

(assert (=> d!136011 (= lt!561645 (choose!80 a!3835 lt!561580 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136011 (bvslt (size!39064 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136011 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561580 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561645)))

(declare-fun bs!34845 () Bool)

(assert (= bs!34845 d!136011))

(assert (=> bs!34845 m!1142597))

(declare-fun m!1142771 () Bool)

(assert (=> bs!34845 m!1142771))

(assert (=> b!1239062 d!136011))

(declare-fun b!1239313 () Bool)

(declare-fun e!702343 () Bool)

(assert (=> b!1239313 (= e!702343 (subseq!617 lt!561580 (t!40764 lt!561580)))))

(declare-fun b!1239312 () Bool)

(declare-fun e!702341 () Bool)

(assert (=> b!1239312 (= e!702341 (subseq!617 (t!40764 lt!561580) (t!40764 lt!561580)))))

(declare-fun d!136019 () Bool)

(declare-fun res!826776 () Bool)

(declare-fun e!702344 () Bool)

(assert (=> d!136019 (=> res!826776 e!702344)))

(assert (=> d!136019 (= res!826776 (is-Nil!27298 lt!561580))))

(assert (=> d!136019 (= (subseq!617 lt!561580 lt!561580) e!702344)))

(declare-fun b!1239311 () Bool)

(declare-fun e!702342 () Bool)

(assert (=> b!1239311 (= e!702342 e!702343)))

(declare-fun res!826777 () Bool)

(assert (=> b!1239311 (=> res!826777 e!702343)))

(assert (=> b!1239311 (= res!826777 e!702341)))

(declare-fun res!826779 () Bool)

(assert (=> b!1239311 (=> (not res!826779) (not e!702341))))

(assert (=> b!1239311 (= res!826779 (= (h!28506 lt!561580) (h!28506 lt!561580)))))

(declare-fun b!1239310 () Bool)

(assert (=> b!1239310 (= e!702344 e!702342)))

(declare-fun res!826778 () Bool)

(assert (=> b!1239310 (=> (not res!826778) (not e!702342))))

(assert (=> b!1239310 (= res!826778 (is-Cons!27297 lt!561580))))

(assert (= (and d!136019 (not res!826776)) b!1239310))

(assert (= (and b!1239310 res!826778) b!1239311))

(assert (= (and b!1239311 res!826779) b!1239312))

(assert (= (and b!1239311 (not res!826777)) b!1239313))

(assert (=> b!1239313 m!1142759))

(declare-fun m!1142777 () Bool)

(assert (=> b!1239312 m!1142777))

(assert (=> b!1239062 d!136019))

