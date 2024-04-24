; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104206 () Bool)

(assert start!104206)

(declare-fun b!1245764 () Bool)

(declare-fun res!830624 () Bool)

(declare-fun e!706220 () Bool)

(assert (=> b!1245764 (=> (not res!830624) (not e!706220))))

(declare-datatypes ((array!80097 0))(
  ( (array!80098 (arr!38636 (Array (_ BitVec 32) (_ BitVec 64))) (size!39173 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80097)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27452 0))(
  ( (Nil!27449) (Cons!27448 (h!28666 (_ BitVec 64)) (t!40913 List!27452)) )
))
(declare-fun arrayNoDuplicates!0 (array!80097 (_ BitVec 32) List!27452) Bool)

(assert (=> b!1245764 (= res!830624 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27449))))

(declare-fun b!1245765 () Bool)

(declare-datatypes ((Unit!41351 0))(
  ( (Unit!41352) )
))
(declare-fun e!706219 () Unit!41351)

(declare-fun Unit!41353 () Unit!41351)

(assert (=> b!1245765 (= e!706219 Unit!41353)))

(declare-fun b!1245766 () Bool)

(declare-fun lt!563231 () Unit!41351)

(assert (=> b!1245766 (= e!706219 lt!563231)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80097 List!27452 List!27452 (_ BitVec 32)) Unit!41351)

(assert (=> b!1245766 (= lt!563231 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27448 (select (arr!38636 a!3892) from!3270) Nil!27449) Nil!27449 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1245766 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27449)))

(declare-fun b!1245767 () Bool)

(declare-fun res!830620 () Bool)

(declare-fun e!706221 () Bool)

(assert (=> b!1245767 (=> (not res!830620) (not e!706221))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245767 (= res!830620 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39173 a!3892)) (not (= newFrom!287 (size!39173 a!3892)))))))

(declare-fun b!1245768 () Bool)

(assert (=> b!1245768 (= e!706221 e!706220)))

(declare-fun res!830623 () Bool)

(assert (=> b!1245768 (=> (not res!830623) (not e!706220))))

(assert (=> b!1245768 (= res!830623 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563230 () Unit!41351)

(assert (=> b!1245768 (= lt!563230 e!706219)))

(declare-fun c!122264 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245768 (= c!122264 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun res!830622 () Bool)

(assert (=> start!104206 (=> (not res!830622) (not e!706221))))

(assert (=> start!104206 (= res!830622 (and (bvslt (size!39173 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39173 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39173 a!3892))))))

(assert (=> start!104206 e!706221))

(declare-fun array_inv!29574 (array!80097) Bool)

(assert (=> start!104206 (array_inv!29574 a!3892)))

(assert (=> start!104206 true))

(declare-fun b!1245769 () Bool)

(declare-fun res!830625 () Bool)

(assert (=> b!1245769 (=> (not res!830625) (not e!706221))))

(assert (=> b!1245769 (= res!830625 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27449))))

(declare-fun b!1245770 () Bool)

(declare-fun e!706223 () Bool)

(assert (=> b!1245770 (= e!706220 (not e!706223))))

(declare-fun res!830621 () Bool)

(assert (=> b!1245770 (=> res!830621 e!706223)))

(assert (=> b!1245770 (= res!830621 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1245770 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27449)))

(declare-fun lt!563229 () Unit!41351)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80097 (_ BitVec 32) (_ BitVec 32)) Unit!41351)

