; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127902 () Bool)

(assert start!127902)

(declare-fun b!1502750 () Bool)

(declare-fun res!1023819 () Bool)

(declare-fun e!840329 () Bool)

(assert (=> b!1502750 (=> (not res!1023819) (not e!840329))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100211 0))(
  ( (array!100212 (arr!48363 (Array (_ BitVec 32) (_ BitVec 64))) (size!48915 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100211)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12582 0))(
  ( (MissingZero!12582 (index!52720 (_ BitVec 32))) (Found!12582 (index!52721 (_ BitVec 32))) (Intermediate!12582 (undefined!13394 Bool) (index!52722 (_ BitVec 32)) (x!134409 (_ BitVec 32))) (Undefined!12582) (MissingVacant!12582 (index!52723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100211 (_ BitVec 32)) SeekEntryResult!12582)

(assert (=> b!1502750 (= res!1023819 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48363 a!2850) j!87) a!2850 mask!2661) (Found!12582 j!87)))))

(declare-fun b!1502751 () Bool)

(declare-fun res!1023818 () Bool)

(assert (=> b!1502751 (=> (not res!1023818) (not e!840329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100211 (_ BitVec 32)) Bool)

(assert (=> b!1502751 (= res!1023818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502752 () Bool)

(declare-fun res!1023824 () Bool)

(assert (=> b!1502752 (=> (not res!1023824) (not e!840329))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502752 (= res!1023824 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48915 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48915 a!2850)) (= (select (arr!48363 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48363 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48915 a!2850))))))

(declare-fun b!1502753 () Bool)

(declare-fun res!1023822 () Bool)

(assert (=> b!1502753 (=> (not res!1023822) (not e!840329))))

(assert (=> b!1502753 (= res!1023822 (not (= (select (arr!48363 a!2850) index!625) (select (arr!48363 a!2850) j!87))))))

(declare-fun b!1502754 () Bool)

(declare-fun res!1023820 () Bool)

(assert (=> b!1502754 (=> (not res!1023820) (not e!840329))))

(assert (=> b!1502754 (= res!1023820 (and (= (size!48915 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48915 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48915 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502756 () Bool)

(declare-fun res!1023817 () Bool)

(assert (=> b!1502756 (=> (not res!1023817) (not e!840329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502756 (= res!1023817 (validKeyInArray!0 (select (arr!48363 a!2850) i!996)))))

(declare-fun b!1502757 () Bool)

(declare-fun res!1023823 () Bool)

(assert (=> b!1502757 (=> (not res!1023823) (not e!840329))))

(declare-datatypes ((List!34933 0))(
  ( (Nil!34930) (Cons!34929 (h!36327 (_ BitVec 64)) (t!49619 List!34933)) )
))
(declare-fun arrayNoDuplicates!0 (array!100211 (_ BitVec 32) List!34933) Bool)

(assert (=> b!1502757 (= res!1023823 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34930))))

(declare-fun b!1502758 () Bool)

(declare-fun res!1023821 () Bool)

(assert (=> b!1502758 (=> (not res!1023821) (not e!840329))))

(assert (=> b!1502758 (= res!1023821 (validKeyInArray!0 (select (arr!48363 a!2850) j!87)))))

(declare-fun b!1502755 () Bool)

(assert (=> b!1502755 (= e!840329 false)))

(declare-fun lt!653206 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502755 (= lt!653206 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1023816 () Bool)

(assert (=> start!127902 (=> (not res!1023816) (not e!840329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127902 (= res!1023816 (validMask!0 mask!2661))))

(assert (=> start!127902 e!840329))

(assert (=> start!127902 true))

(declare-fun array_inv!37596 (array!100211) Bool)

(assert (=> start!127902 (array_inv!37596 a!2850)))

(assert (= (and start!127902 res!1023816) b!1502754))

(assert (= (and b!1502754 res!1023820) b!1502756))

(assert (= (and b!1502756 res!1023817) b!1502758))

(assert (= (and b!1502758 res!1023821) b!1502751))

(assert (= (and b!1502751 res!1023818) b!1502757))

(assert (= (and b!1502757 res!1023823) b!1502752))

(assert (= (and b!1502752 res!1023824) b!1502750))

(assert (= (and b!1502750 res!1023819) b!1502753))

(assert (= (and b!1502753 res!1023822) b!1502755))

(declare-fun m!1385433 () Bool)

(assert (=> start!127902 m!1385433))

(declare-fun m!1385435 () Bool)

(assert (=> start!127902 m!1385435))

(declare-fun m!1385437 () Bool)

(assert (=> b!1502752 m!1385437))

(declare-fun m!1385439 () Bool)

(assert (=> b!1502752 m!1385439))

(declare-fun m!1385441 () Bool)

(assert (=> b!1502752 m!1385441))

(declare-fun m!1385443 () Bool)

(assert (=> b!1502750 m!1385443))

(assert (=> b!1502750 m!1385443))

(declare-fun m!1385445 () Bool)

(assert (=> b!1502750 m!1385445))

(declare-fun m!1385447 () Bool)

(assert (=> b!1502751 m!1385447))

(declare-fun m!1385449 () Bool)

(assert (=> b!1502753 m!1385449))

(assert (=> b!1502753 m!1385443))

(declare-fun m!1385451 () Bool)

(assert (=> b!1502757 m!1385451))

(assert (=> b!1502758 m!1385443))

(assert (=> b!1502758 m!1385443))

(declare-fun m!1385453 () Bool)

(assert (=> b!1502758 m!1385453))

(declare-fun m!1385455 () Bool)

(assert (=> b!1502756 m!1385455))

(assert (=> b!1502756 m!1385455))

(declare-fun m!1385457 () Bool)

(assert (=> b!1502756 m!1385457))

(declare-fun m!1385459 () Bool)

(assert (=> b!1502755 m!1385459))

(push 1)

(assert (not b!1502757))

(assert (not b!1502758))

(assert (not b!1502751))

(assert (not b!1502750))

(assert (not b!1502755))

(assert (not b!1502756))

(assert (not start!127902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

