; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121640 () Bool)

(assert start!121640)

(declare-fun b!1413195 () Bool)

(declare-fun res!950243 () Bool)

(declare-fun e!799769 () Bool)

(assert (=> b!1413195 (=> (not res!950243) (not e!799769))))

(declare-datatypes ((array!96531 0))(
  ( (array!96532 (arr!46603 (Array (_ BitVec 32) (_ BitVec 64))) (size!47155 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96531)

(declare-datatypes ((List!33200 0))(
  ( (Nil!33197) (Cons!33196 (h!34471 (_ BitVec 64)) (t!47886 List!33200)) )
))
(declare-fun arrayNoDuplicates!0 (array!96531 (_ BitVec 32) List!33200) Bool)

(assert (=> b!1413195 (= res!950243 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33197))))

(declare-fun res!950236 () Bool)

(assert (=> start!121640 (=> (not res!950236) (not e!799769))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121640 (= res!950236 (validMask!0 mask!2840))))

(assert (=> start!121640 e!799769))

(assert (=> start!121640 true))

(declare-fun array_inv!35836 (array!96531) Bool)

(assert (=> start!121640 (array_inv!35836 a!2901)))

(declare-fun e!799764 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!622733 () (_ BitVec 64))

(declare-fun lt!622732 () array!96531)

(declare-fun b!1413196 () Bool)

(declare-datatypes ((SeekEntryResult!10940 0))(
  ( (MissingZero!10940 (index!46140 (_ BitVec 32))) (Found!10940 (index!46141 (_ BitVec 32))) (Intermediate!10940 (undefined!11752 Bool) (index!46142 (_ BitVec 32)) (x!127720 (_ BitVec 32))) (Undefined!10940) (MissingVacant!10940 (index!46143 (_ BitVec 32))) )
))
(declare-fun lt!622736 () SeekEntryResult!10940)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96531 (_ BitVec 32)) SeekEntryResult!10940)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96531 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1413196 (= e!799764 (= (seekEntryOrOpen!0 lt!622733 lt!622732 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127720 lt!622736) (index!46142 lt!622736) (index!46142 lt!622736) (select (arr!46603 a!2901) j!112) lt!622732 mask!2840)))))

(declare-fun b!1413197 () Bool)

(declare-fun res!950241 () Bool)

