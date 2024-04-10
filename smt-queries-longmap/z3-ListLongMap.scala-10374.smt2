; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122114 () Bool)

(assert start!122114)

(declare-fun b!1417046 () Bool)

(declare-fun res!952924 () Bool)

(declare-fun e!801995 () Bool)

(assert (=> b!1417046 (=> (not res!952924) (not e!801995))))

(declare-datatypes ((array!96749 0))(
  ( (array!96750 (arr!46704 (Array (_ BitVec 32) (_ BitVec 64))) (size!47254 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96749)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417046 (= res!952924 (validKeyInArray!0 (select (arr!46704 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!801992 () Bool)

(declare-fun b!1417047 () Bool)

(declare-datatypes ((SeekEntryResult!11015 0))(
  ( (MissingZero!11015 (index!46452 (_ BitVec 32))) (Found!11015 (index!46453 (_ BitVec 32))) (Intermediate!11015 (undefined!11827 Bool) (index!46454 (_ BitVec 32)) (x!128052 (_ BitVec 32))) (Undefined!11015) (MissingVacant!11015 (index!46455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96749 (_ BitVec 32)) SeekEntryResult!11015)

(assert (=> b!1417047 (= e!801992 (= (seekEntryOrOpen!0 (select (arr!46704 a!2901) j!112) a!2901 mask!2840) (Found!11015 j!112)))))

(declare-fun b!1417048 () Bool)

(declare-fun e!801993 () Bool)

(assert (=> b!1417048 (= e!801993 true)))

(declare-fun lt!625214 () SeekEntryResult!11015)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96749 (_ BitVec 32)) SeekEntryResult!11015)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417048 (= lt!625214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46704 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46704 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96750 (store (arr!46704 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47254 a!2901)) mask!2840))))

(declare-fun b!1417049 () Bool)

(declare-fun res!952925 () Bool)

(assert (=> b!1417049 (=> (not res!952925) (not e!801995))))

(assert (=> b!1417049 (= res!952925 (and (= (size!47254 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47254 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47254 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952930 () Bool)

(assert (=> start!122114 (=> (not res!952930) (not e!801995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122114 (= res!952930 (validMask!0 mask!2840))))

(assert (=> start!122114 e!801995))

(assert (=> start!122114 true))

(declare-fun array_inv!35732 (array!96749) Bool)

(assert (=> start!122114 (array_inv!35732 a!2901)))

(declare-fun b!1417050 () Bool)

(assert (=> b!1417050 (= e!801995 (not e!801993))))

(declare-fun res!952926 () Bool)

(assert (=> b!1417050 (=> res!952926 e!801993)))

(declare-fun lt!625215 () SeekEntryResult!11015)

(get-info :version)

(assert (=> b!1417050 (= res!952926 (or (not ((_ is Intermediate!11015) lt!625215)) (undefined!11827 lt!625215)))))

(assert (=> b!1417050 e!801992))

(declare-fun res!952928 () Bool)

(assert (=> b!1417050 (=> (not res!952928) (not e!801992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96749 (_ BitVec 32)) Bool)

(assert (=> b!1417050 (= res!952928 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48004 0))(
  ( (Unit!48005) )
))
(declare-fun lt!625213 () Unit!48004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48004)

(assert (=> b!1417050 (= lt!625213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417050 (= lt!625215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46704 a!2901) j!112) mask!2840) (select (arr!46704 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417051 () Bool)

(declare-fun res!952923 () Bool)

(assert (=> b!1417051 (=> (not res!952923) (not e!801995))))

(declare-datatypes ((List!33223 0))(
  ( (Nil!33220) (Cons!33219 (h!34509 (_ BitVec 64)) (t!47917 List!33223)) )
))
(declare-fun arrayNoDuplicates!0 (array!96749 (_ BitVec 32) List!33223) Bool)

(assert (=> b!1417051 (= res!952923 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33220))))

(declare-fun b!1417052 () Bool)

(declare-fun res!952927 () Bool)

(assert (=> b!1417052 (=> (not res!952927) (not e!801995))))

(assert (=> b!1417052 (= res!952927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417053 () Bool)

(declare-fun res!952929 () Bool)

(assert (=> b!1417053 (=> (not res!952929) (not e!801995))))

(assert (=> b!1417053 (= res!952929 (validKeyInArray!0 (select (arr!46704 a!2901) i!1037)))))

(assert (= (and start!122114 res!952930) b!1417049))

(assert (= (and b!1417049 res!952925) b!1417053))

(assert (= (and b!1417053 res!952929) b!1417046))

(assert (= (and b!1417046 res!952924) b!1417052))

(assert (= (and b!1417052 res!952927) b!1417051))

(assert (= (and b!1417051 res!952923) b!1417050))

(assert (= (and b!1417050 res!952928) b!1417047))

(assert (= (and b!1417050 (not res!952926)) b!1417048))

(declare-fun m!1307815 () Bool)

(assert (=> start!122114 m!1307815))

(declare-fun m!1307817 () Bool)

(assert (=> start!122114 m!1307817))

(declare-fun m!1307819 () Bool)

(assert (=> b!1417053 m!1307819))

(assert (=> b!1417053 m!1307819))

(declare-fun m!1307821 () Bool)

(assert (=> b!1417053 m!1307821))

(declare-fun m!1307823 () Bool)

(assert (=> b!1417046 m!1307823))

(assert (=> b!1417046 m!1307823))

(declare-fun m!1307825 () Bool)

(assert (=> b!1417046 m!1307825))

(assert (=> b!1417050 m!1307823))

(declare-fun m!1307827 () Bool)

(assert (=> b!1417050 m!1307827))

(assert (=> b!1417050 m!1307823))

(declare-fun m!1307829 () Bool)

(assert (=> b!1417050 m!1307829))

(assert (=> b!1417050 m!1307827))

(assert (=> b!1417050 m!1307823))

(declare-fun m!1307831 () Bool)

(assert (=> b!1417050 m!1307831))

(declare-fun m!1307833 () Bool)

(assert (=> b!1417050 m!1307833))

(assert (=> b!1417047 m!1307823))

(assert (=> b!1417047 m!1307823))

(declare-fun m!1307835 () Bool)

(assert (=> b!1417047 m!1307835))

(declare-fun m!1307837 () Bool)

(assert (=> b!1417048 m!1307837))

(declare-fun m!1307839 () Bool)

(assert (=> b!1417048 m!1307839))

(assert (=> b!1417048 m!1307839))

(declare-fun m!1307841 () Bool)

(assert (=> b!1417048 m!1307841))

(assert (=> b!1417048 m!1307841))

(assert (=> b!1417048 m!1307839))

(declare-fun m!1307843 () Bool)

(assert (=> b!1417048 m!1307843))

(declare-fun m!1307845 () Bool)

(assert (=> b!1417052 m!1307845))

(declare-fun m!1307847 () Bool)

(assert (=> b!1417051 m!1307847))

(check-sat (not b!1417052) (not b!1417053) (not b!1417051) (not b!1417050) (not start!122114) (not b!1417048) (not b!1417046) (not b!1417047))
