; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123266 () Bool)

(assert start!123266)

(declare-fun b!1429446 () Bool)

(declare-fun res!964132 () Bool)

(declare-fun e!807133 () Bool)

(assert (=> b!1429446 (=> (not res!964132) (not e!807133))))

(declare-datatypes ((array!97380 0))(
  ( (array!97381 (arr!47002 (Array (_ BitVec 32) (_ BitVec 64))) (size!47554 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97380)

(declare-datatypes ((List!33590 0))(
  ( (Nil!33587) (Cons!33586 (h!34900 (_ BitVec 64)) (t!48276 List!33590)) )
))
(declare-fun arrayNoDuplicates!0 (array!97380 (_ BitVec 32) List!33590) Bool)

(assert (=> b!1429446 (= res!964132 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33587))))

(declare-fun b!1429447 () Bool)

(declare-fun res!964133 () Bool)

(declare-fun e!807134 () Bool)

(assert (=> b!1429447 (=> (not res!964133) (not e!807134))))

(declare-fun lt!629212 () array!97380)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11308 0))(
  ( (MissingZero!11308 (index!47624 (_ BitVec 32))) (Found!11308 (index!47625 (_ BitVec 32))) (Intermediate!11308 (undefined!12120 Bool) (index!47626 (_ BitVec 32)) (x!129251 (_ BitVec 32))) (Undefined!11308) (MissingVacant!11308 (index!47627 (_ BitVec 32))) )
))
(declare-fun lt!629211 () SeekEntryResult!11308)

(declare-fun lt!629210 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97380 (_ BitVec 32)) SeekEntryResult!11308)

(assert (=> b!1429447 (= res!964133 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629210 lt!629212 mask!2608) lt!629211))))

(declare-fun b!1429448 () Bool)

(declare-fun res!964136 () Bool)

