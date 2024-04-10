; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129582 () Bool)

(assert start!129582)

(declare-fun b!1521196 () Bool)

(declare-fun res!1040424 () Bool)

(declare-fun e!848467 () Bool)

(assert (=> b!1521196 (=> (not res!1040424) (not e!848467))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101257 0))(
  ( (array!101258 (arr!48861 (Array (_ BitVec 32) (_ BitVec 64))) (size!49411 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101257)

(assert (=> b!1521196 (= res!1040424 (and (= (size!49411 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49411 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49411 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521197 () Bool)

(declare-fun res!1040420 () Bool)

(assert (=> b!1521197 (=> (not res!1040420) (not e!848467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521197 (= res!1040420 (validKeyInArray!0 (select (arr!48861 a!2804) i!961)))))

(declare-fun b!1521198 () Bool)

(assert (=> b!1521198 (= e!848467 false)))

(declare-datatypes ((SeekEntryResult!13026 0))(
  ( (MissingZero!13026 (index!54499 (_ BitVec 32))) (Found!13026 (index!54500 (_ BitVec 32))) (Intermediate!13026 (undefined!13838 Bool) (index!54501 (_ BitVec 32)) (x!136198 (_ BitVec 32))) (Undefined!13026) (MissingVacant!13026 (index!54502 (_ BitVec 32))) )
))
(declare-fun lt!659320 () SeekEntryResult!13026)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101257 (_ BitVec 32)) SeekEntryResult!13026)

(assert (=> b!1521198 (= lt!659320 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48861 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521199 () Bool)

(declare-fun res!1040425 () Bool)

(assert (=> b!1521199 (=> (not res!1040425) (not e!848467))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521199 (= res!1040425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48861 a!2804) j!70) mask!2512) (select (arr!48861 a!2804) j!70) a!2804 mask!2512) (Intermediate!13026 false resIndex!21 resX!21)))))

(declare-fun b!1521200 () Bool)

(declare-fun res!1040418 () Bool)

(assert (=> b!1521200 (=> (not res!1040418) (not e!848467))))

(assert (=> b!1521200 (= res!1040418 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49411 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49411 a!2804))))))

(declare-fun b!1521201 () Bool)

(declare-fun res!1040422 () Bool)

(assert (=> b!1521201 (=> (not res!1040422) (not e!848467))))

(assert (=> b!1521201 (= res!1040422 (validKeyInArray!0 (select (arr!48861 a!2804) j!70)))))

(declare-fun b!1521203 () Bool)

(declare-fun res!1040419 () Bool)

(assert (=> b!1521203 (=> (not res!1040419) (not e!848467))))

(declare-datatypes ((List!35344 0))(
  ( (Nil!35341) (Cons!35340 (h!36761 (_ BitVec 64)) (t!50038 List!35344)) )
))
(declare-fun arrayNoDuplicates!0 (array!101257 (_ BitVec 32) List!35344) Bool)

(assert (=> b!1521203 (= res!1040419 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35341))))

(declare-fun res!1040421 () Bool)

(assert (=> start!129582 (=> (not res!1040421) (not e!848467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129582 (= res!1040421 (validMask!0 mask!2512))))

(assert (=> start!129582 e!848467))

(assert (=> start!129582 true))

(declare-fun array_inv!37889 (array!101257) Bool)

(assert (=> start!129582 (array_inv!37889 a!2804)))

(declare-fun b!1521202 () Bool)

(declare-fun res!1040423 () Bool)

(assert (=> b!1521202 (=> (not res!1040423) (not e!848467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101257 (_ BitVec 32)) Bool)

(assert (=> b!1521202 (= res!1040423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129582 res!1040421) b!1521196))

(assert (= (and b!1521196 res!1040424) b!1521197))

(assert (= (and b!1521197 res!1040420) b!1521201))

(assert (= (and b!1521201 res!1040422) b!1521202))

(assert (= (and b!1521202 res!1040423) b!1521203))

(assert (= (and b!1521203 res!1040419) b!1521200))

(assert (= (and b!1521200 res!1040418) b!1521199))

(assert (= (and b!1521199 res!1040425) b!1521198))

(declare-fun m!1404309 () Bool)

(assert (=> b!1521202 m!1404309))

(declare-fun m!1404311 () Bool)

(assert (=> start!129582 m!1404311))

(declare-fun m!1404313 () Bool)

(assert (=> start!129582 m!1404313))

(declare-fun m!1404315 () Bool)

(assert (=> b!1521199 m!1404315))

(assert (=> b!1521199 m!1404315))

(declare-fun m!1404317 () Bool)

(assert (=> b!1521199 m!1404317))

(assert (=> b!1521199 m!1404317))

(assert (=> b!1521199 m!1404315))

(declare-fun m!1404319 () Bool)

(assert (=> b!1521199 m!1404319))

(assert (=> b!1521198 m!1404315))

(assert (=> b!1521198 m!1404315))

(declare-fun m!1404321 () Bool)

(assert (=> b!1521198 m!1404321))

(declare-fun m!1404323 () Bool)

(assert (=> b!1521203 m!1404323))

(declare-fun m!1404325 () Bool)

(assert (=> b!1521197 m!1404325))

(assert (=> b!1521197 m!1404325))

(declare-fun m!1404327 () Bool)

(assert (=> b!1521197 m!1404327))

(assert (=> b!1521201 m!1404315))

(assert (=> b!1521201 m!1404315))

(declare-fun m!1404329 () Bool)

(assert (=> b!1521201 m!1404329))

(check-sat (not b!1521199) (not b!1521198) (not b!1521201) (not b!1521202) (not b!1521197) (not start!129582) (not b!1521203))