(assert (=> b!1245770 (= lt!563229 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1245771 () Bool)

(declare-fun noDuplicate!2023 (List!27452) Bool)

(assert (=> b!1245771 (= e!706223 (noDuplicate!2023 Nil!27449))))

(assert (= (and start!104206 res!830622) b!1245769))

(assert (= (and b!1245769 res!830625) b!1245767))

(assert (= (and b!1245767 res!830620) b!1245768))

(assert (= (and b!1245768 c!122264) b!1245766))

(assert (= (and b!1245768 (not c!122264)) b!1245765))

(assert (= (and b!1245768 res!830623) b!1245764))

(assert (= (and b!1245764 res!830624) b!1245770))

(assert (= (and b!1245770 (not res!830621)) b!1245771))

(declare-fun m!1148359 () Bool)

(assert (=> b!1245770 m!1148359))

(declare-fun m!1148361 () Bool)

(assert (=> b!1245770 m!1148361))

(declare-fun m!1148363 () Bool)

(assert (=> start!104206 m!1148363))

(declare-fun m!1148365 () Bool)

(assert (=> b!1245766 m!1148365))

(declare-fun m!1148367 () Bool)

(assert (=> b!1245766 m!1148367))

(declare-fun m!1148369 () Bool)

(assert (=> b!1245766 m!1148369))

(declare-fun m!1148371 () Bool)

(assert (=> b!1245769 m!1148371))

(declare-fun m!1148373 () Bool)

(assert (=> b!1245771 m!1148373))

(assert (=> b!1245764 m!1148369))

(assert (=> b!1245768 m!1148365))

(assert (=> b!1245768 m!1148365))

(declare-fun m!1148375 () Bool)

(assert (=> b!1245768 m!1148375))

(check-sat (not b!1245764) (not b!1245771) (not b!1245768) (not b!1245766) (not start!104206) (not b!1245770) (not b!1245769))
(check-sat)
(get-model)

(declare-fun d!137585 () Bool)

(declare-fun res!830666 () Bool)

(declare-fun e!706258 () Bool)

(assert (=> d!137585 (=> res!830666 e!706258)))

(get-info :version)

(assert (=> d!137585 (= res!830666 ((_ is Nil!27449) Nil!27449))))

(assert (=> d!137585 (= (noDuplicate!2023 Nil!27449) e!706258)))

(declare-fun b!1245824 () Bool)

(declare-fun e!706259 () Bool)

(assert (=> b!1245824 (= e!706258 e!706259)))

(declare-fun res!830667 () Bool)

(assert (=> b!1245824 (=> (not res!830667) (not e!706259))))

(declare-fun contains!7461 (List!27452 (_ BitVec 64)) Bool)

(assert (=> b!1245824 (= res!830667 (not (contains!7461 (t!40913 Nil!27449) (h!28666 Nil!27449))))))

(declare-fun b!1245825 () Bool)

(assert (=> b!1245825 (= e!706259 (noDuplicate!2023 (t!40913 Nil!27449)))))

(assert (= (and d!137585 (not res!830666)) b!1245824))

(assert (= (and b!1245824 res!830667) b!1245825))

(declare-fun m!1148413 () Bool)

(assert (=> b!1245824 m!1148413))

(declare-fun m!1148415 () Bool)

(assert (=> b!1245825 m!1148415))

(assert (=> b!1245771 d!137585))

(declare-fun d!137587 () Bool)

(assert (=> d!137587 (= (array_inv!29574 a!3892) (bvsge (size!39173 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104206 d!137587))

(declare-fun d!137589 () Bool)

(assert (=> d!137589 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27449)))

(declare-fun lt!563252 () Unit!41351)

(declare-fun choose!80 (array!80097 List!27452 List!27452 (_ BitVec 32)) Unit!41351)

(assert (=> d!137589 (= lt!563252 (choose!80 a!3892 (Cons!27448 (select (arr!38636 a!3892) from!3270) Nil!27449) Nil!27449 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137589 (bvslt (size!39173 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137589 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27448 (select (arr!38636 a!3892) from!3270) Nil!27449) Nil!27449 (bvadd #b00000000000000000000000000000001 from!3270)) lt!563252)))

(declare-fun bs!35057 () Bool)

(assert (= bs!35057 d!137589))

(assert (=> bs!35057 m!1148369))

(declare-fun m!1148417 () Bool)

(assert (=> bs!35057 m!1148417))

(assert (=> b!1245766 d!137589))

(declare-fun b!1245846 () Bool)

(declare-fun e!706277 () Bool)

(assert (=> b!1245846 (= e!706277 (contains!7461 Nil!27449 (select (arr!38636 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1245847 () Bool)

(declare-fun e!706276 () Bool)

(declare-fun call!61481 () Bool)

(assert (=> b!1245847 (= e!706276 call!61481)))

(declare-fun bm!61478 () Bool)

(declare-fun c!122275 () Bool)

(assert (=> bm!61478 (= call!61481 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122275 (Cons!27448 (select (arr!38636 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27449) Nil!27449)))))

(declare-fun b!1245849 () Bool)

(assert (=> b!1245849 (= e!706276 call!61481)))

(declare-fun b!1245850 () Bool)

(declare-fun e!706278 () Bool)

(declare-fun e!706279 () Bool)

(assert (=> b!1245850 (= e!706278 e!706279)))

(declare-fun res!830682 () Bool)

(assert (=> b!1245850 (=> (not res!830682) (not e!706279))))

(assert (=> b!1245850 (= res!830682 (not e!706277))))

(declare-fun res!830681 () Bool)

(assert (=> b!1245850 (=> (not res!830681) (not e!706277))))

(assert (=> b!1245850 (= res!830681 (validKeyInArray!0 (select (arr!38636 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137591 () Bool)

(declare-fun res!830680 () Bool)

(assert (=> d!137591 (=> res!830680 e!706278)))

(assert (=> d!137591 (= res!830680 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39173 a!3892)))))

(assert (=> d!137591 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27449) e!706278)))

(declare-fun b!1245848 () Bool)

(assert (=> b!1245848 (= e!706279 e!706276)))

(assert (=> b!1245848 (= c!122275 (validKeyInArray!0 (select (arr!38636 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137591 (not res!830680)) b!1245850))

(assert (= (and b!1245850 res!830681) b!1245846))

(assert (= (and b!1245850 res!830682) b!1245848))

(assert (= (and b!1245848 c!122275) b!1245847))

(assert (= (and b!1245848 (not c!122275)) b!1245849))

(assert (= (or b!1245847 b!1245849) bm!61478))

(declare-fun m!1148419 () Bool)

(assert (=> b!1245846 m!1148419))

(assert (=> b!1245846 m!1148419))

(declare-fun m!1148421 () Bool)

(assert (=> b!1245846 m!1148421))

(assert (=> bm!61478 m!1148419))

(declare-fun m!1148423 () Bool)

(assert (=> bm!61478 m!1148423))

(assert (=> b!1245850 m!1148419))

(assert (=> b!1245850 m!1148419))

(declare-fun m!1148425 () Bool)

(assert (=> b!1245850 m!1148425))

(assert (=> b!1245848 m!1148419))

(assert (=> b!1245848 m!1148419))

(assert (=> b!1245848 m!1148425))

(assert (=> b!1245766 d!137591))

(declare-fun b!1245851 () Bool)

(declare-fun e!706281 () Bool)

(assert (=> b!1245851 (= e!706281 (contains!7461 Nil!27449 (select (arr!38636 a!3892) newFrom!287)))))

(declare-fun b!1245852 () Bool)

(declare-fun e!706280 () Bool)

(declare-fun call!61482 () Bool)

(assert (=> b!1245852 (= e!706280 call!61482)))

(declare-fun c!122276 () Bool)

(declare-fun bm!61479 () Bool)

(assert (=> bm!61479 (= call!61482 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122276 (Cons!27448 (select (arr!38636 a!3892) newFrom!287) Nil!27449) Nil!27449)))))

(declare-fun b!1245854 () Bool)

(assert (=> b!1245854 (= e!706280 call!61482)))

(declare-fun b!1245855 () Bool)

(declare-fun e!706282 () Bool)

(declare-fun e!706283 () Bool)

(assert (=> b!1245855 (= e!706282 e!706283)))

(declare-fun res!830685 () Bool)

(assert (=> b!1245855 (=> (not res!830685) (not e!706283))))

(assert (=> b!1245855 (= res!830685 (not e!706281))))

(declare-fun res!830684 () Bool)

(assert (=> b!1245855 (=> (not res!830684) (not e!706281))))

(assert (=> b!1245855 (= res!830684 (validKeyInArray!0 (select (arr!38636 a!3892) newFrom!287)))))

(declare-fun d!137595 () Bool)

(declare-fun res!830683 () Bool)

(assert (=> d!137595 (=> res!830683 e!706282)))

(assert (=> d!137595 (= res!830683 (bvsge newFrom!287 (size!39173 a!3892)))))

(assert (=> d!137595 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27449) e!706282)))

(declare-fun b!1245853 () Bool)

(assert (=> b!1245853 (= e!706283 e!706280)))

(assert (=> b!1245853 (= c!122276 (validKeyInArray!0 (select (arr!38636 a!3892) newFrom!287)))))

(assert (= (and d!137595 (not res!830683)) b!1245855))

(assert (= (and b!1245855 res!830684) b!1245851))

(assert (= (and b!1245855 res!830685) b!1245853))

(assert (= (and b!1245853 c!122276) b!1245852))

(assert (= (and b!1245853 (not c!122276)) b!1245854))

(assert (= (or b!1245852 b!1245854) bm!61479))

(declare-fun m!1148427 () Bool)

(assert (=> b!1245851 m!1148427))

(assert (=> b!1245851 m!1148427))

(declare-fun m!1148429 () Bool)

(assert (=> b!1245851 m!1148429))

(assert (=> bm!61479 m!1148427))

(declare-fun m!1148431 () Bool)

(assert (=> bm!61479 m!1148431))

(assert (=> b!1245855 m!1148427))

(assert (=> b!1245855 m!1148427))

(declare-fun m!1148433 () Bool)

(assert (=> b!1245855 m!1148433))

(assert (=> b!1245853 m!1148427))

(assert (=> b!1245853 m!1148427))

(assert (=> b!1245853 m!1148433))

(assert (=> b!1245770 d!137595))

(declare-fun d!137597 () Bool)

(assert (=> d!137597 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27449)))

(declare-fun lt!563255 () Unit!41351)

(declare-fun choose!39 (array!80097 (_ BitVec 32) (_ BitVec 32)) Unit!41351)

(assert (=> d!137597 (= lt!563255 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137597 (bvslt (size!39173 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137597 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!563255)))

(declare-fun bs!35058 () Bool)

(assert (= bs!35058 d!137597))

(assert (=> bs!35058 m!1148359))

(declare-fun m!1148443 () Bool)

(assert (=> bs!35058 m!1148443))

(assert (=> b!1245770 d!137597))

(declare-fun b!1245861 () Bool)

(declare-fun e!706289 () Bool)

(assert (=> b!1245861 (= e!706289 (contains!7461 Nil!27449 (select (arr!38636 a!3892) from!3270)))))

(declare-fun b!1245862 () Bool)

(declare-fun e!706288 () Bool)

(declare-fun call!61484 () Bool)

(assert (=> b!1245862 (= e!706288 call!61484)))

(declare-fun bm!61481 () Bool)

(declare-fun c!122278 () Bool)

(assert (=> bm!61481 (= call!61484 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122278 (Cons!27448 (select (arr!38636 a!3892) from!3270) Nil!27449) Nil!27449)))))

(declare-fun b!1245864 () Bool)

(assert (=> b!1245864 (= e!706288 call!61484)))

(declare-fun b!1245865 () Bool)

(declare-fun e!706290 () Bool)

(declare-fun e!706291 () Bool)

(assert (=> b!1245865 (= e!706290 e!706291)))

(declare-fun res!830691 () Bool)

(assert (=> b!1245865 (=> (not res!830691) (not e!706291))))

(assert (=> b!1245865 (= res!830691 (not e!706289))))

(declare-fun res!830690 () Bool)

(assert (=> b!1245865 (=> (not res!830690) (not e!706289))))

(assert (=> b!1245865 (= res!830690 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(declare-fun d!137601 () Bool)

(declare-fun res!830689 () Bool)

(assert (=> d!137601 (=> res!830689 e!706290)))

(assert (=> d!137601 (= res!830689 (bvsge from!3270 (size!39173 a!3892)))))

(assert (=> d!137601 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27449) e!706290)))

(declare-fun b!1245863 () Bool)

(assert (=> b!1245863 (= e!706291 e!706288)))

(assert (=> b!1245863 (= c!122278 (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)))))

(assert (= (and d!137601 (not res!830689)) b!1245865))

(assert (= (and b!1245865 res!830690) b!1245861))

(assert (= (and b!1245865 res!830691) b!1245863))

(assert (= (and b!1245863 c!122278) b!1245862))

(assert (= (and b!1245863 (not c!122278)) b!1245864))

(assert (= (or b!1245862 b!1245864) bm!61481))

(assert (=> b!1245861 m!1148365))

(assert (=> b!1245861 m!1148365))

(declare-fun m!1148445 () Bool)

(assert (=> b!1245861 m!1148445))

(assert (=> bm!61481 m!1148365))

(declare-fun m!1148447 () Bool)

(assert (=> bm!61481 m!1148447))

(assert (=> b!1245865 m!1148365))

(assert (=> b!1245865 m!1148365))

(assert (=> b!1245865 m!1148375))

(assert (=> b!1245863 m!1148365))

(assert (=> b!1245863 m!1148365))

(assert (=> b!1245863 m!1148375))

(assert (=> b!1245769 d!137601))

(assert (=> b!1245764 d!137591))

(declare-fun d!137603 () Bool)

(assert (=> d!137603 (= (validKeyInArray!0 (select (arr!38636 a!3892) from!3270)) (and (not (= (select (arr!38636 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38636 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245768 d!137603))

(check-sat (not bm!61478) (not b!1245865) (not d!137589) (not b!1245851) (not bm!61479) (not b!1245853) (not b!1245863) (not b!1245861) (not b!1245850) (not b!1245824) (not bm!61481) (not b!1245848) (not b!1245825) (not b!1245855) (not d!137597) (not b!1245846))
(check-sat)
