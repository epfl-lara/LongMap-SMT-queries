; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127630 () Bool)

(assert start!127630)

(declare-fun b!1499411 () Bool)

(declare-fun e!839285 () Bool)

(assert (=> b!1499411 (= e!839285 false)))

(declare-datatypes ((SeekEntryResult!12475 0))(
  ( (MissingZero!12475 (index!52292 (_ BitVec 32))) (Found!12475 (index!52293 (_ BitVec 32))) (Intermediate!12475 (undefined!13287 Bool) (index!52294 (_ BitVec 32)) (x!133973 (_ BitVec 32))) (Undefined!12475) (MissingVacant!12475 (index!52295 (_ BitVec 32))) )
))
(declare-fun lt!652732 () SeekEntryResult!12475)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100011 0))(
  ( (array!100012 (arr!48265 (Array (_ BitVec 32) (_ BitVec 64))) (size!48815 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100011)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652731 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100011 (_ BitVec 32)) SeekEntryResult!12475)

(assert (=> b!1499411 (= lt!652732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652731 vacantBefore!10 (select (arr!48265 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499412 () Bool)

(declare-fun res!1020496 () Bool)

(declare-fun e!839286 () Bool)

(assert (=> b!1499412 (=> (not res!1020496) (not e!839286))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499412 (= res!1020496 (and (= (size!48815 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48815 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48815 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499413 () Bool)

(assert (=> b!1499413 (= e!839286 e!839285)))

(declare-fun res!1020495 () Bool)

(assert (=> b!1499413 (=> (not res!1020495) (not e!839285))))

(assert (=> b!1499413 (= res!1020495 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652731 #b00000000000000000000000000000000) (bvslt lt!652731 (size!48815 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499413 (= lt!652731 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499414 () Bool)

(declare-fun res!1020489 () Bool)

(assert (=> b!1499414 (=> (not res!1020489) (not e!839286))))

(declare-datatypes ((List!34757 0))(
  ( (Nil!34754) (Cons!34753 (h!36150 (_ BitVec 64)) (t!49451 List!34757)) )
))
(declare-fun arrayNoDuplicates!0 (array!100011 (_ BitVec 32) List!34757) Bool)

(assert (=> b!1499414 (= res!1020489 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34754))))

(declare-fun b!1499415 () Bool)

(declare-fun res!1020492 () Bool)

(assert (=> b!1499415 (=> (not res!1020492) (not e!839286))))

(assert (=> b!1499415 (= res!1020492 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48265 a!2850) j!87) a!2850 mask!2661) (Found!12475 j!87)))))

(declare-fun b!1499416 () Bool)

(declare-fun res!1020493 () Bool)

(assert (=> b!1499416 (=> (not res!1020493) (not e!839286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499416 (= res!1020493 (validKeyInArray!0 (select (arr!48265 a!2850) i!996)))))

(declare-fun res!1020494 () Bool)

(assert (=> start!127630 (=> (not res!1020494) (not e!839286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127630 (= res!1020494 (validMask!0 mask!2661))))

(assert (=> start!127630 e!839286))

(assert (=> start!127630 true))

(declare-fun array_inv!37293 (array!100011) Bool)

(assert (=> start!127630 (array_inv!37293 a!2850)))

(declare-fun b!1499417 () Bool)

(declare-fun res!1020488 () Bool)

(assert (=> b!1499417 (=> (not res!1020488) (not e!839286))))

(assert (=> b!1499417 (= res!1020488 (not (= (select (arr!48265 a!2850) index!625) (select (arr!48265 a!2850) j!87))))))

(declare-fun b!1499418 () Bool)

(declare-fun res!1020491 () Bool)

(assert (=> b!1499418 (=> (not res!1020491) (not e!839286))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499418 (= res!1020491 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48815 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48815 a!2850)) (= (select (arr!48265 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48265 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48815 a!2850))))))

(declare-fun b!1499419 () Bool)

(declare-fun res!1020490 () Bool)

(assert (=> b!1499419 (=> (not res!1020490) (not e!839286))))

(assert (=> b!1499419 (= res!1020490 (validKeyInArray!0 (select (arr!48265 a!2850) j!87)))))

(declare-fun b!1499420 () Bool)

(declare-fun res!1020487 () Bool)

(assert (=> b!1499420 (=> (not res!1020487) (not e!839286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100011 (_ BitVec 32)) Bool)

(assert (=> b!1499420 (= res!1020487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127630 res!1020494) b!1499412))

(assert (= (and b!1499412 res!1020496) b!1499416))

(assert (= (and b!1499416 res!1020493) b!1499419))

(assert (= (and b!1499419 res!1020490) b!1499420))

(assert (= (and b!1499420 res!1020487) b!1499414))

(assert (= (and b!1499414 res!1020489) b!1499418))

(assert (= (and b!1499418 res!1020491) b!1499415))

(assert (= (and b!1499415 res!1020492) b!1499417))

(assert (= (and b!1499417 res!1020488) b!1499413))

(assert (= (and b!1499413 res!1020495) b!1499411))

(declare-fun m!1382605 () Bool)

(assert (=> start!127630 m!1382605))

(declare-fun m!1382607 () Bool)

(assert (=> start!127630 m!1382607))

(declare-fun m!1382609 () Bool)

(assert (=> b!1499417 m!1382609))

(declare-fun m!1382611 () Bool)

(assert (=> b!1499417 m!1382611))

(assert (=> b!1499411 m!1382611))

(assert (=> b!1499411 m!1382611))

(declare-fun m!1382613 () Bool)

(assert (=> b!1499411 m!1382613))

(declare-fun m!1382615 () Bool)

(assert (=> b!1499418 m!1382615))

(declare-fun m!1382617 () Bool)

(assert (=> b!1499418 m!1382617))

(declare-fun m!1382619 () Bool)

(assert (=> b!1499418 m!1382619))

(declare-fun m!1382621 () Bool)

(assert (=> b!1499416 m!1382621))

(assert (=> b!1499416 m!1382621))

(declare-fun m!1382623 () Bool)

(assert (=> b!1499416 m!1382623))

(declare-fun m!1382625 () Bool)

(assert (=> b!1499420 m!1382625))

(declare-fun m!1382627 () Bool)

(assert (=> b!1499413 m!1382627))

(assert (=> b!1499419 m!1382611))

(assert (=> b!1499419 m!1382611))

(declare-fun m!1382629 () Bool)

(assert (=> b!1499419 m!1382629))

(assert (=> b!1499415 m!1382611))

(assert (=> b!1499415 m!1382611))

(declare-fun m!1382631 () Bool)

(assert (=> b!1499415 m!1382631))

(declare-fun m!1382633 () Bool)

(assert (=> b!1499414 m!1382633))

(push 1)

(assert (not b!1499414))

(assert (not b!1499415))

(assert (not b!1499420))

(assert (not b!1499411))

(assert (not b!1499416))

(assert (not b!1499419))

(assert (not b!1499413))

(assert (not start!127630))

(check-sat)

(pop 1)

