; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119894 () Bool)

(assert start!119894)

(declare-fun b!1395580 () Bool)

(declare-fun res!934310 () Bool)

(declare-fun e!790242 () Bool)

(assert (=> b!1395580 (=> (not res!934310) (not e!790242))))

(declare-datatypes ((array!95498 0))(
  ( (array!95499 (arr!46105 (Array (_ BitVec 32) (_ BitVec 64))) (size!46656 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95498)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395580 (= res!934310 (validKeyInArray!0 (select (arr!46105 a!2901) j!112)))))

(declare-fun b!1395582 () Bool)

(declare-fun e!790243 () Bool)

(assert (=> b!1395582 (= e!790243 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612872 () array!95498)

(declare-fun lt!612870 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10325 0))(
  ( (MissingZero!10325 (index!43671 (_ BitVec 32))) (Found!10325 (index!43672 (_ BitVec 32))) (Intermediate!10325 (undefined!11137 Bool) (index!43673 (_ BitVec 32)) (x!125492 (_ BitVec 32))) (Undefined!10325) (MissingVacant!10325 (index!43674 (_ BitVec 32))) )
))
(declare-fun lt!612874 () SeekEntryResult!10325)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95498 (_ BitVec 32)) SeekEntryResult!10325)

(assert (=> b!1395582 (= lt!612874 (seekEntryOrOpen!0 lt!612870 lt!612872 mask!2840))))

(declare-datatypes ((Unit!46681 0))(
  ( (Unit!46682) )
))
(declare-fun lt!612869 () Unit!46681)

(declare-fun lt!612875 () SeekEntryResult!10325)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612873 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46681)

(assert (=> b!1395582 (= lt!612869 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612873 (x!125492 lt!612875) (index!43673 lt!612875) mask!2840))))

(declare-fun b!1395583 () Bool)

(declare-fun res!934306 () Bool)

(assert (=> b!1395583 (=> res!934306 e!790243)))

