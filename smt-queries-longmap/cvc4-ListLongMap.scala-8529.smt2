; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103974 () Bool)

(assert start!103974)

(declare-fun b!1244488 () Bool)

(declare-fun res!830126 () Bool)

(declare-fun e!705388 () Bool)

(assert (=> b!1244488 (=> (not res!830126) (not e!705388))))

(declare-datatypes ((array!80066 0))(
  ( (array!80067 (arr!38626 (Array (_ BitVec 32) (_ BitVec 64))) (size!39162 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80066)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244488 (= res!830126 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39162 a!3892)) (not (= newFrom!287 (size!39162 a!3892)))))))

(declare-fun b!1244489 () Bool)

(declare-fun res!830128 () Bool)

(assert (=> b!1244489 (=> (not res!830128) (not e!705388))))

(declare-datatypes ((List!27429 0))(
  ( (Nil!27426) (Cons!27425 (h!28634 (_ BitVec 64)) (t!40898 List!27429)) )
))
(declare-fun arrayNoDuplicates!0 (array!80066 (_ BitVec 32) List!27429) Bool)

(assert (=> b!1244489 (= res!830128 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27426))))

(declare-fun b!1244490 () Bool)

(declare-fun res!830123 () Bool)

(declare-fun e!705390 () Bool)

(assert (=> b!1244490 (=> (not res!830123) (not e!705390))))

(assert (=> b!1244490 (= res!830123 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27426))))

(declare-fun b!1244491 () Bool)

(declare-fun e!705389 () Bool)

(assert (=> b!1244491 (= e!705390 (not e!705389))))

(declare-fun res!830124 () Bool)

(assert (=> b!1244491 (=> res!830124 e!705389)))

(assert (=> b!1244491 (= res!830124 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1244491 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27426)))

(declare-datatypes ((Unit!41384 0))(
  ( (Unit!41385) )
))
(declare-fun lt!562763 () Unit!41384)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80066 (_ BitVec 32) (_ BitVec 32)) Unit!41384)

