; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122138 () Bool)

(assert start!122138)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96746 0))(
  ( (array!96747 (arr!46702 (Array (_ BitVec 32) (_ BitVec 64))) (size!47253 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96746)

(declare-fun lt!624389 () array!96746)

(declare-fun b!1416354 () Bool)

(declare-fun e!801702 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!624385 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10916 0))(
  ( (MissingZero!10916 (index!46056 (_ BitVec 32))) (Found!10916 (index!46057 (_ BitVec 32))) (Intermediate!10916 (undefined!11728 Bool) (index!46058 (_ BitVec 32)) (x!127822 (_ BitVec 32))) (Undefined!10916) (MissingVacant!10916 (index!46059 (_ BitVec 32))) )
))
(declare-fun lt!624388 () SeekEntryResult!10916)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96746 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96746 (_ BitVec 32)) SeekEntryResult!10916)

(assert (=> b!1416354 (= e!801702 (= (seekEntryOrOpen!0 lt!624385 lt!624389 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127822 lt!624388) (index!46058 lt!624388) (index!46058 lt!624388) (select (arr!46702 a!2901) j!112) lt!624389 mask!2840)))))

(declare-fun b!1416355 () Bool)

(declare-fun res!951717 () Bool)

(declare-fun e!801699 () Bool)

(assert (=> b!1416355 (=> (not res!951717) (not e!801699))))

(declare-datatypes ((List!33208 0))(
  ( (Nil!33205) (Cons!33204 (h!34499 (_ BitVec 64)) (t!47894 List!33208)) )
))
(declare-fun arrayNoDuplicates!0 (array!96746 (_ BitVec 32) List!33208) Bool)

(assert (=> b!1416355 (= res!951717 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33205))))

(declare-fun b!1416356 () Bool)

(declare-fun res!951712 () Bool)

