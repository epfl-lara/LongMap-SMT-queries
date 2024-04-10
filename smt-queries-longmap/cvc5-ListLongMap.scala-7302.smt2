; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93312 () Bool)

(assert start!93312)

(declare-fun b!1057673 () Bool)

(declare-fun res!706334 () Bool)

(declare-fun e!601558 () Bool)

(assert (=> b!1057673 (=> (not res!706334) (not e!601558))))

(declare-datatypes ((array!66711 0))(
  ( (array!66712 (arr!32077 (Array (_ BitVec 32) (_ BitVec 64))) (size!32613 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66711)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057673 (= res!706334 (= (select (arr!32077 a!3488) i!1381) k!2747))))

(declare-fun b!1057674 () Bool)

(declare-fun e!601562 () Bool)

(declare-fun arrayContainsKey!0 (array!66711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057674 (= e!601562 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057675 () Bool)

(declare-fun res!706339 () Bool)

(assert (=> b!1057675 (=> (not res!706339) (not e!601558))))

(declare-datatypes ((List!22389 0))(
  ( (Nil!22386) (Cons!22385 (h!23594 (_ BitVec 64)) (t!31696 List!22389)) )
))
(declare-fun arrayNoDuplicates!0 (array!66711 (_ BitVec 32) List!22389) Bool)

(assert (=> b!1057675 (= res!706339 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22386))))

(declare-fun b!1057676 () Bool)

(declare-fun e!601564 () Bool)

(declare-fun e!601561 () Bool)

(assert (=> b!1057676 (= e!601564 e!601561)))

(declare-fun res!706331 () Bool)

(assert (=> b!1057676 (=> (not res!706331) (not e!601561))))

(declare-fun lt!466574 () (_ BitVec 32))

(assert (=> b!1057676 (= res!706331 (not (= lt!466574 i!1381)))))

(declare-fun lt!466571 () array!66711)

(declare-fun arrayScanForKey!0 (array!66711 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057676 (= lt!466574 (arrayScanForKey!0 lt!466571 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!706335 () Bool)

(assert (=> start!93312 (=> (not res!706335) (not e!601558))))

(assert (=> start!93312 (= res!706335 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32613 a!3488)) (bvslt (size!32613 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93312 e!601558))

(assert (=> start!93312 true))

(declare-fun array_inv!24857 (array!66711) Bool)

(assert (=> start!93312 (array_inv!24857 a!3488)))

(declare-fun b!1057677 () Bool)

(declare-fun e!601559 () Bool)

(assert (=> b!1057677 (= e!601561 (not e!601559))))

(declare-fun res!706332 () Bool)

(assert (=> b!1057677 (=> res!706332 e!601559)))

(assert (=> b!1057677 (= res!706332 (or (bvsgt lt!466574 i!1381) (bvsle i!1381 lt!466574)))))

(declare-fun e!601563 () Bool)

(assert (=> b!1057677 e!601563))

(declare-fun res!706337 () Bool)

(assert (=> b!1057677 (=> (not res!706337) (not e!601563))))

(assert (=> b!1057677 (= res!706337 (= (select (store (arr!32077 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466574) k!2747))))

(declare-fun b!1057678 () Bool)

(declare-fun e!601557 () Bool)

(declare-fun noDuplicate!1557 (List!22389) Bool)

(assert (=> b!1057678 (= e!601557 (noDuplicate!1557 Nil!22386))))

(declare-fun b!1057679 () Bool)

(assert (=> b!1057679 (= e!601563 e!601562)))

(declare-fun res!706340 () Bool)

(assert (=> b!1057679 (=> res!706340 e!601562)))

(assert (=> b!1057679 (= res!706340 (or (bvsgt lt!466574 i!1381) (bvsle i!1381 lt!466574)))))

(declare-fun b!1057680 () Bool)

(declare-fun res!706336 () Bool)

(assert (=> b!1057680 (=> (not res!706336) (not e!601558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057680 (= res!706336 (validKeyInArray!0 k!2747))))

(declare-fun b!1057681 () Bool)

(assert (=> b!1057681 (= e!601559 e!601557)))

(declare-fun res!706338 () Bool)

(assert (=> b!1057681 (=> res!706338 e!601557)))

(declare-fun lt!466572 () (_ BitVec 32))

(assert (=> b!1057681 (= res!706338 (or (bvslt lt!466574 #b00000000000000000000000000000000) (bvsge lt!466572 (size!32613 a!3488)) (bvsge lt!466574 (size!32613 a!3488))))))

(assert (=> b!1057681 (arrayContainsKey!0 a!3488 k!2747 lt!466572)))

(declare-datatypes ((Unit!34676 0))(
  ( (Unit!34677) )
))
(declare-fun lt!466573 () Unit!34676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34676)

(assert (=> b!1057681 (= lt!466573 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466572))))

(assert (=> b!1057681 (= lt!466572 (bvadd #b00000000000000000000000000000001 lt!466574))))

(assert (=> b!1057681 (arrayNoDuplicates!0 a!3488 lt!466574 Nil!22386)))

(declare-fun lt!466575 () Unit!34676)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66711 (_ BitVec 32) (_ BitVec 32)) Unit!34676)

(assert (=> b!1057681 (= lt!466575 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466574))))

(declare-fun b!1057682 () Bool)

(assert (=> b!1057682 (= e!601558 e!601564)))

(declare-fun res!706333 () Bool)

(assert (=> b!1057682 (=> (not res!706333) (not e!601564))))

(assert (=> b!1057682 (= res!706333 (arrayContainsKey!0 lt!466571 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057682 (= lt!466571 (array!66712 (store (arr!32077 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32613 a!3488)))))

(assert (= (and start!93312 res!706335) b!1057675))

(assert (= (and b!1057675 res!706339) b!1057680))

(assert (= (and b!1057680 res!706336) b!1057673))

(assert (= (and b!1057673 res!706334) b!1057682))

(assert (= (and b!1057682 res!706333) b!1057676))

(assert (= (and b!1057676 res!706331) b!1057677))

(assert (= (and b!1057677 res!706337) b!1057679))

(assert (= (and b!1057679 (not res!706340)) b!1057674))

(assert (= (and b!1057677 (not res!706332)) b!1057681))

(assert (= (and b!1057681 (not res!706338)) b!1057678))

(declare-fun m!977357 () Bool)

(assert (=> b!1057674 m!977357))

(declare-fun m!977359 () Bool)

(assert (=> b!1057682 m!977359))

(declare-fun m!977361 () Bool)

(assert (=> b!1057682 m!977361))

(declare-fun m!977363 () Bool)

(assert (=> b!1057675 m!977363))

(declare-fun m!977365 () Bool)

(assert (=> b!1057681 m!977365))

(declare-fun m!977367 () Bool)

(assert (=> b!1057681 m!977367))

(declare-fun m!977369 () Bool)

(assert (=> b!1057681 m!977369))

(declare-fun m!977371 () Bool)

(assert (=> b!1057681 m!977371))

(declare-fun m!977373 () Bool)

(assert (=> start!93312 m!977373))

(assert (=> b!1057677 m!977361))

(declare-fun m!977375 () Bool)

(assert (=> b!1057677 m!977375))

(declare-fun m!977377 () Bool)

(assert (=> b!1057676 m!977377))

(declare-fun m!977379 () Bool)

(assert (=> b!1057680 m!977379))

(declare-fun m!977381 () Bool)

(assert (=> b!1057673 m!977381))

(declare-fun m!977383 () Bool)

(assert (=> b!1057678 m!977383))

(push 1)

(assert (not b!1057680))

(assert (not start!93312))

(assert (not b!1057674))

(assert (not b!1057676))

(assert (not b!1057681))

(assert (not b!1057682))

(assert (not b!1057678))

(assert (not b!1057675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128463 () Bool)

(declare-fun lt!466614 () (_ BitVec 32))

(assert (=> d!128463 (and (or (bvslt lt!466614 #b00000000000000000000000000000000) (bvsge lt!466614 (size!32613 lt!466571)) (and (bvsge lt!466614 #b00000000000000000000000000000000) (bvslt lt!466614 (size!32613 lt!466571)))) (bvsge lt!466614 #b00000000000000000000000000000000) (bvslt lt!466614 (size!32613 lt!466571)) (= (select (arr!32077 lt!466571) lt!466614) k!2747))))

(declare-fun e!601636 () (_ BitVec 32))

(assert (=> d!128463 (= lt!466614 e!601636)))

(declare-fun c!107139 () Bool)

(assert (=> d!128463 (= c!107139 (= (select (arr!32077 lt!466571) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32613 lt!466571)) (bvslt (size!32613 lt!466571) #b01111111111111111111111111111111))))

(assert (=> d!128463 (= (arrayScanForKey!0 lt!466571 k!2747 #b00000000000000000000000000000000) lt!466614)))

(declare-fun b!1057774 () Bool)

(assert (=> b!1057774 (= e!601636 #b00000000000000000000000000000000)))

(declare-fun b!1057775 () Bool)

(assert (=> b!1057775 (= e!601636 (arrayScanForKey!0 lt!466571 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128463 c!107139) b!1057774))

(assert (= (and d!128463 (not c!107139)) b!1057775))

(declare-fun m!977461 () Bool)

(assert (=> d!128463 m!977461))

(declare-fun m!977463 () Bool)

(assert (=> d!128463 m!977463))

(declare-fun m!977465 () Bool)

(assert (=> b!1057775 m!977465))

(assert (=> b!1057676 d!128463))

(declare-fun d!128467 () Bool)

(declare-fun res!706422 () Bool)

(declare-fun e!601643 () Bool)

(assert (=> d!128467 (=> res!706422 e!601643)))

(assert (=> d!128467 (= res!706422 (= (select (arr!32077 a!3488) lt!466572) k!2747))))

(assert (=> d!128467 (= (arrayContainsKey!0 a!3488 k!2747 lt!466572) e!601643)))

(declare-fun b!1057782 () Bool)

(declare-fun e!601644 () Bool)

(assert (=> b!1057782 (= e!601643 e!601644)))

(declare-fun res!706423 () Bool)

(assert (=> b!1057782 (=> (not res!706423) (not e!601644))))

(assert (=> b!1057782 (= res!706423 (bvslt (bvadd lt!466572 #b00000000000000000000000000000001) (size!32613 a!3488)))))

(declare-fun b!1057783 () Bool)

(assert (=> b!1057783 (= e!601644 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466572 #b00000000000000000000000000000001)))))

(assert (= (and d!128467 (not res!706422)) b!1057782))

(assert (= (and b!1057782 res!706423) b!1057783))

(declare-fun m!977469 () Bool)

(assert (=> d!128467 m!977469))

(declare-fun m!977471 () Bool)

(assert (=> b!1057783 m!977471))

(assert (=> b!1057681 d!128467))

(declare-fun d!128473 () Bool)

(assert (=> d!128473 (arrayContainsKey!0 a!3488 k!2747 lt!466572)))

(declare-fun lt!466620 () Unit!34676)

(declare-fun choose!114 (array!66711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34676)

(assert (=> d!128473 (= lt!466620 (choose!114 a!3488 k!2747 i!1381 lt!466572))))

(assert (=> d!128473 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128473 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466572) lt!466620)))

(declare-fun bs!31020 () Bool)

(assert (= bs!31020 d!128473))

(assert (=> bs!31020 m!977365))

(declare-fun m!977485 () Bool)

(assert (=> bs!31020 m!977485))

(assert (=> b!1057681 d!128473))

(declare-fun b!1057825 () Bool)

(declare-fun e!601683 () Bool)

(declare-fun e!601681 () Bool)

(assert (=> b!1057825 (= e!601683 e!601681)))

(declare-fun res!706455 () Bool)

(assert (=> b!1057825 (=> (not res!706455) (not e!601681))))

(declare-fun e!601684 () Bool)

(assert (=> b!1057825 (= res!706455 (not e!601684))))

(declare-fun res!706457 () Bool)

(assert (=> b!1057825 (=> (not res!706457) (not e!601684))))

(assert (=> b!1057825 (= res!706457 (validKeyInArray!0 (select (arr!32077 a!3488) lt!466574)))))

(declare-fun b!1057826 () Bool)

(declare-fun contains!6202 (List!22389 (_ BitVec 64)) Bool)

(assert (=> b!1057826 (= e!601684 (contains!6202 Nil!22386 (select (arr!32077 a!3488) lt!466574)))))

(declare-fun d!128483 () Bool)

(declare-fun res!706456 () Bool)

(assert (=> d!128483 (=> res!706456 e!601683)))

(assert (=> d!128483 (= res!706456 (bvsge lt!466574 (size!32613 a!3488)))))

(assert (=> d!128483 (= (arrayNoDuplicates!0 a!3488 lt!466574 Nil!22386) e!601683)))

(declare-fun b!1057827 () Bool)

(declare-fun e!601682 () Bool)

(assert (=> b!1057827 (= e!601681 e!601682)))

(declare-fun c!107145 () Bool)

(assert (=> b!1057827 (= c!107145 (validKeyInArray!0 (select (arr!32077 a!3488) lt!466574)))))

(declare-fun b!1057828 () Bool)

(declare-fun call!44857 () Bool)

(assert (=> b!1057828 (= e!601682 call!44857)))

(declare-fun b!1057829 () Bool)

(assert (=> b!1057829 (= e!601682 call!44857)))

(declare-fun bm!44854 () Bool)

(assert (=> bm!44854 (= call!44857 (arrayNoDuplicates!0 a!3488 (bvadd lt!466574 #b00000000000000000000000000000001) (ite c!107145 (Cons!22385 (select (arr!32077 a!3488) lt!466574) Nil!22386) Nil!22386)))))

(assert (= (and d!128483 (not res!706456)) b!1057825))

(assert (= (and b!1057825 res!706457) b!1057826))

(assert (= (and b!1057825 res!706455) b!1057827))

(assert (= (and b!1057827 c!107145) b!1057828))

(assert (= (and b!1057827 (not c!107145)) b!1057829))

(assert (= (or b!1057828 b!1057829) bm!44854))

(declare-fun m!977501 () Bool)

(assert (=> b!1057825 m!977501))

(assert (=> b!1057825 m!977501))

(declare-fun m!977503 () Bool)

(assert (=> b!1057825 m!977503))

(assert (=> b!1057826 m!977501))

(assert (=> b!1057826 m!977501))

(declare-fun m!977505 () Bool)

(assert (=> b!1057826 m!977505))

(assert (=> b!1057827 m!977501))

(assert (=> b!1057827 m!977501))

(assert (=> b!1057827 m!977503))

(assert (=> bm!44854 m!977501))

(declare-fun m!977507 () Bool)

(assert (=> bm!44854 m!977507))

(assert (=> b!1057681 d!128483))

(declare-fun d!128493 () Bool)

(assert (=> d!128493 (arrayNoDuplicates!0 a!3488 lt!466574 Nil!22386)))

(declare-fun lt!466626 () Unit!34676)

(declare-fun choose!39 (array!66711 (_ BitVec 32) (_ BitVec 32)) Unit!34676)

(assert (=> d!128493 (= lt!466626 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466574))))

(assert (=> d!128493 (bvslt (size!32613 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128493 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466574) lt!466626)))

(declare-fun bs!31022 () Bool)

(assert (= bs!31022 d!128493))

(assert (=> bs!31022 m!977369))

(declare-fun m!977517 () Bool)

(assert (=> bs!31022 m!977517))

(assert (=> b!1057681 d!128493))

(declare-fun b!1057835 () Bool)

(declare-fun e!601691 () Bool)

(declare-fun e!601689 () Bool)

(assert (=> b!1057835 (= e!601691 e!601689)))

(declare-fun res!706461 () Bool)

(assert (=> b!1057835 (=> (not res!706461) (not e!601689))))

(declare-fun e!601692 () Bool)

(assert (=> b!1057835 (= res!706461 (not e!601692))))

(declare-fun res!706463 () Bool)

(assert (=> b!1057835 (=> (not res!706463) (not e!601692))))

(assert (=> b!1057835 (= res!706463 (validKeyInArray!0 (select (arr!32077 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057836 () Bool)

(assert (=> b!1057836 (= e!601692 (contains!6202 Nil!22386 (select (arr!32077 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128497 () Bool)

(declare-fun res!706462 () Bool)

(assert (=> d!128497 (=> res!706462 e!601691)))

(assert (=> d!128497 (= res!706462 (bvsge #b00000000000000000000000000000000 (size!32613 a!3488)))))

(assert (=> d!128497 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22386) e!601691)))

(declare-fun b!1057837 () Bool)

(declare-fun e!601690 () Bool)

(assert (=> b!1057837 (= e!601689 e!601690)))

(declare-fun c!107147 () Bool)

(assert (=> b!1057837 (= c!107147 (validKeyInArray!0 (select (arr!32077 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057838 () Bool)

(declare-fun call!44859 () Bool)

(assert (=> b!1057838 (= e!601690 call!44859)))

(declare-fun b!1057839 () Bool)

(assert (=> b!1057839 (= e!601690 call!44859)))

(declare-fun bm!44856 () Bool)

(assert (=> bm!44856 (= call!44859 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107147 (Cons!22385 (select (arr!32077 a!3488) #b00000000000000000000000000000000) Nil!22386) Nil!22386)))))

(assert (= (and d!128497 (not res!706462)) b!1057835))

(assert (= (and b!1057835 res!706463) b!1057836))

(assert (= (and b!1057835 res!706461) b!1057837))

(assert (= (and b!1057837 c!107147) b!1057838))

(assert (= (and b!1057837 (not c!107147)) b!1057839))

