; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120074 () Bool)

(assert start!120074)

(declare-fun b!1397960 () Bool)

(declare-fun res!936872 () Bool)

(declare-fun e!791422 () Bool)

(assert (=> b!1397960 (=> (not res!936872) (not e!791422))))

(declare-datatypes ((array!95603 0))(
  ( (array!95604 (arr!46155 (Array (_ BitVec 32) (_ BitVec 64))) (size!46705 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95603)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397960 (= res!936872 (validKeyInArray!0 (select (arr!46155 a!2901) i!1037)))))

(declare-fun b!1397961 () Bool)

(declare-fun res!936880 () Bool)

(assert (=> b!1397961 (=> (not res!936880) (not e!791422))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95603 (_ BitVec 32)) Bool)

(assert (=> b!1397961 (= res!936880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397962 () Bool)

(declare-fun res!936876 () Bool)

(assert (=> b!1397962 (=> (not res!936876) (not e!791422))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397962 (= res!936876 (validKeyInArray!0 (select (arr!46155 a!2901) j!112)))))

(declare-fun b!1397963 () Bool)

(declare-fun res!936877 () Bool)

(assert (=> b!1397963 (=> (not res!936877) (not e!791422))))

(declare-datatypes ((List!32674 0))(
  ( (Nil!32671) (Cons!32670 (h!33912 (_ BitVec 64)) (t!47368 List!32674)) )
))
(declare-fun arrayNoDuplicates!0 (array!95603 (_ BitVec 32) List!32674) Bool)

(assert (=> b!1397963 (= res!936877 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32671))))

(declare-fun b!1397964 () Bool)

(declare-fun e!791419 () Bool)

(assert (=> b!1397964 (= e!791419 true)))

(declare-fun lt!614610 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10472 0))(
  ( (MissingZero!10472 (index!44259 (_ BitVec 32))) (Found!10472 (index!44260 (_ BitVec 32))) (Intermediate!10472 (undefined!11284 Bool) (index!44261 (_ BitVec 32)) (x!125910 (_ BitVec 32))) (Undefined!10472) (MissingVacant!10472 (index!44262 (_ BitVec 32))) )
))
(declare-fun lt!614611 () SeekEntryResult!10472)

(declare-fun lt!614613 () (_ BitVec 32))

(declare-fun lt!614609 () array!95603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95603 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1397964 (= lt!614611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614613 lt!614610 lt!614609 mask!2840))))

(declare-fun b!1397965 () Bool)

(declare-fun e!791421 () Bool)

(assert (=> b!1397965 (= e!791421 e!791419)))

(declare-fun res!936874 () Bool)

(assert (=> b!1397965 (=> res!936874 e!791419)))

(declare-fun lt!614612 () SeekEntryResult!10472)

(declare-fun lt!614607 () SeekEntryResult!10472)

(get-info :version)

