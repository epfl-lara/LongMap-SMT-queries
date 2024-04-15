; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123254 () Bool)

(assert start!123254)

(declare-fun b!1429212 () Bool)

(declare-fun e!807046 () Bool)

(assert (=> b!1429212 (= e!807046 (not true))))

(declare-fun e!807047 () Bool)

(assert (=> b!1429212 e!807047))

(declare-fun res!963895 () Bool)

(assert (=> b!1429212 (=> (not res!963895) (not e!807047))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97368 0))(
  ( (array!97369 (arr!46996 (Array (_ BitVec 32) (_ BitVec 64))) (size!47548 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97368)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97368 (_ BitVec 32)) Bool)

(assert (=> b!1429212 (= res!963895 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48189 0))(
  ( (Unit!48190) )
))
(declare-fun lt!629120 () Unit!48189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48189)

(assert (=> b!1429212 (= lt!629120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429213 () Bool)

(declare-fun res!963900 () Bool)

(declare-fun e!807043 () Bool)

(assert (=> b!1429213 (=> (not res!963900) (not e!807043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429213 (= res!963900 (validKeyInArray!0 (select (arr!46996 a!2831) j!81)))))

(declare-fun b!1429214 () Bool)

(declare-fun res!963894 () Bool)

(assert (=> b!1429214 (=> (not res!963894) (not e!807046))))

(declare-fun lt!629119 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11302 0))(
  ( (MissingZero!11302 (index!47600 (_ BitVec 32))) (Found!11302 (index!47601 (_ BitVec 32))) (Intermediate!11302 (undefined!12114 Bool) (index!47602 (_ BitVec 32)) (x!129229 (_ BitVec 32))) (Undefined!11302) (MissingVacant!11302 (index!47603 (_ BitVec 32))) )
))
(declare-fun lt!629121 () SeekEntryResult!11302)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!629122 () array!97368)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97368 (_ BitVec 32)) SeekEntryResult!11302)

(assert (=> b!1429214 (= res!963894 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629119 lt!629122 mask!2608) lt!629121))))

(declare-fun b!1429215 () Bool)

(declare-fun res!963897 () Bool)

(assert (=> b!1429215 (=> (not res!963897) (not e!807046))))

(declare-fun lt!629123 () SeekEntryResult!11302)

(assert (=> b!1429215 (= res!963897 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46996 a!2831) j!81) a!2831 mask!2608) lt!629123))))

(declare-fun b!1429216 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97368 (_ BitVec 32)) SeekEntryResult!11302)

(assert (=> b!1429216 (= e!807047 (= (seekEntryOrOpen!0 (select (arr!46996 a!2831) j!81) a!2831 mask!2608) (Found!11302 j!81)))))

(declare-fun b!1429217 () Bool)

(declare-fun e!807044 () Bool)

(assert (=> b!1429217 (= e!807044 e!807046)))

(declare-fun res!963903 () Bool)

(assert (=> b!1429217 (=> (not res!963903) (not e!807046))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429217 (= res!963903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629119 mask!2608) lt!629119 lt!629122 mask!2608) lt!629121))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429217 (= lt!629121 (Intermediate!11302 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429217 (= lt!629119 (select (store (arr!46996 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429217 (= lt!629122 (array!97369 (store (arr!46996 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47548 a!2831)))))

(declare-fun b!1429218 () Bool)

(declare-fun res!963904 () Bool)

(assert (=> b!1429218 (=> (not res!963904) (not e!807043))))

(assert (=> b!1429218 (= res!963904 (validKeyInArray!0 (select (arr!46996 a!2831) i!982)))))

(declare-fun b!1429219 () Bool)

(declare-fun res!963896 () Bool)

(assert (=> b!1429219 (=> (not res!963896) (not e!807043))))

(assert (=> b!1429219 (= res!963896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429220 () Bool)

(declare-fun res!963901 () Bool)

(assert (=> b!1429220 (=> (not res!963901) (not e!807043))))

(declare-datatypes ((List!33584 0))(
  ( (Nil!33581) (Cons!33580 (h!34894 (_ BitVec 64)) (t!48270 List!33584)) )
))
(declare-fun arrayNoDuplicates!0 (array!97368 (_ BitVec 32) List!33584) Bool)

(assert (=> b!1429220 (= res!963901 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33581))))

(declare-fun res!963902 () Bool)

(assert (=> start!123254 (=> (not res!963902) (not e!807043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123254 (= res!963902 (validMask!0 mask!2608))))

(assert (=> start!123254 e!807043))

(assert (=> start!123254 true))

(declare-fun array_inv!36229 (array!97368) Bool)

(assert (=> start!123254 (array_inv!36229 a!2831)))

(declare-fun b!1429221 () Bool)

(declare-fun res!963898 () Bool)

(assert (=> b!1429221 (=> (not res!963898) (not e!807043))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429221 (= res!963898 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47548 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47548 a!2831))))))

(declare-fun b!1429222 () Bool)

(assert (=> b!1429222 (= e!807043 e!807044)))

(declare-fun res!963893 () Bool)

(assert (=> b!1429222 (=> (not res!963893) (not e!807044))))

(assert (=> b!1429222 (= res!963893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46996 a!2831) j!81) mask!2608) (select (arr!46996 a!2831) j!81) a!2831 mask!2608) lt!629123))))

