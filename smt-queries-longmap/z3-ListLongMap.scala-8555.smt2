; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104454 () Bool)

(assert start!104454)

(declare-fun b!1246509 () Bool)

(declare-fun e!706962 () Bool)

(declare-fun e!706961 () Bool)

(assert (=> b!1246509 (= e!706962 e!706961)))

(declare-fun res!831841 () Bool)

(assert (=> b!1246509 (=> (not res!831841) (not e!706961))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246509 (= res!831841 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41283 0))(
  ( (Unit!41284) )
))
(declare-fun lt!562962 () Unit!41283)

(declare-fun e!706964 () Unit!41283)

(assert (=> b!1246509 (= lt!562962 e!706964)))

(declare-fun c!122022 () Bool)

(declare-datatypes ((array!80171 0))(
  ( (array!80172 (arr!38663 (Array (_ BitVec 32) (_ BitVec 64))) (size!39201 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80171)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246509 (= c!122022 (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)))))

(declare-fun b!1246510 () Bool)

(declare-fun res!831840 () Bool)

(assert (=> b!1246510 (=> (not res!831840) (not e!706962))))

(assert (=> b!1246510 (= res!831840 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39201 a!3892)) (not (= newFrom!287 (size!39201 a!3892)))))))

(declare-fun b!1246511 () Bool)

(declare-datatypes ((List!27567 0))(
  ( (Nil!27564) (Cons!27563 (h!28772 (_ BitVec 64)) (t!41027 List!27567)) )
))
(declare-fun arrayNoDuplicates!0 (array!80171 (_ BitVec 32) List!27567) Bool)

(assert (=> b!1246511 (= e!706961 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27564)))))

(declare-fun b!1246513 () Bool)

(declare-fun Unit!41285 () Unit!41283)

(assert (=> b!1246513 (= e!706964 Unit!41285)))

(declare-fun b!1246514 () Bool)

(declare-fun lt!562963 () Unit!41283)

(assert (=> b!1246514 (= e!706964 lt!562963)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80171 List!27567 List!27567 (_ BitVec 32)) Unit!41283)

(assert (=> b!1246514 (= lt!562963 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27563 (select (arr!38663 a!3892) from!3270) Nil!27564) Nil!27564 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246514 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27564)))

(declare-fun b!1246512 () Bool)

(declare-fun res!831842 () Bool)

(assert (=> b!1246512 (=> (not res!831842) (not e!706962))))

(assert (=> b!1246512 (= res!831842 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27564))))

(declare-fun res!831843 () Bool)

(assert (=> start!104454 (=> (not res!831843) (not e!706962))))

(assert (=> start!104454 (= res!831843 (and (bvslt (size!39201 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39201 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39201 a!3892))))))

(assert (=> start!104454 e!706962))

(declare-fun array_inv!29646 (array!80171) Bool)

(assert (=> start!104454 (array_inv!29646 a!3892)))

(assert (=> start!104454 true))

(assert (= (and start!104454 res!831843) b!1246512))

(assert (= (and b!1246512 res!831842) b!1246510))

(assert (= (and b!1246510 res!831840) b!1246509))

(assert (= (and b!1246509 c!122022) b!1246514))

(assert (= (and b!1246509 (not c!122022)) b!1246513))

(assert (= (and b!1246509 res!831841) b!1246511))

(declare-fun m!1147873 () Bool)

(assert (=> b!1246509 m!1147873))

(assert (=> b!1246509 m!1147873))

(declare-fun m!1147875 () Bool)

(assert (=> b!1246509 m!1147875))

(declare-fun m!1147877 () Bool)

(assert (=> b!1246512 m!1147877))

(declare-fun m!1147879 () Bool)

(assert (=> b!1246511 m!1147879))

(declare-fun m!1147881 () Bool)

(assert (=> start!104454 m!1147881))

(assert (=> b!1246514 m!1147873))

(declare-fun m!1147883 () Bool)

(assert (=> b!1246514 m!1147883))

(assert (=> b!1246514 m!1147879))

(check-sat (not b!1246514) (not start!104454) (not b!1246509) (not b!1246511) (not b!1246512))
(check-sat)
(get-model)

(declare-fun d!137523 () Bool)

(assert (=> d!137523 (= (array_inv!29646 a!3892) (bvsge (size!39201 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104454 d!137523))

(declare-fun d!137525 () Bool)

(declare-fun res!831884 () Bool)

(declare-fun e!707009 () Bool)

(assert (=> d!137525 (=> res!831884 e!707009)))

(assert (=> d!137525 (= res!831884 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39201 a!3892)))))

(assert (=> d!137525 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27564) e!707009)))

(declare-fun bm!61511 () Bool)

(declare-fun c!122034 () Bool)

(declare-fun call!61514 () Bool)

(assert (=> bm!61511 (= call!61514 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122034 (Cons!27563 (select (arr!38663 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27564) Nil!27564)))))

(declare-fun b!1246576 () Bool)

(declare-fun e!707011 () Bool)

(declare-fun contains!7431 (List!27567 (_ BitVec 64)) Bool)

