; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128066 () Bool)

(assert start!128066)

(declare-fun b!1504227 () Bool)

(declare-fun res!1025023 () Bool)

(declare-fun e!840846 () Bool)

(assert (=> b!1504227 (=> (not res!1025023) (not e!840846))))

(declare-datatypes ((array!100342 0))(
  ( (array!100343 (arr!48426 (Array (_ BitVec 32) (_ BitVec 64))) (size!48976 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100342)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504227 (= res!1025023 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48976 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48976 a!2850)) (= (select (arr!48426 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48426 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48976 a!2850))))))

(declare-fun b!1504228 () Bool)

(declare-fun res!1025015 () Bool)

(assert (=> b!1504228 (=> (not res!1025015) (not e!840846))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100342 (_ BitVec 32)) Bool)

(assert (=> b!1504228 (= res!1025015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504229 () Bool)

(declare-fun res!1025021 () Bool)

(assert (=> b!1504229 (=> (not res!1025021) (not e!840846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504229 (= res!1025021 (validKeyInArray!0 (select (arr!48426 a!2850) i!996)))))

(declare-fun b!1504230 () Bool)

(declare-fun res!1025016 () Bool)

(assert (=> b!1504230 (=> (not res!1025016) (not e!840846))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12624 0))(
  ( (MissingZero!12624 (index!52888 (_ BitVec 32))) (Found!12624 (index!52889 (_ BitVec 32))) (Intermediate!12624 (undefined!13436 Bool) (index!52890 (_ BitVec 32)) (x!134566 (_ BitVec 32))) (Undefined!12624) (MissingVacant!12624 (index!52891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100342 (_ BitVec 32)) SeekEntryResult!12624)

(assert (=> b!1504230 (= res!1025016 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48426 a!2850) j!87) a!2850 mask!2661) (Found!12624 j!87)))))

(declare-fun res!1025017 () Bool)

(assert (=> start!128066 (=> (not res!1025017) (not e!840846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128066 (= res!1025017 (validMask!0 mask!2661))))

(assert (=> start!128066 e!840846))

(assert (=> start!128066 true))

(declare-fun array_inv!37454 (array!100342) Bool)

(assert (=> start!128066 (array_inv!37454 a!2850)))

(declare-fun b!1504231 () Bool)

(declare-fun res!1025022 () Bool)

(assert (=> b!1504231 (=> (not res!1025022) (not e!840846))))

(assert (=> b!1504231 (= res!1025022 (validKeyInArray!0 (select (arr!48426 a!2850) j!87)))))

(declare-fun b!1504232 () Bool)

(declare-fun res!1025019 () Bool)

(assert (=> b!1504232 (=> (not res!1025019) (not e!840846))))

(assert (=> b!1504232 (= res!1025019 (not (= (select (arr!48426 a!2850) index!625) (select (arr!48426 a!2850) j!87))))))

(declare-fun b!1504233 () Bool)

(declare-fun res!1025018 () Bool)

(assert (=> b!1504233 (=> (not res!1025018) (not e!840846))))

(assert (=> b!1504233 (= res!1025018 (and (= (size!48976 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48976 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48976 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504234 () Bool)

(declare-fun res!1025020 () Bool)

(assert (=> b!1504234 (=> (not res!1025020) (not e!840846))))

(declare-datatypes ((List!34918 0))(
  ( (Nil!34915) (Cons!34914 (h!36311 (_ BitVec 64)) (t!49612 List!34918)) )
))
(declare-fun arrayNoDuplicates!0 (array!100342 (_ BitVec 32) List!34918) Bool)

(assert (=> b!1504234 (= res!1025020 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34915))))

(declare-fun b!1504235 () Bool)

(assert (=> b!1504235 (= e!840846 false)))

(declare-fun lt!653653 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504235 (= lt!653653 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128066 res!1025017) b!1504233))

(assert (= (and b!1504233 res!1025018) b!1504229))

(assert (= (and b!1504229 res!1025021) b!1504231))

(assert (= (and b!1504231 res!1025022) b!1504228))

(assert (= (and b!1504228 res!1025015) b!1504234))

(assert (= (and b!1504234 res!1025020) b!1504227))

(assert (= (and b!1504227 res!1025023) b!1504230))

(assert (= (and b!1504230 res!1025016) b!1504232))

(assert (= (and b!1504232 res!1025019) b!1504235))

(declare-fun m!1387439 () Bool)

(assert (=> b!1504234 m!1387439))

(declare-fun m!1387441 () Bool)

(assert (=> b!1504231 m!1387441))

(assert (=> b!1504231 m!1387441))

(declare-fun m!1387443 () Bool)

(assert (=> b!1504231 m!1387443))

(declare-fun m!1387445 () Bool)

(assert (=> start!128066 m!1387445))

(declare-fun m!1387447 () Bool)

(assert (=> start!128066 m!1387447))

(declare-fun m!1387449 () Bool)

(assert (=> b!1504235 m!1387449))

(declare-fun m!1387451 () Bool)

(assert (=> b!1504228 m!1387451))

(declare-fun m!1387453 () Bool)

(assert (=> b!1504229 m!1387453))

(assert (=> b!1504229 m!1387453))

(declare-fun m!1387455 () Bool)

(assert (=> b!1504229 m!1387455))

(declare-fun m!1387457 () Bool)

(assert (=> b!1504232 m!1387457))

(assert (=> b!1504232 m!1387441))

(declare-fun m!1387459 () Bool)

(assert (=> b!1504227 m!1387459))

(declare-fun m!1387461 () Bool)

(assert (=> b!1504227 m!1387461))

(declare-fun m!1387463 () Bool)

(assert (=> b!1504227 m!1387463))

(assert (=> b!1504230 m!1387441))

(assert (=> b!1504230 m!1387441))

(declare-fun m!1387465 () Bool)

(assert (=> b!1504230 m!1387465))

(check-sat (not b!1504228) (not b!1504234) (not b!1504231) (not b!1504229) (not start!128066) (not b!1504235) (not b!1504230))
