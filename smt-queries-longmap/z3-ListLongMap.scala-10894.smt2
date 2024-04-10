; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127628 () Bool)

(assert start!127628)

(declare-fun res!1020459 () Bool)

(declare-fun e!839276 () Bool)

(assert (=> start!127628 (=> (not res!1020459) (not e!839276))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127628 (= res!1020459 (validMask!0 mask!2661))))

(assert (=> start!127628 e!839276))

(assert (=> start!127628 true))

(declare-datatypes ((array!100009 0))(
  ( (array!100010 (arr!48264 (Array (_ BitVec 32) (_ BitVec 64))) (size!48814 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100009)

(declare-fun array_inv!37292 (array!100009) Bool)

(assert (=> start!127628 (array_inv!37292 a!2850)))

(declare-fun b!1499381 () Bool)

(declare-fun res!1020466 () Bool)

(assert (=> b!1499381 (=> (not res!1020466) (not e!839276))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12474 0))(
  ( (MissingZero!12474 (index!52288 (_ BitVec 32))) (Found!12474 (index!52289 (_ BitVec 32))) (Intermediate!12474 (undefined!13286 Bool) (index!52290 (_ BitVec 32)) (x!133972 (_ BitVec 32))) (Undefined!12474) (MissingVacant!12474 (index!52291 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100009 (_ BitVec 32)) SeekEntryResult!12474)

(assert (=> b!1499381 (= res!1020466 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48264 a!2850) j!87) a!2850 mask!2661) (Found!12474 j!87)))))

(declare-fun b!1499382 () Bool)

(declare-fun e!839278 () Bool)

(assert (=> b!1499382 (= e!839278 false)))

(declare-fun lt!652726 () SeekEntryResult!12474)

(declare-fun lt!652725 () (_ BitVec 32))

(assert (=> b!1499382 (= lt!652726 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652725 vacantBefore!10 (select (arr!48264 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499383 () Bool)

(declare-fun res!1020465 () Bool)

(assert (=> b!1499383 (=> (not res!1020465) (not e!839276))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499383 (= res!1020465 (and (= (size!48814 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48814 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48814 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499384 () Bool)

(declare-fun res!1020464 () Bool)

(assert (=> b!1499384 (=> (not res!1020464) (not e!839276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499384 (= res!1020464 (validKeyInArray!0 (select (arr!48264 a!2850) i!996)))))

(declare-fun b!1499385 () Bool)

(declare-fun res!1020463 () Bool)

(assert (=> b!1499385 (=> (not res!1020463) (not e!839276))))

(declare-datatypes ((List!34756 0))(
  ( (Nil!34753) (Cons!34752 (h!36149 (_ BitVec 64)) (t!49450 List!34756)) )
))
(declare-fun arrayNoDuplicates!0 (array!100009 (_ BitVec 32) List!34756) Bool)

(assert (=> b!1499385 (= res!1020463 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34753))))

(declare-fun b!1499386 () Bool)

(declare-fun res!1020461 () Bool)

(assert (=> b!1499386 (=> (not res!1020461) (not e!839276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100009 (_ BitVec 32)) Bool)

(assert (=> b!1499386 (= res!1020461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499387 () Bool)

(assert (=> b!1499387 (= e!839276 e!839278)))

(declare-fun res!1020460 () Bool)

(assert (=> b!1499387 (=> (not res!1020460) (not e!839278))))

(assert (=> b!1499387 (= res!1020460 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652725 #b00000000000000000000000000000000) (bvslt lt!652725 (size!48814 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499387 (= lt!652725 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499388 () Bool)

(declare-fun res!1020462 () Bool)

(assert (=> b!1499388 (=> (not res!1020462) (not e!839276))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499388 (= res!1020462 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48814 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48814 a!2850)) (= (select (arr!48264 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48264 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48814 a!2850))))))

(declare-fun b!1499389 () Bool)

(declare-fun res!1020457 () Bool)

(assert (=> b!1499389 (=> (not res!1020457) (not e!839276))))

(assert (=> b!1499389 (= res!1020457 (validKeyInArray!0 (select (arr!48264 a!2850) j!87)))))

(declare-fun b!1499390 () Bool)

(declare-fun res!1020458 () Bool)

(assert (=> b!1499390 (=> (not res!1020458) (not e!839276))))

(assert (=> b!1499390 (= res!1020458 (not (= (select (arr!48264 a!2850) index!625) (select (arr!48264 a!2850) j!87))))))

(assert (= (and start!127628 res!1020459) b!1499383))

(assert (= (and b!1499383 res!1020465) b!1499384))

(assert (= (and b!1499384 res!1020464) b!1499389))

(assert (= (and b!1499389 res!1020457) b!1499386))

(assert (= (and b!1499386 res!1020461) b!1499385))

(assert (= (and b!1499385 res!1020463) b!1499388))

(assert (= (and b!1499388 res!1020462) b!1499381))

(assert (= (and b!1499381 res!1020466) b!1499390))

(assert (= (and b!1499390 res!1020458) b!1499387))

(assert (= (and b!1499387 res!1020460) b!1499382))

(declare-fun m!1382575 () Bool)

(assert (=> b!1499382 m!1382575))

(assert (=> b!1499382 m!1382575))

(declare-fun m!1382577 () Bool)

(assert (=> b!1499382 m!1382577))

(assert (=> b!1499381 m!1382575))

(assert (=> b!1499381 m!1382575))

(declare-fun m!1382579 () Bool)

(assert (=> b!1499381 m!1382579))

(declare-fun m!1382581 () Bool)

(assert (=> b!1499387 m!1382581))

(declare-fun m!1382583 () Bool)

(assert (=> start!127628 m!1382583))

(declare-fun m!1382585 () Bool)

(assert (=> start!127628 m!1382585))

(declare-fun m!1382587 () Bool)

(assert (=> b!1499388 m!1382587))

(declare-fun m!1382589 () Bool)

(assert (=> b!1499388 m!1382589))

(declare-fun m!1382591 () Bool)

(assert (=> b!1499388 m!1382591))

(declare-fun m!1382593 () Bool)

(assert (=> b!1499385 m!1382593))

(declare-fun m!1382595 () Bool)

(assert (=> b!1499384 m!1382595))

(assert (=> b!1499384 m!1382595))

(declare-fun m!1382597 () Bool)

(assert (=> b!1499384 m!1382597))

(assert (=> b!1499389 m!1382575))

(assert (=> b!1499389 m!1382575))

(declare-fun m!1382599 () Bool)

(assert (=> b!1499389 m!1382599))

(declare-fun m!1382601 () Bool)

(assert (=> b!1499386 m!1382601))

(declare-fun m!1382603 () Bool)

(assert (=> b!1499390 m!1382603))

(assert (=> b!1499390 m!1382575))

(check-sat (not b!1499384) (not b!1499389) (not b!1499382) (not b!1499381) (not b!1499387) (not b!1499386) (not b!1499385) (not start!127628))
(check-sat)