(assert (=> b!1246576 (= e!707011 (contains!7431 Nil!27564 (select (arr!38663 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246577 () Bool)

(declare-fun e!707012 () Bool)

(assert (=> b!1246577 (= e!707012 call!61514)))

(declare-fun b!1246578 () Bool)

(declare-fun e!707010 () Bool)

(assert (=> b!1246578 (= e!707009 e!707010)))

(declare-fun res!831883 () Bool)

(assert (=> b!1246578 (=> (not res!831883) (not e!707010))))

(assert (=> b!1246578 (= res!831883 (not e!707011))))

(declare-fun res!831885 () Bool)

(assert (=> b!1246578 (=> (not res!831885) (not e!707011))))

(assert (=> b!1246578 (= res!831885 (validKeyInArray!0 (select (arr!38663 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246579 () Bool)

(assert (=> b!1246579 (= e!707010 e!707012)))

(assert (=> b!1246579 (= c!122034 (validKeyInArray!0 (select (arr!38663 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246580 () Bool)

(assert (=> b!1246580 (= e!707012 call!61514)))

(assert (= (and d!137525 (not res!831884)) b!1246578))

(assert (= (and b!1246578 res!831885) b!1246576))

(assert (= (and b!1246578 res!831883) b!1246579))

(assert (= (and b!1246579 c!122034) b!1246577))

(assert (= (and b!1246579 (not c!122034)) b!1246580))

(assert (= (or b!1246577 b!1246580) bm!61511))

(declare-fun m!1147913 () Bool)

(assert (=> bm!61511 m!1147913))

(declare-fun m!1147915 () Bool)

(assert (=> bm!61511 m!1147915))

(assert (=> b!1246576 m!1147913))

(assert (=> b!1246576 m!1147913))

(declare-fun m!1147917 () Bool)

(assert (=> b!1246576 m!1147917))

(assert (=> b!1246578 m!1147913))

(assert (=> b!1246578 m!1147913))

(declare-fun m!1147919 () Bool)

(assert (=> b!1246578 m!1147919))

(assert (=> b!1246579 m!1147913))

(assert (=> b!1246579 m!1147913))

(assert (=> b!1246579 m!1147919))

(assert (=> b!1246511 d!137525))

(declare-fun d!137529 () Bool)

(declare-fun res!831887 () Bool)

(declare-fun e!707013 () Bool)

(assert (=> d!137529 (=> res!831887 e!707013)))

(assert (=> d!137529 (= res!831887 (bvsge from!3270 (size!39201 a!3892)))))

(assert (=> d!137529 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27564) e!707013)))

(declare-fun c!122035 () Bool)

(declare-fun bm!61512 () Bool)

(declare-fun call!61515 () Bool)

(assert (=> bm!61512 (= call!61515 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122035 (Cons!27563 (select (arr!38663 a!3892) from!3270) Nil!27564) Nil!27564)))))

(declare-fun b!1246581 () Bool)

(declare-fun e!707015 () Bool)

(assert (=> b!1246581 (= e!707015 (contains!7431 Nil!27564 (select (arr!38663 a!3892) from!3270)))))

(declare-fun b!1246582 () Bool)

(declare-fun e!707016 () Bool)

(assert (=> b!1246582 (= e!707016 call!61515)))

(declare-fun b!1246583 () Bool)

(declare-fun e!707014 () Bool)

(assert (=> b!1246583 (= e!707013 e!707014)))

(declare-fun res!831886 () Bool)

(assert (=> b!1246583 (=> (not res!831886) (not e!707014))))

(assert (=> b!1246583 (= res!831886 (not e!707015))))

(declare-fun res!831888 () Bool)

(assert (=> b!1246583 (=> (not res!831888) (not e!707015))))

(assert (=> b!1246583 (= res!831888 (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)))))

(declare-fun b!1246584 () Bool)

(assert (=> b!1246584 (= e!707014 e!707016)))

(assert (=> b!1246584 (= c!122035 (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)))))

(declare-fun b!1246585 () Bool)

(assert (=> b!1246585 (= e!707016 call!61515)))

(assert (= (and d!137529 (not res!831887)) b!1246583))

(assert (= (and b!1246583 res!831888) b!1246581))

(assert (= (and b!1246583 res!831886) b!1246584))

(assert (= (and b!1246584 c!122035) b!1246582))

(assert (= (and b!1246584 (not c!122035)) b!1246585))

(assert (= (or b!1246582 b!1246585) bm!61512))

(assert (=> bm!61512 m!1147873))

(declare-fun m!1147921 () Bool)

(assert (=> bm!61512 m!1147921))

(assert (=> b!1246581 m!1147873))

(assert (=> b!1246581 m!1147873))

(declare-fun m!1147923 () Bool)

(assert (=> b!1246581 m!1147923))

(assert (=> b!1246583 m!1147873))

(assert (=> b!1246583 m!1147873))

(assert (=> b!1246583 m!1147875))

(assert (=> b!1246584 m!1147873))

(assert (=> b!1246584 m!1147873))

(assert (=> b!1246584 m!1147875))

(assert (=> b!1246512 d!137529))

(declare-fun d!137533 () Bool)

(assert (=> d!137533 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27564)))

(declare-fun lt!562980 () Unit!41283)

(declare-fun choose!80 (array!80171 List!27567 List!27567 (_ BitVec 32)) Unit!41283)

(assert (=> d!137533 (= lt!562980 (choose!80 a!3892 (Cons!27563 (select (arr!38663 a!3892) from!3270) Nil!27564) Nil!27564 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137533 (bvslt (size!39201 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137533 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27563 (select (arr!38663 a!3892) from!3270) Nil!27564) Nil!27564 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562980)))

(declare-fun bs!35102 () Bool)

(assert (= bs!35102 d!137533))

(assert (=> bs!35102 m!1147879))

(declare-fun m!1147927 () Bool)

(assert (=> bs!35102 m!1147927))

(assert (=> b!1246514 d!137533))

(assert (=> b!1246514 d!137525))

(declare-fun d!137541 () Bool)

(assert (=> d!137541 (= (validKeyInArray!0 (select (arr!38663 a!3892) from!3270)) (and (not (= (select (arr!38663 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38663 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246509 d!137541))

(check-sat (not b!1246579) (not b!1246576) (not bm!61511) (not b!1246584) (not b!1246583) (not d!137533) (not b!1246578) (not bm!61512) (not b!1246581))
(check-sat)
