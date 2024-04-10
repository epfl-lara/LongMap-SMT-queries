; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127726 () Bool)

(assert start!127726)

(declare-fun b!1500851 () Bool)

(declare-fun res!1021929 () Bool)

(declare-fun e!839717 () Bool)

(assert (=> b!1500851 (=> (not res!1021929) (not e!839717))))

(declare-datatypes ((array!100107 0))(
  ( (array!100108 (arr!48313 (Array (_ BitVec 32) (_ BitVec 64))) (size!48863 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100107)

(declare-datatypes ((List!34805 0))(
  ( (Nil!34802) (Cons!34801 (h!36198 (_ BitVec 64)) (t!49499 List!34805)) )
))
(declare-fun arrayNoDuplicates!0 (array!100107 (_ BitVec 32) List!34805) Bool)

(assert (=> b!1500851 (= res!1021929 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34802))))

(declare-fun b!1500852 () Bool)

(declare-fun res!1021931 () Bool)

(assert (=> b!1500852 (=> (not res!1021931) (not e!839717))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12523 0))(
  ( (MissingZero!12523 (index!52484 (_ BitVec 32))) (Found!12523 (index!52485 (_ BitVec 32))) (Intermediate!12523 (undefined!13335 Bool) (index!52486 (_ BitVec 32)) (x!134149 (_ BitVec 32))) (Undefined!12523) (MissingVacant!12523 (index!52487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100107 (_ BitVec 32)) SeekEntryResult!12523)

(assert (=> b!1500852 (= res!1021931 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661) (Found!12523 j!87)))))

(declare-fun b!1500853 () Bool)

(declare-fun e!839719 () Bool)

(assert (=> b!1500853 (= e!839719 false)))

(declare-fun lt!653020 () SeekEntryResult!12523)

(declare-fun lt!653019 () (_ BitVec 32))

(assert (=> b!1500853 (= lt!653020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653019 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500854 () Bool)

(assert (=> b!1500854 (= e!839717 e!839719)))

(declare-fun res!1021928 () Bool)

(assert (=> b!1500854 (=> (not res!1021928) (not e!839719))))

(assert (=> b!1500854 (= res!1021928 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653019 #b00000000000000000000000000000000) (bvslt lt!653019 (size!48863 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500854 (= lt!653019 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500855 () Bool)

(declare-fun res!1021934 () Bool)

(assert (=> b!1500855 (=> (not res!1021934) (not e!839717))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500855 (= res!1021934 (validKeyInArray!0 (select (arr!48313 a!2850) i!996)))))

(declare-fun b!1500856 () Bool)

(declare-fun res!1021932 () Bool)

(assert (=> b!1500856 (=> (not res!1021932) (not e!839717))))

(assert (=> b!1500856 (= res!1021932 (validKeyInArray!0 (select (arr!48313 a!2850) j!87)))))

(declare-fun b!1500857 () Bool)

(declare-fun res!1021927 () Bool)

(assert (=> b!1500857 (=> (not res!1021927) (not e!839717))))

(assert (=> b!1500857 (= res!1021927 (and (= (size!48863 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48863 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48863 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500859 () Bool)

(declare-fun res!1021933 () Bool)

(assert (=> b!1500859 (=> (not res!1021933) (not e!839717))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500859 (= res!1021933 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48863 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48863 a!2850)) (= (select (arr!48313 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48863 a!2850))))))

(declare-fun b!1500860 () Bool)

(declare-fun res!1021935 () Bool)

(assert (=> b!1500860 (=> (not res!1021935) (not e!839717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100107 (_ BitVec 32)) Bool)

(assert (=> b!1500860 (= res!1021935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1021936 () Bool)

(assert (=> start!127726 (=> (not res!1021936) (not e!839717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127726 (= res!1021936 (validMask!0 mask!2661))))

(assert (=> start!127726 e!839717))

(assert (=> start!127726 true))

(declare-fun array_inv!37341 (array!100107) Bool)

(assert (=> start!127726 (array_inv!37341 a!2850)))

(declare-fun b!1500858 () Bool)

(declare-fun res!1021930 () Bool)

(assert (=> b!1500858 (=> (not res!1021930) (not e!839717))))

(assert (=> b!1500858 (= res!1021930 (not (= (select (arr!48313 a!2850) index!625) (select (arr!48313 a!2850) j!87))))))

(assert (= (and start!127726 res!1021936) b!1500857))

(assert (= (and b!1500857 res!1021927) b!1500855))

(assert (= (and b!1500855 res!1021934) b!1500856))

(assert (= (and b!1500856 res!1021932) b!1500860))

(assert (= (and b!1500860 res!1021935) b!1500851))

(assert (= (and b!1500851 res!1021929) b!1500859))

(assert (= (and b!1500859 res!1021933) b!1500852))

(assert (= (and b!1500852 res!1021931) b!1500858))

(assert (= (and b!1500858 res!1021930) b!1500854))

(assert (= (and b!1500854 res!1021928) b!1500853))

(declare-fun m!1384045 () Bool)

(assert (=> b!1500851 m!1384045))

(declare-fun m!1384047 () Bool)

(assert (=> b!1500860 m!1384047))

(declare-fun m!1384049 () Bool)

(assert (=> b!1500855 m!1384049))

(assert (=> b!1500855 m!1384049))

(declare-fun m!1384051 () Bool)

(assert (=> b!1500855 m!1384051))

(declare-fun m!1384053 () Bool)

(assert (=> b!1500856 m!1384053))

(assert (=> b!1500856 m!1384053))

(declare-fun m!1384055 () Bool)

(assert (=> b!1500856 m!1384055))

(declare-fun m!1384057 () Bool)

(assert (=> b!1500854 m!1384057))

(declare-fun m!1384059 () Bool)

(assert (=> start!127726 m!1384059))

(declare-fun m!1384061 () Bool)

(assert (=> start!127726 m!1384061))

(declare-fun m!1384063 () Bool)

(assert (=> b!1500859 m!1384063))

(declare-fun m!1384065 () Bool)

(assert (=> b!1500859 m!1384065))

(declare-fun m!1384067 () Bool)

(assert (=> b!1500859 m!1384067))

(assert (=> b!1500852 m!1384053))

(assert (=> b!1500852 m!1384053))

(declare-fun m!1384069 () Bool)

(assert (=> b!1500852 m!1384069))

(declare-fun m!1384071 () Bool)

(assert (=> b!1500858 m!1384071))

(assert (=> b!1500858 m!1384053))

(assert (=> b!1500853 m!1384053))

(assert (=> b!1500853 m!1384053))

(declare-fun m!1384073 () Bool)

(assert (=> b!1500853 m!1384073))

(push 1)

(assert (not b!1500855))

(assert (not b!1500856))

(assert (not b!1500851))

(assert (not start!127726))

(assert (not b!1500854))

(assert (not b!1500852))

(assert (not b!1500860))

(assert (not b!1500853))

(check-sat)

