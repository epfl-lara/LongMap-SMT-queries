; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128010 () Bool)

(assert start!128010)

(declare-fun b!1503776 () Bool)

(declare-fun res!1024760 () Bool)

(declare-fun e!840618 () Bool)

(assert (=> b!1503776 (=> (not res!1024760) (not e!840618))))

(declare-datatypes ((array!100280 0))(
  ( (array!100281 (arr!48396 (Array (_ BitVec 32) (_ BitVec 64))) (size!48948 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100280)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503776 (= res!1024760 (validKeyInArray!0 (select (arr!48396 a!2850) i!996)))))

(declare-fun b!1503777 () Bool)

(declare-fun res!1024755 () Bool)

(assert (=> b!1503777 (=> (not res!1024755) (not e!840618))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12615 0))(
  ( (MissingZero!12615 (index!52852 (_ BitVec 32))) (Found!12615 (index!52853 (_ BitVec 32))) (Intermediate!12615 (undefined!13427 Bool) (index!52854 (_ BitVec 32)) (x!134536 (_ BitVec 32))) (Undefined!12615) (MissingVacant!12615 (index!52855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100280 (_ BitVec 32)) SeekEntryResult!12615)

(assert (=> b!1503777 (= res!1024755 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48396 a!2850) j!87) a!2850 mask!2661) (Found!12615 j!87)))))

(declare-fun b!1503778 () Bool)

(declare-fun res!1024754 () Bool)

(assert (=> b!1503778 (=> (not res!1024754) (not e!840618))))

(assert (=> b!1503778 (= res!1024754 (validKeyInArray!0 (select (arr!48396 a!2850) j!87)))))

(declare-fun b!1503779 () Bool)

(declare-fun res!1024759 () Bool)

(assert (=> b!1503779 (=> (not res!1024759) (not e!840618))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503779 (= res!1024759 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48948 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48948 a!2850)) (= (select (arr!48396 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48396 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48948 a!2850))))))

(declare-fun res!1024757 () Bool)

(assert (=> start!128010 (=> (not res!1024757) (not e!840618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128010 (= res!1024757 (validMask!0 mask!2661))))

(assert (=> start!128010 e!840618))

(assert (=> start!128010 true))

(declare-fun array_inv!37629 (array!100280) Bool)

(assert (=> start!128010 (array_inv!37629 a!2850)))

(declare-fun b!1503780 () Bool)

(declare-fun res!1024753 () Bool)

(assert (=> b!1503780 (=> (not res!1024753) (not e!840618))))

(declare-datatypes ((List!34966 0))(
  ( (Nil!34963) (Cons!34962 (h!36360 (_ BitVec 64)) (t!49652 List!34966)) )
))
(declare-fun arrayNoDuplicates!0 (array!100280 (_ BitVec 32) List!34966) Bool)

(assert (=> b!1503780 (= res!1024753 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34963))))

(declare-fun b!1503781 () Bool)

(declare-fun res!1024758 () Bool)

(assert (=> b!1503781 (=> (not res!1024758) (not e!840618))))

(assert (=> b!1503781 (= res!1024758 (not (= (select (arr!48396 a!2850) index!625) (select (arr!48396 a!2850) j!87))))))

(declare-fun b!1503782 () Bool)

(declare-fun res!1024752 () Bool)

(assert (=> b!1503782 (=> (not res!1024752) (not e!840618))))

(assert (=> b!1503782 (= res!1024752 (and (= (size!48948 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48948 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48948 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503783 () Bool)

(assert (=> b!1503783 (= e!840618 false)))

(declare-fun lt!653359 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503783 (= lt!653359 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503784 () Bool)

(declare-fun res!1024756 () Bool)

(assert (=> b!1503784 (=> (not res!1024756) (not e!840618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100280 (_ BitVec 32)) Bool)

(assert (=> b!1503784 (= res!1024756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128010 res!1024757) b!1503782))

(assert (= (and b!1503782 res!1024752) b!1503776))

(assert (= (and b!1503776 res!1024760) b!1503778))

(assert (= (and b!1503778 res!1024754) b!1503784))

(assert (= (and b!1503784 res!1024756) b!1503780))

(assert (= (and b!1503780 res!1024753) b!1503779))

(assert (= (and b!1503779 res!1024759) b!1503777))

(assert (= (and b!1503777 res!1024755) b!1503781))

(assert (= (and b!1503781 res!1024758) b!1503783))

(declare-fun m!1386429 () Bool)

(assert (=> b!1503781 m!1386429))

(declare-fun m!1386431 () Bool)

(assert (=> b!1503781 m!1386431))

(declare-fun m!1386433 () Bool)

(assert (=> b!1503780 m!1386433))

(declare-fun m!1386435 () Bool)

(assert (=> start!128010 m!1386435))

(declare-fun m!1386437 () Bool)

(assert (=> start!128010 m!1386437))

(declare-fun m!1386439 () Bool)

(assert (=> b!1503784 m!1386439))

(declare-fun m!1386441 () Bool)

(assert (=> b!1503776 m!1386441))

(assert (=> b!1503776 m!1386441))

(declare-fun m!1386443 () Bool)

(assert (=> b!1503776 m!1386443))

(assert (=> b!1503777 m!1386431))

(assert (=> b!1503777 m!1386431))

(declare-fun m!1386445 () Bool)

(assert (=> b!1503777 m!1386445))

(declare-fun m!1386447 () Bool)

(assert (=> b!1503779 m!1386447))

(declare-fun m!1386449 () Bool)

(assert (=> b!1503779 m!1386449))

(declare-fun m!1386451 () Bool)

(assert (=> b!1503779 m!1386451))

(assert (=> b!1503778 m!1386431))

(assert (=> b!1503778 m!1386431))

(declare-fun m!1386453 () Bool)

(assert (=> b!1503778 m!1386453))

(declare-fun m!1386455 () Bool)

(assert (=> b!1503783 m!1386455))

(push 1)

(assert (not b!1503780))

(assert (not start!128010))

(assert (not b!1503776))

(assert (not b!1503777))

(assert (not b!1503784))

(assert (not b!1503783))

(assert (not b!1503778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

