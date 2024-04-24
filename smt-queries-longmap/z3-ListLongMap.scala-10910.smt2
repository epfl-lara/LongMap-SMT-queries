; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128024 () Bool)

(assert start!128024)

(declare-fun res!1022523 () Bool)

(declare-fun e!840838 () Bool)

(assert (=> start!128024 (=> (not res!1022523) (not e!840838))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128024 (= res!1022523 (validMask!0 mask!2661))))

(assert (=> start!128024 e!840838))

(assert (=> start!128024 true))

(declare-datatypes ((array!100219 0))(
  ( (array!100220 (arr!48364 (Array (_ BitVec 32) (_ BitVec 64))) (size!48915 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100219)

(declare-fun array_inv!37645 (array!100219) Bool)

(assert (=> start!128024 (array_inv!37645 a!2850)))

(declare-fun b!1502629 () Bool)

(declare-fun res!1022522 () Bool)

(assert (=> b!1502629 (=> (not res!1022522) (not e!840838))))

(declare-datatypes ((List!34843 0))(
  ( (Nil!34840) (Cons!34839 (h!36251 (_ BitVec 64)) (t!49529 List!34843)) )
))
(declare-fun arrayNoDuplicates!0 (array!100219 (_ BitVec 32) List!34843) Bool)

(assert (=> b!1502629 (= res!1022522 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34840))))

(declare-fun b!1502630 () Bool)

(declare-fun res!1022525 () Bool)

(assert (=> b!1502630 (=> (not res!1022525) (not e!840838))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12467 0))(
  ( (MissingZero!12467 (index!52260 (_ BitVec 32))) (Found!12467 (index!52261 (_ BitVec 32))) (Intermediate!12467 (undefined!13279 Bool) (index!52262 (_ BitVec 32)) (x!134130 (_ BitVec 32))) (Undefined!12467) (MissingVacant!12467 (index!52263 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100219 (_ BitVec 32)) SeekEntryResult!12467)

(assert (=> b!1502630 (= res!1022525 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48364 a!2850) j!87) a!2850 mask!2661) (Found!12467 j!87)))))

(declare-fun b!1502631 () Bool)

(declare-fun e!840839 () Bool)

(assert (=> b!1502631 (= e!840839 false)))

(declare-fun lt!653672 () SeekEntryResult!12467)

(declare-fun lt!653673 () (_ BitVec 32))

(assert (=> b!1502631 (= lt!653672 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653673 vacantBefore!10 (select (arr!48364 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502632 () Bool)

(declare-fun res!1022524 () Bool)

(assert (=> b!1502632 (=> (not res!1022524) (not e!840838))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502632 (= res!1022524 (and (= (size!48915 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48915 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48915 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502633 () Bool)

(declare-fun res!1022527 () Bool)

(assert (=> b!1502633 (=> (not res!1022527) (not e!840838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100219 (_ BitVec 32)) Bool)

(assert (=> b!1502633 (= res!1022527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502634 () Bool)

(declare-fun res!1022526 () Bool)

(assert (=> b!1502634 (=> (not res!1022526) (not e!840838))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502634 (= res!1022526 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48915 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48915 a!2850)) (= (select (arr!48364 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48364 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48915 a!2850))))))

(declare-fun b!1502635 () Bool)

(declare-fun res!1022530 () Bool)

(assert (=> b!1502635 (=> (not res!1022530) (not e!840838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502635 (= res!1022530 (validKeyInArray!0 (select (arr!48364 a!2850) j!87)))))

(declare-fun b!1502636 () Bool)

(declare-fun res!1022529 () Bool)

(assert (=> b!1502636 (=> (not res!1022529) (not e!840838))))

(assert (=> b!1502636 (= res!1022529 (not (= (select (arr!48364 a!2850) index!625) (select (arr!48364 a!2850) j!87))))))

(declare-fun b!1502637 () Bool)

(declare-fun res!1022531 () Bool)

(assert (=> b!1502637 (=> (not res!1022531) (not e!840838))))

(assert (=> b!1502637 (= res!1022531 (validKeyInArray!0 (select (arr!48364 a!2850) i!996)))))

(declare-fun b!1502638 () Bool)

(assert (=> b!1502638 (= e!840838 e!840839)))

(declare-fun res!1022528 () Bool)

(assert (=> b!1502638 (=> (not res!1022528) (not e!840839))))

(assert (=> b!1502638 (= res!1022528 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653673 #b00000000000000000000000000000000) (bvslt lt!653673 (size!48915 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502638 (= lt!653673 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (= (and start!128024 res!1022523) b!1502632))

(assert (= (and b!1502632 res!1022524) b!1502637))

(assert (= (and b!1502637 res!1022531) b!1502635))

(assert (= (and b!1502635 res!1022530) b!1502633))

(assert (= (and b!1502633 res!1022527) b!1502629))

(assert (= (and b!1502629 res!1022522) b!1502634))

(assert (= (and b!1502634 res!1022526) b!1502630))

(assert (= (and b!1502630 res!1022525) b!1502636))

(assert (= (and b!1502636 res!1022529) b!1502638))

(assert (= (and b!1502638 res!1022528) b!1502631))

(declare-fun m!1385773 () Bool)

(assert (=> b!1502635 m!1385773))

(assert (=> b!1502635 m!1385773))

(declare-fun m!1385775 () Bool)

(assert (=> b!1502635 m!1385775))

(declare-fun m!1385777 () Bool)

(assert (=> b!1502629 m!1385777))

(assert (=> b!1502630 m!1385773))

(assert (=> b!1502630 m!1385773))

(declare-fun m!1385779 () Bool)

(assert (=> b!1502630 m!1385779))

(declare-fun m!1385781 () Bool)

(assert (=> start!128024 m!1385781))

(declare-fun m!1385783 () Bool)

(assert (=> start!128024 m!1385783))

(declare-fun m!1385785 () Bool)

(assert (=> b!1502636 m!1385785))

(assert (=> b!1502636 m!1385773))

(declare-fun m!1385787 () Bool)

(assert (=> b!1502638 m!1385787))

(assert (=> b!1502631 m!1385773))

(assert (=> b!1502631 m!1385773))

(declare-fun m!1385789 () Bool)

(assert (=> b!1502631 m!1385789))

(declare-fun m!1385791 () Bool)

(assert (=> b!1502633 m!1385791))

(declare-fun m!1385793 () Bool)

(assert (=> b!1502634 m!1385793))

(declare-fun m!1385795 () Bool)

(assert (=> b!1502634 m!1385795))

(declare-fun m!1385797 () Bool)

(assert (=> b!1502634 m!1385797))

(declare-fun m!1385799 () Bool)

(assert (=> b!1502637 m!1385799))

(assert (=> b!1502637 m!1385799))

(declare-fun m!1385801 () Bool)

(assert (=> b!1502637 m!1385801))

(check-sat (not b!1502630) (not b!1502633) (not b!1502635) (not b!1502629) (not start!128024) (not b!1502638) (not b!1502631) (not b!1502637))
(check-sat)