(assert (=> b!1429222 (= lt!629123 (Intermediate!11302 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429223 () Bool)

(declare-fun res!963892 () Bool)

(assert (=> b!1429223 (=> (not res!963892) (not e!807046))))

(assert (=> b!1429223 (= res!963892 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429224 () Bool)

(declare-fun res!963899 () Bool)

(assert (=> b!1429224 (=> (not res!963899) (not e!807043))))

(assert (=> b!1429224 (= res!963899 (and (= (size!47548 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47548 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47548 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123254 res!963902) b!1429224))

(assert (= (and b!1429224 res!963899) b!1429218))

(assert (= (and b!1429218 res!963904) b!1429213))

(assert (= (and b!1429213 res!963900) b!1429219))

(assert (= (and b!1429219 res!963896) b!1429220))

(assert (= (and b!1429220 res!963901) b!1429221))

(assert (= (and b!1429221 res!963898) b!1429222))

(assert (= (and b!1429222 res!963893) b!1429217))

(assert (= (and b!1429217 res!963903) b!1429215))

(assert (= (and b!1429215 res!963897) b!1429214))

(assert (= (and b!1429214 res!963894) b!1429223))

(assert (= (and b!1429223 res!963892) b!1429212))

(assert (= (and b!1429212 res!963895) b!1429216))

(declare-fun m!1318845 () Bool)

(assert (=> b!1429213 m!1318845))

(assert (=> b!1429213 m!1318845))

(declare-fun m!1318847 () Bool)

(assert (=> b!1429213 m!1318847))

(assert (=> b!1429215 m!1318845))

(assert (=> b!1429215 m!1318845))

(declare-fun m!1318849 () Bool)

(assert (=> b!1429215 m!1318849))

(declare-fun m!1318851 () Bool)

(assert (=> b!1429212 m!1318851))

(declare-fun m!1318853 () Bool)

(assert (=> b!1429212 m!1318853))

(declare-fun m!1318855 () Bool)

(assert (=> b!1429218 m!1318855))

(assert (=> b!1429218 m!1318855))

(declare-fun m!1318857 () Bool)

(assert (=> b!1429218 m!1318857))

(declare-fun m!1318859 () Bool)

(assert (=> b!1429220 m!1318859))

(declare-fun m!1318861 () Bool)

(assert (=> start!123254 m!1318861))

(declare-fun m!1318863 () Bool)

(assert (=> start!123254 m!1318863))

(declare-fun m!1318865 () Bool)

(assert (=> b!1429219 m!1318865))

(assert (=> b!1429216 m!1318845))

(assert (=> b!1429216 m!1318845))

(declare-fun m!1318867 () Bool)

(assert (=> b!1429216 m!1318867))

(declare-fun m!1318869 () Bool)

(assert (=> b!1429214 m!1318869))

(declare-fun m!1318871 () Bool)

(assert (=> b!1429217 m!1318871))

(assert (=> b!1429217 m!1318871))

(declare-fun m!1318873 () Bool)

(assert (=> b!1429217 m!1318873))

(declare-fun m!1318875 () Bool)

(assert (=> b!1429217 m!1318875))

(declare-fun m!1318877 () Bool)

(assert (=> b!1429217 m!1318877))

(assert (=> b!1429222 m!1318845))

(assert (=> b!1429222 m!1318845))

(declare-fun m!1318879 () Bool)

(assert (=> b!1429222 m!1318879))

(assert (=> b!1429222 m!1318879))

(assert (=> b!1429222 m!1318845))

(declare-fun m!1318881 () Bool)

(assert (=> b!1429222 m!1318881))

(check-sat (not b!1429215) (not b!1429217) (not b!1429219) (not b!1429212) (not start!123254) (not b!1429218) (not b!1429222) (not b!1429214) (not b!1429216) (not b!1429213) (not b!1429220))
(check-sat)
