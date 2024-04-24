; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128284 () Bool)

(assert start!128284)

(declare-fun b!1505357 () Bool)

(declare-fun res!1025061 () Bool)

(declare-fun e!841766 () Bool)

(assert (=> b!1505357 (=> (not res!1025061) (not e!841766))))

(declare-datatypes ((array!100413 0))(
  ( (array!100414 (arr!48458 (Array (_ BitVec 32) (_ BitVec 64))) (size!49009 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100413)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505357 (= res!1025061 (validKeyInArray!0 (select (arr!48458 a!2850) j!87)))))

(declare-fun b!1505358 () Bool)

(declare-fun res!1025064 () Bool)

(assert (=> b!1505358 (=> (not res!1025064) (not e!841766))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505358 (= res!1025064 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49009 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49009 a!2850)) (= (select (arr!48458 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48458 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49009 a!2850))))))

(declare-fun res!1025063 () Bool)

(assert (=> start!128284 (=> (not res!1025063) (not e!841766))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128284 (= res!1025063 (validMask!0 mask!2661))))

(assert (=> start!128284 e!841766))

(assert (=> start!128284 true))

(declare-fun array_inv!37739 (array!100413) Bool)

(assert (=> start!128284 (array_inv!37739 a!2850)))

(declare-fun b!1505359 () Bool)

(assert (=> b!1505359 (= e!841766 false)))

(declare-fun lt!654199 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505359 (= lt!654199 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505360 () Bool)

(declare-fun res!1025065 () Bool)

(assert (=> b!1505360 (=> (not res!1025065) (not e!841766))))

(declare-datatypes ((List!34937 0))(
  ( (Nil!34934) (Cons!34933 (h!36345 (_ BitVec 64)) (t!49623 List!34937)) )
))
(declare-fun arrayNoDuplicates!0 (array!100413 (_ BitVec 32) List!34937) Bool)

(assert (=> b!1505360 (= res!1025065 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34934))))

(declare-fun b!1505361 () Bool)

(declare-fun res!1025066 () Bool)

(assert (=> b!1505361 (=> (not res!1025066) (not e!841766))))

(assert (=> b!1505361 (= res!1025066 (validKeyInArray!0 (select (arr!48458 a!2850) i!996)))))

(declare-fun b!1505362 () Bool)

(declare-fun res!1025062 () Bool)

(assert (=> b!1505362 (=> (not res!1025062) (not e!841766))))

(assert (=> b!1505362 (= res!1025062 (and (= (size!49009 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49009 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49009 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505363 () Bool)

(declare-fun res!1025059 () Bool)

(assert (=> b!1505363 (=> (not res!1025059) (not e!841766))))

(declare-datatypes ((SeekEntryResult!12549 0))(
  ( (MissingZero!12549 (index!52588 (_ BitVec 32))) (Found!12549 (index!52589 (_ BitVec 32))) (Intermediate!12549 (undefined!13361 Bool) (index!52590 (_ BitVec 32)) (x!134466 (_ BitVec 32))) (Undefined!12549) (MissingVacant!12549 (index!52591 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100413 (_ BitVec 32)) SeekEntryResult!12549)

(assert (=> b!1505363 (= res!1025059 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48458 a!2850) j!87) a!2850 mask!2661) (Found!12549 j!87)))))

(declare-fun b!1505364 () Bool)

(declare-fun res!1025060 () Bool)

(assert (=> b!1505364 (=> (not res!1025060) (not e!841766))))

(assert (=> b!1505364 (= res!1025060 (not (= (select (arr!48458 a!2850) index!625) (select (arr!48458 a!2850) j!87))))))

(declare-fun b!1505365 () Bool)

(declare-fun res!1025058 () Bool)

(assert (=> b!1505365 (=> (not res!1025058) (not e!841766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100413 (_ BitVec 32)) Bool)

(assert (=> b!1505365 (= res!1025058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128284 res!1025063) b!1505362))

(assert (= (and b!1505362 res!1025062) b!1505361))

(assert (= (and b!1505361 res!1025066) b!1505357))

(assert (= (and b!1505357 res!1025061) b!1505365))

(assert (= (and b!1505365 res!1025058) b!1505360))

(assert (= (and b!1505360 res!1025065) b!1505358))

(assert (= (and b!1505358 res!1025064) b!1505363))

(assert (= (and b!1505363 res!1025059) b!1505364))

(assert (= (and b!1505364 res!1025060) b!1505359))

(declare-fun m!1388551 () Bool)

(assert (=> b!1505357 m!1388551))

(assert (=> b!1505357 m!1388551))

(declare-fun m!1388553 () Bool)

(assert (=> b!1505357 m!1388553))

(declare-fun m!1388555 () Bool)

(assert (=> b!1505365 m!1388555))

(declare-fun m!1388557 () Bool)

(assert (=> start!128284 m!1388557))

(declare-fun m!1388559 () Bool)

(assert (=> start!128284 m!1388559))

(declare-fun m!1388561 () Bool)

(assert (=> b!1505358 m!1388561))

(declare-fun m!1388563 () Bool)

(assert (=> b!1505358 m!1388563))

(declare-fun m!1388565 () Bool)

(assert (=> b!1505358 m!1388565))

(declare-fun m!1388567 () Bool)

(assert (=> b!1505359 m!1388567))

(declare-fun m!1388569 () Bool)

(assert (=> b!1505360 m!1388569))

(declare-fun m!1388571 () Bool)

(assert (=> b!1505361 m!1388571))

(assert (=> b!1505361 m!1388571))

(declare-fun m!1388573 () Bool)

(assert (=> b!1505361 m!1388573))

(declare-fun m!1388575 () Bool)

(assert (=> b!1505364 m!1388575))

(assert (=> b!1505364 m!1388551))

(assert (=> b!1505363 m!1388551))

(assert (=> b!1505363 m!1388551))

(declare-fun m!1388577 () Bool)

(assert (=> b!1505363 m!1388577))

(push 1)

(assert (not b!1505357))

(assert (not b!1505363))

(assert (not start!128284))

(assert (not b!1505360))

(assert (not b!1505359))

(assert (not b!1505361))

(assert (not b!1505365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

