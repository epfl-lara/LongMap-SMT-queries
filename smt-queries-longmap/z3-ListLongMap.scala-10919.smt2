; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127730 () Bool)

(assert start!127730)

(declare-fun b!1501352 () Bool)

(declare-fun res!1022627 () Bool)

(declare-fun e!839812 () Bool)

(assert (=> b!1501352 (=> (not res!1022627) (not e!839812))))

(declare-datatypes ((array!100105 0))(
  ( (array!100106 (arr!48313 (Array (_ BitVec 32) (_ BitVec 64))) (size!48865 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100105)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501352 (= res!1022627 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48865 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48865 a!2850)) (= (select (arr!48313 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48865 a!2850))))))

(declare-fun b!1501353 () Bool)

(declare-fun e!839811 () Bool)

(assert (=> b!1501353 (= e!839812 e!839811)))

(declare-fun res!1022619 () Bool)

(assert (=> b!1501353 (=> (not res!1022619) (not e!839811))))

(declare-datatypes ((SeekEntryResult!12544 0))(
  ( (MissingZero!12544 (index!52568 (_ BitVec 32))) (Found!12544 (index!52569 (_ BitVec 32))) (Intermediate!12544 (undefined!13356 Bool) (index!52570 (_ BitVec 32)) (x!134237 (_ BitVec 32))) (Undefined!12544) (MissingVacant!12544 (index!52571 (_ BitVec 32))) )
))
(declare-fun lt!652955 () SeekEntryResult!12544)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100105 (_ BitVec 32)) SeekEntryResult!12544)

(assert (=> b!1501353 (= res!1022619 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661) lt!652955))))

(assert (=> b!1501353 (= lt!652955 (Found!12544 j!87))))

(declare-fun b!1501354 () Bool)

(declare-fun res!1022623 () Bool)

(assert (=> b!1501354 (=> (not res!1022623) (not e!839812))))

