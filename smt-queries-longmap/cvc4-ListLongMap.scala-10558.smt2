; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124490 () Bool)

(assert start!124490)

(declare-fun b!1440464 () Bool)

(declare-fun res!972893 () Bool)

(declare-fun e!812195 () Bool)

(assert (=> b!1440464 (=> (not res!972893) (not e!812195))))

(declare-datatypes ((array!97938 0))(
  ( (array!97939 (arr!47257 (Array (_ BitVec 32) (_ BitVec 64))) (size!47807 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97938)

(declare-datatypes ((List!33758 0))(
  ( (Nil!33755) (Cons!33754 (h!35104 (_ BitVec 64)) (t!48452 List!33758)) )
))
(declare-fun arrayNoDuplicates!0 (array!97938 (_ BitVec 32) List!33758) Bool)

(assert (=> b!1440464 (= res!972893 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33755))))

(declare-fun b!1440465 () Bool)

(declare-fun res!972890 () Bool)

(assert (=> b!1440465 (=> (not res!972890) (not e!812195))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440465 (= res!972890 (and (= (size!47807 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47807 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47807 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440466 () Bool)

(declare-fun res!972892 () Bool)

(assert (=> b!1440466 (=> (not res!972892) (not e!812195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440466 (= res!972892 (validKeyInArray!0 (select (arr!47257 a!2862) j!93)))))

(declare-fun b!1440467 () Bool)

(declare-fun res!972897 () Bool)

(assert (=> b!1440467 (=> (not res!972897) (not e!812195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97938 (_ BitVec 32)) Bool)

(assert (=> b!1440467 (= res!972897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972898 () Bool)

(assert (=> start!124490 (=> (not res!972898) (not e!812195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124490 (= res!972898 (validMask!0 mask!2687))))

(assert (=> start!124490 e!812195))

(assert (=> start!124490 true))

(declare-fun array_inv!36285 (array!97938) Bool)

(assert (=> start!124490 (array_inv!36285 a!2862)))

(declare-fun b!1440463 () Bool)

(declare-fun res!972895 () Bool)

(assert (=> b!1440463 (=> (not res!972895) (not e!812195))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440463 (= res!972895 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47807 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47807 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47807 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440468 () Bool)

(declare-fun res!972896 () Bool)

(assert (=> b!1440468 (=> (not res!972896) (not e!812195))))

(assert (=> b!1440468 (= res!972896 (validKeyInArray!0 (select (arr!47257 a!2862) i!1006)))))

(declare-fun b!1440469 () Bool)

(declare-fun e!812194 () Bool)

(assert (=> b!1440469 (= e!812195 e!812194)))

(declare-fun res!972891 () Bool)

(assert (=> b!1440469 (=> (not res!972891) (not e!812194))))

(declare-datatypes ((SeekEntryResult!11509 0))(
  ( (MissingZero!11509 (index!48428 (_ BitVec 32))) (Found!11509 (index!48429 (_ BitVec 32))) (Intermediate!11509 (undefined!12321 Bool) (index!48430 (_ BitVec 32)) (x!130150 (_ BitVec 32))) (Undefined!11509) (MissingVacant!11509 (index!48431 (_ BitVec 32))) )
))
(declare-fun lt!632975 () SeekEntryResult!11509)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97938 (_ BitVec 32)) SeekEntryResult!11509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440469 (= res!972891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47257 a!2862) j!93) mask!2687) (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!632975))))

(assert (=> b!1440469 (= lt!632975 (Intermediate!11509 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440470 () Bool)

(declare-fun res!972894 () Bool)

(assert (=> b!1440470 (=> (not res!972894) (not e!812194))))

(assert (=> b!1440470 (= res!972894 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!632975))))

(declare-fun b!1440471 () Bool)

(assert (=> b!1440471 (= e!812194 false)))

(declare-fun lt!632976 () SeekEntryResult!11509)

(assert (=> b!1440471 (= lt!632976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97939 (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47807 a!2862)) mask!2687))))

(assert (= (and start!124490 res!972898) b!1440465))

(assert (= (and b!1440465 res!972890) b!1440468))

(assert (= (and b!1440468 res!972896) b!1440466))

(assert (= (and b!1440466 res!972892) b!1440467))

(assert (= (and b!1440467 res!972897) b!1440464))

(assert (= (and b!1440464 res!972893) b!1440463))

(assert (= (and b!1440463 res!972895) b!1440469))

(assert (= (and b!1440469 res!972891) b!1440470))

(assert (= (and b!1440470 res!972894) b!1440471))

(declare-fun m!1329659 () Bool)

(assert (=> b!1440466 m!1329659))

(assert (=> b!1440466 m!1329659))

(declare-fun m!1329661 () Bool)

(assert (=> b!1440466 m!1329661))

(assert (=> b!1440470 m!1329659))

(assert (=> b!1440470 m!1329659))

(declare-fun m!1329663 () Bool)

(assert (=> b!1440470 m!1329663))

(declare-fun m!1329665 () Bool)

(assert (=> b!1440467 m!1329665))

(declare-fun m!1329667 () Bool)

(assert (=> b!1440464 m!1329667))

(declare-fun m!1329669 () Bool)

(assert (=> start!124490 m!1329669))

(declare-fun m!1329671 () Bool)

(assert (=> start!124490 m!1329671))

(assert (=> b!1440469 m!1329659))

(assert (=> b!1440469 m!1329659))

(declare-fun m!1329673 () Bool)

(assert (=> b!1440469 m!1329673))

(assert (=> b!1440469 m!1329673))

(assert (=> b!1440469 m!1329659))

(declare-fun m!1329675 () Bool)

(assert (=> b!1440469 m!1329675))

(declare-fun m!1329677 () Bool)

(assert (=> b!1440463 m!1329677))

(declare-fun m!1329679 () Bool)

(assert (=> b!1440463 m!1329679))

(assert (=> b!1440471 m!1329677))

(declare-fun m!1329681 () Bool)

(assert (=> b!1440471 m!1329681))

(assert (=> b!1440471 m!1329681))

(declare-fun m!1329683 () Bool)

(assert (=> b!1440471 m!1329683))

(assert (=> b!1440471 m!1329683))

(assert (=> b!1440471 m!1329681))

(declare-fun m!1329685 () Bool)

(assert (=> b!1440471 m!1329685))

(declare-fun m!1329687 () Bool)

(assert (=> b!1440468 m!1329687))

(assert (=> b!1440468 m!1329687))

(declare-fun m!1329689 () Bool)

(assert (=> b!1440468 m!1329689))

(push 1)

(assert (not b!1440471))

(assert (not b!1440464))

(assert (not b!1440466))

(assert (not b!1440467))

(assert (not start!124490))

(assert (not b!1440469))

(assert (not b!1440470))

(assert (not b!1440468))

(check-sat)

