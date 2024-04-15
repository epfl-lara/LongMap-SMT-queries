; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127830 () Bool)

(assert start!127830)

(declare-fun res!1023310 () Bool)

(declare-fun e!840114 () Bool)

(assert (=> start!127830 (=> (not res!1023310) (not e!840114))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127830 (= res!1023310 (validMask!0 mask!2661))))

(assert (=> start!127830 e!840114))

(assert (=> start!127830 true))

(declare-datatypes ((array!100172 0))(
  ( (array!100173 (arr!48345 (Array (_ BitVec 32) (_ BitVec 64))) (size!48897 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100172)

(declare-fun array_inv!37578 (array!100172) Bool)

(assert (=> start!127830 (array_inv!37578 a!2850)))

(declare-fun b!1502131 () Bool)

(assert (=> b!1502131 (= e!840114 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12564 0))(
  ( (MissingZero!12564 (index!52648 (_ BitVec 32))) (Found!12564 (index!52649 (_ BitVec 32))) (Intermediate!12564 (undefined!13376 Bool) (index!52650 (_ BitVec 32)) (x!134340 (_ BitVec 32))) (Undefined!12564) (MissingVacant!12564 (index!52651 (_ BitVec 32))) )
))
(declare-fun lt!653101 () SeekEntryResult!12564)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100172 (_ BitVec 32)) SeekEntryResult!12564)

(assert (=> b!1502131 (= lt!653101 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48345 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502132 () Bool)

(declare-fun res!1023309 () Bool)

(assert (=> b!1502132 (=> (not res!1023309) (not e!840114))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502132 (= res!1023309 (and (= (size!48897 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48897 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48897 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502133 () Bool)

(declare-fun res!1023306 () Bool)

(assert (=> b!1502133 (=> (not res!1023306) (not e!840114))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502133 (= res!1023306 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48897 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48897 a!2850)) (= (select (arr!48345 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48345 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48897 a!2850))))))

(declare-fun b!1502134 () Bool)

(declare-fun res!1023311 () Bool)

(assert (=> b!1502134 (=> (not res!1023311) (not e!840114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100172 (_ BitVec 32)) Bool)

(assert (=> b!1502134 (= res!1023311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502135 () Bool)

(declare-fun res!1023307 () Bool)

(assert (=> b!1502135 (=> (not res!1023307) (not e!840114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502135 (= res!1023307 (validKeyInArray!0 (select (arr!48345 a!2850) i!996)))))

(declare-fun b!1502136 () Bool)

(declare-fun res!1023308 () Bool)

(assert (=> b!1502136 (=> (not res!1023308) (not e!840114))))

(assert (=> b!1502136 (= res!1023308 (validKeyInArray!0 (select (arr!48345 a!2850) j!87)))))

(declare-fun b!1502137 () Bool)

(declare-fun res!1023305 () Bool)

(assert (=> b!1502137 (=> (not res!1023305) (not e!840114))))

(declare-datatypes ((List!34915 0))(
  ( (Nil!34912) (Cons!34911 (h!36309 (_ BitVec 64)) (t!49601 List!34915)) )
))
(declare-fun arrayNoDuplicates!0 (array!100172 (_ BitVec 32) List!34915) Bool)

(assert (=> b!1502137 (= res!1023305 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34912))))

(assert (= (and start!127830 res!1023310) b!1502132))

(assert (= (and b!1502132 res!1023309) b!1502135))

(assert (= (and b!1502135 res!1023307) b!1502136))

(assert (= (and b!1502136 res!1023308) b!1502134))

(assert (= (and b!1502134 res!1023311) b!1502137))

(assert (= (and b!1502137 res!1023305) b!1502133))

(assert (= (and b!1502133 res!1023306) b!1502131))

(declare-fun m!1384843 () Bool)

(assert (=> start!127830 m!1384843))

(declare-fun m!1384845 () Bool)

(assert (=> start!127830 m!1384845))

(declare-fun m!1384847 () Bool)

(assert (=> b!1502131 m!1384847))

(assert (=> b!1502131 m!1384847))

(declare-fun m!1384849 () Bool)

(assert (=> b!1502131 m!1384849))

(assert (=> b!1502136 m!1384847))

(assert (=> b!1502136 m!1384847))

(declare-fun m!1384851 () Bool)

(assert (=> b!1502136 m!1384851))

(declare-fun m!1384853 () Bool)

(assert (=> b!1502137 m!1384853))

(declare-fun m!1384855 () Bool)

(assert (=> b!1502135 m!1384855))

(assert (=> b!1502135 m!1384855))

(declare-fun m!1384857 () Bool)

(assert (=> b!1502135 m!1384857))

(declare-fun m!1384859 () Bool)

(assert (=> b!1502134 m!1384859))

(declare-fun m!1384861 () Bool)

(assert (=> b!1502133 m!1384861))

(declare-fun m!1384863 () Bool)

(assert (=> b!1502133 m!1384863))

(declare-fun m!1384865 () Bool)

(assert (=> b!1502133 m!1384865))

(push 1)

(assert (not b!1502137))

(assert (not b!1502134))

(assert (not b!1502136))

(assert (not start!127830))

(assert (not b!1502131))

(assert (not b!1502135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

