; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118644 () Bool)

(assert start!118644)

(declare-fun b!1387131 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun e!785710 () Bool)

(declare-datatypes ((array!94920 0))(
  ( (array!94921 (arr!45836 (Array (_ BitVec 32) (_ BitVec 64))) (size!46386 (_ BitVec 32))) )
))
(declare-fun lt!609713 () array!94920)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94920 (_ BitVec 32)) Bool)

(assert (=> b!1387131 (= e!785710 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609713 mask!2987)))))

(assert (=> b!1387131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609713 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun a!2938 () array!94920)

(declare-datatypes ((Unit!46379 0))(
  ( (Unit!46380) )
))
(declare-fun lt!609715 () Unit!46379)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> b!1387131 (= lt!609715 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387132 () Bool)

(declare-fun res!928186 () Bool)

(declare-fun e!785714 () Bool)

(assert (=> b!1387132 (=> (not res!928186) (not e!785714))))

(assert (=> b!1387132 (= res!928186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387133 () Bool)

(declare-fun res!928180 () Bool)

(assert (=> b!1387133 (=> (not res!928180) (not e!785714))))

(declare-datatypes ((List!32364 0))(
  ( (Nil!32361) (Cons!32360 (h!33569 (_ BitVec 64)) (t!47058 List!32364)) )
))
(declare-fun arrayNoDuplicates!0 (array!94920 (_ BitVec 32) List!32364) Bool)

(assert (=> b!1387133 (= res!928180 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32361))))

(declare-fun b!1387134 () Bool)

(declare-fun e!785711 () Unit!46379)

(declare-fun Unit!46381 () Unit!46379)

(assert (=> b!1387134 (= e!785711 Unit!46381)))

(declare-fun b!1387135 () Bool)

(declare-fun res!928181 () Bool)

(assert (=> b!1387135 (=> (not res!928181) (not e!785714))))

(assert (=> b!1387135 (= res!928181 (and (not (= (select (arr!45836 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387136 () Bool)

(declare-fun lt!609716 () Unit!46379)

(assert (=> b!1387136 (= e!785711 lt!609716)))

(declare-fun lt!609717 () Unit!46379)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> b!1387136 (= lt!609717 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10179 0))(
  ( (MissingZero!10179 (index!43087 (_ BitVec 32))) (Found!10179 (index!43088 (_ BitVec 32))) (Intermediate!10179 (undefined!10991 Bool) (index!43089 (_ BitVec 32)) (x!124700 (_ BitVec 32))) (Undefined!10179) (MissingVacant!10179 (index!43090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94920 (_ BitVec 32)) SeekEntryResult!10179)

(assert (=> b!1387136 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> b!1387136 (= lt!609716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387136 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928183 () Bool)

(assert (=> start!118644 (=> (not res!928183) (not e!785714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118644 (= res!928183 (validMask!0 mask!2987))))

(assert (=> start!118644 e!785714))

(assert (=> start!118644 true))

(declare-fun array_inv!34864 (array!94920) Bool)

(assert (=> start!118644 (array_inv!34864 a!2938)))

(declare-fun b!1387137 () Bool)

(declare-fun e!785713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387137 (= e!785713 (validKeyInArray!0 (select (arr!45836 a!2938) startIndex!16)))))

(declare-fun b!1387138 () Bool)

(declare-fun res!928185 () Bool)

(assert (=> b!1387138 (=> (not res!928185) (not e!785714))))

(assert (=> b!1387138 (= res!928185 (validKeyInArray!0 (select (arr!45836 a!2938) i!1065)))))

(declare-fun b!1387139 () Bool)

(assert (=> b!1387139 (= e!785714 e!785710)))

(declare-fun res!928182 () Bool)

(assert (=> b!1387139 (=> (not res!928182) (not e!785710))))

(assert (=> b!1387139 (= res!928182 (and (bvslt startIndex!16 (bvsub (size!46386 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609714 () Unit!46379)

(assert (=> b!1387139 (= lt!609714 e!785711)))

(declare-fun c!128916 () Bool)

(assert (=> b!1387139 (= c!128916 e!785713)))

(declare-fun res!928184 () Bool)

(assert (=> b!1387139 (=> (not res!928184) (not e!785713))))

(assert (=> b!1387139 (= res!928184 (not (= startIndex!16 i!1065)))))

(assert (=> b!1387139 (= lt!609713 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)))))

(declare-fun b!1387140 () Bool)

(declare-fun res!928179 () Bool)

(assert (=> b!1387140 (=> (not res!928179) (not e!785714))))

(assert (=> b!1387140 (= res!928179 (and (= (size!46386 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46386 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46386 a!2938))))))

(assert (= (and start!118644 res!928183) b!1387140))

(assert (= (and b!1387140 res!928179) b!1387138))

(assert (= (and b!1387138 res!928185) b!1387133))

(assert (= (and b!1387133 res!928180) b!1387132))

(assert (= (and b!1387132 res!928186) b!1387135))

(assert (= (and b!1387135 res!928181) b!1387139))

(assert (= (and b!1387139 res!928184) b!1387137))

(assert (= (and b!1387139 c!128916) b!1387136))

(assert (= (and b!1387139 (not c!128916)) b!1387134))

(assert (= (and b!1387139 res!928182) b!1387131))

(declare-fun m!1272573 () Bool)

(assert (=> b!1387133 m!1272573))

(declare-fun m!1272575 () Bool)

(assert (=> b!1387138 m!1272575))

(assert (=> b!1387138 m!1272575))

(declare-fun m!1272577 () Bool)

(assert (=> b!1387138 m!1272577))

(declare-fun m!1272579 () Bool)

(assert (=> b!1387131 m!1272579))

(declare-fun m!1272581 () Bool)

(assert (=> b!1387131 m!1272581))

(declare-fun m!1272583 () Bool)

(assert (=> b!1387131 m!1272583))

(declare-fun m!1272585 () Bool)

(assert (=> b!1387139 m!1272585))

(declare-fun m!1272587 () Bool)

(assert (=> b!1387132 m!1272587))

(assert (=> b!1387135 m!1272575))

(declare-fun m!1272589 () Bool)

(assert (=> start!118644 m!1272589))

(declare-fun m!1272591 () Bool)

(assert (=> start!118644 m!1272591))

(declare-fun m!1272593 () Bool)

(assert (=> b!1387136 m!1272593))

(declare-fun m!1272595 () Bool)

(assert (=> b!1387136 m!1272595))

(assert (=> b!1387136 m!1272585))

(assert (=> b!1387136 m!1272595))

(declare-fun m!1272597 () Bool)

(assert (=> b!1387136 m!1272597))

(declare-fun m!1272599 () Bool)

(assert (=> b!1387136 m!1272599))

(declare-fun m!1272601 () Bool)

(assert (=> b!1387136 m!1272601))

(declare-fun m!1272603 () Bool)

(assert (=> b!1387136 m!1272603))

(assert (=> b!1387136 m!1272601))

(declare-fun m!1272605 () Bool)

(assert (=> b!1387136 m!1272605))

(assert (=> b!1387137 m!1272601))

(assert (=> b!1387137 m!1272601))

(declare-fun m!1272607 () Bool)

(assert (=> b!1387137 m!1272607))

(push 1)

(assert (not b!1387133))

(assert (not b!1387132))

(assert (not b!1387138))

(assert (not start!118644))

(assert (not b!1387136))

(assert (not b!1387131))

(assert (not b!1387137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149467 () Bool)

(assert (=> d!149467 (= (validKeyInArray!0 (select (arr!45836 a!2938) i!1065)) (and (not (= (select (arr!45836 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387138 d!149467))

(declare-fun d!149469 () Bool)

(assert (=> d!149469 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118644 d!149469))

(declare-fun d!149473 () Bool)

(assert (=> d!149473 (= (array_inv!34864 a!2938) (bvsge (size!46386 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118644 d!149473))

(declare-fun b!1387239 () Bool)

(declare-fun e!785776 () Bool)

(declare-fun call!66563 () Bool)

(assert (=> b!1387239 (= e!785776 call!66563)))

(declare-fun b!1387240 () Bool)

(declare-fun e!785775 () Bool)

(assert (=> b!1387240 (= e!785775 e!785776)))

(declare-fun c!128932 () Bool)

(assert (=> b!1387240 (= c!128932 (validKeyInArray!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387241 () Bool)

(declare-fun e!785777 () Bool)

(assert (=> b!1387241 (= e!785777 e!785775)))

(declare-fun res!928257 () Bool)

(assert (=> b!1387241 (=> (not res!928257) (not e!785775))))

(declare-fun e!785774 () Bool)

(assert (=> b!1387241 (= res!928257 (not e!785774))))

(declare-fun res!928255 () Bool)

(assert (=> b!1387241 (=> (not res!928255) (not e!785774))))

(assert (=> b!1387241 (= res!928255 (validKeyInArray!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387242 () Bool)

(assert (=> b!1387242 (= e!785776 call!66563)))

(declare-fun b!1387243 () Bool)

(declare-fun contains!9745 (List!32364 (_ BitVec 64)) Bool)

(assert (=> b!1387243 (= e!785774 (contains!9745 Nil!32361 (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66560 () Bool)

(assert (=> bm!66560 (= call!66563 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128932 (Cons!32360 (select (arr!45836 a!2938) #b00000000000000000000000000000000) Nil!32361) Nil!32361)))))

(declare-fun d!149475 () Bool)

(declare-fun res!928256 () Bool)

(assert (=> d!149475 (=> res!928256 e!785777)))

(assert (=> d!149475 (= res!928256 (bvsge #b00000000000000000000000000000000 (size!46386 a!2938)))))

(assert (=> d!149475 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32361) e!785777)))

(assert (= (and d!149475 (not res!928256)) b!1387241))

(assert (= (and b!1387241 res!928255) b!1387243))

(assert (= (and b!1387241 res!928257) b!1387240))

(assert (= (and b!1387240 c!128932) b!1387242))

(assert (= (and b!1387240 (not c!128932)) b!1387239))

(assert (= (or b!1387242 b!1387239) bm!66560))

(declare-fun m!1272713 () Bool)

(assert (=> b!1387240 m!1272713))

(assert (=> b!1387240 m!1272713))

(declare-fun m!1272715 () Bool)

(assert (=> b!1387240 m!1272715))

(assert (=> b!1387241 m!1272713))

(assert (=> b!1387241 m!1272713))

(assert (=> b!1387241 m!1272715))

(assert (=> b!1387243 m!1272713))

(assert (=> b!1387243 m!1272713))

(declare-fun m!1272717 () Bool)

(assert (=> b!1387243 m!1272717))

(assert (=> bm!66560 m!1272713))

(declare-fun m!1272719 () Bool)

(assert (=> bm!66560 m!1272719))

(assert (=> b!1387133 d!149475))

(declare-fun d!149479 () Bool)

(assert (=> d!149479 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!609783 () Unit!46379)

(declare-fun choose!38 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> d!149479 (= lt!609783 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149479 (validMask!0 mask!2987)))

(assert (=> d!149479 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!609783)))

(declare-fun bs!40311 () Bool)

(assert (= bs!40311 d!149479))

(assert (=> bs!40311 m!1272605))

(declare-fun m!1272729 () Bool)

(assert (=> bs!40311 m!1272729))

(assert (=> bs!40311 m!1272589))

(assert (=> b!1387136 d!149479))

(declare-fun b!1387262 () Bool)

(declare-fun e!785794 () Bool)

(declare-fun e!785795 () Bool)

(assert (=> b!1387262 (= e!785794 e!785795)))

(declare-fun lt!609790 () (_ BitVec 64))

(assert (=> b!1387262 (= lt!609790 (select (arr!45836 a!2938) startIndex!16))))

(declare-fun lt!609791 () Unit!46379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94920 (_ BitVec 64) (_ BitVec 32)) Unit!46379)

(assert (=> b!1387262 (= lt!609791 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609790 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387262 (arrayContainsKey!0 a!2938 lt!609790 #b00000000000000000000000000000000)))

(declare-fun lt!609792 () Unit!46379)

(assert (=> b!1387262 (= lt!609792 lt!609791)))

(declare-fun res!928271 () Bool)

(assert (=> b!1387262 (= res!928271 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) (Found!10179 startIndex!16)))))

(assert (=> b!1387262 (=> (not res!928271) (not e!785795))))

(declare-fun b!1387263 () Bool)

(declare-fun call!66567 () Bool)

(assert (=> b!1387263 (= e!785794 call!66567)))

(declare-fun bm!66564 () Bool)

(assert (=> bm!66564 (= call!66567 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387264 () Bool)

(declare-fun e!785793 () Bool)

(assert (=> b!1387264 (= e!785793 e!785794)))

(declare-fun c!128936 () Bool)

(assert (=> b!1387264 (= c!128936 (validKeyInArray!0 (select (arr!45836 a!2938) startIndex!16)))))

(declare-fun b!1387265 () Bool)

(assert (=> b!1387265 (= e!785795 call!66567)))

(declare-fun d!149485 () Bool)

(declare-fun res!928270 () Bool)

(assert (=> d!149485 (=> res!928270 e!785793)))

(assert (=> d!149485 (= res!928270 (bvsge startIndex!16 (size!46386 a!2938)))))

(assert (=> d!149485 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!785793)))

(assert (= (and d!149485 (not res!928270)) b!1387264))

(assert (= (and b!1387264 c!128936) b!1387262))

(assert (= (and b!1387264 (not c!128936)) b!1387263))

(assert (= (and b!1387262 res!928271) b!1387265))

(assert (= (or b!1387265 b!1387263) bm!66564))

(assert (=> b!1387262 m!1272601))

(declare-fun m!1272743 () Bool)

(assert (=> b!1387262 m!1272743))

(declare-fun m!1272745 () Bool)

(assert (=> b!1387262 m!1272745))

(assert (=> b!1387262 m!1272601))

(assert (=> b!1387262 m!1272603))

(declare-fun m!1272747 () Bool)

(assert (=> bm!66564 m!1272747))

(assert (=> b!1387264 m!1272601))

(assert (=> b!1387264 m!1272601))

(assert (=> b!1387264 m!1272607))

(assert (=> b!1387136 d!149485))

(declare-fun d!149491 () Bool)

(declare-fun e!785798 () Bool)

(assert (=> d!149491 e!785798))

(declare-fun res!928274 () Bool)

(assert (=> d!149491 (=> (not res!928274) (not e!785798))))

(assert (=> d!149491 (= res!928274 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46386 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46386 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46386 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46386 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46386 a!2938))))))

(declare-fun lt!609795 () Unit!46379)

(declare-fun choose!14 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> d!149491 (= lt!609795 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149491 (validMask!0 mask!2987)))

(assert (=> d!149491 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!609795)))

(declare-fun b!1387268 () Bool)

(assert (=> b!1387268 (= e!785798 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987)))))

(assert (= (and d!149491 res!928274) b!1387268))

(declare-fun m!1272749 () Bool)

(assert (=> d!149491 m!1272749))

(assert (=> d!149491 m!1272589))

(assert (=> b!1387268 m!1272601))

(assert (=> b!1387268 m!1272595))

(assert (=> b!1387268 m!1272585))

(assert (=> b!1387268 m!1272595))

(declare-fun m!1272751 () Bool)

(assert (=> b!1387268 m!1272751))

(assert (=> b!1387268 m!1272601))

(assert (=> b!1387268 m!1272603))

(assert (=> b!1387136 d!149491))

(declare-fun e!785835 () SeekEntryResult!10179)

(declare-fun b!1387335 () Bool)

(declare-fun lt!609836 () SeekEntryResult!10179)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94920 (_ BitVec 32)) SeekEntryResult!10179)

(assert (=> b!1387335 (= e!785835 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609836) (index!43089 lt!609836) (index!43089 lt!609836) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387336 () Bool)

(declare-fun e!785837 () SeekEntryResult!10179)

(assert (=> b!1387336 (= e!785837 (Found!10179 (index!43089 lt!609836)))))

(declare-fun b!1387338 () Bool)

(declare-fun e!785836 () SeekEntryResult!10179)

(assert (=> b!1387338 (= e!785836 e!785837)))

(declare-fun lt!609837 () (_ BitVec 64))

(assert (=> b!1387338 (= lt!609837 (select (arr!45836 a!2938) (index!43089 lt!609836)))))

(declare-fun c!128969 () Bool)

(assert (=> b!1387338 (= c!128969 (= lt!609837 (select (arr!45836 a!2938) startIndex!16)))))

(declare-fun b!1387339 () Bool)

(assert (=> b!1387339 (= e!785836 Undefined!10179)))

(declare-fun b!1387340 () Bool)

(assert (=> b!1387340 (= e!785835 (MissingZero!10179 (index!43089 lt!609836)))))

(declare-fun b!1387337 () Bool)

(declare-fun c!128968 () Bool)

(assert (=> b!1387337 (= c!128968 (= lt!609837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387337 (= e!785837 e!785835)))

(declare-fun d!149493 () Bool)

(declare-fun lt!609835 () SeekEntryResult!10179)

(assert (=> d!149493 (and (or (is-Undefined!10179 lt!609835) (not (is-Found!10179 lt!609835)) (and (bvsge (index!43088 lt!609835) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609835) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609835) (is-Found!10179 lt!609835) (not (is-MissingZero!10179 lt!609835)) (and (bvsge (index!43087 lt!609835) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609835) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609835) (is-Found!10179 lt!609835) (is-MissingZero!10179 lt!609835) (not (is-MissingVacant!10179 lt!609835)) (and (bvsge (index!43090 lt!609835) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609835) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609835) (ite (is-Found!10179 lt!609835) (= (select (arr!45836 a!2938) (index!43088 lt!609835)) (select (arr!45836 a!2938) startIndex!16)) (ite (is-MissingZero!10179 lt!609835) (= (select (arr!45836 a!2938) (index!43087 lt!609835)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609835) (= (select (arr!45836 a!2938) (index!43090 lt!609835)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149493 (= lt!609835 e!785836)))

(declare-fun c!128967 () Bool)

(assert (=> d!149493 (= c!128967 (and (is-Intermediate!10179 lt!609836) (undefined!10991 lt!609836)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94920 (_ BitVec 32)) SeekEntryResult!10179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149493 (= lt!609836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149493 (validMask!0 mask!2987)))

(assert (=> d!149493 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) lt!609835)))

(assert (= (and d!149493 c!128967) b!1387339))

(assert (= (and d!149493 (not c!128967)) b!1387338))

(assert (= (and b!1387338 c!128969) b!1387336))

(assert (= (and b!1387338 (not c!128969)) b!1387337))

(assert (= (and b!1387337 c!128968) b!1387340))

(assert (= (and b!1387337 (not c!128968)) b!1387335))

(assert (=> b!1387335 m!1272601))

(declare-fun m!1272827 () Bool)

(assert (=> b!1387335 m!1272827))

(declare-fun m!1272829 () Bool)

(assert (=> b!1387338 m!1272829))

(declare-fun m!1272831 () Bool)

(assert (=> d!149493 m!1272831))

(assert (=> d!149493 m!1272601))

(declare-fun m!1272833 () Bool)

(assert (=> d!149493 m!1272833))

(assert (=> d!149493 m!1272601))

(assert (=> d!149493 m!1272831))

(declare-fun m!1272835 () Bool)

(assert (=> d!149493 m!1272835))

(declare-fun m!1272837 () Bool)

(assert (=> d!149493 m!1272837))

(assert (=> d!149493 m!1272589))

(declare-fun m!1272839 () Bool)

(assert (=> d!149493 m!1272839))

(assert (=> b!1387136 d!149493))

(declare-fun e!785838 () SeekEntryResult!10179)

(declare-fun lt!609839 () SeekEntryResult!10179)

(declare-fun b!1387341 () Bool)

(assert (=> b!1387341 (= e!785838 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609839) (index!43089 lt!609839) (index!43089 lt!609839) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987))))

(declare-fun b!1387342 () Bool)

(declare-fun e!785840 () SeekEntryResult!10179)

(assert (=> b!1387342 (= e!785840 (Found!10179 (index!43089 lt!609839)))))

(declare-fun b!1387344 () Bool)

(declare-fun e!785839 () SeekEntryResult!10179)

(assert (=> b!1387344 (= e!785839 e!785840)))

(declare-fun lt!609840 () (_ BitVec 64))

(assert (=> b!1387344 (= lt!609840 (select (arr!45836 lt!609713) (index!43089 lt!609839)))))

(declare-fun c!128972 () Bool)

(assert (=> b!1387344 (= c!128972 (= lt!609840 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387345 () Bool)

(assert (=> b!1387345 (= e!785839 Undefined!10179)))

(declare-fun b!1387346 () Bool)

(assert (=> b!1387346 (= e!785838 (MissingZero!10179 (index!43089 lt!609839)))))

(declare-fun b!1387343 () Bool)

(declare-fun c!128971 () Bool)

(assert (=> b!1387343 (= c!128971 (= lt!609840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387343 (= e!785840 e!785838)))

(declare-fun d!149509 () Bool)

(declare-fun lt!609838 () SeekEntryResult!10179)

(assert (=> d!149509 (and (or (is-Undefined!10179 lt!609838) (not (is-Found!10179 lt!609838)) (and (bvsge (index!43088 lt!609838) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609838) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609838) (is-Found!10179 lt!609838) (not (is-MissingZero!10179 lt!609838)) (and (bvsge (index!43087 lt!609838) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609838) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609838) (is-Found!10179 lt!609838) (is-MissingZero!10179 lt!609838) (not (is-MissingVacant!10179 lt!609838)) (and (bvsge (index!43090 lt!609838) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609838) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609838) (ite (is-Found!10179 lt!609838) (= (select (arr!45836 lt!609713) (index!43088 lt!609838)) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10179 lt!609838) (= (select (arr!45836 lt!609713) (index!43087 lt!609838)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609838) (= (select (arr!45836 lt!609713) (index!43090 lt!609838)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149509 (= lt!609838 e!785839)))

(declare-fun c!128970 () Bool)

(assert (=> d!149509 (= c!128970 (and (is-Intermediate!10179 lt!609839) (undefined!10991 lt!609839)))))

(assert (=> d!149509 (= lt!609839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987))))

(assert (=> d!149509 (validMask!0 mask!2987)))

(assert (=> d!149509 (= (seekEntryOrOpen!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987) lt!609838)))

(assert (= (and d!149509 c!128970) b!1387345))

(assert (= (and d!149509 (not c!128970)) b!1387344))

(assert (= (and b!1387344 c!128972) b!1387342))

(assert (= (and b!1387344 (not c!128972)) b!1387343))

(assert (= (and b!1387343 c!128971) b!1387346))

(assert (= (and b!1387343 (not c!128971)) b!1387341))

(assert (=> b!1387341 m!1272595))

(declare-fun m!1272841 () Bool)

(assert (=> b!1387341 m!1272841))

(declare-fun m!1272843 () Bool)

(assert (=> b!1387344 m!1272843))

(declare-fun m!1272845 () Bool)

(assert (=> d!149509 m!1272845))

(assert (=> d!149509 m!1272595))

(declare-fun m!1272847 () Bool)

(assert (=> d!149509 m!1272847))

(assert (=> d!149509 m!1272595))

(assert (=> d!149509 m!1272845))

(declare-fun m!1272849 () Bool)

(assert (=> d!149509 m!1272849))

(declare-fun m!1272851 () Bool)

(assert (=> d!149509 m!1272851))

(assert (=> d!149509 m!1272589))

(declare-fun m!1272853 () Bool)

(assert (=> d!149509 m!1272853))

(assert (=> b!1387136 d!149509))

(declare-fun b!1387347 () Bool)

(declare-fun e!785842 () Bool)

(declare-fun e!785843 () Bool)

(assert (=> b!1387347 (= e!785842 e!785843)))

(declare-fun lt!609841 () (_ BitVec 64))

(assert (=> b!1387347 (= lt!609841 (select (arr!45836 lt!609713) startIndex!16))))

(declare-fun lt!609842 () Unit!46379)

(assert (=> b!1387347 (= lt!609842 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609841 startIndex!16))))

(assert (=> b!1387347 (arrayContainsKey!0 lt!609713 lt!609841 #b00000000000000000000000000000000)))

(declare-fun lt!609843 () Unit!46379)

(assert (=> b!1387347 (= lt!609843 lt!609842)))

(declare-fun res!928282 () Bool)

(assert (=> b!1387347 (= res!928282 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) startIndex!16) lt!609713 mask!2987) (Found!10179 startIndex!16)))))

(assert (=> b!1387347 (=> (not res!928282) (not e!785843))))

(declare-fun b!1387348 () Bool)

(declare-fun call!66571 () Bool)

(assert (=> b!1387348 (= e!785842 call!66571)))

(declare-fun bm!66568 () Bool)

(assert (=> bm!66568 (= call!66571 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609713 mask!2987))))

(declare-fun b!1387349 () Bool)

(declare-fun e!785841 () Bool)

(assert (=> b!1387349 (= e!785841 e!785842)))

(declare-fun c!128973 () Bool)

(assert (=> b!1387349 (= c!128973 (validKeyInArray!0 (select (arr!45836 lt!609713) startIndex!16)))))

(declare-fun b!1387350 () Bool)

(assert (=> b!1387350 (= e!785843 call!66571)))

(declare-fun d!149511 () Bool)

(declare-fun res!928281 () Bool)

(assert (=> d!149511 (=> res!928281 e!785841)))

(assert (=> d!149511 (= res!928281 (bvsge startIndex!16 (size!46386 lt!609713)))))

(assert (=> d!149511 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609713 mask!2987) e!785841)))

(assert (= (and d!149511 (not res!928281)) b!1387349))

(assert (= (and b!1387349 c!128973) b!1387347))

(assert (= (and b!1387349 (not c!128973)) b!1387348))

(assert (= (and b!1387347 res!928282) b!1387350))

(assert (= (or b!1387350 b!1387348) bm!66568))

(declare-fun m!1272855 () Bool)

(assert (=> b!1387347 m!1272855))

(declare-fun m!1272857 () Bool)

(assert (=> b!1387347 m!1272857))

(declare-fun m!1272859 () Bool)

(assert (=> b!1387347 m!1272859))

(assert (=> b!1387347 m!1272855))

(declare-fun m!1272861 () Bool)

(assert (=> b!1387347 m!1272861))

(declare-fun m!1272863 () Bool)

(assert (=> bm!66568 m!1272863))

(assert (=> b!1387349 m!1272855))

(assert (=> b!1387349 m!1272855))

(declare-fun m!1272865 () Bool)

(assert (=> b!1387349 m!1272865))

(assert (=> b!1387131 d!149511))

(declare-fun b!1387353 () Bool)

(declare-fun e!785847 () Bool)

(declare-fun e!785848 () Bool)

(assert (=> b!1387353 (= e!785847 e!785848)))

(declare-fun lt!609846 () (_ BitVec 64))

(assert (=> b!1387353 (= lt!609846 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609847 () Unit!46379)

(assert (=> b!1387353 (= lt!609847 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609846 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387353 (arrayContainsKey!0 lt!609713 lt!609846 #b00000000000000000000000000000000)))

(declare-fun lt!609848 () Unit!46379)

(assert (=> b!1387353 (= lt!609848 lt!609847)))

(declare-fun res!928286 () Bool)

(assert (=> b!1387353 (= res!928286 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609713 mask!2987) (Found!10179 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387353 (=> (not res!928286) (not e!785848))))

(declare-fun b!1387354 () Bool)

(declare-fun call!66572 () Bool)

(assert (=> b!1387354 (= e!785847 call!66572)))

(declare-fun bm!66569 () Bool)

(assert (=> bm!66569 (= call!66572 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609713 mask!2987))))

(declare-fun b!1387355 () Bool)

(declare-fun e!785846 () Bool)

(assert (=> b!1387355 (= e!785846 e!785847)))

(declare-fun c!128974 () Bool)

(assert (=> b!1387355 (= c!128974 (validKeyInArray!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387356 () Bool)

(assert (=> b!1387356 (= e!785848 call!66572)))

(declare-fun d!149513 () Bool)

(declare-fun res!928285 () Bool)

(assert (=> d!149513 (=> res!928285 e!785846)))

(assert (=> d!149513 (= res!928285 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46386 lt!609713)))))

(assert (=> d!149513 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609713 mask!2987) e!785846)))

(assert (= (and d!149513 (not res!928285)) b!1387355))

(assert (= (and b!1387355 c!128974) b!1387353))

(assert (= (and b!1387355 (not c!128974)) b!1387354))

(assert (= (and b!1387353 res!928286) b!1387356))

(assert (= (or b!1387356 b!1387354) bm!66569))

(declare-fun m!1272867 () Bool)

(assert (=> b!1387353 m!1272867))

(declare-fun m!1272869 () Bool)

(assert (=> b!1387353 m!1272869))

(declare-fun m!1272871 () Bool)

(assert (=> b!1387353 m!1272871))

(assert (=> b!1387353 m!1272867))

(declare-fun m!1272873 () Bool)

(assert (=> b!1387353 m!1272873))

(declare-fun m!1272875 () Bool)

(assert (=> bm!66569 m!1272875))

(assert (=> b!1387355 m!1272867))

(assert (=> b!1387355 m!1272867))

(declare-fun m!1272877 () Bool)

(assert (=> b!1387355 m!1272877))

(assert (=> b!1387131 d!149513))

(declare-fun d!149515 () Bool)

(declare-fun e!785854 () Bool)

(assert (=> d!149515 e!785854))

(declare-fun res!928292 () Bool)

(assert (=> d!149515 (=> (not res!928292) (not e!785854))))

(assert (=> d!149515 (= res!928292 (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46386 a!2938))))))

(declare-fun lt!609852 () Unit!46379)

(declare-fun choose!23 (array!94920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46379)

(assert (=> d!149515 (= lt!609852 (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (=> d!149515 (validMask!0 mask!2987)))

(assert (=> d!149515 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) lt!609852)))

(declare-fun b!1387362 () Bool)

(assert (=> b!1387362 (= e!785854 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987))))

(assert (= (and d!149515 res!928292) b!1387362))

(declare-fun m!1272883 () Bool)

(assert (=> d!149515 m!1272883))

(assert (=> d!149515 m!1272589))

(assert (=> b!1387362 m!1272585))

(declare-fun m!1272885 () Bool)

(assert (=> b!1387362 m!1272885))

(assert (=> b!1387131 d!149515))

(declare-fun d!149519 () Bool)

(assert (=> d!149519 (= (validKeyInArray!0 (select (arr!45836 a!2938) startIndex!16)) (and (not (= (select (arr!45836 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387137 d!149519))

(declare-fun b!1387371 () Bool)

(declare-fun e!785862 () Bool)

(declare-fun e!785863 () Bool)

(assert (=> b!1387371 (= e!785862 e!785863)))

(declare-fun lt!609853 () (_ BitVec 64))

(assert (=> b!1387371 (= lt!609853 (select (arr!45836 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!609854 () Unit!46379)

(assert (=> b!1387371 (= lt!609854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609853 #b00000000000000000000000000000000))))

(assert (=> b!1387371 (arrayContainsKey!0 a!2938 lt!609853 #b00000000000000000000000000000000)))

(declare-fun lt!609855 () Unit!46379)

(assert (=> b!1387371 (= lt!609855 lt!609854)))

(declare-fun res!928298 () Bool)

(assert (=> b!1387371 (= res!928298 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10179 #b00000000000000000000000000000000)))))

(assert (=> b!1387371 (=> (not res!928298) (not e!785863))))

(declare-fun b!1387372 () Bool)

(declare-fun call!66573 () Bool)

(assert (=> b!1387372 (= e!785862 call!66573)))

(declare-fun bm!66570 () Bool)

(assert (=> bm!66570 (= call!66573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387373 () Bool)

(declare-fun e!785861 () Bool)

(assert (=> b!1387373 (= e!785861 e!785862)))

(declare-fun c!128977 () Bool)

(assert (=> b!1387373 (= c!128977 (validKeyInArray!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387374 () Bool)

(assert (=> b!1387374 (= e!785863 call!66573)))

(declare-fun d!149521 () Bool)

(declare-fun res!928297 () Bool)

(assert (=> d!149521 (=> res!928297 e!785861)))

(assert (=> d!149521 (= res!928297 (bvsge #b00000000000000000000000000000000 (size!46386 a!2938)))))

(assert (=> d!149521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!785861)))

(assert (= (and d!149521 (not res!928297)) b!1387373))

(assert (= (and b!1387373 c!128977) b!1387371))

(assert (= (and b!1387373 (not c!128977)) b!1387372))

(assert (= (and b!1387371 res!928298) b!1387374))

(assert (= (or b!1387374 b!1387372) bm!66570))

(assert (=> b!1387371 m!1272713))

(declare-fun m!1272887 () Bool)

(assert (=> b!1387371 m!1272887))

(declare-fun m!1272889 () Bool)

(assert (=> b!1387371 m!1272889))

(assert (=> b!1387371 m!1272713))

(declare-fun m!1272891 () Bool)

(assert (=> b!1387371 m!1272891))

(declare-fun m!1272893 () Bool)

(assert (=> bm!66570 m!1272893))

(assert (=> b!1387373 m!1272713))

(assert (=> b!1387373 m!1272713))

(assert (=> b!1387373 m!1272715))

(assert (=> b!1387132 d!149521))

(push 1)

(assert (not b!1387240))

(assert (not b!1387373))

(assert (not b!1387362))

(assert (not b!1387353))

(assert (not bm!66560))

(assert (not b!1387243))

(assert (not b!1387264))

(assert (not d!149491))

(assert (not d!149509))

(assert (not b!1387241))

(assert (not b!1387262))

(assert (not d!149479))

(assert (not b!1387347))

(assert (not bm!66564))

(assert (not b!1387349))

(assert (not b!1387268))

(assert (not bm!66570))

(assert (not d!149493))

(assert (not bm!66568))

(assert (not bm!66569))

(assert (not b!1387341))

(assert (not b!1387355))

(assert (not b!1387335))

(assert (not d!149515))

(assert (not b!1387371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149537 () Bool)

(assert (=> d!149537 (= (validKeyInArray!0 (select (arr!45836 lt!609713) startIndex!16)) (and (not (= (select (arr!45836 lt!609713) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 lt!609713) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387349 d!149537))

(declare-fun d!149539 () Bool)

(assert (=> d!149539 (= (validKeyInArray!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16))) (and (not (= (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387355 d!149539))

(declare-fun b!1387408 () Bool)

(declare-fun e!785890 () Bool)

(declare-fun e!785891 () Bool)

(assert (=> b!1387408 (= e!785890 e!785891)))

(declare-fun lt!609865 () (_ BitVec 64))

(assert (=> b!1387408 (= lt!609865 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609866 () Unit!46379)

(assert (=> b!1387408 (= lt!609866 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609865 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387408 (arrayContainsKey!0 lt!609713 lt!609865 #b00000000000000000000000000000000)))

(declare-fun lt!609867 () Unit!46379)

(assert (=> b!1387408 (= lt!609867 lt!609866)))

(declare-fun res!928317 () Bool)

(assert (=> b!1387408 (= res!928317 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001)) lt!609713 mask!2987) (Found!10179 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387408 (=> (not res!928317) (not e!785891))))

(declare-fun b!1387409 () Bool)

(declare-fun call!66581 () Bool)

(assert (=> b!1387409 (= e!785890 call!66581)))

(declare-fun bm!66578 () Bool)

(assert (=> bm!66578 (= call!66581 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609713 mask!2987))))

(declare-fun b!1387410 () Bool)

(declare-fun e!785889 () Bool)

(assert (=> b!1387410 (= e!785889 e!785890)))

(declare-fun c!128986 () Bool)

(assert (=> b!1387410 (= c!128986 (validKeyInArray!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387411 () Bool)

(assert (=> b!1387411 (= e!785891 call!66581)))

(declare-fun d!149541 () Bool)

(declare-fun res!928316 () Bool)

(assert (=> d!149541 (=> res!928316 e!785889)))

(assert (=> d!149541 (= res!928316 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (size!46386 lt!609713)))))

(assert (=> d!149541 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609713 mask!2987) e!785889)))

(assert (= (and d!149541 (not res!928316)) b!1387410))

(assert (= (and b!1387410 c!128986) b!1387408))

(assert (= (and b!1387410 (not c!128986)) b!1387409))

(assert (= (and b!1387408 res!928317) b!1387411))

(assert (= (or b!1387411 b!1387409) bm!66578))

(declare-fun m!1272933 () Bool)

(assert (=> b!1387408 m!1272933))

(declare-fun m!1272935 () Bool)

(assert (=> b!1387408 m!1272935))

(declare-fun m!1272937 () Bool)

(assert (=> b!1387408 m!1272937))

(assert (=> b!1387408 m!1272933))

(declare-fun m!1272939 () Bool)

(assert (=> b!1387408 m!1272939))

(declare-fun m!1272941 () Bool)

(assert (=> bm!66578 m!1272941))

(assert (=> b!1387410 m!1272933))

(assert (=> b!1387410 m!1272933))

(declare-fun m!1272943 () Bool)

(assert (=> b!1387410 m!1272943))

(assert (=> bm!66569 d!149541))

(declare-fun b!1387412 () Bool)

(declare-fun e!785893 () Bool)

(declare-fun e!785894 () Bool)

(assert (=> b!1387412 (= e!785893 e!785894)))

(declare-fun lt!609868 () (_ BitVec 64))

(assert (=> b!1387412 (= lt!609868 (select (arr!45836 lt!609713) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609869 () Unit!46379)

(assert (=> b!1387412 (= lt!609869 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609868 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387412 (arrayContainsKey!0 lt!609713 lt!609868 #b00000000000000000000000000000000)))

(declare-fun lt!609870 () Unit!46379)

(assert (=> b!1387412 (= lt!609870 lt!609869)))

(declare-fun res!928319 () Bool)

(assert (=> b!1387412 (= res!928319 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!609713 mask!2987) (Found!10179 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387412 (=> (not res!928319) (not e!785894))))

(declare-fun b!1387413 () Bool)

(declare-fun call!66582 () Bool)

(assert (=> b!1387413 (= e!785893 call!66582)))

(declare-fun bm!66579 () Bool)

(assert (=> bm!66579 (= call!66582 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609713 mask!2987))))

(declare-fun b!1387414 () Bool)

(declare-fun e!785892 () Bool)

(assert (=> b!1387414 (= e!785892 e!785893)))

(declare-fun c!128987 () Bool)

(assert (=> b!1387414 (= c!128987 (validKeyInArray!0 (select (arr!45836 lt!609713) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387415 () Bool)

(assert (=> b!1387415 (= e!785894 call!66582)))

(declare-fun d!149543 () Bool)

(declare-fun res!928318 () Bool)

(assert (=> d!149543 (=> res!928318 e!785892)))

(assert (=> d!149543 (= res!928318 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46386 lt!609713)))))

(assert (=> d!149543 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609713 mask!2987) e!785892)))

(assert (= (and d!149543 (not res!928318)) b!1387414))

(assert (= (and b!1387414 c!128987) b!1387412))

(assert (= (and b!1387414 (not c!128987)) b!1387413))

(assert (= (and b!1387412 res!928319) b!1387415))

(assert (= (or b!1387415 b!1387413) bm!66579))

(declare-fun m!1272945 () Bool)

(assert (=> b!1387412 m!1272945))

(declare-fun m!1272947 () Bool)

(assert (=> b!1387412 m!1272947))

(declare-fun m!1272949 () Bool)

(assert (=> b!1387412 m!1272949))

(assert (=> b!1387412 m!1272945))

(declare-fun m!1272951 () Bool)

(assert (=> b!1387412 m!1272951))

(declare-fun m!1272953 () Bool)

(assert (=> bm!66579 m!1272953))

(assert (=> b!1387414 m!1272945))

(assert (=> b!1387414 m!1272945))

(declare-fun m!1272955 () Bool)

(assert (=> b!1387414 m!1272955))

(assert (=> bm!66568 d!149543))

(declare-fun b!1387455 () Bool)

(declare-fun e!785921 () SeekEntryResult!10179)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1387455 (= e!785921 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124700 lt!609839) #b00000000000000000000000000000001) (nextIndex!0 (index!43089 lt!609839) (x!124700 lt!609839) mask!2987) (index!43089 lt!609839) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987))))

(declare-fun b!1387456 () Bool)

(declare-fun e!785923 () SeekEntryResult!10179)

(assert (=> b!1387456 (= e!785923 (Found!10179 (index!43089 lt!609839)))))

(declare-fun b!1387457 () Bool)

(assert (=> b!1387457 (= e!785921 (MissingVacant!10179 (index!43089 lt!609839)))))

(declare-fun b!1387458 () Bool)

(declare-fun c!129002 () Bool)

(declare-fun lt!609891 () (_ BitVec 64))

(assert (=> b!1387458 (= c!129002 (= lt!609891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387458 (= e!785923 e!785921)))

(declare-fun b!1387459 () Bool)

(declare-fun e!785922 () SeekEntryResult!10179)

(assert (=> b!1387459 (= e!785922 e!785923)))

(declare-fun c!129000 () Bool)

(assert (=> b!1387459 (= c!129000 (= lt!609891 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun d!149545 () Bool)

(declare-fun lt!609892 () SeekEntryResult!10179)

(assert (=> d!149545 (and (or (is-Undefined!10179 lt!609892) (not (is-Found!10179 lt!609892)) (and (bvsge (index!43088 lt!609892) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609892) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609892) (is-Found!10179 lt!609892) (not (is-MissingVacant!10179 lt!609892)) (not (= (index!43090 lt!609892) (index!43089 lt!609839))) (and (bvsge (index!43090 lt!609892) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609892) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609892) (ite (is-Found!10179 lt!609892) (= (select (arr!45836 lt!609713) (index!43088 lt!609892)) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and (is-MissingVacant!10179 lt!609892) (= (index!43090 lt!609892) (index!43089 lt!609839)) (= (select (arr!45836 lt!609713) (index!43090 lt!609892)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149545 (= lt!609892 e!785922)))

(declare-fun c!129001 () Bool)

(assert (=> d!149545 (= c!129001 (bvsge (x!124700 lt!609839) #b01111111111111111111111111111110))))

(assert (=> d!149545 (= lt!609891 (select (arr!45836 lt!609713) (index!43089 lt!609839)))))

(assert (=> d!149545 (validMask!0 mask!2987)))

(assert (=> d!149545 (= (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609839) (index!43089 lt!609839) (index!43089 lt!609839) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987) lt!609892)))

(declare-fun b!1387454 () Bool)

(assert (=> b!1387454 (= e!785922 Undefined!10179)))

(assert (= (and d!149545 c!129001) b!1387454))

(assert (= (and d!149545 (not c!129001)) b!1387459))

(assert (= (and b!1387459 c!129000) b!1387456))

(assert (= (and b!1387459 (not c!129000)) b!1387458))

(assert (= (and b!1387458 c!129002) b!1387457))

(assert (= (and b!1387458 (not c!129002)) b!1387455))

(declare-fun m!1273017 () Bool)

(assert (=> b!1387455 m!1273017))

(assert (=> b!1387455 m!1273017))

(assert (=> b!1387455 m!1272595))

(declare-fun m!1273019 () Bool)

(assert (=> b!1387455 m!1273019))

(declare-fun m!1273021 () Bool)

(assert (=> d!149545 m!1273021))

(declare-fun m!1273023 () Bool)

(assert (=> d!149545 m!1273023))

(assert (=> d!149545 m!1272843))

(assert (=> d!149545 m!1272589))

(assert (=> b!1387341 d!149545))

(declare-fun d!149571 () Bool)

(assert (=> d!149571 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987))))

(assert (=> d!149571 true))

(declare-fun _$42!16 () Unit!46379)

(assert (=> d!149571 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!16)))

(declare-fun bs!40316 () Bool)

(assert (= bs!40316 d!149571))

(assert (=> bs!40316 m!1272601))

(assert (=> bs!40316 m!1272601))

(assert (=> bs!40316 m!1272603))

(assert (=> bs!40316 m!1272585))

(assert (=> bs!40316 m!1272595))

(assert (=> bs!40316 m!1272595))

(assert (=> bs!40316 m!1272751))

(assert (=> d!149491 d!149571))

(assert (=> d!149491 d!149469))

(assert (=> b!1387268 d!149493))

(declare-fun b!1387478 () Bool)

(declare-fun e!785936 () SeekEntryResult!10179)

(declare-fun lt!609903 () SeekEntryResult!10179)

(assert (=> b!1387478 (= e!785936 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609903) (index!43089 lt!609903) (index!43089 lt!609903) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987))))

(declare-fun b!1387479 () Bool)

(declare-fun e!785938 () SeekEntryResult!10179)

(assert (=> b!1387479 (= e!785938 (Found!10179 (index!43089 lt!609903)))))

(declare-fun b!1387481 () Bool)

(declare-fun e!785937 () SeekEntryResult!10179)

(assert (=> b!1387481 (= e!785937 e!785938)))

(declare-fun lt!609904 () (_ BitVec 64))

(assert (=> b!1387481 (= lt!609904 (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (index!43089 lt!609903)))))

(declare-fun c!129011 () Bool)

(assert (=> b!1387481 (= c!129011 (= lt!609904 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387482 () Bool)

(assert (=> b!1387482 (= e!785937 Undefined!10179)))

(declare-fun b!1387483 () Bool)

(assert (=> b!1387483 (= e!785936 (MissingZero!10179 (index!43089 lt!609903)))))

(declare-fun b!1387480 () Bool)

(declare-fun c!129010 () Bool)

(assert (=> b!1387480 (= c!129010 (= lt!609904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387480 (= e!785938 e!785936)))

(declare-fun d!149579 () Bool)

(declare-fun lt!609902 () SeekEntryResult!10179)

(assert (=> d!149579 (and (or (is-Undefined!10179 lt!609902) (not (is-Found!10179 lt!609902)) (and (bvsge (index!43088 lt!609902) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609902) (size!46386 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)))))) (or (is-Undefined!10179 lt!609902) (is-Found!10179 lt!609902) (not (is-MissingZero!10179 lt!609902)) (and (bvsge (index!43087 lt!609902) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609902) (size!46386 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)))))) (or (is-Undefined!10179 lt!609902) (is-Found!10179 lt!609902) (is-MissingZero!10179 lt!609902) (not (is-MissingVacant!10179 lt!609902)) (and (bvsge (index!43090 lt!609902) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609902) (size!46386 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)))))) (or (is-Undefined!10179 lt!609902) (ite (is-Found!10179 lt!609902) (= (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (index!43088 lt!609902)) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10179 lt!609902) (= (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (index!43087 lt!609902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609902) (= (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (index!43090 lt!609902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149579 (= lt!609902 e!785937)))

(declare-fun c!129009 () Bool)

(assert (=> d!149579 (= c!129009 (and (is-Intermediate!10179 lt!609903) (undefined!10991 lt!609903)))))

(assert (=> d!149579 (= lt!609903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987))))

(assert (=> d!149579 (validMask!0 mask!2987)))

(assert (=> d!149579 (= (seekEntryOrOpen!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987) lt!609902)))

(assert (= (and d!149579 c!129009) b!1387482))

(assert (= (and d!149579 (not c!129009)) b!1387481))

(assert (= (and b!1387481 c!129011) b!1387479))

(assert (= (and b!1387481 (not c!129011)) b!1387480))

(assert (= (and b!1387480 c!129010) b!1387483))

(assert (= (and b!1387480 (not c!129010)) b!1387478))

(assert (=> b!1387478 m!1272595))

(declare-fun m!1273053 () Bool)

(assert (=> b!1387478 m!1273053))

(declare-fun m!1273057 () Bool)

(assert (=> b!1387481 m!1273057))

(assert (=> d!149579 m!1272845))

(assert (=> d!149579 m!1272595))

(declare-fun m!1273061 () Bool)

(assert (=> d!149579 m!1273061))

(assert (=> d!149579 m!1272595))

(assert (=> d!149579 m!1272845))

(declare-fun m!1273063 () Bool)

(assert (=> d!149579 m!1273063))

(declare-fun m!1273065 () Bool)

(assert (=> d!149579 m!1273065))

(assert (=> d!149579 m!1272589))

(declare-fun m!1273067 () Bool)

(assert (=> d!149579 m!1273067))

(assert (=> b!1387268 d!149579))

(declare-fun b!1387486 () Bool)

(declare-fun e!785942 () Bool)

(declare-fun e!785943 () Bool)

(assert (=> b!1387486 (= e!785942 e!785943)))

(declare-fun lt!609906 () (_ BitVec 64))

(assert (=> b!1387486 (= lt!609906 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!609907 () Unit!46379)

(assert (=> b!1387486 (= lt!609907 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609906 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1387486 (arrayContainsKey!0 a!2938 lt!609906 #b00000000000000000000000000000000)))

(declare-fun lt!609908 () Unit!46379)

(assert (=> b!1387486 (= lt!609908 lt!609907)))

(declare-fun res!928343 () Bool)

(assert (=> b!1387486 (= res!928343 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10179 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1387486 (=> (not res!928343) (not e!785943))))

(declare-fun b!1387487 () Bool)

(declare-fun call!66586 () Bool)

(assert (=> b!1387487 (= e!785942 call!66586)))

(declare-fun bm!66583 () Bool)

(assert (=> bm!66583 (= call!66586 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387488 () Bool)

(declare-fun e!785941 () Bool)

(assert (=> b!1387488 (= e!785941 e!785942)))

(declare-fun c!129012 () Bool)

(assert (=> b!1387488 (= c!129012 (validKeyInArray!0 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387489 () Bool)

(assert (=> b!1387489 (= e!785943 call!66586)))

(declare-fun d!149583 () Bool)

(declare-fun res!928342 () Bool)

(assert (=> d!149583 (=> res!928342 e!785941)))

(assert (=> d!149583 (= res!928342 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 a!2938)))))

(assert (=> d!149583 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!785941)))

(assert (= (and d!149583 (not res!928342)) b!1387488))

(assert (= (and b!1387488 c!129012) b!1387486))

(assert (= (and b!1387488 (not c!129012)) b!1387487))

(assert (= (and b!1387486 res!928343) b!1387489))

(assert (= (or b!1387489 b!1387487) bm!66583))

(declare-fun m!1273073 () Bool)

(assert (=> b!1387486 m!1273073))

(declare-fun m!1273075 () Bool)

(assert (=> b!1387486 m!1273075))

(declare-fun m!1273077 () Bool)

(assert (=> b!1387486 m!1273077))

(assert (=> b!1387486 m!1273073))

(declare-fun m!1273079 () Bool)

(assert (=> b!1387486 m!1273079))

(declare-fun m!1273081 () Bool)

(assert (=> bm!66583 m!1273081))

(assert (=> b!1387488 m!1273073))

(assert (=> b!1387488 m!1273073))

(declare-fun m!1273083 () Bool)

(assert (=> b!1387488 m!1273083))

(assert (=> bm!66570 d!149583))

(declare-fun d!149589 () Bool)

(assert (=> d!149589 (= (validKeyInArray!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45836 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45836 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387241 d!149589))

(declare-fun b!1387532 () Bool)

(declare-fun lt!609925 () SeekEntryResult!10179)

(assert (=> b!1387532 (and (bvsge (index!43089 lt!609925) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609925) (size!46386 a!2938)))))

(declare-fun e!785968 () Bool)

(assert (=> b!1387532 (= e!785968 (= (select (arr!45836 a!2938) (index!43089 lt!609925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1387533 () Bool)

(declare-fun e!785972 () SeekEntryResult!10179)

(assert (=> b!1387533 (= e!785972 (Intermediate!10179 false (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387534 () Bool)

(assert (=> b!1387534 (and (bvsge (index!43089 lt!609925) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609925) (size!46386 a!2938)))))

(declare-fun res!928354 () Bool)

(assert (=> b!1387534 (= res!928354 (= (select (arr!45836 a!2938) (index!43089 lt!609925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387534 (=> res!928354 e!785968)))

(declare-fun b!1387535 () Bool)

(declare-fun e!785969 () SeekEntryResult!10179)

(assert (=> b!1387535 (= e!785969 (Intermediate!10179 true (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387536 () Bool)

(assert (=> b!1387536 (and (bvsge (index!43089 lt!609925) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609925) (size!46386 a!2938)))))

(declare-fun res!928356 () Bool)

(assert (=> b!1387536 (= res!928356 (= (select (arr!45836 a!2938) (index!43089 lt!609925)) (select (arr!45836 a!2938) startIndex!16)))))

(assert (=> b!1387536 (=> res!928356 e!785968)))

(declare-fun e!785970 () Bool)

(assert (=> b!1387536 (= e!785970 e!785968)))

(declare-fun d!149591 () Bool)

(declare-fun e!785971 () Bool)

(assert (=> d!149591 e!785971))

(declare-fun c!129030 () Bool)

(assert (=> d!149591 (= c!129030 (and (is-Intermediate!10179 lt!609925) (undefined!10991 lt!609925)))))

(assert (=> d!149591 (= lt!609925 e!785969)))

(declare-fun c!129031 () Bool)

(assert (=> d!149591 (= c!129031 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609924 () (_ BitVec 64))

(assert (=> d!149591 (= lt!609924 (select (arr!45836 a!2938) (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149591 (validMask!0 mask!2987)))

(assert (=> d!149591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) lt!609925)))

(declare-fun b!1387537 () Bool)

(assert (=> b!1387537 (= e!785969 e!785972)))

(declare-fun c!129029 () Bool)

(assert (=> b!1387537 (= c!129029 (or (= lt!609924 (select (arr!45836 a!2938) startIndex!16)) (= (bvadd lt!609924 lt!609924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1387538 () Bool)

(assert (=> b!1387538 (= e!785971 e!785970)))

(declare-fun res!928355 () Bool)

(assert (=> b!1387538 (= res!928355 (and (is-Intermediate!10179 lt!609925) (not (undefined!10991 lt!609925)) (bvslt (x!124700 lt!609925) #b01111111111111111111111111111110) (bvsge (x!124700 lt!609925) #b00000000000000000000000000000000) (bvsge (x!124700 lt!609925) #b00000000000000000000000000000000)))))

(assert (=> b!1387538 (=> (not res!928355) (not e!785970))))

(declare-fun b!1387539 () Bool)

(assert (=> b!1387539 (= e!785971 (bvsge (x!124700 lt!609925) #b01111111111111111111111111111110))))

(declare-fun b!1387540 () Bool)

(assert (=> b!1387540 (= e!785972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (= (and d!149591 c!129031) b!1387535))

(assert (= (and d!149591 (not c!129031)) b!1387537))

(assert (= (and b!1387537 c!129029) b!1387533))

(assert (= (and b!1387537 (not c!129029)) b!1387540))

(assert (= (and d!149591 c!129030) b!1387539))

(assert (= (and d!149591 (not c!129030)) b!1387538))

(assert (= (and b!1387538 res!928355) b!1387536))

(assert (= (and b!1387536 (not res!928356)) b!1387534))

(assert (= (and b!1387534 (not res!928354)) b!1387532))

(declare-fun m!1273115 () Bool)

(assert (=> b!1387532 m!1273115))

(assert (=> b!1387540 m!1272831))

(declare-fun m!1273117 () Bool)

(assert (=> b!1387540 m!1273117))

(assert (=> b!1387540 m!1273117))

(assert (=> b!1387540 m!1272601))

(declare-fun m!1273119 () Bool)

(assert (=> b!1387540 m!1273119))

(assert (=> b!1387536 m!1273115))

(assert (=> b!1387534 m!1273115))

(assert (=> d!149591 m!1272831))

(declare-fun m!1273121 () Bool)

(assert (=> d!149591 m!1273121))

(assert (=> d!149591 m!1272589))

(assert (=> d!149493 d!149591))

(declare-fun d!149603 () Bool)

(declare-fun lt!609933 () (_ BitVec 32))

(declare-fun lt!609932 () (_ BitVec 32))

(assert (=> d!149603 (= lt!609933 (bvmul (bvxor lt!609932 (bvlshr lt!609932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149603 (= lt!609932 ((_ extract 31 0) (bvand (bvxor (select (arr!45836 a!2938) startIndex!16) (bvlshr (select (arr!45836 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149603 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928357 (let ((h!33572 ((_ extract 31 0) (bvand (bvxor (select (arr!45836 a!2938) startIndex!16) (bvlshr (select (arr!45836 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124706 (bvmul (bvxor h!33572 (bvlshr h!33572 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124706 (bvlshr x!124706 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928357 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928357 #b00000000000000000000000000000000))))))

(assert (=> d!149603 (= (toIndex!0 (select (arr!45836 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!609933 (bvlshr lt!609933 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149493 d!149603))

(assert (=> d!149493 d!149469))

(declare-fun e!785976 () SeekEntryResult!10179)

(declare-fun b!1387548 () Bool)

(assert (=> b!1387548 (= e!785976 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124700 lt!609836) #b00000000000000000000000000000001) (nextIndex!0 (index!43089 lt!609836) (x!124700 lt!609836) mask!2987) (index!43089 lt!609836) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387549 () Bool)

(declare-fun e!785978 () SeekEntryResult!10179)

(assert (=> b!1387549 (= e!785978 (Found!10179 (index!43089 lt!609836)))))

(declare-fun b!1387550 () Bool)

(assert (=> b!1387550 (= e!785976 (MissingVacant!10179 (index!43089 lt!609836)))))

(declare-fun b!1387551 () Bool)

(declare-fun c!129037 () Bool)

(declare-fun lt!609934 () (_ BitVec 64))

(assert (=> b!1387551 (= c!129037 (= lt!609934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387551 (= e!785978 e!785976)))

(declare-fun b!1387552 () Bool)

(declare-fun e!785977 () SeekEntryResult!10179)

(assert (=> b!1387552 (= e!785977 e!785978)))

(declare-fun c!129035 () Bool)

(assert (=> b!1387552 (= c!129035 (= lt!609934 (select (arr!45836 a!2938) startIndex!16)))))

(declare-fun d!149607 () Bool)

(declare-fun lt!609935 () SeekEntryResult!10179)

(assert (=> d!149607 (and (or (is-Undefined!10179 lt!609935) (not (is-Found!10179 lt!609935)) (and (bvsge (index!43088 lt!609935) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609935) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609935) (is-Found!10179 lt!609935) (not (is-MissingVacant!10179 lt!609935)) (not (= (index!43090 lt!609935) (index!43089 lt!609836))) (and (bvsge (index!43090 lt!609935) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609935) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609935) (ite (is-Found!10179 lt!609935) (= (select (arr!45836 a!2938) (index!43088 lt!609935)) (select (arr!45836 a!2938) startIndex!16)) (and (is-MissingVacant!10179 lt!609935) (= (index!43090 lt!609935) (index!43089 lt!609836)) (= (select (arr!45836 a!2938) (index!43090 lt!609935)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149607 (= lt!609935 e!785977)))

(declare-fun c!129036 () Bool)

(assert (=> d!149607 (= c!129036 (bvsge (x!124700 lt!609836) #b01111111111111111111111111111110))))

(assert (=> d!149607 (= lt!609934 (select (arr!45836 a!2938) (index!43089 lt!609836)))))

(assert (=> d!149607 (validMask!0 mask!2987)))

(assert (=> d!149607 (= (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609836) (index!43089 lt!609836) (index!43089 lt!609836) (select (arr!45836 a!2938) startIndex!16) a!2938 mask!2987) lt!609935)))

(declare-fun b!1387547 () Bool)

(assert (=> b!1387547 (= e!785977 Undefined!10179)))

(assert (= (and d!149607 c!129036) b!1387547))

(assert (= (and d!149607 (not c!129036)) b!1387552))

(assert (= (and b!1387552 c!129035) b!1387549))

(assert (= (and b!1387552 (not c!129035)) b!1387551))

(assert (= (and b!1387551 c!129037) b!1387550))

(assert (= (and b!1387551 (not c!129037)) b!1387548))

(declare-fun m!1273131 () Bool)

(assert (=> b!1387548 m!1273131))

(assert (=> b!1387548 m!1273131))

(assert (=> b!1387548 m!1272601))

(declare-fun m!1273133 () Bool)

(assert (=> b!1387548 m!1273133))

(declare-fun m!1273135 () Bool)

(assert (=> d!149607 m!1273135))

(declare-fun m!1273137 () Bool)

(assert (=> d!149607 m!1273137))

(assert (=> d!149607 m!1272829))

(assert (=> d!149607 m!1272589))

(assert (=> b!1387335 d!149607))

(assert (=> b!1387240 d!149589))

(declare-fun d!149609 () Bool)

(assert (=> d!149609 (arrayContainsKey!0 a!2938 lt!609853 #b00000000000000000000000000000000)))

(declare-fun lt!609938 () Unit!46379)

(declare-fun choose!13 (array!94920 (_ BitVec 64) (_ BitVec 32)) Unit!46379)

(assert (=> d!149609 (= lt!609938 (choose!13 a!2938 lt!609853 #b00000000000000000000000000000000))))

(assert (=> d!149609 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149609 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609853 #b00000000000000000000000000000000) lt!609938)))

(declare-fun bs!40320 () Bool)

(assert (= bs!40320 d!149609))

(assert (=> bs!40320 m!1272889))

(declare-fun m!1273139 () Bool)

(assert (=> bs!40320 m!1273139))

(assert (=> b!1387371 d!149609))

(declare-fun d!149611 () Bool)

(declare-fun res!928362 () Bool)

(declare-fun e!785983 () Bool)

(assert (=> d!149611 (=> res!928362 e!785983)))

(assert (=> d!149611 (= res!928362 (= (select (arr!45836 a!2938) #b00000000000000000000000000000000) lt!609853))))

(assert (=> d!149611 (= (arrayContainsKey!0 a!2938 lt!609853 #b00000000000000000000000000000000) e!785983)))

(declare-fun b!1387557 () Bool)

(declare-fun e!785984 () Bool)

(assert (=> b!1387557 (= e!785983 e!785984)))

(declare-fun res!928363 () Bool)

(assert (=> b!1387557 (=> (not res!928363) (not e!785984))))

(assert (=> b!1387557 (= res!928363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 a!2938)))))

(declare-fun b!1387558 () Bool)

(assert (=> b!1387558 (= e!785984 (arrayContainsKey!0 a!2938 lt!609853 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149611 (not res!928362)) b!1387557))

(assert (= (and b!1387557 res!928363) b!1387558))

(assert (=> d!149611 m!1272713))

(declare-fun m!1273141 () Bool)

(assert (=> b!1387558 m!1273141))

(assert (=> b!1387371 d!149611))

(declare-fun lt!609940 () SeekEntryResult!10179)

(declare-fun e!785985 () SeekEntryResult!10179)

(declare-fun b!1387559 () Bool)

(assert (=> b!1387559 (= e!785985 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609940) (index!43089 lt!609940) (index!43089 lt!609940) (select (arr!45836 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1387560 () Bool)

(declare-fun e!785987 () SeekEntryResult!10179)

(assert (=> b!1387560 (= e!785987 (Found!10179 (index!43089 lt!609940)))))

(declare-fun b!1387562 () Bool)

(declare-fun e!785986 () SeekEntryResult!10179)

(assert (=> b!1387562 (= e!785986 e!785987)))

(declare-fun lt!609941 () (_ BitVec 64))

(assert (=> b!1387562 (= lt!609941 (select (arr!45836 a!2938) (index!43089 lt!609940)))))

(declare-fun c!129040 () Bool)

(assert (=> b!1387562 (= c!129040 (= lt!609941 (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387563 () Bool)

(assert (=> b!1387563 (= e!785986 Undefined!10179)))

(declare-fun b!1387564 () Bool)

(assert (=> b!1387564 (= e!785985 (MissingZero!10179 (index!43089 lt!609940)))))

(declare-fun b!1387561 () Bool)

(declare-fun c!129039 () Bool)

(assert (=> b!1387561 (= c!129039 (= lt!609941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387561 (= e!785987 e!785985)))

(declare-fun d!149613 () Bool)

(declare-fun lt!609939 () SeekEntryResult!10179)

(assert (=> d!149613 (and (or (is-Undefined!10179 lt!609939) (not (is-Found!10179 lt!609939)) (and (bvsge (index!43088 lt!609939) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609939) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609939) (is-Found!10179 lt!609939) (not (is-MissingZero!10179 lt!609939)) (and (bvsge (index!43087 lt!609939) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609939) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609939) (is-Found!10179 lt!609939) (is-MissingZero!10179 lt!609939) (not (is-MissingVacant!10179 lt!609939)) (and (bvsge (index!43090 lt!609939) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609939) (size!46386 a!2938)))) (or (is-Undefined!10179 lt!609939) (ite (is-Found!10179 lt!609939) (= (select (arr!45836 a!2938) (index!43088 lt!609939)) (select (arr!45836 a!2938) #b00000000000000000000000000000000)) (ite (is-MissingZero!10179 lt!609939) (= (select (arr!45836 a!2938) (index!43087 lt!609939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609939) (= (select (arr!45836 a!2938) (index!43090 lt!609939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149613 (= lt!609939 e!785986)))

(declare-fun c!129038 () Bool)

(assert (=> d!149613 (= c!129038 (and (is-Intermediate!10179 lt!609940) (undefined!10991 lt!609940)))))

(assert (=> d!149613 (= lt!609940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45836 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149613 (validMask!0 mask!2987)))

(assert (=> d!149613 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!609939)))

(assert (= (and d!149613 c!129038) b!1387563))

(assert (= (and d!149613 (not c!129038)) b!1387562))

(assert (= (and b!1387562 c!129040) b!1387560))

(assert (= (and b!1387562 (not c!129040)) b!1387561))

(assert (= (and b!1387561 c!129039) b!1387564))

(assert (= (and b!1387561 (not c!129039)) b!1387559))

(assert (=> b!1387559 m!1272713))

(declare-fun m!1273143 () Bool)

(assert (=> b!1387559 m!1273143))

(declare-fun m!1273145 () Bool)

(assert (=> b!1387562 m!1273145))

(declare-fun m!1273147 () Bool)

(assert (=> d!149613 m!1273147))

(assert (=> d!149613 m!1272713))

(declare-fun m!1273149 () Bool)

(assert (=> d!149613 m!1273149))

(assert (=> d!149613 m!1272713))

(assert (=> d!149613 m!1273147))

(declare-fun m!1273151 () Bool)

(assert (=> d!149613 m!1273151))

(declare-fun m!1273153 () Bool)

(assert (=> d!149613 m!1273153))

(assert (=> d!149613 m!1272589))

(declare-fun m!1273155 () Bool)

(assert (=> d!149613 m!1273155))

(assert (=> b!1387371 d!149613))

(assert (=> d!149479 d!149485))

(declare-fun d!149615 () Bool)

(assert (=> d!149615 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149615 true))

(declare-fun _$72!131 () Unit!46379)

(assert (=> d!149615 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!131)))

(declare-fun bs!40321 () Bool)

(assert (= bs!40321 d!149615))

(assert (=> bs!40321 m!1272605))

(assert (=> d!149479 d!149615))

(assert (=> d!149479 d!149469))

(declare-fun b!1387573 () Bool)

(declare-fun lt!609947 () SeekEntryResult!10179)

(assert (=> b!1387573 (and (bvsge (index!43089 lt!609947) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609947) (size!46386 lt!609713)))))

(declare-fun e!785992 () Bool)

(assert (=> b!1387573 (= e!785992 (= (select (arr!45836 lt!609713) (index!43089 lt!609947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785996 () SeekEntryResult!10179)

(declare-fun b!1387574 () Bool)

(assert (=> b!1387574 (= e!785996 (Intermediate!10179 false (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387575 () Bool)

(assert (=> b!1387575 (and (bvsge (index!43089 lt!609947) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609947) (size!46386 lt!609713)))))

(declare-fun res!928364 () Bool)

(assert (=> b!1387575 (= res!928364 (= (select (arr!45836 lt!609713) (index!43089 lt!609947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387575 (=> res!928364 e!785992)))

(declare-fun e!785993 () SeekEntryResult!10179)

(declare-fun b!1387576 () Bool)

(assert (=> b!1387576 (= e!785993 (Intermediate!10179 true (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1387577 () Bool)

(assert (=> b!1387577 (and (bvsge (index!43089 lt!609947) #b00000000000000000000000000000000) (bvslt (index!43089 lt!609947) (size!46386 lt!609713)))))

(declare-fun res!928366 () Bool)

(assert (=> b!1387577 (= res!928366 (= (select (arr!45836 lt!609713) (index!43089 lt!609947)) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1387577 (=> res!928366 e!785992)))

(declare-fun e!785994 () Bool)

(assert (=> b!1387577 (= e!785994 e!785992)))

(declare-fun d!149617 () Bool)

(declare-fun e!785995 () Bool)

(assert (=> d!149617 e!785995))

(declare-fun c!129046 () Bool)

(assert (=> d!149617 (= c!129046 (and (is-Intermediate!10179 lt!609947) (undefined!10991 lt!609947)))))

(assert (=> d!149617 (= lt!609947 e!785993)))

(declare-fun c!129047 () Bool)

(assert (=> d!149617 (= c!129047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!609946 () (_ BitVec 64))

(assert (=> d!149617 (= lt!609946 (select (arr!45836 lt!609713) (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149617 (validMask!0 mask!2987)))

(assert (=> d!149617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987) lt!609947)))

(declare-fun b!1387578 () Bool)

(assert (=> b!1387578 (= e!785993 e!785996)))

(declare-fun c!129045 () Bool)

(assert (=> b!1387578 (= c!129045 (or (= lt!609946 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!609946 lt!609946) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1387579 () Bool)

(assert (=> b!1387579 (= e!785995 e!785994)))

(declare-fun res!928365 () Bool)

(assert (=> b!1387579 (= res!928365 (and (is-Intermediate!10179 lt!609947) (not (undefined!10991 lt!609947)) (bvslt (x!124700 lt!609947) #b01111111111111111111111111111110) (bvsge (x!124700 lt!609947) #b00000000000000000000000000000000) (bvsge (x!124700 lt!609947) #b00000000000000000000000000000000)))))

(assert (=> b!1387579 (=> (not res!928365) (not e!785994))))

(declare-fun b!1387580 () Bool)

(assert (=> b!1387580 (= e!785995 (bvsge (x!124700 lt!609947) #b01111111111111111111111111111110))))

(declare-fun b!1387581 () Bool)

(assert (=> b!1387581 (= e!785996 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609713 mask!2987))))

(assert (= (and d!149617 c!129047) b!1387576))

(assert (= (and d!149617 (not c!129047)) b!1387578))

(assert (= (and b!1387578 c!129045) b!1387574))

(assert (= (and b!1387578 (not c!129045)) b!1387581))

(assert (= (and d!149617 c!129046) b!1387580))

(assert (= (and d!149617 (not c!129046)) b!1387579))

(assert (= (and b!1387579 res!928365) b!1387577))

(assert (= (and b!1387577 (not res!928366)) b!1387575))

(assert (= (and b!1387575 (not res!928364)) b!1387573))

(declare-fun m!1273157 () Bool)

(assert (=> b!1387573 m!1273157))

(assert (=> b!1387581 m!1272845))

(declare-fun m!1273159 () Bool)

(assert (=> b!1387581 m!1273159))

(assert (=> b!1387581 m!1273159))

(assert (=> b!1387581 m!1272595))

(declare-fun m!1273161 () Bool)

(assert (=> b!1387581 m!1273161))

(assert (=> b!1387577 m!1273157))

(assert (=> b!1387575 m!1273157))

(assert (=> d!149617 m!1272845))

(declare-fun m!1273163 () Bool)

(assert (=> d!149617 m!1273163))

(assert (=> d!149617 m!1272589))

(assert (=> d!149509 d!149617))

(declare-fun d!149619 () Bool)

(declare-fun lt!609949 () (_ BitVec 32))

(declare-fun lt!609948 () (_ BitVec 32))

(assert (=> d!149619 (= lt!609949 (bvmul (bvxor lt!609948 (bvlshr lt!609948 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149619 (= lt!609948 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149619 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928357 (let ((h!33572 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124706 (bvmul (bvxor h!33572 (bvlshr h!33572 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124706 (bvlshr x!124706 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928357 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928357 #b00000000000000000000000000000000))))))

(assert (=> d!149619 (= (toIndex!0 (select (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!609949 (bvlshr lt!609949 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149509 d!149619))

(assert (=> d!149509 d!149469))

(declare-fun d!149621 () Bool)

(assert (=> d!149621 (arrayContainsKey!0 lt!609713 lt!609846 #b00000000000000000000000000000000)))

(declare-fun lt!609950 () Unit!46379)

(assert (=> d!149621 (= lt!609950 (choose!13 lt!609713 lt!609846 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> d!149621 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))

(assert (=> d!149621 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609846 (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609950)))

(declare-fun bs!40322 () Bool)

(assert (= bs!40322 d!149621))

(assert (=> bs!40322 m!1272871))

(declare-fun m!1273165 () Bool)

(assert (=> bs!40322 m!1273165))

(assert (=> b!1387353 d!149621))

(declare-fun d!149623 () Bool)

(declare-fun res!928373 () Bool)

(declare-fun e!786003 () Bool)

(assert (=> d!149623 (=> res!928373 e!786003)))

(assert (=> d!149623 (= res!928373 (= (select (arr!45836 lt!609713) #b00000000000000000000000000000000) lt!609846))))

(assert (=> d!149623 (= (arrayContainsKey!0 lt!609713 lt!609846 #b00000000000000000000000000000000) e!786003)))

(declare-fun b!1387592 () Bool)

(declare-fun e!786004 () Bool)

(assert (=> b!1387592 (= e!786003 e!786004)))

(declare-fun res!928374 () Bool)

(assert (=> b!1387592 (=> (not res!928374) (not e!786004))))

(assert (=> b!1387592 (= res!928374 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 lt!609713)))))

(declare-fun b!1387593 () Bool)

(assert (=> b!1387593 (= e!786004 (arrayContainsKey!0 lt!609713 lt!609846 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149623 (not res!928373)) b!1387592))

(assert (= (and b!1387592 res!928374) b!1387593))

(declare-fun m!1273167 () Bool)

(assert (=> d!149623 m!1273167))

(declare-fun m!1273169 () Bool)

(assert (=> b!1387593 m!1273169))

(assert (=> b!1387353 d!149623))

(declare-fun lt!609952 () SeekEntryResult!10179)

(declare-fun e!786005 () SeekEntryResult!10179)

(declare-fun b!1387594 () Bool)

(assert (=> b!1387594 (= e!786005 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609952) (index!43089 lt!609952) (index!43089 lt!609952) (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609713 mask!2987))))

(declare-fun b!1387595 () Bool)

(declare-fun e!786007 () SeekEntryResult!10179)

(assert (=> b!1387595 (= e!786007 (Found!10179 (index!43089 lt!609952)))))

(declare-fun b!1387597 () Bool)

(declare-fun e!786006 () SeekEntryResult!10179)

(assert (=> b!1387597 (= e!786006 e!786007)))

(declare-fun lt!609953 () (_ BitVec 64))

(assert (=> b!1387597 (= lt!609953 (select (arr!45836 lt!609713) (index!43089 lt!609952)))))

(declare-fun c!129052 () Bool)

(assert (=> b!1387597 (= c!129052 (= lt!609953 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387598 () Bool)

(assert (=> b!1387598 (= e!786006 Undefined!10179)))

(declare-fun b!1387599 () Bool)

(assert (=> b!1387599 (= e!786005 (MissingZero!10179 (index!43089 lt!609952)))))

(declare-fun b!1387596 () Bool)

(declare-fun c!129051 () Bool)

(assert (=> b!1387596 (= c!129051 (= lt!609953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387596 (= e!786007 e!786005)))

(declare-fun d!149625 () Bool)

(declare-fun lt!609951 () SeekEntryResult!10179)

(assert (=> d!149625 (and (or (is-Undefined!10179 lt!609951) (not (is-Found!10179 lt!609951)) (and (bvsge (index!43088 lt!609951) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609951) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609951) (is-Found!10179 lt!609951) (not (is-MissingZero!10179 lt!609951)) (and (bvsge (index!43087 lt!609951) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609951) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609951) (is-Found!10179 lt!609951) (is-MissingZero!10179 lt!609951) (not (is-MissingVacant!10179 lt!609951)) (and (bvsge (index!43090 lt!609951) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609951) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609951) (ite (is-Found!10179 lt!609951) (= (select (arr!45836 lt!609713) (index!43088 lt!609951)) (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16))) (ite (is-MissingZero!10179 lt!609951) (= (select (arr!45836 lt!609713) (index!43087 lt!609951)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609951) (= (select (arr!45836 lt!609713) (index!43090 lt!609951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149625 (= lt!609951 e!786006)))

(declare-fun c!129050 () Bool)

(assert (=> d!149625 (= c!129050 (and (is-Intermediate!10179 lt!609952) (undefined!10991 lt!609952)))))

(assert (=> d!149625 (= lt!609952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) mask!2987) (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609713 mask!2987))))

(assert (=> d!149625 (validMask!0 mask!2987)))

(assert (=> d!149625 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609713 mask!2987) lt!609951)))

(assert (= (and d!149625 c!129050) b!1387598))

(assert (= (and d!149625 (not c!129050)) b!1387597))

(assert (= (and b!1387597 c!129052) b!1387595))

(assert (= (and b!1387597 (not c!129052)) b!1387596))

(assert (= (and b!1387596 c!129051) b!1387599))

(assert (= (and b!1387596 (not c!129051)) b!1387594))

(assert (=> b!1387594 m!1272867))

(declare-fun m!1273171 () Bool)

(assert (=> b!1387594 m!1273171))

(declare-fun m!1273173 () Bool)

(assert (=> b!1387597 m!1273173))

(declare-fun m!1273175 () Bool)

(assert (=> d!149625 m!1273175))

(assert (=> d!149625 m!1272867))

(declare-fun m!1273177 () Bool)

(assert (=> d!149625 m!1273177))

(assert (=> d!149625 m!1272867))

(assert (=> d!149625 m!1273175))

(declare-fun m!1273179 () Bool)

(assert (=> d!149625 m!1273179))

(declare-fun m!1273181 () Bool)

(assert (=> d!149625 m!1273181))

(assert (=> d!149625 m!1272589))

(declare-fun m!1273183 () Bool)

(assert (=> d!149625 m!1273183))

(assert (=> b!1387353 d!149625))

(assert (=> b!1387264 d!149519))

(declare-fun d!149627 () Bool)

(assert (=> d!149627 (arrayContainsKey!0 lt!609713 lt!609841 #b00000000000000000000000000000000)))

(declare-fun lt!609954 () Unit!46379)

(assert (=> d!149627 (= lt!609954 (choose!13 lt!609713 lt!609841 startIndex!16))))

(assert (=> d!149627 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149627 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609713 lt!609841 startIndex!16) lt!609954)))

(declare-fun bs!40323 () Bool)

(assert (= bs!40323 d!149627))

(assert (=> bs!40323 m!1272859))

(declare-fun m!1273185 () Bool)

(assert (=> bs!40323 m!1273185))

(assert (=> b!1387347 d!149627))

(declare-fun d!149629 () Bool)

(declare-fun res!928375 () Bool)

(declare-fun e!786008 () Bool)

(assert (=> d!149629 (=> res!928375 e!786008)))

(assert (=> d!149629 (= res!928375 (= (select (arr!45836 lt!609713) #b00000000000000000000000000000000) lt!609841))))

(assert (=> d!149629 (= (arrayContainsKey!0 lt!609713 lt!609841 #b00000000000000000000000000000000) e!786008)))

(declare-fun b!1387600 () Bool)

(declare-fun e!786009 () Bool)

(assert (=> b!1387600 (= e!786008 e!786009)))

(declare-fun res!928376 () Bool)

(assert (=> b!1387600 (=> (not res!928376) (not e!786009))))

(assert (=> b!1387600 (= res!928376 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 lt!609713)))))

(declare-fun b!1387601 () Bool)

(assert (=> b!1387601 (= e!786009 (arrayContainsKey!0 lt!609713 lt!609841 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149629 (not res!928375)) b!1387600))

(assert (= (and b!1387600 res!928376) b!1387601))

(assert (=> d!149629 m!1273167))

(declare-fun m!1273187 () Bool)

(assert (=> b!1387601 m!1273187))

(assert (=> b!1387347 d!149629))

(declare-fun lt!609956 () SeekEntryResult!10179)

(declare-fun b!1387602 () Bool)

(declare-fun e!786010 () SeekEntryResult!10179)

(assert (=> b!1387602 (= e!786010 (seekKeyOrZeroReturnVacant!0 (x!124700 lt!609956) (index!43089 lt!609956) (index!43089 lt!609956) (select (arr!45836 lt!609713) startIndex!16) lt!609713 mask!2987))))

(declare-fun b!1387603 () Bool)

(declare-fun e!786012 () SeekEntryResult!10179)

(assert (=> b!1387603 (= e!786012 (Found!10179 (index!43089 lt!609956)))))

(declare-fun b!1387605 () Bool)

(declare-fun e!786011 () SeekEntryResult!10179)

(assert (=> b!1387605 (= e!786011 e!786012)))

(declare-fun lt!609957 () (_ BitVec 64))

(assert (=> b!1387605 (= lt!609957 (select (arr!45836 lt!609713) (index!43089 lt!609956)))))

(declare-fun c!129055 () Bool)

(assert (=> b!1387605 (= c!129055 (= lt!609957 (select (arr!45836 lt!609713) startIndex!16)))))

(declare-fun b!1387606 () Bool)

(assert (=> b!1387606 (= e!786011 Undefined!10179)))

(declare-fun b!1387607 () Bool)

(assert (=> b!1387607 (= e!786010 (MissingZero!10179 (index!43089 lt!609956)))))

(declare-fun b!1387604 () Bool)

(declare-fun c!129054 () Bool)

(assert (=> b!1387604 (= c!129054 (= lt!609957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387604 (= e!786012 e!786010)))

(declare-fun d!149631 () Bool)

(declare-fun lt!609955 () SeekEntryResult!10179)

(assert (=> d!149631 (and (or (is-Undefined!10179 lt!609955) (not (is-Found!10179 lt!609955)) (and (bvsge (index!43088 lt!609955) #b00000000000000000000000000000000) (bvslt (index!43088 lt!609955) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609955) (is-Found!10179 lt!609955) (not (is-MissingZero!10179 lt!609955)) (and (bvsge (index!43087 lt!609955) #b00000000000000000000000000000000) (bvslt (index!43087 lt!609955) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609955) (is-Found!10179 lt!609955) (is-MissingZero!10179 lt!609955) (not (is-MissingVacant!10179 lt!609955)) (and (bvsge (index!43090 lt!609955) #b00000000000000000000000000000000) (bvslt (index!43090 lt!609955) (size!46386 lt!609713)))) (or (is-Undefined!10179 lt!609955) (ite (is-Found!10179 lt!609955) (= (select (arr!45836 lt!609713) (index!43088 lt!609955)) (select (arr!45836 lt!609713) startIndex!16)) (ite (is-MissingZero!10179 lt!609955) (= (select (arr!45836 lt!609713) (index!43087 lt!609955)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10179 lt!609955) (= (select (arr!45836 lt!609713) (index!43090 lt!609955)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149631 (= lt!609955 e!786011)))

(declare-fun c!129053 () Bool)

(assert (=> d!149631 (= c!129053 (and (is-Intermediate!10179 lt!609956) (undefined!10991 lt!609956)))))

(assert (=> d!149631 (= lt!609956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45836 lt!609713) startIndex!16) mask!2987) (select (arr!45836 lt!609713) startIndex!16) lt!609713 mask!2987))))

(assert (=> d!149631 (validMask!0 mask!2987)))

(assert (=> d!149631 (= (seekEntryOrOpen!0 (select (arr!45836 lt!609713) startIndex!16) lt!609713 mask!2987) lt!609955)))

(assert (= (and d!149631 c!129053) b!1387606))

(assert (= (and d!149631 (not c!129053)) b!1387605))

(assert (= (and b!1387605 c!129055) b!1387603))

(assert (= (and b!1387605 (not c!129055)) b!1387604))

(assert (= (and b!1387604 c!129054) b!1387607))

(assert (= (and b!1387604 (not c!129054)) b!1387602))

(assert (=> b!1387602 m!1272855))

(declare-fun m!1273189 () Bool)

(assert (=> b!1387602 m!1273189))

(declare-fun m!1273191 () Bool)

(assert (=> b!1387605 m!1273191))

(declare-fun m!1273193 () Bool)

(assert (=> d!149631 m!1273193))

(assert (=> d!149631 m!1272855))

(declare-fun m!1273195 () Bool)

(assert (=> d!149631 m!1273195))

(assert (=> d!149631 m!1272855))

(assert (=> d!149631 m!1273193))

(declare-fun m!1273197 () Bool)

(assert (=> d!149631 m!1273197))

(declare-fun m!1273199 () Bool)

(assert (=> d!149631 m!1273199))

(assert (=> d!149631 m!1272589))

(declare-fun m!1273201 () Bool)

(assert (=> d!149631 m!1273201))

(assert (=> b!1387347 d!149631))

(declare-fun b!1387617 () Bool)

(declare-fun e!786019 () Bool)

(declare-fun e!786020 () Bool)

(assert (=> b!1387617 (= e!786019 e!786020)))

(declare-fun lt!609960 () (_ BitVec 64))

(assert (=> b!1387617 (= lt!609960 (select (arr!45836 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!609961 () Unit!46379)

(assert (=> b!1387617 (= lt!609961 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609960 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387617 (arrayContainsKey!0 a!2938 lt!609960 #b00000000000000000000000000000000)))

(declare-fun lt!609962 () Unit!46379)

(assert (=> b!1387617 (= lt!609962 lt!609961)))

(declare-fun res!928381 () Bool)

(assert (=> b!1387617 (= res!928381 (= (seekEntryOrOpen!0 (select (arr!45836 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10179 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387617 (=> (not res!928381) (not e!786020))))

(declare-fun b!1387618 () Bool)

(declare-fun call!66588 () Bool)

(assert (=> b!1387618 (= e!786019 call!66588)))

(declare-fun bm!66585 () Bool)

(assert (=> bm!66585 (= call!66588 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1387619 () Bool)

(declare-fun e!786018 () Bool)

(assert (=> b!1387619 (= e!786018 e!786019)))

(declare-fun c!129059 () Bool)

(assert (=> b!1387619 (= c!129059 (validKeyInArray!0 (select (arr!45836 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun b!1387620 () Bool)

(assert (=> b!1387620 (= e!786020 call!66588)))

(declare-fun d!149633 () Bool)

(declare-fun res!928380 () Bool)

(assert (=> d!149633 (=> res!928380 e!786018)))

(assert (=> d!149633 (= res!928380 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46386 a!2938)))))

(assert (=> d!149633 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786018)))

(assert (= (and d!149633 (not res!928380)) b!1387619))

(assert (= (and b!1387619 c!129059) b!1387617))

(assert (= (and b!1387619 (not c!129059)) b!1387618))

(assert (= (and b!1387617 res!928381) b!1387620))

(assert (= (or b!1387620 b!1387618) bm!66585))

(declare-fun m!1273203 () Bool)

(assert (=> b!1387617 m!1273203))

(declare-fun m!1273205 () Bool)

(assert (=> b!1387617 m!1273205))

(declare-fun m!1273207 () Bool)

(assert (=> b!1387617 m!1273207))

(assert (=> b!1387617 m!1273203))

(declare-fun m!1273209 () Bool)

(assert (=> b!1387617 m!1273209))

(declare-fun m!1273211 () Bool)

(assert (=> bm!66585 m!1273211))

(assert (=> b!1387619 m!1273203))

(assert (=> b!1387619 m!1273203))

(declare-fun m!1273217 () Bool)

(assert (=> b!1387619 m!1273217))

(assert (=> bm!66564 d!149633))

(declare-fun d!149635 () Bool)

(assert (=> d!149635 (arrayContainsKey!0 a!2938 lt!609790 #b00000000000000000000000000000000)))

(declare-fun lt!609963 () Unit!46379)

(assert (=> d!149635 (= lt!609963 (choose!13 a!2938 lt!609790 startIndex!16))))

(assert (=> d!149635 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149635 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609790 startIndex!16) lt!609963)))

(declare-fun bs!40324 () Bool)

(assert (= bs!40324 d!149635))

(assert (=> bs!40324 m!1272745))

(declare-fun m!1273223 () Bool)

(assert (=> bs!40324 m!1273223))

(assert (=> b!1387262 d!149635))

(declare-fun d!149639 () Bool)

(declare-fun res!928382 () Bool)

(declare-fun e!786021 () Bool)

(assert (=> d!149639 (=> res!928382 e!786021)))

(assert (=> d!149639 (= res!928382 (= (select (arr!45836 a!2938) #b00000000000000000000000000000000) lt!609790))))

(assert (=> d!149639 (= (arrayContainsKey!0 a!2938 lt!609790 #b00000000000000000000000000000000) e!786021)))

(declare-fun b!1387621 () Bool)

(declare-fun e!786022 () Bool)

(assert (=> b!1387621 (= e!786021 e!786022)))

(declare-fun res!928383 () Bool)

(assert (=> b!1387621 (=> (not res!928383) (not e!786022))))

(assert (=> b!1387621 (= res!928383 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 a!2938)))))

(declare-fun b!1387622 () Bool)

(assert (=> b!1387622 (= e!786022 (arrayContainsKey!0 a!2938 lt!609790 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149639 (not res!928382)) b!1387621))

(assert (= (and b!1387621 res!928383) b!1387622))

(assert (=> d!149639 m!1272713))

(declare-fun m!1273225 () Bool)

(assert (=> b!1387622 m!1273225))

(assert (=> b!1387262 d!149639))

(assert (=> b!1387262 d!149493))

(declare-fun d!149641 () Bool)

(assert (=> d!149641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987)))

(assert (=> d!149641 true))

(declare-fun _$43!18 () Unit!46379)

(assert (=> d!149641 (= (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) _$43!18)))

(declare-fun bs!40325 () Bool)

(assert (= bs!40325 d!149641))

(assert (=> bs!40325 m!1272585))

(assert (=> bs!40325 m!1272885))

(assert (=> d!149515 d!149641))

(assert (=> d!149515 d!149469))

(declare-fun b!1387623 () Bool)

(declare-fun e!786025 () Bool)

(declare-fun call!66589 () Bool)

(assert (=> b!1387623 (= e!786025 call!66589)))

(declare-fun b!1387624 () Bool)

(declare-fun e!786024 () Bool)

(assert (=> b!1387624 (= e!786024 e!786025)))

(declare-fun c!129060 () Bool)

(assert (=> b!1387624 (= c!129060 (validKeyInArray!0 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387625 () Bool)

(declare-fun e!786026 () Bool)

(assert (=> b!1387625 (= e!786026 e!786024)))

(declare-fun res!928387 () Bool)

(assert (=> b!1387625 (=> (not res!928387) (not e!786024))))

(declare-fun e!786023 () Bool)

(assert (=> b!1387625 (= res!928387 (not e!786023))))

(declare-fun res!928385 () Bool)

(assert (=> b!1387625 (=> (not res!928385) (not e!786023))))

(assert (=> b!1387625 (= res!928385 (validKeyInArray!0 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1387626 () Bool)

(assert (=> b!1387626 (= e!786025 call!66589)))

(declare-fun b!1387627 () Bool)

(assert (=> b!1387627 (= e!786023 (contains!9745 (ite c!128932 (Cons!32360 (select (arr!45836 a!2938) #b00000000000000000000000000000000) Nil!32361) Nil!32361) (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!66586 () Bool)

(assert (=> bm!66586 (= call!66589 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129060 (Cons!32360 (select (arr!45836 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!128932 (Cons!32360 (select (arr!45836 a!2938) #b00000000000000000000000000000000) Nil!32361) Nil!32361)) (ite c!128932 (Cons!32360 (select (arr!45836 a!2938) #b00000000000000000000000000000000) Nil!32361) Nil!32361))))))

(declare-fun d!149643 () Bool)

(declare-fun res!928386 () Bool)

(assert (=> d!149643 (=> res!928386 e!786026)))

(assert (=> d!149643 (= res!928386 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46386 a!2938)))))

(assert (=> d!149643 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128932 (Cons!32360 (select (arr!45836 a!2938) #b00000000000000000000000000000000) Nil!32361) Nil!32361)) e!786026)))

(assert (= (and d!149643 (not res!928386)) b!1387625))

(assert (= (and b!1387625 res!928385) b!1387627))

(assert (= (and b!1387625 res!928387) b!1387624))

(assert (= (and b!1387624 c!129060) b!1387626))

(assert (= (and b!1387624 (not c!129060)) b!1387623))

(assert (= (or b!1387626 b!1387623) bm!66586))

(assert (=> b!1387624 m!1273073))

(assert (=> b!1387624 m!1273073))

(assert (=> b!1387624 m!1273083))

(assert (=> b!1387625 m!1273073))

(assert (=> b!1387625 m!1273073))

(assert (=> b!1387625 m!1273083))

(assert (=> b!1387627 m!1273073))

(assert (=> b!1387627 m!1273073))

(declare-fun m!1273227 () Bool)

(assert (=> b!1387627 m!1273227))

(assert (=> bm!66586 m!1273073))

(declare-fun m!1273229 () Bool)

(assert (=> bm!66586 m!1273229))

(assert (=> bm!66560 d!149643))

(declare-fun b!1387637 () Bool)

(declare-fun e!786033 () Bool)

(declare-fun e!786034 () Bool)

(assert (=> b!1387637 (= e!786033 e!786034)))

(declare-fun lt!609972 () (_ BitVec 64))

(assert (=> b!1387637 (= lt!609972 (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609973 () Unit!46379)

(assert (=> b!1387637 (= lt!609973 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) lt!609972 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387637 (arrayContainsKey!0 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) lt!609972 #b00000000000000000000000000000000)))

(declare-fun lt!609974 () Unit!46379)

(assert (=> b!1387637 (= lt!609974 lt!609973)))

(declare-fun res!928392 () Bool)

(assert (=> b!1387637 (= res!928392 (= (seekEntryOrOpen!0 (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16)) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987) (Found!10179 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387637 (=> (not res!928392) (not e!786034))))

(declare-fun b!1387638 () Bool)

(declare-fun call!66590 () Bool)

(assert (=> b!1387638 (= e!786033 call!66590)))

(declare-fun bm!66587 () Bool)

(assert (=> bm!66587 (= call!66590 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987))))

(declare-fun b!1387639 () Bool)

(declare-fun e!786032 () Bool)

(assert (=> b!1387639 (= e!786032 e!786033)))

(declare-fun c!129064 () Bool)

(assert (=> b!1387639 (= c!129064 (validKeyInArray!0 (select (arr!45836 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938))) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387640 () Bool)

(assert (=> b!1387640 (= e!786034 call!66590)))

(declare-fun d!149647 () Bool)

(declare-fun res!928391 () Bool)

(assert (=> d!149647 (=> res!928391 e!786032)))

(assert (=> d!149647 (= res!928391 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46386 (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)))))))

(assert (=> d!149647 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94921 (store (arr!45836 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46386 a!2938)) mask!2987) e!786032)))

(assert (= (and d!149647 (not res!928391)) b!1387639))

(assert (= (and b!1387639 c!129064) b!1387637))

(assert (= (and b!1387639 (not c!129064)) b!1387638))

(assert (= (and b!1387637 res!928392) b!1387640))

(assert (= (or b!1387640 b!1387638) bm!66587))

(declare-fun m!1273235 () Bool)

(assert (=> b!1387637 m!1273235))

(declare-fun m!1273237 () Bool)

(assert (=> b!1387637 m!1273237))

(declare-fun m!1273241 () Bool)

(assert (=> b!1387637 m!1273241))

(assert (=> b!1387637 m!1273235))

(declare-fun m!1273243 () Bool)

(assert (=> b!1387637 m!1273243))

(declare-fun m!1273247 () Bool)

(assert (=> bm!66587 m!1273247))

(assert (=> b!1387639 m!1273235))

(assert (=> b!1387639 m!1273235))

(declare-fun m!1273249 () Bool)

(assert (=> b!1387639 m!1273249))

(assert (=> b!1387362 d!149647))

(assert (=> b!1387373 d!149589))

(declare-fun d!149651 () Bool)

(declare-fun lt!609984 () Bool)

(declare-fun content!762 (List!32364) (Set (_ BitVec 64)))

(assert (=> d!149651 (= lt!609984 (set.member (select (arr!45836 a!2938) #b00000000000000000000000000000000) (content!762 Nil!32361)))))

(declare-fun e!786049 () Bool)

(assert (=> d!149651 (= lt!609984 e!786049)))

(declare-fun res!928402 () Bool)

(assert (=> d!149651 (=> (not res!928402) (not e!786049))))

(assert (=> d!149651 (= res!928402 (is-Cons!32360 Nil!32361))))

(assert (=> d!149651 (= (contains!9745 Nil!32361 (select (arr!45836 a!2938) #b00000000000000000000000000000000)) lt!609984)))

(declare-fun b!1387660 () Bool)

(declare-fun e!786050 () Bool)

(assert (=> b!1387660 (= e!786049 e!786050)))

(declare-fun res!928403 () Bool)

(assert (=> b!1387660 (=> res!928403 e!786050)))

(assert (=> b!1387660 (= res!928403 (= (h!33569 Nil!32361) (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387661 () Bool)

(assert (=> b!1387661 (= e!786050 (contains!9745 (t!47058 Nil!32361) (select (arr!45836 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149651 res!928402) b!1387660))

(assert (= (and b!1387660 (not res!928403)) b!1387661))

(declare-fun m!1273275 () Bool)

(assert (=> d!149651 m!1273275))

(assert (=> d!149651 m!1272713))

(declare-fun m!1273277 () Bool)

(assert (=> d!149651 m!1273277))

(assert (=> b!1387661 m!1272713))

(declare-fun m!1273279 () Bool)

(assert (=> b!1387661 m!1273279))

(assert (=> b!1387243 d!149651))

(push 1)

