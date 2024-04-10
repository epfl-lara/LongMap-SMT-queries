; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127714 () Bool)

(assert start!127714)

(declare-fun b!1500671 () Bool)

(declare-fun res!1021747 () Bool)

(declare-fun e!839663 () Bool)

(assert (=> b!1500671 (=> (not res!1021747) (not e!839663))))

(declare-datatypes ((array!100095 0))(
  ( (array!100096 (arr!48307 (Array (_ BitVec 32) (_ BitVec 64))) (size!48857 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100095)

(declare-datatypes ((List!34799 0))(
  ( (Nil!34796) (Cons!34795 (h!36192 (_ BitVec 64)) (t!49493 List!34799)) )
))
(declare-fun arrayNoDuplicates!0 (array!100095 (_ BitVec 32) List!34799) Bool)

(assert (=> b!1500671 (= res!1021747 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34796))))

(declare-fun res!1021750 () Bool)

(assert (=> start!127714 (=> (not res!1021750) (not e!839663))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127714 (= res!1021750 (validMask!0 mask!2661))))

(assert (=> start!127714 e!839663))

(assert (=> start!127714 true))

(declare-fun array_inv!37335 (array!100095) Bool)

(assert (=> start!127714 (array_inv!37335 a!2850)))

(declare-fun b!1500672 () Bool)

(declare-fun res!1021751 () Bool)

(assert (=> b!1500672 (=> (not res!1021751) (not e!839663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100095 (_ BitVec 32)) Bool)

(assert (=> b!1500672 (= res!1021751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500673 () Bool)

(declare-fun e!839665 () Bool)

(assert (=> b!1500673 (= e!839665 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12517 0))(
  ( (MissingZero!12517 (index!52460 (_ BitVec 32))) (Found!12517 (index!52461 (_ BitVec 32))) (Intermediate!12517 (undefined!13329 Bool) (index!52462 (_ BitVec 32)) (x!134127 (_ BitVec 32))) (Undefined!12517) (MissingVacant!12517 (index!52463 (_ BitVec 32))) )
))
(declare-fun lt!652983 () SeekEntryResult!12517)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun lt!652984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100095 (_ BitVec 32)) SeekEntryResult!12517)

(assert (=> b!1500673 (= lt!652983 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652984 vacantBefore!10 (select (arr!48307 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500674 () Bool)

(declare-fun res!1021748 () Bool)

(assert (=> b!1500674 (=> (not res!1021748) (not e!839663))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500674 (= res!1021748 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48307 a!2850) j!87) a!2850 mask!2661) (Found!12517 j!87)))))

(declare-fun b!1500675 () Bool)

(declare-fun res!1021754 () Bool)

(assert (=> b!1500675 (=> (not res!1021754) (not e!839663))))

(assert (=> b!1500675 (= res!1021754 (not (= (select (arr!48307 a!2850) index!625) (select (arr!48307 a!2850) j!87))))))

(declare-fun b!1500676 () Bool)

(declare-fun res!1021752 () Bool)

(assert (=> b!1500676 (=> (not res!1021752) (not e!839663))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500676 (= res!1021752 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48857 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48857 a!2850)) (= (select (arr!48307 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48307 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48857 a!2850))))))

(declare-fun b!1500677 () Bool)

(declare-fun res!1021755 () Bool)

(assert (=> b!1500677 (=> (not res!1021755) (not e!839663))))

(assert (=> b!1500677 (= res!1021755 (and (= (size!48857 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48857 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48857 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500678 () Bool)

(declare-fun res!1021756 () Bool)

(assert (=> b!1500678 (=> (not res!1021756) (not e!839663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500678 (= res!1021756 (validKeyInArray!0 (select (arr!48307 a!2850) i!996)))))

(declare-fun b!1500679 () Bool)

(declare-fun res!1021749 () Bool)

(assert (=> b!1500679 (=> (not res!1021749) (not e!839663))))

(assert (=> b!1500679 (= res!1021749 (validKeyInArray!0 (select (arr!48307 a!2850) j!87)))))

(declare-fun b!1500680 () Bool)

(assert (=> b!1500680 (= e!839663 e!839665)))

(declare-fun res!1021753 () Bool)

(assert (=> b!1500680 (=> (not res!1021753) (not e!839665))))

(assert (=> b!1500680 (= res!1021753 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652984 #b00000000000000000000000000000000) (bvslt lt!652984 (size!48857 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500680 (= lt!652984 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127714 res!1021750) b!1500677))

(assert (= (and b!1500677 res!1021755) b!1500678))

(assert (= (and b!1500678 res!1021756) b!1500679))

(assert (= (and b!1500679 res!1021749) b!1500672))

(assert (= (and b!1500672 res!1021751) b!1500671))

(assert (= (and b!1500671 res!1021747) b!1500676))

(assert (= (and b!1500676 res!1021752) b!1500674))

(assert (= (and b!1500674 res!1021748) b!1500675))

(assert (= (and b!1500675 res!1021754) b!1500680))

(assert (= (and b!1500680 res!1021753) b!1500673))

(declare-fun m!1383865 () Bool)

(assert (=> b!1500674 m!1383865))

(assert (=> b!1500674 m!1383865))

(declare-fun m!1383867 () Bool)

(assert (=> b!1500674 m!1383867))

(assert (=> b!1500679 m!1383865))

(assert (=> b!1500679 m!1383865))

(declare-fun m!1383869 () Bool)

(assert (=> b!1500679 m!1383869))

(declare-fun m!1383871 () Bool)

(assert (=> b!1500678 m!1383871))

(assert (=> b!1500678 m!1383871))

(declare-fun m!1383873 () Bool)

(assert (=> b!1500678 m!1383873))

(declare-fun m!1383875 () Bool)

(assert (=> b!1500672 m!1383875))

(declare-fun m!1383877 () Bool)

(assert (=> b!1500680 m!1383877))

(declare-fun m!1383879 () Bool)

(assert (=> b!1500676 m!1383879))

(declare-fun m!1383881 () Bool)

(assert (=> b!1500676 m!1383881))

(declare-fun m!1383883 () Bool)

(assert (=> b!1500676 m!1383883))

(declare-fun m!1383885 () Bool)

(assert (=> b!1500675 m!1383885))

(assert (=> b!1500675 m!1383865))

(assert (=> b!1500673 m!1383865))

(assert (=> b!1500673 m!1383865))

(declare-fun m!1383887 () Bool)

(assert (=> b!1500673 m!1383887))

(declare-fun m!1383889 () Bool)

(assert (=> b!1500671 m!1383889))

(declare-fun m!1383891 () Bool)

(assert (=> start!127714 m!1383891))

(declare-fun m!1383893 () Bool)

(assert (=> start!127714 m!1383893))

(push 1)

(assert (not b!1500678))

(assert (not b!1500673))

(assert (not b!1500672))

(assert (not start!127714))

(assert (not b!1500674))

(assert (not b!1500679))

(assert (not b!1500680))

(assert (not b!1500671))

(check-sat)

