; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127704 () Bool)

(assert start!127704)

(declare-fun b!1500521 () Bool)

(declare-fun res!1021601 () Bool)

(declare-fun e!839618 () Bool)

(assert (=> b!1500521 (=> (not res!1021601) (not e!839618))))

(declare-datatypes ((array!100085 0))(
  ( (array!100086 (arr!48302 (Array (_ BitVec 32) (_ BitVec 64))) (size!48852 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100085)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100085 (_ BitVec 32)) Bool)

(assert (=> b!1500521 (= res!1021601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500522 () Bool)

(declare-fun res!1021605 () Bool)

(assert (=> b!1500522 (=> (not res!1021605) (not e!839618))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500522 (= res!1021605 (validKeyInArray!0 (select (arr!48302 a!2850) i!996)))))

(declare-fun b!1500523 () Bool)

(declare-fun res!1021598 () Bool)

(assert (=> b!1500523 (=> (not res!1021598) (not e!839618))))

(declare-datatypes ((List!34794 0))(
  ( (Nil!34791) (Cons!34790 (h!36187 (_ BitVec 64)) (t!49488 List!34794)) )
))
(declare-fun arrayNoDuplicates!0 (array!100085 (_ BitVec 32) List!34794) Bool)

(assert (=> b!1500523 (= res!1021598 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34791))))

(declare-fun b!1500524 () Bool)

(declare-fun res!1021599 () Bool)

(assert (=> b!1500524 (=> (not res!1021599) (not e!839618))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500524 (= res!1021599 (validKeyInArray!0 (select (arr!48302 a!2850) j!87)))))

(declare-fun b!1500526 () Bool)

(declare-fun e!839619 () Bool)

(assert (=> b!1500526 (= e!839618 e!839619)))

(declare-fun res!1021606 () Bool)

(assert (=> b!1500526 (=> (not res!1021606) (not e!839619))))

(declare-fun lt!652954 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500526 (= res!1021606 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652954 #b00000000000000000000000000000000) (bvslt lt!652954 (size!48852 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500526 (= lt!652954 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500527 () Bool)

(declare-fun res!1021604 () Bool)

(assert (=> b!1500527 (=> (not res!1021604) (not e!839618))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500527 (= res!1021604 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48852 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48852 a!2850)) (= (select (arr!48302 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48302 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48852 a!2850))))))

(declare-fun b!1500528 () Bool)

(declare-fun res!1021600 () Bool)

(assert (=> b!1500528 (=> (not res!1021600) (not e!839618))))

(declare-datatypes ((SeekEntryResult!12512 0))(
  ( (MissingZero!12512 (index!52440 (_ BitVec 32))) (Found!12512 (index!52441 (_ BitVec 32))) (Intermediate!12512 (undefined!13324 Bool) (index!52442 (_ BitVec 32)) (x!134114 (_ BitVec 32))) (Undefined!12512) (MissingVacant!12512 (index!52443 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100085 (_ BitVec 32)) SeekEntryResult!12512)

(assert (=> b!1500528 (= res!1021600 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48302 a!2850) j!87) a!2850 mask!2661) (Found!12512 j!87)))))

(declare-fun res!1021602 () Bool)

(assert (=> start!127704 (=> (not res!1021602) (not e!839618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127704 (= res!1021602 (validMask!0 mask!2661))))

(assert (=> start!127704 e!839618))

(assert (=> start!127704 true))

(declare-fun array_inv!37330 (array!100085) Bool)

(assert (=> start!127704 (array_inv!37330 a!2850)))

(declare-fun b!1500525 () Bool)

(assert (=> b!1500525 (= e!839619 false)))

(declare-fun lt!652953 () SeekEntryResult!12512)

(assert (=> b!1500525 (= lt!652953 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652954 vacantBefore!10 (select (arr!48302 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500529 () Bool)

(declare-fun res!1021603 () Bool)

(assert (=> b!1500529 (=> (not res!1021603) (not e!839618))))

(assert (=> b!1500529 (= res!1021603 (not (= (select (arr!48302 a!2850) index!625) (select (arr!48302 a!2850) j!87))))))

(declare-fun b!1500530 () Bool)

(declare-fun res!1021597 () Bool)

(assert (=> b!1500530 (=> (not res!1021597) (not e!839618))))

(assert (=> b!1500530 (= res!1021597 (and (= (size!48852 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48852 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48852 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127704 res!1021602) b!1500530))

(assert (= (and b!1500530 res!1021597) b!1500522))

(assert (= (and b!1500522 res!1021605) b!1500524))

(assert (= (and b!1500524 res!1021599) b!1500521))

(assert (= (and b!1500521 res!1021601) b!1500523))

(assert (= (and b!1500523 res!1021598) b!1500527))

(assert (= (and b!1500527 res!1021604) b!1500528))

(assert (= (and b!1500528 res!1021600) b!1500529))

(assert (= (and b!1500529 res!1021603) b!1500526))

(assert (= (and b!1500526 res!1021606) b!1500525))

(declare-fun m!1383715 () Bool)

(assert (=> b!1500527 m!1383715))

(declare-fun m!1383717 () Bool)

(assert (=> b!1500527 m!1383717))

(declare-fun m!1383719 () Bool)

(assert (=> b!1500527 m!1383719))

(declare-fun m!1383721 () Bool)

(assert (=> start!127704 m!1383721))

(declare-fun m!1383723 () Bool)

(assert (=> start!127704 m!1383723))

(declare-fun m!1383725 () Bool)

(assert (=> b!1500523 m!1383725))

(declare-fun m!1383727 () Bool)

(assert (=> b!1500525 m!1383727))

(assert (=> b!1500525 m!1383727))

(declare-fun m!1383729 () Bool)

(assert (=> b!1500525 m!1383729))

(declare-fun m!1383731 () Bool)

(assert (=> b!1500526 m!1383731))

(assert (=> b!1500524 m!1383727))

(assert (=> b!1500524 m!1383727))

(declare-fun m!1383733 () Bool)

(assert (=> b!1500524 m!1383733))

(declare-fun m!1383735 () Bool)

(assert (=> b!1500529 m!1383735))

(assert (=> b!1500529 m!1383727))

(declare-fun m!1383737 () Bool)

(assert (=> b!1500522 m!1383737))

(assert (=> b!1500522 m!1383737))

(declare-fun m!1383739 () Bool)

(assert (=> b!1500522 m!1383739))

(declare-fun m!1383741 () Bool)

(assert (=> b!1500521 m!1383741))

(assert (=> b!1500528 m!1383727))

(assert (=> b!1500528 m!1383727))

(declare-fun m!1383743 () Bool)

(assert (=> b!1500528 m!1383743))

(push 1)