(assert (=> b!1395583 (= res!934306 (or (bvslt (x!125492 lt!612875) #b00000000000000000000000000000000) (bvsgt (x!125492 lt!612875) #b01111111111111111111111111111110) (bvslt lt!612873 #b00000000000000000000000000000000) (bvsge lt!612873 (size!46656 a!2901)) (bvslt (index!43673 lt!612875) #b00000000000000000000000000000000) (bvsge (index!43673 lt!612875) (size!46656 a!2901)) (not (= lt!612875 (Intermediate!10325 false (index!43673 lt!612875) (x!125492 lt!612875))))))))

(declare-fun b!1395584 () Bool)

(declare-fun res!934309 () Bool)

(assert (=> b!1395584 (=> (not res!934309) (not e!790242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95498 (_ BitVec 32)) Bool)

(assert (=> b!1395584 (= res!934309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395585 () Bool)

(declare-fun e!790244 () Bool)

(assert (=> b!1395585 (= e!790244 e!790243)))

(declare-fun res!934311 () Bool)

(assert (=> b!1395585 (=> res!934311 e!790243)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95498 (_ BitVec 32)) SeekEntryResult!10325)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395585 (= res!934311 (not (= lt!612875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612870 mask!2840) lt!612870 lt!612872 mask!2840))))))

(assert (=> b!1395585 (= lt!612870 (select (store (arr!46105 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395585 (= lt!612872 (array!95499 (store (arr!46105 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46656 a!2901)))))

(declare-fun b!1395586 () Bool)

(declare-fun res!934312 () Bool)

(assert (=> b!1395586 (=> (not res!934312) (not e!790242))))

(declare-datatypes ((List!32611 0))(
  ( (Nil!32608) (Cons!32607 (h!33848 (_ BitVec 64)) (t!47297 List!32611)) )
))
(declare-fun arrayNoDuplicates!0 (array!95498 (_ BitVec 32) List!32611) Bool)

(assert (=> b!1395586 (= res!934312 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32608))))

(declare-fun res!934304 () Bool)

(assert (=> start!119894 (=> (not res!934304) (not e!790242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119894 (= res!934304 (validMask!0 mask!2840))))

(assert (=> start!119894 e!790242))

(assert (=> start!119894 true))

(declare-fun array_inv!35386 (array!95498) Bool)

(assert (=> start!119894 (array_inv!35386 a!2901)))

(declare-fun b!1395581 () Bool)

(declare-fun res!934308 () Bool)

(assert (=> b!1395581 (=> (not res!934308) (not e!790242))))

(assert (=> b!1395581 (= res!934308 (validKeyInArray!0 (select (arr!46105 a!2901) i!1037)))))

(declare-fun b!1395587 () Bool)

(assert (=> b!1395587 (= e!790242 (not e!790244))))

(declare-fun res!934307 () Bool)

(assert (=> b!1395587 (=> res!934307 e!790244)))

(get-info :version)

(assert (=> b!1395587 (= res!934307 (or (not ((_ is Intermediate!10325) lt!612875)) (undefined!11137 lt!612875)))))

(assert (=> b!1395587 (= lt!612874 (Found!10325 j!112))))

(assert (=> b!1395587 (= lt!612874 (seekEntryOrOpen!0 (select (arr!46105 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395587 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612871 () Unit!46681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46681)

(assert (=> b!1395587 (= lt!612871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395587 (= lt!612875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612873 (select (arr!46105 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395587 (= lt!612873 (toIndex!0 (select (arr!46105 a!2901) j!112) mask!2840))))

(declare-fun b!1395588 () Bool)

(declare-fun res!934305 () Bool)

(assert (=> b!1395588 (=> (not res!934305) (not e!790242))))

(assert (=> b!1395588 (= res!934305 (and (= (size!46656 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46656 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46656 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119894 res!934304) b!1395588))

(assert (= (and b!1395588 res!934305) b!1395581))

(assert (= (and b!1395581 res!934308) b!1395580))

(assert (= (and b!1395580 res!934310) b!1395584))

(assert (= (and b!1395584 res!934309) b!1395586))

(assert (= (and b!1395586 res!934312) b!1395587))

(assert (= (and b!1395587 (not res!934307)) b!1395585))

(assert (= (and b!1395585 (not res!934311)) b!1395583))

(assert (= (and b!1395583 (not res!934306)) b!1395582))

(declare-fun m!1282135 () Bool)

(assert (=> b!1395580 m!1282135))

(assert (=> b!1395580 m!1282135))

(declare-fun m!1282137 () Bool)

(assert (=> b!1395580 m!1282137))

(assert (=> b!1395587 m!1282135))

(declare-fun m!1282139 () Bool)

(assert (=> b!1395587 m!1282139))

(assert (=> b!1395587 m!1282135))

(declare-fun m!1282141 () Bool)

(assert (=> b!1395587 m!1282141))

(assert (=> b!1395587 m!1282135))

(declare-fun m!1282143 () Bool)

(assert (=> b!1395587 m!1282143))

(declare-fun m!1282145 () Bool)

(assert (=> b!1395587 m!1282145))

(assert (=> b!1395587 m!1282135))

(declare-fun m!1282147 () Bool)

(assert (=> b!1395587 m!1282147))

(declare-fun m!1282149 () Bool)

(assert (=> start!119894 m!1282149))

(declare-fun m!1282151 () Bool)

(assert (=> start!119894 m!1282151))

(declare-fun m!1282153 () Bool)

(assert (=> b!1395586 m!1282153))

(declare-fun m!1282155 () Bool)

(assert (=> b!1395581 m!1282155))

(assert (=> b!1395581 m!1282155))

(declare-fun m!1282157 () Bool)

(assert (=> b!1395581 m!1282157))

(declare-fun m!1282159 () Bool)

(assert (=> b!1395584 m!1282159))

(declare-fun m!1282161 () Bool)

(assert (=> b!1395582 m!1282161))

(declare-fun m!1282163 () Bool)

(assert (=> b!1395582 m!1282163))

(declare-fun m!1282165 () Bool)

(assert (=> b!1395585 m!1282165))

(assert (=> b!1395585 m!1282165))

(declare-fun m!1282167 () Bool)

(assert (=> b!1395585 m!1282167))

(declare-fun m!1282169 () Bool)

(assert (=> b!1395585 m!1282169))

(declare-fun m!1282171 () Bool)

(assert (=> b!1395585 m!1282171))

(check-sat (not b!1395580) (not start!119894) (not b!1395586) (not b!1395581) (not b!1395582) (not b!1395585) (not b!1395587) (not b!1395584))
(check-sat)