(assert (=> b!1244491 (= lt!562763 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun res!830127 () Bool)

(assert (=> start!103974 (=> (not res!830127) (not e!705388))))

(assert (=> start!103974 (= res!830127 (and (bvslt (size!39162 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39162 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39162 a!3892))))))

(assert (=> start!103974 e!705388))

(declare-fun array_inv!29474 (array!80066) Bool)

(assert (=> start!103974 (array_inv!29474 a!3892)))

(assert (=> start!103974 true))

(declare-fun b!1244492 () Bool)

(declare-fun e!705387 () Unit!41384)

(declare-fun Unit!41386 () Unit!41384)

(assert (=> b!1244492 (= e!705387 Unit!41386)))

(declare-fun b!1244493 () Bool)

(declare-fun noDuplicate!2007 (List!27429) Bool)

(assert (=> b!1244493 (= e!705389 (noDuplicate!2007 Nil!27426))))

(declare-fun b!1244494 () Bool)

(declare-fun lt!562762 () Unit!41384)

(assert (=> b!1244494 (= e!705387 lt!562762)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80066 List!27429 List!27429 (_ BitVec 32)) Unit!41384)

(assert (=> b!1244494 (= lt!562762 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27425 (select (arr!38626 a!3892) from!3270) Nil!27426) Nil!27426 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244494 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27426)))

(declare-fun b!1244495 () Bool)

(assert (=> b!1244495 (= e!705388 e!705390)))

(declare-fun res!830125 () Bool)

(assert (=> b!1244495 (=> (not res!830125) (not e!705390))))

(assert (=> b!1244495 (= res!830125 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562761 () Unit!41384)

(assert (=> b!1244495 (= lt!562761 e!705387)))

(declare-fun c!121867 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244495 (= c!121867 (validKeyInArray!0 (select (arr!38626 a!3892) from!3270)))))

(assert (= (and start!103974 res!830127) b!1244489))

(assert (= (and b!1244489 res!830128) b!1244488))

(assert (= (and b!1244488 res!830126) b!1244495))

(assert (= (and b!1244495 c!121867) b!1244494))

(assert (= (and b!1244495 (not c!121867)) b!1244492))

(assert (= (and b!1244495 res!830125) b!1244490))

(assert (= (and b!1244490 res!830123) b!1244491))

(assert (= (and b!1244491 (not res!830124)) b!1244493))

(declare-fun m!1146755 () Bool)

(assert (=> start!103974 m!1146755))

(declare-fun m!1146757 () Bool)

(assert (=> b!1244491 m!1146757))

(declare-fun m!1146759 () Bool)

(assert (=> b!1244491 m!1146759))

(declare-fun m!1146761 () Bool)

(assert (=> b!1244493 m!1146761))

(declare-fun m!1146763 () Bool)

(assert (=> b!1244490 m!1146763))

(declare-fun m!1146765 () Bool)

(assert (=> b!1244495 m!1146765))

(assert (=> b!1244495 m!1146765))

(declare-fun m!1146767 () Bool)

(assert (=> b!1244495 m!1146767))

(assert (=> b!1244494 m!1146765))

(declare-fun m!1146769 () Bool)

(assert (=> b!1244494 m!1146769))

(assert (=> b!1244494 m!1146763))

(declare-fun m!1146771 () Bool)

(assert (=> b!1244489 m!1146771))

(push 1)

(assert (not start!103974))

(assert (not b!1244491))

(assert (not b!1244490))

(assert (not b!1244494))

(assert (not b!1244495))

(assert (not b!1244489))

(assert (not b!1244493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1244552 () Bool)

(declare-fun e!705438 () Bool)

(declare-fun call!61419 () Bool)

(assert (=> b!1244552 (= e!705438 call!61419)))

(declare-fun b!1244553 () Bool)

(declare-fun e!705440 () Bool)

(assert (=> b!1244553 (= e!705440 e!705438)))

(declare-fun c!121878 () Bool)

(assert (=> b!1244553 (= c!121878 (validKeyInArray!0 (select (arr!38626 a!3892) newFrom!287)))))

(declare-fun b!1244554 () Bool)

(assert (=> b!1244554 (= e!705438 call!61419)))

(declare-fun d!137133 () Bool)

(declare-fun res!830165 () Bool)

(declare-fun e!705439 () Bool)

(assert (=> d!137133 (=> res!830165 e!705439)))

(assert (=> d!137133 (= res!830165 (bvsge newFrom!287 (size!39162 a!3892)))))

(assert (=> d!137133 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27426) e!705439)))

(declare-fun b!1244555 () Bool)

(assert (=> b!1244555 (= e!705439 e!705440)))

(declare-fun res!830167 () Bool)

(assert (=> b!1244555 (=> (not res!830167) (not e!705440))))

(declare-fun e!705437 () Bool)

(assert (=> b!1244555 (= res!830167 (not e!705437))))

(declare-fun res!830166 () Bool)

(assert (=> b!1244555 (=> (not res!830166) (not e!705437))))

(assert (=> b!1244555 (= res!830166 (validKeyInArray!0 (select (arr!38626 a!3892) newFrom!287)))))

(declare-fun b!1244556 () Bool)

(declare-fun contains!7429 (List!27429 (_ BitVec 64)) Bool)

(assert (=> b!1244556 (= e!705437 (contains!7429 Nil!27426 (select (arr!38626 a!3892) newFrom!287)))))

(declare-fun bm!61416 () Bool)

(assert (=> bm!61416 (= call!61419 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121878 (Cons!27425 (select (arr!38626 a!3892) newFrom!287) Nil!27426) Nil!27426)))))

(assert (= (and d!137133 (not res!830165)) b!1244555))

(assert (= (and b!1244555 res!830166) b!1244556))

(assert (= (and b!1244555 res!830167) b!1244553))

(assert (= (and b!1244553 c!121878) b!1244552))

(assert (= (and b!1244553 (not c!121878)) b!1244554))

(assert (= (or b!1244552 b!1244554) bm!61416))

(declare-fun m!1146803 () Bool)

(assert (=> b!1244553 m!1146803))

(assert (=> b!1244553 m!1146803))

(declare-fun m!1146807 () Bool)

(assert (=> b!1244553 m!1146807))

(assert (=> b!1244555 m!1146803))

(assert (=> b!1244555 m!1146803))

(assert (=> b!1244555 m!1146807))

(assert (=> b!1244556 m!1146803))

(assert (=> b!1244556 m!1146803))

(declare-fun m!1146809 () Bool)

(assert (=> b!1244556 m!1146809))

(assert (=> bm!61416 m!1146803))

(declare-fun m!1146811 () Bool)

(assert (=> bm!61416 m!1146811))

(assert (=> b!1244491 d!137133))

(declare-fun d!137145 () Bool)

(assert (=> d!137145 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27426)))

(declare-fun lt!562772 () Unit!41384)

(declare-fun choose!39 (array!80066 (_ BitVec 32) (_ BitVec 32)) Unit!41384)

