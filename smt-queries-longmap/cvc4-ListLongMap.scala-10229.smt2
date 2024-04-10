; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120430 () Bool)

(assert start!120430)

(declare-fun b!1402103 () Bool)

(declare-fun res!940618 () Bool)

(declare-fun e!793958 () Bool)

(assert (=> b!1402103 (=> (not res!940618) (not e!793958))))

(declare-datatypes ((array!95839 0))(
  ( (array!95840 (arr!46270 (Array (_ BitVec 32) (_ BitVec 64))) (size!46820 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95839)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95839 (_ BitVec 32)) Bool)

(assert (=> b!1402103 (= res!940618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402104 () Bool)

(declare-fun e!793955 () Bool)

(declare-fun e!793957 () Bool)

(assert (=> b!1402104 (= e!793955 e!793957)))

(declare-fun res!940616 () Bool)

(assert (=> b!1402104 (=> res!940616 e!793957)))

(declare-datatypes ((SeekEntryResult!10587 0))(
  ( (MissingZero!10587 (index!44725 (_ BitVec 32))) (Found!10587 (index!44726 (_ BitVec 32))) (Intermediate!10587 (undefined!11399 Bool) (index!44727 (_ BitVec 32)) (x!126350 (_ BitVec 32))) (Undefined!10587) (MissingVacant!10587 (index!44728 (_ BitVec 32))) )
))
(declare-fun lt!617421 () SeekEntryResult!10587)

(declare-fun lt!617418 () SeekEntryResult!10587)

(assert (=> b!1402104 (= res!940616 (or (= lt!617421 lt!617418) (not (is-Intermediate!10587 lt!617418))))))

(declare-fun lt!617419 () (_ BitVec 64))

(declare-fun lt!617417 () array!95839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95839 (_ BitVec 32)) SeekEntryResult!10587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402104 (= lt!617418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617419 mask!2840) lt!617419 lt!617417 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402104 (= lt!617419 (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402104 (= lt!617417 (array!95840 (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46820 a!2901)))))

(declare-fun b!1402105 () Bool)

(declare-fun res!940623 () Bool)

(assert (=> b!1402105 (=> (not res!940623) (not e!793958))))

(declare-datatypes ((List!32789 0))(
  ( (Nil!32786) (Cons!32785 (h!34033 (_ BitVec 64)) (t!47483 List!32789)) )
))
(declare-fun arrayNoDuplicates!0 (array!95839 (_ BitVec 32) List!32789) Bool)

(assert (=> b!1402105 (= res!940623 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32786))))

(declare-fun res!940614 () Bool)

(assert (=> start!120430 (=> (not res!940614) (not e!793958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120430 (= res!940614 (validMask!0 mask!2840))))

(assert (=> start!120430 e!793958))

(assert (=> start!120430 true))

(declare-fun array_inv!35298 (array!95839) Bool)

(assert (=> start!120430 (array_inv!35298 a!2901)))

(declare-fun b!1402106 () Bool)

(declare-fun res!940621 () Bool)

(assert (=> b!1402106 (=> (not res!940621) (not e!793958))))

(assert (=> b!1402106 (= res!940621 (and (= (size!46820 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46820 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46820 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!793956 () Bool)

(declare-fun b!1402107 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95839 (_ BitVec 32)) SeekEntryResult!10587)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95839 (_ BitVec 32)) SeekEntryResult!10587)

(assert (=> b!1402107 (= e!793956 (= (seekEntryOrOpen!0 lt!617419 lt!617417 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126350 lt!617418) (index!44727 lt!617418) (index!44727 lt!617418) (select (arr!46270 a!2901) j!112) lt!617417 mask!2840)))))

(declare-fun e!793961 () Bool)

(declare-fun b!1402108 () Bool)

(assert (=> b!1402108 (= e!793961 (= (seekEntryOrOpen!0 (select (arr!46270 a!2901) j!112) a!2901 mask!2840) (Found!10587 j!112)))))

(declare-fun b!1402109 () Bool)

(declare-fun e!793959 () Bool)

(assert (=> b!1402109 (= e!793959 true)))

(declare-fun lt!617415 () (_ BitVec 32))

(declare-fun lt!617416 () SeekEntryResult!10587)

(assert (=> b!1402109 (= lt!617416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617415 lt!617419 lt!617417 mask!2840))))

(declare-fun b!1402110 () Bool)

(assert (=> b!1402110 (= e!793958 (not e!793955))))

(declare-fun res!940622 () Bool)

(assert (=> b!1402110 (=> res!940622 e!793955)))

(assert (=> b!1402110 (= res!940622 (or (not (is-Intermediate!10587 lt!617421)) (undefined!11399 lt!617421)))))

(assert (=> b!1402110 e!793961))

(declare-fun res!940615 () Bool)

(assert (=> b!1402110 (=> (not res!940615) (not e!793961))))

(assert (=> b!1402110 (= res!940615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47178 0))(
  ( (Unit!47179) )
))
(declare-fun lt!617420 () Unit!47178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47178)

(assert (=> b!1402110 (= lt!617420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402110 (= lt!617421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617415 (select (arr!46270 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402110 (= lt!617415 (toIndex!0 (select (arr!46270 a!2901) j!112) mask!2840))))

(declare-fun b!1402111 () Bool)

(declare-fun res!940624 () Bool)

(assert (=> b!1402111 (=> (not res!940624) (not e!793958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402111 (= res!940624 (validKeyInArray!0 (select (arr!46270 a!2901) j!112)))))

(declare-fun b!1402112 () Bool)

(declare-fun res!940620 () Bool)

(assert (=> b!1402112 (=> (not res!940620) (not e!793958))))

(assert (=> b!1402112 (= res!940620 (validKeyInArray!0 (select (arr!46270 a!2901) i!1037)))))

(declare-fun b!1402113 () Bool)

(assert (=> b!1402113 (= e!793957 e!793959)))

(declare-fun res!940619 () Bool)

(assert (=> b!1402113 (=> res!940619 e!793959)))

(assert (=> b!1402113 (= res!940619 (or (bvslt (x!126350 lt!617421) #b00000000000000000000000000000000) (bvsgt (x!126350 lt!617421) #b01111111111111111111111111111110) (bvslt (x!126350 lt!617418) #b00000000000000000000000000000000) (bvsgt (x!126350 lt!617418) #b01111111111111111111111111111110) (bvslt lt!617415 #b00000000000000000000000000000000) (bvsge lt!617415 (size!46820 a!2901)) (bvslt (index!44727 lt!617421) #b00000000000000000000000000000000) (bvsge (index!44727 lt!617421) (size!46820 a!2901)) (bvslt (index!44727 lt!617418) #b00000000000000000000000000000000) (bvsge (index!44727 lt!617418) (size!46820 a!2901)) (not (= lt!617421 (Intermediate!10587 false (index!44727 lt!617421) (x!126350 lt!617421)))) (not (= lt!617418 (Intermediate!10587 false (index!44727 lt!617418) (x!126350 lt!617418))))))))

(assert (=> b!1402113 e!793956))

(declare-fun res!940617 () Bool)

(assert (=> b!1402113 (=> (not res!940617) (not e!793956))))

(assert (=> b!1402113 (= res!940617 (and (not (undefined!11399 lt!617418)) (= (index!44727 lt!617418) i!1037) (bvslt (x!126350 lt!617418) (x!126350 lt!617421)) (= (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44727 lt!617418)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617414 () Unit!47178)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47178)

(assert (=> b!1402113 (= lt!617414 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617415 (x!126350 lt!617421) (index!44727 lt!617421) (x!126350 lt!617418) (index!44727 lt!617418) (undefined!11399 lt!617418) mask!2840))))

(assert (= (and start!120430 res!940614) b!1402106))

(assert (= (and b!1402106 res!940621) b!1402112))

(assert (= (and b!1402112 res!940620) b!1402111))

(assert (= (and b!1402111 res!940624) b!1402103))

(assert (= (and b!1402103 res!940618) b!1402105))

(assert (= (and b!1402105 res!940623) b!1402110))

(assert (= (and b!1402110 res!940615) b!1402108))

(assert (= (and b!1402110 (not res!940622)) b!1402104))

(assert (= (and b!1402104 (not res!940616)) b!1402113))

(assert (= (and b!1402113 res!940617) b!1402107))

(assert (= (and b!1402113 (not res!940619)) b!1402109))

(declare-fun m!1290109 () Bool)

(assert (=> b!1402105 m!1290109))

(declare-fun m!1290111 () Bool)

(assert (=> b!1402108 m!1290111))

(assert (=> b!1402108 m!1290111))

(declare-fun m!1290113 () Bool)

(assert (=> b!1402108 m!1290113))

(declare-fun m!1290115 () Bool)

(assert (=> start!120430 m!1290115))

(declare-fun m!1290117 () Bool)

(assert (=> start!120430 m!1290117))

(declare-fun m!1290119 () Bool)

(assert (=> b!1402113 m!1290119))

(declare-fun m!1290121 () Bool)

(assert (=> b!1402113 m!1290121))

(declare-fun m!1290123 () Bool)

(assert (=> b!1402113 m!1290123))

(declare-fun m!1290125 () Bool)

(assert (=> b!1402104 m!1290125))

(assert (=> b!1402104 m!1290125))

(declare-fun m!1290127 () Bool)

(assert (=> b!1402104 m!1290127))

(assert (=> b!1402104 m!1290119))

(declare-fun m!1290129 () Bool)

(assert (=> b!1402104 m!1290129))

(assert (=> b!1402110 m!1290111))

(declare-fun m!1290131 () Bool)

(assert (=> b!1402110 m!1290131))

(assert (=> b!1402110 m!1290111))

(assert (=> b!1402110 m!1290111))

(declare-fun m!1290133 () Bool)

(assert (=> b!1402110 m!1290133))

(declare-fun m!1290135 () Bool)

(assert (=> b!1402110 m!1290135))

(declare-fun m!1290137 () Bool)

(assert (=> b!1402110 m!1290137))

(declare-fun m!1290139 () Bool)

(assert (=> b!1402103 m!1290139))

(declare-fun m!1290141 () Bool)

(assert (=> b!1402107 m!1290141))

(assert (=> b!1402107 m!1290111))

(assert (=> b!1402107 m!1290111))

(declare-fun m!1290143 () Bool)

(assert (=> b!1402107 m!1290143))

(declare-fun m!1290145 () Bool)

(assert (=> b!1402112 m!1290145))

(assert (=> b!1402112 m!1290145))

(declare-fun m!1290147 () Bool)

(assert (=> b!1402112 m!1290147))

(declare-fun m!1290149 () Bool)

(assert (=> b!1402109 m!1290149))

(assert (=> b!1402111 m!1290111))

(assert (=> b!1402111 m!1290111))

(declare-fun m!1290151 () Bool)

(assert (=> b!1402111 m!1290151))

(push 1)

