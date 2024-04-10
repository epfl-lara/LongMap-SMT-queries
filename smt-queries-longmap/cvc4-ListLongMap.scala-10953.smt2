; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128182 () Bool)

(assert start!128182)

(declare-fun res!1025605 () Bool)

(declare-fun e!841204 () Bool)

(assert (=> start!128182 (=> (not res!1025605) (not e!841204))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128182 (= res!1025605 (validMask!0 mask!2661))))

(assert (=> start!128182 e!841204))

(assert (=> start!128182 true))

(declare-datatypes ((array!100380 0))(
  ( (array!100381 (arr!48442 (Array (_ BitVec 32) (_ BitVec 64))) (size!48992 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100380)

(declare-fun array_inv!37470 (array!100380) Bool)

(assert (=> start!128182 (array_inv!37470 a!2850)))

(declare-fun b!1505008 () Bool)

(declare-fun res!1025600 () Bool)

(assert (=> b!1505008 (=> (not res!1025600) (not e!841204))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505008 (= res!1025600 (and (= (size!48992 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48992 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48992 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505009 () Bool)

(declare-fun res!1025607 () Bool)

(declare-fun e!841202 () Bool)

(assert (=> b!1505009 (=> (not res!1025607) (not e!841202))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653869 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12640 0))(
  ( (MissingZero!12640 (index!52952 (_ BitVec 32))) (Found!12640 (index!52953 (_ BitVec 32))) (Intermediate!12640 (undefined!13452 Bool) (index!52954 (_ BitVec 32)) (x!134634 (_ BitVec 32))) (Undefined!12640) (MissingVacant!12640 (index!52955 (_ BitVec 32))) )
))
(declare-fun lt!653868 () SeekEntryResult!12640)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100380 (_ BitVec 32)) SeekEntryResult!12640)

(assert (=> b!1505009 (= res!1025607 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653869 vacantBefore!10 (select (arr!48442 a!2850) j!87) a!2850 mask!2661) lt!653868))))

(declare-fun b!1505010 () Bool)

(declare-fun res!1025599 () Bool)

(assert (=> b!1505010 (=> (not res!1025599) (not e!841204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505010 (= res!1025599 (validKeyInArray!0 (select (arr!48442 a!2850) i!996)))))

(declare-fun b!1505011 () Bool)

(declare-fun res!1025606 () Bool)

(assert (=> b!1505011 (=> (not res!1025606) (not e!841204))))

(assert (=> b!1505011 (= res!1025606 (validKeyInArray!0 (select (arr!48442 a!2850) j!87)))))

(declare-fun b!1505012 () Bool)

(declare-fun e!841201 () Bool)

(assert (=> b!1505012 (= e!841201 e!841202)))

(declare-fun res!1025604 () Bool)

(assert (=> b!1505012 (=> (not res!1025604) (not e!841202))))

(assert (=> b!1505012 (= res!1025604 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653869 #b00000000000000000000000000000000) (bvslt lt!653869 (size!48992 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505012 (= lt!653869 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1505013 () Bool)

(declare-fun res!1025598 () Bool)

(assert (=> b!1505013 (=> (not res!1025598) (not e!841201))))

(assert (=> b!1505013 (= res!1025598 (not (= (select (arr!48442 a!2850) index!625) (select (arr!48442 a!2850) j!87))))))

(declare-fun b!1505014 () Bool)

(assert (=> b!1505014 (= e!841204 e!841201)))

(declare-fun res!1025608 () Bool)

(assert (=> b!1505014 (=> (not res!1025608) (not e!841201))))

(assert (=> b!1505014 (= res!1025608 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48442 a!2850) j!87) a!2850 mask!2661) lt!653868))))

(assert (=> b!1505014 (= lt!653868 (Found!12640 j!87))))

(declare-fun b!1505015 () Bool)

(assert (=> b!1505015 (= e!841202 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505015 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653869 vacantAfter!10 (select (store (arr!48442 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100381 (store (arr!48442 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48992 a!2850)) mask!2661) lt!653868)))

(declare-datatypes ((Unit!50286 0))(
  ( (Unit!50287) )
))
(declare-fun lt!653867 () Unit!50286)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50286)

(assert (=> b!1505015 (= lt!653867 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653869 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505016 () Bool)

(declare-fun res!1025602 () Bool)

(assert (=> b!1505016 (=> (not res!1025602) (not e!841204))))

(declare-datatypes ((List!34934 0))(
  ( (Nil!34931) (Cons!34930 (h!36327 (_ BitVec 64)) (t!49628 List!34934)) )
))
(declare-fun arrayNoDuplicates!0 (array!100380 (_ BitVec 32) List!34934) Bool)

(assert (=> b!1505016 (= res!1025602 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34931))))

(declare-fun b!1505017 () Bool)

(declare-fun res!1025603 () Bool)

(assert (=> b!1505017 (=> (not res!1025603) (not e!841204))))

(assert (=> b!1505017 (= res!1025603 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48992 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48992 a!2850)) (= (select (arr!48442 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48442 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48992 a!2850))))))

(declare-fun b!1505018 () Bool)

(declare-fun res!1025601 () Bool)

(assert (=> b!1505018 (=> (not res!1025601) (not e!841204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100380 (_ BitVec 32)) Bool)

(assert (=> b!1505018 (= res!1025601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128182 res!1025605) b!1505008))

(assert (= (and b!1505008 res!1025600) b!1505010))

(assert (= (and b!1505010 res!1025599) b!1505011))

(assert (= (and b!1505011 res!1025606) b!1505018))

(assert (= (and b!1505018 res!1025601) b!1505016))

(assert (= (and b!1505016 res!1025602) b!1505017))

(assert (= (and b!1505017 res!1025603) b!1505014))

(assert (= (and b!1505014 res!1025608) b!1505013))

(assert (= (and b!1505013 res!1025598) b!1505012))

(assert (= (and b!1505012 res!1025604) b!1505009))

(assert (= (and b!1505009 res!1025607) b!1505015))

(declare-fun m!1388113 () Bool)

(assert (=> b!1505010 m!1388113))

(assert (=> b!1505010 m!1388113))

(declare-fun m!1388115 () Bool)

(assert (=> b!1505010 m!1388115))

(declare-fun m!1388117 () Bool)

(assert (=> b!1505012 m!1388117))

(declare-fun m!1388119 () Bool)

(assert (=> b!1505011 m!1388119))

(assert (=> b!1505011 m!1388119))

(declare-fun m!1388121 () Bool)

(assert (=> b!1505011 m!1388121))

(declare-fun m!1388123 () Bool)

(assert (=> b!1505016 m!1388123))

(declare-fun m!1388125 () Bool)

(assert (=> start!128182 m!1388125))

(declare-fun m!1388127 () Bool)

(assert (=> start!128182 m!1388127))

(declare-fun m!1388129 () Bool)

(assert (=> b!1505013 m!1388129))

(assert (=> b!1505013 m!1388119))

(declare-fun m!1388131 () Bool)

(assert (=> b!1505017 m!1388131))

(declare-fun m!1388133 () Bool)

(assert (=> b!1505017 m!1388133))

(declare-fun m!1388135 () Bool)

(assert (=> b!1505017 m!1388135))

(assert (=> b!1505014 m!1388119))

(assert (=> b!1505014 m!1388119))

(declare-fun m!1388137 () Bool)

(assert (=> b!1505014 m!1388137))

(declare-fun m!1388139 () Bool)

(assert (=> b!1505018 m!1388139))

(assert (=> b!1505015 m!1388133))

(declare-fun m!1388141 () Bool)

(assert (=> b!1505015 m!1388141))

(assert (=> b!1505015 m!1388141))

(declare-fun m!1388143 () Bool)

(assert (=> b!1505015 m!1388143))

(declare-fun m!1388145 () Bool)

(assert (=> b!1505015 m!1388145))

(assert (=> b!1505009 m!1388119))

(assert (=> b!1505009 m!1388119))

(declare-fun m!1388147 () Bool)

(assert (=> b!1505009 m!1388147))

(push 1)

(assert (not b!1505018))

(assert (not b!1505009))

(assert (not start!128182))

(assert (not b!1505016))

(assert (not b!1505011))

