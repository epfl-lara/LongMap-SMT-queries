; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120338 () Bool)

(assert start!120338)

(declare-fun b!1400585 () Bool)

(declare-fun res!939102 () Bool)

(declare-fun e!792994 () Bool)

(assert (=> b!1400585 (=> (not res!939102) (not e!792994))))

(declare-datatypes ((array!95747 0))(
  ( (array!95748 (arr!46224 (Array (_ BitVec 32) (_ BitVec 64))) (size!46774 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95747)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95747 (_ BitVec 32)) Bool)

(assert (=> b!1400585 (= res!939102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400587 () Bool)

(declare-fun e!792989 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10541 0))(
  ( (MissingZero!10541 (index!44541 (_ BitVec 32))) (Found!10541 (index!44542 (_ BitVec 32))) (Intermediate!10541 (undefined!11353 Bool) (index!44543 (_ BitVec 32)) (x!126184 (_ BitVec 32))) (Undefined!10541) (MissingVacant!10541 (index!44544 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95747 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1400587 (= e!792989 (= (seekEntryOrOpen!0 (select (arr!46224 a!2901) j!112) a!2901 mask!2840) (Found!10541 j!112)))))

(declare-fun b!1400588 () Bool)

(declare-fun e!792990 () Bool)

(assert (=> b!1400588 (= e!792990 true)))

(declare-fun lt!616310 () SeekEntryResult!10541)

(declare-fun lt!616314 () array!95747)

(declare-fun lt!616315 () (_ BitVec 64))

(declare-fun lt!616317 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95747 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1400588 (= lt!616310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616317 lt!616315 lt!616314 mask!2840))))

(declare-fun e!792991 () Bool)

(declare-fun b!1400589 () Bool)

(declare-fun lt!616311 () SeekEntryResult!10541)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95747 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1400589 (= e!792991 (= (seekEntryOrOpen!0 lt!616315 lt!616314 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126184 lt!616311) (index!44543 lt!616311) (index!44543 lt!616311) (select (arr!46224 a!2901) j!112) lt!616314 mask!2840)))))

(declare-fun b!1400590 () Bool)

(declare-fun res!939100 () Bool)

(assert (=> b!1400590 (=> (not res!939100) (not e!792994))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400590 (= res!939100 (validKeyInArray!0 (select (arr!46224 a!2901) i!1037)))))

(declare-fun b!1400591 () Bool)

(declare-fun res!939101 () Bool)

(assert (=> b!1400591 (=> (not res!939101) (not e!792994))))

