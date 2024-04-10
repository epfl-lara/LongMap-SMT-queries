; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114052 () Bool)

(assert start!114052)

(declare-fun b!1353802 () Bool)

(declare-fun res!898953 () Bool)

(declare-fun e!769238 () Bool)

(assert (=> b!1353802 (=> (not res!898953) (not e!769238))))

(declare-datatypes ((List!31606 0))(
  ( (Nil!31603) (Cons!31602 (h!32811 (_ BitVec 64)) (t!46264 List!31606)) )
))
(declare-fun acc!759 () List!31606)

(declare-fun contains!9315 (List!31606 (_ BitVec 64)) Bool)

(assert (=> b!1353802 (= res!898953 (not (contains!9315 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353803 () Bool)

(declare-fun res!898945 () Bool)

(assert (=> b!1353803 (=> (not res!898945) (not e!769238))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353803 (= res!898945 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353804 () Bool)

(declare-datatypes ((Unit!44436 0))(
  ( (Unit!44437) )
))
(declare-fun e!769239 () Unit!44436)

(declare-fun lt!598014 () Unit!44436)

(assert (=> b!1353804 (= e!769239 lt!598014)))

(declare-fun lt!598017 () Unit!44436)

(declare-fun lemmaListSubSeqRefl!0 (List!31606) Unit!44436)

(assert (=> b!1353804 (= lt!598017 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!735 (List!31606 List!31606) Bool)

(assert (=> b!1353804 (subseq!735 acc!759 acc!759)))

(declare-datatypes ((array!92234 0))(
  ( (array!92235 (arr!44565 (Array (_ BitVec 32) (_ BitVec 64))) (size!45115 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92234)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92234 List!31606 List!31606 (_ BitVec 32)) Unit!44436)

(declare-fun $colon$colon!750 (List!31606 (_ BitVec 64)) List!31606)

(assert (=> b!1353804 (= lt!598014 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!750 acc!759 (select (arr!44565 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92234 (_ BitVec 32) List!31606) Bool)

(assert (=> b!1353804 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353805 () Bool)

(declare-fun res!898948 () Bool)

(assert (=> b!1353805 (=> (not res!898948) (not e!769238))))

(assert (=> b!1353805 (= res!898948 (not (contains!9315 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353806 () Bool)

(declare-fun res!898944 () Bool)

(assert (=> b!1353806 (=> (not res!898944) (not e!769238))))

(assert (=> b!1353806 (= res!898944 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353807 () Bool)

(declare-fun res!898957 () Bool)

(assert (=> b!1353807 (=> (not res!898957) (not e!769238))))

(assert (=> b!1353807 (= res!898957 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45115 a!3742)))))

(declare-fun b!1353808 () Bool)

(declare-fun e!769240 () Bool)

(declare-fun e!769236 () Bool)

(assert (=> b!1353808 (= e!769240 e!769236)))

(declare-fun res!898950 () Bool)

(assert (=> b!1353808 (=> (not res!898950) (not e!769236))))

(assert (=> b!1353808 (= res!898950 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!598015 () List!31606)

(assert (=> b!1353808 (= lt!598015 ($colon$colon!750 acc!759 (select (arr!44565 a!3742) from!3120)))))

(declare-fun b!1353809 () Bool)

(declare-fun Unit!44438 () Unit!44436)

(assert (=> b!1353809 (= e!769239 Unit!44438)))

(declare-fun res!898951 () Bool)

(assert (=> start!114052 (=> (not res!898951) (not e!769238))))

(assert (=> start!114052 (= res!898951 (and (bvslt (size!45115 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45115 a!3742))))))

(assert (=> start!114052 e!769238))

(assert (=> start!114052 true))

(declare-fun array_inv!33593 (array!92234) Bool)

(assert (=> start!114052 (array_inv!33593 a!3742)))

(declare-fun b!1353810 () Bool)

(declare-fun res!898952 () Bool)

(assert (=> b!1353810 (=> (not res!898952) (not e!769238))))

(assert (=> b!1353810 (= res!898952 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31603))))

(declare-fun b!1353811 () Bool)

(declare-fun res!898954 () Bool)

(assert (=> b!1353811 (=> (not res!898954) (not e!769236))))

(assert (=> b!1353811 (= res!898954 (not (contains!9315 lt!598015 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353812 () Bool)

(declare-fun res!898946 () Bool)

(assert (=> b!1353812 (=> (not res!898946) (not e!769238))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353812 (= res!898946 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45115 a!3742))))))

(declare-fun b!1353813 () Bool)

(declare-fun res!898947 () Bool)

(assert (=> b!1353813 (=> (not res!898947) (not e!769238))))

(declare-fun noDuplicate!2172 (List!31606) Bool)

(assert (=> b!1353813 (= res!898947 (noDuplicate!2172 acc!759))))

(declare-fun b!1353814 () Bool)

(declare-fun res!898955 () Bool)

(assert (=> b!1353814 (=> (not res!898955) (not e!769236))))

(assert (=> b!1353814 (= res!898955 (not (contains!9315 lt!598015 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353815 () Bool)

(assert (=> b!1353815 (= e!769236 false)))

(declare-fun lt!598018 () Bool)

(assert (=> b!1353815 (= lt!598018 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598015))))

(declare-fun b!1353816 () Bool)

(declare-fun res!898956 () Bool)

(assert (=> b!1353816 (=> (not res!898956) (not e!769236))))

(assert (=> b!1353816 (= res!898956 (noDuplicate!2172 lt!598015))))

(declare-fun b!1353817 () Bool)

(assert (=> b!1353817 (= e!769238 e!769240)))

(declare-fun res!898949 () Bool)

(assert (=> b!1353817 (=> (not res!898949) (not e!769240))))

(declare-fun lt!598016 () Bool)

(assert (=> b!1353817 (= res!898949 (and (not (= from!3120 i!1404)) lt!598016))))

(declare-fun lt!598013 () Unit!44436)

(assert (=> b!1353817 (= lt!598013 e!769239)))

(declare-fun c!126869 () Bool)

(assert (=> b!1353817 (= c!126869 lt!598016)))

(assert (=> b!1353817 (= lt!598016 (validKeyInArray!0 (select (arr!44565 a!3742) from!3120)))))

(assert (= (and start!114052 res!898951) b!1353813))

(assert (= (and b!1353813 res!898947) b!1353805))

(assert (= (and b!1353805 res!898948) b!1353802))

(assert (= (and b!1353802 res!898953) b!1353810))

(assert (= (and b!1353810 res!898952) b!1353806))

(assert (= (and b!1353806 res!898944) b!1353812))

(assert (= (and b!1353812 res!898946) b!1353803))

(assert (= (and b!1353803 res!898945) b!1353807))

(assert (= (and b!1353807 res!898957) b!1353817))

(assert (= (and b!1353817 c!126869) b!1353804))

(assert (= (and b!1353817 (not c!126869)) b!1353809))

(assert (= (and b!1353817 res!898949) b!1353808))

(assert (= (and b!1353808 res!898950) b!1353816))

(assert (= (and b!1353816 res!898956) b!1353811))

(assert (= (and b!1353811 res!898954) b!1353814))

(assert (= (and b!1353814 res!898955) b!1353815))

(declare-fun m!1240333 () Bool)

(assert (=> b!1353803 m!1240333))

(declare-fun m!1240335 () Bool)

(assert (=> b!1353816 m!1240335))

(declare-fun m!1240337 () Bool)

(assert (=> b!1353817 m!1240337))

(assert (=> b!1353817 m!1240337))

(declare-fun m!1240339 () Bool)

(assert (=> b!1353817 m!1240339))

(declare-fun m!1240341 () Bool)

(assert (=> b!1353813 m!1240341))

(declare-fun m!1240343 () Bool)

(assert (=> b!1353804 m!1240343))

(assert (=> b!1353804 m!1240337))

(declare-fun m!1240345 () Bool)

(assert (=> b!1353804 m!1240345))

(declare-fun m!1240347 () Bool)

(assert (=> b!1353804 m!1240347))

(declare-fun m!1240349 () Bool)

(assert (=> b!1353804 m!1240349))

(assert (=> b!1353804 m!1240337))

(assert (=> b!1353804 m!1240345))

(declare-fun m!1240351 () Bool)

(assert (=> b!1353804 m!1240351))

(declare-fun m!1240353 () Bool)

(assert (=> b!1353811 m!1240353))

(declare-fun m!1240355 () Bool)

(assert (=> b!1353814 m!1240355))

(declare-fun m!1240357 () Bool)

(assert (=> b!1353806 m!1240357))

(declare-fun m!1240359 () Bool)

(assert (=> b!1353810 m!1240359))

(declare-fun m!1240361 () Bool)

(assert (=> b!1353805 m!1240361))

(declare-fun m!1240363 () Bool)

(assert (=> start!114052 m!1240363))

(declare-fun m!1240365 () Bool)

(assert (=> b!1353802 m!1240365))

(assert (=> b!1353808 m!1240337))

(assert (=> b!1353808 m!1240337))

(assert (=> b!1353808 m!1240345))

(declare-fun m!1240367 () Bool)

(assert (=> b!1353815 m!1240367))

(check-sat (not b!1353816) (not b!1353817) (not start!114052) (not b!1353814) (not b!1353803) (not b!1353805) (not b!1353810) (not b!1353806) (not b!1353813) (not b!1353802) (not b!1353804) (not b!1353808) (not b!1353811) (not b!1353815))
(check-sat)
