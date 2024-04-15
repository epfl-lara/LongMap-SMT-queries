; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118296 () Bool)

(assert start!118296)

(declare-fun b!1383543 () Bool)

(declare-fun res!925183 () Bool)

(declare-fun e!784120 () Bool)

(assert (=> b!1383543 (=> (not res!925183) (not e!784120))))

(declare-datatypes ((array!94552 0))(
  ( (array!94553 (arr!45654 (Array (_ BitVec 32) (_ BitVec 64))) (size!46206 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94552)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383543 (= res!925183 (validKeyInArray!0 (select (arr!45654 a!2938) startIndex!16)))))

(declare-fun res!925178 () Bool)

(assert (=> start!118296 (=> (not res!925178) (not e!784120))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118296 (= res!925178 (validMask!0 mask!2987))))

(assert (=> start!118296 e!784120))

(assert (=> start!118296 true))

(declare-fun array_inv!34887 (array!94552) Bool)

(assert (=> start!118296 (array_inv!34887 a!2938)))

(declare-fun b!1383544 () Bool)

(assert (=> b!1383544 (= e!784120 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10071 0))(
  ( (MissingZero!10071 (index!42655 (_ BitVec 32))) (Found!10071 (index!42656 (_ BitVec 32))) (Intermediate!10071 (undefined!10883 Bool) (index!42657 (_ BitVec 32)) (x!124165 (_ BitVec 32))) (Undefined!10071) (MissingVacant!10071 (index!42658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94552 (_ BitVec 32)) SeekEntryResult!10071)

(assert (=> b!1383544 (= (seekEntryOrOpen!0 (select (arr!45654 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45654 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94553 (store (arr!45654 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46206 a!2938)) mask!2987))))

(declare-datatypes ((Unit!45922 0))(
  ( (Unit!45923) )
))
(declare-fun lt!608456 () Unit!45922)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45922)

(assert (=> b!1383544 (= lt!608456 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383545 () Bool)

(declare-fun res!925182 () Bool)

(assert (=> b!1383545 (=> (not res!925182) (not e!784120))))

(assert (=> b!1383545 (= res!925182 (and (= (size!46206 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46206 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46206 a!2938))))))

(declare-fun b!1383546 () Bool)

(declare-fun res!925179 () Bool)

(assert (=> b!1383546 (=> (not res!925179) (not e!784120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94552 (_ BitVec 32)) Bool)

(assert (=> b!1383546 (= res!925179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383547 () Bool)

(declare-fun res!925184 () Bool)

(assert (=> b!1383547 (=> (not res!925184) (not e!784120))))

(assert (=> b!1383547 (= res!925184 (validKeyInArray!0 (select (arr!45654 a!2938) i!1065)))))

(declare-fun b!1383548 () Bool)

(declare-fun res!925181 () Bool)

(assert (=> b!1383548 (=> (not res!925181) (not e!784120))))

(assert (=> b!1383548 (= res!925181 (and (not (= (select (arr!45654 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45654 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383549 () Bool)

(declare-fun res!925180 () Bool)

(assert (=> b!1383549 (=> (not res!925180) (not e!784120))))

(declare-datatypes ((List!32260 0))(
  ( (Nil!32257) (Cons!32256 (h!33465 (_ BitVec 64)) (t!46946 List!32260)) )
))
(declare-fun arrayNoDuplicates!0 (array!94552 (_ BitVec 32) List!32260) Bool)

(assert (=> b!1383549 (= res!925180 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32257))))

(assert (= (and start!118296 res!925178) b!1383545))

(assert (= (and b!1383545 res!925182) b!1383547))

(assert (= (and b!1383547 res!925184) b!1383549))

(assert (= (and b!1383549 res!925180) b!1383546))

(assert (= (and b!1383546 res!925179) b!1383548))

(assert (= (and b!1383548 res!925181) b!1383543))

(assert (= (and b!1383543 res!925183) b!1383544))

(declare-fun m!1268245 () Bool)

(assert (=> start!118296 m!1268245))

(declare-fun m!1268247 () Bool)

(assert (=> start!118296 m!1268247))

(declare-fun m!1268249 () Bool)

(assert (=> b!1383544 m!1268249))

(assert (=> b!1383544 m!1268249))

(declare-fun m!1268251 () Bool)

(assert (=> b!1383544 m!1268251))

(declare-fun m!1268253 () Bool)

(assert (=> b!1383544 m!1268253))

(declare-fun m!1268255 () Bool)

(assert (=> b!1383544 m!1268255))

(declare-fun m!1268257 () Bool)

(assert (=> b!1383544 m!1268257))

(assert (=> b!1383544 m!1268257))

(declare-fun m!1268259 () Bool)

(assert (=> b!1383544 m!1268259))

(declare-fun m!1268261 () Bool)

(assert (=> b!1383547 m!1268261))

(assert (=> b!1383547 m!1268261))

(declare-fun m!1268263 () Bool)

(assert (=> b!1383547 m!1268263))

(declare-fun m!1268265 () Bool)

(assert (=> b!1383546 m!1268265))

(assert (=> b!1383548 m!1268261))

(assert (=> b!1383543 m!1268257))

(assert (=> b!1383543 m!1268257))

(declare-fun m!1268267 () Bool)

(assert (=> b!1383543 m!1268267))

(declare-fun m!1268269 () Bool)

(assert (=> b!1383549 m!1268269))

(push 1)

(assert (not b!1383544))

(assert (not start!118296))

(assert (not b!1383549))

(assert (not b!1383547))

(assert (not b!1383543))

(assert (not b!1383546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

