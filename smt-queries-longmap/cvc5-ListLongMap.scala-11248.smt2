; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131156 () Bool)

(assert start!131156)

(declare-fun b!1538604 () Bool)

(declare-fun res!1055589 () Bool)

(declare-fun e!856032 () Bool)

(assert (=> b!1538604 (=> (not res!1055589) (not e!856032))))

(declare-datatypes ((array!102221 0))(
  ( (array!102222 (arr!49325 (Array (_ BitVec 32) (_ BitVec 64))) (size!49875 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102221)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538604 (= res!1055589 (not (= (select (arr!49325 a!2792) index!463) (select (arr!49325 a!2792) j!64))))))

(declare-fun b!1538605 () Bool)

(declare-fun res!1055586 () Bool)

(assert (=> b!1538605 (=> (not res!1055586) (not e!856032))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538605 (= res!1055586 (and (= (size!49875 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49875 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49875 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538606 () Bool)

(assert (=> b!1538606 (= e!856032 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664918 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538606 (= lt!664918 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538608 () Bool)

(declare-fun res!1055582 () Bool)

(assert (=> b!1538608 (=> (not res!1055582) (not e!856032))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538608 (= res!1055582 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49875 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49875 a!2792)) (= (select (arr!49325 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538609 () Bool)

(declare-fun res!1055585 () Bool)

(assert (=> b!1538609 (=> (not res!1055585) (not e!856032))))

(declare-datatypes ((List!35799 0))(
  ( (Nil!35796) (Cons!35795 (h!37240 (_ BitVec 64)) (t!50493 List!35799)) )
))
(declare-fun arrayNoDuplicates!0 (array!102221 (_ BitVec 32) List!35799) Bool)

(assert (=> b!1538609 (= res!1055585 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35796))))

(declare-fun b!1538610 () Bool)

(declare-fun res!1055590 () Bool)

(assert (=> b!1538610 (=> (not res!1055590) (not e!856032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538610 (= res!1055590 (validKeyInArray!0 (select (arr!49325 a!2792) j!64)))))

(declare-fun b!1538611 () Bool)

(declare-fun res!1055587 () Bool)

(assert (=> b!1538611 (=> (not res!1055587) (not e!856032))))

(declare-datatypes ((SeekEntryResult!13451 0))(
  ( (MissingZero!13451 (index!56199 (_ BitVec 32))) (Found!13451 (index!56200 (_ BitVec 32))) (Intermediate!13451 (undefined!14263 Bool) (index!56201 (_ BitVec 32)) (x!137936 (_ BitVec 32))) (Undefined!13451) (MissingVacant!13451 (index!56202 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102221 (_ BitVec 32)) SeekEntryResult!13451)

(assert (=> b!1538611 (= res!1055587 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49325 a!2792) j!64) a!2792 mask!2480) (Found!13451 j!64)))))

(declare-fun b!1538612 () Bool)

(declare-fun res!1055584 () Bool)

(assert (=> b!1538612 (=> (not res!1055584) (not e!856032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102221 (_ BitVec 32)) Bool)

(assert (=> b!1538612 (= res!1055584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538607 () Bool)

(declare-fun res!1055583 () Bool)

(assert (=> b!1538607 (=> (not res!1055583) (not e!856032))))

(assert (=> b!1538607 (= res!1055583 (validKeyInArray!0 (select (arr!49325 a!2792) i!951)))))

(declare-fun res!1055588 () Bool)

(assert (=> start!131156 (=> (not res!1055588) (not e!856032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131156 (= res!1055588 (validMask!0 mask!2480))))

(assert (=> start!131156 e!856032))

(assert (=> start!131156 true))

(declare-fun array_inv!38353 (array!102221) Bool)

(assert (=> start!131156 (array_inv!38353 a!2792)))

(assert (= (and start!131156 res!1055588) b!1538605))

(assert (= (and b!1538605 res!1055586) b!1538607))

(assert (= (and b!1538607 res!1055583) b!1538610))

(assert (= (and b!1538610 res!1055590) b!1538612))

(assert (= (and b!1538612 res!1055584) b!1538609))

(assert (= (and b!1538609 res!1055585) b!1538608))

(assert (= (and b!1538608 res!1055582) b!1538611))

(assert (= (and b!1538611 res!1055587) b!1538604))

(assert (= (and b!1538604 res!1055589) b!1538606))

(declare-fun m!1421019 () Bool)

(assert (=> b!1538607 m!1421019))

(assert (=> b!1538607 m!1421019))

(declare-fun m!1421021 () Bool)

(assert (=> b!1538607 m!1421021))

(declare-fun m!1421023 () Bool)

(assert (=> b!1538611 m!1421023))

(assert (=> b!1538611 m!1421023))

(declare-fun m!1421025 () Bool)

(assert (=> b!1538611 m!1421025))

(declare-fun m!1421027 () Bool)

(assert (=> b!1538609 m!1421027))

(declare-fun m!1421029 () Bool)

(assert (=> b!1538612 m!1421029))

(assert (=> b!1538610 m!1421023))

(assert (=> b!1538610 m!1421023))

(declare-fun m!1421031 () Bool)

(assert (=> b!1538610 m!1421031))

(declare-fun m!1421033 () Bool)

(assert (=> b!1538604 m!1421033))

(assert (=> b!1538604 m!1421023))

(declare-fun m!1421035 () Bool)

(assert (=> start!131156 m!1421035))

(declare-fun m!1421037 () Bool)

(assert (=> start!131156 m!1421037))

(declare-fun m!1421039 () Bool)

(assert (=> b!1538606 m!1421039))

(declare-fun m!1421041 () Bool)

(assert (=> b!1538608 m!1421041))

(push 1)

(assert (not b!1538607))

(assert (not start!131156))

(assert (not b!1538610))

(assert (not b!1538606))

(assert (not b!1538611))

(assert (not b!1538609))

(assert (not b!1538612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