(assert (=> b!1429448 (=> (not res!964136) (not e!807133))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429448 (= res!964136 (and (= (size!47554 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47554 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47554 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429449 () Bool)

(declare-fun res!964129 () Bool)

(assert (=> b!1429449 (=> (not res!964129) (not e!807134))))

(declare-fun lt!629213 () SeekEntryResult!11308)

(assert (=> b!1429449 (= res!964129 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47002 a!2831) j!81) a!2831 mask!2608) lt!629213))))

(declare-fun b!1429450 () Bool)

(declare-fun e!807135 () Bool)

(assert (=> b!1429450 (= e!807135 e!807134)))

(declare-fun res!964128 () Bool)

(assert (=> b!1429450 (=> (not res!964128) (not e!807134))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429450 (= res!964128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629210 mask!2608) lt!629210 lt!629212 mask!2608) lt!629211))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429450 (= lt!629211 (Intermediate!11308 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429450 (= lt!629210 (select (store (arr!47002 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429450 (= lt!629212 (array!97381 (store (arr!47002 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47554 a!2831)))))

(declare-fun b!1429451 () Bool)

(assert (=> b!1429451 (= e!807134 (not true))))

(declare-fun e!807137 () Bool)

(assert (=> b!1429451 e!807137))

(declare-fun res!964135 () Bool)

(assert (=> b!1429451 (=> (not res!964135) (not e!807137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97380 (_ BitVec 32)) Bool)

(assert (=> b!1429451 (= res!964135 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48201 0))(
  ( (Unit!48202) )
))
(declare-fun lt!629209 () Unit!48201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48201)

(assert (=> b!1429451 (= lt!629209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!964138 () Bool)

(assert (=> start!123266 (=> (not res!964138) (not e!807133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123266 (= res!964138 (validMask!0 mask!2608))))

(assert (=> start!123266 e!807133))

(assert (=> start!123266 true))

(declare-fun array_inv!36235 (array!97380) Bool)

(assert (=> start!123266 (array_inv!36235 a!2831)))

(declare-fun b!1429452 () Bool)

(assert (=> b!1429452 (= e!807133 e!807135)))

(declare-fun res!964137 () Bool)

(assert (=> b!1429452 (=> (not res!964137) (not e!807135))))

(assert (=> b!1429452 (= res!964137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47002 a!2831) j!81) mask!2608) (select (arr!47002 a!2831) j!81) a!2831 mask!2608) lt!629213))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429452 (= lt!629213 (Intermediate!11308 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429453 () Bool)

(declare-fun res!964134 () Bool)

(assert (=> b!1429453 (=> (not res!964134) (not e!807133))))

(assert (=> b!1429453 (= res!964134 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47554 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47554 a!2831))))))

(declare-fun b!1429454 () Bool)

(declare-fun res!964130 () Bool)

(assert (=> b!1429454 (=> (not res!964130) (not e!807133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429454 (= res!964130 (validKeyInArray!0 (select (arr!47002 a!2831) i!982)))))

(declare-fun b!1429455 () Bool)

(declare-fun res!964127 () Bool)

(assert (=> b!1429455 (=> (not res!964127) (not e!807133))))

(assert (=> b!1429455 (= res!964127 (validKeyInArray!0 (select (arr!47002 a!2831) j!81)))))

(declare-fun b!1429456 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97380 (_ BitVec 32)) SeekEntryResult!11308)

(assert (=> b!1429456 (= e!807137 (= (seekEntryOrOpen!0 (select (arr!47002 a!2831) j!81) a!2831 mask!2608) (Found!11308 j!81)))))

(declare-fun b!1429457 () Bool)

(declare-fun res!964131 () Bool)

(assert (=> b!1429457 (=> (not res!964131) (not e!807133))))

(assert (=> b!1429457 (= res!964131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429458 () Bool)

(declare-fun res!964126 () Bool)

(assert (=> b!1429458 (=> (not res!964126) (not e!807134))))

(assert (=> b!1429458 (= res!964126 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123266 res!964138) b!1429448))

(assert (= (and b!1429448 res!964136) b!1429454))

(assert (= (and b!1429454 res!964130) b!1429455))

(assert (= (and b!1429455 res!964127) b!1429457))

(assert (= (and b!1429457 res!964131) b!1429446))

(assert (= (and b!1429446 res!964132) b!1429453))

(assert (= (and b!1429453 res!964134) b!1429452))

(assert (= (and b!1429452 res!964137) b!1429450))

(assert (= (and b!1429450 res!964128) b!1429449))

(assert (= (and b!1429449 res!964129) b!1429447))

(assert (= (and b!1429447 res!964133) b!1429458))

(assert (= (and b!1429458 res!964126) b!1429451))

(assert (= (and b!1429451 res!964135) b!1429456))

(declare-fun m!1319073 () Bool)

(assert (=> b!1429455 m!1319073))

(assert (=> b!1429455 m!1319073))

(declare-fun m!1319075 () Bool)

(assert (=> b!1429455 m!1319075))

(declare-fun m!1319077 () Bool)

(assert (=> start!123266 m!1319077))

(declare-fun m!1319079 () Bool)

(assert (=> start!123266 m!1319079))

(declare-fun m!1319081 () Bool)

(assert (=> b!1429454 m!1319081))

(assert (=> b!1429454 m!1319081))

(declare-fun m!1319083 () Bool)

(assert (=> b!1429454 m!1319083))

(assert (=> b!1429449 m!1319073))

(assert (=> b!1429449 m!1319073))

(declare-fun m!1319085 () Bool)

(assert (=> b!1429449 m!1319085))

(declare-fun m!1319087 () Bool)

(assert (=> b!1429451 m!1319087))

(declare-fun m!1319089 () Bool)

(assert (=> b!1429451 m!1319089))

(declare-fun m!1319091 () Bool)

(assert (=> b!1429457 m!1319091))

(assert (=> b!1429456 m!1319073))

(assert (=> b!1429456 m!1319073))

(declare-fun m!1319093 () Bool)

(assert (=> b!1429456 m!1319093))

(declare-fun m!1319095 () Bool)

(assert (=> b!1429446 m!1319095))

(declare-fun m!1319097 () Bool)

(assert (=> b!1429450 m!1319097))

(assert (=> b!1429450 m!1319097))

(declare-fun m!1319099 () Bool)

(assert (=> b!1429450 m!1319099))

(declare-fun m!1319101 () Bool)

(assert (=> b!1429450 m!1319101))

(declare-fun m!1319103 () Bool)

(assert (=> b!1429450 m!1319103))

(declare-fun m!1319105 () Bool)

(assert (=> b!1429447 m!1319105))

(assert (=> b!1429452 m!1319073))

(assert (=> b!1429452 m!1319073))

(declare-fun m!1319107 () Bool)

(assert (=> b!1429452 m!1319107))

(assert (=> b!1429452 m!1319107))

(assert (=> b!1429452 m!1319073))

(declare-fun m!1319109 () Bool)

(assert (=> b!1429452 m!1319109))

(check-sat (not b!1429449) (not b!1429457) (not b!1429452) (not b!1429456) (not b!1429446) (not b!1429451) (not start!123266) (not b!1429447) (not b!1429455) (not b!1429450) (not b!1429454))
(check-sat)
