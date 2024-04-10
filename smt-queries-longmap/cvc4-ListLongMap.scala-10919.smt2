; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127780 () Bool)

(assert start!127780)

(declare-fun b!1501740 () Bool)

(declare-fun res!1022827 () Bool)

(declare-fun e!840039 () Bool)

(assert (=> b!1501740 (=> (not res!1022827) (not e!840039))))

(declare-datatypes ((array!100161 0))(
  ( (array!100162 (arr!48340 (Array (_ BitVec 32) (_ BitVec 64))) (size!48890 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100161)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501740 (= res!1022827 (not (= (select (arr!48340 a!2850) index!625) (select (arr!48340 a!2850) j!87))))))

(declare-fun b!1501741 () Bool)

(declare-fun res!1022822 () Bool)

(declare-fun e!840042 () Bool)

(assert (=> b!1501741 (=> (not res!1022822) (not e!840042))))

(declare-datatypes ((List!34832 0))(
  ( (Nil!34829) (Cons!34828 (h!36225 (_ BitVec 64)) (t!49526 List!34832)) )
))
(declare-fun arrayNoDuplicates!0 (array!100161 (_ BitVec 32) List!34832) Bool)

(assert (=> b!1501741 (= res!1022822 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34829))))

(declare-fun b!1501742 () Bool)

(declare-fun res!1022820 () Bool)

(declare-fun e!840043 () Bool)

(assert (=> b!1501742 (=> (not res!1022820) (not e!840043))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12550 0))(
  ( (MissingZero!12550 (index!52592 (_ BitVec 32))) (Found!12550 (index!52593 (_ BitVec 32))) (Intermediate!12550 (undefined!13362 Bool) (index!52594 (_ BitVec 32)) (x!134248 (_ BitVec 32))) (Undefined!12550) (MissingVacant!12550 (index!52595 (_ BitVec 32))) )
))
(declare-fun lt!653253 () SeekEntryResult!12550)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653254 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100161 (_ BitVec 32)) SeekEntryResult!12550)

(assert (=> b!1501742 (= res!1022820 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653254 vacantBefore!10 (select (arr!48340 a!2850) j!87) a!2850 mask!2661) lt!653253))))

(declare-fun b!1501743 () Bool)

(declare-fun res!1022817 () Bool)

(assert (=> b!1501743 (=> (not res!1022817) (not e!840042))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501743 (= res!1022817 (validKeyInArray!0 (select (arr!48340 a!2850) i!996)))))

(declare-fun b!1501744 () Bool)

(declare-fun res!1022825 () Bool)

(assert (=> b!1501744 (=> (not res!1022825) (not e!840042))))

(assert (=> b!1501744 (= res!1022825 (validKeyInArray!0 (select (arr!48340 a!2850) j!87)))))

(declare-fun b!1501745 () Bool)

(declare-fun res!1022826 () Bool)

(assert (=> b!1501745 (=> (not res!1022826) (not e!840042))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501745 (= res!1022826 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48890 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48890 a!2850)) (= (select (arr!48340 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48340 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48890 a!2850))))))

(declare-fun b!1501746 () Bool)

(declare-fun e!840040 () Bool)