(assert (=> b!1400591 (= res!939101 (and (= (size!46774 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46774 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46774 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400592 () Bool)

(declare-fun res!939103 () Bool)

(assert (=> b!1400592 (=> (not res!939103) (not e!792994))))

(declare-datatypes ((List!32743 0))(
  ( (Nil!32740) (Cons!32739 (h!33987 (_ BitVec 64)) (t!47437 List!32743)) )
))
(declare-fun arrayNoDuplicates!0 (array!95747 (_ BitVec 32) List!32743) Bool)

(assert (=> b!1400592 (= res!939103 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32740))))

(declare-fun b!1400593 () Bool)

(declare-fun e!792993 () Bool)

(assert (=> b!1400593 (= e!792994 (not e!792993))))

(declare-fun res!939099 () Bool)

(assert (=> b!1400593 (=> res!939099 e!792993)))

(declare-fun lt!616313 () SeekEntryResult!10541)

(get-info :version)

(assert (=> b!1400593 (= res!939099 (or (not ((_ is Intermediate!10541) lt!616313)) (undefined!11353 lt!616313)))))

(assert (=> b!1400593 e!792989))

(declare-fun res!939105 () Bool)

(assert (=> b!1400593 (=> (not res!939105) (not e!792989))))

(assert (=> b!1400593 (= res!939105 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47086 0))(
  ( (Unit!47087) )
))
(declare-fun lt!616312 () Unit!47086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47086)

(assert (=> b!1400593 (= lt!616312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400593 (= lt!616313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616317 (select (arr!46224 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400593 (= lt!616317 (toIndex!0 (select (arr!46224 a!2901) j!112) mask!2840))))

(declare-fun b!1400594 () Bool)

(declare-fun e!792995 () Bool)

(assert (=> b!1400594 (= e!792993 e!792995)))

(declare-fun res!939106 () Bool)

(assert (=> b!1400594 (=> res!939106 e!792995)))

(assert (=> b!1400594 (= res!939106 (or (= lt!616313 lt!616311) (not ((_ is Intermediate!10541) lt!616311))))))

(assert (=> b!1400594 (= lt!616311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616315 mask!2840) lt!616315 lt!616314 mask!2840))))

(assert (=> b!1400594 (= lt!616315 (select (store (arr!46224 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400594 (= lt!616314 (array!95748 (store (arr!46224 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46774 a!2901)))))

(declare-fun b!1400595 () Bool)

(assert (=> b!1400595 (= e!792995 e!792990)))

(declare-fun res!939098 () Bool)

(assert (=> b!1400595 (=> res!939098 e!792990)))

(assert (=> b!1400595 (= res!939098 (or (bvslt (x!126184 lt!616313) #b00000000000000000000000000000000) (bvsgt (x!126184 lt!616313) #b01111111111111111111111111111110) (bvslt (x!126184 lt!616311) #b00000000000000000000000000000000) (bvsgt (x!126184 lt!616311) #b01111111111111111111111111111110) (bvslt lt!616317 #b00000000000000000000000000000000) (bvsge lt!616317 (size!46774 a!2901)) (bvslt (index!44543 lt!616313) #b00000000000000000000000000000000) (bvsge (index!44543 lt!616313) (size!46774 a!2901)) (bvslt (index!44543 lt!616311) #b00000000000000000000000000000000) (bvsge (index!44543 lt!616311) (size!46774 a!2901)) (not (= lt!616313 (Intermediate!10541 false (index!44543 lt!616313) (x!126184 lt!616313)))) (not (= lt!616311 (Intermediate!10541 false (index!44543 lt!616311) (x!126184 lt!616311))))))))

(assert (=> b!1400595 e!792991))

(declare-fun res!939104 () Bool)

(assert (=> b!1400595 (=> (not res!939104) (not e!792991))))

(assert (=> b!1400595 (= res!939104 (and (not (undefined!11353 lt!616311)) (= (index!44543 lt!616311) i!1037) (bvslt (x!126184 lt!616311) (x!126184 lt!616313)) (= (select (store (arr!46224 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44543 lt!616311)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616316 () Unit!47086)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47086)

(assert (=> b!1400595 (= lt!616316 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616317 (x!126184 lt!616313) (index!44543 lt!616313) (x!126184 lt!616311) (index!44543 lt!616311) (undefined!11353 lt!616311) mask!2840))))

(declare-fun res!939097 () Bool)

(assert (=> start!120338 (=> (not res!939097) (not e!792994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120338 (= res!939097 (validMask!0 mask!2840))))

(assert (=> start!120338 e!792994))

(assert (=> start!120338 true))

(declare-fun array_inv!35252 (array!95747) Bool)

(assert (=> start!120338 (array_inv!35252 a!2901)))

(declare-fun b!1400586 () Bool)

(declare-fun res!939096 () Bool)

(assert (=> b!1400586 (=> (not res!939096) (not e!792994))))

(assert (=> b!1400586 (= res!939096 (validKeyInArray!0 (select (arr!46224 a!2901) j!112)))))

(assert (= (and start!120338 res!939097) b!1400591))

(assert (= (and b!1400591 res!939101) b!1400590))

(assert (= (and b!1400590 res!939100) b!1400586))

(assert (= (and b!1400586 res!939096) b!1400585))

(assert (= (and b!1400585 res!939102) b!1400592))

(assert (= (and b!1400592 res!939103) b!1400593))

(assert (= (and b!1400593 res!939105) b!1400587))

(assert (= (and b!1400593 (not res!939099)) b!1400594))

(assert (= (and b!1400594 (not res!939106)) b!1400595))

(assert (= (and b!1400595 res!939104) b!1400589))

(assert (= (and b!1400595 (not res!939098)) b!1400588))

(declare-fun m!1288085 () Bool)

(assert (=> b!1400590 m!1288085))

(assert (=> b!1400590 m!1288085))

(declare-fun m!1288087 () Bool)

(assert (=> b!1400590 m!1288087))

(declare-fun m!1288089 () Bool)

(assert (=> start!120338 m!1288089))

(declare-fun m!1288091 () Bool)

(assert (=> start!120338 m!1288091))

(declare-fun m!1288093 () Bool)

(assert (=> b!1400585 m!1288093))

(declare-fun m!1288095 () Bool)

(assert (=> b!1400588 m!1288095))

(declare-fun m!1288097 () Bool)

(assert (=> b!1400586 m!1288097))

(assert (=> b!1400586 m!1288097))

(declare-fun m!1288099 () Bool)

(assert (=> b!1400586 m!1288099))

(declare-fun m!1288101 () Bool)

(assert (=> b!1400589 m!1288101))

(assert (=> b!1400589 m!1288097))

(assert (=> b!1400589 m!1288097))

(declare-fun m!1288103 () Bool)

(assert (=> b!1400589 m!1288103))

(declare-fun m!1288105 () Bool)

(assert (=> b!1400595 m!1288105))

(declare-fun m!1288107 () Bool)

(assert (=> b!1400595 m!1288107))

(declare-fun m!1288109 () Bool)

(assert (=> b!1400595 m!1288109))

(declare-fun m!1288111 () Bool)

(assert (=> b!1400592 m!1288111))

(assert (=> b!1400593 m!1288097))

(declare-fun m!1288113 () Bool)

(assert (=> b!1400593 m!1288113))

(assert (=> b!1400593 m!1288097))

(declare-fun m!1288115 () Bool)

(assert (=> b!1400593 m!1288115))

(assert (=> b!1400593 m!1288097))

(declare-fun m!1288117 () Bool)

(assert (=> b!1400593 m!1288117))

(declare-fun m!1288119 () Bool)

(assert (=> b!1400593 m!1288119))

(assert (=> b!1400587 m!1288097))

(assert (=> b!1400587 m!1288097))

(declare-fun m!1288121 () Bool)

(assert (=> b!1400587 m!1288121))

(declare-fun m!1288123 () Bool)

(assert (=> b!1400594 m!1288123))

(assert (=> b!1400594 m!1288123))

(declare-fun m!1288125 () Bool)

(assert (=> b!1400594 m!1288125))

(assert (=> b!1400594 m!1288105))

(declare-fun m!1288127 () Bool)

(assert (=> b!1400594 m!1288127))

(check-sat (not b!1400595) (not b!1400592) (not b!1400585) (not b!1400593) (not b!1400588) (not b!1400586) (not start!120338) (not b!1400587) (not b!1400594) (not b!1400589) (not b!1400590))
(check-sat)
