; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131254 () Bool)

(assert start!131254)

(declare-fun b!1539425 () Bool)

(declare-fun res!1056415 () Bool)

(declare-fun e!856207 () Bool)

(assert (=> b!1539425 (=> (not res!1056415) (not e!856207))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102239 0))(
  ( (array!102240 (arr!49332 (Array (_ BitVec 32) (_ BitVec 64))) (size!49884 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102239)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539425 (= res!1056415 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49884 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49884 a!2792)) (= (select (arr!49332 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539426 () Bool)

(declare-fun res!1056413 () Bool)

(assert (=> b!1539426 (=> (not res!1056413) (not e!856207))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102239 (_ BitVec 32)) Bool)

(assert (=> b!1539426 (= res!1056413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539428 () Bool)

(declare-fun res!1056411 () Bool)

(assert (=> b!1539428 (=> (not res!1056411) (not e!856207))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539428 (= res!1056411 (validKeyInArray!0 (select (arr!49332 a!2792) j!64)))))

(declare-fun b!1539429 () Bool)

(assert (=> b!1539429 (= e!856207 false)))

(declare-fun lt!664836 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539429 (= lt!664836 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539430 () Bool)

(declare-fun res!1056409 () Bool)

(assert (=> b!1539430 (=> (not res!1056409) (not e!856207))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539430 (= res!1056409 (and (= (size!49884 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49884 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49884 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539431 () Bool)

(declare-fun res!1056410 () Bool)

(assert (=> b!1539431 (=> (not res!1056410) (not e!856207))))

(assert (=> b!1539431 (= res!1056410 (not (= (select (arr!49332 a!2792) index!463) (select (arr!49332 a!2792) j!64))))))

(declare-fun b!1539427 () Bool)

(declare-fun res!1056412 () Bool)

(assert (=> b!1539427 (=> (not res!1056412) (not e!856207))))

(declare-datatypes ((List!35884 0))(
  ( (Nil!35881) (Cons!35880 (h!37326 (_ BitVec 64)) (t!50570 List!35884)) )
))
(declare-fun arrayNoDuplicates!0 (array!102239 (_ BitVec 32) List!35884) Bool)

(assert (=> b!1539427 (= res!1056412 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35881))))

(declare-fun res!1056408 () Bool)

(assert (=> start!131254 (=> (not res!1056408) (not e!856207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131254 (= res!1056408 (validMask!0 mask!2480))))

(assert (=> start!131254 e!856207))

(assert (=> start!131254 true))

(declare-fun array_inv!38565 (array!102239) Bool)

(assert (=> start!131254 (array_inv!38565 a!2792)))

(declare-fun b!1539432 () Bool)

(declare-fun res!1056414 () Bool)

(assert (=> b!1539432 (=> (not res!1056414) (not e!856207))))

(assert (=> b!1539432 (= res!1056414 (validKeyInArray!0 (select (arr!49332 a!2792) i!951)))))

(declare-fun b!1539433 () Bool)

(declare-fun res!1056407 () Bool)

(assert (=> b!1539433 (=> (not res!1056407) (not e!856207))))

(declare-datatypes ((SeekEntryResult!13483 0))(
  ( (MissingZero!13483 (index!56327 (_ BitVec 32))) (Found!13483 (index!56328 (_ BitVec 32))) (Intermediate!13483 (undefined!14295 Bool) (index!56329 (_ BitVec 32)) (x!138055 (_ BitVec 32))) (Undefined!13483) (MissingVacant!13483 (index!56330 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102239 (_ BitVec 32)) SeekEntryResult!13483)

(assert (=> b!1539433 (= res!1056407 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49332 a!2792) j!64) a!2792 mask!2480) (Found!13483 j!64)))))

(assert (= (and start!131254 res!1056408) b!1539430))

(assert (= (and b!1539430 res!1056409) b!1539432))

(assert (= (and b!1539432 res!1056414) b!1539428))

(assert (= (and b!1539428 res!1056411) b!1539426))

(assert (= (and b!1539426 res!1056413) b!1539427))

(assert (= (and b!1539427 res!1056412) b!1539425))

(assert (= (and b!1539425 res!1056415) b!1539433))

(assert (= (and b!1539433 res!1056407) b!1539431))

(assert (= (and b!1539431 res!1056410) b!1539429))

(declare-fun m!1421039 () Bool)

(assert (=> start!131254 m!1421039))

(declare-fun m!1421041 () Bool)

(assert (=> start!131254 m!1421041))

(declare-fun m!1421043 () Bool)

(assert (=> b!1539427 m!1421043))

(declare-fun m!1421045 () Bool)

(assert (=> b!1539426 m!1421045))

(declare-fun m!1421047 () Bool)

(assert (=> b!1539433 m!1421047))

(assert (=> b!1539433 m!1421047))

(declare-fun m!1421049 () Bool)

(assert (=> b!1539433 m!1421049))

(declare-fun m!1421051 () Bool)

(assert (=> b!1539431 m!1421051))

(assert (=> b!1539431 m!1421047))

(declare-fun m!1421053 () Bool)

(assert (=> b!1539432 m!1421053))

(assert (=> b!1539432 m!1421053))

(declare-fun m!1421055 () Bool)

(assert (=> b!1539432 m!1421055))

(declare-fun m!1421057 () Bool)

(assert (=> b!1539425 m!1421057))

(assert (=> b!1539428 m!1421047))

(assert (=> b!1539428 m!1421047))

(declare-fun m!1421059 () Bool)

(assert (=> b!1539428 m!1421059))

(declare-fun m!1421061 () Bool)

(assert (=> b!1539429 m!1421061))

(push 1)

(assert (not b!1539429))

(assert (not b!1539427))

(assert (not b!1539428))

(assert (not start!131254))

(assert (not b!1539426))

(assert (not b!1539432))

(assert (not b!1539433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

