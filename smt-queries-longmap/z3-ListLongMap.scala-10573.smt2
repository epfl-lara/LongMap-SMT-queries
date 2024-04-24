; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124794 () Bool)

(assert start!124794)

(declare-fun b!1443408 () Bool)

(declare-fun e!813669 () Bool)

(declare-fun e!813670 () Bool)

(assert (=> b!1443408 (= e!813669 e!813670)))

(declare-fun res!974854 () Bool)

(assert (=> b!1443408 (=> (not res!974854) (not e!813670))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98137 0))(
  ( (array!98138 (arr!47353 (Array (_ BitVec 32) (_ BitVec 64))) (size!47904 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98137)

(assert (=> b!1443408 (= res!974854 (= (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633933 () array!98137)

(assert (=> b!1443408 (= lt!633933 (array!98138 (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47904 a!2862)))))

(declare-fun b!1443409 () Bool)

(declare-fun res!974848 () Bool)

(assert (=> b!1443409 (=> (not res!974848) (not e!813669))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98137 (_ BitVec 32)) Bool)

(assert (=> b!1443409 (= res!974848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1443410 () Bool)

(declare-fun e!813673 () Bool)

(declare-fun lt!633935 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11502 0))(
  ( (MissingZero!11502 (index!48400 (_ BitVec 32))) (Found!11502 (index!48401 (_ BitVec 32))) (Intermediate!11502 (undefined!12314 Bool) (index!48402 (_ BitVec 32)) (x!130287 (_ BitVec 32))) (Undefined!11502) (MissingVacant!11502 (index!48403 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98137 (_ BitVec 32)) SeekEntryResult!11502)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98137 (_ BitVec 32)) SeekEntryResult!11502)

(assert (=> b!1443410 (= e!813673 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633935 lt!633933 mask!2687) (seekEntryOrOpen!0 lt!633935 lt!633933 mask!2687)))))

(declare-fun b!1443411 () Bool)

(declare-fun res!974857 () Bool)

(assert (=> b!1443411 (=> (not res!974857) (not e!813669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443411 (= res!974857 (validKeyInArray!0 (select (arr!47353 a!2862) i!1006)))))

(declare-fun res!974853 () Bool)

(assert (=> start!124794 (=> (not res!974853) (not e!813669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124794 (= res!974853 (validMask!0 mask!2687))))

(assert (=> start!124794 e!813669))

(assert (=> start!124794 true))

(declare-fun array_inv!36634 (array!98137) Bool)

(assert (=> start!124794 (array_inv!36634 a!2862)))

(declare-fun b!1443412 () Bool)

(declare-fun res!974850 () Bool)

(assert (=> b!1443412 (=> (not res!974850) (not e!813669))))

(declare-datatypes ((List!33841 0))(
  ( (Nil!33838) (Cons!33837 (h!35198 (_ BitVec 64)) (t!48527 List!33841)) )
))
(declare-fun arrayNoDuplicates!0 (array!98137 (_ BitVec 32) List!33841) Bool)

(assert (=> b!1443412 (= res!974850 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33838))))

(declare-fun b!1443413 () Bool)

(declare-fun res!974852 () Bool)

(declare-fun e!813674 () Bool)

(assert (=> b!1443413 (=> (not res!974852) (not e!813674))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443413 (= res!974852 (= (seekEntryOrOpen!0 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) (Found!11502 j!93)))))

(declare-fun b!1443414 () Bool)

(declare-fun res!974846 () Bool)

(declare-fun e!813672 () Bool)

(assert (=> b!1443414 (=> (not res!974846) (not e!813672))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443414 (= res!974846 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443415 () Bool)

(declare-fun res!974847 () Bool)

(assert (=> b!1443415 (=> (not res!974847) (not e!813672))))

(assert (=> b!1443415 (= res!974847 e!813673)))

(declare-fun c!133801 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443415 (= c!133801 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443416 () Bool)

(declare-fun res!974856 () Bool)

(assert (=> b!1443416 (=> (not res!974856) (not e!813669))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1443416 (= res!974856 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47904 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47904 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47904 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443417 () Bool)

(declare-fun lt!633934 () SeekEntryResult!11502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98137 (_ BitVec 32)) SeekEntryResult!11502)

(assert (=> b!1443417 (= e!813673 (= lt!633934 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633935 lt!633933 mask!2687)))))

(declare-fun b!1443418 () Bool)

(declare-fun res!974855 () Bool)

(declare-fun e!813671 () Bool)

(assert (=> b!1443418 (=> (not res!974855) (not e!813671))))

(declare-fun lt!633936 () SeekEntryResult!11502)

(assert (=> b!1443418 (= res!974855 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!633936))))

(declare-fun b!1443419 () Bool)

(assert (=> b!1443419 (= e!813674 (or (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) (select (arr!47353 a!2862) j!93))))))

(declare-fun b!1443420 () Bool)

(declare-fun res!974858 () Bool)

(assert (=> b!1443420 (=> (not res!974858) (not e!813669))))

(assert (=> b!1443420 (= res!974858 (validKeyInArray!0 (select (arr!47353 a!2862) j!93)))))

(declare-fun b!1443421 () Bool)

(assert (=> b!1443421 (= e!813670 e!813671)))

(declare-fun res!974851 () Bool)

(assert (=> b!1443421 (=> (not res!974851) (not e!813671))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443421 (= res!974851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47353 a!2862) j!93) mask!2687) (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!633936))))

(assert (=> b!1443421 (= lt!633936 (Intermediate!11502 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443422 () Bool)

(assert (=> b!1443422 (= e!813671 e!813672)))

(declare-fun res!974845 () Bool)

(assert (=> b!1443422 (=> (not res!974845) (not e!813672))))

(assert (=> b!1443422 (= res!974845 (= lt!633934 (Intermediate!11502 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443422 (= lt!633934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633935 mask!2687) lt!633935 lt!633933 mask!2687))))

(assert (=> b!1443422 (= lt!633935 (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443423 () Bool)

(declare-fun res!974844 () Bool)

(assert (=> b!1443423 (=> (not res!974844) (not e!813669))))

(assert (=> b!1443423 (= res!974844 (and (= (size!47904 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47904 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47904 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443424 () Bool)

(assert (=> b!1443424 (= e!813672 (not true))))

(assert (=> b!1443424 e!813674))

(declare-fun res!974849 () Bool)

(assert (=> b!1443424 (=> (not res!974849) (not e!813674))))

(assert (=> b!1443424 (= res!974849 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48533 0))(
  ( (Unit!48534) )
))
(declare-fun lt!633937 () Unit!48533)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48533)

(assert (=> b!1443424 (= lt!633937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124794 res!974853) b!1443423))

(assert (= (and b!1443423 res!974844) b!1443411))

(assert (= (and b!1443411 res!974857) b!1443420))

(assert (= (and b!1443420 res!974858) b!1443409))

(assert (= (and b!1443409 res!974848) b!1443412))

(assert (= (and b!1443412 res!974850) b!1443416))

(assert (= (and b!1443416 res!974856) b!1443408))

(assert (= (and b!1443408 res!974854) b!1443421))

(assert (= (and b!1443421 res!974851) b!1443418))

(assert (= (and b!1443418 res!974855) b!1443422))

(assert (= (and b!1443422 res!974845) b!1443415))

(assert (= (and b!1443415 c!133801) b!1443417))

(assert (= (and b!1443415 (not c!133801)) b!1443410))

(assert (= (and b!1443415 res!974847) b!1443414))

(assert (= (and b!1443414 res!974846) b!1443424))

(assert (= (and b!1443424 res!974849) b!1443413))

(assert (= (and b!1443413 res!974852) b!1443419))

(declare-fun m!1332697 () Bool)

(assert (=> b!1443411 m!1332697))

(assert (=> b!1443411 m!1332697))

(declare-fun m!1332699 () Bool)

(assert (=> b!1443411 m!1332699))

(declare-fun m!1332701 () Bool)

(assert (=> b!1443422 m!1332701))

(assert (=> b!1443422 m!1332701))

(declare-fun m!1332703 () Bool)

(assert (=> b!1443422 m!1332703))

(declare-fun m!1332705 () Bool)

(assert (=> b!1443422 m!1332705))

(declare-fun m!1332707 () Bool)

(assert (=> b!1443422 m!1332707))

(declare-fun m!1332709 () Bool)

(assert (=> b!1443417 m!1332709))

(declare-fun m!1332711 () Bool)

(assert (=> b!1443413 m!1332711))

(assert (=> b!1443413 m!1332711))

(declare-fun m!1332713 () Bool)

(assert (=> b!1443413 m!1332713))

(declare-fun m!1332715 () Bool)

(assert (=> b!1443410 m!1332715))

(declare-fun m!1332717 () Bool)

(assert (=> b!1443410 m!1332717))

(declare-fun m!1332719 () Bool)

(assert (=> b!1443409 m!1332719))

(declare-fun m!1332721 () Bool)

(assert (=> b!1443419 m!1332721))

(assert (=> b!1443419 m!1332711))

(assert (=> b!1443408 m!1332705))

(declare-fun m!1332723 () Bool)

(assert (=> b!1443408 m!1332723))

(assert (=> b!1443420 m!1332711))

(assert (=> b!1443420 m!1332711))

(declare-fun m!1332725 () Bool)

(assert (=> b!1443420 m!1332725))

(assert (=> b!1443418 m!1332711))

(assert (=> b!1443418 m!1332711))

(declare-fun m!1332727 () Bool)

(assert (=> b!1443418 m!1332727))

(declare-fun m!1332729 () Bool)

(assert (=> b!1443412 m!1332729))

(declare-fun m!1332731 () Bool)

(assert (=> start!124794 m!1332731))

(declare-fun m!1332733 () Bool)

(assert (=> start!124794 m!1332733))

(assert (=> b!1443421 m!1332711))

(assert (=> b!1443421 m!1332711))

(declare-fun m!1332735 () Bool)

(assert (=> b!1443421 m!1332735))

(assert (=> b!1443421 m!1332735))

(assert (=> b!1443421 m!1332711))

(declare-fun m!1332737 () Bool)

(assert (=> b!1443421 m!1332737))

(declare-fun m!1332739 () Bool)

(assert (=> b!1443424 m!1332739))

(declare-fun m!1332741 () Bool)

(assert (=> b!1443424 m!1332741))

(check-sat (not b!1443417) (not b!1443421) (not b!1443410) (not b!1443411) (not b!1443424) (not b!1443409) (not b!1443422) (not b!1443412) (not start!124794) (not b!1443418) (not b!1443413) (not b!1443420))
(check-sat)
