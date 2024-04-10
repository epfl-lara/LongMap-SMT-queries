; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127778 () Bool)

(assert start!127778)

(declare-fun b!1501704 () Bool)

(declare-fun e!840028 () Bool)

(declare-fun e!840027 () Bool)

(assert (=> b!1501704 (= e!840028 e!840027)))

(declare-fun res!1022787 () Bool)

(assert (=> b!1501704 (=> (not res!1022787) (not e!840027))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100159 0))(
  ( (array!100160 (arr!48339 (Array (_ BitVec 32) (_ BitVec 64))) (size!48889 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100159)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12549 0))(
  ( (MissingZero!12549 (index!52588 (_ BitVec 32))) (Found!12549 (index!52589 (_ BitVec 32))) (Intermediate!12549 (undefined!13361 Bool) (index!52590 (_ BitVec 32)) (x!134247 (_ BitVec 32))) (Undefined!12549) (MissingVacant!12549 (index!52591 (_ BitVec 32))) )
))
(declare-fun lt!653245 () SeekEntryResult!12549)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100159 (_ BitVec 32)) SeekEntryResult!12549)

(assert (=> b!1501704 (= res!1022787 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48339 a!2850) j!87) a!2850 mask!2661) lt!653245))))

(assert (=> b!1501704 (= lt!653245 (Found!12549 j!87))))

(declare-fun b!1501706 () Bool)

(declare-fun res!1022784 () Bool)

