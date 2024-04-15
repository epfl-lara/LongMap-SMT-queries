; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127652 () Bool)

(assert start!127652)

(declare-fun b!1500115 () Bool)

(declare-fun res!1021380 () Bool)

(declare-fun e!839394 () Bool)

(assert (=> b!1500115 (=> (not res!1021380) (not e!839394))))

(declare-datatypes ((array!100027 0))(
  ( (array!100028 (arr!48274 (Array (_ BitVec 32) (_ BitVec 64))) (size!48826 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100027)

(declare-datatypes ((List!34844 0))(
  ( (Nil!34841) (Cons!34840 (h!36238 (_ BitVec 64)) (t!49530 List!34844)) )
))
(declare-fun arrayNoDuplicates!0 (array!100027 (_ BitVec 32) List!34844) Bool)

(assert (=> b!1500115 (= res!1021380 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34841))))

(declare-fun b!1500116 () Bool)

(declare-fun res!1021388 () Bool)

(assert (=> b!1500116 (=> (not res!1021388) (not e!839394))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500116 (= res!1021388 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48826 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48826 a!2850)) (= (select (arr!48274 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48274 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48826 a!2850))))))

(declare-fun b!1500117 () Bool)

(declare-fun e!839392 () Bool)

(assert (=> b!1500117 (= e!839392 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!652657 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12505 0))(
  ( (MissingZero!12505 (index!52412 (_ BitVec 32))) (Found!12505 (index!52413 (_ BitVec 32))) (Intermediate!12505 (undefined!13317 Bool) (index!52414 (_ BitVec 32)) (x!134094 (_ BitVec 32))) (Undefined!12505) (MissingVacant!12505 (index!52415 (_ BitVec 32))) )
))
(declare-fun lt!652656 () SeekEntryResult!12505)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100027 (_ BitVec 32)) SeekEntryResult!12505)

(assert (=> b!1500117 (= lt!652656 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652657 vacantBefore!10 (select (arr!48274 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021385 () Bool)

(assert (=> start!127652 (=> (not res!1021385) (not e!839394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127652 (= res!1021385 (validMask!0 mask!2661))))

(assert (=> start!127652 e!839394))

(assert (=> start!127652 true))

(declare-fun array_inv!37507 (array!100027) Bool)

(assert (=> start!127652 (array_inv!37507 a!2850)))

(declare-fun b!1500118 () Bool)

(assert (=> b!1500118 (= e!839394 e!839392)))

(declare-fun res!1021381 () Bool)

(assert (=> b!1500118 (=> (not res!1021381) (not e!839392))))

(assert (=> b!1500118 (= res!1021381 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652657 #b00000000000000000000000000000000) (bvslt lt!652657 (size!48826 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500118 (= lt!652657 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500119 () Bool)

(declare-fun res!1021382 () Bool)

(assert (=> b!1500119 (=> (not res!1021382) (not e!839394))))

(assert (=> b!1500119 (= res!1021382 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48274 a!2850) j!87) a!2850 mask!2661) (Found!12505 j!87)))))

(declare-fun b!1500120 () Bool)

(declare-fun res!1021379 () Bool)

(assert (=> b!1500120 (=> (not res!1021379) (not e!839394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500120 (= res!1021379 (validKeyInArray!0 (select (arr!48274 a!2850) j!87)))))

(declare-fun b!1500121 () Bool)

(declare-fun res!1021386 () Bool)

(assert (=> b!1500121 (=> (not res!1021386) (not e!839394))))

(assert (=> b!1500121 (= res!1021386 (validKeyInArray!0 (select (arr!48274 a!2850) i!996)))))

(declare-fun b!1500122 () Bool)

(declare-fun res!1021384 () Bool)

(assert (=> b!1500122 (=> (not res!1021384) (not e!839394))))

(assert (=> b!1500122 (= res!1021384 (not (= (select (arr!48274 a!2850) index!625) (select (arr!48274 a!2850) j!87))))))

(declare-fun b!1500123 () Bool)

(declare-fun res!1021383 () Bool)

(assert (=> b!1500123 (=> (not res!1021383) (not e!839394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100027 (_ BitVec 32)) Bool)

(assert (=> b!1500123 (= res!1021383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500124 () Bool)

(declare-fun res!1021387 () Bool)

(assert (=> b!1500124 (=> (not res!1021387) (not e!839394))))

(assert (=> b!1500124 (= res!1021387 (and (= (size!48826 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48826 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48826 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127652 res!1021385) b!1500124))

(assert (= (and b!1500124 res!1021387) b!1500121))

(assert (= (and b!1500121 res!1021386) b!1500120))

(assert (= (and b!1500120 res!1021379) b!1500123))

(assert (= (and b!1500123 res!1021383) b!1500115))

(assert (= (and b!1500115 res!1021380) b!1500116))

(assert (= (and b!1500116 res!1021388) b!1500119))

(assert (= (and b!1500119 res!1021382) b!1500122))

(assert (= (and b!1500122 res!1021384) b!1500118))

(assert (= (and b!1500118 res!1021381) b!1500117))

(declare-fun m!1382755 () Bool)

(assert (=> b!1500121 m!1382755))

(assert (=> b!1500121 m!1382755))

(declare-fun m!1382757 () Bool)

(assert (=> b!1500121 m!1382757))

(declare-fun m!1382759 () Bool)

(assert (=> b!1500119 m!1382759))

(assert (=> b!1500119 m!1382759))

(declare-fun m!1382761 () Bool)

(assert (=> b!1500119 m!1382761))

(declare-fun m!1382763 () Bool)

(assert (=> b!1500123 m!1382763))

(assert (=> b!1500117 m!1382759))

(assert (=> b!1500117 m!1382759))

(declare-fun m!1382765 () Bool)

(assert (=> b!1500117 m!1382765))

(assert (=> b!1500120 m!1382759))

(assert (=> b!1500120 m!1382759))

(declare-fun m!1382767 () Bool)

(assert (=> b!1500120 m!1382767))

(declare-fun m!1382769 () Bool)

(assert (=> b!1500116 m!1382769))

(declare-fun m!1382771 () Bool)

(assert (=> b!1500116 m!1382771))

(declare-fun m!1382773 () Bool)

(assert (=> b!1500116 m!1382773))

(declare-fun m!1382775 () Bool)

(assert (=> b!1500122 m!1382775))

(assert (=> b!1500122 m!1382759))

(declare-fun m!1382777 () Bool)

(assert (=> b!1500118 m!1382777))

(declare-fun m!1382779 () Bool)

(assert (=> b!1500115 m!1382779))

(declare-fun m!1382781 () Bool)

(assert (=> start!127652 m!1382781))

(declare-fun m!1382783 () Bool)

(assert (=> start!127652 m!1382783))

(check-sat (not b!1500119) (not b!1500121) (not b!1500120) (not start!127652) (not b!1500123) (not b!1500115) (not b!1500117) (not b!1500118))
(check-sat)
