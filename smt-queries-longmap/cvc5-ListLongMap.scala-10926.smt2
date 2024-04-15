; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127776 () Bool)

(assert start!127776)

(declare-fun b!1501798 () Bool)

(declare-fun e!839969 () Bool)

(assert (=> b!1501798 (= e!839969 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100151 0))(
  ( (array!100152 (arr!48336 (Array (_ BitVec 32) (_ BitVec 64))) (size!48888 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100151)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12555 0))(
  ( (MissingZero!12555 (index!52612 (_ BitVec 32))) (Found!12555 (index!52613 (_ BitVec 32))) (Intermediate!12555 (undefined!13367 Bool) (index!52614 (_ BitVec 32)) (x!134304 (_ BitVec 32))) (Undefined!12555) (MissingVacant!12555 (index!52615 (_ BitVec 32))) )
))
(declare-fun lt!653038 () SeekEntryResult!12555)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100151 (_ BitVec 32)) SeekEntryResult!12555)

(assert (=> b!1501798 (= lt!653038 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48336 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501799 () Bool)

(declare-fun res!1023063 () Bool)

(assert (=> b!1501799 (=> (not res!1023063) (not e!839969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501799 (= res!1023063 (validKeyInArray!0 (select (arr!48336 a!2850) j!87)))))

(declare-fun b!1501801 () Bool)

(declare-fun res!1023068 () Bool)

(assert (=> b!1501801 (=> (not res!1023068) (not e!839969))))

(declare-datatypes ((List!34906 0))(
  ( (Nil!34903) (Cons!34902 (h!36300 (_ BitVec 64)) (t!49592 List!34906)) )
))
(declare-fun arrayNoDuplicates!0 (array!100151 (_ BitVec 32) List!34906) Bool)

(assert (=> b!1501801 (= res!1023068 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34903))))

(declare-fun b!1501802 () Bool)

(declare-fun res!1023064 () Bool)

(assert (=> b!1501802 (=> (not res!1023064) (not e!839969))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501802 (= res!1023064 (and (= (size!48888 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48888 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48888 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501803 () Bool)

(declare-fun res!1023062 () Bool)

(assert (=> b!1501803 (=> (not res!1023062) (not e!839969))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501803 (= res!1023062 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48888 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48888 a!2850)) (= (select (arr!48336 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48336 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48888 a!2850))))))

(declare-fun b!1501804 () Bool)

(declare-fun res!1023067 () Bool)

(assert (=> b!1501804 (=> (not res!1023067) (not e!839969))))

(assert (=> b!1501804 (= res!1023067 (validKeyInArray!0 (select (arr!48336 a!2850) i!996)))))

(declare-fun res!1023066 () Bool)

(assert (=> start!127776 (=> (not res!1023066) (not e!839969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127776 (= res!1023066 (validMask!0 mask!2661))))

(assert (=> start!127776 e!839969))

(assert (=> start!127776 true))

(declare-fun array_inv!37569 (array!100151) Bool)

(assert (=> start!127776 (array_inv!37569 a!2850)))

(declare-fun b!1501800 () Bool)

(declare-fun res!1023065 () Bool)

(assert (=> b!1501800 (=> (not res!1023065) (not e!839969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100151 (_ BitVec 32)) Bool)

(assert (=> b!1501800 (= res!1023065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127776 res!1023066) b!1501802))

(assert (= (and b!1501802 res!1023064) b!1501804))

(assert (= (and b!1501804 res!1023067) b!1501799))

(assert (= (and b!1501799 res!1023063) b!1501800))

(assert (= (and b!1501800 res!1023065) b!1501801))

(assert (= (and b!1501801 res!1023068) b!1501803))

(assert (= (and b!1501803 res!1023062) b!1501798))

(declare-fun m!1384549 () Bool)

(assert (=> b!1501801 m!1384549))

(declare-fun m!1384551 () Bool)

(assert (=> start!127776 m!1384551))

(declare-fun m!1384553 () Bool)

(assert (=> start!127776 m!1384553))

(declare-fun m!1384555 () Bool)

(assert (=> b!1501800 m!1384555))

(declare-fun m!1384557 () Bool)

(assert (=> b!1501799 m!1384557))

(assert (=> b!1501799 m!1384557))

(declare-fun m!1384559 () Bool)

(assert (=> b!1501799 m!1384559))

(declare-fun m!1384561 () Bool)

(assert (=> b!1501804 m!1384561))

(assert (=> b!1501804 m!1384561))

(declare-fun m!1384563 () Bool)

(assert (=> b!1501804 m!1384563))

(declare-fun m!1384565 () Bool)

(assert (=> b!1501803 m!1384565))

(declare-fun m!1384567 () Bool)

(assert (=> b!1501803 m!1384567))

(declare-fun m!1384569 () Bool)

(assert (=> b!1501803 m!1384569))

(assert (=> b!1501798 m!1384557))

(assert (=> b!1501798 m!1384557))

(declare-fun m!1384571 () Bool)

(assert (=> b!1501798 m!1384571))

(push 1)

(assert (not b!1501798))

(assert (not start!127776))

(assert (not b!1501801))

(assert (not b!1501799))

(assert (not b!1501800))

(assert (not b!1501804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

