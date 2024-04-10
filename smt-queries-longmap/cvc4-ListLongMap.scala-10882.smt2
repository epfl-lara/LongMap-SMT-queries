; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127558 () Bool)

(assert start!127558)

(declare-fun b!1498549 () Bool)

(declare-fun res!1019625 () Bool)

(declare-fun e!839053 () Bool)

(assert (=> b!1498549 (=> (not res!1019625) (not e!839053))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99939 0))(
  ( (array!99940 (arr!48229 (Array (_ BitVec 32) (_ BitVec 64))) (size!48779 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99939)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12439 0))(
  ( (MissingZero!12439 (index!52148 (_ BitVec 32))) (Found!12439 (index!52149 (_ BitVec 32))) (Intermediate!12439 (undefined!13251 Bool) (index!52150 (_ BitVec 32)) (x!133841 (_ BitVec 32))) (Undefined!12439) (MissingVacant!12439 (index!52151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99939 (_ BitVec 32)) SeekEntryResult!12439)

(assert (=> b!1498549 (= res!1019625 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48229 a!2850) j!87) a!2850 mask!2661) (Found!12439 j!87)))))

(declare-fun b!1498550 () Bool)

(declare-fun res!1019627 () Bool)

(assert (=> b!1498550 (=> (not res!1019627) (not e!839053))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498550 (= res!1019627 (and (= (size!48779 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48779 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48779 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019629 () Bool)

(assert (=> start!127558 (=> (not res!1019629) (not e!839053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127558 (= res!1019629 (validMask!0 mask!2661))))

(assert (=> start!127558 e!839053))

(assert (=> start!127558 true))

(declare-fun array_inv!37257 (array!99939) Bool)

(assert (=> start!127558 (array_inv!37257 a!2850)))

(declare-fun b!1498551 () Bool)

(declare-fun res!1019626 () Bool)

(assert (=> b!1498551 (=> (not res!1019626) (not e!839053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498551 (= res!1019626 (validKeyInArray!0 (select (arr!48229 a!2850) j!87)))))

(declare-fun b!1498552 () Bool)

(declare-fun res!1019630 () Bool)

(assert (=> b!1498552 (=> (not res!1019630) (not e!839053))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498552 (= res!1019630 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48779 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48779 a!2850)) (= (select (arr!48229 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48229 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48779 a!2850))))))

(declare-fun b!1498553 () Bool)

(declare-fun res!1019628 () Bool)

(assert (=> b!1498553 (=> (not res!1019628) (not e!839053))))

(declare-datatypes ((List!34721 0))(
  ( (Nil!34718) (Cons!34717 (h!36114 (_ BitVec 64)) (t!49415 List!34721)) )
))
(declare-fun arrayNoDuplicates!0 (array!99939 (_ BitVec 32) List!34721) Bool)

(assert (=> b!1498553 (= res!1019628 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34718))))

(declare-fun b!1498554 () Bool)

(declare-fun res!1019631 () Bool)

(assert (=> b!1498554 (=> (not res!1019631) (not e!839053))))

(assert (=> b!1498554 (= res!1019631 (validKeyInArray!0 (select (arr!48229 a!2850) i!996)))))

(declare-fun b!1498555 () Bool)

(declare-fun res!1019632 () Bool)

(assert (=> b!1498555 (=> (not res!1019632) (not e!839053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99939 (_ BitVec 32)) Bool)

(assert (=> b!1498555 (= res!1019632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498556 () Bool)

(assert (=> b!1498556 (= e!839053 (and (= (select (arr!48229 a!2850) index!625) (select (arr!48229 a!2850) j!87)) (= j!87 index!625) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(assert (= (and start!127558 res!1019629) b!1498550))

(assert (= (and b!1498550 res!1019627) b!1498554))

(assert (= (and b!1498554 res!1019631) b!1498551))

(assert (= (and b!1498551 res!1019626) b!1498555))

(assert (= (and b!1498555 res!1019632) b!1498553))

(assert (= (and b!1498553 res!1019628) b!1498552))

(assert (= (and b!1498552 res!1019630) b!1498549))

(assert (= (and b!1498549 res!1019625) b!1498556))

(declare-fun m!1381667 () Bool)

(assert (=> b!1498555 m!1381667))

(declare-fun m!1381669 () Bool)

(assert (=> b!1498553 m!1381669))

(declare-fun m!1381671 () Bool)

(assert (=> b!1498551 m!1381671))

(assert (=> b!1498551 m!1381671))

(declare-fun m!1381673 () Bool)

(assert (=> b!1498551 m!1381673))

(declare-fun m!1381675 () Bool)

(assert (=> start!127558 m!1381675))

(declare-fun m!1381677 () Bool)

(assert (=> start!127558 m!1381677))

(declare-fun m!1381679 () Bool)

(assert (=> b!1498556 m!1381679))

(assert (=> b!1498556 m!1381671))

(assert (=> b!1498549 m!1381671))

(assert (=> b!1498549 m!1381671))

(declare-fun m!1381681 () Bool)

(assert (=> b!1498549 m!1381681))

(declare-fun m!1381683 () Bool)

(assert (=> b!1498554 m!1381683))

(assert (=> b!1498554 m!1381683))

(declare-fun m!1381685 () Bool)

(assert (=> b!1498554 m!1381685))

(declare-fun m!1381687 () Bool)

(assert (=> b!1498552 m!1381687))

(declare-fun m!1381689 () Bool)

(assert (=> b!1498552 m!1381689))

(declare-fun m!1381691 () Bool)

(assert (=> b!1498552 m!1381691))

(push 1)

(assert (not b!1498554))

(assert (not b!1498553))

(assert (not b!1498549))

(assert (not b!1498551))

(assert (not start!127558))

(assert (not b!1498555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