(assert (=> b!1416356 (=> (not res!951712) (not e!801699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416356 (= res!951712 (validKeyInArray!0 (select (arr!46702 a!2901) j!112)))))

(declare-fun b!1416357 () Bool)

(declare-fun e!801703 () Bool)

(declare-fun e!801701 () Bool)

(assert (=> b!1416357 (= e!801703 e!801701)))

(declare-fun res!951721 () Bool)

(assert (=> b!1416357 (=> res!951721 e!801701)))

(declare-fun lt!624384 () SeekEntryResult!10916)

(get-info :version)

(assert (=> b!1416357 (= res!951721 (or (= lt!624384 lt!624388) (not ((_ is Intermediate!10916) lt!624388))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96746 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416357 (= lt!624388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624385 mask!2840) lt!624385 lt!624389 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416357 (= lt!624385 (select (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416357 (= lt!624389 (array!96747 (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47253 a!2901)))))

(declare-fun res!951716 () Bool)

(assert (=> start!122138 (=> (not res!951716) (not e!801699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122138 (= res!951716 (validMask!0 mask!2840))))

(assert (=> start!122138 e!801699))

(assert (=> start!122138 true))

(declare-fun array_inv!35983 (array!96746) Bool)

(assert (=> start!122138 (array_inv!35983 a!2901)))

(declare-fun b!1416358 () Bool)

(assert (=> b!1416358 (= e!801699 (not e!801703))))

(declare-fun res!951720 () Bool)

(assert (=> b!1416358 (=> res!951720 e!801703)))

(assert (=> b!1416358 (= res!951720 (or (not ((_ is Intermediate!10916) lt!624384)) (undefined!11728 lt!624384)))))

(declare-fun e!801700 () Bool)

(assert (=> b!1416358 e!801700))

(declare-fun res!951713 () Bool)

(assert (=> b!1416358 (=> (not res!951713) (not e!801700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96746 (_ BitVec 32)) Bool)

(assert (=> b!1416358 (= res!951713 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47833 0))(
  ( (Unit!47834) )
))
(declare-fun lt!624386 () Unit!47833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47833)

(assert (=> b!1416358 (= lt!624386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624387 () (_ BitVec 32))

(assert (=> b!1416358 (= lt!624384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624387 (select (arr!46702 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416358 (= lt!624387 (toIndex!0 (select (arr!46702 a!2901) j!112) mask!2840))))

(declare-fun b!1416359 () Bool)

(assert (=> b!1416359 (= e!801700 (= (seekEntryOrOpen!0 (select (arr!46702 a!2901) j!112) a!2901 mask!2840) (Found!10916 j!112)))))

(declare-fun b!1416360 () Bool)

(assert (=> b!1416360 (= e!801701 true)))

(assert (=> b!1416360 e!801702))

(declare-fun res!951719 () Bool)

(assert (=> b!1416360 (=> (not res!951719) (not e!801702))))

(assert (=> b!1416360 (= res!951719 (and (not (undefined!11728 lt!624388)) (= (index!46058 lt!624388) i!1037) (bvslt (x!127822 lt!624388) (x!127822 lt!624384)) (= (select (store (arr!46702 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46058 lt!624388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624383 () Unit!47833)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47833)

(assert (=> b!1416360 (= lt!624383 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624387 (x!127822 lt!624384) (index!46058 lt!624384) (x!127822 lt!624388) (index!46058 lt!624388) (undefined!11728 lt!624388) mask!2840))))

(declare-fun b!1416361 () Bool)

(declare-fun res!951714 () Bool)

(assert (=> b!1416361 (=> (not res!951714) (not e!801699))))

(assert (=> b!1416361 (= res!951714 (validKeyInArray!0 (select (arr!46702 a!2901) i!1037)))))

(declare-fun b!1416362 () Bool)

(declare-fun res!951718 () Bool)

(assert (=> b!1416362 (=> (not res!951718) (not e!801699))))

(assert (=> b!1416362 (= res!951718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416363 () Bool)

(declare-fun res!951715 () Bool)

(assert (=> b!1416363 (=> (not res!951715) (not e!801699))))

(assert (=> b!1416363 (= res!951715 (and (= (size!47253 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47253 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47253 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122138 res!951716) b!1416363))

(assert (= (and b!1416363 res!951715) b!1416361))

(assert (= (and b!1416361 res!951714) b!1416356))

(assert (= (and b!1416356 res!951712) b!1416362))

(assert (= (and b!1416362 res!951718) b!1416355))

(assert (= (and b!1416355 res!951717) b!1416358))

(assert (= (and b!1416358 res!951713) b!1416359))

(assert (= (and b!1416358 (not res!951720)) b!1416357))

(assert (= (and b!1416357 (not res!951721)) b!1416360))

(assert (= (and b!1416360 res!951719) b!1416354))

(declare-fun m!1306777 () Bool)

(assert (=> b!1416355 m!1306777))

(declare-fun m!1306779 () Bool)

(assert (=> b!1416357 m!1306779))

(assert (=> b!1416357 m!1306779))

(declare-fun m!1306781 () Bool)

(assert (=> b!1416357 m!1306781))

(declare-fun m!1306783 () Bool)

(assert (=> b!1416357 m!1306783))

(declare-fun m!1306785 () Bool)

(assert (=> b!1416357 m!1306785))

(declare-fun m!1306787 () Bool)

(assert (=> b!1416361 m!1306787))

(assert (=> b!1416361 m!1306787))

(declare-fun m!1306789 () Bool)

(assert (=> b!1416361 m!1306789))

(declare-fun m!1306791 () Bool)

(assert (=> b!1416359 m!1306791))

(assert (=> b!1416359 m!1306791))

(declare-fun m!1306793 () Bool)

(assert (=> b!1416359 m!1306793))

(assert (=> b!1416356 m!1306791))

(assert (=> b!1416356 m!1306791))

(declare-fun m!1306795 () Bool)

(assert (=> b!1416356 m!1306795))

(assert (=> b!1416360 m!1306783))

(declare-fun m!1306797 () Bool)

(assert (=> b!1416360 m!1306797))

(declare-fun m!1306799 () Bool)

(assert (=> b!1416360 m!1306799))

(declare-fun m!1306801 () Bool)

(assert (=> b!1416362 m!1306801))

(assert (=> b!1416358 m!1306791))

(declare-fun m!1306803 () Bool)

(assert (=> b!1416358 m!1306803))

(assert (=> b!1416358 m!1306791))

(declare-fun m!1306805 () Bool)

(assert (=> b!1416358 m!1306805))

(declare-fun m!1306807 () Bool)

(assert (=> b!1416358 m!1306807))

(assert (=> b!1416358 m!1306791))

(declare-fun m!1306809 () Bool)

(assert (=> b!1416358 m!1306809))

(declare-fun m!1306811 () Bool)

(assert (=> b!1416354 m!1306811))

(assert (=> b!1416354 m!1306791))

(assert (=> b!1416354 m!1306791))

(declare-fun m!1306813 () Bool)

(assert (=> b!1416354 m!1306813))

(declare-fun m!1306815 () Bool)

(assert (=> start!122138 m!1306815))

(declare-fun m!1306817 () Bool)

(assert (=> start!122138 m!1306817))

(check-sat (not b!1416357) (not b!1416355) (not b!1416358) (not start!122138) (not b!1416356) (not b!1416360) (not b!1416362) (not b!1416359) (not b!1416361) (not b!1416354))
(check-sat)