(assert (=> b!1413197 (=> (not res!950241) (not e!799769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96531 (_ BitVec 32)) Bool)

(assert (=> b!1413197 (= res!950241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413198 () Bool)

(declare-fun res!950240 () Bool)

(assert (=> b!1413198 (=> (not res!950240) (not e!799769))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413198 (= res!950240 (and (= (size!47155 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47155 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47155 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!799768 () Bool)

(declare-fun b!1413199 () Bool)

(assert (=> b!1413199 (= e!799768 (= (seekEntryOrOpen!0 (select (arr!46603 a!2901) j!112) a!2901 mask!2840) (Found!10940 j!112)))))

(declare-fun b!1413200 () Bool)

(declare-fun res!950239 () Bool)

(assert (=> b!1413200 (=> (not res!950239) (not e!799769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413200 (= res!950239 (validKeyInArray!0 (select (arr!46603 a!2901) i!1037)))))

(declare-fun b!1413201 () Bool)

(declare-fun e!799767 () Bool)

(declare-fun e!799765 () Bool)

(assert (=> b!1413201 (= e!799767 e!799765)))

(declare-fun res!950244 () Bool)

(assert (=> b!1413201 (=> res!950244 e!799765)))

(declare-fun lt!622735 () SeekEntryResult!10940)

(get-info :version)

(assert (=> b!1413201 (= res!950244 (or (= lt!622735 lt!622736) (not ((_ is Intermediate!10940) lt!622736))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96531 (_ BitVec 32)) SeekEntryResult!10940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413201 (= lt!622736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622733 mask!2840) lt!622733 lt!622732 mask!2840))))

(assert (=> b!1413201 (= lt!622733 (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413201 (= lt!622732 (array!96532 (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47155 a!2901)))))

(declare-fun b!1413202 () Bool)

(assert (=> b!1413202 (= e!799765 true)))

(assert (=> b!1413202 e!799764))

(declare-fun res!950245 () Bool)

(assert (=> b!1413202 (=> (not res!950245) (not e!799764))))

(assert (=> b!1413202 (= res!950245 (and (not (undefined!11752 lt!622736)) (= (index!46142 lt!622736) i!1037) (bvslt (x!127720 lt!622736) (x!127720 lt!622735)) (= (select (store (arr!46603 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46142 lt!622736)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47697 0))(
  ( (Unit!47698) )
))
(declare-fun lt!622730 () Unit!47697)

(declare-fun lt!622731 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47697)

(assert (=> b!1413202 (= lt!622730 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622731 (x!127720 lt!622735) (index!46142 lt!622735) (x!127720 lt!622736) (index!46142 lt!622736) (undefined!11752 lt!622736) mask!2840))))

(declare-fun b!1413203 () Bool)

(declare-fun res!950238 () Bool)

(assert (=> b!1413203 (=> (not res!950238) (not e!799769))))

(assert (=> b!1413203 (= res!950238 (validKeyInArray!0 (select (arr!46603 a!2901) j!112)))))

(declare-fun b!1413204 () Bool)

(assert (=> b!1413204 (= e!799769 (not e!799767))))

(declare-fun res!950242 () Bool)

(assert (=> b!1413204 (=> res!950242 e!799767)))

(assert (=> b!1413204 (= res!950242 (or (not ((_ is Intermediate!10940) lt!622735)) (undefined!11752 lt!622735)))))

(assert (=> b!1413204 e!799768))

(declare-fun res!950237 () Bool)

(assert (=> b!1413204 (=> (not res!950237) (not e!799768))))

(assert (=> b!1413204 (= res!950237 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622734 () Unit!47697)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47697)

(assert (=> b!1413204 (= lt!622734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413204 (= lt!622735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622731 (select (arr!46603 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413204 (= lt!622731 (toIndex!0 (select (arr!46603 a!2901) j!112) mask!2840))))

(assert (= (and start!121640 res!950236) b!1413198))

(assert (= (and b!1413198 res!950240) b!1413200))

(assert (= (and b!1413200 res!950239) b!1413203))

(assert (= (and b!1413203 res!950238) b!1413197))

(assert (= (and b!1413197 res!950241) b!1413195))

(assert (= (and b!1413195 res!950243) b!1413204))

(assert (= (and b!1413204 res!950237) b!1413199))

(assert (= (and b!1413204 (not res!950242)) b!1413201))

(assert (= (and b!1413201 (not res!950244)) b!1413202))

(assert (= (and b!1413202 res!950245) b!1413196))

(declare-fun m!1303099 () Bool)

(assert (=> b!1413195 m!1303099))

(declare-fun m!1303101 () Bool)

(assert (=> b!1413196 m!1303101))

(declare-fun m!1303103 () Bool)

(assert (=> b!1413196 m!1303103))

(assert (=> b!1413196 m!1303103))

(declare-fun m!1303105 () Bool)

(assert (=> b!1413196 m!1303105))

(declare-fun m!1303107 () Bool)

(assert (=> b!1413202 m!1303107))

(declare-fun m!1303109 () Bool)

(assert (=> b!1413202 m!1303109))

(declare-fun m!1303111 () Bool)

(assert (=> b!1413202 m!1303111))

(declare-fun m!1303113 () Bool)

(assert (=> b!1413200 m!1303113))

(assert (=> b!1413200 m!1303113))

(declare-fun m!1303115 () Bool)

(assert (=> b!1413200 m!1303115))

(assert (=> b!1413203 m!1303103))

(assert (=> b!1413203 m!1303103))

(declare-fun m!1303117 () Bool)

(assert (=> b!1413203 m!1303117))

(declare-fun m!1303119 () Bool)

(assert (=> start!121640 m!1303119))

(declare-fun m!1303121 () Bool)

(assert (=> start!121640 m!1303121))

(declare-fun m!1303123 () Bool)

(assert (=> b!1413201 m!1303123))

(assert (=> b!1413201 m!1303123))

(declare-fun m!1303125 () Bool)

(assert (=> b!1413201 m!1303125))

(assert (=> b!1413201 m!1303107))

(declare-fun m!1303127 () Bool)

(assert (=> b!1413201 m!1303127))

(declare-fun m!1303129 () Bool)

(assert (=> b!1413197 m!1303129))

(assert (=> b!1413204 m!1303103))

(declare-fun m!1303131 () Bool)

(assert (=> b!1413204 m!1303131))

(assert (=> b!1413204 m!1303103))

(assert (=> b!1413204 m!1303103))

(declare-fun m!1303133 () Bool)

(assert (=> b!1413204 m!1303133))

(declare-fun m!1303135 () Bool)

(assert (=> b!1413204 m!1303135))

(declare-fun m!1303137 () Bool)

(assert (=> b!1413204 m!1303137))

(assert (=> b!1413199 m!1303103))

(assert (=> b!1413199 m!1303103))

(declare-fun m!1303139 () Bool)

(assert (=> b!1413199 m!1303139))

(check-sat (not b!1413204) (not b!1413200) (not b!1413201) (not b!1413202) (not b!1413195) (not start!121640) (not b!1413199) (not b!1413203) (not b!1413196) (not b!1413197))
(check-sat)
