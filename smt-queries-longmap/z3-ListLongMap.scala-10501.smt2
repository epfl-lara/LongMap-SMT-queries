; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123644 () Bool)

(assert start!123644)

(declare-fun b!1433426 () Bool)

(declare-fun e!809081 () Bool)

(declare-fun e!809080 () Bool)

(assert (=> b!1433426 (= e!809081 e!809080)))

(declare-fun res!967090 () Bool)

(assert (=> b!1433426 (=> (not res!967090) (not e!809080))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97559 0))(
  ( (array!97560 (arr!47085 (Array (_ BitVec 32) (_ BitVec 64))) (size!47635 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97559)

(declare-datatypes ((SeekEntryResult!11364 0))(
  ( (MissingZero!11364 (index!47848 (_ BitVec 32))) (Found!11364 (index!47849 (_ BitVec 32))) (Intermediate!11364 (undefined!12176 Bool) (index!47850 (_ BitVec 32)) (x!129495 (_ BitVec 32))) (Undefined!11364) (MissingVacant!11364 (index!47851 (_ BitVec 32))) )
))
(declare-fun lt!631026 () SeekEntryResult!11364)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97559 (_ BitVec 32)) SeekEntryResult!11364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433426 (= res!967090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47085 a!2831) j!81) mask!2608) (select (arr!47085 a!2831) j!81) a!2831 mask!2608) lt!631026))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433426 (= lt!631026 (Intermediate!11364 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433427 () Bool)

(declare-fun res!967098 () Bool)

(assert (=> b!1433427 (=> (not res!967098) (not e!809081))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433427 (= res!967098 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47635 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47635 a!2831))))))

(declare-fun b!1433428 () Bool)

(declare-fun e!809079 () Bool)

(assert (=> b!1433428 (= e!809080 e!809079)))

(declare-fun res!967093 () Bool)

(assert (=> b!1433428 (=> (not res!967093) (not e!809079))))

(declare-fun lt!631024 () (_ BitVec 64))

(declare-fun lt!631027 () SeekEntryResult!11364)

(declare-fun lt!631025 () array!97559)

