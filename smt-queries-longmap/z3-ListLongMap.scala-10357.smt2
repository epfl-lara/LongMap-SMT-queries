; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122144 () Bool)

(assert start!122144)

(declare-fun b!1416444 () Bool)

(declare-fun res!951807 () Bool)

(declare-fun e!801754 () Bool)

(assert (=> b!1416444 (=> (not res!951807) (not e!801754))))

(declare-datatypes ((array!96752 0))(
  ( (array!96753 (arr!46705 (Array (_ BitVec 32) (_ BitVec 64))) (size!47256 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96752)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416444 (= res!951807 (validKeyInArray!0 (select (arr!46705 a!2901) i!1037)))))

(declare-fun b!1416445 () Bool)

(declare-fun e!801757 () Bool)

(assert (=> b!1416445 (= e!801757 true)))

(declare-fun e!801755 () Bool)

(assert (=> b!1416445 e!801755))

(declare-fun res!951805 () Bool)

(assert (=> b!1416445 (=> (not res!951805) (not e!801755))))

(declare-datatypes ((SeekEntryResult!10919 0))(
  ( (MissingZero!10919 (index!46068 (_ BitVec 32))) (Found!10919 (index!46069 (_ BitVec 32))) (Intermediate!10919 (undefined!11731 Bool) (index!46070 (_ BitVec 32)) (x!127833 (_ BitVec 32))) (Undefined!10919) (MissingVacant!10919 (index!46071 (_ BitVec 32))) )
))
(declare-fun lt!624447 () SeekEntryResult!10919)

(declare-fun lt!624448 () SeekEntryResult!10919)

(assert (=> b!1416445 (= res!951805 (and (not (undefined!11731 lt!624448)) (= (index!46070 lt!624448) i!1037) (bvslt (x!127833 lt!624448) (x!127833 lt!624447)) (= (select (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46070 lt!624448)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47839 0))(
  ( (Unit!47840) )
))
(declare-fun lt!624446 () Unit!47839)

(declare-fun lt!624449 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47839)

(assert (=> b!1416445 (= lt!624446 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624449 (x!127833 lt!624447) (index!46070 lt!624447) (x!127833 lt!624448) (index!46070 lt!624448) (undefined!11731 lt!624448) mask!2840))))

(declare-fun b!1416446 () Bool)

(declare-fun e!801758 () Bool)

(assert (=> b!1416446 (= e!801758 e!801757)))

(declare-fun res!951809 () Bool)

(assert (=> b!1416446 (=> res!951809 e!801757)))

(get-info :version)

(assert (=> b!1416446 (= res!951809 (or (= lt!624447 lt!624448) (not ((_ is Intermediate!10919) lt!624448))))))

(declare-fun lt!624451 () array!96752)

(declare-fun lt!624452 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96752 (_ BitVec 32)) SeekEntryResult!10919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416446 (= lt!624448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624452 mask!2840) lt!624452 lt!624451 mask!2840))))

