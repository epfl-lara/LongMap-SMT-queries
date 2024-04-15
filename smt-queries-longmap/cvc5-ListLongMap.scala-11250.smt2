; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131122 () Bool)

(assert start!131122)

(declare-fun b!1538507 () Bool)

(declare-fun res!1055670 () Bool)

(declare-fun e!855883 () Bool)

(assert (=> b!1538507 (=> (not res!1055670) (not e!855883))))

(declare-datatypes ((array!102185 0))(
  ( (array!102186 (arr!49308 (Array (_ BitVec 32) (_ BitVec 64))) (size!49860 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102185)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538507 (= res!1055670 (validKeyInArray!0 (select (arr!49308 a!2792) i!951)))))

(declare-fun b!1538508 () Bool)

(declare-fun res!1055676 () Bool)

(assert (=> b!1538508 (=> (not res!1055676) (not e!855883))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102185 (_ BitVec 32)) Bool)

(assert (=> b!1538508 (= res!1055676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538509 () Bool)

(declare-fun res!1055669 () Bool)

(assert (=> b!1538509 (=> (not res!1055669) (not e!855883))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538509 (= res!1055669 (not (= (select (arr!49308 a!2792) index!463) (select (arr!49308 a!2792) j!64))))))

(declare-fun b!1538510 () Bool)

(declare-fun res!1055673 () Bool)

(assert (=> b!1538510 (=> (not res!1055673) (not e!855883))))

(declare-datatypes ((List!35860 0))(
  ( (Nil!35857) (Cons!35856 (h!37302 (_ BitVec 64)) (t!50546 List!35860)) )
))
(declare-fun arrayNoDuplicates!0 (array!102185 (_ BitVec 32) List!35860) Bool)

(assert (=> b!1538510 (= res!1055673 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35857))))

(declare-fun b!1538511 () Bool)

(declare-fun res!1055675 () Bool)

(assert (=> b!1538511 (=> (not res!1055675) (not e!855883))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538511 (= res!1055675 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49860 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49860 a!2792)) (= (select (arr!49308 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538512 () Bool)

(declare-fun res!1055677 () Bool)

(assert (=> b!1538512 (=> (not res!1055677) (not e!855883))))

(declare-datatypes ((SeekEntryResult!13459 0))(
  ( (MissingZero!13459 (index!56231 (_ BitVec 32))) (Found!13459 (index!56232 (_ BitVec 32))) (Intermediate!13459 (undefined!14271 Bool) (index!56233 (_ BitVec 32)) (x!137955 (_ BitVec 32))) (Undefined!13459) (MissingVacant!13459 (index!56234 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102185 (_ BitVec 32)) SeekEntryResult!13459)

(assert (=> b!1538512 (= res!1055677 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49308 a!2792) j!64) a!2792 mask!2480) (Found!13459 j!64)))))

(declare-fun b!1538513 () Bool)

(declare-fun res!1055672 () Bool)

(assert (=> b!1538513 (=> (not res!1055672) (not e!855883))))

(assert (=> b!1538513 (= res!1055672 (and (= (size!49860 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49860 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49860 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055674 () Bool)

(assert (=> start!131122 (=> (not res!1055674) (not e!855883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131122 (= res!1055674 (validMask!0 mask!2480))))

(assert (=> start!131122 e!855883))

(assert (=> start!131122 true))

(declare-fun array_inv!38541 (array!102185) Bool)

(assert (=> start!131122 (array_inv!38541 a!2792)))

(declare-fun b!1538514 () Bool)

(declare-fun res!1055671 () Bool)

(assert (=> b!1538514 (=> (not res!1055671) (not e!855883))))

(assert (=> b!1538514 (= res!1055671 (validKeyInArray!0 (select (arr!49308 a!2792) j!64)))))

(declare-fun b!1538515 () Bool)

(assert (=> b!1538515 (= e!855883 false)))

(declare-fun lt!664656 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538515 (= lt!664656 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131122 res!1055674) b!1538513))

(assert (= (and b!1538513 res!1055672) b!1538507))

(assert (= (and b!1538507 res!1055670) b!1538514))

(assert (= (and b!1538514 res!1055671) b!1538508))

(assert (= (and b!1538508 res!1055676) b!1538510))

(assert (= (and b!1538510 res!1055673) b!1538511))

(assert (= (and b!1538511 res!1055675) b!1538512))

(assert (= (and b!1538512 res!1055677) b!1538509))

(assert (= (and b!1538509 res!1055669) b!1538515))

(declare-fun m!1420319 () Bool)

(assert (=> b!1538509 m!1420319))

(declare-fun m!1420321 () Bool)

(assert (=> b!1538509 m!1420321))

(declare-fun m!1420323 () Bool)

(assert (=> b!1538510 m!1420323))

(declare-fun m!1420325 () Bool)

(assert (=> b!1538511 m!1420325))

(declare-fun m!1420327 () Bool)

(assert (=> b!1538515 m!1420327))

(declare-fun m!1420329 () Bool)

(assert (=> b!1538507 m!1420329))

(assert (=> b!1538507 m!1420329))

(declare-fun m!1420331 () Bool)

(assert (=> b!1538507 m!1420331))

(assert (=> b!1538512 m!1420321))

(assert (=> b!1538512 m!1420321))

(declare-fun m!1420333 () Bool)

(assert (=> b!1538512 m!1420333))

(assert (=> b!1538514 m!1420321))

(assert (=> b!1538514 m!1420321))

(declare-fun m!1420335 () Bool)

(assert (=> b!1538514 m!1420335))

(declare-fun m!1420337 () Bool)

(assert (=> b!1538508 m!1420337))

(declare-fun m!1420339 () Bool)

(assert (=> start!131122 m!1420339))

(declare-fun m!1420341 () Bool)

(assert (=> start!131122 m!1420341))

(push 1)

(assert (not start!131122))

(assert (not b!1538514))

(assert (not b!1538510))

(assert (not b!1538508))

(assert (not b!1538515))

(assert (not b!1538507))

(assert (not b!1538512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

