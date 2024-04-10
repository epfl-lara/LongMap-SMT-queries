; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124636 () Bool)

(assert start!124636)

(declare-fun res!975712 () Bool)

(declare-fun e!813484 () Bool)

(assert (=> start!124636 (=> (not res!975712) (not e!813484))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124636 (= res!975712 (validMask!0 mask!2687))))

(assert (=> start!124636 e!813484))

(assert (=> start!124636 true))

(declare-datatypes ((array!98084 0))(
  ( (array!98085 (arr!47330 (Array (_ BitVec 32) (_ BitVec 64))) (size!47880 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98084)

(declare-fun array_inv!36358 (array!98084) Bool)

(assert (=> start!124636 (array_inv!36358 a!2862)))

(declare-fun b!1443631 () Bool)

(declare-fun res!975716 () Bool)

(declare-fun e!813488 () Bool)

(assert (=> b!1443631 (=> (not res!975716) (not e!813488))))

(declare-fun e!813486 () Bool)

(assert (=> b!1443631 (= res!975716 e!813486)))

(declare-fun c!133470 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443631 (= c!133470 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443632 () Bool)

(declare-fun res!975723 () Bool)

(assert (=> b!1443632 (=> (not res!975723) (not e!813484))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443632 (= res!975723 (and (= (size!47880 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47880 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47880 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443633 () Bool)

(declare-fun e!813485 () Bool)

(assert (=> b!1443633 (= e!813488 (not e!813485))))

(declare-fun res!975726 () Bool)

(assert (=> b!1443633 (=> res!975726 e!813485)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443633 (= res!975726 (or (not (= (select (arr!47330 a!2862) index!646) (select (store (arr!47330 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47330 a!2862) index!646) (select (arr!47330 a!2862) j!93)))))))

(declare-fun e!813482 () Bool)

(assert (=> b!1443633 e!813482))

(declare-fun res!975714 () Bool)

(assert (=> b!1443633 (=> (not res!975714) (not e!813482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98084 (_ BitVec 32)) Bool)

(assert (=> b!1443633 (= res!975714 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48660 0))(
  ( (Unit!48661) )
))
(declare-fun lt!633927 () Unit!48660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48660)

(assert (=> b!1443633 (= lt!633927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!633928 () array!98084)

(declare-datatypes ((SeekEntryResult!11582 0))(
  ( (MissingZero!11582 (index!48720 (_ BitVec 32))) (Found!11582 (index!48721 (_ BitVec 32))) (Intermediate!11582 (undefined!12394 Bool) (index!48722 (_ BitVec 32)) (x!130423 (_ BitVec 32))) (Undefined!11582) (MissingVacant!11582 (index!48723 (_ BitVec 32))) )
))
(declare-fun lt!633930 () SeekEntryResult!11582)

(declare-fun b!1443634 () Bool)

(declare-fun lt!633925 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98084 (_ BitVec 32)) SeekEntryResult!11582)

(assert (=> b!1443634 (= e!813486 (= lt!633930 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633925 lt!633928 mask!2687)))))

(declare-fun b!1443635 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98084 (_ BitVec 32)) SeekEntryResult!11582)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98084 (_ BitVec 32)) SeekEntryResult!11582)

(assert (=> b!1443635 (= e!813486 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633925 lt!633928 mask!2687) (seekEntryOrOpen!0 lt!633925 lt!633928 mask!2687)))))

(declare-fun b!1443636 () Bool)

(declare-fun res!975720 () Bool)

(assert (=> b!1443636 (=> (not res!975720) (not e!813484))))

(declare-datatypes ((List!33831 0))(
  ( (Nil!33828) (Cons!33827 (h!35177 (_ BitVec 64)) (t!48525 List!33831)) )
))
(declare-fun arrayNoDuplicates!0 (array!98084 (_ BitVec 32) List!33831) Bool)

(assert (=> b!1443636 (= res!975720 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33828))))

(declare-fun b!1443637 () Bool)

(declare-fun res!975724 () Bool)

(assert (=> b!1443637 (=> (not res!975724) (not e!813482))))

(assert (=> b!1443637 (= res!975724 (= (seekEntryOrOpen!0 (select (arr!47330 a!2862) j!93) a!2862 mask!2687) (Found!11582 j!93)))))

(declare-fun b!1443638 () Bool)

(declare-fun res!975721 () Bool)

(assert (=> b!1443638 (=> (not res!975721) (not e!813484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443638 (= res!975721 (validKeyInArray!0 (select (arr!47330 a!2862) i!1006)))))

(declare-fun b!1443639 () Bool)

(declare-fun res!975727 () Bool)

(assert (=> b!1443639 (=> (not res!975727) (not e!813484))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443639 (= res!975727 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47880 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47880 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47880 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443640 () Bool)

(declare-fun e!813487 () Bool)

(declare-fun e!813483 () Bool)

(assert (=> b!1443640 (= e!813487 e!813483)))

(declare-fun res!975713 () Bool)

(assert (=> b!1443640 (=> (not res!975713) (not e!813483))))

(declare-fun lt!633929 () SeekEntryResult!11582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443640 (= res!975713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47330 a!2862) j!93) mask!2687) (select (arr!47330 a!2862) j!93) a!2862 mask!2687) lt!633929))))

(assert (=> b!1443640 (= lt!633929 (Intermediate!11582 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443641 () Bool)

(assert (=> b!1443641 (= e!813482 (or (= (select (arr!47330 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47330 a!2862) intermediateBeforeIndex!19) (select (arr!47330 a!2862) j!93))))))

(declare-fun b!1443642 () Bool)

(assert (=> b!1443642 (= e!813485 true)))

(declare-fun lt!633926 () SeekEntryResult!11582)

(assert (=> b!1443642 (= lt!633926 (seekEntryOrOpen!0 lt!633925 lt!633928 mask!2687))))

(declare-fun b!1443643 () Bool)

(assert (=> b!1443643 (= e!813484 e!813487)))

(declare-fun res!975725 () Bool)

(assert (=> b!1443643 (=> (not res!975725) (not e!813487))))

(assert (=> b!1443643 (= res!975725 (= (select (store (arr!47330 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443643 (= lt!633928 (array!98085 (store (arr!47330 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47880 a!2862)))))

(declare-fun b!1443644 () Bool)

(declare-fun res!975717 () Bool)

(assert (=> b!1443644 (=> (not res!975717) (not e!813488))))

(assert (=> b!1443644 (= res!975717 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443645 () Bool)

(declare-fun res!975718 () Bool)

(assert (=> b!1443645 (=> (not res!975718) (not e!813484))))

(assert (=> b!1443645 (= res!975718 (validKeyInArray!0 (select (arr!47330 a!2862) j!93)))))

(declare-fun b!1443646 () Bool)

(assert (=> b!1443646 (= e!813483 e!813488)))

(declare-fun res!975722 () Bool)

(assert (=> b!1443646 (=> (not res!975722) (not e!813488))))

(assert (=> b!1443646 (= res!975722 (= lt!633930 (Intermediate!11582 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443646 (= lt!633930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633925 mask!2687) lt!633925 lt!633928 mask!2687))))

(assert (=> b!1443646 (= lt!633925 (select (store (arr!47330 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443647 () Bool)

(declare-fun res!975719 () Bool)

(assert (=> b!1443647 (=> (not res!975719) (not e!813483))))

(assert (=> b!1443647 (= res!975719 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47330 a!2862) j!93) a!2862 mask!2687) lt!633929))))

(declare-fun b!1443648 () Bool)

(declare-fun res!975715 () Bool)

(assert (=> b!1443648 (=> (not res!975715) (not e!813484))))

(assert (=> b!1443648 (= res!975715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124636 res!975712) b!1443632))

(assert (= (and b!1443632 res!975723) b!1443638))

(assert (= (and b!1443638 res!975721) b!1443645))

(assert (= (and b!1443645 res!975718) b!1443648))

(assert (= (and b!1443648 res!975715) b!1443636))

(assert (= (and b!1443636 res!975720) b!1443639))

(assert (= (and b!1443639 res!975727) b!1443643))

(assert (= (and b!1443643 res!975725) b!1443640))

(assert (= (and b!1443640 res!975713) b!1443647))

(assert (= (and b!1443647 res!975719) b!1443646))

(assert (= (and b!1443646 res!975722) b!1443631))

(assert (= (and b!1443631 c!133470) b!1443634))

(assert (= (and b!1443631 (not c!133470)) b!1443635))

(assert (= (and b!1443631 res!975716) b!1443644))

(assert (= (and b!1443644 res!975717) b!1443633))

(assert (= (and b!1443633 res!975714) b!1443637))

(assert (= (and b!1443637 res!975724) b!1443641))

(assert (= (and b!1443633 (not res!975726)) b!1443642))

(declare-fun m!1332703 () Bool)

(assert (=> b!1443634 m!1332703))

(declare-fun m!1332705 () Bool)

(assert (=> b!1443635 m!1332705))

(declare-fun m!1332707 () Bool)

(assert (=> b!1443635 m!1332707))

(declare-fun m!1332709 () Bool)

(assert (=> b!1443646 m!1332709))

(assert (=> b!1443646 m!1332709))

(declare-fun m!1332711 () Bool)

(assert (=> b!1443646 m!1332711))

(declare-fun m!1332713 () Bool)

(assert (=> b!1443646 m!1332713))

(declare-fun m!1332715 () Bool)

(assert (=> b!1443646 m!1332715))

(declare-fun m!1332717 () Bool)

(assert (=> b!1443637 m!1332717))

(assert (=> b!1443637 m!1332717))

(declare-fun m!1332719 () Bool)

(assert (=> b!1443637 m!1332719))

(declare-fun m!1332721 () Bool)

(assert (=> b!1443633 m!1332721))

(assert (=> b!1443633 m!1332713))

(declare-fun m!1332723 () Bool)

(assert (=> b!1443633 m!1332723))

(declare-fun m!1332725 () Bool)

(assert (=> b!1443633 m!1332725))

(declare-fun m!1332727 () Bool)

(assert (=> b!1443633 m!1332727))

(assert (=> b!1443633 m!1332717))

(assert (=> b!1443642 m!1332707))

(assert (=> b!1443645 m!1332717))

(assert (=> b!1443645 m!1332717))

(declare-fun m!1332729 () Bool)

(assert (=> b!1443645 m!1332729))

(assert (=> b!1443640 m!1332717))

(assert (=> b!1443640 m!1332717))

(declare-fun m!1332731 () Bool)

(assert (=> b!1443640 m!1332731))

(assert (=> b!1443640 m!1332731))

(assert (=> b!1443640 m!1332717))

(declare-fun m!1332733 () Bool)

(assert (=> b!1443640 m!1332733))

(declare-fun m!1332735 () Bool)

(assert (=> b!1443638 m!1332735))

(assert (=> b!1443638 m!1332735))

(declare-fun m!1332737 () Bool)

(assert (=> b!1443638 m!1332737))

(declare-fun m!1332739 () Bool)

(assert (=> b!1443641 m!1332739))

(assert (=> b!1443641 m!1332717))

(declare-fun m!1332741 () Bool)

(assert (=> b!1443636 m!1332741))

(assert (=> b!1443643 m!1332713))

(declare-fun m!1332743 () Bool)

(assert (=> b!1443643 m!1332743))

(assert (=> b!1443647 m!1332717))

(assert (=> b!1443647 m!1332717))

(declare-fun m!1332745 () Bool)

(assert (=> b!1443647 m!1332745))

(declare-fun m!1332747 () Bool)

(assert (=> start!124636 m!1332747))

(declare-fun m!1332749 () Bool)

(assert (=> start!124636 m!1332749))

(declare-fun m!1332751 () Bool)

(assert (=> b!1443648 m!1332751))

(push 1)