(assert (=> b!1501706 (=> (not res!1022784) (not e!840028))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501706 (= res!1022784 (and (= (size!48889 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48889 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48889 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501707 () Bool)

(declare-fun e!840025 () Bool)

(assert (=> b!1501707 (= e!840027 e!840025)))

(declare-fun res!1022790 () Bool)

(assert (=> b!1501707 (=> (not res!1022790) (not e!840025))))

(declare-fun lt!653244 () (_ BitVec 32))

(assert (=> b!1501707 (= res!1022790 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653244 #b00000000000000000000000000000000) (bvslt lt!653244 (size!48889 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501707 (= lt!653244 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501708 () Bool)

(declare-fun res!1022782 () Bool)

(assert (=> b!1501708 (=> (not res!1022782) (not e!840028))))

(declare-datatypes ((List!34831 0))(
  ( (Nil!34828) (Cons!34827 (h!36224 (_ BitVec 64)) (t!49525 List!34831)) )
))
(declare-fun arrayNoDuplicates!0 (array!100159 (_ BitVec 32) List!34831) Bool)

(assert (=> b!1501708 (= res!1022782 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34828))))

(declare-fun b!1501709 () Bool)

(declare-fun res!1022789 () Bool)

(assert (=> b!1501709 (=> (not res!1022789) (not e!840028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501709 (= res!1022789 (validKeyInArray!0 (select (arr!48339 a!2850) j!87)))))

(declare-fun b!1501710 () Bool)

(declare-fun res!1022780 () Bool)

(assert (=> b!1501710 (=> (not res!1022780) (not e!840028))))

(assert (=> b!1501710 (= res!1022780 (validKeyInArray!0 (select (arr!48339 a!2850) i!996)))))

(declare-fun b!1501711 () Bool)

(declare-fun res!1022791 () Bool)

(assert (=> b!1501711 (=> (not res!1022791) (not e!840025))))

(assert (=> b!1501711 (= res!1022791 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653244 vacantBefore!10 (select (arr!48339 a!2850) j!87) a!2850 mask!2661) lt!653245))))

(declare-fun b!1501712 () Bool)

(declare-fun e!840026 () Bool)

(assert (=> b!1501712 (= e!840026 (validKeyInArray!0 (select (store (arr!48339 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun b!1501713 () Bool)

(declare-fun res!1022781 () Bool)

(assert (=> b!1501713 (=> (not res!1022781) (not e!840028))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501713 (= res!1022781 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48889 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48889 a!2850)) (= (select (arr!48339 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48339 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48889 a!2850))))))

(declare-fun b!1501714 () Bool)

(declare-fun res!1022788 () Bool)

(assert (=> b!1501714 (=> (not res!1022788) (not e!840028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100159 (_ BitVec 32)) Bool)

(assert (=> b!1501714 (= res!1022788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501715 () Bool)

(assert (=> b!1501715 (= e!840025 (not e!840026))))

(declare-fun res!1022786 () Bool)

(assert (=> b!1501715 (=> res!1022786 e!840026)))

(assert (=> b!1501715 (= res!1022786 (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (=> b!1501715 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653244 vacantAfter!10 (select (store (arr!48339 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100160 (store (arr!48339 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48889 a!2850)) mask!2661) lt!653245)))

(declare-datatypes ((Unit!50252 0))(
  ( (Unit!50253) )
))
(declare-fun lt!653243 () Unit!50252)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50252)

(assert (=> b!1501715 (= lt!653243 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653244 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501705 () Bool)

(declare-fun res!1022785 () Bool)

(assert (=> b!1501705 (=> (not res!1022785) (not e!840027))))

(assert (=> b!1501705 (= res!1022785 (not (= (select (arr!48339 a!2850) index!625) (select (arr!48339 a!2850) j!87))))))

(declare-fun res!1022783 () Bool)

(assert (=> start!127778 (=> (not res!1022783) (not e!840028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127778 (= res!1022783 (validMask!0 mask!2661))))

(assert (=> start!127778 e!840028))

(assert (=> start!127778 true))

(declare-fun array_inv!37367 (array!100159) Bool)

(assert (=> start!127778 (array_inv!37367 a!2850)))

(assert (= (and start!127778 res!1022783) b!1501706))

(assert (= (and b!1501706 res!1022784) b!1501710))

(assert (= (and b!1501710 res!1022780) b!1501709))

(assert (= (and b!1501709 res!1022789) b!1501714))

(assert (= (and b!1501714 res!1022788) b!1501708))

(assert (= (and b!1501708 res!1022782) b!1501713))

(assert (= (and b!1501713 res!1022781) b!1501704))

(assert (= (and b!1501704 res!1022787) b!1501705))

(assert (= (and b!1501705 res!1022785) b!1501707))

(assert (= (and b!1501707 res!1022790) b!1501711))

(assert (= (and b!1501711 res!1022791) b!1501715))

(assert (= (and b!1501715 (not res!1022786)) b!1501712))

(declare-fun m!1384959 () Bool)

(assert (=> b!1501710 m!1384959))

(assert (=> b!1501710 m!1384959))

(declare-fun m!1384961 () Bool)

(assert (=> b!1501710 m!1384961))

(declare-fun m!1384963 () Bool)

(assert (=> b!1501714 m!1384963))

(declare-fun m!1384965 () Bool)

(assert (=> b!1501709 m!1384965))

(assert (=> b!1501709 m!1384965))

(declare-fun m!1384967 () Bool)

(assert (=> b!1501709 m!1384967))

(declare-fun m!1384969 () Bool)

(assert (=> b!1501705 m!1384969))

(assert (=> b!1501705 m!1384965))

(declare-fun m!1384971 () Bool)

(assert (=> b!1501713 m!1384971))

(declare-fun m!1384973 () Bool)

(assert (=> b!1501713 m!1384973))

(declare-fun m!1384975 () Bool)

(assert (=> b!1501713 m!1384975))

(assert (=> b!1501711 m!1384965))

(assert (=> b!1501711 m!1384965))

(declare-fun m!1384977 () Bool)

(assert (=> b!1501711 m!1384977))

(declare-fun m!1384979 () Bool)

(assert (=> b!1501707 m!1384979))

(declare-fun m!1384981 () Bool)

(assert (=> b!1501708 m!1384981))

(assert (=> b!1501704 m!1384965))

(assert (=> b!1501704 m!1384965))

(declare-fun m!1384983 () Bool)

(assert (=> b!1501704 m!1384983))

(assert (=> b!1501715 m!1384973))

(declare-fun m!1384985 () Bool)

(assert (=> b!1501715 m!1384985))

(assert (=> b!1501715 m!1384985))

(declare-fun m!1384987 () Bool)

(assert (=> b!1501715 m!1384987))

(declare-fun m!1384989 () Bool)

(assert (=> b!1501715 m!1384989))

(assert (=> b!1501712 m!1384973))

(assert (=> b!1501712 m!1384985))

(assert (=> b!1501712 m!1384985))

(declare-fun m!1384991 () Bool)

(assert (=> b!1501712 m!1384991))

(declare-fun m!1384993 () Bool)

(assert (=> start!127778 m!1384993))

(declare-fun m!1384995 () Bool)

(assert (=> start!127778 m!1384995))

(check-sat (not b!1501710) (not b!1501714) (not start!127778) (not b!1501715) (not b!1501704) (not b!1501711) (not b!1501709) (not b!1501712) (not b!1501708) (not b!1501707))
(check-sat)
