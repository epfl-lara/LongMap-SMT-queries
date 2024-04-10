; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127876 () Bool)

(assert start!127876)

(declare-fun b!1502447 () Bool)

(declare-fun res!1023437 () Bool)

(declare-fun e!840313 () Bool)

(assert (=> b!1502447 (=> (not res!1023437) (not e!840313))))

(declare-datatypes ((array!100224 0))(
  ( (array!100225 (arr!48370 (Array (_ BitVec 32) (_ BitVec 64))) (size!48920 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100224)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502447 (= res!1023437 (validKeyInArray!0 (select (arr!48370 a!2850) i!996)))))

(declare-fun b!1502448 () Bool)

(declare-fun res!1023438 () Bool)

(assert (=> b!1502448 (=> (not res!1023438) (not e!840313))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502448 (= res!1023438 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48920 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48920 a!2850)) (= (select (arr!48370 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48370 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48920 a!2850))))))

(declare-fun b!1502449 () Bool)

(assert (=> b!1502449 (= e!840313 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12568 0))(
  ( (MissingZero!12568 (index!52664 (_ BitVec 32))) (Found!12568 (index!52665 (_ BitVec 32))) (Intermediate!12568 (undefined!13380 Bool) (index!52666 (_ BitVec 32)) (x!134349 (_ BitVec 32))) (Undefined!12568) (MissingVacant!12568 (index!52667 (_ BitVec 32))) )
))
(declare-fun lt!653380 () SeekEntryResult!12568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100224 (_ BitVec 32)) SeekEntryResult!12568)

(assert (=> b!1502449 (= lt!653380 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48370 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1023439 () Bool)

(assert (=> start!127876 (=> (not res!1023439) (not e!840313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127876 (= res!1023439 (validMask!0 mask!2661))))

(assert (=> start!127876 e!840313))

(assert (=> start!127876 true))

(declare-fun array_inv!37398 (array!100224) Bool)

(assert (=> start!127876 (array_inv!37398 a!2850)))

(declare-fun b!1502450 () Bool)

(declare-fun res!1023433 () Bool)

(assert (=> b!1502450 (=> (not res!1023433) (not e!840313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100224 (_ BitVec 32)) Bool)

(assert (=> b!1502450 (= res!1023433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502451 () Bool)

(declare-fun res!1023436 () Bool)

(assert (=> b!1502451 (=> (not res!1023436) (not e!840313))))

(declare-datatypes ((List!34862 0))(
  ( (Nil!34859) (Cons!34858 (h!36255 (_ BitVec 64)) (t!49556 List!34862)) )
))
(declare-fun arrayNoDuplicates!0 (array!100224 (_ BitVec 32) List!34862) Bool)

(assert (=> b!1502451 (= res!1023436 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34859))))

(declare-fun b!1502452 () Bool)

(declare-fun res!1023434 () Bool)

(assert (=> b!1502452 (=> (not res!1023434) (not e!840313))))

(assert (=> b!1502452 (= res!1023434 (validKeyInArray!0 (select (arr!48370 a!2850) j!87)))))

(declare-fun b!1502453 () Bool)

(declare-fun res!1023435 () Bool)

(assert (=> b!1502453 (=> (not res!1023435) (not e!840313))))

(assert (=> b!1502453 (= res!1023435 (and (= (size!48920 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48920 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48920 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127876 res!1023439) b!1502453))

(assert (= (and b!1502453 res!1023435) b!1502447))

(assert (= (and b!1502447 res!1023437) b!1502452))

(assert (= (and b!1502452 res!1023434) b!1502450))

(assert (= (and b!1502450 res!1023433) b!1502451))

(assert (= (and b!1502451 res!1023436) b!1502448))

(assert (= (and b!1502448 res!1023438) b!1502449))

(declare-fun m!1385713 () Bool)

(assert (=> b!1502452 m!1385713))

(assert (=> b!1502452 m!1385713))

(declare-fun m!1385715 () Bool)

(assert (=> b!1502452 m!1385715))

(assert (=> b!1502449 m!1385713))

(assert (=> b!1502449 m!1385713))

(declare-fun m!1385717 () Bool)

(assert (=> b!1502449 m!1385717))

(declare-fun m!1385719 () Bool)

(assert (=> start!127876 m!1385719))

(declare-fun m!1385721 () Bool)

(assert (=> start!127876 m!1385721))

(declare-fun m!1385723 () Bool)

(assert (=> b!1502447 m!1385723))

(assert (=> b!1502447 m!1385723))

(declare-fun m!1385725 () Bool)

(assert (=> b!1502447 m!1385725))

(declare-fun m!1385727 () Bool)

(assert (=> b!1502450 m!1385727))

(declare-fun m!1385729 () Bool)

(assert (=> b!1502451 m!1385729))

(declare-fun m!1385731 () Bool)

(assert (=> b!1502448 m!1385731))

(declare-fun m!1385733 () Bool)

(assert (=> b!1502448 m!1385733))

(declare-fun m!1385735 () Bool)

(assert (=> b!1502448 m!1385735))

(push 1)

(assert (not start!127876))

(assert (not b!1502449))

(assert (not b!1502447))

(assert (not b!1502452))

(assert (not b!1502450))

(assert (not b!1502451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

