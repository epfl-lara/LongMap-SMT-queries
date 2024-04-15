; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125386 () Bool)

(assert start!125386)

(declare-fun b!1467008 () Bool)

(declare-fun res!995709 () Bool)

(declare-fun e!824057 () Bool)

(assert (=> b!1467008 (=> (not res!995709) (not e!824057))))

(declare-fun e!824059 () Bool)

(assert (=> b!1467008 (= res!995709 e!824059)))

(declare-fun c!135172 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467008 (= c!135172 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467009 () Bool)

(declare-fun e!824054 () Bool)

(declare-fun e!824060 () Bool)

(assert (=> b!1467009 (= e!824054 e!824060)))

(declare-fun res!995699 () Bool)

(assert (=> b!1467009 (=> res!995699 e!824060)))

(declare-fun lt!641795 () (_ BitVec 32))

(declare-datatypes ((array!98812 0))(
  ( (array!98813 (arr!47695 (Array (_ BitVec 32) (_ BitVec 64))) (size!48247 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98812)

(assert (=> b!1467009 (= res!995699 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641795 #b00000000000000000000000000000000) (bvsge lt!641795 (size!48247 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467009 (= lt!641795 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467010 () Bool)

(declare-fun res!995705 () Bool)

(assert (=> b!1467010 (=> res!995705 e!824060)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467010 (= res!995705 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467011 () Bool)

(declare-fun e!824056 () Bool)

(assert (=> b!1467011 (= e!824060 e!824056)))

(declare-fun res!995707 () Bool)

(assert (=> b!1467011 (=> res!995707 e!824056)))

(assert (=> b!1467011 (= res!995707 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!641798 () (_ BitVec 64))

(declare-fun lt!641799 () array!98812)

(declare-datatypes ((SeekEntryResult!11972 0))(
  ( (MissingZero!11972 (index!50280 (_ BitVec 32))) (Found!11972 (index!50281 (_ BitVec 32))) (Intermediate!11972 (undefined!12784 Bool) (index!50282 (_ BitVec 32)) (x!131848 (_ BitVec 32))) (Undefined!11972) (MissingVacant!11972 (index!50283 (_ BitVec 32))) )
))
(declare-fun lt!641796 () SeekEntryResult!11972)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11972)

(assert (=> b!1467011 (= lt!641796 (seekEntryOrOpen!0 lt!641798 lt!641799 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49281 0))(
  ( (Unit!49282) )
))
(declare-fun lt!641802 () Unit!49281)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49281)

(assert (=> b!1467011 (= lt!641802 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641795 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467012 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467012 (= e!824056 (validKeyInArray!0 lt!641798))))

(declare-fun b!1467013 () Bool)

(declare-fun e!824053 () Bool)

(declare-fun e!824055 () Bool)

(assert (=> b!1467013 (= e!824053 e!824055)))

(declare-fun res!995702 () Bool)

(assert (=> b!1467013 (=> (not res!995702) (not e!824055))))

(declare-fun lt!641797 () SeekEntryResult!11972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467013 (= res!995702 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47695 a!2862) j!93) mask!2687) (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641797))))

(assert (=> b!1467013 (= lt!641797 (Intermediate!11972 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467014 () Bool)

(assert (=> b!1467014 (= e!824055 e!824057)))

(declare-fun res!995703 () Bool)

(assert (=> b!1467014 (=> (not res!995703) (not e!824057))))

(declare-fun lt!641801 () SeekEntryResult!11972)

(assert (=> b!1467014 (= res!995703 (= lt!641801 (Intermediate!11972 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467014 (= lt!641801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641798 mask!2687) lt!641798 lt!641799 mask!2687))))

(assert (=> b!1467014 (= lt!641798 (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467015 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11972)

(assert (=> b!1467015 (= e!824059 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641798 lt!641799 mask!2687) (seekEntryOrOpen!0 lt!641798 lt!641799 mask!2687)))))

(declare-fun b!1467016 () Bool)

(assert (=> b!1467016 (= e!824057 (not e!824054))))

(declare-fun res!995710 () Bool)

(assert (=> b!1467016 (=> res!995710 e!824054)))

(assert (=> b!1467016 (= res!995710 (or (and (= (select (arr!47695 a!2862) index!646) (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47695 a!2862) index!646) (select (arr!47695 a!2862) j!93))) (= (select (arr!47695 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467016 (and (= lt!641796 (Found!11972 j!93)) (or (= (select (arr!47695 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47695 a!2862) intermediateBeforeIndex!19) (select (arr!47695 a!2862) j!93))))))

(assert (=> b!1467016 (= lt!641796 (seekEntryOrOpen!0 (select (arr!47695 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98812 (_ BitVec 32)) Bool)

(assert (=> b!1467016 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641800 () Unit!49281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49281)

(assert (=> b!1467016 (= lt!641800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467017 () Bool)

(declare-fun e!824058 () Bool)

(assert (=> b!1467017 (= e!824058 (not (= lt!641801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641795 lt!641798 lt!641799 mask!2687))))))

(declare-fun b!1467018 () Bool)

(declare-fun res!995704 () Bool)

(declare-fun e!824061 () Bool)

(assert (=> b!1467018 (=> (not res!995704) (not e!824061))))

(assert (=> b!1467018 (= res!995704 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48247 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48247 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48247 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!995708 () Bool)

(assert (=> start!125386 (=> (not res!995708) (not e!824061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125386 (= res!995708 (validMask!0 mask!2687))))

(assert (=> start!125386 e!824061))

(assert (=> start!125386 true))

(declare-fun array_inv!36928 (array!98812) Bool)

(assert (=> start!125386 (array_inv!36928 a!2862)))

(declare-fun b!1467019 () Bool)

(assert (=> b!1467019 (= e!824061 e!824053)))

(declare-fun res!995694 () Bool)

(assert (=> b!1467019 (=> (not res!995694) (not e!824053))))

(assert (=> b!1467019 (= res!995694 (= (select (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467019 (= lt!641799 (array!98813 (store (arr!47695 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48247 a!2862)))))

(declare-fun b!1467020 () Bool)

(declare-fun res!995698 () Bool)

(assert (=> b!1467020 (=> (not res!995698) (not e!824061))))

(assert (=> b!1467020 (= res!995698 (validKeyInArray!0 (select (arr!47695 a!2862) i!1006)))))

(declare-fun b!1467021 () Bool)

(declare-fun res!995693 () Bool)

(assert (=> b!1467021 (=> res!995693 e!824060)))

(assert (=> b!1467021 (= res!995693 e!824058)))

(declare-fun c!135171 () Bool)

(assert (=> b!1467021 (= c!135171 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467022 () Bool)

(declare-fun res!995700 () Bool)

(assert (=> b!1467022 (=> (not res!995700) (not e!824061))))

(declare-datatypes ((List!34274 0))(
  ( (Nil!34271) (Cons!34270 (h!35620 (_ BitVec 64)) (t!48960 List!34274)) )
))
(declare-fun arrayNoDuplicates!0 (array!98812 (_ BitVec 32) List!34274) Bool)

(assert (=> b!1467022 (= res!995700 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34271))))

(declare-fun b!1467023 () Bool)

(assert (=> b!1467023 (= e!824058 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641795 intermediateAfterIndex!19 lt!641798 lt!641799 mask!2687) (seekEntryOrOpen!0 lt!641798 lt!641799 mask!2687))))))

(declare-fun b!1467024 () Bool)

(declare-fun res!995706 () Bool)

(assert (=> b!1467024 (=> (not res!995706) (not e!824055))))

(assert (=> b!1467024 (= res!995706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641797))))

(declare-fun b!1467025 () Bool)

(declare-fun res!995697 () Bool)

(assert (=> b!1467025 (=> (not res!995697) (not e!824061))))

(assert (=> b!1467025 (= res!995697 (and (= (size!48247 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48247 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48247 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467026 () Bool)

(declare-fun res!995696 () Bool)

(assert (=> b!1467026 (=> (not res!995696) (not e!824061))))

(assert (=> b!1467026 (= res!995696 (validKeyInArray!0 (select (arr!47695 a!2862) j!93)))))

(declare-fun b!1467027 () Bool)

(declare-fun res!995695 () Bool)

(assert (=> b!1467027 (=> res!995695 e!824060)))

(assert (=> b!1467027 (= res!995695 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641795 (select (arr!47695 a!2862) j!93) a!2862 mask!2687) lt!641797)))))

(declare-fun b!1467028 () Bool)

(declare-fun res!995701 () Bool)

(assert (=> b!1467028 (=> (not res!995701) (not e!824057))))

(assert (=> b!1467028 (= res!995701 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467029 () Bool)

(declare-fun res!995692 () Bool)

(assert (=> b!1467029 (=> (not res!995692) (not e!824061))))

(assert (=> b!1467029 (= res!995692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467030 () Bool)

(assert (=> b!1467030 (= e!824059 (= lt!641801 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641798 lt!641799 mask!2687)))))

(assert (= (and start!125386 res!995708) b!1467025))

(assert (= (and b!1467025 res!995697) b!1467020))

(assert (= (and b!1467020 res!995698) b!1467026))

(assert (= (and b!1467026 res!995696) b!1467029))

(assert (= (and b!1467029 res!995692) b!1467022))

(assert (= (and b!1467022 res!995700) b!1467018))

(assert (= (and b!1467018 res!995704) b!1467019))

(assert (= (and b!1467019 res!995694) b!1467013))

(assert (= (and b!1467013 res!995702) b!1467024))

(assert (= (and b!1467024 res!995706) b!1467014))

(assert (= (and b!1467014 res!995703) b!1467008))

(assert (= (and b!1467008 c!135172) b!1467030))

(assert (= (and b!1467008 (not c!135172)) b!1467015))

(assert (= (and b!1467008 res!995709) b!1467028))

(assert (= (and b!1467028 res!995701) b!1467016))

(assert (= (and b!1467016 (not res!995710)) b!1467009))

(assert (= (and b!1467009 (not res!995699)) b!1467027))

(assert (= (and b!1467027 (not res!995695)) b!1467021))

(assert (= (and b!1467021 c!135171) b!1467017))

(assert (= (and b!1467021 (not c!135171)) b!1467023))

(assert (= (and b!1467021 (not res!995693)) b!1467010))

(assert (= (and b!1467010 (not res!995705)) b!1467011))

(assert (= (and b!1467011 (not res!995707)) b!1467012))

(declare-fun m!1353447 () Bool)

(assert (=> start!125386 m!1353447))

(declare-fun m!1353449 () Bool)

(assert (=> start!125386 m!1353449))

(declare-fun m!1353451 () Bool)

(assert (=> b!1467017 m!1353451))

(declare-fun m!1353453 () Bool)

(assert (=> b!1467015 m!1353453))

(declare-fun m!1353455 () Bool)

(assert (=> b!1467015 m!1353455))

(declare-fun m!1353457 () Bool)

(assert (=> b!1467026 m!1353457))

(assert (=> b!1467026 m!1353457))

(declare-fun m!1353459 () Bool)

(assert (=> b!1467026 m!1353459))

(assert (=> b!1467013 m!1353457))

(assert (=> b!1467013 m!1353457))

(declare-fun m!1353461 () Bool)

(assert (=> b!1467013 m!1353461))

(assert (=> b!1467013 m!1353461))

(assert (=> b!1467013 m!1353457))

(declare-fun m!1353463 () Bool)

(assert (=> b!1467013 m!1353463))

(declare-fun m!1353465 () Bool)

(assert (=> b!1467029 m!1353465))

(declare-fun m!1353467 () Bool)

(assert (=> b!1467019 m!1353467))

(declare-fun m!1353469 () Bool)

(assert (=> b!1467019 m!1353469))

(declare-fun m!1353471 () Bool)

(assert (=> b!1467009 m!1353471))

(declare-fun m!1353473 () Bool)

(assert (=> b!1467023 m!1353473))

(assert (=> b!1467023 m!1353455))

(declare-fun m!1353475 () Bool)

(assert (=> b!1467012 m!1353475))

(declare-fun m!1353477 () Bool)

(assert (=> b!1467020 m!1353477))

(assert (=> b!1467020 m!1353477))

(declare-fun m!1353479 () Bool)

(assert (=> b!1467020 m!1353479))

(declare-fun m!1353481 () Bool)

(assert (=> b!1467014 m!1353481))

(assert (=> b!1467014 m!1353481))

(declare-fun m!1353483 () Bool)

(assert (=> b!1467014 m!1353483))

(assert (=> b!1467014 m!1353467))

(declare-fun m!1353485 () Bool)

(assert (=> b!1467014 m!1353485))

(assert (=> b!1467027 m!1353457))

(assert (=> b!1467027 m!1353457))

(declare-fun m!1353487 () Bool)

(assert (=> b!1467027 m!1353487))

(declare-fun m!1353489 () Bool)

(assert (=> b!1467030 m!1353489))

(assert (=> b!1467024 m!1353457))

(assert (=> b!1467024 m!1353457))

(declare-fun m!1353491 () Bool)

(assert (=> b!1467024 m!1353491))

(declare-fun m!1353493 () Bool)

(assert (=> b!1467022 m!1353493))

(assert (=> b!1467011 m!1353455))

(declare-fun m!1353495 () Bool)

(assert (=> b!1467011 m!1353495))

(declare-fun m!1353497 () Bool)

(assert (=> b!1467016 m!1353497))

(assert (=> b!1467016 m!1353467))

(declare-fun m!1353499 () Bool)

(assert (=> b!1467016 m!1353499))

(declare-fun m!1353501 () Bool)

(assert (=> b!1467016 m!1353501))

(declare-fun m!1353503 () Bool)

(assert (=> b!1467016 m!1353503))

(assert (=> b!1467016 m!1353457))

(declare-fun m!1353505 () Bool)

(assert (=> b!1467016 m!1353505))

(declare-fun m!1353507 () Bool)

(assert (=> b!1467016 m!1353507))

(assert (=> b!1467016 m!1353457))

(check-sat (not b!1467013) (not b!1467022) (not b!1467026) (not b!1467011) (not b!1467029) (not b!1467023) (not b!1467027) (not start!125386) (not b!1467020) (not b!1467024) (not b!1467015) (not b!1467017) (not b!1467009) (not b!1467016) (not b!1467012) (not b!1467014) (not b!1467030))
(check-sat)