(assert (=> d!137145 (= lt!562772 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137145 (bvslt (size!39162 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137145 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562772)))

(declare-fun bs!35041 () Bool)

(assert (= bs!35041 d!137145))

(assert (=> bs!35041 m!1146757))

(declare-fun m!1146817 () Bool)

(assert (=> bs!35041 m!1146817))

(assert (=> b!1244491 d!137145))

(declare-fun d!137149 () Bool)

(assert (=> d!137149 (= (validKeyInArray!0 (select (arr!38626 a!3892) from!3270)) (and (not (= (select (arr!38626 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38626 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244495 d!137149))

(declare-fun d!137153 () Bool)

(assert (=> d!137153 (= (array_inv!29474 a!3892) (bvsge (size!39162 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103974 d!137153))

(declare-fun b!1244568 () Bool)

(declare-fun e!705452 () Bool)

(declare-fun call!61421 () Bool)

(assert (=> b!1244568 (= e!705452 call!61421)))

(declare-fun b!1244569 () Bool)

(declare-fun e!705454 () Bool)

(assert (=> b!1244569 (= e!705454 e!705452)))

(declare-fun c!121880 () Bool)

(assert (=> b!1244569 (= c!121880 (validKeyInArray!0 (select (arr!38626 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244570 () Bool)

(assert (=> b!1244570 (= e!705452 call!61421)))

(declare-fun d!137155 () Bool)

(declare-fun res!830177 () Bool)

(declare-fun e!705453 () Bool)

(assert (=> d!137155 (=> res!830177 e!705453)))

(assert (=> d!137155 (= res!830177 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39162 a!3892)))))

(assert (=> d!137155 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27426) e!705453)))

(declare-fun b!1244571 () Bool)

(assert (=> b!1244571 (= e!705453 e!705454)))

(declare-fun res!830179 () Bool)

(assert (=> b!1244571 (=> (not res!830179) (not e!705454))))

(declare-fun e!705451 () Bool)

(assert (=> b!1244571 (= res!830179 (not e!705451))))

(declare-fun res!830178 () Bool)

(assert (=> b!1244571 (=> (not res!830178) (not e!705451))))

(assert (=> b!1244571 (= res!830178 (validKeyInArray!0 (select (arr!38626 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244572 () Bool)

(assert (=> b!1244572 (= e!705451 (contains!7429 Nil!27426 (select (arr!38626 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun bm!61418 () Bool)

(assert (=> bm!61418 (= call!61421 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121880 (Cons!27425 (select (arr!38626 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27426) Nil!27426)))))

(assert (= (and d!137155 (not res!830177)) b!1244571))

(assert (= (and b!1244571 res!830178) b!1244572))

(assert (= (and b!1244571 res!830179) b!1244569))

(assert (= (and b!1244569 c!121880) b!1244568))

(assert (= (and b!1244569 (not c!121880)) b!1244570))

(assert (= (or b!1244568 b!1244570) bm!61418))

(declare-fun m!1146829 () Bool)

(assert (=> b!1244569 m!1146829))

(assert (=> b!1244569 m!1146829))

(declare-fun m!1146831 () Bool)

(assert (=> b!1244569 m!1146831))

(assert (=> b!1244571 m!1146829))

(assert (=> b!1244571 m!1146829))

(assert (=> b!1244571 m!1146831))

(assert (=> b!1244572 m!1146829))

(assert (=> b!1244572 m!1146829))

(declare-fun m!1146833 () Bool)

(assert (=> b!1244572 m!1146833))

(assert (=> bm!61418 m!1146829))

(declare-fun m!1146835 () Bool)

(assert (=> bm!61418 m!1146835))

(assert (=> b!1244490 d!137155))

(declare-fun d!137159 () Bool)

(assert (=> d!137159 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27426)))

(declare-fun lt!562780 () Unit!41384)

(declare-fun choose!80 (array!80066 List!27429 List!27429 (_ BitVec 32)) Unit!41384)

(assert (=> d!137159 (= lt!562780 (choose!80 a!3892 (Cons!27425 (select (arr!38626 a!3892) from!3270) Nil!27426) Nil!27426 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137159 (bvslt (size!39162 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137159 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27425 (select (arr!38626 a!3892) from!3270) Nil!27426) Nil!27426 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562780)))

(declare-fun bs!35043 () Bool)

(assert (= bs!35043 d!137159))

(assert (=> bs!35043 m!1146763))

(declare-fun m!1146845 () Bool)

(assert (=> bs!35043 m!1146845))

(assert (=> b!1244494 d!137159))

(assert (=> b!1244494 d!137155))

(declare-fun b!1244578 () Bool)

(declare-fun e!705460 () Bool)

(declare-fun call!61423 () Bool)

