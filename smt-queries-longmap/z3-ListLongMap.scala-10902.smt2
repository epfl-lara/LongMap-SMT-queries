; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127628 () Bool)

(assert start!127628)

(declare-fun b!1499756 () Bool)

(declare-fun res!1021020 () Bool)

(declare-fun e!839285 () Bool)

(assert (=> b!1499756 (=> (not res!1021020) (not e!839285))))

(declare-datatypes ((array!100003 0))(
  ( (array!100004 (arr!48262 (Array (_ BitVec 32) (_ BitVec 64))) (size!48814 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100003)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499756 (= res!1021020 (validKeyInArray!0 (select (arr!48262 a!2850) i!996)))))

(declare-fun b!1499757 () Bool)

(declare-fun res!1021025 () Bool)

(assert (=> b!1499757 (=> (not res!1021025) (not e!839285))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12493 0))(
  ( (MissingZero!12493 (index!52364 (_ BitVec 32))) (Found!12493 (index!52365 (_ BitVec 32))) (Intermediate!12493 (undefined!13305 Bool) (index!52366 (_ BitVec 32)) (x!134050 (_ BitVec 32))) (Undefined!12493) (MissingVacant!12493 (index!52367 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100003 (_ BitVec 32)) SeekEntryResult!12493)

(assert (=> b!1499757 (= res!1021025 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48262 a!2850) j!87) a!2850 mask!2661) (Found!12493 j!87)))))

(declare-fun b!1499758 () Bool)

(declare-fun res!1021022 () Bool)

(assert (=> b!1499758 (=> (not res!1021022) (not e!839285))))

(assert (=> b!1499758 (= res!1021022 (validKeyInArray!0 (select (arr!48262 a!2850) j!87)))))

(declare-fun b!1499759 () Bool)

(declare-fun res!1021023 () Bool)

(assert (=> b!1499759 (=> (not res!1021023) (not e!839285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100003 (_ BitVec 32)) Bool)

(assert (=> b!1499759 (= res!1021023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499760 () Bool)

(declare-fun e!839284 () Bool)

(assert (=> b!1499760 (= e!839285 e!839284)))

(declare-fun res!1021026 () Bool)

(assert (=> b!1499760 (=> (not res!1021026) (not e!839284))))

(declare-fun lt!652585 () (_ BitVec 32))

(assert (=> b!1499760 (= res!1021026 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652585 #b00000000000000000000000000000000) (bvslt lt!652585 (size!48814 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499760 (= lt!652585 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499761 () Bool)

(declare-fun res!1021027 () Bool)

(assert (=> b!1499761 (=> (not res!1021027) (not e!839285))))

(declare-datatypes ((List!34832 0))(
  ( (Nil!34829) (Cons!34828 (h!36226 (_ BitVec 64)) (t!49518 List!34832)) )
))
(declare-fun arrayNoDuplicates!0 (array!100003 (_ BitVec 32) List!34832) Bool)

(assert (=> b!1499761 (= res!1021027 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34829))))

(declare-fun b!1499762 () Bool)

(assert (=> b!1499762 (= e!839284 false)))

(declare-fun lt!652584 () SeekEntryResult!12493)

(assert (=> b!1499762 (= lt!652584 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652585 vacantBefore!10 (select (arr!48262 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499755 () Bool)

(declare-fun res!1021028 () Bool)

(assert (=> b!1499755 (=> (not res!1021028) (not e!839285))))

(assert (=> b!1499755 (= res!1021028 (not (= (select (arr!48262 a!2850) index!625) (select (arr!48262 a!2850) j!87))))))

(declare-fun res!1021024 () Bool)

(assert (=> start!127628 (=> (not res!1021024) (not e!839285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127628 (= res!1021024 (validMask!0 mask!2661))))

(assert (=> start!127628 e!839285))

(assert (=> start!127628 true))

(declare-fun array_inv!37495 (array!100003) Bool)

(assert (=> start!127628 (array_inv!37495 a!2850)))

(declare-fun b!1499763 () Bool)

(declare-fun res!1021021 () Bool)

(assert (=> b!1499763 (=> (not res!1021021) (not e!839285))))

(assert (=> b!1499763 (= res!1021021 (and (= (size!48814 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48814 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48814 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499764 () Bool)

(declare-fun res!1021019 () Bool)

(assert (=> b!1499764 (=> (not res!1021019) (not e!839285))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499764 (= res!1021019 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48814 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48814 a!2850)) (= (select (arr!48262 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48262 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48814 a!2850))))))

(assert (= (and start!127628 res!1021024) b!1499763))

(assert (= (and b!1499763 res!1021021) b!1499756))

(assert (= (and b!1499756 res!1021020) b!1499758))

(assert (= (and b!1499758 res!1021022) b!1499759))

(assert (= (and b!1499759 res!1021023) b!1499761))

(assert (= (and b!1499761 res!1021027) b!1499764))

(assert (= (and b!1499764 res!1021019) b!1499757))

(assert (= (and b!1499757 res!1021025) b!1499755))

(assert (= (and b!1499755 res!1021028) b!1499760))

(assert (= (and b!1499760 res!1021026) b!1499762))

(declare-fun m!1382395 () Bool)

(assert (=> start!127628 m!1382395))

(declare-fun m!1382397 () Bool)

(assert (=> start!127628 m!1382397))

(declare-fun m!1382399 () Bool)

(assert (=> b!1499756 m!1382399))

(assert (=> b!1499756 m!1382399))

(declare-fun m!1382401 () Bool)

(assert (=> b!1499756 m!1382401))

(declare-fun m!1382403 () Bool)

(assert (=> b!1499758 m!1382403))

(assert (=> b!1499758 m!1382403))

(declare-fun m!1382405 () Bool)

(assert (=> b!1499758 m!1382405))

(declare-fun m!1382407 () Bool)

(assert (=> b!1499760 m!1382407))

(declare-fun m!1382409 () Bool)

(assert (=> b!1499755 m!1382409))

(assert (=> b!1499755 m!1382403))

(declare-fun m!1382411 () Bool)

(assert (=> b!1499759 m!1382411))

(assert (=> b!1499762 m!1382403))

(assert (=> b!1499762 m!1382403))

(declare-fun m!1382413 () Bool)

(assert (=> b!1499762 m!1382413))

(declare-fun m!1382415 () Bool)

(assert (=> b!1499764 m!1382415))

(declare-fun m!1382417 () Bool)

(assert (=> b!1499764 m!1382417))

(declare-fun m!1382419 () Bool)

(assert (=> b!1499764 m!1382419))

(assert (=> b!1499757 m!1382403))

(assert (=> b!1499757 m!1382403))

(declare-fun m!1382421 () Bool)

(assert (=> b!1499757 m!1382421))

(declare-fun m!1382423 () Bool)

(assert (=> b!1499761 m!1382423))

(check-sat (not b!1499762) (not b!1499759) (not b!1499758) (not b!1499757) (not b!1499761) (not b!1499756) (not b!1499760) (not start!127628))
(check-sat)
