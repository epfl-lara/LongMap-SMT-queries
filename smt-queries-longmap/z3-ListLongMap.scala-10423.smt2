; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122702 () Bool)

(assert start!122702)

(declare-fun res!957016 () Bool)

(declare-fun e!803787 () Bool)

(assert (=> start!122702 (=> (not res!957016) (not e!803787))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122702 (= res!957016 (validMask!0 mask!2608))))

(assert (=> start!122702 e!803787))

(assert (=> start!122702 true))

(declare-datatypes ((array!97067 0))(
  ( (array!97068 (arr!46851 (Array (_ BitVec 32) (_ BitVec 64))) (size!47401 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97067)

(declare-fun array_inv!35879 (array!97067) Bool)

(assert (=> start!122702 (array_inv!35879 a!2831)))

(declare-fun b!1421580 () Bool)

(declare-fun res!957019 () Bool)

(declare-fun e!803785 () Bool)

(assert (=> b!1421580 (=> (not res!957019) (not e!803785))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626325 () (_ BitVec 64))

(declare-fun lt!626322 () array!97067)

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11136 0))(
  ( (MissingZero!11136 (index!46936 (_ BitVec 32))) (Found!11136 (index!46937 (_ BitVec 32))) (Intermediate!11136 (undefined!11948 Bool) (index!46938 (_ BitVec 32)) (x!128586 (_ BitVec 32))) (Undefined!11136) (MissingVacant!11136 (index!46939 (_ BitVec 32))) )
))
(declare-fun lt!626321 () SeekEntryResult!11136)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97067 (_ BitVec 32)) SeekEntryResult!11136)

(assert (=> b!1421580 (= res!957019 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626325 lt!626322 mask!2608) lt!626321))))

(declare-fun b!1421581 () Bool)

(declare-fun e!803786 () Bool)

(assert (=> b!1421581 (= e!803786 e!803785)))

(declare-fun res!957018 () Bool)

