; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124758 () Bool)

(assert start!124758)

(declare-fun b!1442626 () Bool)

(declare-fun res!974176 () Bool)

(declare-fun e!813346 () Bool)

(assert (=> b!1442626 (=> (not res!974176) (not e!813346))))

(declare-datatypes ((array!98101 0))(
  ( (array!98102 (arr!47335 (Array (_ BitVec 32) (_ BitVec 64))) (size!47886 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98101)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98101 (_ BitVec 32)) Bool)

(assert (=> b!1442626 (= res!974176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442627 () Bool)

(declare-fun res!974178 () Bool)

(assert (=> b!1442627 (=> (not res!974178) (not e!813346))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442627 (= res!974178 (and (= (size!47886 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47886 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47886 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442628 () Bool)

(declare-fun e!813348 () Bool)

(declare-fun e!813347 () Bool)

(assert (=> b!1442628 (= e!813348 e!813347)))

(declare-fun res!974171 () Bool)

(assert (=> b!1442628 (=> (not res!974171) (not e!813347))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11484 0))(
  ( (MissingZero!11484 (index!48328 (_ BitVec 32))) (Found!11484 (index!48329 (_ BitVec 32))) (Intermediate!11484 (undefined!12296 Bool) (index!48330 (_ BitVec 32)) (x!130221 (_ BitVec 32))) (Undefined!11484) (MissingVacant!11484 (index!48331 (_ BitVec 32))) )
))
(declare-fun lt!633667 () SeekEntryResult!11484)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442628 (= res!974171 (= lt!633667 (Intermediate!11484 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633666 () array!98101)

(declare-fun lt!633665 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98101 (_ BitVec 32)) SeekEntryResult!11484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442628 (= lt!633667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633665 mask!2687) lt!633665 lt!633666 mask!2687))))

(assert (=> b!1442628 (= lt!633665 (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!974179 () Bool)

(assert (=> start!124758 (=> (not res!974179) (not e!813346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124758 (= res!974179 (validMask!0 mask!2687))))

(assert (=> start!124758 e!813346))

(assert (=> start!124758 true))

(declare-fun array_inv!36616 (array!98101) Bool)

(assert (=> start!124758 (array_inv!36616 a!2862)))

(declare-fun b!1442629 () Bool)

(declare-fun res!974177 () Bool)

(assert (=> b!1442629 (=> (not res!974177) (not e!813346))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442629 (= res!974177 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47886 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47886 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47886 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442630 () Bool)

(declare-fun res!974180 () Bool)

(assert (=> b!1442630 (=> (not res!974180) (not e!813346))))

(declare-datatypes ((List!33823 0))(
  ( (Nil!33820) (Cons!33819 (h!35180 (_ BitVec 64)) (t!48509 List!33823)) )
))
(declare-fun arrayNoDuplicates!0 (array!98101 (_ BitVec 32) List!33823) Bool)

(assert (=> b!1442630 (= res!974180 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33820))))

(declare-fun b!1442631 () Bool)

(declare-fun res!974174 () Bool)

(assert (=> b!1442631 (=> (not res!974174) (not e!813346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442631 (= res!974174 (validKeyInArray!0 (select (arr!47335 a!2862) i!1006)))))

(declare-fun e!813343 () Bool)

(declare-fun b!1442632 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98101 (_ BitVec 32)) SeekEntryResult!11484)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98101 (_ BitVec 32)) SeekEntryResult!11484)

(assert (=> b!1442632 (= e!813343 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633665 lt!633666 mask!2687) (seekEntryOrOpen!0 lt!633665 lt!633666 mask!2687))))))

(declare-fun b!1442633 () Bool)

(declare-fun e!813345 () Bool)

(assert (=> b!1442633 (= e!813345 e!813348)))

(declare-fun res!974175 () Bool)

(assert (=> b!1442633 (=> (not res!974175) (not e!813348))))

(declare-fun lt!633663 () SeekEntryResult!11484)

(assert (=> b!1442633 (= res!974175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47335 a!2862) j!93) mask!2687) (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!633663))))

(assert (=> b!1442633 (= lt!633663 (Intermediate!11484 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442634 () Bool)

(assert (=> b!1442634 (= e!813347 false)))

(declare-fun lt!633664 () Bool)

(assert (=> b!1442634 (= lt!633664 e!813343)))

(declare-fun c!133747 () Bool)

(assert (=> b!1442634 (= c!133747 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442635 () Bool)

(declare-fun res!974172 () Bool)

(assert (=> b!1442635 (=> (not res!974172) (not e!813348))))

(assert (=> b!1442635 (= res!974172 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!633663))))

(declare-fun b!1442636 () Bool)

(assert (=> b!1442636 (= e!813343 (not (= lt!633667 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633665 lt!633666 mask!2687))))))

(declare-fun b!1442637 () Bool)

(declare-fun res!974170 () Bool)

(assert (=> b!1442637 (=> (not res!974170) (not e!813346))))

(assert (=> b!1442637 (= res!974170 (validKeyInArray!0 (select (arr!47335 a!2862) j!93)))))

(declare-fun b!1442638 () Bool)

(assert (=> b!1442638 (= e!813346 e!813345)))

(declare-fun res!974173 () Bool)

(assert (=> b!1442638 (=> (not res!974173) (not e!813345))))

(assert (=> b!1442638 (= res!974173 (= (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442638 (= lt!633666 (array!98102 (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47886 a!2862)))))

(assert (= (and start!124758 res!974179) b!1442627))

(assert (= (and b!1442627 res!974178) b!1442631))

(assert (= (and b!1442631 res!974174) b!1442637))

(assert (= (and b!1442637 res!974170) b!1442626))

(assert (= (and b!1442626 res!974176) b!1442630))

(assert (= (and b!1442630 res!974180) b!1442629))

(assert (= (and b!1442629 res!974177) b!1442638))

(assert (= (and b!1442638 res!974173) b!1442633))

(assert (= (and b!1442633 res!974175) b!1442635))

(assert (= (and b!1442635 res!974172) b!1442628))

(assert (= (and b!1442628 res!974171) b!1442634))

(assert (= (and b!1442634 c!133747) b!1442636))

(assert (= (and b!1442634 (not c!133747)) b!1442632))

(declare-fun m!1331965 () Bool)

(assert (=> b!1442638 m!1331965))

(declare-fun m!1331967 () Bool)

(assert (=> b!1442638 m!1331967))

(declare-fun m!1331969 () Bool)

(assert (=> b!1442636 m!1331969))

(declare-fun m!1331971 () Bool)

(assert (=> b!1442631 m!1331971))

(assert (=> b!1442631 m!1331971))

(declare-fun m!1331973 () Bool)

(assert (=> b!1442631 m!1331973))

(declare-fun m!1331975 () Bool)

(assert (=> b!1442626 m!1331975))

(declare-fun m!1331977 () Bool)

(assert (=> b!1442628 m!1331977))

(assert (=> b!1442628 m!1331977))

(declare-fun m!1331979 () Bool)

(assert (=> b!1442628 m!1331979))

(assert (=> b!1442628 m!1331965))

(declare-fun m!1331981 () Bool)

(assert (=> b!1442628 m!1331981))

(declare-fun m!1331983 () Bool)

(assert (=> b!1442637 m!1331983))

(assert (=> b!1442637 m!1331983))

(declare-fun m!1331985 () Bool)

(assert (=> b!1442637 m!1331985))

(assert (=> b!1442633 m!1331983))

(assert (=> b!1442633 m!1331983))

(declare-fun m!1331987 () Bool)

(assert (=> b!1442633 m!1331987))

(assert (=> b!1442633 m!1331987))

(assert (=> b!1442633 m!1331983))

(declare-fun m!1331989 () Bool)

(assert (=> b!1442633 m!1331989))

(assert (=> b!1442635 m!1331983))

(assert (=> b!1442635 m!1331983))

(declare-fun m!1331991 () Bool)

(assert (=> b!1442635 m!1331991))

(declare-fun m!1331993 () Bool)

(assert (=> b!1442632 m!1331993))

(declare-fun m!1331995 () Bool)

(assert (=> b!1442632 m!1331995))

(declare-fun m!1331997 () Bool)

(assert (=> start!124758 m!1331997))

(declare-fun m!1331999 () Bool)

(assert (=> start!124758 m!1331999))

(declare-fun m!1332001 () Bool)

(assert (=> b!1442630 m!1332001))

(check-sat (not start!124758) (not b!1442636) (not b!1442633) (not b!1442632) (not b!1442637) (not b!1442630) (not b!1442631) (not b!1442626) (not b!1442635) (not b!1442628))
(check-sat)
