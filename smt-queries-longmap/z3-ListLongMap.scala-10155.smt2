; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119690 () Bool)

(assert start!119690)

(declare-fun b!1394197 () Bool)

(declare-fun res!933661 () Bool)

(declare-fun e!789394 () Bool)

(assert (=> b!1394197 (=> (not res!933661) (not e!789394))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95325 0))(
  ( (array!95326 (arr!46021 (Array (_ BitVec 32) (_ BitVec 64))) (size!46573 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95325)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394197 (= res!933661 (and (= (size!46573 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46573 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46573 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394198 () Bool)

(declare-fun res!933657 () Bool)

(assert (=> b!1394198 (=> (not res!933657) (not e!789394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394198 (= res!933657 (validKeyInArray!0 (select (arr!46021 a!2901) i!1037)))))

(declare-fun b!1394200 () Bool)

(declare-fun res!933660 () Bool)

(declare-fun e!789393 () Bool)

(assert (=> b!1394200 (=> res!933660 e!789393)))

(declare-fun lt!612155 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10364 0))(
  ( (MissingZero!10364 (index!43827 (_ BitVec 32))) (Found!10364 (index!43828 (_ BitVec 32))) (Intermediate!10364 (undefined!11176 Bool) (index!43829 (_ BitVec 32)) (x!125493 (_ BitVec 32))) (Undefined!10364) (MissingVacant!10364 (index!43830 (_ BitVec 32))) )
))
(declare-fun lt!612159 () SeekEntryResult!10364)

(assert (=> b!1394200 (= res!933660 (or (bvslt (x!125493 lt!612159) #b00000000000000000000000000000000) (bvsgt (x!125493 lt!612159) #b01111111111111111111111111111110) (bvslt lt!612155 #b00000000000000000000000000000000) (bvsge lt!612155 (size!46573 a!2901)) (bvslt (index!43829 lt!612159) #b00000000000000000000000000000000) (bvsge (index!43829 lt!612159) (size!46573 a!2901)) (not (= lt!612159 (Intermediate!10364 false (index!43829 lt!612159) (x!125493 lt!612159))))))))

(declare-fun b!1394201 () Bool)

(declare-fun e!789395 () Bool)

(assert (=> b!1394201 (= e!789395 e!789393)))

(declare-fun res!933662 () Bool)

(assert (=> b!1394201 (=> res!933662 e!789393)))

(declare-fun lt!612161 () array!95325)

(declare-fun lt!612158 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95325 (_ BitVec 32)) SeekEntryResult!10364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394201 (= res!933662 (not (= lt!612159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612158 mask!2840) lt!612158 lt!612161 mask!2840))))))

(assert (=> b!1394201 (= lt!612158 (select (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394201 (= lt!612161 (array!95326 (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46573 a!2901)))))

(declare-fun b!1394202 () Bool)

(declare-fun res!933656 () Bool)

(assert (=> b!1394202 (=> (not res!933656) (not e!789394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95325 (_ BitVec 32)) Bool)

(assert (=> b!1394202 (= res!933656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394203 () Bool)

(assert (=> b!1394203 (= e!789394 (not e!789395))))

(declare-fun res!933659 () Bool)

(assert (=> b!1394203 (=> res!933659 e!789395)))

(get-info :version)

(assert (=> b!1394203 (= res!933659 (or (not ((_ is Intermediate!10364) lt!612159)) (undefined!11176 lt!612159)))))

(declare-fun lt!612160 () SeekEntryResult!10364)

(assert (=> b!1394203 (= lt!612160 (Found!10364 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95325 (_ BitVec 32)) SeekEntryResult!10364)

(assert (=> b!1394203 (= lt!612160 (seekEntryOrOpen!0 (select (arr!46021 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394203 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46575 0))(
  ( (Unit!46576) )
))
(declare-fun lt!612156 () Unit!46575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46575)

(assert (=> b!1394203 (= lt!612156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394203 (= lt!612159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612155 (select (arr!46021 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394203 (= lt!612155 (toIndex!0 (select (arr!46021 a!2901) j!112) mask!2840))))

(declare-fun b!1394199 () Bool)

(declare-fun res!933658 () Bool)

(assert (=> b!1394199 (=> (not res!933658) (not e!789394))))

(declare-datatypes ((List!32618 0))(
  ( (Nil!32615) (Cons!32614 (h!33847 (_ BitVec 64)) (t!47304 List!32618)) )
))
(declare-fun arrayNoDuplicates!0 (array!95325 (_ BitVec 32) List!32618) Bool)

(assert (=> b!1394199 (= res!933658 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32615))))

(declare-fun res!933663 () Bool)

(assert (=> start!119690 (=> (not res!933663) (not e!789394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119690 (= res!933663 (validMask!0 mask!2840))))

(assert (=> start!119690 e!789394))

(assert (=> start!119690 true))

(declare-fun array_inv!35254 (array!95325) Bool)

(assert (=> start!119690 (array_inv!35254 a!2901)))

(declare-fun b!1394204 () Bool)

(assert (=> b!1394204 (= e!789393 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1394204 (= lt!612160 (seekEntryOrOpen!0 lt!612158 lt!612161 mask!2840))))

(declare-fun lt!612157 () Unit!46575)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46575)

(assert (=> b!1394204 (= lt!612157 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612155 (x!125493 lt!612159) (index!43829 lt!612159) mask!2840))))

(declare-fun b!1394205 () Bool)

(declare-fun res!933664 () Bool)

(assert (=> b!1394205 (=> (not res!933664) (not e!789394))))

(assert (=> b!1394205 (= res!933664 (validKeyInArray!0 (select (arr!46021 a!2901) j!112)))))

(assert (= (and start!119690 res!933663) b!1394197))

(assert (= (and b!1394197 res!933661) b!1394198))

(assert (= (and b!1394198 res!933657) b!1394205))

(assert (= (and b!1394205 res!933664) b!1394202))

(assert (= (and b!1394202 res!933656) b!1394199))

(assert (= (and b!1394199 res!933658) b!1394203))

(assert (= (and b!1394203 (not res!933659)) b!1394201))

(assert (= (and b!1394201 (not res!933662)) b!1394200))

(assert (= (and b!1394200 (not res!933660)) b!1394204))

(declare-fun m!1279999 () Bool)

(assert (=> b!1394202 m!1279999))

(declare-fun m!1280001 () Bool)

(assert (=> b!1394204 m!1280001))

(declare-fun m!1280003 () Bool)

(assert (=> b!1394204 m!1280003))

(declare-fun m!1280005 () Bool)

(assert (=> b!1394203 m!1280005))

(declare-fun m!1280007 () Bool)

(assert (=> b!1394203 m!1280007))

(assert (=> b!1394203 m!1280005))

(assert (=> b!1394203 m!1280005))

(declare-fun m!1280009 () Bool)

(assert (=> b!1394203 m!1280009))

(declare-fun m!1280011 () Bool)

(assert (=> b!1394203 m!1280011))

(declare-fun m!1280013 () Bool)

(assert (=> b!1394203 m!1280013))

(assert (=> b!1394203 m!1280005))

(declare-fun m!1280015 () Bool)

(assert (=> b!1394203 m!1280015))

(assert (=> b!1394205 m!1280005))

(assert (=> b!1394205 m!1280005))

(declare-fun m!1280017 () Bool)

(assert (=> b!1394205 m!1280017))

(declare-fun m!1280019 () Bool)

(assert (=> b!1394198 m!1280019))

(assert (=> b!1394198 m!1280019))

(declare-fun m!1280021 () Bool)

(assert (=> b!1394198 m!1280021))

(declare-fun m!1280023 () Bool)

(assert (=> b!1394201 m!1280023))

(assert (=> b!1394201 m!1280023))

(declare-fun m!1280025 () Bool)

(assert (=> b!1394201 m!1280025))

(declare-fun m!1280027 () Bool)

(assert (=> b!1394201 m!1280027))

(declare-fun m!1280029 () Bool)

(assert (=> b!1394201 m!1280029))

(declare-fun m!1280031 () Bool)

(assert (=> start!119690 m!1280031))

(declare-fun m!1280033 () Bool)

(assert (=> start!119690 m!1280033))

(declare-fun m!1280035 () Bool)

(assert (=> b!1394199 m!1280035))

(check-sat (not b!1394198) (not b!1394205) (not b!1394201) (not start!119690) (not b!1394204) (not b!1394202) (not b!1394203) (not b!1394199))
(check-sat)
