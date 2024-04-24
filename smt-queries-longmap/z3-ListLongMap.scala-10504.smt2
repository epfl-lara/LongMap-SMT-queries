; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123952 () Bool)

(assert start!123952)

(declare-fun b!1435442 () Bool)

(declare-fun e!810288 () Bool)

(declare-fun e!810290 () Bool)

(assert (=> b!1435442 (= e!810288 (not e!810290))))

(declare-fun res!968074 () Bool)

(assert (=> b!1435442 (=> res!968074 e!810290)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97691 0))(
  ( (array!97692 (arr!47146 (Array (_ BitVec 32) (_ BitVec 64))) (size!47697 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97691)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435442 (= res!968074 (or (= (select (arr!47146 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47146 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47146 a!2831) index!585) (select (arr!47146 a!2831) j!81)) (= (select (store (arr!47146 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810292 () Bool)

(assert (=> b!1435442 e!810292))

(declare-fun res!968079 () Bool)

(assert (=> b!1435442 (=> (not res!968079) (not e!810292))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97691 (_ BitVec 32)) Bool)

(assert (=> b!1435442 (= res!968079 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48431 0))(
  ( (Unit!48432) )
))
(declare-fun lt!631812 () Unit!48431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48431)

(assert (=> b!1435442 (= lt!631812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435443 () Bool)

(declare-fun res!968077 () Bool)

(declare-fun e!810289 () Bool)

(assert (=> b!1435443 (=> (not res!968077) (not e!810289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435443 (= res!968077 (validKeyInArray!0 (select (arr!47146 a!2831) i!982)))))

(declare-fun b!1435444 () Bool)

(declare-fun res!968073 () Bool)

(assert (=> b!1435444 (=> (not res!968073) (not e!810289))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1435444 (= res!968073 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47697 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47697 a!2831))))))

(declare-fun b!1435445 () Bool)

(declare-fun e!810293 () Bool)

(assert (=> b!1435445 (= e!810293 e!810288)))

(declare-fun res!968069 () Bool)

(assert (=> b!1435445 (=> (not res!968069) (not e!810288))))

(declare-datatypes ((SeekEntryResult!11327 0))(
  ( (MissingZero!11327 (index!47700 (_ BitVec 32))) (Found!11327 (index!47701 (_ BitVec 32))) (Intermediate!11327 (undefined!12139 Bool) (index!47702 (_ BitVec 32)) (x!129515 (_ BitVec 32))) (Undefined!11327) (MissingVacant!11327 (index!47703 (_ BitVec 32))) )
))
(declare-fun lt!631809 () SeekEntryResult!11327)

(declare-fun lt!631810 () array!97691)

(declare-fun lt!631813 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97691 (_ BitVec 32)) SeekEntryResult!11327)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435445 (= res!968069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631813 mask!2608) lt!631813 lt!631810 mask!2608) lt!631809))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435445 (= lt!631809 (Intermediate!11327 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435445 (= lt!631813 (select (store (arr!47146 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435445 (= lt!631810 (array!97692 (store (arr!47146 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47697 a!2831)))))

(declare-fun b!1435446 () Bool)

(assert (=> b!1435446 (= e!810289 e!810293)))

(declare-fun res!968080 () Bool)

(assert (=> b!1435446 (=> (not res!968080) (not e!810293))))

(declare-fun lt!631814 () SeekEntryResult!11327)

(assert (=> b!1435446 (= res!968080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47146 a!2831) j!81) mask!2608) (select (arr!47146 a!2831) j!81) a!2831 mask!2608) lt!631814))))

(assert (=> b!1435446 (= lt!631814 (Intermediate!11327 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435447 () Bool)

(declare-fun res!968078 () Bool)

(assert (=> b!1435447 (=> (not res!968078) (not e!810288))))

(assert (=> b!1435447 (= res!968078 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631813 lt!631810 mask!2608) lt!631809))))

(declare-fun b!1435448 () Bool)

(assert (=> b!1435448 (= e!810290 true)))

(declare-fun lt!631811 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435448 (= lt!631811 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun res!968068 () Bool)

(assert (=> start!123952 (=> (not res!968068) (not e!810289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123952 (= res!968068 (validMask!0 mask!2608))))

(assert (=> start!123952 e!810289))

(assert (=> start!123952 true))

(declare-fun array_inv!36427 (array!97691) Bool)

(assert (=> start!123952 (array_inv!36427 a!2831)))

(declare-fun b!1435449 () Bool)

(declare-fun res!968072 () Bool)

(assert (=> b!1435449 (=> (not res!968072) (not e!810288))))

(assert (=> b!1435449 (= res!968072 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435450 () Bool)

(declare-fun res!968076 () Bool)

(assert (=> b!1435450 (=> (not res!968076) (not e!810288))))

(assert (=> b!1435450 (= res!968076 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47146 a!2831) j!81) a!2831 mask!2608) lt!631814))))

(declare-fun b!1435451 () Bool)

(declare-fun res!968067 () Bool)

(assert (=> b!1435451 (=> (not res!968067) (not e!810289))))

(assert (=> b!1435451 (= res!968067 (and (= (size!47697 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47697 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47697 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435452 () Bool)

(declare-fun res!968071 () Bool)

(assert (=> b!1435452 (=> (not res!968071) (not e!810289))))

(assert (=> b!1435452 (= res!968071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435453 () Bool)

(declare-fun res!968075 () Bool)

(assert (=> b!1435453 (=> (not res!968075) (not e!810289))))

(declare-datatypes ((List!33643 0))(
  ( (Nil!33640) (Cons!33639 (h!34979 (_ BitVec 64)) (t!48329 List!33643)) )
))
(declare-fun arrayNoDuplicates!0 (array!97691 (_ BitVec 32) List!33643) Bool)

(assert (=> b!1435453 (= res!968075 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33640))))

(declare-fun b!1435454 () Bool)

(declare-fun res!968070 () Bool)

(assert (=> b!1435454 (=> (not res!968070) (not e!810289))))

(assert (=> b!1435454 (= res!968070 (validKeyInArray!0 (select (arr!47146 a!2831) j!81)))))

(declare-fun b!1435455 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97691 (_ BitVec 32)) SeekEntryResult!11327)

(assert (=> b!1435455 (= e!810292 (= (seekEntryOrOpen!0 (select (arr!47146 a!2831) j!81) a!2831 mask!2608) (Found!11327 j!81)))))

(assert (= (and start!123952 res!968068) b!1435451))

(assert (= (and b!1435451 res!968067) b!1435443))

(assert (= (and b!1435443 res!968077) b!1435454))

(assert (= (and b!1435454 res!968070) b!1435452))

(assert (= (and b!1435452 res!968071) b!1435453))

(assert (= (and b!1435453 res!968075) b!1435444))

(assert (= (and b!1435444 res!968073) b!1435446))

(assert (= (and b!1435446 res!968080) b!1435445))

(assert (= (and b!1435445 res!968069) b!1435450))

(assert (= (and b!1435450 res!968076) b!1435447))

(assert (= (and b!1435447 res!968078) b!1435449))

(assert (= (and b!1435449 res!968072) b!1435442))

(assert (= (and b!1435442 res!968079) b!1435455))

(assert (= (and b!1435442 (not res!968074)) b!1435448))

(declare-fun m!1325167 () Bool)

(assert (=> b!1435455 m!1325167))

(assert (=> b!1435455 m!1325167))

(declare-fun m!1325169 () Bool)

(assert (=> b!1435455 m!1325169))

(declare-fun m!1325171 () Bool)

(assert (=> b!1435443 m!1325171))

(assert (=> b!1435443 m!1325171))

(declare-fun m!1325173 () Bool)

(assert (=> b!1435443 m!1325173))

(declare-fun m!1325175 () Bool)

(assert (=> b!1435448 m!1325175))

(declare-fun m!1325177 () Bool)

(assert (=> b!1435442 m!1325177))

(declare-fun m!1325179 () Bool)

(assert (=> b!1435442 m!1325179))

(declare-fun m!1325181 () Bool)

(assert (=> b!1435442 m!1325181))

(declare-fun m!1325183 () Bool)

(assert (=> b!1435442 m!1325183))

(assert (=> b!1435442 m!1325167))

(declare-fun m!1325185 () Bool)

(assert (=> b!1435442 m!1325185))

(assert (=> b!1435446 m!1325167))

(assert (=> b!1435446 m!1325167))

(declare-fun m!1325187 () Bool)

(assert (=> b!1435446 m!1325187))

(assert (=> b!1435446 m!1325187))

(assert (=> b!1435446 m!1325167))

(declare-fun m!1325189 () Bool)

(assert (=> b!1435446 m!1325189))

(declare-fun m!1325191 () Bool)

(assert (=> b!1435452 m!1325191))

(declare-fun m!1325193 () Bool)

(assert (=> b!1435445 m!1325193))

(assert (=> b!1435445 m!1325193))

(declare-fun m!1325195 () Bool)

(assert (=> b!1435445 m!1325195))

(assert (=> b!1435445 m!1325177))

(declare-fun m!1325197 () Bool)

(assert (=> b!1435445 m!1325197))

(declare-fun m!1325199 () Bool)

(assert (=> b!1435453 m!1325199))

(declare-fun m!1325201 () Bool)

(assert (=> b!1435447 m!1325201))

(declare-fun m!1325203 () Bool)

(assert (=> start!123952 m!1325203))

(declare-fun m!1325205 () Bool)

(assert (=> start!123952 m!1325205))

(assert (=> b!1435450 m!1325167))

(assert (=> b!1435450 m!1325167))

(declare-fun m!1325207 () Bool)

(assert (=> b!1435450 m!1325207))

(assert (=> b!1435454 m!1325167))

(assert (=> b!1435454 m!1325167))

(declare-fun m!1325209 () Bool)

(assert (=> b!1435454 m!1325209))

(check-sat (not b!1435453) (not b!1435445) (not b!1435450) (not b!1435448) (not b!1435443) (not start!123952) (not b!1435446) (not b!1435442) (not b!1435455) (not b!1435454) (not b!1435447) (not b!1435452))
(check-sat)
