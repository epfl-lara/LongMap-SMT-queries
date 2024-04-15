; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130710 () Bool)

(assert start!130710)

(declare-fun res!1050494 () Bool)

(declare-fun e!854061 () Bool)

(assert (=> start!130710 (=> (not res!1050494) (not e!854061))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130710 (= res!1050494 (validMask!0 mask!2480))))

(assert (=> start!130710 e!854061))

(assert (=> start!130710 true))

(declare-datatypes ((array!101806 0))(
  ( (array!101807 (arr!49120 (Array (_ BitVec 32) (_ BitVec 64))) (size!49672 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101806)

(declare-fun array_inv!38353 (array!101806) Bool)

(assert (=> start!130710 (array_inv!38353 a!2792)))

(declare-fun b!1533222 () Bool)

(declare-fun res!1050499 () Bool)

(assert (=> b!1533222 (=> (not res!1050499) (not e!854061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101806 (_ BitVec 32)) Bool)

(assert (=> b!1533222 (= res!1050499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533223 () Bool)

(declare-fun res!1050492 () Bool)

(assert (=> b!1533223 (=> (not res!1050492) (not e!854061))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13277 0))(
  ( (MissingZero!13277 (index!55503 (_ BitVec 32))) (Found!13277 (index!55504 (_ BitVec 32))) (Intermediate!13277 (undefined!14089 Bool) (index!55505 (_ BitVec 32)) (x!137274 (_ BitVec 32))) (Undefined!13277) (MissingVacant!13277 (index!55506 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101806 (_ BitVec 32)) SeekEntryResult!13277)

(assert (=> b!1533223 (= res!1050492 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49120 a!2792) j!64) a!2792 mask!2480) (Found!13277 j!64)))))

(declare-fun b!1533224 () Bool)

(declare-fun res!1050498 () Bool)

(assert (=> b!1533224 (=> (not res!1050498) (not e!854061))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533224 (= res!1050498 (and (= (size!49672 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49672 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49672 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533225 () Bool)

(declare-fun res!1050495 () Bool)

(assert (=> b!1533225 (=> (not res!1050495) (not e!854061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533225 (= res!1050495 (validKeyInArray!0 (select (arr!49120 a!2792) j!64)))))

(declare-fun b!1533226 () Bool)

(declare-fun res!1050493 () Bool)

(assert (=> b!1533226 (=> (not res!1050493) (not e!854061))))

(declare-datatypes ((List!35672 0))(
  ( (Nil!35669) (Cons!35668 (h!37114 (_ BitVec 64)) (t!50358 List!35672)) )
))
(declare-fun arrayNoDuplicates!0 (array!101806 (_ BitVec 32) List!35672) Bool)

(assert (=> b!1533226 (= res!1050493 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35669))))

(declare-fun b!1533227 () Bool)

(declare-fun res!1050497 () Bool)

(assert (=> b!1533227 (=> (not res!1050497) (not e!854061))))

(assert (=> b!1533227 (= res!1050497 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49672 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49672 a!2792)) (= (select (arr!49120 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533228 () Bool)

(assert (=> b!1533228 (= e!854061 (and (= (select (arr!49120 a!2792) index!463) (select (arr!49120 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49120 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1533229 () Bool)

(declare-fun res!1050496 () Bool)

(assert (=> b!1533229 (=> (not res!1050496) (not e!854061))))

(assert (=> b!1533229 (= res!1050496 (validKeyInArray!0 (select (arr!49120 a!2792) i!951)))))

(assert (= (and start!130710 res!1050494) b!1533224))

(assert (= (and b!1533224 res!1050498) b!1533229))

(assert (= (and b!1533229 res!1050496) b!1533225))

(assert (= (and b!1533225 res!1050495) b!1533222))

(assert (= (and b!1533222 res!1050499) b!1533226))

(assert (= (and b!1533226 res!1050493) b!1533227))

(assert (= (and b!1533227 res!1050497) b!1533223))

(assert (= (and b!1533223 res!1050492) b!1533228))

(declare-fun m!1415327 () Bool)

(assert (=> start!130710 m!1415327))

(declare-fun m!1415329 () Bool)

(assert (=> start!130710 m!1415329))

(declare-fun m!1415331 () Bool)

(assert (=> b!1533223 m!1415331))

(assert (=> b!1533223 m!1415331))

(declare-fun m!1415333 () Bool)

(assert (=> b!1533223 m!1415333))

(declare-fun m!1415335 () Bool)

(assert (=> b!1533228 m!1415335))

(assert (=> b!1533228 m!1415331))

(declare-fun m!1415337 () Bool)

(assert (=> b!1533228 m!1415337))

(declare-fun m!1415339 () Bool)

(assert (=> b!1533228 m!1415339))

(assert (=> b!1533225 m!1415331))

(assert (=> b!1533225 m!1415331))

(declare-fun m!1415341 () Bool)

(assert (=> b!1533225 m!1415341))

(declare-fun m!1415343 () Bool)

(assert (=> b!1533227 m!1415343))

(declare-fun m!1415345 () Bool)

(assert (=> b!1533229 m!1415345))

(assert (=> b!1533229 m!1415345))

(declare-fun m!1415347 () Bool)

(assert (=> b!1533229 m!1415347))

(declare-fun m!1415349 () Bool)

(assert (=> b!1533226 m!1415349))

(declare-fun m!1415351 () Bool)

(assert (=> b!1533222 m!1415351))

(check-sat (not b!1533222) (not b!1533229) (not b!1533223) (not b!1533226) (not b!1533225) (not start!130710))
(check-sat)
