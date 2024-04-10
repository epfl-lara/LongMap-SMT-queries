; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130744 () Bool)

(assert start!130744)

(declare-fun b!1533352 () Bool)

(declare-fun res!1050439 () Bool)

(declare-fun e!854212 () Bool)

(assert (=> b!1533352 (=> (not res!1050439) (not e!854212))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101842 0))(
  ( (array!101843 (arr!49137 (Array (_ BitVec 32) (_ BitVec 64))) (size!49687 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101842)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533352 (= res!1050439 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49687 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49687 a!2792)) (= (select (arr!49137 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533353 () Bool)

(declare-fun res!1050443 () Bool)

(assert (=> b!1533353 (=> (not res!1050443) (not e!854212))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101842 (_ BitVec 32)) Bool)

(assert (=> b!1533353 (= res!1050443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533354 () Bool)

(declare-fun res!1050445 () Bool)

(assert (=> b!1533354 (=> (not res!1050445) (not e!854212))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533354 (= res!1050445 (and (= (size!49687 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49687 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49687 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533355 () Bool)

(declare-fun res!1050441 () Bool)

(assert (=> b!1533355 (=> (not res!1050441) (not e!854212))))

(declare-datatypes ((List!35611 0))(
  ( (Nil!35608) (Cons!35607 (h!37052 (_ BitVec 64)) (t!50305 List!35611)) )
))
(declare-fun arrayNoDuplicates!0 (array!101842 (_ BitVec 32) List!35611) Bool)

(assert (=> b!1533355 (= res!1050441 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35608))))

(declare-fun b!1533356 () Bool)

(assert (=> b!1533356 (= e!854212 (and (= (select (arr!49137 a!2792) index!463) (select (arr!49137 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533357 () Bool)

(declare-fun res!1050438 () Bool)

(assert (=> b!1533357 (=> (not res!1050438) (not e!854212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533357 (= res!1050438 (validKeyInArray!0 (select (arr!49137 a!2792) i!951)))))

(declare-fun b!1533359 () Bool)

(declare-fun res!1050444 () Bool)

(assert (=> b!1533359 (=> (not res!1050444) (not e!854212))))

(assert (=> b!1533359 (= res!1050444 (validKeyInArray!0 (select (arr!49137 a!2792) j!64)))))

(declare-fun b!1533358 () Bool)

(declare-fun res!1050442 () Bool)

(assert (=> b!1533358 (=> (not res!1050442) (not e!854212))))

(declare-datatypes ((SeekEntryResult!13269 0))(
  ( (MissingZero!13269 (index!55471 (_ BitVec 32))) (Found!13269 (index!55472 (_ BitVec 32))) (Intermediate!13269 (undefined!14081 Bool) (index!55473 (_ BitVec 32)) (x!137247 (_ BitVec 32))) (Undefined!13269) (MissingVacant!13269 (index!55474 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101842 (_ BitVec 32)) SeekEntryResult!13269)

(assert (=> b!1533358 (= res!1050442 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49137 a!2792) j!64) a!2792 mask!2480) (Found!13269 j!64)))))

(declare-fun res!1050440 () Bool)

(assert (=> start!130744 (=> (not res!1050440) (not e!854212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130744 (= res!1050440 (validMask!0 mask!2480))))

(assert (=> start!130744 e!854212))

(assert (=> start!130744 true))

(declare-fun array_inv!38165 (array!101842) Bool)

(assert (=> start!130744 (array_inv!38165 a!2792)))

(assert (= (and start!130744 res!1050440) b!1533354))

(assert (= (and b!1533354 res!1050445) b!1533357))

(assert (= (and b!1533357 res!1050438) b!1533359))

(assert (= (and b!1533359 res!1050444) b!1533353))

(assert (= (and b!1533353 res!1050443) b!1533355))

(assert (= (and b!1533355 res!1050441) b!1533352))

(assert (= (and b!1533352 res!1050439) b!1533358))

(assert (= (and b!1533358 res!1050442) b!1533356))

(declare-fun m!1416049 () Bool)

(assert (=> b!1533359 m!1416049))

(assert (=> b!1533359 m!1416049))

(declare-fun m!1416051 () Bool)

(assert (=> b!1533359 m!1416051))

(declare-fun m!1416053 () Bool)

(assert (=> b!1533357 m!1416053))

(assert (=> b!1533357 m!1416053))

(declare-fun m!1416055 () Bool)

(assert (=> b!1533357 m!1416055))

(declare-fun m!1416057 () Bool)

(assert (=> b!1533352 m!1416057))

(declare-fun m!1416059 () Bool)

(assert (=> b!1533353 m!1416059))

(declare-fun m!1416061 () Bool)

(assert (=> b!1533356 m!1416061))

(assert (=> b!1533356 m!1416049))

(declare-fun m!1416063 () Bool)

(assert (=> b!1533355 m!1416063))

(assert (=> b!1533358 m!1416049))

(assert (=> b!1533358 m!1416049))

(declare-fun m!1416065 () Bool)

(assert (=> b!1533358 m!1416065))

(declare-fun m!1416067 () Bool)

(assert (=> start!130744 m!1416067))

(declare-fun m!1416069 () Bool)

(assert (=> start!130744 m!1416069))

(check-sat (not b!1533357) (not start!130744) (not b!1533358) (not b!1533355) (not b!1533359) (not b!1533353))
(check-sat)