(assert (=> b!1421581 (=> (not res!957018) (not e!803785))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421581 (= res!957018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626325 mask!2608) lt!626325 lt!626322 mask!2608) lt!626321))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421581 (= lt!626321 (Intermediate!11136 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421581 (= lt!626325 (select (store (arr!46851 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421581 (= lt!626322 (array!97068 (store (arr!46851 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47401 a!2831)))))

(declare-fun b!1421582 () Bool)

(declare-fun res!957014 () Bool)

(assert (=> b!1421582 (=> (not res!957014) (not e!803787))))

(declare-datatypes ((List!33361 0))(
  ( (Nil!33358) (Cons!33357 (h!34659 (_ BitVec 64)) (t!48055 List!33361)) )
))
(declare-fun arrayNoDuplicates!0 (array!97067 (_ BitVec 32) List!33361) Bool)

(assert (=> b!1421582 (= res!957014 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33358))))

(declare-fun b!1421583 () Bool)

(declare-fun e!803788 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97067 (_ BitVec 32)) SeekEntryResult!11136)

(assert (=> b!1421583 (= e!803788 (= (seekEntryOrOpen!0 (select (arr!46851 a!2831) j!81) a!2831 mask!2608) (Found!11136 j!81)))))

(declare-fun b!1421584 () Bool)

(assert (=> b!1421584 (= e!803785 (not true))))

(assert (=> b!1421584 e!803788))

(declare-fun res!957020 () Bool)

(assert (=> b!1421584 (=> (not res!957020) (not e!803788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97067 (_ BitVec 32)) Bool)

(assert (=> b!1421584 (= res!957020 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48108 0))(
  ( (Unit!48109) )
))
(declare-fun lt!626323 () Unit!48108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48108)

(assert (=> b!1421584 (= lt!626323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421585 () Bool)

(assert (=> b!1421585 (= e!803787 e!803786)))

(declare-fun res!957024 () Bool)

(assert (=> b!1421585 (=> (not res!957024) (not e!803786))))

(declare-fun lt!626324 () SeekEntryResult!11136)

(assert (=> b!1421585 (= res!957024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46851 a!2831) j!81) mask!2608) (select (arr!46851 a!2831) j!81) a!2831 mask!2608) lt!626324))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421585 (= lt!626324 (Intermediate!11136 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421586 () Bool)

(declare-fun res!957021 () Bool)

(assert (=> b!1421586 (=> (not res!957021) (not e!803787))))

(assert (=> b!1421586 (= res!957021 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47401 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47401 a!2831))))))

(declare-fun b!1421587 () Bool)

(declare-fun res!957023 () Bool)

(assert (=> b!1421587 (=> (not res!957023) (not e!803787))))

(assert (=> b!1421587 (= res!957023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421588 () Bool)

(declare-fun res!957025 () Bool)

(assert (=> b!1421588 (=> (not res!957025) (not e!803787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421588 (= res!957025 (validKeyInArray!0 (select (arr!46851 a!2831) i!982)))))

(declare-fun b!1421589 () Bool)

(declare-fun res!957015 () Bool)

(assert (=> b!1421589 (=> (not res!957015) (not e!803787))))

(assert (=> b!1421589 (= res!957015 (and (= (size!47401 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47401 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47401 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421590 () Bool)

(declare-fun res!957017 () Bool)

(assert (=> b!1421590 (=> (not res!957017) (not e!803785))))

(assert (=> b!1421590 (= res!957017 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46851 a!2831) j!81) a!2831 mask!2608) lt!626324))))

(declare-fun b!1421591 () Bool)

(declare-fun res!957022 () Bool)

(assert (=> b!1421591 (=> (not res!957022) (not e!803785))))

(assert (=> b!1421591 (= res!957022 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421592 () Bool)

(declare-fun res!957013 () Bool)

(assert (=> b!1421592 (=> (not res!957013) (not e!803787))))

(assert (=> b!1421592 (= res!957013 (validKeyInArray!0 (select (arr!46851 a!2831) j!81)))))

(assert (= (and start!122702 res!957016) b!1421589))

(assert (= (and b!1421589 res!957015) b!1421588))

(assert (= (and b!1421588 res!957025) b!1421592))

(assert (= (and b!1421592 res!957013) b!1421587))

(assert (= (and b!1421587 res!957023) b!1421582))

(assert (= (and b!1421582 res!957014) b!1421586))

(assert (= (and b!1421586 res!957021) b!1421585))

(assert (= (and b!1421585 res!957024) b!1421581))

(assert (= (and b!1421581 res!957018) b!1421590))

(assert (= (and b!1421590 res!957017) b!1421580))

(assert (= (and b!1421580 res!957019) b!1421591))

(assert (= (and b!1421591 res!957022) b!1421584))

(assert (= (and b!1421584 res!957020) b!1421583))

(declare-fun m!1312121 () Bool)

(assert (=> b!1421581 m!1312121))

(assert (=> b!1421581 m!1312121))

(declare-fun m!1312123 () Bool)

(assert (=> b!1421581 m!1312123))

(declare-fun m!1312125 () Bool)

(assert (=> b!1421581 m!1312125))

(declare-fun m!1312127 () Bool)

(assert (=> b!1421581 m!1312127))

(declare-fun m!1312129 () Bool)

(assert (=> b!1421585 m!1312129))

(assert (=> b!1421585 m!1312129))

(declare-fun m!1312131 () Bool)

(assert (=> b!1421585 m!1312131))

(assert (=> b!1421585 m!1312131))

(assert (=> b!1421585 m!1312129))

(declare-fun m!1312133 () Bool)

(assert (=> b!1421585 m!1312133))

(declare-fun m!1312135 () Bool)

(assert (=> b!1421584 m!1312135))

(declare-fun m!1312137 () Bool)

(assert (=> b!1421584 m!1312137))

(assert (=> b!1421583 m!1312129))

(assert (=> b!1421583 m!1312129))

(declare-fun m!1312139 () Bool)

(assert (=> b!1421583 m!1312139))

(declare-fun m!1312141 () Bool)

(assert (=> b!1421587 m!1312141))

(assert (=> b!1421592 m!1312129))

(assert (=> b!1421592 m!1312129))

(declare-fun m!1312143 () Bool)

(assert (=> b!1421592 m!1312143))

(declare-fun m!1312145 () Bool)

(assert (=> b!1421588 m!1312145))

(assert (=> b!1421588 m!1312145))

(declare-fun m!1312147 () Bool)

(assert (=> b!1421588 m!1312147))

(declare-fun m!1312149 () Bool)

(assert (=> start!122702 m!1312149))

(declare-fun m!1312151 () Bool)

(assert (=> start!122702 m!1312151))

(assert (=> b!1421590 m!1312129))

(assert (=> b!1421590 m!1312129))

(declare-fun m!1312153 () Bool)

(assert (=> b!1421590 m!1312153))

(declare-fun m!1312155 () Bool)

(assert (=> b!1421582 m!1312155))

(declare-fun m!1312157 () Bool)

(assert (=> b!1421580 m!1312157))

(check-sat (not b!1421581) (not b!1421582) (not b!1421580) (not b!1421588) (not b!1421590) (not b!1421592) (not b!1421585) (not start!122702) (not b!1421583) (not b!1421587) (not b!1421584))
(check-sat)