(assert (=> b!1397965 (= res!936874 (or (= lt!614612 lt!614607) (not ((_ is Intermediate!10472) lt!614607)) (bvslt (x!125910 lt!614612) #b00000000000000000000000000000000) (bvsgt (x!125910 lt!614612) #b01111111111111111111111111111110) (bvslt lt!614613 #b00000000000000000000000000000000) (bvsge lt!614613 (size!46705 a!2901)) (bvslt (index!44261 lt!614612) #b00000000000000000000000000000000) (bvsge (index!44261 lt!614612) (size!46705 a!2901)) (not (= lt!614612 (Intermediate!10472 false (index!44261 lt!614612) (x!125910 lt!614612)))) (not (= lt!614607 (Intermediate!10472 (undefined!11284 lt!614607) (index!44261 lt!614607) (x!125910 lt!614607))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397965 (= lt!614607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614610 mask!2840) lt!614610 lt!614609 mask!2840))))

(assert (=> b!1397965 (= lt!614610 (select (store (arr!46155 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397965 (= lt!614609 (array!95604 (store (arr!46155 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46705 a!2901)))))

(declare-fun b!1397966 () Bool)

(assert (=> b!1397966 (= e!791422 (not e!791421))))

(declare-fun res!936875 () Bool)

(assert (=> b!1397966 (=> res!936875 e!791421)))

(assert (=> b!1397966 (= res!936875 (or (not ((_ is Intermediate!10472) lt!614612)) (undefined!11284 lt!614612)))))

(declare-fun e!791420 () Bool)

(assert (=> b!1397966 e!791420))

(declare-fun res!936878 () Bool)

(assert (=> b!1397966 (=> (not res!936878) (not e!791420))))

(assert (=> b!1397966 (= res!936878 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46948 0))(
  ( (Unit!46949) )
))
(declare-fun lt!614608 () Unit!46948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46948)

(assert (=> b!1397966 (= lt!614608 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397966 (= lt!614612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614613 (select (arr!46155 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397966 (= lt!614613 (toIndex!0 (select (arr!46155 a!2901) j!112) mask!2840))))

(declare-fun b!1397967 () Bool)

(declare-fun res!936873 () Bool)

(assert (=> b!1397967 (=> (not res!936873) (not e!791422))))

(assert (=> b!1397967 (= res!936873 (and (= (size!46705 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46705 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46705 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!936879 () Bool)

(assert (=> start!120074 (=> (not res!936879) (not e!791422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120074 (= res!936879 (validMask!0 mask!2840))))

(assert (=> start!120074 e!791422))

(assert (=> start!120074 true))

(declare-fun array_inv!35183 (array!95603) Bool)

(assert (=> start!120074 (array_inv!35183 a!2901)))

(declare-fun b!1397959 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95603 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1397959 (= e!791420 (= (seekEntryOrOpen!0 (select (arr!46155 a!2901) j!112) a!2901 mask!2840) (Found!10472 j!112)))))

(assert (= (and start!120074 res!936879) b!1397967))

(assert (= (and b!1397967 res!936873) b!1397960))

(assert (= (and b!1397960 res!936872) b!1397962))

(assert (= (and b!1397962 res!936876) b!1397961))

(assert (= (and b!1397961 res!936880) b!1397963))

(assert (= (and b!1397963 res!936877) b!1397966))

(assert (= (and b!1397966 res!936878) b!1397959))

(assert (= (and b!1397966 (not res!936875)) b!1397965))

(assert (= (and b!1397965 (not res!936874)) b!1397964))

(declare-fun m!1284903 () Bool)

(assert (=> start!120074 m!1284903))

(declare-fun m!1284905 () Bool)

(assert (=> start!120074 m!1284905))

(declare-fun m!1284907 () Bool)

(assert (=> b!1397962 m!1284907))

(assert (=> b!1397962 m!1284907))

(declare-fun m!1284909 () Bool)

(assert (=> b!1397962 m!1284909))

(declare-fun m!1284911 () Bool)

(assert (=> b!1397961 m!1284911))

(declare-fun m!1284913 () Bool)

(assert (=> b!1397965 m!1284913))

(assert (=> b!1397965 m!1284913))

(declare-fun m!1284915 () Bool)

(assert (=> b!1397965 m!1284915))

(declare-fun m!1284917 () Bool)

(assert (=> b!1397965 m!1284917))

(declare-fun m!1284919 () Bool)

(assert (=> b!1397965 m!1284919))

(declare-fun m!1284921 () Bool)

(assert (=> b!1397960 m!1284921))

(assert (=> b!1397960 m!1284921))

(declare-fun m!1284923 () Bool)

(assert (=> b!1397960 m!1284923))

(assert (=> b!1397966 m!1284907))

(declare-fun m!1284925 () Bool)

(assert (=> b!1397966 m!1284925))

(assert (=> b!1397966 m!1284907))

(declare-fun m!1284927 () Bool)

(assert (=> b!1397966 m!1284927))

(assert (=> b!1397966 m!1284907))

(declare-fun m!1284929 () Bool)

(assert (=> b!1397966 m!1284929))

(declare-fun m!1284931 () Bool)

(assert (=> b!1397966 m!1284931))

(declare-fun m!1284933 () Bool)

(assert (=> b!1397963 m!1284933))

(assert (=> b!1397959 m!1284907))

(assert (=> b!1397959 m!1284907))

(declare-fun m!1284935 () Bool)

(assert (=> b!1397959 m!1284935))

(declare-fun m!1284937 () Bool)

(assert (=> b!1397964 m!1284937))

(check-sat (not b!1397966) (not b!1397959) (not b!1397964) (not b!1397962) (not start!120074) (not b!1397965) (not b!1397961) (not b!1397960) (not b!1397963))
(check-sat)
