; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127508 () Bool)

(assert start!127508)

(declare-fun b!1498111 () Bool)

(declare-fun res!1019191 () Bool)

(declare-fun e!838903 () Bool)

(assert (=> b!1498111 (=> (not res!1019191) (not e!838903))))

(declare-datatypes ((array!99889 0))(
  ( (array!99890 (arr!48204 (Array (_ BitVec 32) (_ BitVec 64))) (size!48754 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99889)

(declare-datatypes ((List!34696 0))(
  ( (Nil!34693) (Cons!34692 (h!36089 (_ BitVec 64)) (t!49390 List!34696)) )
))
(declare-fun arrayNoDuplicates!0 (array!99889 (_ BitVec 32) List!34696) Bool)

(assert (=> b!1498111 (= res!1019191 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34693))))

(declare-fun b!1498112 () Bool)

(declare-fun res!1019189 () Bool)

(assert (=> b!1498112 (=> (not res!1019189) (not e!838903))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498112 (= res!1019189 (validKeyInArray!0 (select (arr!48204 a!2850) j!87)))))

(declare-fun b!1498113 () Bool)

(declare-fun res!1019186 () Bool)

(assert (=> b!1498113 (=> (not res!1019186) (not e!838903))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498113 (= res!1019186 (validKeyInArray!0 (select (arr!48204 a!2850) i!996)))))

(declare-fun res!1019187 () Bool)

(assert (=> start!127508 (=> (not res!1019187) (not e!838903))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127508 (= res!1019187 (validMask!0 mask!2661))))

(assert (=> start!127508 e!838903))

(assert (=> start!127508 true))

(declare-fun array_inv!37232 (array!99889) Bool)

(assert (=> start!127508 (array_inv!37232 a!2850)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun b!1498110 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1498110 (= e!838903 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48754 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48754 a!2850)) (= (select (arr!48204 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48204 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48754 a!2850)) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1498114 () Bool)

(declare-fun res!1019188 () Bool)

(assert (=> b!1498114 (=> (not res!1019188) (not e!838903))))

(assert (=> b!1498114 (= res!1019188 (and (= (size!48754 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48754 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48754 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498115 () Bool)

(declare-fun res!1019190 () Bool)

(assert (=> b!1498115 (=> (not res!1019190) (not e!838903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99889 (_ BitVec 32)) Bool)

(assert (=> b!1498115 (= res!1019190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127508 res!1019187) b!1498114))

(assert (= (and b!1498114 res!1019188) b!1498113))

(assert (= (and b!1498113 res!1019186) b!1498112))

(assert (= (and b!1498112 res!1019189) b!1498115))

(assert (= (and b!1498115 res!1019190) b!1498111))

(assert (= (and b!1498111 res!1019191) b!1498110))

(declare-fun m!1381175 () Bool)

(assert (=> start!127508 m!1381175))

(declare-fun m!1381177 () Bool)

(assert (=> start!127508 m!1381177))

(declare-fun m!1381179 () Bool)

(assert (=> b!1498110 m!1381179))

(declare-fun m!1381181 () Bool)

(assert (=> b!1498110 m!1381181))

(declare-fun m!1381183 () Bool)

(assert (=> b!1498110 m!1381183))

(declare-fun m!1381185 () Bool)

(assert (=> b!1498111 m!1381185))

(declare-fun m!1381187 () Bool)

(assert (=> b!1498115 m!1381187))

(declare-fun m!1381189 () Bool)

(assert (=> b!1498112 m!1381189))

(assert (=> b!1498112 m!1381189))

(declare-fun m!1381191 () Bool)

(assert (=> b!1498112 m!1381191))

(declare-fun m!1381193 () Bool)

(assert (=> b!1498113 m!1381193))

(assert (=> b!1498113 m!1381193))

(declare-fun m!1381195 () Bool)

(assert (=> b!1498113 m!1381195))

(check-sat (not b!1498111) (not b!1498115) (not start!127508) (not b!1498112) (not b!1498113))
(check-sat)