(assert (=> b!1433428 (= res!967093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631024 mask!2608) lt!631024 lt!631025 mask!2608) lt!631027))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433428 (= lt!631027 (Intermediate!11364 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433428 (= lt!631024 (select (store (arr!47085 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433428 (= lt!631025 (array!97560 (store (arr!47085 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47635 a!2831)))))

(declare-fun b!1433429 () Bool)

(declare-fun res!967097 () Bool)

(assert (=> b!1433429 (=> (not res!967097) (not e!809081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97559 (_ BitVec 32)) Bool)

(assert (=> b!1433429 (= res!967097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433430 () Bool)

(declare-fun res!967102 () Bool)

(assert (=> b!1433430 (=> (not res!967102) (not e!809081))))

(assert (=> b!1433430 (= res!967102 (and (= (size!47635 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47635 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47635 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433431 () Bool)

(declare-fun res!967092 () Bool)

(assert (=> b!1433431 (=> (not res!967092) (not e!809079))))

(assert (=> b!1433431 (= res!967092 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!967091 () Bool)

(assert (=> start!123644 (=> (not res!967091) (not e!809081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123644 (= res!967091 (validMask!0 mask!2608))))

(assert (=> start!123644 e!809081))

(assert (=> start!123644 true))

(declare-fun array_inv!36113 (array!97559) Bool)

(assert (=> start!123644 (array_inv!36113 a!2831)))

(declare-fun b!1433432 () Bool)

(declare-fun res!967089 () Bool)

(assert (=> b!1433432 (=> (not res!967089) (not e!809081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433432 (= res!967089 (validKeyInArray!0 (select (arr!47085 a!2831) i!982)))))

(declare-fun b!1433433 () Bool)

(declare-fun res!967095 () Bool)

(assert (=> b!1433433 (=> (not res!967095) (not e!809081))))

(assert (=> b!1433433 (= res!967095 (validKeyInArray!0 (select (arr!47085 a!2831) j!81)))))

(declare-fun b!1433434 () Bool)

(declare-fun res!967096 () Bool)

(assert (=> b!1433434 (=> (not res!967096) (not e!809079))))

(assert (=> b!1433434 (= res!967096 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631024 lt!631025 mask!2608) lt!631027))))

(declare-fun b!1433435 () Bool)

(declare-fun e!809083 () Bool)

(assert (=> b!1433435 (= e!809083 true)))

(declare-fun lt!631028 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433435 (= lt!631028 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433436 () Bool)

(declare-fun res!967101 () Bool)

(assert (=> b!1433436 (=> (not res!967101) (not e!809079))))

(assert (=> b!1433436 (= res!967101 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47085 a!2831) j!81) a!2831 mask!2608) lt!631026))))

(declare-fun b!1433437 () Bool)

(assert (=> b!1433437 (= e!809079 (not e!809083))))

(declare-fun res!967099 () Bool)

(assert (=> b!1433437 (=> res!967099 e!809083)))

(assert (=> b!1433437 (= res!967099 (or (= (select (arr!47085 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47085 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47085 a!2831) index!585) (select (arr!47085 a!2831) j!81)) (= (select (store (arr!47085 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809082 () Bool)

(assert (=> b!1433437 e!809082))

(declare-fun res!967100 () Bool)

(assert (=> b!1433437 (=> (not res!967100) (not e!809082))))

(assert (=> b!1433437 (= res!967100 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48474 0))(
  ( (Unit!48475) )
))
(declare-fun lt!631029 () Unit!48474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48474)

(assert (=> b!1433437 (= lt!631029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433438 () Bool)

(declare-fun res!967094 () Bool)

(assert (=> b!1433438 (=> (not res!967094) (not e!809081))))

(declare-datatypes ((List!33595 0))(
  ( (Nil!33592) (Cons!33591 (h!34917 (_ BitVec 64)) (t!48289 List!33595)) )
))
(declare-fun arrayNoDuplicates!0 (array!97559 (_ BitVec 32) List!33595) Bool)

(assert (=> b!1433438 (= res!967094 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33592))))

(declare-fun b!1433439 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97559 (_ BitVec 32)) SeekEntryResult!11364)

(assert (=> b!1433439 (= e!809082 (= (seekEntryOrOpen!0 (select (arr!47085 a!2831) j!81) a!2831 mask!2608) (Found!11364 j!81)))))

(assert (= (and start!123644 res!967091) b!1433430))

(assert (= (and b!1433430 res!967102) b!1433432))

(assert (= (and b!1433432 res!967089) b!1433433))

(assert (= (and b!1433433 res!967095) b!1433429))

(assert (= (and b!1433429 res!967097) b!1433438))

(assert (= (and b!1433438 res!967094) b!1433427))

(assert (= (and b!1433427 res!967098) b!1433426))

(assert (= (and b!1433426 res!967090) b!1433428))

(assert (= (and b!1433428 res!967093) b!1433436))

(assert (= (and b!1433436 res!967101) b!1433434))

(assert (= (and b!1433434 res!967096) b!1433431))

(assert (= (and b!1433431 res!967092) b!1433437))

(assert (= (and b!1433437 res!967100) b!1433439))

(assert (= (and b!1433437 (not res!967099)) b!1433435))

(declare-fun m!1323143 () Bool)

(assert (=> b!1433438 m!1323143))

(declare-fun m!1323145 () Bool)

(assert (=> b!1433439 m!1323145))

(assert (=> b!1433439 m!1323145))

(declare-fun m!1323147 () Bool)

(assert (=> b!1433439 m!1323147))

(declare-fun m!1323149 () Bool)

(assert (=> b!1433437 m!1323149))

(declare-fun m!1323151 () Bool)

(assert (=> b!1433437 m!1323151))

(declare-fun m!1323153 () Bool)

(assert (=> b!1433437 m!1323153))

(declare-fun m!1323155 () Bool)

(assert (=> b!1433437 m!1323155))

(assert (=> b!1433437 m!1323145))

(declare-fun m!1323157 () Bool)

(assert (=> b!1433437 m!1323157))

(assert (=> b!1433433 m!1323145))

(assert (=> b!1433433 m!1323145))

(declare-fun m!1323159 () Bool)

(assert (=> b!1433433 m!1323159))

(declare-fun m!1323161 () Bool)

(assert (=> b!1433434 m!1323161))

(declare-fun m!1323163 () Bool)

(assert (=> b!1433432 m!1323163))

(assert (=> b!1433432 m!1323163))

(declare-fun m!1323165 () Bool)

(assert (=> b!1433432 m!1323165))

(assert (=> b!1433436 m!1323145))

(assert (=> b!1433436 m!1323145))

(declare-fun m!1323167 () Bool)

(assert (=> b!1433436 m!1323167))

(declare-fun m!1323169 () Bool)

(assert (=> start!123644 m!1323169))

(declare-fun m!1323171 () Bool)

(assert (=> start!123644 m!1323171))

(declare-fun m!1323173 () Bool)

(assert (=> b!1433428 m!1323173))

(assert (=> b!1433428 m!1323173))

(declare-fun m!1323175 () Bool)

(assert (=> b!1433428 m!1323175))

(assert (=> b!1433428 m!1323149))

(declare-fun m!1323177 () Bool)

(assert (=> b!1433428 m!1323177))

(declare-fun m!1323179 () Bool)

(assert (=> b!1433435 m!1323179))

(assert (=> b!1433426 m!1323145))

(assert (=> b!1433426 m!1323145))

(declare-fun m!1323181 () Bool)

(assert (=> b!1433426 m!1323181))

(assert (=> b!1433426 m!1323181))

(assert (=> b!1433426 m!1323145))

(declare-fun m!1323183 () Bool)

(assert (=> b!1433426 m!1323183))

(declare-fun m!1323185 () Bool)

(assert (=> b!1433429 m!1323185))

(check-sat (not b!1433429) (not b!1433433) (not b!1433432) (not start!123644) (not b!1433434) (not b!1433436) (not b!1433438) (not b!1433428) (not b!1433439) (not b!1433437) (not b!1433426) (not b!1433435))
(check-sat)