(assert (=> b!1501354 (= res!1022623 (and (= (size!48865 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48865 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48865 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501355 () Bool)

(declare-fun e!839810 () Bool)

(assert (=> b!1501355 (= e!839811 e!839810)))

(declare-fun res!1022620 () Bool)

(assert (=> b!1501355 (=> (not res!1022620) (not e!839810))))

(declare-fun lt!652956 () (_ BitVec 32))

(assert (=> b!1501355 (= res!1022620 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652956 #b00000000000000000000000000000000) (bvslt lt!652956 (size!48865 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501355 (= lt!652956 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501356 () Bool)

(declare-fun res!1022625 () Bool)

(assert (=> b!1501356 (=> (not res!1022625) (not e!839812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501356 (= res!1022625 (validKeyInArray!0 (select (arr!48313 a!2850) j!87)))))

(declare-fun b!1501357 () Bool)

(declare-fun res!1022621 () Bool)

(assert (=> b!1501357 (=> (not res!1022621) (not e!839812))))

(assert (=> b!1501357 (= res!1022621 (validKeyInArray!0 (select (arr!48313 a!2850) i!996)))))

(declare-fun b!1501358 () Bool)

(declare-fun res!1022622 () Bool)

(assert (=> b!1501358 (=> (not res!1022622) (not e!839810))))

(assert (=> b!1501358 (= res!1022622 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652956 vacantBefore!10 (select (arr!48313 a!2850) j!87) a!2850 mask!2661) lt!652955))))

(declare-fun b!1501359 () Bool)

(declare-fun res!1022618 () Bool)

(assert (=> b!1501359 (=> (not res!1022618) (not e!839811))))

(assert (=> b!1501359 (= res!1022618 (not (= (select (arr!48313 a!2850) index!625) (select (arr!48313 a!2850) j!87))))))

(declare-fun b!1501360 () Bool)

(declare-fun res!1022617 () Bool)

(assert (=> b!1501360 (=> (not res!1022617) (not e!839812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100105 (_ BitVec 32)) Bool)

(assert (=> b!1501360 (= res!1022617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501362 () Bool)

(declare-fun e!839813 () Bool)

(assert (=> b!1501362 (= e!839810 (not e!839813))))

(declare-fun res!1022626 () Bool)

(assert (=> b!1501362 (=> res!1022626 e!839813)))

(assert (=> b!1501362 (= res!1022626 (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (=> b!1501362 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652956 vacantAfter!10 (select (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100106 (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48865 a!2850)) mask!2661) lt!652955)))

(declare-datatypes ((Unit!50083 0))(
  ( (Unit!50084) )
))
(declare-fun lt!652957 () Unit!50083)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50083)

(assert (=> b!1501362 (= lt!652957 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652956 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501363 () Bool)

(declare-fun res!1022616 () Bool)

(assert (=> b!1501363 (=> (not res!1022616) (not e!839812))))

(declare-datatypes ((List!34883 0))(
  ( (Nil!34880) (Cons!34879 (h!36277 (_ BitVec 64)) (t!49569 List!34883)) )
))
(declare-fun arrayNoDuplicates!0 (array!100105 (_ BitVec 32) List!34883) Bool)

(assert (=> b!1501363 (= res!1022616 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34880))))

(declare-fun b!1501361 () Bool)

(assert (=> b!1501361 (= e!839813 (validKeyInArray!0 (select (store (arr!48313 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun res!1022624 () Bool)

(assert (=> start!127730 (=> (not res!1022624) (not e!839812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127730 (= res!1022624 (validMask!0 mask!2661))))

(assert (=> start!127730 e!839812))

(assert (=> start!127730 true))

(declare-fun array_inv!37546 (array!100105) Bool)

(assert (=> start!127730 (array_inv!37546 a!2850)))

(assert (= (and start!127730 res!1022624) b!1501354))

(assert (= (and b!1501354 res!1022623) b!1501357))

(assert (= (and b!1501357 res!1022621) b!1501356))

(assert (= (and b!1501356 res!1022625) b!1501360))

(assert (= (and b!1501360 res!1022617) b!1501363))

(assert (= (and b!1501363 res!1022616) b!1501352))

(assert (= (and b!1501352 res!1022627) b!1501353))

(assert (= (and b!1501353 res!1022619) b!1501359))

(assert (= (and b!1501359 res!1022618) b!1501355))

(assert (= (and b!1501355 res!1022620) b!1501358))

(assert (= (and b!1501358 res!1022622) b!1501362))

(assert (= (and b!1501362 (not res!1022626)) b!1501361))

(declare-fun m!1384051 () Bool)

(assert (=> b!1501360 m!1384051))

(declare-fun m!1384053 () Bool)

(assert (=> b!1501359 m!1384053))

(declare-fun m!1384055 () Bool)

(assert (=> b!1501359 m!1384055))

(declare-fun m!1384057 () Bool)

(assert (=> b!1501357 m!1384057))

(assert (=> b!1501357 m!1384057))

(declare-fun m!1384059 () Bool)

(assert (=> b!1501357 m!1384059))

(declare-fun m!1384061 () Bool)

(assert (=> b!1501363 m!1384061))

(assert (=> b!1501358 m!1384055))

(assert (=> b!1501358 m!1384055))

(declare-fun m!1384063 () Bool)

(assert (=> b!1501358 m!1384063))

(declare-fun m!1384065 () Bool)

(assert (=> b!1501355 m!1384065))

(declare-fun m!1384067 () Bool)

(assert (=> b!1501361 m!1384067))

(declare-fun m!1384069 () Bool)

(assert (=> b!1501361 m!1384069))

(assert (=> b!1501361 m!1384069))

(declare-fun m!1384071 () Bool)

(assert (=> b!1501361 m!1384071))

(assert (=> b!1501353 m!1384055))

(assert (=> b!1501353 m!1384055))

(declare-fun m!1384073 () Bool)

(assert (=> b!1501353 m!1384073))

(assert (=> b!1501362 m!1384067))

(assert (=> b!1501362 m!1384069))

(assert (=> b!1501362 m!1384069))

(declare-fun m!1384075 () Bool)

(assert (=> b!1501362 m!1384075))

(declare-fun m!1384077 () Bool)

(assert (=> b!1501362 m!1384077))

(declare-fun m!1384079 () Bool)

(assert (=> start!127730 m!1384079))

(declare-fun m!1384081 () Bool)

(assert (=> start!127730 m!1384081))

(assert (=> b!1501356 m!1384055))

(assert (=> b!1501356 m!1384055))

(declare-fun m!1384083 () Bool)

(assert (=> b!1501356 m!1384083))

(declare-fun m!1384085 () Bool)

(assert (=> b!1501352 m!1384085))

(assert (=> b!1501352 m!1384067))

(declare-fun m!1384087 () Bool)

(assert (=> b!1501352 m!1384087))

(check-sat (not b!1501362) (not b!1501360) (not b!1501355) (not b!1501356) (not b!1501363) (not b!1501353) (not start!127730) (not b!1501358) (not b!1501361) (not b!1501357))
(check-sat)
