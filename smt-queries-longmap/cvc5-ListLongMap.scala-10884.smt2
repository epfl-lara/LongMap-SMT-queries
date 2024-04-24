; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127838 () Bool)

(assert start!127838)

(declare-fun b!1500390 () Bool)

(declare-fun res!1020372 () Bool)

(declare-fun e!840147 () Bool)

(assert (=> b!1500390 (=> (not res!1020372) (not e!840147))))

(declare-datatypes ((array!100064 0))(
  ( (array!100065 (arr!48288 (Array (_ BitVec 32) (_ BitVec 64))) (size!48839 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100064)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100064 (_ BitVec 32)) Bool)

(assert (=> b!1500390 (= res!1020372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500391 () Bool)

(declare-fun res!1020370 () Bool)

(assert (=> b!1500391 (=> (not res!1020370) (not e!840147))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12391 0))(
  ( (MissingZero!12391 (index!51956 (_ BitVec 32))) (Found!12391 (index!51957 (_ BitVec 32))) (Intermediate!12391 (undefined!13203 Bool) (index!51958 (_ BitVec 32)) (x!133843 (_ BitVec 32))) (Undefined!12391) (MissingVacant!12391 (index!51959 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100064 (_ BitVec 32)) SeekEntryResult!12391)

(assert (=> b!1500391 (= res!1020370 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48288 a!2850) j!87) a!2850 mask!2661) (Found!12391 j!87)))))

(declare-fun b!1500392 () Bool)

(declare-fun res!1020367 () Bool)

(assert (=> b!1500392 (=> (not res!1020367) (not e!840147))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500392 (= res!1020367 (and (= (size!48839 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48839 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48839 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020373 () Bool)

(assert (=> start!127838 (=> (not res!1020373) (not e!840147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127838 (= res!1020373 (validMask!0 mask!2661))))

(assert (=> start!127838 e!840147))

(assert (=> start!127838 true))

(declare-fun array_inv!37569 (array!100064) Bool)

(assert (=> start!127838 (array_inv!37569 a!2850)))

(declare-fun b!1500393 () Bool)

(declare-fun res!1020369 () Bool)

(assert (=> b!1500393 (=> (not res!1020369) (not e!840147))))

(declare-datatypes ((List!34767 0))(
  ( (Nil!34764) (Cons!34763 (h!36175 (_ BitVec 64)) (t!49453 List!34767)) )
))
(declare-fun arrayNoDuplicates!0 (array!100064 (_ BitVec 32) List!34767) Bool)

(assert (=> b!1500393 (= res!1020369 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34764))))

(declare-fun b!1500394 () Bool)

(assert (=> b!1500394 (= e!840147 (and (= (select (arr!48288 a!2850) index!625) (select (arr!48288 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1500395 () Bool)

(declare-fun res!1020374 () Bool)

(assert (=> b!1500395 (=> (not res!1020374) (not e!840147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500395 (= res!1020374 (validKeyInArray!0 (select (arr!48288 a!2850) j!87)))))

(declare-fun b!1500396 () Bool)

(declare-fun res!1020368 () Bool)

(assert (=> b!1500396 (=> (not res!1020368) (not e!840147))))

(assert (=> b!1500396 (= res!1020368 (validKeyInArray!0 (select (arr!48288 a!2850) i!996)))))

(declare-fun b!1500397 () Bool)

(declare-fun res!1020371 () Bool)

(assert (=> b!1500397 (=> (not res!1020371) (not e!840147))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500397 (= res!1020371 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48839 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48839 a!2850)) (= (select (arr!48288 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48288 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48839 a!2850))))))

(assert (= (and start!127838 res!1020373) b!1500392))

(assert (= (and b!1500392 res!1020367) b!1500396))

(assert (= (and b!1500396 res!1020368) b!1500395))

(assert (= (and b!1500395 res!1020374) b!1500390))

(assert (= (and b!1500390 res!1020372) b!1500393))

(assert (= (and b!1500393 res!1020369) b!1500397))

(assert (= (and b!1500397 res!1020371) b!1500391))

(assert (= (and b!1500391 res!1020370) b!1500394))

(declare-fun m!1383543 () Bool)

(assert (=> b!1500397 m!1383543))

(declare-fun m!1383545 () Bool)

(assert (=> b!1500397 m!1383545))

(declare-fun m!1383547 () Bool)

(assert (=> b!1500397 m!1383547))

(declare-fun m!1383549 () Bool)

(assert (=> b!1500390 m!1383549))

(declare-fun m!1383551 () Bool)

(assert (=> b!1500395 m!1383551))

(assert (=> b!1500395 m!1383551))

(declare-fun m!1383553 () Bool)

(assert (=> b!1500395 m!1383553))

(declare-fun m!1383555 () Bool)

(assert (=> b!1500394 m!1383555))

(assert (=> b!1500394 m!1383551))

(declare-fun m!1383557 () Bool)

(assert (=> b!1500396 m!1383557))

(assert (=> b!1500396 m!1383557))

(declare-fun m!1383559 () Bool)

(assert (=> b!1500396 m!1383559))

(declare-fun m!1383561 () Bool)

(assert (=> b!1500393 m!1383561))

(declare-fun m!1383563 () Bool)

(assert (=> start!127838 m!1383563))

(declare-fun m!1383565 () Bool)

(assert (=> start!127838 m!1383565))

(assert (=> b!1500391 m!1383551))

(assert (=> b!1500391 m!1383551))

(declare-fun m!1383567 () Bool)

(assert (=> b!1500391 m!1383567))

(push 1)

(assert (not start!127838))

(assert (not b!1500390))

(assert (not b!1500393))

(assert (not b!1500396))

(assert (not b!1500391))

(assert (not b!1500395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