(assert (=> b!1416446 (= lt!624452 (select (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416446 (= lt!624451 (array!96753 (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47256 a!2901)))))

(declare-fun b!1416447 () Bool)

(assert (=> b!1416447 (= e!801754 (not e!801758))))

(declare-fun res!951802 () Bool)

(assert (=> b!1416447 (=> res!951802 e!801758)))

(assert (=> b!1416447 (= res!951802 (or (not ((_ is Intermediate!10919) lt!624447)) (undefined!11731 lt!624447)))))

(declare-fun e!801753 () Bool)

(assert (=> b!1416447 e!801753))

(declare-fun res!951806 () Bool)

(assert (=> b!1416447 (=> (not res!951806) (not e!801753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96752 (_ BitVec 32)) Bool)

(assert (=> b!1416447 (= res!951806 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624450 () Unit!47839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47839)

(assert (=> b!1416447 (= lt!624450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416447 (= lt!624447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624449 (select (arr!46705 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416447 (= lt!624449 (toIndex!0 (select (arr!46705 a!2901) j!112) mask!2840))))

(declare-fun b!1416448 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96752 (_ BitVec 32)) SeekEntryResult!10919)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96752 (_ BitVec 32)) SeekEntryResult!10919)

(assert (=> b!1416448 (= e!801755 (= (seekEntryOrOpen!0 lt!624452 lt!624451 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127833 lt!624448) (index!46070 lt!624448) (index!46070 lt!624448) (select (arr!46705 a!2901) j!112) lt!624451 mask!2840)))))

(declare-fun b!1416449 () Bool)

(declare-fun res!951811 () Bool)

(assert (=> b!1416449 (=> (not res!951811) (not e!801754))))

(assert (=> b!1416449 (= res!951811 (and (= (size!47256 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47256 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47256 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416450 () Bool)

(declare-fun res!951808 () Bool)

(assert (=> b!1416450 (=> (not res!951808) (not e!801754))))

(assert (=> b!1416450 (= res!951808 (validKeyInArray!0 (select (arr!46705 a!2901) j!112)))))

(declare-fun b!1416451 () Bool)

(declare-fun res!951804 () Bool)

(assert (=> b!1416451 (=> (not res!951804) (not e!801754))))

(declare-datatypes ((List!33211 0))(
  ( (Nil!33208) (Cons!33207 (h!34502 (_ BitVec 64)) (t!47897 List!33211)) )
))
(declare-fun arrayNoDuplicates!0 (array!96752 (_ BitVec 32) List!33211) Bool)

(assert (=> b!1416451 (= res!951804 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33208))))

(declare-fun res!951810 () Bool)

(assert (=> start!122144 (=> (not res!951810) (not e!801754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122144 (= res!951810 (validMask!0 mask!2840))))

(assert (=> start!122144 e!801754))

(assert (=> start!122144 true))

(declare-fun array_inv!35986 (array!96752) Bool)

(assert (=> start!122144 (array_inv!35986 a!2901)))

(declare-fun b!1416452 () Bool)

(declare-fun res!951803 () Bool)

(assert (=> b!1416452 (=> (not res!951803) (not e!801754))))

(assert (=> b!1416452 (= res!951803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416453 () Bool)

(assert (=> b!1416453 (= e!801753 (= (seekEntryOrOpen!0 (select (arr!46705 a!2901) j!112) a!2901 mask!2840) (Found!10919 j!112)))))

(assert (= (and start!122144 res!951810) b!1416449))

(assert (= (and b!1416449 res!951811) b!1416444))

(assert (= (and b!1416444 res!951807) b!1416450))

(assert (= (and b!1416450 res!951808) b!1416452))

(assert (= (and b!1416452 res!951803) b!1416451))

(assert (= (and b!1416451 res!951804) b!1416447))

(assert (= (and b!1416447 res!951806) b!1416453))

(assert (= (and b!1416447 (not res!951802)) b!1416446))

(assert (= (and b!1416446 (not res!951809)) b!1416445))

(assert (= (and b!1416445 res!951805) b!1416448))

(declare-fun m!1306903 () Bool)

(assert (=> b!1416450 m!1306903))

(assert (=> b!1416450 m!1306903))

(declare-fun m!1306905 () Bool)

(assert (=> b!1416450 m!1306905))

(declare-fun m!1306907 () Bool)

(assert (=> start!122144 m!1306907))

(declare-fun m!1306909 () Bool)

(assert (=> start!122144 m!1306909))

(assert (=> b!1416453 m!1306903))

(assert (=> b!1416453 m!1306903))

(declare-fun m!1306911 () Bool)

(assert (=> b!1416453 m!1306911))

(declare-fun m!1306913 () Bool)

(assert (=> b!1416446 m!1306913))

(assert (=> b!1416446 m!1306913))

(declare-fun m!1306915 () Bool)

(assert (=> b!1416446 m!1306915))

(declare-fun m!1306917 () Bool)

(assert (=> b!1416446 m!1306917))

(declare-fun m!1306919 () Bool)

(assert (=> b!1416446 m!1306919))

(declare-fun m!1306921 () Bool)

(assert (=> b!1416448 m!1306921))

(assert (=> b!1416448 m!1306903))

(assert (=> b!1416448 m!1306903))

(declare-fun m!1306923 () Bool)

(assert (=> b!1416448 m!1306923))

(declare-fun m!1306925 () Bool)

(assert (=> b!1416444 m!1306925))

(assert (=> b!1416444 m!1306925))

(declare-fun m!1306927 () Bool)

(assert (=> b!1416444 m!1306927))

(assert (=> b!1416445 m!1306917))

(declare-fun m!1306929 () Bool)

(assert (=> b!1416445 m!1306929))

(declare-fun m!1306931 () Bool)

(assert (=> b!1416445 m!1306931))

(assert (=> b!1416447 m!1306903))

(declare-fun m!1306933 () Bool)

(assert (=> b!1416447 m!1306933))

(assert (=> b!1416447 m!1306903))

(declare-fun m!1306935 () Bool)

(assert (=> b!1416447 m!1306935))

(assert (=> b!1416447 m!1306903))

(declare-fun m!1306937 () Bool)

(assert (=> b!1416447 m!1306937))

(declare-fun m!1306939 () Bool)

(assert (=> b!1416447 m!1306939))

(declare-fun m!1306941 () Bool)

(assert (=> b!1416452 m!1306941))

(declare-fun m!1306943 () Bool)

(assert (=> b!1416451 m!1306943))

(check-sat (not start!122144) (not b!1416446) (not b!1416453) (not b!1416447) (not b!1416451) (not b!1416445) (not b!1416444) (not b!1416452) (not b!1416448) (not b!1416450))
(check-sat)
