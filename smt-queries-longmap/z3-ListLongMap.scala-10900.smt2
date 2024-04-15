; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127616 () Bool)

(assert start!127616)

(declare-fun b!1499575 () Bool)

(declare-fun res!1020847 () Bool)

(declare-fun e!839232 () Bool)

(assert (=> b!1499575 (=> (not res!1020847) (not e!839232))))

(declare-datatypes ((array!99991 0))(
  ( (array!99992 (arr!48256 (Array (_ BitVec 32) (_ BitVec 64))) (size!48808 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99991)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499575 (= res!1020847 (validKeyInArray!0 (select (arr!48256 a!2850) i!996)))))

(declare-fun b!1499576 () Bool)

(declare-fun res!1020846 () Bool)

(assert (=> b!1499576 (=> (not res!1020846) (not e!839232))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499576 (= res!1020846 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48808 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48808 a!2850)) (= (select (arr!48256 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48256 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48808 a!2850))))))

(declare-fun res!1020841 () Bool)

(assert (=> start!127616 (=> (not res!1020841) (not e!839232))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127616 (= res!1020841 (validMask!0 mask!2661))))

(assert (=> start!127616 e!839232))

(assert (=> start!127616 true))

(declare-fun array_inv!37489 (array!99991) Bool)

(assert (=> start!127616 (array_inv!37489 a!2850)))

(declare-fun b!1499577 () Bool)

(declare-fun e!839230 () Bool)

(assert (=> b!1499577 (= e!839230 false)))

(declare-fun lt!652548 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12487 0))(
  ( (MissingZero!12487 (index!52340 (_ BitVec 32))) (Found!12487 (index!52341 (_ BitVec 32))) (Intermediate!12487 (undefined!13299 Bool) (index!52342 (_ BitVec 32)) (x!134028 (_ BitVec 32))) (Undefined!12487) (MissingVacant!12487 (index!52343 (_ BitVec 32))) )
))
(declare-fun lt!652549 () SeekEntryResult!12487)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99991 (_ BitVec 32)) SeekEntryResult!12487)

(assert (=> b!1499577 (= lt!652549 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652548 vacantBefore!10 (select (arr!48256 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499578 () Bool)

(declare-fun res!1020843 () Bool)

(assert (=> b!1499578 (=> (not res!1020843) (not e!839232))))

(assert (=> b!1499578 (= res!1020843 (and (= (size!48808 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48808 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48808 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499579 () Bool)

(declare-fun res!1020840 () Bool)

(assert (=> b!1499579 (=> (not res!1020840) (not e!839232))))

(assert (=> b!1499579 (= res!1020840 (not (= (select (arr!48256 a!2850) index!625) (select (arr!48256 a!2850) j!87))))))

(declare-fun b!1499580 () Bool)

(declare-fun res!1020845 () Bool)

(assert (=> b!1499580 (=> (not res!1020845) (not e!839232))))

(assert (=> b!1499580 (= res!1020845 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48256 a!2850) j!87) a!2850 mask!2661) (Found!12487 j!87)))))

(declare-fun b!1499581 () Bool)

(declare-fun res!1020842 () Bool)

(assert (=> b!1499581 (=> (not res!1020842) (not e!839232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99991 (_ BitVec 32)) Bool)

(assert (=> b!1499581 (= res!1020842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499582 () Bool)

(assert (=> b!1499582 (= e!839232 e!839230)))

(declare-fun res!1020839 () Bool)

(assert (=> b!1499582 (=> (not res!1020839) (not e!839230))))

(assert (=> b!1499582 (= res!1020839 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652548 #b00000000000000000000000000000000) (bvslt lt!652548 (size!48808 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499582 (= lt!652548 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499583 () Bool)

(declare-fun res!1020848 () Bool)

(assert (=> b!1499583 (=> (not res!1020848) (not e!839232))))

(declare-datatypes ((List!34826 0))(
  ( (Nil!34823) (Cons!34822 (h!36220 (_ BitVec 64)) (t!49512 List!34826)) )
))
(declare-fun arrayNoDuplicates!0 (array!99991 (_ BitVec 32) List!34826) Bool)

(assert (=> b!1499583 (= res!1020848 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34823))))

(declare-fun b!1499584 () Bool)

(declare-fun res!1020844 () Bool)

(assert (=> b!1499584 (=> (not res!1020844) (not e!839232))))

(assert (=> b!1499584 (= res!1020844 (validKeyInArray!0 (select (arr!48256 a!2850) j!87)))))

(assert (= (and start!127616 res!1020841) b!1499578))

(assert (= (and b!1499578 res!1020843) b!1499575))

(assert (= (and b!1499575 res!1020847) b!1499584))

(assert (= (and b!1499584 res!1020844) b!1499581))

(assert (= (and b!1499581 res!1020842) b!1499583))

(assert (= (and b!1499583 res!1020848) b!1499576))

(assert (= (and b!1499576 res!1020846) b!1499580))

(assert (= (and b!1499580 res!1020845) b!1499579))

(assert (= (and b!1499579 res!1020840) b!1499582))

(assert (= (and b!1499582 res!1020839) b!1499577))

(declare-fun m!1382215 () Bool)

(assert (=> b!1499582 m!1382215))

(declare-fun m!1382217 () Bool)

(assert (=> b!1499575 m!1382217))

(assert (=> b!1499575 m!1382217))

(declare-fun m!1382219 () Bool)

(assert (=> b!1499575 m!1382219))

(declare-fun m!1382221 () Bool)

(assert (=> b!1499581 m!1382221))

(declare-fun m!1382223 () Bool)

(assert (=> b!1499583 m!1382223))

(declare-fun m!1382225 () Bool)

(assert (=> b!1499576 m!1382225))

(declare-fun m!1382227 () Bool)

(assert (=> b!1499576 m!1382227))

(declare-fun m!1382229 () Bool)

(assert (=> b!1499576 m!1382229))

(declare-fun m!1382231 () Bool)

(assert (=> start!127616 m!1382231))

(declare-fun m!1382233 () Bool)

(assert (=> start!127616 m!1382233))

(declare-fun m!1382235 () Bool)

(assert (=> b!1499577 m!1382235))

(assert (=> b!1499577 m!1382235))

(declare-fun m!1382237 () Bool)

(assert (=> b!1499577 m!1382237))

(assert (=> b!1499584 m!1382235))

(assert (=> b!1499584 m!1382235))

(declare-fun m!1382239 () Bool)

(assert (=> b!1499584 m!1382239))

(assert (=> b!1499580 m!1382235))

(assert (=> b!1499580 m!1382235))

(declare-fun m!1382241 () Bool)

(assert (=> b!1499580 m!1382241))

(declare-fun m!1382243 () Bool)

(assert (=> b!1499579 m!1382243))

(assert (=> b!1499579 m!1382235))

(check-sat (not b!1499577) (not b!1499575) (not b!1499584) (not start!127616) (not b!1499583) (not b!1499582) (not b!1499580) (not b!1499581))
(check-sat)
