; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123524 () Bool)

(assert start!123524)

(declare-fun b!1431210 () Bool)

(declare-fun res!964958 () Bool)

(declare-fun e!808191 () Bool)

(assert (=> b!1431210 (=> (not res!964958) (not e!808191))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97556 0))(
  ( (array!97557 (arr!47086 (Array (_ BitVec 32) (_ BitVec 64))) (size!47637 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97556)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11267 0))(
  ( (MissingZero!11267 (index!47460 (_ BitVec 32))) (Found!11267 (index!47461 (_ BitVec 32))) (Intermediate!11267 (undefined!12079 Bool) (index!47462 (_ BitVec 32)) (x!129254 (_ BitVec 32))) (Undefined!11267) (MissingVacant!11267 (index!47463 (_ BitVec 32))) )
))
(declare-fun lt!630022 () SeekEntryResult!11267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97556 (_ BitVec 32)) SeekEntryResult!11267)

(assert (=> b!1431210 (= res!964958 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47086 a!2831) j!81) a!2831 mask!2608) lt!630022))))

(declare-fun b!1431211 () Bool)

(declare-fun res!964963 () Bool)

(declare-fun e!808190 () Bool)

(assert (=> b!1431211 (=> (not res!964963) (not e!808190))))

(declare-datatypes ((List!33583 0))(
  ( (Nil!33580) (Cons!33579 (h!34904 (_ BitVec 64)) (t!48269 List!33583)) )
))
(declare-fun arrayNoDuplicates!0 (array!97556 (_ BitVec 32) List!33583) Bool)

(assert (=> b!1431211 (= res!964963 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33580))))

(declare-fun b!1431212 () Bool)

(declare-fun res!964959 () Bool)