(assert (=> b!1501746 (= e!840040 (validKeyInArray!0 (select (store (arr!48340 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun res!1022824 () Bool)

(assert (=> start!127780 (=> (not res!1022824) (not e!840042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127780 (= res!1022824 (validMask!0 mask!2661))))

(assert (=> start!127780 e!840042))

(assert (=> start!127780 true))

(declare-fun array_inv!37368 (array!100161) Bool)

(assert (=> start!127780 (array_inv!37368 a!2850)))

(declare-fun b!1501747 () Bool)

(declare-fun res!1022819 () Bool)

(assert (=> b!1501747 (=> (not res!1022819) (not e!840042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100161 (_ BitVec 32)) Bool)

(assert (=> b!1501747 (= res!1022819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501748 () Bool)

(assert (=> b!1501748 (= e!840039 e!840043)))

(declare-fun res!1022818 () Bool)

(assert (=> b!1501748 (=> (not res!1022818) (not e!840043))))

(assert (=> b!1501748 (= res!1022818 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653254 #b00000000000000000000000000000000) (bvslt lt!653254 (size!48890 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501748 (= lt!653254 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501749 () Bool)

(assert (=> b!1501749 (= e!840043 (not e!840040))))

(declare-fun res!1022823 () Bool)

(assert (=> b!1501749 (=> res!1022823 e!840040)))

(assert (=> b!1501749 (= res!1022823 (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (=> b!1501749 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653254 vacantAfter!10 (select (store (arr!48340 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100162 (store (arr!48340 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48890 a!2850)) mask!2661) lt!653253)))

(declare-datatypes ((Unit!50254 0))(
  ( (Unit!50255) )
))
(declare-fun lt!653252 () Unit!50254)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50254)

(assert (=> b!1501749 (= lt!653252 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653254 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501750 () Bool)

(assert (=> b!1501750 (= e!840042 e!840039)))

(declare-fun res!1022816 () Bool)

(assert (=> b!1501750 (=> (not res!1022816) (not e!840039))))

(assert (=> b!1501750 (= res!1022816 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48340 a!2850) j!87) a!2850 mask!2661) lt!653253))))

(assert (=> b!1501750 (= lt!653253 (Found!12550 j!87))))

(declare-fun b!1501751 () Bool)

(declare-fun res!1022821 () Bool)

(assert (=> b!1501751 (=> (not res!1022821) (not e!840042))))

(assert (=> b!1501751 (= res!1022821 (and (= (size!48890 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48890 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48890 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127780 res!1022824) b!1501751))

(assert (= (and b!1501751 res!1022821) b!1501743))

(assert (= (and b!1501743 res!1022817) b!1501744))

(assert (= (and b!1501744 res!1022825) b!1501747))

(assert (= (and b!1501747 res!1022819) b!1501741))

(assert (= (and b!1501741 res!1022822) b!1501745))

(assert (= (and b!1501745 res!1022826) b!1501750))

(assert (= (and b!1501750 res!1022816) b!1501740))

(assert (= (and b!1501740 res!1022827) b!1501748))

(assert (= (and b!1501748 res!1022818) b!1501742))

(assert (= (and b!1501742 res!1022820) b!1501749))

(assert (= (and b!1501749 (not res!1022823)) b!1501746))

(declare-fun m!1384997 () Bool)

(assert (=> b!1501743 m!1384997))

(assert (=> b!1501743 m!1384997))

(declare-fun m!1384999 () Bool)

(assert (=> b!1501743 m!1384999))

(declare-fun m!1385001 () Bool)

(assert (=> b!1501745 m!1385001))

(declare-fun m!1385003 () Bool)

(assert (=> b!1501745 m!1385003))

(declare-fun m!1385005 () Bool)

(assert (=> b!1501745 m!1385005))

(declare-fun m!1385007 () Bool)

(assert (=> b!1501748 m!1385007))

(declare-fun m!1385009 () Bool)

(assert (=> b!1501744 m!1385009))

(assert (=> b!1501744 m!1385009))

(declare-fun m!1385011 () Bool)

(assert (=> b!1501744 m!1385011))

(assert (=> b!1501749 m!1385003))

(declare-fun m!1385013 () Bool)

(assert (=> b!1501749 m!1385013))

(assert (=> b!1501749 m!1385013))

(declare-fun m!1385015 () Bool)

(assert (=> b!1501749 m!1385015))

(declare-fun m!1385017 () Bool)

(assert (=> b!1501749 m!1385017))

(declare-fun m!1385019 () Bool)

(assert (=> b!1501741 m!1385019))

(assert (=> b!1501750 m!1385009))

(assert (=> b!1501750 m!1385009))

(declare-fun m!1385021 () Bool)

(assert (=> b!1501750 m!1385021))

(declare-fun m!1385023 () Bool)

(assert (=> b!1501740 m!1385023))

(assert (=> b!1501740 m!1385009))

(assert (=> b!1501746 m!1385003))

(assert (=> b!1501746 m!1385013))

(assert (=> b!1501746 m!1385013))

(declare-fun m!1385025 () Bool)

(assert (=> b!1501746 m!1385025))

(declare-fun m!1385027 () Bool)

(assert (=> b!1501747 m!1385027))

(declare-fun m!1385029 () Bool)

(assert (=> start!127780 m!1385029))

(declare-fun m!1385031 () Bool)

(assert (=> start!127780 m!1385031))

(assert (=> b!1501742 m!1385009))

(assert (=> b!1501742 m!1385009))

(declare-fun m!1385033 () Bool)

(assert (=> b!1501742 m!1385033))

(push 1)

(assert (not b!1501744))

(assert (not start!127780))

(assert (not b!1501747))

(assert (not b!1501741))

(assert (not b!1501749))

(assert (not b!1501742))

(assert (not b!1501743))

(assert (not b!1501750))

(assert (not b!1501746))

(assert (not b!1501748))

(check-sat)

