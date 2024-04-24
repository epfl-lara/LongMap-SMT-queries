; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122864 () Bool)

(assert start!122864)

(declare-fun b!1422248 () Bool)

(declare-fun e!804362 () Bool)

(declare-fun e!804365 () Bool)

(assert (=> b!1422248 (= e!804362 e!804365)))

(declare-fun res!957006 () Bool)

(assert (=> b!1422248 (=> (not res!957006) (not e!804365))))

(declare-datatypes ((SeekEntryResult!11078 0))(
  ( (MissingZero!11078 (index!46704 (_ BitVec 32))) (Found!11078 (index!46705 (_ BitVec 32))) (Intermediate!11078 (undefined!11890 Bool) (index!46706 (_ BitVec 32)) (x!128515 (_ BitVec 32))) (Undefined!11078) (MissingVacant!11078 (index!46707 (_ BitVec 32))) )
))
(declare-fun lt!626528 () SeekEntryResult!11078)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97151 0))(
  ( (array!97152 (arr!46891 (Array (_ BitVec 32) (_ BitVec 64))) (size!47442 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97151)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97151 (_ BitVec 32)) SeekEntryResult!11078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422248 (= res!957006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46891 a!2831) j!81) mask!2608) (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!626528))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422248 (= lt!626528 (Intermediate!11078 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422249 () Bool)

(declare-fun e!804363 () Bool)

(assert (=> b!1422249 (= e!804365 e!804363)))

(declare-fun res!957004 () Bool)

(assert (=> b!1422249 (=> (not res!957004) (not e!804363))))

(declare-fun lt!626525 () (_ BitVec 64))

(declare-fun lt!626526 () SeekEntryResult!11078)

(declare-fun lt!626527 () array!97151)

(assert (=> b!1422249 (= res!957004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626525 mask!2608) lt!626525 lt!626527 mask!2608) lt!626526))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422249 (= lt!626526 (Intermediate!11078 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422249 (= lt!626525 (select (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422249 (= lt!626527 (array!97152 (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47442 a!2831)))))

(declare-fun b!1422250 () Bool)

(declare-fun res!957003 () Bool)

(assert (=> b!1422250 (=> (not res!957003) (not e!804363))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422250 (= res!957003 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!626528))))

(declare-fun b!1422251 () Bool)

(declare-fun res!956997 () Bool)

(assert (=> b!1422251 (=> (not res!956997) (not e!804362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422251 (= res!956997 (validKeyInArray!0 (select (arr!46891 a!2831) j!81)))))

(declare-fun b!1422252 () Bool)

(declare-fun res!957007 () Bool)

(assert (=> b!1422252 (=> (not res!957007) (not e!804362))))

(assert (=> b!1422252 (= res!957007 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47442 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47442 a!2831))))))

(declare-fun b!1422253 () Bool)

(declare-fun res!957001 () Bool)

(assert (=> b!1422253 (=> (not res!957001) (not e!804362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97151 (_ BitVec 32)) Bool)

(assert (=> b!1422253 (= res!957001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422254 () Bool)

(declare-fun res!956999 () Bool)

(assert (=> b!1422254 (=> (not res!956999) (not e!804362))))

(declare-datatypes ((List!33388 0))(
  ( (Nil!33385) (Cons!33384 (h!34694 (_ BitVec 64)) (t!48074 List!33388)) )
))
(declare-fun arrayNoDuplicates!0 (array!97151 (_ BitVec 32) List!33388) Bool)

(assert (=> b!1422254 (= res!956999 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33385))))

(declare-fun b!1422247 () Bool)

(declare-fun res!957000 () Bool)

(assert (=> b!1422247 (=> (not res!957000) (not e!804363))))

(assert (=> b!1422247 (= res!957000 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!957005 () Bool)

(assert (=> start!122864 (=> (not res!957005) (not e!804362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122864 (= res!957005 (validMask!0 mask!2608))))

(assert (=> start!122864 e!804362))

(assert (=> start!122864 true))

(declare-fun array_inv!36172 (array!97151) Bool)

(assert (=> start!122864 (array_inv!36172 a!2831)))

(declare-fun b!1422255 () Bool)

(declare-fun res!956996 () Bool)

(assert (=> b!1422255 (=> (not res!956996) (not e!804362))))

(assert (=> b!1422255 (= res!956996 (validKeyInArray!0 (select (arr!46891 a!2831) i!982)))))

(declare-fun b!1422256 () Bool)

(assert (=> b!1422256 (= e!804363 (not true))))

(assert (=> b!1422256 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48023 0))(
  ( (Unit!48024) )
))
(declare-fun lt!626524 () Unit!48023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48023)

(assert (=> b!1422256 (= lt!626524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422257 () Bool)

(declare-fun res!956998 () Bool)

(assert (=> b!1422257 (=> (not res!956998) (not e!804362))))

(assert (=> b!1422257 (= res!956998 (and (= (size!47442 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47442 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47442 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422258 () Bool)

(declare-fun res!957002 () Bool)

(assert (=> b!1422258 (=> (not res!957002) (not e!804363))))

(assert (=> b!1422258 (= res!957002 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626525 lt!626527 mask!2608) lt!626526))))

(assert (= (and start!122864 res!957005) b!1422257))

(assert (= (and b!1422257 res!956998) b!1422255))

(assert (= (and b!1422255 res!956996) b!1422251))

(assert (= (and b!1422251 res!956997) b!1422253))

(assert (= (and b!1422253 res!957001) b!1422254))

(assert (= (and b!1422254 res!956999) b!1422252))

(assert (= (and b!1422252 res!957007) b!1422248))

(assert (= (and b!1422248 res!957006) b!1422249))

(assert (= (and b!1422249 res!957004) b!1422250))

(assert (= (and b!1422250 res!957003) b!1422258))

(assert (= (and b!1422258 res!957002) b!1422247))

(assert (= (and b!1422247 res!957000) b!1422256))

(declare-fun m!1313019 () Bool)

(assert (=> b!1422251 m!1313019))

(assert (=> b!1422251 m!1313019))

(declare-fun m!1313021 () Bool)

(assert (=> b!1422251 m!1313021))

(declare-fun m!1313023 () Bool)

(assert (=> b!1422249 m!1313023))

(assert (=> b!1422249 m!1313023))

(declare-fun m!1313025 () Bool)

(assert (=> b!1422249 m!1313025))

(declare-fun m!1313027 () Bool)

(assert (=> b!1422249 m!1313027))

(declare-fun m!1313029 () Bool)

(assert (=> b!1422249 m!1313029))

(assert (=> b!1422248 m!1313019))

(assert (=> b!1422248 m!1313019))

(declare-fun m!1313031 () Bool)

(assert (=> b!1422248 m!1313031))

(assert (=> b!1422248 m!1313031))

(assert (=> b!1422248 m!1313019))

(declare-fun m!1313033 () Bool)

(assert (=> b!1422248 m!1313033))

(declare-fun m!1313035 () Bool)

(assert (=> b!1422253 m!1313035))

(declare-fun m!1313037 () Bool)

(assert (=> b!1422255 m!1313037))

(assert (=> b!1422255 m!1313037))

(declare-fun m!1313039 () Bool)

(assert (=> b!1422255 m!1313039))

(declare-fun m!1313041 () Bool)

(assert (=> b!1422254 m!1313041))

(declare-fun m!1313043 () Bool)

(assert (=> b!1422256 m!1313043))

(declare-fun m!1313045 () Bool)

(assert (=> b!1422256 m!1313045))

(declare-fun m!1313047 () Bool)

(assert (=> start!122864 m!1313047))

(declare-fun m!1313049 () Bool)

(assert (=> start!122864 m!1313049))

(assert (=> b!1422250 m!1313019))

(assert (=> b!1422250 m!1313019))

(declare-fun m!1313051 () Bool)

(assert (=> b!1422250 m!1313051))

(declare-fun m!1313053 () Bool)

(assert (=> b!1422258 m!1313053))

(check-sat (not b!1422255) (not b!1422258) (not b!1422256) (not start!122864) (not b!1422251) (not b!1422250) (not b!1422254) (not b!1422249) (not b!1422248) (not b!1422253))
(check-sat)
