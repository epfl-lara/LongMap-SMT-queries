; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128290 () Bool)

(assert start!128290)

(declare-fun b!1505438 () Bool)

(declare-fun res!1025147 () Bool)

(declare-fun e!841784 () Bool)

(assert (=> b!1505438 (=> (not res!1025147) (not e!841784))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100419 0))(
  ( (array!100420 (arr!48461 (Array (_ BitVec 32) (_ BitVec 64))) (size!49012 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100419)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505438 (= res!1025147 (and (= (size!49012 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49012 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49012 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505439 () Bool)

(declare-fun res!1025139 () Bool)

(assert (=> b!1505439 (=> (not res!1025139) (not e!841784))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1505439 (= res!1025139 (not (= (select (arr!48461 a!2850) index!625) (select (arr!48461 a!2850) j!87))))))

(declare-fun b!1505440 () Bool)

(declare-fun res!1025145 () Bool)

(assert (=> b!1505440 (=> (not res!1025145) (not e!841784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100419 (_ BitVec 32)) Bool)

(assert (=> b!1505440 (= res!1025145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505441 () Bool)

(declare-fun res!1025146 () Bool)

(assert (=> b!1505441 (=> (not res!1025146) (not e!841784))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12552 0))(
  ( (MissingZero!12552 (index!52600 (_ BitVec 32))) (Found!12552 (index!52601 (_ BitVec 32))) (Intermediate!12552 (undefined!13364 Bool) (index!52602 (_ BitVec 32)) (x!134477 (_ BitVec 32))) (Undefined!12552) (MissingVacant!12552 (index!52603 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100419 (_ BitVec 32)) SeekEntryResult!12552)

(assert (=> b!1505441 (= res!1025146 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48461 a!2850) j!87) a!2850 mask!2661) (Found!12552 j!87)))))

(declare-fun res!1025144 () Bool)

(assert (=> start!128290 (=> (not res!1025144) (not e!841784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128290 (= res!1025144 (validMask!0 mask!2661))))

(assert (=> start!128290 e!841784))

(assert (=> start!128290 true))

(declare-fun array_inv!37742 (array!100419) Bool)

(assert (=> start!128290 (array_inv!37742 a!2850)))

(declare-fun b!1505442 () Bool)

(assert (=> b!1505442 (= e!841784 false)))

(declare-fun lt!654208 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505442 (= lt!654208 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505443 () Bool)

(declare-fun res!1025142 () Bool)

(assert (=> b!1505443 (=> (not res!1025142) (not e!841784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505443 (= res!1025142 (validKeyInArray!0 (select (arr!48461 a!2850) i!996)))))

(declare-fun b!1505444 () Bool)

(declare-fun res!1025141 () Bool)

(assert (=> b!1505444 (=> (not res!1025141) (not e!841784))))

(declare-datatypes ((List!34940 0))(
  ( (Nil!34937) (Cons!34936 (h!36348 (_ BitVec 64)) (t!49626 List!34940)) )
))
(declare-fun arrayNoDuplicates!0 (array!100419 (_ BitVec 32) List!34940) Bool)

(assert (=> b!1505444 (= res!1025141 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34937))))

(declare-fun b!1505445 () Bool)

(declare-fun res!1025143 () Bool)

(assert (=> b!1505445 (=> (not res!1025143) (not e!841784))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505445 (= res!1025143 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49012 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49012 a!2850)) (= (select (arr!48461 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48461 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49012 a!2850))))))

(declare-fun b!1505446 () Bool)

(declare-fun res!1025140 () Bool)

(assert (=> b!1505446 (=> (not res!1025140) (not e!841784))))

(assert (=> b!1505446 (= res!1025140 (validKeyInArray!0 (select (arr!48461 a!2850) j!87)))))

(assert (= (and start!128290 res!1025144) b!1505438))

(assert (= (and b!1505438 res!1025147) b!1505443))

(assert (= (and b!1505443 res!1025142) b!1505446))

(assert (= (and b!1505446 res!1025140) b!1505440))

(assert (= (and b!1505440 res!1025145) b!1505444))

(assert (= (and b!1505444 res!1025141) b!1505445))

(assert (= (and b!1505445 res!1025143) b!1505441))

(assert (= (and b!1505441 res!1025146) b!1505439))

(assert (= (and b!1505439 res!1025139) b!1505442))

(declare-fun m!1388635 () Bool)

(assert (=> b!1505442 m!1388635))

(declare-fun m!1388637 () Bool)

(assert (=> b!1505444 m!1388637))

(declare-fun m!1388639 () Bool)

(assert (=> b!1505446 m!1388639))

(assert (=> b!1505446 m!1388639))

(declare-fun m!1388641 () Bool)

(assert (=> b!1505446 m!1388641))

(declare-fun m!1388643 () Bool)

(assert (=> b!1505439 m!1388643))

(assert (=> b!1505439 m!1388639))

(declare-fun m!1388645 () Bool)

(assert (=> start!128290 m!1388645))

(declare-fun m!1388647 () Bool)

(assert (=> start!128290 m!1388647))

(declare-fun m!1388649 () Bool)

(assert (=> b!1505443 m!1388649))

(assert (=> b!1505443 m!1388649))

(declare-fun m!1388651 () Bool)

(assert (=> b!1505443 m!1388651))

(declare-fun m!1388653 () Bool)

(assert (=> b!1505445 m!1388653))

(declare-fun m!1388655 () Bool)

(assert (=> b!1505445 m!1388655))

(declare-fun m!1388657 () Bool)

(assert (=> b!1505445 m!1388657))

(assert (=> b!1505441 m!1388639))

(assert (=> b!1505441 m!1388639))

(declare-fun m!1388659 () Bool)

(assert (=> b!1505441 m!1388659))

(declare-fun m!1388661 () Bool)

(assert (=> b!1505440 m!1388661))

(push 1)

(assert (not b!1505444))

(assert (not b!1505446))

(assert (not b!1505441))

(assert (not b!1505443))

(assert (not start!128290))

(assert (not b!1505442))

(assert (not b!1505440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

