; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118608 () Bool)

(assert start!118608)

(declare-fun b!1386619 () Bool)

(declare-fun res!927809 () Bool)

(declare-fun e!785478 () Bool)

(assert (=> b!1386619 (=> (not res!927809) (not e!785478))))

(declare-datatypes ((array!94837 0))(
  ( (array!94838 (arr!45795 (Array (_ BitVec 32) (_ BitVec 64))) (size!46347 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94837)

(declare-datatypes ((List!32401 0))(
  ( (Nil!32398) (Cons!32397 (h!33606 (_ BitVec 64)) (t!47087 List!32401)) )
))
(declare-fun arrayNoDuplicates!0 (array!94837 (_ BitVec 32) List!32401) Bool)

(assert (=> b!1386619 (= res!927809 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32398))))

(declare-fun b!1386620 () Bool)

(declare-fun res!927812 () Bool)

(assert (=> b!1386620 (=> (not res!927812) (not e!785478))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386620 (= res!927812 (validKeyInArray!0 (select (arr!45795 a!2938) i!1065)))))

(declare-fun b!1386621 () Bool)

(declare-datatypes ((Unit!46176 0))(
  ( (Unit!46177) )
))
(declare-fun e!785477 () Unit!46176)

(declare-fun lt!609364 () Unit!46176)

(assert (=> b!1386621 (= e!785477 lt!609364)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609363 () Unit!46176)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46176)

(assert (=> b!1386621 (= lt!609363 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10164 0))(
  ( (MissingZero!10164 (index!43027 (_ BitVec 32))) (Found!10164 (index!43028 (_ BitVec 32))) (Intermediate!10164 (undefined!10976 Bool) (index!43029 (_ BitVec 32)) (x!124634 (_ BitVec 32))) (Undefined!10164) (MissingVacant!10164 (index!43030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94837 (_ BitVec 32)) SeekEntryResult!10164)

(assert (=> b!1386621 (= (seekEntryOrOpen!0 (select (arr!45795 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45795 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94838 (store (arr!45795 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46347 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46176)

(assert (=> b!1386621 (= lt!609364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94837 (_ BitVec 32)) Bool)

(assert (=> b!1386621 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386622 () Bool)

(declare-fun e!785476 () Bool)

(assert (=> b!1386622 (= e!785476 (validKeyInArray!0 (select (arr!45795 a!2938) startIndex!16)))))

(declare-fun b!1386623 () Bool)

(declare-fun res!927811 () Bool)

(assert (=> b!1386623 (=> (not res!927811) (not e!785478))))

(assert (=> b!1386623 (= res!927811 (and (= (size!46347 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46347 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46347 a!2938))))))

(declare-fun res!927807 () Bool)

(assert (=> start!118608 (=> (not res!927807) (not e!785478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118608 (= res!927807 (validMask!0 mask!2987))))

(assert (=> start!118608 e!785478))

(assert (=> start!118608 true))

(declare-fun array_inv!35028 (array!94837) Bool)

(assert (=> start!118608 (array_inv!35028 a!2938)))

(declare-fun b!1386624 () Bool)

(declare-fun res!927806 () Bool)

(assert (=> b!1386624 (=> (not res!927806) (not e!785478))))

(assert (=> b!1386624 (= res!927806 (and (not (= (select (arr!45795 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45795 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386625 () Bool)

(assert (=> b!1386625 (= e!785478 false)))

(declare-fun lt!609365 () Unit!46176)

(assert (=> b!1386625 (= lt!609365 e!785477)))

(declare-fun c!128849 () Bool)

(assert (=> b!1386625 (= c!128849 e!785476)))

(declare-fun res!927810 () Bool)

(assert (=> b!1386625 (=> (not res!927810) (not e!785476))))

(assert (=> b!1386625 (= res!927810 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386626 () Bool)

(declare-fun res!927808 () Bool)

(assert (=> b!1386626 (=> (not res!927808) (not e!785478))))

(assert (=> b!1386626 (= res!927808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386627 () Bool)

(declare-fun Unit!46178 () Unit!46176)

(assert (=> b!1386627 (= e!785477 Unit!46178)))

(assert (= (and start!118608 res!927807) b!1386623))

(assert (= (and b!1386623 res!927811) b!1386620))

(assert (= (and b!1386620 res!927812) b!1386619))

(assert (= (and b!1386619 res!927809) b!1386626))

(assert (= (and b!1386626 res!927808) b!1386624))

(assert (= (and b!1386624 res!927806) b!1386625))

(assert (= (and b!1386625 res!927810) b!1386622))

(assert (= (and b!1386625 c!128849) b!1386621))

(assert (= (and b!1386625 (not c!128849)) b!1386627))

(declare-fun m!1271577 () Bool)

(assert (=> b!1386621 m!1271577))

(declare-fun m!1271579 () Bool)

(assert (=> b!1386621 m!1271579))

(assert (=> b!1386621 m!1271579))

(declare-fun m!1271581 () Bool)

(assert (=> b!1386621 m!1271581))

(declare-fun m!1271583 () Bool)

(assert (=> b!1386621 m!1271583))

(declare-fun m!1271585 () Bool)

(assert (=> b!1386621 m!1271585))

(declare-fun m!1271587 () Bool)

(assert (=> b!1386621 m!1271587))

(declare-fun m!1271589 () Bool)

(assert (=> b!1386621 m!1271589))

(assert (=> b!1386621 m!1271587))

(declare-fun m!1271591 () Bool)

(assert (=> b!1386621 m!1271591))

(declare-fun m!1271593 () Bool)

(assert (=> b!1386620 m!1271593))

(assert (=> b!1386620 m!1271593))

(declare-fun m!1271595 () Bool)

(assert (=> b!1386620 m!1271595))

(assert (=> b!1386622 m!1271587))

(assert (=> b!1386622 m!1271587))

(declare-fun m!1271597 () Bool)

(assert (=> b!1386622 m!1271597))

(assert (=> b!1386624 m!1271593))

(declare-fun m!1271599 () Bool)

(assert (=> b!1386619 m!1271599))

(declare-fun m!1271601 () Bool)

(assert (=> start!118608 m!1271601))

(declare-fun m!1271603 () Bool)

(assert (=> start!118608 m!1271603))

(declare-fun m!1271605 () Bool)

(assert (=> b!1386626 m!1271605))

(push 1)

(assert (not b!1386626))

(assert (not start!118608))

(assert (not b!1386620))

(assert (not b!1386621))

(assert (not b!1386622))

(assert (not b!1386619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

