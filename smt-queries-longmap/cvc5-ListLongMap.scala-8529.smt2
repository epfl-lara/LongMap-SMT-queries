; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103970 () Bool)

(assert start!103970)

(declare-fun b!1244440 () Bool)

(declare-datatypes ((Unit!41378 0))(
  ( (Unit!41379) )
))
(declare-fun e!705358 () Unit!41378)

(declare-fun lt!562743 () Unit!41378)

(assert (=> b!1244440 (= e!705358 lt!562743)))

(declare-datatypes ((array!80062 0))(
  ( (array!80063 (arr!38624 (Array (_ BitVec 32) (_ BitVec 64))) (size!39160 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80062)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27427 0))(
  ( (Nil!27424) (Cons!27423 (h!28632 (_ BitVec 64)) (t!40896 List!27427)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80062 List!27427 List!27427 (_ BitVec 32)) Unit!41378)

(assert (=> b!1244440 (= lt!562743 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27423 (select (arr!38624 a!3892) from!3270) Nil!27424) Nil!27424 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80062 (_ BitVec 32) List!27427) Bool)

(assert (=> b!1244440 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27424)))

(declare-fun b!1244441 () Bool)

(declare-fun Unit!41380 () Unit!41378)

(assert (=> b!1244441 (= e!705358 Unit!41380)))

(declare-fun b!1244442 () Bool)

(declare-fun res!830089 () Bool)

(declare-fun e!705360 () Bool)

(assert (=> b!1244442 (=> (not res!830089) (not e!705360))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244442 (= res!830089 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39160 a!3892)) (not (= newFrom!287 (size!39160 a!3892)))))))

(declare-fun b!1244443 () Bool)

(declare-fun res!830087 () Bool)

(declare-fun e!705359 () Bool)

(assert (=> b!1244443 (=> (not res!830087) (not e!705359))))

(assert (=> b!1244443 (= res!830087 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27424))))

(declare-fun b!1244444 () Bool)

(declare-fun e!705357 () Bool)

(assert (=> b!1244444 (= e!705359 (not e!705357))))

(declare-fun res!830090 () Bool)

(assert (=> b!1244444 (=> res!830090 e!705357)))

(assert (=> b!1244444 (= res!830090 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1244444 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27424)))

(declare-fun lt!562745 () Unit!41378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80062 (_ BitVec 32) (_ BitVec 32)) Unit!41378)

