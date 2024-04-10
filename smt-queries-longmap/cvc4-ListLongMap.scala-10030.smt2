; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118288 () Bool)

(assert start!118288)

(declare-fun b!1383486 () Bool)

(declare-fun res!925079 () Bool)

(declare-fun e!784115 () Bool)

(assert (=> b!1383486 (=> (not res!925079) (not e!784115))))

(declare-datatypes ((array!94591 0))(
  ( (array!94592 (arr!45673 (Array (_ BitVec 32) (_ BitVec 64))) (size!46223 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94591)

(declare-datatypes ((List!32201 0))(
  ( (Nil!32198) (Cons!32197 (h!33406 (_ BitVec 64)) (t!46895 List!32201)) )
))
(declare-fun arrayNoDuplicates!0 (array!94591 (_ BitVec 32) List!32201) Bool)

(assert (=> b!1383486 (= res!925079 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32198))))

(declare-fun b!1383487 () Bool)

(declare-fun res!925081 () Bool)

(assert (=> b!1383487 (=> (not res!925081) (not e!784115))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94591 (_ BitVec 32)) Bool)

(assert (=> b!1383487 (= res!925081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925078 () Bool)

(assert (=> start!118288 (=> (not res!925078) (not e!784115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118288 (= res!925078 (validMask!0 mask!2987))))

(assert (=> start!118288 e!784115))

(assert (=> start!118288 true))

(declare-fun array_inv!34701 (array!94591) Bool)

(assert (=> start!118288 (array_inv!34701 a!2938)))

(declare-fun b!1383488 () Bool)

(declare-fun res!925083 () Bool)

(assert (=> b!1383488 (=> (not res!925083) (not e!784115))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383488 (= res!925083 (and (= (size!46223 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46223 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46223 a!2938))))))

(declare-fun b!1383489 () Bool)

(assert (=> b!1383489 (= e!784115 (not true))))

(declare-datatypes ((SeekEntryResult!10066 0))(
  ( (MissingZero!10066 (index!42635 (_ BitVec 32))) (Found!10066 (index!42636 (_ BitVec 32))) (Intermediate!10066 (undefined!10878 Bool) (index!42637 (_ BitVec 32)) (x!124147 (_ BitVec 32))) (Undefined!10066) (MissingVacant!10066 (index!42638 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94591 (_ BitVec 32)) SeekEntryResult!10066)

(assert (=> b!1383489 (= (seekEntryOrOpen!0 (select (arr!45673 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45673 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94592 (store (arr!45673 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46223 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46069 0))(
  ( (Unit!46070) )
))
(declare-fun lt!608622 () Unit!46069)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46069)

(assert (=> b!1383489 (= lt!608622 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383490 () Bool)

(declare-fun res!925080 () Bool)

(assert (=> b!1383490 (=> (not res!925080) (not e!784115))))

(assert (=> b!1383490 (= res!925080 (and (not (= (select (arr!45673 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45673 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383491 () Bool)

(declare-fun res!925084 () Bool)

(assert (=> b!1383491 (=> (not res!925084) (not e!784115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383491 (= res!925084 (validKeyInArray!0 (select (arr!45673 a!2938) startIndex!16)))))

(declare-fun b!1383492 () Bool)

(declare-fun res!925082 () Bool)

(assert (=> b!1383492 (=> (not res!925082) (not e!784115))))

(assert (=> b!1383492 (= res!925082 (validKeyInArray!0 (select (arr!45673 a!2938) i!1065)))))

(assert (= (and start!118288 res!925078) b!1383488))

(assert (= (and b!1383488 res!925083) b!1383492))

(assert (= (and b!1383492 res!925082) b!1383486))

(assert (= (and b!1383486 res!925079) b!1383487))

(assert (= (and b!1383487 res!925081) b!1383490))

(assert (= (and b!1383490 res!925080) b!1383491))

(assert (= (and b!1383491 res!925084) b!1383489))

(declare-fun m!1268593 () Bool)

(assert (=> b!1383489 m!1268593))

(assert (=> b!1383489 m!1268593))

(declare-fun m!1268595 () Bool)

(assert (=> b!1383489 m!1268595))

(declare-fun m!1268597 () Bool)

(assert (=> b!1383489 m!1268597))

(declare-fun m!1268599 () Bool)

(assert (=> b!1383489 m!1268599))

(declare-fun m!1268601 () Bool)

(assert (=> b!1383489 m!1268601))

(assert (=> b!1383489 m!1268601))

(declare-fun m!1268603 () Bool)

(assert (=> b!1383489 m!1268603))

(assert (=> b!1383491 m!1268601))

(assert (=> b!1383491 m!1268601))

(declare-fun m!1268605 () Bool)

(assert (=> b!1383491 m!1268605))

(declare-fun m!1268607 () Bool)

(assert (=> start!118288 m!1268607))

(declare-fun m!1268609 () Bool)

(assert (=> start!118288 m!1268609))

(declare-fun m!1268611 () Bool)

(assert (=> b!1383487 m!1268611))

(declare-fun m!1268613 () Bool)

(assert (=> b!1383492 m!1268613))

(assert (=> b!1383492 m!1268613))

(declare-fun m!1268615 () Bool)

(assert (=> b!1383492 m!1268615))

(declare-fun m!1268617 () Bool)

(assert (=> b!1383486 m!1268617))

(assert (=> b!1383490 m!1268613))

(push 1)

(assert (not b!1383486))

(assert (not start!118288))

(assert (not b!1383492))

(assert (not b!1383491))

(assert (not b!1383487))

(assert (not b!1383489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

