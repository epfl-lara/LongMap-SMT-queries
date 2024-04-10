; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118768 () Bool)

(assert start!118768)

(declare-fun b!1387950 () Bool)

(declare-fun res!928581 () Bool)

(declare-fun e!786210 () Bool)

(assert (=> b!1387950 (=> (not res!928581) (not e!786210))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94939 0))(
  ( (array!94940 (arr!45844 (Array (_ BitVec 32) (_ BitVec 64))) (size!46394 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94939)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387950 (= res!928581 (and (= (size!46394 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46394 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46394 a!2938))))))

(declare-fun b!1387951 () Bool)

(declare-fun e!786209 () Bool)

(assert (=> b!1387951 (= e!786210 e!786209)))

(declare-fun res!928580 () Bool)

(assert (=> b!1387951 (=> (not res!928580) (not e!786209))))

(assert (=> b!1387951 (= res!928580 (bvsge startIndex!16 (bvsub (size!46394 a!2938) #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!46403 0))(
  ( (Unit!46404) )
))
(declare-fun lt!610106 () Unit!46403)

(declare-fun e!786208 () Unit!46403)

(assert (=> b!1387951 (= lt!610106 e!786208)))

(declare-fun c!129129 () Bool)

(declare-fun e!786212 () Bool)

(assert (=> b!1387951 (= c!129129 e!786212)))

(declare-fun res!928576 () Bool)

(assert (=> b!1387951 (=> (not res!928576) (not e!786212))))

(assert (=> b!1387951 (= res!928576 (not (= startIndex!16 i!1065)))))

(declare-fun lt!610104 () array!94939)

(assert (=> b!1387951 (= lt!610104 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)))))

(declare-fun b!1387952 () Bool)

(declare-fun lt!610105 () Unit!46403)

(assert (=> b!1387952 (= e!786208 lt!610105)))

(declare-fun lt!610107 () Unit!46403)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46403)

(assert (=> b!1387952 (= lt!610107 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10187 0))(
  ( (MissingZero!10187 (index!43119 (_ BitVec 32))) (Found!10187 (index!43120 (_ BitVec 32))) (Intermediate!10187 (undefined!10999 Bool) (index!43121 (_ BitVec 32)) (x!124733 (_ BitVec 32))) (Undefined!10187) (MissingVacant!10187 (index!43122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94939 (_ BitVec 32)) SeekEntryResult!10187)

(assert (=> b!1387952 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46403)

(assert (=> b!1387952 (= lt!610105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94939 (_ BitVec 32)) Bool)

(assert (=> b!1387952 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387953 () Bool)

(declare-fun res!928577 () Bool)

(assert (=> b!1387953 (=> (not res!928577) (not e!786210))))

(declare-datatypes ((List!32372 0))(
  ( (Nil!32369) (Cons!32368 (h!33580 (_ BitVec 64)) (t!47066 List!32372)) )
))
(declare-fun arrayNoDuplicates!0 (array!94939 (_ BitVec 32) List!32372) Bool)

(assert (=> b!1387953 (= res!928577 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32369))))

(declare-fun b!1387954 () Bool)

(assert (=> b!1387954 (= e!786209 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610104 mask!2987)))))

(declare-fun b!1387956 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387956 (= e!786212 (validKeyInArray!0 (select (arr!45844 a!2938) startIndex!16)))))

(declare-fun b!1387957 () Bool)

(declare-fun res!928578 () Bool)

(assert (=> b!1387957 (=> (not res!928578) (not e!786210))))

(assert (=> b!1387957 (= res!928578 (validKeyInArray!0 (select (arr!45844 a!2938) i!1065)))))

(declare-fun b!1387958 () Bool)

(declare-fun res!928575 () Bool)

(assert (=> b!1387958 (=> (not res!928575) (not e!786210))))

(assert (=> b!1387958 (= res!928575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387959 () Bool)

(declare-fun Unit!46405 () Unit!46403)

(assert (=> b!1387959 (= e!786208 Unit!46405)))

(declare-fun b!1387955 () Bool)

(declare-fun res!928582 () Bool)

(assert (=> b!1387955 (=> (not res!928582) (not e!786210))))

(assert (=> b!1387955 (= res!928582 (and (not (= (select (arr!45844 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45844 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!928579 () Bool)

(assert (=> start!118768 (=> (not res!928579) (not e!786210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118768 (= res!928579 (validMask!0 mask!2987))))

(assert (=> start!118768 e!786210))

(assert (=> start!118768 true))

(declare-fun array_inv!34872 (array!94939) Bool)

(assert (=> start!118768 (array_inv!34872 a!2938)))

(assert (= (and start!118768 res!928579) b!1387950))

(assert (= (and b!1387950 res!928581) b!1387957))

(assert (= (and b!1387957 res!928578) b!1387953))

(assert (= (and b!1387953 res!928577) b!1387958))

(assert (= (and b!1387958 res!928575) b!1387955))

(assert (= (and b!1387955 res!928582) b!1387951))

(assert (= (and b!1387951 res!928576) b!1387956))

(assert (= (and b!1387951 c!129129) b!1387952))

(assert (= (and b!1387951 (not c!129129)) b!1387959))

(assert (= (and b!1387951 res!928580) b!1387954))

(declare-fun m!1273609 () Bool)

(assert (=> b!1387958 m!1273609))

(declare-fun m!1273611 () Bool)

(assert (=> b!1387953 m!1273611))

(declare-fun m!1273613 () Bool)

(assert (=> start!118768 m!1273613))

(declare-fun m!1273615 () Bool)

(assert (=> start!118768 m!1273615))

(declare-fun m!1273617 () Bool)

(assert (=> b!1387955 m!1273617))

(declare-fun m!1273619 () Bool)

(assert (=> b!1387954 m!1273619))

(assert (=> b!1387957 m!1273617))

(assert (=> b!1387957 m!1273617))

(declare-fun m!1273621 () Bool)

(assert (=> b!1387957 m!1273621))

(declare-fun m!1273623 () Bool)

(assert (=> b!1387956 m!1273623))

(assert (=> b!1387956 m!1273623))

(declare-fun m!1273625 () Bool)

(assert (=> b!1387956 m!1273625))

(declare-fun m!1273627 () Bool)

(assert (=> b!1387951 m!1273627))

(declare-fun m!1273629 () Bool)

(assert (=> b!1387952 m!1273629))

(declare-fun m!1273631 () Bool)

(assert (=> b!1387952 m!1273631))

(assert (=> b!1387952 m!1273631))

(declare-fun m!1273633 () Bool)

(assert (=> b!1387952 m!1273633))

(assert (=> b!1387952 m!1273627))

(declare-fun m!1273635 () Bool)

(assert (=> b!1387952 m!1273635))

(assert (=> b!1387952 m!1273623))

(declare-fun m!1273637 () Bool)

(assert (=> b!1387952 m!1273637))

(assert (=> b!1387952 m!1273623))

(declare-fun m!1273639 () Bool)

(assert (=> b!1387952 m!1273639))

(push 1)

(assert (not b!1387953))

(assert (not b!1387958))

(assert (not b!1387952))

(assert (not b!1387957))

(assert (not start!118768))

(assert (not b!1387956))

(assert (not b!1387954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1388007 () Bool)

(declare-fun e!786250 () Bool)

(declare-fun call!66609 () Bool)

(assert (=> b!1388007 (= e!786250 call!66609)))

(declare-fun b!1388008 () Bool)

(declare-fun e!786252 () Bool)

(declare-fun contains!9749 (List!32372 (_ BitVec 64)) Bool)

(assert (=> b!1388008 (= e!786252 (contains!9749 Nil!32369 (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388009 () Bool)

(assert (=> b!1388009 (= e!786250 call!66609)))

(declare-fun d!149741 () Bool)

(declare-fun res!928611 () Bool)

(declare-fun e!786253 () Bool)

(assert (=> d!149741 (=> res!928611 e!786253)))

(assert (=> d!149741 (= res!928611 (bvsge #b00000000000000000000000000000000 (size!46394 a!2938)))))

(assert (=> d!149741 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32369) e!786253)))

(declare-fun b!1388010 () Bool)

(declare-fun e!786251 () Bool)

(assert (=> b!1388010 (= e!786253 e!786251)))

(declare-fun res!928610 () Bool)

(assert (=> b!1388010 (=> (not res!928610) (not e!786251))))

(assert (=> b!1388010 (= res!928610 (not e!786252))))

(declare-fun res!928612 () Bool)

(assert (=> b!1388010 (=> (not res!928612) (not e!786252))))

(assert (=> b!1388010 (= res!928612 (validKeyInArray!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66606 () Bool)

(declare-fun c!129140 () Bool)

(assert (=> bm!66606 (= call!66609 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129140 (Cons!32368 (select (arr!45844 a!2938) #b00000000000000000000000000000000) Nil!32369) Nil!32369)))))

(declare-fun b!1388011 () Bool)

(assert (=> b!1388011 (= e!786251 e!786250)))

(assert (=> b!1388011 (= c!129140 (validKeyInArray!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149741 (not res!928611)) b!1388010))

(assert (= (and b!1388010 res!928612) b!1388008))

(assert (= (and b!1388010 res!928610) b!1388011))

(assert (= (and b!1388011 c!129140) b!1388007))

(assert (= (and b!1388011 (not c!129140)) b!1388009))

(assert (= (or b!1388007 b!1388009) bm!66606))

(declare-fun m!1273675 () Bool)

(assert (=> b!1388008 m!1273675))

(assert (=> b!1388008 m!1273675))

(declare-fun m!1273677 () Bool)

(assert (=> b!1388008 m!1273677))

(assert (=> b!1388010 m!1273675))

(assert (=> b!1388010 m!1273675))

(declare-fun m!1273679 () Bool)

(assert (=> b!1388010 m!1273679))

(assert (=> bm!66606 m!1273675))

(declare-fun m!1273681 () Bool)

(assert (=> bm!66606 m!1273681))

(assert (=> b!1388011 m!1273675))

(assert (=> b!1388011 m!1273675))

(assert (=> b!1388011 m!1273679))

(assert (=> b!1387953 d!149741))

(declare-fun b!1388033 () Bool)

(declare-fun e!786271 () Bool)

(declare-fun call!66615 () Bool)

(assert (=> b!1388033 (= e!786271 call!66615)))

(declare-fun b!1388034 () Bool)

(declare-fun e!786270 () Bool)

(assert (=> b!1388034 (= e!786270 call!66615)))

(declare-fun b!1388035 () Bool)

(declare-fun e!786272 () Bool)

(assert (=> b!1388035 (= e!786272 e!786270)))

(declare-fun c!129146 () Bool)

(assert (=> b!1388035 (= c!129146 (validKeyInArray!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!149747 () Bool)

(declare-fun res!928625 () Bool)

(assert (=> d!149747 (=> res!928625 e!786272)))

(assert (=> d!149747 (= res!928625 (bvsge #b00000000000000000000000000000000 (size!46394 a!2938)))))

(assert (=> d!149747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786272)))

(declare-fun bm!66612 () Bool)

(assert (=> bm!66612 (= call!66615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388036 () Bool)

(assert (=> b!1388036 (= e!786270 e!786271)))

(declare-fun lt!610143 () (_ BitVec 64))

(assert (=> b!1388036 (= lt!610143 (select (arr!45844 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!610142 () Unit!46403)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94939 (_ BitVec 64) (_ BitVec 32)) Unit!46403)

(assert (=> b!1388036 (= lt!610142 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610143 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388036 (arrayContainsKey!0 a!2938 lt!610143 #b00000000000000000000000000000000)))

(declare-fun lt!610141 () Unit!46403)

(assert (=> b!1388036 (= lt!610141 lt!610142)))

(declare-fun res!928624 () Bool)

(assert (=> b!1388036 (= res!928624 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10187 #b00000000000000000000000000000000)))))

(assert (=> b!1388036 (=> (not res!928624) (not e!786271))))

(assert (= (and d!149747 (not res!928625)) b!1388035))

(assert (= (and b!1388035 c!129146) b!1388036))

(assert (= (and b!1388035 (not c!129146)) b!1388034))

(assert (= (and b!1388036 res!928624) b!1388033))

(assert (= (or b!1388033 b!1388034) bm!66612))

(assert (=> b!1388035 m!1273675))

(assert (=> b!1388035 m!1273675))

(assert (=> b!1388035 m!1273679))

(declare-fun m!1273699 () Bool)

(assert (=> bm!66612 m!1273699))

(assert (=> b!1388036 m!1273675))

(declare-fun m!1273701 () Bool)

(assert (=> b!1388036 m!1273701))

(declare-fun m!1273703 () Bool)

(assert (=> b!1388036 m!1273703))

(assert (=> b!1388036 m!1273675))

(declare-fun m!1273705 () Bool)

(assert (=> b!1388036 m!1273705))

(assert (=> b!1387958 d!149747))

(declare-fun b!1388037 () Bool)

(declare-fun e!786274 () Bool)

(declare-fun call!66616 () Bool)

(assert (=> b!1388037 (= e!786274 call!66616)))

(declare-fun b!1388038 () Bool)

(declare-fun e!786273 () Bool)

(assert (=> b!1388038 (= e!786273 call!66616)))

(declare-fun b!1388039 () Bool)

(declare-fun e!786275 () Bool)

(assert (=> b!1388039 (= e!786275 e!786273)))

(declare-fun c!129147 () Bool)

(assert (=> b!1388039 (= c!129147 (validKeyInArray!0 (select (arr!45844 lt!610104) startIndex!16)))))

(declare-fun d!149755 () Bool)

(declare-fun res!928627 () Bool)

(assert (=> d!149755 (=> res!928627 e!786275)))

(assert (=> d!149755 (= res!928627 (bvsge startIndex!16 (size!46394 lt!610104)))))

(assert (=> d!149755 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610104 mask!2987) e!786275)))

(declare-fun bm!66613 () Bool)

(assert (=> bm!66613 (= call!66616 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610104 mask!2987))))

(declare-fun b!1388040 () Bool)

(assert (=> b!1388040 (= e!786273 e!786274)))

(declare-fun lt!610146 () (_ BitVec 64))

(assert (=> b!1388040 (= lt!610146 (select (arr!45844 lt!610104) startIndex!16))))

(declare-fun lt!610145 () Unit!46403)

(assert (=> b!1388040 (= lt!610145 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610104 lt!610146 startIndex!16))))

(assert (=> b!1388040 (arrayContainsKey!0 lt!610104 lt!610146 #b00000000000000000000000000000000)))

(declare-fun lt!610144 () Unit!46403)

(assert (=> b!1388040 (= lt!610144 lt!610145)))

(declare-fun res!928626 () Bool)

(assert (=> b!1388040 (= res!928626 (= (seekEntryOrOpen!0 (select (arr!45844 lt!610104) startIndex!16) lt!610104 mask!2987) (Found!10187 startIndex!16)))))

(assert (=> b!1388040 (=> (not res!928626) (not e!786274))))

(assert (= (and d!149755 (not res!928627)) b!1388039))

(assert (= (and b!1388039 c!129147) b!1388040))

(assert (= (and b!1388039 (not c!129147)) b!1388038))

(assert (= (and b!1388040 res!928626) b!1388037))

(assert (= (or b!1388037 b!1388038) bm!66613))

(declare-fun m!1273707 () Bool)

(assert (=> b!1388039 m!1273707))

(assert (=> b!1388039 m!1273707))

(declare-fun m!1273709 () Bool)

(assert (=> b!1388039 m!1273709))

(declare-fun m!1273711 () Bool)

(assert (=> bm!66613 m!1273711))

(assert (=> b!1388040 m!1273707))

(declare-fun m!1273713 () Bool)

(assert (=> b!1388040 m!1273713))

(declare-fun m!1273715 () Bool)

(assert (=> b!1388040 m!1273715))

(assert (=> b!1388040 m!1273707))

(declare-fun m!1273717 () Bool)

(assert (=> b!1388040 m!1273717))

(assert (=> b!1387954 d!149755))

(declare-fun d!149757 () Bool)

(assert (=> d!149757 (= (validKeyInArray!0 (select (arr!45844 a!2938) startIndex!16)) (and (not (= (select (arr!45844 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45844 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387956 d!149757))

(declare-fun d!149759 () Bool)

(assert (=> d!149759 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118768 d!149759))

(declare-fun d!149765 () Bool)

(assert (=> d!149765 (= (array_inv!34872 a!2938) (bvsge (size!46394 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118768 d!149765))

(declare-fun d!149767 () Bool)

(assert (=> d!149767 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!610158 () Unit!46403)

(declare-fun choose!38 (array!94939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46403)

(assert (=> d!149767 (= lt!610158 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149767 (validMask!0 mask!2987)))

(assert (=> d!149767 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!610158)))

(declare-fun bs!40340 () Bool)

(assert (= bs!40340 d!149767))

(assert (=> bs!40340 m!1273639))

(declare-fun m!1273741 () Bool)

(assert (=> bs!40340 m!1273741))

(assert (=> bs!40340 m!1273613))

(assert (=> b!1387952 d!149767))

(declare-fun b!1388074 () Bool)

(declare-fun e!786298 () Bool)

(declare-fun call!66620 () Bool)

(assert (=> b!1388074 (= e!786298 call!66620)))

(declare-fun b!1388075 () Bool)

(declare-fun e!786297 () Bool)

(assert (=> b!1388075 (= e!786297 call!66620)))

(declare-fun b!1388076 () Bool)

(declare-fun e!786299 () Bool)

(assert (=> b!1388076 (= e!786299 e!786297)))

(declare-fun c!129160 () Bool)

(assert (=> b!1388076 (= c!129160 (validKeyInArray!0 (select (arr!45844 a!2938) startIndex!16)))))

(declare-fun d!149773 () Bool)

(declare-fun res!928638 () Bool)

(assert (=> d!149773 (=> res!928638 e!786299)))

(assert (=> d!149773 (= res!928638 (bvsge startIndex!16 (size!46394 a!2938)))))

(assert (=> d!149773 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786299)))

(declare-fun bm!66617 () Bool)

(assert (=> bm!66617 (= call!66620 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388077 () Bool)

(assert (=> b!1388077 (= e!786297 e!786298)))

(declare-fun lt!610161 () (_ BitVec 64))

(assert (=> b!1388077 (= lt!610161 (select (arr!45844 a!2938) startIndex!16))))

(declare-fun lt!610160 () Unit!46403)

(assert (=> b!1388077 (= lt!610160 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610161 startIndex!16))))

(assert (=> b!1388077 (arrayContainsKey!0 a!2938 lt!610161 #b00000000000000000000000000000000)))

(declare-fun lt!610159 () Unit!46403)

(assert (=> b!1388077 (= lt!610159 lt!610160)))

(declare-fun res!928637 () Bool)

(assert (=> b!1388077 (= res!928637 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) (Found!10187 startIndex!16)))))

(assert (=> b!1388077 (=> (not res!928637) (not e!786298))))

(assert (= (and d!149773 (not res!928638)) b!1388076))

(assert (= (and b!1388076 c!129160) b!1388077))

(assert (= (and b!1388076 (not c!129160)) b!1388075))

(assert (= (and b!1388077 res!928637) b!1388074))

(assert (= (or b!1388074 b!1388075) bm!66617))

(assert (=> b!1388076 m!1273623))

(assert (=> b!1388076 m!1273623))

(assert (=> b!1388076 m!1273625))

(declare-fun m!1273743 () Bool)

(assert (=> bm!66617 m!1273743))

(assert (=> b!1388077 m!1273623))

(declare-fun m!1273745 () Bool)

(assert (=> b!1388077 m!1273745))

(declare-fun m!1273747 () Bool)

(assert (=> b!1388077 m!1273747))

(assert (=> b!1388077 m!1273623))

(assert (=> b!1388077 m!1273637))

(assert (=> b!1387952 d!149773))

(declare-fun d!149775 () Bool)

(declare-fun e!786308 () Bool)

(assert (=> d!149775 e!786308))

(declare-fun res!928643 () Bool)

(assert (=> d!149775 (=> (not res!928643) (not e!786308))))

(assert (=> d!149775 (= res!928643 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46394 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46394 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46394 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46394 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46394 a!2938))))))

(declare-fun lt!610176 () Unit!46403)

(declare-fun choose!14 (array!94939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46403)

(assert (=> d!149775 (= lt!610176 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149775 (validMask!0 mask!2987)))

(assert (=> d!149775 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!610176)))

(declare-fun b!1388090 () Bool)

(assert (=> b!1388090 (= e!786308 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)) mask!2987)))))

(assert (= (and d!149775 res!928643) b!1388090))

(declare-fun m!1273773 () Bool)

(assert (=> d!149775 m!1273773))

(assert (=> d!149775 m!1273613))

(assert (=> b!1388090 m!1273631))

(declare-fun m!1273775 () Bool)

(assert (=> b!1388090 m!1273775))

(assert (=> b!1388090 m!1273623))

(assert (=> b!1388090 m!1273637))

(assert (=> b!1388090 m!1273631))

(assert (=> b!1388090 m!1273627))

(assert (=> b!1388090 m!1273623))

(assert (=> b!1387952 d!149775))

(declare-fun b!1388118 () Bool)

(declare-fun e!786325 () SeekEntryResult!10187)

(assert (=> b!1388118 (= e!786325 Undefined!10187)))

(declare-fun d!149787 () Bool)

(declare-fun lt!610193 () SeekEntryResult!10187)

(assert (=> d!149787 (and (or (is-Undefined!10187 lt!610193) (not (is-Found!10187 lt!610193)) (and (bvsge (index!43120 lt!610193) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610193) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610193) (is-Found!10187 lt!610193) (not (is-MissingZero!10187 lt!610193)) (and (bvsge (index!43119 lt!610193) #b00000000000000000000000000000000) (bvslt (index!43119 lt!610193) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610193) (is-Found!10187 lt!610193) (is-MissingZero!10187 lt!610193) (not (is-MissingVacant!10187 lt!610193)) (and (bvsge (index!43122 lt!610193) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610193) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610193) (ite (is-Found!10187 lt!610193) (= (select (arr!45844 a!2938) (index!43120 lt!610193)) (select (arr!45844 a!2938) startIndex!16)) (ite (is-MissingZero!10187 lt!610193) (= (select (arr!45844 a!2938) (index!43119 lt!610193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10187 lt!610193) (= (select (arr!45844 a!2938) (index!43122 lt!610193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149787 (= lt!610193 e!786325)))

(declare-fun c!129177 () Bool)

(declare-fun lt!610192 () SeekEntryResult!10187)

(assert (=> d!149787 (= c!129177 (and (is-Intermediate!10187 lt!610192) (undefined!10999 lt!610192)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94939 (_ BitVec 32)) SeekEntryResult!10187)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149787 (= lt!610192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149787 (validMask!0 mask!2987)))

(assert (=> d!149787 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) lt!610193)))

(declare-fun b!1388119 () Bool)

(declare-fun c!129178 () Bool)

(declare-fun lt!610194 () (_ BitVec 64))

(assert (=> b!1388119 (= c!129178 (= lt!610194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786326 () SeekEntryResult!10187)

(declare-fun e!786324 () SeekEntryResult!10187)

(assert (=> b!1388119 (= e!786326 e!786324)))

(declare-fun b!1388120 () Bool)

(assert (=> b!1388120 (= e!786324 (MissingZero!10187 (index!43121 lt!610192)))))

(declare-fun b!1388121 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94939 (_ BitVec 32)) SeekEntryResult!10187)

(assert (=> b!1388121 (= e!786324 (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610192) (index!43121 lt!610192) (index!43121 lt!610192) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388122 () Bool)

(assert (=> b!1388122 (= e!786326 (Found!10187 (index!43121 lt!610192)))))

(declare-fun b!1388123 () Bool)

(assert (=> b!1388123 (= e!786325 e!786326)))

(assert (=> b!1388123 (= lt!610194 (select (arr!45844 a!2938) (index!43121 lt!610192)))))

(declare-fun c!129179 () Bool)

(assert (=> b!1388123 (= c!129179 (= lt!610194 (select (arr!45844 a!2938) startIndex!16)))))

(assert (= (and d!149787 c!129177) b!1388118))

(assert (= (and d!149787 (not c!129177)) b!1388123))

(assert (= (and b!1388123 c!129179) b!1388122))

(assert (= (and b!1388123 (not c!129179)) b!1388119))

(assert (= (and b!1388119 c!129178) b!1388120))

(assert (= (and b!1388119 (not c!129178)) b!1388121))

(assert (=> d!149787 m!1273623))

(declare-fun m!1273781 () Bool)

(assert (=> d!149787 m!1273781))

(assert (=> d!149787 m!1273781))

(assert (=> d!149787 m!1273623))

(declare-fun m!1273783 () Bool)

(assert (=> d!149787 m!1273783))

(assert (=> d!149787 m!1273613))

(declare-fun m!1273785 () Bool)

(assert (=> d!149787 m!1273785))

(declare-fun m!1273787 () Bool)

(assert (=> d!149787 m!1273787))

(declare-fun m!1273789 () Bool)

(assert (=> d!149787 m!1273789))

(assert (=> b!1388121 m!1273623))

(declare-fun m!1273791 () Bool)

(assert (=> b!1388121 m!1273791))

(declare-fun m!1273793 () Bool)

(assert (=> b!1388123 m!1273793))

(assert (=> b!1387952 d!149787))

(declare-fun b!1388124 () Bool)

(declare-fun e!786328 () SeekEntryResult!10187)

(assert (=> b!1388124 (= e!786328 Undefined!10187)))

(declare-fun d!149791 () Bool)

(declare-fun lt!610196 () SeekEntryResult!10187)

(assert (=> d!149791 (and (or (is-Undefined!10187 lt!610196) (not (is-Found!10187 lt!610196)) (and (bvsge (index!43120 lt!610196) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610196) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610196) (is-Found!10187 lt!610196) (not (is-MissingZero!10187 lt!610196)) (and (bvsge (index!43119 lt!610196) #b00000000000000000000000000000000) (bvslt (index!43119 lt!610196) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610196) (is-Found!10187 lt!610196) (is-MissingZero!10187 lt!610196) (not (is-MissingVacant!10187 lt!610196)) (and (bvsge (index!43122 lt!610196) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610196) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610196) (ite (is-Found!10187 lt!610196) (= (select (arr!45844 lt!610104) (index!43120 lt!610196)) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10187 lt!610196) (= (select (arr!45844 lt!610104) (index!43119 lt!610196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10187 lt!610196) (= (select (arr!45844 lt!610104) (index!43122 lt!610196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149791 (= lt!610196 e!786328)))

(declare-fun c!129180 () Bool)

(declare-fun lt!610195 () SeekEntryResult!10187)

(assert (=> d!149791 (= c!129180 (and (is-Intermediate!10187 lt!610195) (undefined!10999 lt!610195)))))

(assert (=> d!149791 (= lt!610195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987))))

(assert (=> d!149791 (validMask!0 mask!2987)))

(assert (=> d!149791 (= (seekEntryOrOpen!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987) lt!610196)))

(declare-fun b!1388125 () Bool)

(declare-fun c!129181 () Bool)

(declare-fun lt!610197 () (_ BitVec 64))

(assert (=> b!1388125 (= c!129181 (= lt!610197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786329 () SeekEntryResult!10187)

(declare-fun e!786327 () SeekEntryResult!10187)

(assert (=> b!1388125 (= e!786329 e!786327)))

(declare-fun b!1388126 () Bool)

(assert (=> b!1388126 (= e!786327 (MissingZero!10187 (index!43121 lt!610195)))))

(declare-fun b!1388127 () Bool)

(assert (=> b!1388127 (= e!786327 (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610195) (index!43121 lt!610195) (index!43121 lt!610195) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987))))

(declare-fun b!1388128 () Bool)

(assert (=> b!1388128 (= e!786329 (Found!10187 (index!43121 lt!610195)))))

(declare-fun b!1388129 () Bool)

(assert (=> b!1388129 (= e!786328 e!786329)))

(assert (=> b!1388129 (= lt!610197 (select (arr!45844 lt!610104) (index!43121 lt!610195)))))

(declare-fun c!129182 () Bool)

(assert (=> b!1388129 (= c!129182 (= lt!610197 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (= (and d!149791 c!129180) b!1388124))

(assert (= (and d!149791 (not c!129180)) b!1388129))

(assert (= (and b!1388129 c!129182) b!1388128))

(assert (= (and b!1388129 (not c!129182)) b!1388125))

(assert (= (and b!1388125 c!129181) b!1388126))

(assert (= (and b!1388125 (not c!129181)) b!1388127))

(assert (=> d!149791 m!1273631))

(declare-fun m!1273795 () Bool)

(assert (=> d!149791 m!1273795))

(assert (=> d!149791 m!1273795))

(assert (=> d!149791 m!1273631))

(declare-fun m!1273797 () Bool)

(assert (=> d!149791 m!1273797))

(assert (=> d!149791 m!1273613))

(declare-fun m!1273799 () Bool)

(assert (=> d!149791 m!1273799))

(declare-fun m!1273801 () Bool)

(assert (=> d!149791 m!1273801))

(declare-fun m!1273803 () Bool)

(assert (=> d!149791 m!1273803))

(assert (=> b!1388127 m!1273631))

(declare-fun m!1273805 () Bool)

(assert (=> b!1388127 m!1273805))

(declare-fun m!1273807 () Bool)

(assert (=> b!1388129 m!1273807))

(assert (=> b!1387952 d!149791))

(declare-fun d!149793 () Bool)

(assert (=> d!149793 (= (validKeyInArray!0 (select (arr!45844 a!2938) i!1065)) (and (not (= (select (arr!45844 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45844 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387957 d!149793))

(push 1)

(assert (not b!1388077))

(assert (not bm!66617))

(assert (not d!149791))

(assert (not b!1388036))

(assert (not b!1388127))

(assert (not bm!66606))

(assert (not b!1388035))

(assert (not bm!66612))

(assert (not d!149767))

(assert (not d!149787))

(assert (not b!1388039))

(assert (not b!1388076))

(assert (not b!1388090))

(assert (not b!1388121))

(assert (not b!1388008))

(assert (not d!149775))

(assert (not b!1388010))

(assert (not b!1388040))

(assert (not b!1388011))

(assert (not bm!66613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1388348 () Bool)

(declare-fun e!786466 () Bool)

(declare-fun call!66629 () Bool)

(assert (=> b!1388348 (= e!786466 call!66629)))

(declare-fun b!1388349 () Bool)

(declare-fun e!786465 () Bool)

(assert (=> b!1388349 (= e!786465 call!66629)))

(declare-fun b!1388350 () Bool)

(declare-fun e!786467 () Bool)

(assert (=> b!1388350 (= e!786467 e!786465)))

(declare-fun c!129259 () Bool)

(assert (=> b!1388350 (= c!129259 (validKeyInArray!0 (select (arr!45844 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149879 () Bool)

(declare-fun res!928716 () Bool)

(assert (=> d!149879 (=> res!928716 e!786467)))

(assert (=> d!149879 (= res!928716 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46394 a!2938)))))

(assert (=> d!149879 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786467)))

(declare-fun bm!66626 () Bool)

(assert (=> bm!66626 (= call!66629 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1388351 () Bool)

(assert (=> b!1388351 (= e!786465 e!786466)))

(declare-fun lt!610299 () (_ BitVec 64))

(assert (=> b!1388351 (= lt!610299 (select (arr!45844 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610298 () Unit!46403)

(assert (=> b!1388351 (= lt!610298 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610299 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388351 (arrayContainsKey!0 a!2938 lt!610299 #b00000000000000000000000000000000)))

(declare-fun lt!610297 () Unit!46403)

(assert (=> b!1388351 (= lt!610297 lt!610298)))

(declare-fun res!928715 () Bool)

(assert (=> b!1388351 (= res!928715 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10187 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388351 (=> (not res!928715) (not e!786466))))

(assert (= (and d!149879 (not res!928716)) b!1388350))

(assert (= (and b!1388350 c!129259) b!1388351))

(assert (= (and b!1388350 (not c!129259)) b!1388349))

(assert (= (and b!1388351 res!928715) b!1388348))

(assert (= (or b!1388348 b!1388349) bm!66626))

(declare-fun m!1274081 () Bool)

(assert (=> b!1388350 m!1274081))

(assert (=> b!1388350 m!1274081))

(declare-fun m!1274083 () Bool)

(assert (=> b!1388350 m!1274083))

(declare-fun m!1274085 () Bool)

(assert (=> bm!66626 m!1274085))

(assert (=> b!1388351 m!1274081))

(declare-fun m!1274087 () Bool)

(assert (=> b!1388351 m!1274087))

(declare-fun m!1274089 () Bool)

(assert (=> b!1388351 m!1274089))

(assert (=> b!1388351 m!1274081))

(declare-fun m!1274091 () Bool)

(assert (=> b!1388351 m!1274091))

(assert (=> bm!66617 d!149879))

(declare-fun d!149883 () Bool)

(declare-fun lt!610308 () Bool)

(declare-fun content!766 (List!32372) (Set (_ BitVec 64)))

(assert (=> d!149883 (= lt!610308 (member (select (arr!45844 a!2938) #b00000000000000000000000000000000) (content!766 Nil!32369)))))

(declare-fun e!786477 () Bool)

(assert (=> d!149883 (= lt!610308 e!786477)))

(declare-fun res!928725 () Bool)

(assert (=> d!149883 (=> (not res!928725) (not e!786477))))

(assert (=> d!149883 (= res!928725 (is-Cons!32368 Nil!32369))))

(assert (=> d!149883 (= (contains!9749 Nil!32369 (select (arr!45844 a!2938) #b00000000000000000000000000000000)) lt!610308)))

(declare-fun b!1388362 () Bool)

(declare-fun e!786478 () Bool)

(assert (=> b!1388362 (= e!786477 e!786478)))

(declare-fun res!928726 () Bool)

(assert (=> b!1388362 (=> res!928726 e!786478)))

(assert (=> b!1388362 (= res!928726 (= (h!33580 Nil!32369) (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388363 () Bool)

(assert (=> b!1388363 (= e!786478 (contains!9749 (t!47066 Nil!32369) (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149883 res!928725) b!1388362))

(assert (= (and b!1388362 (not res!928726)) b!1388363))

(declare-fun m!1274109 () Bool)

(assert (=> d!149883 m!1274109))

(assert (=> d!149883 m!1273675))

(declare-fun m!1274111 () Bool)

(assert (=> d!149883 m!1274111))

(assert (=> b!1388363 m!1273675))

(declare-fun m!1274113 () Bool)

(assert (=> b!1388363 m!1274113))

(assert (=> b!1388008 d!149883))

(assert (=> d!149767 d!149773))

(declare-fun d!149891 () Bool)

(assert (=> d!149891 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149891 true))

(declare-fun _$72!143 () Unit!46403)

(assert (=> d!149891 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!143)))

(declare-fun bs!40353 () Bool)

(assert (= bs!40353 d!149891))

(assert (=> bs!40353 m!1273639))

(assert (=> d!149767 d!149891))

(assert (=> d!149767 d!149759))

(declare-fun d!149899 () Bool)

(assert (=> d!149899 (arrayContainsKey!0 a!2938 lt!610161 #b00000000000000000000000000000000)))

(declare-fun lt!610315 () Unit!46403)

(declare-fun choose!13 (array!94939 (_ BitVec 64) (_ BitVec 32)) Unit!46403)

(assert (=> d!149899 (= lt!610315 (choose!13 a!2938 lt!610161 startIndex!16))))

(assert (=> d!149899 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149899 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610161 startIndex!16) lt!610315)))

(declare-fun bs!40354 () Bool)

(assert (= bs!40354 d!149899))

(assert (=> bs!40354 m!1273747))

(declare-fun m!1274127 () Bool)

(assert (=> bs!40354 m!1274127))

(assert (=> b!1388077 d!149899))

(declare-fun d!149903 () Bool)

(declare-fun res!928737 () Bool)

(declare-fun e!786492 () Bool)

(assert (=> d!149903 (=> res!928737 e!786492)))

(assert (=> d!149903 (= res!928737 (= (select (arr!45844 a!2938) #b00000000000000000000000000000000) lt!610161))))

(assert (=> d!149903 (= (arrayContainsKey!0 a!2938 lt!610161 #b00000000000000000000000000000000) e!786492)))

(declare-fun b!1388382 () Bool)

(declare-fun e!786493 () Bool)

(assert (=> b!1388382 (= e!786492 e!786493)))

(declare-fun res!928738 () Bool)

(assert (=> b!1388382 (=> (not res!928738) (not e!786493))))

(assert (=> b!1388382 (= res!928738 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46394 a!2938)))))

(declare-fun b!1388383 () Bool)

(assert (=> b!1388383 (= e!786493 (arrayContainsKey!0 a!2938 lt!610161 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149903 (not res!928737)) b!1388382))

(assert (= (and b!1388382 res!928738) b!1388383))

(assert (=> d!149903 m!1273675))

(declare-fun m!1274129 () Bool)

(assert (=> b!1388383 m!1274129))

(assert (=> b!1388077 d!149903))

(assert (=> b!1388077 d!149787))

(declare-fun b!1388384 () Bool)

(declare-fun e!786495 () Bool)

(declare-fun call!66632 () Bool)

(assert (=> b!1388384 (= e!786495 call!66632)))

(declare-fun b!1388385 () Bool)

(declare-fun e!786494 () Bool)

(assert (=> b!1388385 (= e!786494 call!66632)))

(declare-fun b!1388386 () Bool)

(declare-fun e!786496 () Bool)

(assert (=> b!1388386 (= e!786496 e!786494)))

(declare-fun c!129265 () Bool)

(assert (=> b!1388386 (= c!129265 (validKeyInArray!0 (select (arr!45844 lt!610104) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!149905 () Bool)

(declare-fun res!928740 () Bool)

(assert (=> d!149905 (=> res!928740 e!786496)))

(assert (=> d!149905 (= res!928740 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46394 lt!610104)))))

(assert (=> d!149905 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610104 mask!2987) e!786496)))

(declare-fun bm!66629 () Bool)

(assert (=> bm!66629 (= call!66632 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610104 mask!2987))))

(declare-fun b!1388387 () Bool)

(assert (=> b!1388387 (= e!786494 e!786495)))

(declare-fun lt!610318 () (_ BitVec 64))

(assert (=> b!1388387 (= lt!610318 (select (arr!45844 lt!610104) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610317 () Unit!46403)

(assert (=> b!1388387 (= lt!610317 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610104 lt!610318 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388387 (arrayContainsKey!0 lt!610104 lt!610318 #b00000000000000000000000000000000)))

(declare-fun lt!610316 () Unit!46403)

(assert (=> b!1388387 (= lt!610316 lt!610317)))

(declare-fun res!928739 () Bool)

(assert (=> b!1388387 (= res!928739 (= (seekEntryOrOpen!0 (select (arr!45844 lt!610104) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!610104 mask!2987) (Found!10187 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388387 (=> (not res!928739) (not e!786495))))

(assert (= (and d!149905 (not res!928740)) b!1388386))

(assert (= (and b!1388386 c!129265) b!1388387))

(assert (= (and b!1388386 (not c!129265)) b!1388385))

(assert (= (and b!1388387 res!928739) b!1388384))

(assert (= (or b!1388384 b!1388385) bm!66629))

(declare-fun m!1274131 () Bool)

(assert (=> b!1388386 m!1274131))

(assert (=> b!1388386 m!1274131))

(declare-fun m!1274133 () Bool)

(assert (=> b!1388386 m!1274133))

(declare-fun m!1274135 () Bool)

(assert (=> bm!66629 m!1274135))

(assert (=> b!1388387 m!1274131))

(declare-fun m!1274137 () Bool)

(assert (=> b!1388387 m!1274137))

(declare-fun m!1274139 () Bool)

(assert (=> b!1388387 m!1274139))

(assert (=> b!1388387 m!1274131))

(declare-fun m!1274141 () Bool)

(assert (=> b!1388387 m!1274141))

(assert (=> bm!66613 d!149905))

(declare-fun b!1388400 () Bool)

(declare-fun e!786505 () SeekEntryResult!10187)

(assert (=> b!1388400 (= e!786505 Undefined!10187)))

(declare-fun b!1388401 () Bool)

(declare-fun e!786503 () SeekEntryResult!10187)

(assert (=> b!1388401 (= e!786503 (MissingVacant!10187 (index!43121 lt!610192)))))

(declare-fun b!1388403 () Bool)

(declare-fun c!129272 () Bool)

(declare-fun lt!610323 () (_ BitVec 64))

(assert (=> b!1388403 (= c!129272 (= lt!610323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786504 () SeekEntryResult!10187)

(assert (=> b!1388403 (= e!786504 e!786503)))

(declare-fun b!1388404 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1388404 (= e!786503 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124733 lt!610192) #b00000000000000000000000000000001) (nextIndex!0 (index!43121 lt!610192) (x!124733 lt!610192) mask!2987) (index!43121 lt!610192) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388405 () Bool)

(assert (=> b!1388405 (= e!786505 e!786504)))

(declare-fun c!129273 () Bool)

(assert (=> b!1388405 (= c!129273 (= lt!610323 (select (arr!45844 a!2938) startIndex!16)))))

(declare-fun b!1388402 () Bool)

(assert (=> b!1388402 (= e!786504 (Found!10187 (index!43121 lt!610192)))))

(declare-fun lt!610324 () SeekEntryResult!10187)

(declare-fun d!149907 () Bool)

(assert (=> d!149907 (and (or (is-Undefined!10187 lt!610324) (not (is-Found!10187 lt!610324)) (and (bvsge (index!43120 lt!610324) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610324) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610324) (is-Found!10187 lt!610324) (not (is-MissingVacant!10187 lt!610324)) (not (= (index!43122 lt!610324) (index!43121 lt!610192))) (and (bvsge (index!43122 lt!610324) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610324) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610324) (ite (is-Found!10187 lt!610324) (= (select (arr!45844 a!2938) (index!43120 lt!610324)) (select (arr!45844 a!2938) startIndex!16)) (and (is-MissingVacant!10187 lt!610324) (= (index!43122 lt!610324) (index!43121 lt!610192)) (= (select (arr!45844 a!2938) (index!43122 lt!610324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149907 (= lt!610324 e!786505)))

(declare-fun c!129274 () Bool)

(assert (=> d!149907 (= c!129274 (bvsge (x!124733 lt!610192) #b01111111111111111111111111111110))))

(assert (=> d!149907 (= lt!610323 (select (arr!45844 a!2938) (index!43121 lt!610192)))))

(assert (=> d!149907 (validMask!0 mask!2987)))

(assert (=> d!149907 (= (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610192) (index!43121 lt!610192) (index!43121 lt!610192) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) lt!610324)))

(assert (= (and d!149907 c!129274) b!1388400))

(assert (= (and d!149907 (not c!129274)) b!1388405))

(assert (= (and b!1388405 c!129273) b!1388402))

(assert (= (and b!1388405 (not c!129273)) b!1388403))

(assert (= (and b!1388403 c!129272) b!1388401))

(assert (= (and b!1388403 (not c!129272)) b!1388404))

(declare-fun m!1274143 () Bool)

(assert (=> b!1388404 m!1274143))

(assert (=> b!1388404 m!1274143))

(assert (=> b!1388404 m!1273623))

(declare-fun m!1274145 () Bool)

(assert (=> b!1388404 m!1274145))

(declare-fun m!1274147 () Bool)

(assert (=> d!149907 m!1274147))

(declare-fun m!1274149 () Bool)

(assert (=> d!149907 m!1274149))

(assert (=> d!149907 m!1273793))

(assert (=> d!149907 m!1273613))

(assert (=> b!1388121 d!149907))

(declare-fun d!149909 () Bool)

(assert (=> d!149909 (= (validKeyInArray!0 (select (arr!45844 lt!610104) startIndex!16)) (and (not (= (select (arr!45844 lt!610104) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45844 lt!610104) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388039 d!149909))

(declare-fun d!149911 () Bool)

(assert (=> d!149911 (arrayContainsKey!0 lt!610104 lt!610146 #b00000000000000000000000000000000)))

(declare-fun lt!610325 () Unit!46403)

(assert (=> d!149911 (= lt!610325 (choose!13 lt!610104 lt!610146 startIndex!16))))

(assert (=> d!149911 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149911 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610104 lt!610146 startIndex!16) lt!610325)))

(declare-fun bs!40355 () Bool)

(assert (= bs!40355 d!149911))

(assert (=> bs!40355 m!1273715))

(declare-fun m!1274151 () Bool)

(assert (=> bs!40355 m!1274151))

(assert (=> b!1388040 d!149911))

(declare-fun d!149913 () Bool)

(declare-fun res!928741 () Bool)

(declare-fun e!786506 () Bool)

(assert (=> d!149913 (=> res!928741 e!786506)))

(assert (=> d!149913 (= res!928741 (= (select (arr!45844 lt!610104) #b00000000000000000000000000000000) lt!610146))))

(assert (=> d!149913 (= (arrayContainsKey!0 lt!610104 lt!610146 #b00000000000000000000000000000000) e!786506)))

(declare-fun b!1388406 () Bool)

(declare-fun e!786507 () Bool)

(assert (=> b!1388406 (= e!786506 e!786507)))

(declare-fun res!928742 () Bool)

(assert (=> b!1388406 (=> (not res!928742) (not e!786507))))

(assert (=> b!1388406 (= res!928742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46394 lt!610104)))))

(declare-fun b!1388407 () Bool)

(assert (=> b!1388407 (= e!786507 (arrayContainsKey!0 lt!610104 lt!610146 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149913 (not res!928741)) b!1388406))

(assert (= (and b!1388406 res!928742) b!1388407))

(declare-fun m!1274153 () Bool)

(assert (=> d!149913 m!1274153))

(declare-fun m!1274155 () Bool)

(assert (=> b!1388407 m!1274155))

(assert (=> b!1388040 d!149913))

(declare-fun b!1388408 () Bool)

(declare-fun e!786509 () SeekEntryResult!10187)

(assert (=> b!1388408 (= e!786509 Undefined!10187)))

(declare-fun d!149915 () Bool)

(declare-fun lt!610327 () SeekEntryResult!10187)

(assert (=> d!149915 (and (or (is-Undefined!10187 lt!610327) (not (is-Found!10187 lt!610327)) (and (bvsge (index!43120 lt!610327) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610327) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610327) (is-Found!10187 lt!610327) (not (is-MissingZero!10187 lt!610327)) (and (bvsge (index!43119 lt!610327) #b00000000000000000000000000000000) (bvslt (index!43119 lt!610327) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610327) (is-Found!10187 lt!610327) (is-MissingZero!10187 lt!610327) (not (is-MissingVacant!10187 lt!610327)) (and (bvsge (index!43122 lt!610327) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610327) (size!46394 lt!610104)))) (or (is-Undefined!10187 lt!610327) (ite (is-Found!10187 lt!610327) (= (select (arr!45844 lt!610104) (index!43120 lt!610327)) (select (arr!45844 lt!610104) startIndex!16)) (ite (is-MissingZero!10187 lt!610327) (= (select (arr!45844 lt!610104) (index!43119 lt!610327)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10187 lt!610327) (= (select (arr!45844 lt!610104) (index!43122 lt!610327)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149915 (= lt!610327 e!786509)))

(declare-fun c!129275 () Bool)

(declare-fun lt!610326 () SeekEntryResult!10187)

(assert (=> d!149915 (= c!129275 (and (is-Intermediate!10187 lt!610326) (undefined!10999 lt!610326)))))

(assert (=> d!149915 (= lt!610326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45844 lt!610104) startIndex!16) mask!2987) (select (arr!45844 lt!610104) startIndex!16) lt!610104 mask!2987))))

(assert (=> d!149915 (validMask!0 mask!2987)))

(assert (=> d!149915 (= (seekEntryOrOpen!0 (select (arr!45844 lt!610104) startIndex!16) lt!610104 mask!2987) lt!610327)))

(declare-fun b!1388409 () Bool)

(declare-fun c!129276 () Bool)

(declare-fun lt!610328 () (_ BitVec 64))

(assert (=> b!1388409 (= c!129276 (= lt!610328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786510 () SeekEntryResult!10187)

(declare-fun e!786508 () SeekEntryResult!10187)

(assert (=> b!1388409 (= e!786510 e!786508)))

(declare-fun b!1388410 () Bool)

(assert (=> b!1388410 (= e!786508 (MissingZero!10187 (index!43121 lt!610326)))))

(declare-fun b!1388411 () Bool)

(assert (=> b!1388411 (= e!786508 (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610326) (index!43121 lt!610326) (index!43121 lt!610326) (select (arr!45844 lt!610104) startIndex!16) lt!610104 mask!2987))))

(declare-fun b!1388412 () Bool)

(assert (=> b!1388412 (= e!786510 (Found!10187 (index!43121 lt!610326)))))

(declare-fun b!1388413 () Bool)

(assert (=> b!1388413 (= e!786509 e!786510)))

(assert (=> b!1388413 (= lt!610328 (select (arr!45844 lt!610104) (index!43121 lt!610326)))))

(declare-fun c!129277 () Bool)

(assert (=> b!1388413 (= c!129277 (= lt!610328 (select (arr!45844 lt!610104) startIndex!16)))))

(assert (= (and d!149915 c!129275) b!1388408))

(assert (= (and d!149915 (not c!129275)) b!1388413))

(assert (= (and b!1388413 c!129277) b!1388412))

(assert (= (and b!1388413 (not c!129277)) b!1388409))

(assert (= (and b!1388409 c!129276) b!1388410))

(assert (= (and b!1388409 (not c!129276)) b!1388411))

(assert (=> d!149915 m!1273707))

(declare-fun m!1274157 () Bool)

(assert (=> d!149915 m!1274157))

(assert (=> d!149915 m!1274157))

(assert (=> d!149915 m!1273707))

(declare-fun m!1274159 () Bool)

(assert (=> d!149915 m!1274159))

(assert (=> d!149915 m!1273613))

(declare-fun m!1274161 () Bool)

(assert (=> d!149915 m!1274161))

(declare-fun m!1274163 () Bool)

(assert (=> d!149915 m!1274163))

(declare-fun m!1274165 () Bool)

(assert (=> d!149915 m!1274165))

(assert (=> b!1388411 m!1273707))

(declare-fun m!1274167 () Bool)

(assert (=> b!1388411 m!1274167))

(declare-fun m!1274169 () Bool)

(assert (=> b!1388413 m!1274169))

(assert (=> b!1388040 d!149915))

(assert (=> b!1388076 d!149757))

(declare-fun b!1388432 () Bool)

(declare-fun lt!610334 () SeekEntryResult!10187)

(assert (=> b!1388432 (and (bvsge (index!43121 lt!610334) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610334) (size!46394 a!2938)))))

(declare-fun e!786524 () Bool)

(assert (=> b!1388432 (= e!786524 (= (select (arr!45844 a!2938) (index!43121 lt!610334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388433 () Bool)

(assert (=> b!1388433 (and (bvsge (index!43121 lt!610334) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610334) (size!46394 a!2938)))))

(declare-fun res!928751 () Bool)

(assert (=> b!1388433 (= res!928751 (= (select (arr!45844 a!2938) (index!43121 lt!610334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388433 (=> res!928751 e!786524)))

(declare-fun b!1388434 () Bool)

(declare-fun e!786523 () SeekEntryResult!10187)

(declare-fun e!786525 () SeekEntryResult!10187)

(assert (=> b!1388434 (= e!786523 e!786525)))

(declare-fun c!129286 () Bool)

(declare-fun lt!610333 () (_ BitVec 64))

(assert (=> b!1388434 (= c!129286 (or (= lt!610333 (select (arr!45844 a!2938) startIndex!16)) (= (bvadd lt!610333 lt!610333) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!149917 () Bool)

(declare-fun e!786521 () Bool)

(assert (=> d!149917 e!786521))

(declare-fun c!129284 () Bool)

(assert (=> d!149917 (= c!129284 (and (is-Intermediate!10187 lt!610334) (undefined!10999 lt!610334)))))

(assert (=> d!149917 (= lt!610334 e!786523)))

(declare-fun c!129285 () Bool)

(assert (=> d!149917 (= c!129285 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149917 (= lt!610333 (select (arr!45844 a!2938) (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149917 (validMask!0 mask!2987)))

(assert (=> d!149917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987) lt!610334)))

(declare-fun b!1388435 () Bool)

(assert (=> b!1388435 (= e!786525 (Intermediate!10187 false (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388436 () Bool)

(assert (=> b!1388436 (= e!786521 (bvsge (x!124733 lt!610334) #b01111111111111111111111111111110))))

(declare-fun b!1388437 () Bool)

(assert (=> b!1388437 (and (bvsge (index!43121 lt!610334) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610334) (size!46394 a!2938)))))

(declare-fun res!928749 () Bool)

(assert (=> b!1388437 (= res!928749 (= (select (arr!45844 a!2938) (index!43121 lt!610334)) (select (arr!45844 a!2938) startIndex!16)))))

(assert (=> b!1388437 (=> res!928749 e!786524)))

(declare-fun e!786522 () Bool)

(assert (=> b!1388437 (= e!786522 e!786524)))

(declare-fun b!1388438 () Bool)

(assert (=> b!1388438 (= e!786521 e!786522)))

(declare-fun res!928750 () Bool)

(assert (=> b!1388438 (= res!928750 (and (is-Intermediate!10187 lt!610334) (not (undefined!10999 lt!610334)) (bvslt (x!124733 lt!610334) #b01111111111111111111111111111110) (bvsge (x!124733 lt!610334) #b00000000000000000000000000000000) (bvsge (x!124733 lt!610334) #b00000000000000000000000000000000)))))

(assert (=> b!1388438 (=> (not res!928750) (not e!786522))))

(declare-fun b!1388439 () Bool)

(assert (=> b!1388439 (= e!786523 (Intermediate!10187 true (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388440 () Bool)

(assert (=> b!1388440 (= e!786525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45844 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (= (and d!149917 c!129285) b!1388439))

(assert (= (and d!149917 (not c!129285)) b!1388434))

(assert (= (and b!1388434 c!129286) b!1388435))

(assert (= (and b!1388434 (not c!129286)) b!1388440))

(assert (= (and d!149917 c!129284) b!1388436))

(assert (= (and d!149917 (not c!129284)) b!1388438))

(assert (= (and b!1388438 res!928750) b!1388437))

(assert (= (and b!1388437 (not res!928749)) b!1388433))

(assert (= (and b!1388433 (not res!928751)) b!1388432))

(assert (=> d!149917 m!1273781))

(declare-fun m!1274171 () Bool)

(assert (=> d!149917 m!1274171))

(assert (=> d!149917 m!1273613))

(declare-fun m!1274173 () Bool)

(assert (=> b!1388432 m!1274173))

(assert (=> b!1388433 m!1274173))

(assert (=> b!1388437 m!1274173))

(assert (=> b!1388440 m!1273781))

(declare-fun m!1274175 () Bool)

(assert (=> b!1388440 m!1274175))

(assert (=> b!1388440 m!1274175))

(assert (=> b!1388440 m!1273623))

(declare-fun m!1274177 () Bool)

(assert (=> b!1388440 m!1274177))

(assert (=> d!149787 d!149917))

(declare-fun d!149919 () Bool)

(declare-fun lt!610340 () (_ BitVec 32))

(declare-fun lt!610339 () (_ BitVec 32))

(assert (=> d!149919 (= lt!610340 (bvmul (bvxor lt!610339 (bvlshr lt!610339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149919 (= lt!610339 ((_ extract 31 0) (bvand (bvxor (select (arr!45844 a!2938) startIndex!16) (bvlshr (select (arr!45844 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149919 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928752 (let ((h!33583 ((_ extract 31 0) (bvand (bvxor (select (arr!45844 a!2938) startIndex!16) (bvlshr (select (arr!45844 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124742 (bvmul (bvxor h!33583 (bvlshr h!33583 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124742 (bvlshr x!124742 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928752 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928752 #b00000000000000000000000000000000))))))

(assert (=> d!149919 (= (toIndex!0 (select (arr!45844 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610340 (bvlshr lt!610340 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149787 d!149919))

(assert (=> d!149787 d!149759))

(declare-fun d!149921 () Bool)

(assert (=> d!149921 (arrayContainsKey!0 a!2938 lt!610143 #b00000000000000000000000000000000)))

(declare-fun lt!610341 () Unit!46403)

(assert (=> d!149921 (= lt!610341 (choose!13 a!2938 lt!610143 #b00000000000000000000000000000000))))

(assert (=> d!149921 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149921 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610143 #b00000000000000000000000000000000) lt!610341)))

(declare-fun bs!40356 () Bool)

(assert (= bs!40356 d!149921))

(assert (=> bs!40356 m!1273703))

(declare-fun m!1274179 () Bool)

(assert (=> bs!40356 m!1274179))

(assert (=> b!1388036 d!149921))

(declare-fun d!149923 () Bool)

(declare-fun res!928753 () Bool)

(declare-fun e!786526 () Bool)

(assert (=> d!149923 (=> res!928753 e!786526)))

(assert (=> d!149923 (= res!928753 (= (select (arr!45844 a!2938) #b00000000000000000000000000000000) lt!610143))))

(assert (=> d!149923 (= (arrayContainsKey!0 a!2938 lt!610143 #b00000000000000000000000000000000) e!786526)))

(declare-fun b!1388441 () Bool)

(declare-fun e!786527 () Bool)

(assert (=> b!1388441 (= e!786526 e!786527)))

(declare-fun res!928754 () Bool)

(assert (=> b!1388441 (=> (not res!928754) (not e!786527))))

(assert (=> b!1388441 (= res!928754 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46394 a!2938)))))

(declare-fun b!1388442 () Bool)

(assert (=> b!1388442 (= e!786527 (arrayContainsKey!0 a!2938 lt!610143 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149923 (not res!928753)) b!1388441))

(assert (= (and b!1388441 res!928754) b!1388442))

(assert (=> d!149923 m!1273675))

(declare-fun m!1274181 () Bool)

(assert (=> b!1388442 m!1274181))

(assert (=> b!1388036 d!149923))

(declare-fun b!1388443 () Bool)

(declare-fun e!786529 () SeekEntryResult!10187)

(assert (=> b!1388443 (= e!786529 Undefined!10187)))

(declare-fun d!149925 () Bool)

(declare-fun lt!610343 () SeekEntryResult!10187)

(assert (=> d!149925 (and (or (is-Undefined!10187 lt!610343) (not (is-Found!10187 lt!610343)) (and (bvsge (index!43120 lt!610343) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610343) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610343) (is-Found!10187 lt!610343) (not (is-MissingZero!10187 lt!610343)) (and (bvsge (index!43119 lt!610343) #b00000000000000000000000000000000) (bvslt (index!43119 lt!610343) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610343) (is-Found!10187 lt!610343) (is-MissingZero!10187 lt!610343) (not (is-MissingVacant!10187 lt!610343)) (and (bvsge (index!43122 lt!610343) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610343) (size!46394 a!2938)))) (or (is-Undefined!10187 lt!610343) (ite (is-Found!10187 lt!610343) (= (select (arr!45844 a!2938) (index!43120 lt!610343)) (select (arr!45844 a!2938) #b00000000000000000000000000000000)) (ite (is-MissingZero!10187 lt!610343) (= (select (arr!45844 a!2938) (index!43119 lt!610343)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10187 lt!610343) (= (select (arr!45844 a!2938) (index!43122 lt!610343)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149925 (= lt!610343 e!786529)))

(declare-fun c!129287 () Bool)

(declare-fun lt!610342 () SeekEntryResult!10187)

(assert (=> d!149925 (= c!129287 (and (is-Intermediate!10187 lt!610342) (undefined!10999 lt!610342)))))

(assert (=> d!149925 (= lt!610342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45844 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149925 (validMask!0 mask!2987)))

(assert (=> d!149925 (= (seekEntryOrOpen!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610343)))

(declare-fun b!1388444 () Bool)

(declare-fun c!129288 () Bool)

(declare-fun lt!610344 () (_ BitVec 64))

(assert (=> b!1388444 (= c!129288 (= lt!610344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786530 () SeekEntryResult!10187)

(declare-fun e!786528 () SeekEntryResult!10187)

(assert (=> b!1388444 (= e!786530 e!786528)))

(declare-fun b!1388445 () Bool)

(assert (=> b!1388445 (= e!786528 (MissingZero!10187 (index!43121 lt!610342)))))

(declare-fun b!1388446 () Bool)

(assert (=> b!1388446 (= e!786528 (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610342) (index!43121 lt!610342) (index!43121 lt!610342) (select (arr!45844 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1388447 () Bool)

(assert (=> b!1388447 (= e!786530 (Found!10187 (index!43121 lt!610342)))))

(declare-fun b!1388448 () Bool)

(assert (=> b!1388448 (= e!786529 e!786530)))

(assert (=> b!1388448 (= lt!610344 (select (arr!45844 a!2938) (index!43121 lt!610342)))))

(declare-fun c!129289 () Bool)

(assert (=> b!1388448 (= c!129289 (= lt!610344 (select (arr!45844 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149925 c!129287) b!1388443))

(assert (= (and d!149925 (not c!129287)) b!1388448))

(assert (= (and b!1388448 c!129289) b!1388447))

(assert (= (and b!1388448 (not c!129289)) b!1388444))

(assert (= (and b!1388444 c!129288) b!1388445))

(assert (= (and b!1388444 (not c!129288)) b!1388446))

(assert (=> d!149925 m!1273675))

(declare-fun m!1274183 () Bool)

(assert (=> d!149925 m!1274183))

(assert (=> d!149925 m!1274183))

(assert (=> d!149925 m!1273675))

(declare-fun m!1274185 () Bool)

(assert (=> d!149925 m!1274185))

(assert (=> d!149925 m!1273613))

(declare-fun m!1274187 () Bool)

(assert (=> d!149925 m!1274187))

(declare-fun m!1274189 () Bool)

(assert (=> d!149925 m!1274189))

(declare-fun m!1274191 () Bool)

(assert (=> d!149925 m!1274191))

(assert (=> b!1388446 m!1273675))

(declare-fun m!1274193 () Bool)

(assert (=> b!1388446 m!1274193))

(declare-fun m!1274195 () Bool)

(assert (=> b!1388448 m!1274195))

(assert (=> b!1388036 d!149925))

(declare-fun d!149927 () Bool)

(assert (=> d!149927 (= (validKeyInArray!0 (select (arr!45844 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45844 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45844 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388011 d!149927))

(assert (=> b!1388090 d!149787))

(declare-fun b!1388449 () Bool)

(declare-fun e!786532 () SeekEntryResult!10187)

(assert (=> b!1388449 (= e!786532 Undefined!10187)))

(declare-fun d!149929 () Bool)

(declare-fun lt!610346 () SeekEntryResult!10187)

(assert (=> d!149929 (and (or (is-Undefined!10187 lt!610346) (not (is-Found!10187 lt!610346)) (and (bvsge (index!43120 lt!610346) #b00000000000000000000000000000000) (bvslt (index!43120 lt!610346) (size!46394 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)))))) (or (is-Undefined!10187 lt!610346) (is-Found!10187 lt!610346) (not (is-MissingZero!10187 lt!610346)) (and (bvsge (index!43119 lt!610346) #b00000000000000000000000000000000) (bvslt (index!43119 lt!610346) (size!46394 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)))))) (or (is-Undefined!10187 lt!610346) (is-Found!10187 lt!610346) (is-MissingZero!10187 lt!610346) (not (is-MissingVacant!10187 lt!610346)) (and (bvsge (index!43122 lt!610346) #b00000000000000000000000000000000) (bvslt (index!43122 lt!610346) (size!46394 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)))))) (or (is-Undefined!10187 lt!610346) (ite (is-Found!10187 lt!610346) (= (select (arr!45844 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938))) (index!43120 lt!610346)) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10187 lt!610346) (= (select (arr!45844 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938))) (index!43119 lt!610346)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10187 lt!610346) (= (select (arr!45844 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938))) (index!43122 lt!610346)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149929 (= lt!610346 e!786532)))

(declare-fun c!129290 () Bool)

(declare-fun lt!610345 () SeekEntryResult!10187)

(assert (=> d!149929 (= c!129290 (and (is-Intermediate!10187 lt!610345) (undefined!10999 lt!610345)))))

(assert (=> d!149929 (= lt!610345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)) mask!2987))))

(assert (=> d!149929 (validMask!0 mask!2987)))

(assert (=> d!149929 (= (seekEntryOrOpen!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)) mask!2987) lt!610346)))

(declare-fun b!1388450 () Bool)

(declare-fun c!129291 () Bool)

(declare-fun lt!610347 () (_ BitVec 64))

(assert (=> b!1388450 (= c!129291 (= lt!610347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786533 () SeekEntryResult!10187)

(declare-fun e!786531 () SeekEntryResult!10187)

(assert (=> b!1388450 (= e!786533 e!786531)))

(declare-fun b!1388451 () Bool)

(assert (=> b!1388451 (= e!786531 (MissingZero!10187 (index!43121 lt!610345)))))

(declare-fun b!1388452 () Bool)

(assert (=> b!1388452 (= e!786531 (seekKeyOrZeroReturnVacant!0 (x!124733 lt!610345) (index!43121 lt!610345) (index!43121 lt!610345) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938)) mask!2987))))

(declare-fun b!1388453 () Bool)

(assert (=> b!1388453 (= e!786533 (Found!10187 (index!43121 lt!610345)))))

(declare-fun b!1388454 () Bool)

(assert (=> b!1388454 (= e!786532 e!786533)))

(assert (=> b!1388454 (= lt!610347 (select (arr!45844 (array!94940 (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46394 a!2938))) (index!43121 lt!610345)))))

(declare-fun c!129292 () Bool)

(assert (=> b!1388454 (= c!129292 (= lt!610347 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (= (and d!149929 c!129290) b!1388449))

(assert (= (and d!149929 (not c!129290)) b!1388454))

(assert (= (and b!1388454 c!129292) b!1388453))

(assert (= (and b!1388454 (not c!129292)) b!1388450))

(assert (= (and b!1388450 c!129291) b!1388451))

(assert (= (and b!1388450 (not c!129291)) b!1388452))

(assert (=> d!149929 m!1273631))

(assert (=> d!149929 m!1273795))

(assert (=> d!149929 m!1273795))

(assert (=> d!149929 m!1273631))

(declare-fun m!1274197 () Bool)

(assert (=> d!149929 m!1274197))

(assert (=> d!149929 m!1273613))

(declare-fun m!1274199 () Bool)

(assert (=> d!149929 m!1274199))

(declare-fun m!1274201 () Bool)

(assert (=> d!149929 m!1274201))

(declare-fun m!1274203 () Bool)

(assert (=> d!149929 m!1274203))

(assert (=> b!1388452 m!1273631))

(declare-fun m!1274205 () Bool)

(assert (=> b!1388452 m!1274205))

(declare-fun m!1274207 () Bool)

(assert (=> b!1388454 m!1274207))

(assert (=> b!1388090 d!149929))

(declare-fun b!1388455 () Bool)

(declare-fun lt!610349 () SeekEntryResult!10187)

(assert (=> b!1388455 (and (bvsge (index!43121 lt!610349) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610349) (size!46394 lt!610104)))))

(declare-fun e!786537 () Bool)

(assert (=> b!1388455 (= e!786537 (= (select (arr!45844 lt!610104) (index!43121 lt!610349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388456 () Bool)

(assert (=> b!1388456 (and (bvsge (index!43121 lt!610349) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610349) (size!46394 lt!610104)))))

(declare-fun res!928757 () Bool)

(assert (=> b!1388456 (= res!928757 (= (select (arr!45844 lt!610104) (index!43121 lt!610349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388456 (=> res!928757 e!786537)))

(declare-fun b!1388457 () Bool)

(declare-fun e!786536 () SeekEntryResult!10187)

(declare-fun e!786538 () SeekEntryResult!10187)

(assert (=> b!1388457 (= e!786536 e!786538)))

(declare-fun c!129295 () Bool)

(declare-fun lt!610348 () (_ BitVec 64))

(assert (=> b!1388457 (= c!129295 (or (= lt!610348 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610348 lt!610348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!149931 () Bool)

(declare-fun e!786534 () Bool)

(assert (=> d!149931 e!786534))

(declare-fun c!129293 () Bool)

(assert (=> d!149931 (= c!129293 (and (is-Intermediate!10187 lt!610349) (undefined!10999 lt!610349)))))

(assert (=> d!149931 (= lt!610349 e!786536)))

(declare-fun c!129294 () Bool)

(assert (=> d!149931 (= c!129294 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149931 (= lt!610348 (select (arr!45844 lt!610104) (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149931 (validMask!0 mask!2987)))

(assert (=> d!149931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987) lt!610349)))

(declare-fun b!1388458 () Bool)

(assert (=> b!1388458 (= e!786538 (Intermediate!10187 false (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388459 () Bool)

(assert (=> b!1388459 (= e!786534 (bvsge (x!124733 lt!610349) #b01111111111111111111111111111110))))

(declare-fun b!1388460 () Bool)

(assert (=> b!1388460 (and (bvsge (index!43121 lt!610349) #b00000000000000000000000000000000) (bvslt (index!43121 lt!610349) (size!46394 lt!610104)))))

(declare-fun res!928755 () Bool)

(assert (=> b!1388460 (= res!928755 (= (select (arr!45844 lt!610104) (index!43121 lt!610349)) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1388460 (=> res!928755 e!786537)))

(declare-fun e!786535 () Bool)

(assert (=> b!1388460 (= e!786535 e!786537)))

(declare-fun b!1388461 () Bool)

(assert (=> b!1388461 (= e!786534 e!786535)))

(declare-fun res!928756 () Bool)

(assert (=> b!1388461 (= res!928756 (and (is-Intermediate!10187 lt!610349) (not (undefined!10999 lt!610349)) (bvslt (x!124733 lt!610349) #b01111111111111111111111111111110) (bvsge (x!124733 lt!610349) #b00000000000000000000000000000000) (bvsge (x!124733 lt!610349) #b00000000000000000000000000000000)))))

(assert (=> b!1388461 (=> (not res!928756) (not e!786535))))

(declare-fun b!1388462 () Bool)

(assert (=> b!1388462 (= e!786536 (Intermediate!10187 true (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388463 () Bool)

(assert (=> b!1388463 (= e!786538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610104 mask!2987))))

(assert (= (and d!149931 c!129294) b!1388462))

(assert (= (and d!149931 (not c!129294)) b!1388457))

(assert (= (and b!1388457 c!129295) b!1388458))

(assert (= (and b!1388457 (not c!129295)) b!1388463))

(assert (= (and d!149931 c!129293) b!1388459))

(assert (= (and d!149931 (not c!129293)) b!1388461))

(assert (= (and b!1388461 res!928756) b!1388460))

(assert (= (and b!1388460 (not res!928755)) b!1388456))

(assert (= (and b!1388456 (not res!928757)) b!1388455))

(assert (=> d!149931 m!1273795))

(declare-fun m!1274209 () Bool)

(assert (=> d!149931 m!1274209))

(assert (=> d!149931 m!1273613))

(declare-fun m!1274211 () Bool)

(assert (=> b!1388455 m!1274211))

(assert (=> b!1388456 m!1274211))

(assert (=> b!1388460 m!1274211))

(assert (=> b!1388463 m!1273795))

(declare-fun m!1274213 () Bool)

(assert (=> b!1388463 m!1274213))

(assert (=> b!1388463 m!1274213))

(assert (=> b!1388463 m!1273631))

(declare-fun m!1274215 () Bool)

(assert (=> b!1388463 m!1274215))

(assert (=> d!149791 d!149931))

(declare-fun d!149933 () Bool)

(declare-fun lt!610351 () (_ BitVec 32))

(declare-fun lt!610350 () (_ BitVec 32))

(assert (=> d!149933 (= lt!610351 (bvmul (bvxor lt!610350 (bvlshr lt!610350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149933 (= lt!610350 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149933 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928752 (let ((h!33583 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124742 (bvmul (bvxor h!33583 (bvlshr h!33583 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124742 (bvlshr x!124742 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928752 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928752 #b00000000000000000000000000000000))))))

(assert (=> d!149933 (= (toIndex!0 (select (store (arr!45844 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610351 (bvlshr lt!610351 #b00000000000000000000000000001101)) mask!2987))))

