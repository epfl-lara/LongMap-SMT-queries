; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120242 () Bool)

(assert start!120242)

(declare-fun b!1398829 () Bool)

(declare-fun res!937064 () Bool)

(declare-fun e!792010 () Bool)

(assert (=> b!1398829 (=> (not res!937064) (not e!792010))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95693 0))(
  ( (array!95694 (arr!46198 (Array (_ BitVec 32) (_ BitVec 64))) (size!46749 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95693)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398829 (= res!937064 (and (= (size!46749 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46749 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46749 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!792007 () Bool)

(declare-fun b!1398830 () Bool)

(declare-datatypes ((SeekEntryResult!10418 0))(
  ( (MissingZero!10418 (index!44043 (_ BitVec 32))) (Found!10418 (index!44044 (_ BitVec 32))) (Intermediate!10418 (undefined!11230 Bool) (index!44045 (_ BitVec 32)) (x!125851 (_ BitVec 32))) (Undefined!10418) (MissingVacant!10418 (index!44046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95693 (_ BitVec 32)) SeekEntryResult!10418)

(assert (=> b!1398830 (= e!792007 (= (seekEntryOrOpen!0 (select (arr!46198 a!2901) j!112) a!2901 mask!2840) (Found!10418 j!112)))))

(declare-fun b!1398831 () Bool)

(declare-fun res!937063 () Bool)

(assert (=> b!1398831 (=> (not res!937063) (not e!792010))))

(declare-datatypes ((List!32704 0))(
  ( (Nil!32701) (Cons!32700 (h!33950 (_ BitVec 64)) (t!47390 List!32704)) )
))
(declare-fun arrayNoDuplicates!0 (array!95693 (_ BitVec 32) List!32704) Bool)

(assert (=> b!1398831 (= res!937063 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32701))))

(declare-fun b!1398832 () Bool)

(declare-fun e!792011 () Bool)

(assert (=> b!1398832 (= e!792010 (not e!792011))))

(declare-fun res!937066 () Bool)

(assert (=> b!1398832 (=> res!937066 e!792011)))

(declare-fun lt!614797 () SeekEntryResult!10418)

(get-info :version)

(assert (=> b!1398832 (= res!937066 (or (not ((_ is Intermediate!10418) lt!614797)) (undefined!11230 lt!614797)))))

(assert (=> b!1398832 e!792007))

(declare-fun res!937061 () Bool)

(assert (=> b!1398832 (=> (not res!937061) (not e!792007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95693 (_ BitVec 32)) Bool)

(assert (=> b!1398832 (= res!937061 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46867 0))(
  ( (Unit!46868) )
))
(declare-fun lt!614798 () Unit!46867)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46867)

(assert (=> b!1398832 (= lt!614798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614796 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95693 (_ BitVec 32)) SeekEntryResult!10418)

(assert (=> b!1398832 (= lt!614797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614796 (select (arr!46198 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398832 (= lt!614796 (toIndex!0 (select (arr!46198 a!2901) j!112) mask!2840))))

(declare-fun b!1398833 () Bool)

(declare-fun res!937060 () Bool)

(assert (=> b!1398833 (=> (not res!937060) (not e!792010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398833 (= res!937060 (validKeyInArray!0 (select (arr!46198 a!2901) i!1037)))))

(declare-fun b!1398834 () Bool)

(declare-fun res!937062 () Bool)

(assert (=> b!1398834 (=> (not res!937062) (not e!792010))))

(assert (=> b!1398834 (= res!937062 (validKeyInArray!0 (select (arr!46198 a!2901) j!112)))))

(declare-fun res!937059 () Bool)

(assert (=> start!120242 (=> (not res!937059) (not e!792010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120242 (= res!937059 (validMask!0 mask!2840))))

(assert (=> start!120242 e!792010))

(assert (=> start!120242 true))

(declare-fun array_inv!35479 (array!95693) Bool)

(assert (=> start!120242 (array_inv!35479 a!2901)))

(declare-fun b!1398835 () Bool)

(declare-fun e!792008 () Bool)

(assert (=> b!1398835 (= e!792008 true)))

(declare-fun lt!614799 () array!95693)

(declare-fun lt!614800 () (_ BitVec 64))

(declare-fun lt!614801 () SeekEntryResult!10418)

(assert (=> b!1398835 (= lt!614801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614796 lt!614800 lt!614799 mask!2840))))

(declare-fun b!1398836 () Bool)

(declare-fun res!937058 () Bool)

(assert (=> b!1398836 (=> (not res!937058) (not e!792010))))

(assert (=> b!1398836 (= res!937058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398837 () Bool)

(assert (=> b!1398837 (= e!792011 e!792008)))

(declare-fun res!937065 () Bool)

(assert (=> b!1398837 (=> res!937065 e!792008)))

(declare-fun lt!614795 () SeekEntryResult!10418)

(assert (=> b!1398837 (= res!937065 (or (= lt!614797 lt!614795) (not ((_ is Intermediate!10418) lt!614795)) (bvslt (x!125851 lt!614797) #b00000000000000000000000000000000) (bvsgt (x!125851 lt!614797) #b01111111111111111111111111111110) (bvslt lt!614796 #b00000000000000000000000000000000) (bvsge lt!614796 (size!46749 a!2901)) (bvslt (index!44045 lt!614797) #b00000000000000000000000000000000) (bvsge (index!44045 lt!614797) (size!46749 a!2901)) (not (= lt!614797 (Intermediate!10418 false (index!44045 lt!614797) (x!125851 lt!614797)))) (not (= lt!614795 (Intermediate!10418 (undefined!11230 lt!614795) (index!44045 lt!614795) (x!125851 lt!614795))))))))

(assert (=> b!1398837 (= lt!614795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614800 mask!2840) lt!614800 lt!614799 mask!2840))))

(assert (=> b!1398837 (= lt!614800 (select (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398837 (= lt!614799 (array!95694 (store (arr!46198 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46749 a!2901)))))

(assert (= (and start!120242 res!937059) b!1398829))

(assert (= (and b!1398829 res!937064) b!1398833))

(assert (= (and b!1398833 res!937060) b!1398834))

(assert (= (and b!1398834 res!937062) b!1398836))

(assert (= (and b!1398836 res!937058) b!1398831))

(assert (= (and b!1398831 res!937063) b!1398832))

(assert (= (and b!1398832 res!937061) b!1398830))

(assert (= (and b!1398832 (not res!937066)) b!1398837))

(assert (= (and b!1398837 (not res!937065)) b!1398835))

(declare-fun m!1285915 () Bool)

(assert (=> b!1398835 m!1285915))

(declare-fun m!1285917 () Bool)

(assert (=> b!1398832 m!1285917))

(declare-fun m!1285919 () Bool)

(assert (=> b!1398832 m!1285919))

(assert (=> b!1398832 m!1285917))

(declare-fun m!1285921 () Bool)

(assert (=> b!1398832 m!1285921))

(assert (=> b!1398832 m!1285917))

(declare-fun m!1285923 () Bool)

(assert (=> b!1398832 m!1285923))

(declare-fun m!1285925 () Bool)

(assert (=> b!1398832 m!1285925))

(assert (=> b!1398830 m!1285917))

(assert (=> b!1398830 m!1285917))

(declare-fun m!1285927 () Bool)

(assert (=> b!1398830 m!1285927))

(declare-fun m!1285929 () Bool)

(assert (=> b!1398831 m!1285929))

(declare-fun m!1285931 () Bool)

(assert (=> b!1398833 m!1285931))

(assert (=> b!1398833 m!1285931))

(declare-fun m!1285933 () Bool)

(assert (=> b!1398833 m!1285933))

(declare-fun m!1285935 () Bool)

(assert (=> b!1398837 m!1285935))

(assert (=> b!1398837 m!1285935))

(declare-fun m!1285937 () Bool)

(assert (=> b!1398837 m!1285937))

(declare-fun m!1285939 () Bool)

(assert (=> b!1398837 m!1285939))

(declare-fun m!1285941 () Bool)

(assert (=> b!1398837 m!1285941))

(declare-fun m!1285943 () Bool)

(assert (=> b!1398836 m!1285943))

(assert (=> b!1398834 m!1285917))

(assert (=> b!1398834 m!1285917))

(declare-fun m!1285945 () Bool)

(assert (=> b!1398834 m!1285945))

(declare-fun m!1285947 () Bool)

(assert (=> start!120242 m!1285947))

(declare-fun m!1285949 () Bool)

(assert (=> start!120242 m!1285949))

(check-sat (not b!1398831) (not b!1398830) (not b!1398833) (not b!1398837) (not b!1398834) (not b!1398832) (not b!1398836) (not b!1398835) (not start!120242))
(check-sat)
