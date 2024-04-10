; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117992 () Bool)

(assert start!117992)

(declare-fun b!1382114 () Bool)

(declare-fun res!923746 () Bool)

(declare-fun e!783389 () Bool)

(assert (=> b!1382114 (=> (not res!923746) (not e!783389))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94383 0))(
  ( (array!94384 (arr!45574 (Array (_ BitVec 32) (_ BitVec 64))) (size!46124 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94383)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382114 (= res!923746 (and (= (size!46124 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46124 a!2971))))))

(declare-fun b!1382115 () Bool)

(declare-fun res!923744 () Bool)

(assert (=> b!1382115 (=> (not res!923744) (not e!783389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382115 (= res!923744 (validKeyInArray!0 (select (arr!45574 a!2971) i!1094)))))

(declare-fun res!923742 () Bool)

(assert (=> start!117992 (=> (not res!923742) (not e!783389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117992 (= res!923742 (validMask!0 mask!3034))))

(assert (=> start!117992 e!783389))

(assert (=> start!117992 true))

(declare-fun array_inv!34602 (array!94383) Bool)

(assert (=> start!117992 (array_inv!34602 a!2971)))

(declare-fun b!1382116 () Bool)

(declare-fun res!923743 () Bool)

(assert (=> b!1382116 (=> (not res!923743) (not e!783389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94383 (_ BitVec 32)) Bool)

(assert (=> b!1382116 (= res!923743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382117 () Bool)

(assert (=> b!1382117 (= e!783389 (or (= (select (arr!45574 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!45574 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1382118 () Bool)

(declare-fun res!923745 () Bool)

(assert (=> b!1382118 (=> (not res!923745) (not e!783389))))

(declare-datatypes ((List!32108 0))(
  ( (Nil!32105) (Cons!32104 (h!33313 (_ BitVec 64)) (t!46802 List!32108)) )
))
(declare-fun arrayNoDuplicates!0 (array!94383 (_ BitVec 32) List!32108) Bool)

(assert (=> b!1382118 (= res!923745 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32105))))

(assert (= (and start!117992 res!923742) b!1382114))

(assert (= (and b!1382114 res!923746) b!1382115))

(assert (= (and b!1382115 res!923744) b!1382118))

(assert (= (and b!1382118 res!923745) b!1382116))

(assert (= (and b!1382116 res!923743) b!1382117))

(declare-fun m!1267287 () Bool)

(assert (=> b!1382117 m!1267287))

(declare-fun m!1267289 () Bool)

(assert (=> start!117992 m!1267289))

(declare-fun m!1267291 () Bool)

(assert (=> start!117992 m!1267291))

(declare-fun m!1267293 () Bool)

(assert (=> b!1382116 m!1267293))

(assert (=> b!1382115 m!1267287))

(assert (=> b!1382115 m!1267287))

(declare-fun m!1267295 () Bool)

(assert (=> b!1382115 m!1267295))

(declare-fun m!1267297 () Bool)

(assert (=> b!1382118 m!1267297))

(push 1)

(assert (not b!1382115))

(assert (not b!1382116))

(assert (not b!1382118))

(assert (not start!117992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149149 () Bool)

(assert (=> d!149149 (= (validKeyInArray!0 (select (arr!45574 a!2971) i!1094)) (and (not (= (select (arr!45574 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45574 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382115 d!149149))

(declare-fun b!1382154 () Bool)

(declare-fun e!783419 () Bool)

(declare-fun call!66526 () Bool)

(assert (=> b!1382154 (= e!783419 call!66526)))

(declare-fun bm!66523 () Bool)

(assert (=> bm!66523 (= call!66526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2971 mask!3034))))

(declare-fun d!149151 () Bool)

(declare-fun res!923767 () Bool)

(declare-fun e!783417 () Bool)

(assert (=> d!149151 (=> res!923767 e!783417)))

(assert (=> d!149151 (= res!923767 (bvsge #b00000000000000000000000000000000 (size!46124 a!2971)))))

(assert (=> d!149151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034) e!783417)))

(declare-fun b!1382155 () Bool)

(assert (=> b!1382155 (= e!783417 e!783419)))

(declare-fun c!128634 () Bool)

(assert (=> b!1382155 (= c!128634 (validKeyInArray!0 (select (arr!45574 a!2971) #b00000000000000000000000000000000)))))

(declare-fun b!1382156 () Bool)

(declare-fun e!783418 () Bool)

(assert (=> b!1382156 (= e!783419 e!783418)))

(declare-fun lt!608358 () (_ BitVec 64))

(assert (=> b!1382156 (= lt!608358 (select (arr!45574 a!2971) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46051 0))(
  ( (Unit!46052) )
))
(declare-fun lt!608357 () Unit!46051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94383 (_ BitVec 64) (_ BitVec 32)) Unit!46051)

(assert (=> b!1382156 (= lt!608357 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2971 lt!608358 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1382156 (arrayContainsKey!0 a!2971 lt!608358 #b00000000000000000000000000000000)))

(declare-fun lt!608356 () Unit!46051)

(assert (=> b!1382156 (= lt!608356 lt!608357)))

(declare-fun res!923766 () Bool)

(declare-datatypes ((SeekEntryResult!10063 0))(
  ( (MissingZero!10063 (index!42623 (_ BitVec 32))) (Found!10063 (index!42624 (_ BitVec 32))) (Intermediate!10063 (undefined!10875 Bool) (index!42625 (_ BitVec 32)) (x!123880 (_ BitVec 32))) (Undefined!10063) (MissingVacant!10063 (index!42626 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94383 (_ BitVec 32)) SeekEntryResult!10063)

(assert (=> b!1382156 (= res!923766 (= (seekEntryOrOpen!0 (select (arr!45574 a!2971) #b00000000000000000000000000000000) a!2971 mask!3034) (Found!10063 #b00000000000000000000000000000000)))))

(assert (=> b!1382156 (=> (not res!923766) (not e!783418))))

(declare-fun b!1382157 () Bool)

(assert (=> b!1382157 (= e!783418 call!66526)))

(assert (= (and d!149151 (not res!923767)) b!1382155))

(assert (= (and b!1382155 c!128634) b!1382156))

(assert (= (and b!1382155 (not c!128634)) b!1382154))

(assert (= (and b!1382156 res!923766) b!1382157))

(assert (= (or b!1382157 b!1382154) bm!66523))

(declare-fun m!1267319 () Bool)

(assert (=> bm!66523 m!1267319))

(declare-fun m!1267321 () Bool)

(assert (=> b!1382155 m!1267321))

(assert (=> b!1382155 m!1267321))

(declare-fun m!1267323 () Bool)

(assert (=> b!1382155 m!1267323))

