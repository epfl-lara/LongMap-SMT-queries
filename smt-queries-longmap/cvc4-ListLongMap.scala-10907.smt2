; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127708 () Bool)

(assert start!127708)

(declare-fun b!1500581 () Bool)

(declare-fun res!1021663 () Bool)

(declare-fun e!839637 () Bool)

(assert (=> b!1500581 (=> (not res!1021663) (not e!839637))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100089 0))(
  ( (array!100090 (arr!48304 (Array (_ BitVec 32) (_ BitVec 64))) (size!48854 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100089)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500581 (= res!1021663 (and (= (size!48854 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48854 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48854 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500582 () Bool)

(declare-fun res!1021662 () Bool)

(assert (=> b!1500582 (=> (not res!1021662) (not e!839637))))

(declare-datatypes ((List!34796 0))(
  ( (Nil!34793) (Cons!34792 (h!36189 (_ BitVec 64)) (t!49490 List!34796)) )
))
(declare-fun arrayNoDuplicates!0 (array!100089 (_ BitVec 32) List!34796) Bool)

(assert (=> b!1500582 (= res!1021662 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34793))))

(declare-fun b!1500583 () Bool)

(declare-fun res!1021666 () Bool)

(assert (=> b!1500583 (=> (not res!1021666) (not e!839637))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500583 (= res!1021666 (not (= (select (arr!48304 a!2850) index!625) (select (arr!48304 a!2850) j!87))))))

(declare-fun b!1500584 () Bool)

(declare-fun res!1021658 () Bool)

(assert (=> b!1500584 (=> (not res!1021658) (not e!839637))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500584 (= res!1021658 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48854 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48854 a!2850)) (= (select (arr!48304 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48304 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48854 a!2850))))))

(declare-fun b!1500585 () Bool)

(declare-fun e!839636 () Bool)

(assert (=> b!1500585 (= e!839637 e!839636)))

(declare-fun res!1021659 () Bool)

(assert (=> b!1500585 (=> (not res!1021659) (not e!839636))))

(declare-fun lt!652966 () (_ BitVec 32))

(assert (=> b!1500585 (= res!1021659 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652966 #b00000000000000000000000000000000) (bvslt lt!652966 (size!48854 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500585 (= lt!652966 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500586 () Bool)

(declare-fun res!1021657 () Bool)

(assert (=> b!1500586 (=> (not res!1021657) (not e!839637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500586 (= res!1021657 (validKeyInArray!0 (select (arr!48304 a!2850) j!87)))))

(declare-fun b!1500587 () Bool)

(assert (=> b!1500587 (= e!839636 false)))

(declare-datatypes ((SeekEntryResult!12514 0))(
  ( (MissingZero!12514 (index!52448 (_ BitVec 32))) (Found!12514 (index!52449 (_ BitVec 32))) (Intermediate!12514 (undefined!13326 Bool) (index!52450 (_ BitVec 32)) (x!134116 (_ BitVec 32))) (Undefined!12514) (MissingVacant!12514 (index!52451 (_ BitVec 32))) )
))
(declare-fun lt!652965 () SeekEntryResult!12514)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100089 (_ BitVec 32)) SeekEntryResult!12514)

(assert (=> b!1500587 (= lt!652965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652966 vacantBefore!10 (select (arr!48304 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021660 () Bool)

(assert (=> start!127708 (=> (not res!1021660) (not e!839637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127708 (= res!1021660 (validMask!0 mask!2661))))

(assert (=> start!127708 e!839637))

(assert (=> start!127708 true))

(declare-fun array_inv!37332 (array!100089) Bool)

(assert (=> start!127708 (array_inv!37332 a!2850)))

(declare-fun b!1500588 () Bool)

(declare-fun res!1021665 () Bool)

(assert (=> b!1500588 (=> (not res!1021665) (not e!839637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100089 (_ BitVec 32)) Bool)

(assert (=> b!1500588 (= res!1021665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500589 () Bool)

(declare-fun res!1021664 () Bool)

(assert (=> b!1500589 (=> (not res!1021664) (not e!839637))))

(assert (=> b!1500589 (= res!1021664 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48304 a!2850) j!87) a!2850 mask!2661) (Found!12514 j!87)))))

(declare-fun b!1500590 () Bool)

(declare-fun res!1021661 () Bool)

(assert (=> b!1500590 (=> (not res!1021661) (not e!839637))))

(assert (=> b!1500590 (= res!1021661 (validKeyInArray!0 (select (arr!48304 a!2850) i!996)))))

(assert (= (and start!127708 res!1021660) b!1500581))

(assert (= (and b!1500581 res!1021663) b!1500590))

(assert (= (and b!1500590 res!1021661) b!1500586))

(assert (= (and b!1500586 res!1021657) b!1500588))

(assert (= (and b!1500588 res!1021665) b!1500582))

(assert (= (and b!1500582 res!1021662) b!1500584))

(assert (= (and b!1500584 res!1021658) b!1500589))

(assert (= (and b!1500589 res!1021664) b!1500583))

(assert (= (and b!1500583 res!1021666) b!1500585))

(assert (= (and b!1500585 res!1021659) b!1500587))

(declare-fun m!1383775 () Bool)

(assert (=> b!1500585 m!1383775))

(declare-fun m!1383777 () Bool)

(assert (=> b!1500582 m!1383777))

(declare-fun m!1383779 () Bool)

(assert (=> b!1500590 m!1383779))

(assert (=> b!1500590 m!1383779))

(declare-fun m!1383781 () Bool)

(assert (=> b!1500590 m!1383781))

(declare-fun m!1383783 () Bool)

(assert (=> b!1500584 m!1383783))

(declare-fun m!1383785 () Bool)

(assert (=> b!1500584 m!1383785))

(declare-fun m!1383787 () Bool)

(assert (=> b!1500584 m!1383787))

(declare-fun m!1383789 () Bool)

(assert (=> b!1500583 m!1383789))

(declare-fun m!1383791 () Bool)

(assert (=> b!1500583 m!1383791))

(assert (=> b!1500586 m!1383791))

(assert (=> b!1500586 m!1383791))

(declare-fun m!1383793 () Bool)

(assert (=> b!1500586 m!1383793))

(declare-fun m!1383795 () Bool)

(assert (=> b!1500588 m!1383795))

(assert (=> b!1500587 m!1383791))

(assert (=> b!1500587 m!1383791))

(declare-fun m!1383797 () Bool)

(assert (=> b!1500587 m!1383797))

(declare-fun m!1383799 () Bool)

(assert (=> start!127708 m!1383799))

(declare-fun m!1383801 () Bool)

(assert (=> start!127708 m!1383801))

(assert (=> b!1500589 m!1383791))

(assert (=> b!1500589 m!1383791))

(declare-fun m!1383803 () Bool)

(assert (=> b!1500589 m!1383803))

(push 1)

(assert (not b!1500585))

(assert (not b!1500586))

(assert (not b!1500588))

(assert (not b!1500589))

(assert (not b!1500587))

(assert (not start!127708))

(assert (not b!1500582))

(assert (not b!1500590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