(assert (=> b!1431212 (=> (not res!964959) (not e!808190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97556 (_ BitVec 32)) Bool)

(assert (=> b!1431212 (= res!964959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431213 () Bool)

(declare-fun res!964962 () Bool)

(assert (=> b!1431213 (=> (not res!964962) (not e!808190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431213 (= res!964962 (validKeyInArray!0 (select (arr!47086 a!2831) j!81)))))

(declare-fun b!1431214 () Bool)

(declare-fun res!964960 () Bool)

(assert (=> b!1431214 (=> (not res!964960) (not e!808191))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431214 (= res!964960 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431215 () Bool)

(declare-fun res!964955 () Bool)

(assert (=> b!1431215 (=> (not res!964955) (not e!808190))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431215 (= res!964955 (validKeyInArray!0 (select (arr!47086 a!2831) i!982)))))

(declare-fun b!1431216 () Bool)

(assert (=> b!1431216 (= e!808191 (not true))))

(declare-fun e!808193 () Bool)

(assert (=> b!1431216 e!808193))

(declare-fun res!964965 () Bool)

(assert (=> b!1431216 (=> (not res!964965) (not e!808193))))

(assert (=> b!1431216 (= res!964965 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48311 0))(
  ( (Unit!48312) )
))
(declare-fun lt!630021 () Unit!48311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48311)

(assert (=> b!1431216 (= lt!630021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431217 () Bool)

(declare-fun e!808189 () Bool)

(assert (=> b!1431217 (= e!808190 e!808189)))

(declare-fun res!964957 () Bool)

(assert (=> b!1431217 (=> (not res!964957) (not e!808189))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431217 (= res!964957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47086 a!2831) j!81) mask!2608) (select (arr!47086 a!2831) j!81) a!2831 mask!2608) lt!630022))))

(assert (=> b!1431217 (= lt!630022 (Intermediate!11267 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431218 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97556 (_ BitVec 32)) SeekEntryResult!11267)

(assert (=> b!1431218 (= e!808193 (= (seekEntryOrOpen!0 (select (arr!47086 a!2831) j!81) a!2831 mask!2608) (Found!11267 j!81)))))

(declare-fun res!964954 () Bool)

(assert (=> start!123524 (=> (not res!964954) (not e!808190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123524 (= res!964954 (validMask!0 mask!2608))))

(assert (=> start!123524 e!808190))

(assert (=> start!123524 true))

(declare-fun array_inv!36367 (array!97556) Bool)

(assert (=> start!123524 (array_inv!36367 a!2831)))

(declare-fun b!1431219 () Bool)

(declare-fun res!964961 () Bool)

(assert (=> b!1431219 (=> (not res!964961) (not e!808191))))

(declare-fun lt!630023 () array!97556)

(declare-fun lt!630019 () (_ BitVec 64))

(declare-fun lt!630020 () SeekEntryResult!11267)

(assert (=> b!1431219 (= res!964961 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630019 lt!630023 mask!2608) lt!630020))))

(declare-fun b!1431220 () Bool)

(declare-fun res!964966 () Bool)

(assert (=> b!1431220 (=> (not res!964966) (not e!808190))))

(assert (=> b!1431220 (= res!964966 (and (= (size!47637 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47637 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47637 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431221 () Bool)

(assert (=> b!1431221 (= e!808189 e!808191)))

(declare-fun res!964964 () Bool)

(assert (=> b!1431221 (=> (not res!964964) (not e!808191))))

(assert (=> b!1431221 (= res!964964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630019 mask!2608) lt!630019 lt!630023 mask!2608) lt!630020))))

(assert (=> b!1431221 (= lt!630020 (Intermediate!11267 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431221 (= lt!630019 (select (store (arr!47086 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431221 (= lt!630023 (array!97557 (store (arr!47086 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47637 a!2831)))))

(declare-fun b!1431222 () Bool)

(declare-fun res!964956 () Bool)

(assert (=> b!1431222 (=> (not res!964956) (not e!808190))))

(assert (=> b!1431222 (= res!964956 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47637 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47637 a!2831))))))

(assert (= (and start!123524 res!964954) b!1431220))

(assert (= (and b!1431220 res!964966) b!1431215))

(assert (= (and b!1431215 res!964955) b!1431213))

(assert (= (and b!1431213 res!964962) b!1431212))

(assert (= (and b!1431212 res!964959) b!1431211))

(assert (= (and b!1431211 res!964963) b!1431222))

(assert (= (and b!1431222 res!964956) b!1431217))

(assert (= (and b!1431217 res!964957) b!1431221))

(assert (= (and b!1431221 res!964964) b!1431210))

(assert (= (and b!1431210 res!964958) b!1431219))

(assert (= (and b!1431219 res!964961) b!1431214))

(assert (= (and b!1431214 res!964960) b!1431216))

(assert (= (and b!1431216 res!964965) b!1431218))

(declare-fun m!1321419 () Bool)

(assert (=> b!1431210 m!1321419))

(assert (=> b!1431210 m!1321419))

(declare-fun m!1321421 () Bool)

(assert (=> b!1431210 m!1321421))

(declare-fun m!1321423 () Bool)

(assert (=> b!1431211 m!1321423))

(declare-fun m!1321425 () Bool)

(assert (=> start!123524 m!1321425))

(declare-fun m!1321427 () Bool)

(assert (=> start!123524 m!1321427))

(declare-fun m!1321429 () Bool)

(assert (=> b!1431216 m!1321429))

(declare-fun m!1321431 () Bool)

(assert (=> b!1431216 m!1321431))

(assert (=> b!1431213 m!1321419))

(assert (=> b!1431213 m!1321419))

(declare-fun m!1321433 () Bool)

(assert (=> b!1431213 m!1321433))

(declare-fun m!1321435 () Bool)

(assert (=> b!1431219 m!1321435))

(declare-fun m!1321437 () Bool)

(assert (=> b!1431215 m!1321437))

(assert (=> b!1431215 m!1321437))

(declare-fun m!1321439 () Bool)

(assert (=> b!1431215 m!1321439))

(declare-fun m!1321441 () Bool)

(assert (=> b!1431221 m!1321441))

(assert (=> b!1431221 m!1321441))

(declare-fun m!1321443 () Bool)

(assert (=> b!1431221 m!1321443))

(declare-fun m!1321445 () Bool)

(assert (=> b!1431221 m!1321445))

(declare-fun m!1321447 () Bool)

(assert (=> b!1431221 m!1321447))

(declare-fun m!1321449 () Bool)

(assert (=> b!1431212 m!1321449))

(assert (=> b!1431218 m!1321419))

(assert (=> b!1431218 m!1321419))

(declare-fun m!1321451 () Bool)

(assert (=> b!1431218 m!1321451))

(assert (=> b!1431217 m!1321419))

(assert (=> b!1431217 m!1321419))

(declare-fun m!1321453 () Bool)

(assert (=> b!1431217 m!1321453))

(assert (=> b!1431217 m!1321453))

(assert (=> b!1431217 m!1321419))

(declare-fun m!1321455 () Bool)

(assert (=> b!1431217 m!1321455))

(check-sat (not b!1431212) (not b!1431213) (not b!1431219) (not b!1431210) (not b!1431216) (not start!123524) (not b!1431221) (not b!1431218) (not b!1431215) (not b!1431217) (not b!1431211))
(check-sat)