(assert (=> b!1244444 (= lt!562745 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244445 () Bool)

(declare-fun noDuplicate!2005 (List!27427) Bool)

(assert (=> b!1244445 (= e!705357 (noDuplicate!2005 Nil!27424))))

(declare-fun b!1244446 () Bool)

(assert (=> b!1244446 (= e!705360 e!705359)))

(declare-fun res!830092 () Bool)

(assert (=> b!1244446 (=> (not res!830092) (not e!705359))))

(assert (=> b!1244446 (= res!830092 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562744 () Unit!41378)

(assert (=> b!1244446 (= lt!562744 e!705358)))

(declare-fun c!121861 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244446 (= c!121861 (validKeyInArray!0 (select (arr!38624 a!3892) from!3270)))))

(declare-fun b!1244447 () Bool)

(declare-fun res!830091 () Bool)

(assert (=> b!1244447 (=> (not res!830091) (not e!705360))))

(assert (=> b!1244447 (= res!830091 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27424))))

(declare-fun res!830088 () Bool)

(assert (=> start!103970 (=> (not res!830088) (not e!705360))))

(assert (=> start!103970 (= res!830088 (and (bvslt (size!39160 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39160 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39160 a!3892))))))

(assert (=> start!103970 e!705360))

(declare-fun array_inv!29472 (array!80062) Bool)

(assert (=> start!103970 (array_inv!29472 a!3892)))

(assert (=> start!103970 true))

(assert (= (and start!103970 res!830088) b!1244447))

(assert (= (and b!1244447 res!830091) b!1244442))

(assert (= (and b!1244442 res!830089) b!1244446))

(assert (= (and b!1244446 c!121861) b!1244440))

(assert (= (and b!1244446 (not c!121861)) b!1244441))

(assert (= (and b!1244446 res!830092) b!1244443))

(assert (= (and b!1244443 res!830087) b!1244444))

(assert (= (and b!1244444 (not res!830090)) b!1244445))

(declare-fun m!1146719 () Bool)

(assert (=> b!1244445 m!1146719))

(declare-fun m!1146721 () Bool)

(assert (=> b!1244440 m!1146721))

(declare-fun m!1146723 () Bool)

(assert (=> b!1244440 m!1146723))

(declare-fun m!1146725 () Bool)

(assert (=> b!1244440 m!1146725))

(declare-fun m!1146727 () Bool)

(assert (=> b!1244447 m!1146727))

(assert (=> b!1244443 m!1146725))

(declare-fun m!1146729 () Bool)

(assert (=> b!1244444 m!1146729))

(declare-fun m!1146731 () Bool)

(assert (=> b!1244444 m!1146731))

(assert (=> b!1244446 m!1146721))

(assert (=> b!1244446 m!1146721))

(declare-fun m!1146733 () Bool)

(assert (=> b!1244446 m!1146733))

(declare-fun m!1146735 () Bool)

(assert (=> start!103970 m!1146735))

(push 1)

(assert (not b!1244447))

(assert (not b!1244446))

(assert (not start!103970))

(assert (not b!1244444))

(assert (not b!1244443))

(assert (not b!1244445))

(assert (not b!1244440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137125 () Bool)

(assert (=> d!137125 (= (validKeyInArray!0 (select (arr!38624 a!3892) from!3270)) (and (not (= (select (arr!38624 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38624 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244446 d!137125))

(declare-fun b!1244537 () Bool)

(declare-fun e!705427 () Bool)

(declare-fun contains!7428 (List!27427 (_ BitVec 64)) Bool)

(assert (=> b!1244537 (= e!705427 (contains!7428 Nil!27424 (select (arr!38624 a!3892) from!3270)))))

(declare-fun b!1244538 () Bool)

(declare-fun e!705425 () Bool)

(declare-fun call!61416 () Bool)

(assert (=> b!1244538 (= e!705425 call!61416)))

(declare-fun d!137127 () Bool)

(declare-fun res!830158 () Bool)

(declare-fun e!705428 () Bool)

(assert (=> d!137127 (=> res!830158 e!705428)))

(assert (=> d!137127 (= res!830158 (bvsge from!3270 (size!39160 a!3892)))))

(assert (=> d!137127 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27424) e!705428)))

(declare-fun bm!61413 () Bool)

(declare-fun c!121875 () Bool)

(assert (=> bm!61413 (= call!61416 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121875 (Cons!27423 (select (arr!38624 a!3892) from!3270) Nil!27424) Nil!27424)))))

(declare-fun b!1244539 () Bool)

(declare-fun e!705426 () Bool)

(assert (=> b!1244539 (= e!705426 e!705425)))

(assert (=> b!1244539 (= c!121875 (validKeyInArray!0 (select (arr!38624 a!3892) from!3270)))))

(declare-fun b!1244540 () Bool)

(assert (=> b!1244540 (= e!705425 call!61416)))

(declare-fun b!1244541 () Bool)

(assert (=> b!1244541 (= e!705428 e!705426)))

(declare-fun res!830157 () Bool)

(assert (=> b!1244541 (=> (not res!830157) (not e!705426))))

(assert (=> b!1244541 (= res!830157 (not e!705427))))

(declare-fun res!830156 () Bool)

(assert (=> b!1244541 (=> (not res!830156) (not e!705427))))

(assert (=> b!1244541 (= res!830156 (validKeyInArray!0 (select (arr!38624 a!3892) from!3270)))))

(assert (= (and d!137127 (not res!830158)) b!1244541))

(assert (= (and b!1244541 res!830156) b!1244537))

(assert (= (and b!1244541 res!830157) b!1244539))

(assert (= (and b!1244539 c!121875) b!1244540))

(assert (= (and b!1244539 (not c!121875)) b!1244538))

(assert (= (or b!1244540 b!1244538) bm!61413))

(assert (=> b!1244537 m!1146721))

(assert (=> b!1244537 m!1146721))

(declare-fun m!1146789 () Bool)

(assert (=> b!1244537 m!1146789))

(assert (=> bm!61413 m!1146721))

(declare-fun m!1146795 () Bool)

(assert (=> bm!61413 m!1146795))

(assert (=> b!1244539 m!1146721))

(assert (=> b!1244539 m!1146721))

(assert (=> b!1244539 m!1146733))

(assert (=> b!1244541 m!1146721))

(assert (=> b!1244541 m!1146721))

(assert (=> b!1244541 m!1146733))

(assert (=> b!1244447 d!137127))

(declare-fun d!137141 () Bool)

(declare-fun res!830172 () Bool)

(declare-fun e!705445 () Bool)

(assert (=> d!137141 (=> res!830172 e!705445)))

(assert (=> d!137141 (= res!830172 (is-Nil!27424 Nil!27424))))

(assert (=> d!137141 (= (noDuplicate!2005 Nil!27424) e!705445)))

(declare-fun b!1244561 () Bool)

(declare-fun e!705446 () Bool)

(assert (=> b!1244561 (= e!705445 e!705446)))

(declare-fun res!830173 () Bool)

(assert (=> b!1244561 (=> (not res!830173) (not e!705446))))

(assert (=> b!1244561 (= res!830173 (not (contains!7428 (t!40896 Nil!27424) (h!28632 Nil!27424))))))

(declare-fun b!1244562 () Bool)

(assert (=> b!1244562 (= e!705446 (noDuplicate!2005 (t!40896 Nil!27424)))))

(assert (= (and d!137141 (not res!830172)) b!1244561))

(assert (= (and b!1244561 res!830173) b!1244562))

(declare-fun m!1146813 () Bool)

(assert (=> b!1244561 m!1146813))

(declare-fun m!1146815 () Bool)

(assert (=> b!1244562 m!1146815))

(assert (=> b!1244445 d!137141))

(declare-fun d!137147 () Bool)

(assert (=> d!137147 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27424)))

(declare-fun lt!562775 () Unit!41378)

(declare-fun choose!80 (array!80062 List!27427 List!27427 (_ BitVec 32)) Unit!41378)

(assert (=> d!137147 (= lt!562775 (choose!80 a!3892 (Cons!27423 (select (arr!38624 a!3892) from!3270) Nil!27424) Nil!27424 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137147 (bvslt (size!39160 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137147 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27423 (select (arr!38624 a!3892) from!3270) Nil!27424) Nil!27424 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562775)))

(declare-fun bs!35042 () Bool)

(assert (= bs!35042 d!137147))

(assert (=> bs!35042 m!1146725))

(declare-fun m!1146819 () Bool)

(assert (=> bs!35042 m!1146819))

(assert (=> b!1244440 d!137147))

(declare-fun b!1244563 () Bool)

(declare-fun e!705449 () Bool)

(assert (=> b!1244563 (= e!705449 (contains!7428 Nil!27424 (select (arr!38624 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244564 () Bool)

(declare-fun e!705447 () Bool)

(declare-fun call!61420 () Bool)

(assert (=> b!1244564 (= e!705447 call!61420)))

(declare-fun d!137151 () Bool)

(declare-fun res!830176 () Bool)

(declare-fun e!705450 () Bool)

(assert (=> d!137151 (=> res!830176 e!705450)))

(assert (=> d!137151 (= res!830176 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39160 a!3892)))))

(assert (=> d!137151 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27424) e!705450)))

(declare-fun bm!61417 () Bool)

(declare-fun c!121879 () Bool)

(assert (=> bm!61417 (= call!61420 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121879 (Cons!27423 (select (arr!38624 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27424) Nil!27424)))))

(declare-fun b!1244565 () Bool)

(declare-fun e!705448 () Bool)

(assert (=> b!1244565 (= e!705448 e!705447)))

(assert (=> b!1244565 (= c!121879 (validKeyInArray!0 (select (arr!38624 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244566 () Bool)

(assert (=> b!1244566 (= e!705447 call!61420)))

(declare-fun b!1244567 () Bool)

(assert (=> b!1244567 (= e!705450 e!705448)))

(declare-fun res!830175 () Bool)

(assert (=> b!1244567 (=> (not res!830175) (not e!705448))))

(assert (=> b!1244567 (= res!830175 (not e!705449))))

(declare-fun res!830174 () Bool)

(assert (=> b!1244567 (=> (not res!830174) (not e!705449))))

(assert (=> b!1244567 (= res!830174 (validKeyInArray!0 (select (arr!38624 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137151 (not res!830176)) b!1244567))

(assert (= (and b!1244567 res!830174) b!1244563))

(assert (= (and b!1244567 res!830175) b!1244565))

(assert (= (and b!1244565 c!121879) b!1244566))

(assert (= (and b!1244565 (not c!121879)) b!1244564))

(assert (= (or b!1244566 b!1244564) bm!61417))

(declare-fun m!1146821 () Bool)

(assert (=> b!1244563 m!1146821))

(assert (=> b!1244563 m!1146821))

(declare-fun m!1146823 () Bool)

(assert (=> b!1244563 m!1146823))

(assert (=> bm!61417 m!1146821))

(declare-fun m!1146825 () Bool)

(assert (=> bm!61417 m!1146825))

(assert (=> b!1244565 m!1146821))

(assert (=> b!1244565 m!1146821))

(declare-fun m!1146827 () Bool)

(assert (=> b!1244565 m!1146827))

(assert (=> b!1244567 m!1146821))

(assert (=> b!1244567 m!1146821))

(assert (=> b!1244567 m!1146827))

(assert (=> b!1244440 d!137151))

(declare-fun b!1244573 () Bool)

(declare-fun e!705457 () Bool)

(assert (=> b!1244573 (= e!705457 (contains!7428 Nil!27424 (select (arr!38624 a!3892) newFrom!287)))))

(declare-fun b!1244574 () Bool)

(declare-fun e!705455 () Bool)

(declare-fun call!61422 () Bool)

(assert (=> b!1244574 (= e!705455 call!61422)))

(declare-fun d!137157 () Bool)

(declare-fun res!830182 () Bool)

(declare-fun e!705458 () Bool)

(assert (=> d!137157 (=> res!830182 e!705458)))

(assert (=> d!137157 (= res!830182 (bvsge newFrom!287 (size!39160 a!3892)))))

(assert (=> d!137157 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27424) e!705458)))

(declare-fun bm!61419 () Bool)

(declare-fun c!121881 () Bool)

(assert (=> bm!61419 (= call!61422 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121881 (Cons!27423 (select (arr!38624 a!3892) newFrom!287) Nil!27424) Nil!27424)))))

(declare-fun b!1244575 () Bool)

(declare-fun e!705456 () Bool)

(assert (=> b!1244575 (= e!705456 e!705455)))

(assert (=> b!1244575 (= c!121881 (validKeyInArray!0 (select (arr!38624 a!3892) newFrom!287)))))

(declare-fun b!1244576 () Bool)

(assert (=> b!1244576 (= e!705455 call!61422)))

(declare-fun b!1244577 () Bool)

(assert (=> b!1244577 (= e!705458 e!705456)))

(declare-fun res!830181 () Bool)

(assert (=> b!1244577 (=> (not res!830181) (not e!705456))))

(assert (=> b!1244577 (= res!830181 (not e!705457))))

(declare-fun res!830180 () Bool)

(assert (=> b!1244577 (=> (not res!830180) (not e!705457))))

(assert (=> b!1244577 (= res!830180 (validKeyInArray!0 (select (arr!38624 a!3892) newFrom!287)))))

(assert (= (and d!137157 (not res!830182)) b!1244577))

(assert (= (and b!1244577 res!830180) b!1244573))

(assert (= (and b!1244577 res!830181) b!1244575))

(assert (= (and b!1244575 c!121881) b!1244576))

(assert (= (and b!1244575 (not c!121881)) b!1244574))

(assert (= (or b!1244576 b!1244574) bm!61419))

(declare-fun m!1146837 () Bool)

(assert (=> b!1244573 m!1146837))

(assert (=> b!1244573 m!1146837))

(declare-fun m!1146839 () Bool)

(assert (=> b!1244573 m!1146839))

(assert (=> bm!61419 m!1146837))

(declare-fun m!1146841 () Bool)

(assert (=> bm!61419 m!1146841))

(assert (=> b!1244575 m!1146837))

(assert (=> b!1244575 m!1146837))

(declare-fun m!1146843 () Bool)

(assert (=> b!1244575 m!1146843))

(assert (=> b!1244577 m!1146837))

(assert (=> b!1244577 m!1146837))

(assert (=> b!1244577 m!1146843))

(assert (=> b!1244444 d!137157))

