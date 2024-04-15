; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120086 () Bool)

(assert start!120086)

(declare-fun b!1398094 () Bool)

(declare-fun res!937060 () Bool)

(declare-fun e!791502 () Bool)

(assert (=> b!1398094 (=> (not res!937060) (not e!791502))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95568 0))(
  ( (array!95569 (arr!46138 (Array (_ BitVec 32) (_ BitVec 64))) (size!46690 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95568)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398094 (= res!937060 (and (= (size!46690 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46690 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46690 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937065 () Bool)

(assert (=> start!120086 (=> (not res!937065) (not e!791502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120086 (= res!937065 (validMask!0 mask!2840))))

(assert (=> start!120086 e!791502))

(assert (=> start!120086 true))

(declare-fun array_inv!35371 (array!95568) Bool)

(assert (=> start!120086 (array_inv!35371 a!2901)))

(declare-fun b!1398095 () Bool)

(declare-fun e!791500 () Bool)

(declare-fun e!791503 () Bool)

(assert (=> b!1398095 (= e!791500 e!791503)))

(declare-fun res!937063 () Bool)

(assert (=> b!1398095 (=> res!937063 e!791503)))

(declare-datatypes ((SeekEntryResult!10481 0))(
  ( (MissingZero!10481 (index!44295 (_ BitVec 32))) (Found!10481 (index!44296 (_ BitVec 32))) (Intermediate!10481 (undefined!11293 Bool) (index!44297 (_ BitVec 32)) (x!125940 (_ BitVec 32))) (Undefined!10481) (MissingVacant!10481 (index!44298 (_ BitVec 32))) )
))
(declare-fun lt!614569 () SeekEntryResult!10481)

(declare-fun lt!614567 () SeekEntryResult!10481)

(get-info :version)

(assert (=> b!1398095 (= res!937063 (or (= lt!614569 lt!614567) (not ((_ is Intermediate!10481) lt!614567))))))

(declare-fun lt!614566 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95568 (_ BitVec 32)) SeekEntryResult!10481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398095 (= lt!614567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614566 mask!2840) lt!614566 (array!95569 (store (arr!46138 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46690 a!2901)) mask!2840))))

(assert (=> b!1398095 (= lt!614566 (select (store (arr!46138 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398096 () Bool)

(declare-fun e!791501 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95568 (_ BitVec 32)) SeekEntryResult!10481)

(assert (=> b!1398096 (= e!791501 (= (seekEntryOrOpen!0 (select (arr!46138 a!2901) j!112) a!2901 mask!2840) (Found!10481 j!112)))))

(declare-fun b!1398097 () Bool)

(declare-fun res!937059 () Bool)

(assert (=> b!1398097 (=> (not res!937059) (not e!791502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398097 (= res!937059 (validKeyInArray!0 (select (arr!46138 a!2901) i!1037)))))

(declare-fun b!1398098 () Bool)

(declare-fun res!937058 () Bool)

(assert (=> b!1398098 (=> (not res!937058) (not e!791502))))

(declare-datatypes ((List!32735 0))(
  ( (Nil!32732) (Cons!32731 (h!33973 (_ BitVec 64)) (t!47421 List!32735)) )
))
(declare-fun arrayNoDuplicates!0 (array!95568 (_ BitVec 32) List!32735) Bool)

(assert (=> b!1398098 (= res!937058 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32732))))

(declare-fun b!1398099 () Bool)

(declare-fun res!937064 () Bool)

(assert (=> b!1398099 (=> (not res!937064) (not e!791502))))

(assert (=> b!1398099 (= res!937064 (validKeyInArray!0 (select (arr!46138 a!2901) j!112)))))

(declare-fun b!1398100 () Bool)

(assert (=> b!1398100 (= e!791502 (not e!791500))))

(declare-fun res!937062 () Bool)

(assert (=> b!1398100 (=> res!937062 e!791500)))

(assert (=> b!1398100 (= res!937062 (or (not ((_ is Intermediate!10481) lt!614569)) (undefined!11293 lt!614569)))))

(assert (=> b!1398100 e!791501))

(declare-fun res!937061 () Bool)

(assert (=> b!1398100 (=> (not res!937061) (not e!791501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95568 (_ BitVec 32)) Bool)

(assert (=> b!1398100 (= res!937061 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46809 0))(
  ( (Unit!46810) )
))
(declare-fun lt!614565 () Unit!46809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46809)

(assert (=> b!1398100 (= lt!614565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614568 () (_ BitVec 32))

(assert (=> b!1398100 (= lt!614569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614568 (select (arr!46138 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398100 (= lt!614568 (toIndex!0 (select (arr!46138 a!2901) j!112) mask!2840))))

(declare-fun b!1398101 () Bool)

(declare-fun res!937066 () Bool)

(assert (=> b!1398101 (=> (not res!937066) (not e!791502))))

(assert (=> b!1398101 (= res!937066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398102 () Bool)

(assert (=> b!1398102 (= e!791503 true)))

(assert (=> b!1398102 (and (not (undefined!11293 lt!614567)) (= (index!44297 lt!614567) i!1037) (bvslt (x!125940 lt!614567) (x!125940 lt!614569)) (= (select (store (arr!46138 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44297 lt!614567)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614570 () Unit!46809)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46809)

(assert (=> b!1398102 (= lt!614570 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614568 (x!125940 lt!614569) (index!44297 lt!614569) (x!125940 lt!614567) (index!44297 lt!614567) (undefined!11293 lt!614567) mask!2840))))

(assert (= (and start!120086 res!937065) b!1398094))

(assert (= (and b!1398094 res!937060) b!1398097))

(assert (= (and b!1398097 res!937059) b!1398099))

(assert (= (and b!1398099 res!937064) b!1398101))

(assert (= (and b!1398101 res!937066) b!1398098))

(assert (= (and b!1398098 res!937058) b!1398100))

(assert (= (and b!1398100 res!937061) b!1398096))

(assert (= (and b!1398100 (not res!937062)) b!1398095))

(assert (= (and b!1398095 (not res!937063)) b!1398102))

(declare-fun m!1284667 () Bool)

(assert (=> b!1398099 m!1284667))

(assert (=> b!1398099 m!1284667))

(declare-fun m!1284669 () Bool)

(assert (=> b!1398099 m!1284669))

(declare-fun m!1284671 () Bool)

(assert (=> b!1398101 m!1284671))

(declare-fun m!1284673 () Bool)

(assert (=> b!1398097 m!1284673))

(assert (=> b!1398097 m!1284673))

(declare-fun m!1284675 () Bool)

(assert (=> b!1398097 m!1284675))

(declare-fun m!1284677 () Bool)

(assert (=> start!120086 m!1284677))

(declare-fun m!1284679 () Bool)

(assert (=> start!120086 m!1284679))

(declare-fun m!1284681 () Bool)

(assert (=> b!1398098 m!1284681))

(declare-fun m!1284683 () Bool)

(assert (=> b!1398102 m!1284683))

(declare-fun m!1284685 () Bool)

(assert (=> b!1398102 m!1284685))

(declare-fun m!1284687 () Bool)

(assert (=> b!1398102 m!1284687))

(assert (=> b!1398100 m!1284667))

(declare-fun m!1284689 () Bool)

(assert (=> b!1398100 m!1284689))

(assert (=> b!1398100 m!1284667))

(declare-fun m!1284691 () Bool)

(assert (=> b!1398100 m!1284691))

(assert (=> b!1398100 m!1284667))

(declare-fun m!1284693 () Bool)

(assert (=> b!1398100 m!1284693))

(declare-fun m!1284695 () Bool)

(assert (=> b!1398100 m!1284695))

(declare-fun m!1284697 () Bool)

(assert (=> b!1398095 m!1284697))

(assert (=> b!1398095 m!1284683))

(assert (=> b!1398095 m!1284697))

(declare-fun m!1284699 () Bool)

(assert (=> b!1398095 m!1284699))

(declare-fun m!1284701 () Bool)

(assert (=> b!1398095 m!1284701))

(assert (=> b!1398096 m!1284667))

(assert (=> b!1398096 m!1284667))

(declare-fun m!1284703 () Bool)

(assert (=> b!1398096 m!1284703))

(check-sat (not b!1398098) (not start!120086) (not b!1398102) (not b!1398099) (not b!1398101) (not b!1398095) (not b!1398100) (not b!1398097) (not b!1398096))
(check-sat)
