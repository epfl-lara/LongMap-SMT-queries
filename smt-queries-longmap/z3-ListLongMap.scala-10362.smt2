; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121988 () Bool)

(assert start!121988)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96674 0))(
  ( (array!96675 (arr!46668 (Array (_ BitVec 32) (_ BitVec 64))) (size!47218 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96674)

(declare-fun b!1415798 () Bool)

(declare-fun e!801321 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10979 0))(
  ( (MissingZero!10979 (index!46308 (_ BitVec 32))) (Found!10979 (index!46309 (_ BitVec 32))) (Intermediate!10979 (undefined!11791 Bool) (index!46310 (_ BitVec 32)) (x!127914 (_ BitVec 32))) (Undefined!10979) (MissingVacant!10979 (index!46311 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10979)

(assert (=> b!1415798 (= e!801321 (= (seekEntryOrOpen!0 (select (arr!46668 a!2901) j!112) a!2901 mask!2840) (Found!10979 j!112)))))

(declare-fun b!1415799 () Bool)

(declare-fun e!801320 () Bool)

(declare-fun e!801317 () Bool)

(assert (=> b!1415799 (= e!801320 (not e!801317))))

(declare-fun res!951850 () Bool)

(assert (=> b!1415799 (=> res!951850 e!801317)))

(declare-fun lt!624396 () SeekEntryResult!10979)

(get-info :version)

(assert (=> b!1415799 (= res!951850 (or (not ((_ is Intermediate!10979) lt!624396)) (undefined!11791 lt!624396)))))

(assert (=> b!1415799 e!801321))

(declare-fun res!951848 () Bool)

(assert (=> b!1415799 (=> (not res!951848) (not e!801321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96674 (_ BitVec 32)) Bool)

(assert (=> b!1415799 (= res!951848 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47932 0))(
  ( (Unit!47933) )
))
(declare-fun lt!624393 () Unit!47932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47932)

(assert (=> b!1415799 (= lt!624393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624389 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10979)

(assert (=> b!1415799 (= lt!624396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624389 (select (arr!46668 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415799 (= lt!624389 (toIndex!0 (select (arr!46668 a!2901) j!112) mask!2840))))

(declare-fun res!951843 () Bool)

(assert (=> start!121988 (=> (not res!951843) (not e!801320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121988 (= res!951843 (validMask!0 mask!2840))))

(assert (=> start!121988 e!801320))

(assert (=> start!121988 true))

(declare-fun array_inv!35696 (array!96674) Bool)

(assert (=> start!121988 (array_inv!35696 a!2901)))

(declare-fun b!1415800 () Bool)

(declare-fun e!801322 () Bool)

(assert (=> b!1415800 (= e!801317 e!801322)))

(declare-fun res!951841 () Bool)

(assert (=> b!1415800 (=> res!951841 e!801322)))

(declare-fun lt!624390 () SeekEntryResult!10979)

(assert (=> b!1415800 (= res!951841 (or (= lt!624396 lt!624390) (not ((_ is Intermediate!10979) lt!624390))))))

(declare-fun lt!624395 () (_ BitVec 64))

(declare-fun lt!624391 () array!96674)

(assert (=> b!1415800 (= lt!624390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624395 mask!2840) lt!624395 lt!624391 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415800 (= lt!624395 (select (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415800 (= lt!624391 (array!96675 (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47218 a!2901)))))

(declare-fun b!1415801 () Bool)

(declare-fun res!951846 () Bool)

(assert (=> b!1415801 (=> (not res!951846) (not e!801320))))

(assert (=> b!1415801 (= res!951846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415802 () Bool)

(declare-fun res!951845 () Bool)

(assert (=> b!1415802 (=> (not res!951845) (not e!801320))))

(assert (=> b!1415802 (= res!951845 (and (= (size!47218 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47218 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47218 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415803 () Bool)

(declare-fun res!951844 () Bool)

(assert (=> b!1415803 (=> (not res!951844) (not e!801320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415803 (= res!951844 (validKeyInArray!0 (select (arr!46668 a!2901) j!112)))))

(declare-fun b!1415804 () Bool)

(declare-fun e!801323 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10979)

(assert (=> b!1415804 (= e!801323 (= (seekEntryOrOpen!0 lt!624395 lt!624391 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127914 lt!624390) (index!46310 lt!624390) (index!46310 lt!624390) (select (arr!46668 a!2901) j!112) lt!624391 mask!2840)))))

(declare-fun b!1415805 () Bool)

(declare-fun res!951847 () Bool)

(assert (=> b!1415805 (=> (not res!951847) (not e!801320))))

(declare-datatypes ((List!33187 0))(
  ( (Nil!33184) (Cons!33183 (h!34470 (_ BitVec 64)) (t!47881 List!33187)) )
))
(declare-fun arrayNoDuplicates!0 (array!96674 (_ BitVec 32) List!33187) Bool)

(assert (=> b!1415805 (= res!951847 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33184))))

(declare-fun b!1415806 () Bool)

(declare-fun e!801318 () Bool)

(assert (=> b!1415806 (= e!801322 e!801318)))

(declare-fun res!951842 () Bool)

(assert (=> b!1415806 (=> res!951842 e!801318)))

(assert (=> b!1415806 (= res!951842 (or (bvslt (x!127914 lt!624396) #b00000000000000000000000000000000) (bvsgt (x!127914 lt!624396) #b01111111111111111111111111111110) (bvslt (x!127914 lt!624390) #b00000000000000000000000000000000) (bvsgt (x!127914 lt!624390) #b01111111111111111111111111111110) (bvslt lt!624389 #b00000000000000000000000000000000) (bvsge lt!624389 (size!47218 a!2901)) (bvslt (index!46310 lt!624396) #b00000000000000000000000000000000) (bvsge (index!46310 lt!624396) (size!47218 a!2901)) (bvslt (index!46310 lt!624390) #b00000000000000000000000000000000) (bvsge (index!46310 lt!624390) (size!47218 a!2901)) (not (= lt!624396 (Intermediate!10979 false (index!46310 lt!624396) (x!127914 lt!624396)))) (not (= lt!624390 (Intermediate!10979 false (index!46310 lt!624390) (x!127914 lt!624390))))))))

(assert (=> b!1415806 e!801323))

(declare-fun res!951840 () Bool)

(assert (=> b!1415806 (=> (not res!951840) (not e!801323))))

(assert (=> b!1415806 (= res!951840 (and (not (undefined!11791 lt!624390)) (= (index!46310 lt!624390) i!1037) (bvslt (x!127914 lt!624390) (x!127914 lt!624396)) (= (select (store (arr!46668 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46310 lt!624390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624394 () Unit!47932)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47932)

(assert (=> b!1415806 (= lt!624394 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624389 (x!127914 lt!624396) (index!46310 lt!624396) (x!127914 lt!624390) (index!46310 lt!624390) (undefined!11791 lt!624390) mask!2840))))

(declare-fun b!1415807 () Bool)

(declare-fun res!951849 () Bool)

(assert (=> b!1415807 (=> (not res!951849) (not e!801320))))

(assert (=> b!1415807 (= res!951849 (validKeyInArray!0 (select (arr!46668 a!2901) i!1037)))))

(declare-fun b!1415808 () Bool)

(assert (=> b!1415808 (= e!801318 true)))

(declare-fun lt!624392 () SeekEntryResult!10979)

(assert (=> b!1415808 (= lt!624392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624389 lt!624395 lt!624391 mask!2840))))

(assert (= (and start!121988 res!951843) b!1415802))

(assert (= (and b!1415802 res!951845) b!1415807))

(assert (= (and b!1415807 res!951849) b!1415803))

(assert (= (and b!1415803 res!951844) b!1415801))

(assert (= (and b!1415801 res!951846) b!1415805))

(assert (= (and b!1415805 res!951847) b!1415799))

(assert (= (and b!1415799 res!951848) b!1415798))

(assert (= (and b!1415799 (not res!951850)) b!1415800))

(assert (= (and b!1415800 (not res!951841)) b!1415806))

(assert (= (and b!1415806 res!951840) b!1415804))

(assert (= (and b!1415806 (not res!951842)) b!1415808))

(declare-fun m!1306211 () Bool)

(assert (=> start!121988 m!1306211))

(declare-fun m!1306213 () Bool)

(assert (=> start!121988 m!1306213))

(declare-fun m!1306215 () Bool)

(assert (=> b!1415808 m!1306215))

(declare-fun m!1306217 () Bool)

(assert (=> b!1415799 m!1306217))

(declare-fun m!1306219 () Bool)

(assert (=> b!1415799 m!1306219))

(assert (=> b!1415799 m!1306217))

(assert (=> b!1415799 m!1306217))

(declare-fun m!1306221 () Bool)

(assert (=> b!1415799 m!1306221))

(declare-fun m!1306223 () Bool)

(assert (=> b!1415799 m!1306223))

(declare-fun m!1306225 () Bool)

(assert (=> b!1415799 m!1306225))

(assert (=> b!1415798 m!1306217))

(assert (=> b!1415798 m!1306217))

(declare-fun m!1306227 () Bool)

(assert (=> b!1415798 m!1306227))

(declare-fun m!1306229 () Bool)

(assert (=> b!1415804 m!1306229))

(assert (=> b!1415804 m!1306217))

(assert (=> b!1415804 m!1306217))

(declare-fun m!1306231 () Bool)

(assert (=> b!1415804 m!1306231))

(declare-fun m!1306233 () Bool)

(assert (=> b!1415805 m!1306233))

(declare-fun m!1306235 () Bool)

(assert (=> b!1415800 m!1306235))

(assert (=> b!1415800 m!1306235))

(declare-fun m!1306237 () Bool)

(assert (=> b!1415800 m!1306237))

(declare-fun m!1306239 () Bool)

(assert (=> b!1415800 m!1306239))

(declare-fun m!1306241 () Bool)

(assert (=> b!1415800 m!1306241))

(assert (=> b!1415806 m!1306239))

(declare-fun m!1306243 () Bool)

(assert (=> b!1415806 m!1306243))

(declare-fun m!1306245 () Bool)

(assert (=> b!1415806 m!1306245))

(declare-fun m!1306247 () Bool)

(assert (=> b!1415807 m!1306247))

(assert (=> b!1415807 m!1306247))

(declare-fun m!1306249 () Bool)

(assert (=> b!1415807 m!1306249))

(assert (=> b!1415803 m!1306217))

(assert (=> b!1415803 m!1306217))

(declare-fun m!1306251 () Bool)

(assert (=> b!1415803 m!1306251))

(declare-fun m!1306253 () Bool)

(assert (=> b!1415801 m!1306253))

(check-sat (not b!1415800) (not b!1415806) (not b!1415805) (not b!1415799) (not b!1415798) (not b!1415808) (not start!121988) (not b!1415801) (not b!1415804) (not b!1415807) (not b!1415803))
(check-sat)
