; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127798 () Bool)

(assert start!127798)

(declare-fun b!1499996 () Bool)

(declare-fun res!1019978 () Bool)

(declare-fun e!840027 () Bool)

(assert (=> b!1499996 (=> (not res!1019978) (not e!840027))))

(declare-datatypes ((array!100024 0))(
  ( (array!100025 (arr!48268 (Array (_ BitVec 32) (_ BitVec 64))) (size!48819 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100024)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499996 (= res!1019978 (validKeyInArray!0 (select (arr!48268 a!2850) j!87)))))

(declare-fun b!1499997 () Bool)

(declare-fun res!1019974 () Bool)

(assert (=> b!1499997 (=> (not res!1019974) (not e!840027))))

(declare-datatypes ((List!34747 0))(
  ( (Nil!34744) (Cons!34743 (h!36155 (_ BitVec 64)) (t!49433 List!34747)) )
))
(declare-fun arrayNoDuplicates!0 (array!100024 (_ BitVec 32) List!34747) Bool)

(assert (=> b!1499997 (= res!1019974 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34744))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1499998 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499998 (= e!840027 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48819 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48819 a!2850)) (= (select (arr!48268 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48268 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48819 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantBefore!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun res!1019973 () Bool)

(assert (=> start!127798 (=> (not res!1019973) (not e!840027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127798 (= res!1019973 (validMask!0 mask!2661))))

(assert (=> start!127798 e!840027))

(assert (=> start!127798 true))

(declare-fun array_inv!37549 (array!100024) Bool)

(assert (=> start!127798 (array_inv!37549 a!2850)))

(declare-fun b!1499999 () Bool)

(declare-fun res!1019976 () Bool)

(assert (=> b!1499999 (=> (not res!1019976) (not e!840027))))

(assert (=> b!1499999 (= res!1019976 (and (= (size!48819 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48819 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48819 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500000 () Bool)

(declare-fun res!1019977 () Bool)

(assert (=> b!1500000 (=> (not res!1019977) (not e!840027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100024 (_ BitVec 32)) Bool)

(assert (=> b!1500000 (= res!1019977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500001 () Bool)

(declare-fun res!1019975 () Bool)

(assert (=> b!1500001 (=> (not res!1019975) (not e!840027))))

(assert (=> b!1500001 (= res!1019975 (validKeyInArray!0 (select (arr!48268 a!2850) i!996)))))

(assert (= (and start!127798 res!1019973) b!1499999))

(assert (= (and b!1499999 res!1019976) b!1500001))

(assert (= (and b!1500001 res!1019975) b!1499996))

(assert (= (and b!1499996 res!1019978) b!1500000))

(assert (= (and b!1500000 res!1019977) b!1499997))

(assert (= (and b!1499997 res!1019974) b!1499998))

(declare-fun m!1383107 () Bool)

(assert (=> b!1500001 m!1383107))

(assert (=> b!1500001 m!1383107))

(declare-fun m!1383109 () Bool)

(assert (=> b!1500001 m!1383109))

(declare-fun m!1383111 () Bool)

(assert (=> b!1499997 m!1383111))

(declare-fun m!1383113 () Bool)

(assert (=> b!1499998 m!1383113))

(declare-fun m!1383115 () Bool)

(assert (=> b!1499998 m!1383115))

(declare-fun m!1383117 () Bool)

(assert (=> b!1499998 m!1383117))

(declare-fun m!1383119 () Bool)

(assert (=> b!1500000 m!1383119))

(declare-fun m!1383121 () Bool)

(assert (=> b!1499996 m!1383121))

(assert (=> b!1499996 m!1383121))

(declare-fun m!1383123 () Bool)

(assert (=> b!1499996 m!1383123))

(declare-fun m!1383125 () Bool)

(assert (=> start!127798 m!1383125))

(declare-fun m!1383127 () Bool)

(assert (=> start!127798 m!1383127))

(check-sat (not b!1499997) (not b!1499996) (not b!1500001) (not b!1500000) (not start!127798))
(check-sat)
