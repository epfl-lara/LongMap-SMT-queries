; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131366 () Bool)

(assert start!131366)

(declare-fun b!1540210 () Bool)

(declare-fun res!1056909 () Bool)

(declare-fun e!856636 () Bool)

(assert (=> b!1540210 (=> (not res!1056909) (not e!856636))))

(declare-datatypes ((array!102314 0))(
  ( (array!102315 (arr!49367 (Array (_ BitVec 32) (_ BitVec 64))) (size!49917 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102314)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540210 (= res!1056909 (and (= (size!49917 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49917 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49917 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540211 () Bool)

(declare-fun res!1056900 () Bool)

(assert (=> b!1540211 (=> (not res!1056900) (not e!856636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540211 (= res!1056900 (validKeyInArray!0 (select (arr!49367 a!2792) j!64)))))

(declare-fun b!1540212 () Bool)

(declare-fun e!856632 () Bool)

(declare-fun e!856634 () Bool)

(assert (=> b!1540212 (= e!856632 e!856634)))

(declare-fun res!1056906 () Bool)

(assert (=> b!1540212 (=> (not res!1056906) (not e!856634))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665265 () (_ BitVec 32))

(assert (=> b!1540212 (= res!1056906 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665265 #b00000000000000000000000000000000) (bvslt lt!665265 (size!49917 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540212 (= lt!665265 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540213 () Bool)

(assert (=> b!1540213 (= e!856636 e!856632)))

(declare-fun res!1056902 () Bool)

(assert (=> b!1540213 (=> (not res!1056902) (not e!856632))))

(declare-datatypes ((SeekEntryResult!13493 0))(
  ( (MissingZero!13493 (index!56367 (_ BitVec 32))) (Found!13493 (index!56368 (_ BitVec 32))) (Intermediate!13493 (undefined!14305 Bool) (index!56369 (_ BitVec 32)) (x!138108 (_ BitVec 32))) (Undefined!13493) (MissingVacant!13493 (index!56370 (_ BitVec 32))) )
))
(declare-fun lt!665264 () SeekEntryResult!13493)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102314 (_ BitVec 32)) SeekEntryResult!13493)

(assert (=> b!1540213 (= res!1056902 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49367 a!2792) j!64) a!2792 mask!2480) lt!665264))))

(assert (=> b!1540213 (= lt!665264 (Found!13493 j!64))))

(declare-fun b!1540214 () Bool)

(declare-fun res!1056903 () Bool)

(assert (=> b!1540214 (=> (not res!1056903) (not e!856636))))

(assert (=> b!1540214 (= res!1056903 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49917 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49917 a!2792)) (= (select (arr!49367 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540215 () Bool)

(declare-fun res!1056901 () Bool)

(assert (=> b!1540215 (=> (not res!1056901) (not e!856632))))

(assert (=> b!1540215 (= res!1056901 (not (= (select (arr!49367 a!2792) index!463) (select (arr!49367 a!2792) j!64))))))

(declare-fun b!1540216 () Bool)

(declare-fun res!1056908 () Bool)

(assert (=> b!1540216 (=> (not res!1056908) (not e!856636))))

(assert (=> b!1540216 (= res!1056908 (validKeyInArray!0 (select (arr!49367 a!2792) i!951)))))

(declare-fun b!1540217 () Bool)

(declare-fun e!856633 () Bool)

(assert (=> b!1540217 (= e!856633 (not true))))

(declare-fun lt!665266 () SeekEntryResult!13493)

(assert (=> b!1540217 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665265 vacantIndex!5 (select (store (arr!49367 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102315 (store (arr!49367 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49917 a!2792)) mask!2480) lt!665266)))

(declare-datatypes ((Unit!51426 0))(
  ( (Unit!51427) )
))
(declare-fun lt!665263 () Unit!51426)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51426)

(assert (=> b!1540217 (= lt!665263 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665265 vacantIndex!5 mask!2480))))

(declare-fun b!1540218 () Bool)

(declare-fun res!1056910 () Bool)

(assert (=> b!1540218 (=> (not res!1056910) (not e!856636))))

(declare-datatypes ((List!35841 0))(
  ( (Nil!35838) (Cons!35837 (h!37282 (_ BitVec 64)) (t!50535 List!35841)) )
))
(declare-fun arrayNoDuplicates!0 (array!102314 (_ BitVec 32) List!35841) Bool)

(assert (=> b!1540218 (= res!1056910 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35838))))

(declare-fun b!1540219 () Bool)

(declare-fun res!1056904 () Bool)

(assert (=> b!1540219 (=> (not res!1056904) (not e!856636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102314 (_ BitVec 32)) Bool)

(assert (=> b!1540219 (= res!1056904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540220 () Bool)

(assert (=> b!1540220 (= e!856634 e!856633)))

(declare-fun res!1056905 () Bool)

(assert (=> b!1540220 (=> (not res!1056905) (not e!856633))))

(assert (=> b!1540220 (= res!1056905 (= lt!665266 lt!665264))))

(assert (=> b!1540220 (= lt!665266 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665265 vacantIndex!5 (select (arr!49367 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1056907 () Bool)

(assert (=> start!131366 (=> (not res!1056907) (not e!856636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131366 (= res!1056907 (validMask!0 mask!2480))))

(assert (=> start!131366 e!856636))

(assert (=> start!131366 true))

(declare-fun array_inv!38395 (array!102314) Bool)

(assert (=> start!131366 (array_inv!38395 a!2792)))

(assert (= (and start!131366 res!1056907) b!1540210))

(assert (= (and b!1540210 res!1056909) b!1540216))

(assert (= (and b!1540216 res!1056908) b!1540211))

(assert (= (and b!1540211 res!1056900) b!1540219))

(assert (= (and b!1540219 res!1056904) b!1540218))

(assert (= (and b!1540218 res!1056910) b!1540214))

(assert (= (and b!1540214 res!1056903) b!1540213))

(assert (= (and b!1540213 res!1056902) b!1540215))

(assert (= (and b!1540215 res!1056901) b!1540212))

(assert (= (and b!1540212 res!1056906) b!1540220))

(assert (= (and b!1540220 res!1056905) b!1540217))

(declare-fun m!1422315 () Bool)

(assert (=> b!1540212 m!1422315))

(declare-fun m!1422317 () Bool)

(assert (=> b!1540217 m!1422317))

(declare-fun m!1422319 () Bool)

(assert (=> b!1540217 m!1422319))

(assert (=> b!1540217 m!1422319))

(declare-fun m!1422321 () Bool)

(assert (=> b!1540217 m!1422321))

(declare-fun m!1422323 () Bool)

(assert (=> b!1540217 m!1422323))

(declare-fun m!1422325 () Bool)

(assert (=> b!1540220 m!1422325))

(assert (=> b!1540220 m!1422325))

(declare-fun m!1422327 () Bool)

(assert (=> b!1540220 m!1422327))

(declare-fun m!1422329 () Bool)

(assert (=> b!1540216 m!1422329))

(assert (=> b!1540216 m!1422329))

(declare-fun m!1422331 () Bool)

(assert (=> b!1540216 m!1422331))

(declare-fun m!1422333 () Bool)

(assert (=> b!1540219 m!1422333))

(assert (=> b!1540211 m!1422325))

(assert (=> b!1540211 m!1422325))

(declare-fun m!1422335 () Bool)

(assert (=> b!1540211 m!1422335))

(declare-fun m!1422337 () Bool)

(assert (=> start!131366 m!1422337))

(declare-fun m!1422339 () Bool)

(assert (=> start!131366 m!1422339))

(declare-fun m!1422341 () Bool)

(assert (=> b!1540215 m!1422341))

(assert (=> b!1540215 m!1422325))

(assert (=> b!1540213 m!1422325))

(assert (=> b!1540213 m!1422325))

(declare-fun m!1422343 () Bool)

(assert (=> b!1540213 m!1422343))

(declare-fun m!1422345 () Bool)

(assert (=> b!1540218 m!1422345))

(declare-fun m!1422347 () Bool)

(assert (=> b!1540214 m!1422347))

(push 1)

