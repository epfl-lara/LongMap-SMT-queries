; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92650 () Bool)

(assert start!92650)

(declare-fun res!702292 () Bool)

(declare-fun e!598106 () Bool)

(assert (=> start!92650 (=> (not res!702292) (not e!598106))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66424 0))(
  ( (array!66425 (arr!31950 (Array (_ BitVec 32) (_ BitVec 64))) (size!32486 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66424)

(assert (=> start!92650 (= res!702292 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32486 a!3488)) (bvslt (size!32486 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92650 e!598106))

(assert (=> start!92650 true))

(declare-fun array_inv!24730 (array!66424) Bool)

(assert (=> start!92650 (array_inv!24730 a!3488)))

(declare-fun b!1053199 () Bool)

(declare-fun e!598108 () Bool)

(assert (=> b!1053199 (= e!598106 e!598108)))

(declare-fun res!702293 () Bool)

(assert (=> b!1053199 (=> (not res!702293) (not e!598108))))

(declare-fun lt!465099 () array!66424)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053199 (= res!702293 (arrayContainsKey!0 lt!465099 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053199 (= lt!465099 (array!66425 (store (arr!31950 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32486 a!3488)))))

(declare-fun b!1053200 () Bool)

(declare-fun res!702289 () Bool)

(assert (=> b!1053200 (=> (not res!702289) (not e!598106))))

(declare-datatypes ((List!22262 0))(
  ( (Nil!22259) (Cons!22258 (h!23467 (_ BitVec 64)) (t!31569 List!22262)) )
))
(declare-fun arrayNoDuplicates!0 (array!66424 (_ BitVec 32) List!22262) Bool)

(assert (=> b!1053200 (= res!702289 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22259))))

(declare-fun b!1053201 () Bool)

(declare-fun res!702291 () Bool)

(assert (=> b!1053201 (=> (not res!702291) (not e!598106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053201 (= res!702291 (validKeyInArray!0 k!2747))))

(declare-fun lt!465098 () (_ BitVec 32))

(declare-fun b!1053202 () Bool)

(assert (=> b!1053202 (= e!598108 (and (not (= lt!465098 i!1381)) (or (bvslt lt!465098 #b00000000000000000000000000000000) (bvsge lt!465098 (size!32486 a!3488)))))))

(declare-fun arrayScanForKey!0 (array!66424 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053202 (= lt!465098 (arrayScanForKey!0 lt!465099 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053203 () Bool)

(declare-fun res!702290 () Bool)

(assert (=> b!1053203 (=> (not res!702290) (not e!598106))))

(assert (=> b!1053203 (= res!702290 (= (select (arr!31950 a!3488) i!1381) k!2747))))

(assert (= (and start!92650 res!702292) b!1053200))

(assert (= (and b!1053200 res!702289) b!1053201))

(assert (= (and b!1053201 res!702291) b!1053203))

(assert (= (and b!1053203 res!702290) b!1053199))

(assert (= (and b!1053199 res!702293) b!1053202))

(declare-fun m!973557 () Bool)

(assert (=> start!92650 m!973557))

(declare-fun m!973559 () Bool)

(assert (=> b!1053201 m!973559))

(declare-fun m!973561 () Bool)

(assert (=> b!1053200 m!973561))

(declare-fun m!973563 () Bool)

(assert (=> b!1053202 m!973563))

(declare-fun m!973565 () Bool)

(assert (=> b!1053199 m!973565))

(declare-fun m!973567 () Bool)

(assert (=> b!1053199 m!973567))

(declare-fun m!973569 () Bool)

(assert (=> b!1053203 m!973569))

(push 1)

(assert (not b!1053202))

(assert (not b!1053200))

(assert (not start!92650))

(assert (not b!1053199))

(assert (not b!1053201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1053228 () Bool)

(declare-fun e!598131 () Bool)

(declare-fun e!598133 () Bool)

(assert (=> b!1053228 (= e!598131 e!598133)))

(declare-fun c!106920 () Bool)

(assert (=> b!1053228 (= c!106920 (validKeyInArray!0 (select (arr!31950 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053229 () Bool)

(declare-fun call!44734 () Bool)

(assert (=> b!1053229 (= e!598133 call!44734)))

(declare-fun b!1053230 () Bool)

(declare-fun e!598132 () Bool)

(assert (=> b!1053230 (= e!598132 e!598131)))

(declare-fun res!702312 () Bool)

(assert (=> b!1053230 (=> (not res!702312) (not e!598131))))

(declare-fun e!598130 () Bool)

(assert (=> b!1053230 (= res!702312 (not e!598130))))

(declare-fun res!702311 () Bool)

(assert (=> b!1053230 (=> (not res!702311) (not e!598130))))

(assert (=> b!1053230 (= res!702311 (validKeyInArray!0 (select (arr!31950 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053231 () Bool)

(assert (=> b!1053231 (= e!598133 call!44734)))

(declare-fun b!1053232 () Bool)

(declare-fun contains!6163 (List!22262 (_ BitVec 64)) Bool)

(assert (=> b!1053232 (= e!598130 (contains!6163 Nil!22259 (select (arr!31950 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44731 () Bool)

(assert (=> bm!44731 (= call!44734 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106920 (Cons!22258 (select (arr!31950 a!3488) #b00000000000000000000000000000000) Nil!22259) Nil!22259)))))

(declare-fun d!127841 () Bool)

(declare-fun res!702310 () Bool)

(assert (=> d!127841 (=> res!702310 e!598132)))

(assert (=> d!127841 (= res!702310 (bvsge #b00000000000000000000000000000000 (size!32486 a!3488)))))

(assert (=> d!127841 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22259) e!598132)))

(assert (= (and d!127841 (not res!702310)) b!1053230))

(assert (= (and b!1053230 res!702311) b!1053232))

(assert (= (and b!1053230 res!702312) b!1053228))

(assert (= (and b!1053228 c!106920) b!1053231))

(assert (= (and b!1053228 (not c!106920)) b!1053229))

(assert (= (or b!1053231 b!1053229) bm!44731))

(declare-fun m!973577 () Bool)

(assert (=> b!1053228 m!973577))

(assert (=> b!1053228 m!973577))

(declare-fun m!973579 () Bool)

(assert (=> b!1053228 m!973579))

(assert (=> b!1053230 m!973577))

(assert (=> b!1053230 m!973577))

(assert (=> b!1053230 m!973579))

(assert (=> b!1053232 m!973577))

(assert (=> b!1053232 m!973577))

(declare-fun m!973581 () Bool)

(assert (=> b!1053232 m!973581))

(assert (=> bm!44731 m!973577))

(declare-fun m!973583 () Bool)

(assert (=> bm!44731 m!973583))

(assert (=> b!1053200 d!127841))

(declare-fun d!127847 () Bool)

(assert (=> d!127847 (= (array_inv!24730 a!3488) (bvsge (size!32486 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92650 d!127847))

(declare-fun d!127849 () Bool)

(declare-fun res!702322 () Bool)

(declare-fun e!598146 () Bool)

(assert (=> d!127849 (=> res!702322 e!598146)))

(assert (=> d!127849 (= res!702322 (= (select (arr!31950 lt!465099) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127849 (= (arrayContainsKey!0 lt!465099 k!2747 #b00000000000000000000000000000000) e!598146)))

(declare-fun b!1053250 () Bool)

(declare-fun e!598147 () Bool)

(assert (=> b!1053250 (= e!598146 e!598147)))

(declare-fun res!702323 () Bool)

(assert (=> b!1053250 (=> (not res!702323) (not e!598147))))

(assert (=> b!1053250 (= res!702323 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32486 lt!465099)))))

(declare-fun b!1053251 () Bool)

(assert (=> b!1053251 (= e!598147 (arrayContainsKey!0 lt!465099 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127849 (not res!702322)) b!1053250))

(assert (= (and b!1053250 res!702323) b!1053251))

(declare-fun m!973597 () Bool)

(assert (=> d!127849 m!973597))

(declare-fun m!973599 () Bool)

(assert (=> b!1053251 m!973599))

(assert (=> b!1053199 d!127849))

(declare-fun d!127855 () Bool)

(assert (=> d!127855 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053201 d!127855))

(declare-fun d!127859 () Bool)

(declare-fun lt!465105 () (_ BitVec 32))

(assert (=> d!127859 (and (or (bvslt lt!465105 #b00000000000000000000000000000000) (bvsge lt!465105 (size!32486 lt!465099)) (and (bvsge lt!465105 #b00000000000000000000000000000000) (bvslt lt!465105 (size!32486 lt!465099)))) (bvsge lt!465105 #b00000000000000000000000000000000) (bvslt lt!465105 (size!32486 lt!465099)) (= (select (arr!31950 lt!465099) lt!465105) k!2747))))

(declare-fun e!598156 () (_ BitVec 32))

(assert (=> d!127859 (= lt!465105 e!598156)))

(declare-fun c!106926 () Bool)

(assert (=> d!127859 (= c!106926 (= (select (arr!31950 lt!465099) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32486 lt!465099)) (bvslt (size!32486 lt!465099) #b01111111111111111111111111111111))))

(assert (=> d!127859 (= (arrayScanForKey!0 lt!465099 k!2747 #b00000000000000000000000000000000) lt!465105)))

(declare-fun b!1053262 () Bool)

(assert (=> b!1053262 (= e!598156 #b00000000000000000000000000000000)))

(declare-fun b!1053263 () Bool)

(assert (=> b!1053263 (= e!598156 (arrayScanForKey!0 lt!465099 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127859 c!106926) b!1053262))

(assert (= (and d!127859 (not c!106926)) b!1053263))

(declare-fun m!973603 () Bool)

(assert (=> d!127859 m!973603))

(assert (=> d!127859 m!973597))

(declare-fun m!973605 () Bool)

(assert (=> b!1053263 m!973605))

(assert (=> b!1053202 d!127859))

(push 1)

(assert (not b!1053251))

(assert (not bm!44731))

(assert (not b!1053263))

(assert (not b!1053230))

(assert (not b!1053232))

(assert (not b!1053228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

