; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127586 () Bool)

(assert start!127586)

(declare-fun b!1499125 () Bool)

(declare-fun res!1020391 () Bool)

(declare-fun e!839095 () Bool)

(assert (=> b!1499125 (=> (not res!1020391) (not e!839095))))

(declare-datatypes ((array!99961 0))(
  ( (array!99962 (arr!48241 (Array (_ BitVec 32) (_ BitVec 64))) (size!48793 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99961)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499125 (= res!1020391 (validKeyInArray!0 (select (arr!48241 a!2850) j!87)))))

(declare-fun b!1499127 () Bool)

(declare-fun res!1020392 () Bool)

(assert (=> b!1499127 (=> (not res!1020392) (not e!839095))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1499127 (= res!1020392 (and (= (size!48793 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48793 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48793 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499128 () Bool)

(declare-fun res!1020393 () Bool)

(assert (=> b!1499128 (=> (not res!1020393) (not e!839095))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1499128 (= res!1020393 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48793 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48793 a!2850)) (= (select (arr!48241 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48241 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48793 a!2850))))))

(declare-fun b!1499129 () Bool)

(declare-fun res!1020398 () Bool)

(assert (=> b!1499129 (=> (not res!1020398) (not e!839095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99961 (_ BitVec 32)) Bool)

(assert (=> b!1499129 (= res!1020398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499130 () Bool)

(declare-fun res!1020389 () Bool)

(assert (=> b!1499130 (=> (not res!1020389) (not e!839095))))

(declare-datatypes ((SeekEntryResult!12472 0))(
  ( (MissingZero!12472 (index!52280 (_ BitVec 32))) (Found!12472 (index!52281 (_ BitVec 32))) (Intermediate!12472 (undefined!13284 Bool) (index!52282 (_ BitVec 32)) (x!133973 (_ BitVec 32))) (Undefined!12472) (MissingVacant!12472 (index!52283 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99961 (_ BitVec 32)) SeekEntryResult!12472)

(assert (=> b!1499130 (= res!1020389 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48241 a!2850) j!87) a!2850 mask!2661) (Found!12472 j!87)))))

(declare-fun b!1499131 () Bool)

(declare-fun res!1020397 () Bool)

(assert (=> b!1499131 (=> (not res!1020397) (not e!839095))))

(assert (=> b!1499131 (= res!1020397 (validKeyInArray!0 (select (arr!48241 a!2850) i!996)))))

(declare-fun b!1499132 () Bool)

(declare-fun e!839096 () Bool)

(assert (=> b!1499132 (= e!839095 e!839096)))

(declare-fun res!1020396 () Bool)

(assert (=> b!1499132 (=> (not res!1020396) (not e!839096))))

(declare-fun lt!652458 () (_ BitVec 32))

(assert (=> b!1499132 (= res!1020396 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652458 #b00000000000000000000000000000000) (bvslt lt!652458 (size!48793 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499132 (= lt!652458 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499133 () Bool)

(declare-fun res!1020390 () Bool)

(assert (=> b!1499133 (=> (not res!1020390) (not e!839095))))

(assert (=> b!1499133 (= res!1020390 (not (= (select (arr!48241 a!2850) index!625) (select (arr!48241 a!2850) j!87))))))

(declare-fun b!1499134 () Bool)

(declare-fun res!1020394 () Bool)

(assert (=> b!1499134 (=> (not res!1020394) (not e!839095))))

(declare-datatypes ((List!34811 0))(
  ( (Nil!34808) (Cons!34807 (h!36205 (_ BitVec 64)) (t!49497 List!34811)) )
))
(declare-fun arrayNoDuplicates!0 (array!99961 (_ BitVec 32) List!34811) Bool)

(assert (=> b!1499134 (= res!1020394 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34808))))

(declare-fun b!1499126 () Bool)

(assert (=> b!1499126 (= e!839096 false)))

(declare-fun lt!652459 () SeekEntryResult!12472)

(assert (=> b!1499126 (= lt!652459 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652458 vacantBefore!10 (select (arr!48241 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1020395 () Bool)

(assert (=> start!127586 (=> (not res!1020395) (not e!839095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127586 (= res!1020395 (validMask!0 mask!2661))))

(assert (=> start!127586 e!839095))

(assert (=> start!127586 true))

(declare-fun array_inv!37474 (array!99961) Bool)

(assert (=> start!127586 (array_inv!37474 a!2850)))

(assert (= (and start!127586 res!1020395) b!1499127))

(assert (= (and b!1499127 res!1020392) b!1499131))

(assert (= (and b!1499131 res!1020397) b!1499125))

(assert (= (and b!1499125 res!1020391) b!1499129))

(assert (= (and b!1499129 res!1020398) b!1499134))

(assert (= (and b!1499134 res!1020394) b!1499128))

(assert (= (and b!1499128 res!1020393) b!1499130))

(assert (= (and b!1499130 res!1020389) b!1499133))

(assert (= (and b!1499133 res!1020390) b!1499132))

(assert (= (and b!1499132 res!1020396) b!1499126))

(declare-fun m!1381765 () Bool)

(assert (=> b!1499126 m!1381765))

(assert (=> b!1499126 m!1381765))

(declare-fun m!1381767 () Bool)

(assert (=> b!1499126 m!1381767))

(declare-fun m!1381769 () Bool)

(assert (=> start!127586 m!1381769))

(declare-fun m!1381771 () Bool)

(assert (=> start!127586 m!1381771))

(declare-fun m!1381773 () Bool)

(assert (=> b!1499134 m!1381773))

(declare-fun m!1381775 () Bool)

(assert (=> b!1499128 m!1381775))

(declare-fun m!1381777 () Bool)

(assert (=> b!1499128 m!1381777))

(declare-fun m!1381779 () Bool)

(assert (=> b!1499128 m!1381779))

(declare-fun m!1381781 () Bool)

(assert (=> b!1499129 m!1381781))

(declare-fun m!1381783 () Bool)

(assert (=> b!1499132 m!1381783))

(declare-fun m!1381785 () Bool)

(assert (=> b!1499131 m!1381785))

(assert (=> b!1499131 m!1381785))

(declare-fun m!1381787 () Bool)

(assert (=> b!1499131 m!1381787))

(assert (=> b!1499130 m!1381765))

(assert (=> b!1499130 m!1381765))

(declare-fun m!1381789 () Bool)

(assert (=> b!1499130 m!1381789))

(declare-fun m!1381791 () Bool)

(assert (=> b!1499133 m!1381791))

(assert (=> b!1499133 m!1381765))

(assert (=> b!1499125 m!1381765))

(assert (=> b!1499125 m!1381765))

(declare-fun m!1381793 () Bool)

(assert (=> b!1499125 m!1381793))

(check-sat (not b!1499129) (not b!1499125) (not b!1499132) (not b!1499130) (not start!127586) (not b!1499131) (not b!1499126) (not b!1499134))
(check-sat)
