; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127976 () Bool)

(assert start!127976)

(declare-fun b!1501909 () Bool)

(declare-fun res!1021806 () Bool)

(declare-fun e!840624 () Bool)

(assert (=> b!1501909 (=> (not res!1021806) (not e!840624))))

(declare-datatypes ((array!100171 0))(
  ( (array!100172 (arr!48340 (Array (_ BitVec 32) (_ BitVec 64))) (size!48891 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100171)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501909 (= res!1021806 (validKeyInArray!0 (select (arr!48340 a!2850) j!87)))))

(declare-fun b!1501910 () Bool)

(declare-fun res!1021810 () Bool)

(assert (=> b!1501910 (=> (not res!1021810) (not e!840624))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501910 (= res!1021810 (not (= (select (arr!48340 a!2850) index!625) (select (arr!48340 a!2850) j!87))))))

(declare-fun b!1501911 () Bool)

(declare-fun res!1021802 () Bool)

(assert (=> b!1501911 (=> (not res!1021802) (not e!840624))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100171 (_ BitVec 32)) Bool)

(assert (=> b!1501911 (= res!1021802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501912 () Bool)

(declare-fun e!840623 () Bool)

(assert (=> b!1501912 (= e!840623 false)))

(declare-fun lt!653529 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12443 0))(
  ( (MissingZero!12443 (index!52164 (_ BitVec 32))) (Found!12443 (index!52165 (_ BitVec 32))) (Intermediate!12443 (undefined!13255 Bool) (index!52166 (_ BitVec 32)) (x!134042 (_ BitVec 32))) (Undefined!12443) (MissingVacant!12443 (index!52167 (_ BitVec 32))) )
))
(declare-fun lt!653528 () SeekEntryResult!12443)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100171 (_ BitVec 32)) SeekEntryResult!12443)

(assert (=> b!1501912 (= lt!653528 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653529 vacantBefore!10 (select (arr!48340 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501913 () Bool)

(declare-fun res!1021811 () Bool)

(assert (=> b!1501913 (=> (not res!1021811) (not e!840624))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501913 (= res!1021811 (validKeyInArray!0 (select (arr!48340 a!2850) i!996)))))

(declare-fun b!1501914 () Bool)

(assert (=> b!1501914 (= e!840624 e!840623)))

(declare-fun res!1021809 () Bool)

(assert (=> b!1501914 (=> (not res!1021809) (not e!840623))))

(assert (=> b!1501914 (= res!1021809 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653529 #b00000000000000000000000000000000) (bvslt lt!653529 (size!48891 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501914 (= lt!653529 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501915 () Bool)

(declare-fun res!1021808 () Bool)

(assert (=> b!1501915 (=> (not res!1021808) (not e!840624))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501915 (= res!1021808 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48891 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48891 a!2850)) (= (select (arr!48340 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48340 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48891 a!2850))))))

(declare-fun res!1021807 () Bool)

(assert (=> start!127976 (=> (not res!1021807) (not e!840624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127976 (= res!1021807 (validMask!0 mask!2661))))

(assert (=> start!127976 e!840624))

(assert (=> start!127976 true))

(declare-fun array_inv!37621 (array!100171) Bool)

(assert (=> start!127976 (array_inv!37621 a!2850)))

(declare-fun b!1501916 () Bool)

(declare-fun res!1021804 () Bool)

(assert (=> b!1501916 (=> (not res!1021804) (not e!840624))))

(assert (=> b!1501916 (= res!1021804 (and (= (size!48891 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48891 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48891 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501917 () Bool)

(declare-fun res!1021803 () Bool)

(assert (=> b!1501917 (=> (not res!1021803) (not e!840624))))

(declare-datatypes ((List!34819 0))(
  ( (Nil!34816) (Cons!34815 (h!36227 (_ BitVec 64)) (t!49505 List!34819)) )
))
(declare-fun arrayNoDuplicates!0 (array!100171 (_ BitVec 32) List!34819) Bool)

(assert (=> b!1501917 (= res!1021803 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34816))))

(declare-fun b!1501918 () Bool)

(declare-fun res!1021805 () Bool)

(assert (=> b!1501918 (=> (not res!1021805) (not e!840624))))

(assert (=> b!1501918 (= res!1021805 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48340 a!2850) j!87) a!2850 mask!2661) (Found!12443 j!87)))))

(assert (= (and start!127976 res!1021807) b!1501916))

(assert (= (and b!1501916 res!1021804) b!1501913))

(assert (= (and b!1501913 res!1021811) b!1501909))

(assert (= (and b!1501909 res!1021806) b!1501911))

(assert (= (and b!1501911 res!1021802) b!1501917))

(assert (= (and b!1501917 res!1021803) b!1501915))

(assert (= (and b!1501915 res!1021808) b!1501918))

(assert (= (and b!1501918 res!1021805) b!1501910))

(assert (= (and b!1501910 res!1021810) b!1501914))

(assert (= (and b!1501914 res!1021809) b!1501912))

(declare-fun m!1385053 () Bool)

(assert (=> b!1501914 m!1385053))

(declare-fun m!1385055 () Bool)

(assert (=> b!1501915 m!1385055))

(declare-fun m!1385057 () Bool)

(assert (=> b!1501915 m!1385057))

(declare-fun m!1385059 () Bool)

(assert (=> b!1501915 m!1385059))

(declare-fun m!1385061 () Bool)

(assert (=> b!1501910 m!1385061))

(declare-fun m!1385063 () Bool)

(assert (=> b!1501910 m!1385063))

(declare-fun m!1385065 () Bool)

(assert (=> start!127976 m!1385065))

(declare-fun m!1385067 () Bool)

(assert (=> start!127976 m!1385067))

(assert (=> b!1501909 m!1385063))

(assert (=> b!1501909 m!1385063))

(declare-fun m!1385069 () Bool)

(assert (=> b!1501909 m!1385069))

(declare-fun m!1385071 () Bool)

(assert (=> b!1501911 m!1385071))

(assert (=> b!1501912 m!1385063))

(assert (=> b!1501912 m!1385063))

(declare-fun m!1385073 () Bool)

(assert (=> b!1501912 m!1385073))

(declare-fun m!1385075 () Bool)

(assert (=> b!1501913 m!1385075))

(assert (=> b!1501913 m!1385075))

(declare-fun m!1385077 () Bool)

(assert (=> b!1501913 m!1385077))

(assert (=> b!1501918 m!1385063))

(assert (=> b!1501918 m!1385063))

(declare-fun m!1385079 () Bool)

(assert (=> b!1501918 m!1385079))

(declare-fun m!1385081 () Bool)

(assert (=> b!1501917 m!1385081))

(check-sat (not b!1501911) (not start!127976) (not b!1501913) (not b!1501917) (not b!1501914) (not b!1501918) (not b!1501912) (not b!1501909))
(check-sat)
