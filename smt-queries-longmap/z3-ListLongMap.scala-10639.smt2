; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124942 () Bool)

(assert start!124942)

(declare-fun b!1452625 () Bool)

(declare-fun res!983817 () Bool)

(declare-fun e!817678 () Bool)

(assert (=> b!1452625 (=> (not res!983817) (not e!817678))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((array!98368 0))(
  ( (array!98369 (arr!47473 (Array (_ BitVec 32) (_ BitVec 64))) (size!48025 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98368)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1452625 (= res!983817 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48025 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48025 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48025 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!636824 () (_ BitVec 64))

(declare-fun b!1452626 () Bool)

(declare-fun e!817683 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!636823 () array!98368)

(declare-datatypes ((SeekEntryResult!11750 0))(
  ( (MissingZero!11750 (index!49392 (_ BitVec 32))) (Found!11750 (index!49393 (_ BitVec 32))) (Intermediate!11750 (undefined!12562 Bool) (index!49394 (_ BitVec 32)) (x!131034 (_ BitVec 32))) (Undefined!11750) (MissingVacant!11750 (index!49395 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11750)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11750)

(assert (=> b!1452626 (= e!817683 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636824 lt!636823 mask!2687) (seekEntryOrOpen!0 lt!636824 lt!636823 mask!2687)))))

(declare-fun b!1452627 () Bool)

(declare-fun res!983816 () Bool)

(declare-fun e!817677 () Bool)

(assert (=> b!1452627 (=> (not res!983816) (not e!817677))))

(assert (=> b!1452627 (= res!983816 e!817683)))

(declare-fun c!133918 () Bool)

(assert (=> b!1452627 (= c!133918 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452628 () Bool)

(declare-fun e!817682 () Bool)

(declare-fun e!817680 () Bool)

(assert (=> b!1452628 (= e!817682 e!817680)))

(declare-fun res!983828 () Bool)

(assert (=> b!1452628 (=> (not res!983828) (not e!817680))))

(declare-fun lt!636821 () SeekEntryResult!11750)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98368 (_ BitVec 32)) SeekEntryResult!11750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452628 (= res!983828 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47473 a!2862) j!93) mask!2687) (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636821))))

(assert (=> b!1452628 (= lt!636821 (Intermediate!11750 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452629 () Bool)

(declare-fun e!817681 () Bool)

(assert (=> b!1452629 (= e!817677 (not e!817681))))

(declare-fun res!983822 () Bool)

(assert (=> b!1452629 (=> res!983822 e!817681)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452629 (= res!983822 (or (and (= (select (arr!47473 a!2862) index!646) (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47473 a!2862) index!646) (select (arr!47473 a!2862) j!93))) (= (select (arr!47473 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun e!817676 () Bool)

(assert (=> b!1452629 e!817676))

(declare-fun res!983824 () Bool)

(assert (=> b!1452629 (=> (not res!983824) (not e!817676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98368 (_ BitVec 32)) Bool)

(assert (=> b!1452629 (= res!983824 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48837 0))(
  ( (Unit!48838) )
))
(declare-fun lt!636822 () Unit!48837)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48837)

(assert (=> b!1452629 (= lt!636822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452631 () Bool)

(declare-fun res!983827 () Bool)

(assert (=> b!1452631 (=> (not res!983827) (not e!817678))))

(assert (=> b!1452631 (= res!983827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452632 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452632 (= e!817681 (validKeyInArray!0 lt!636824))))

(declare-fun b!1452633 () Bool)

(assert (=> b!1452633 (= e!817676 (and (or (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) (select (arr!47473 a!2862) j!93))) (or (and (= (select (arr!47473 a!2862) index!646) (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47473 a!2862) index!646) (select (arr!47473 a!2862) j!93))) (= (select (arr!47473 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452634 () Bool)

(assert (=> b!1452634 (= e!817680 e!817677)))

(declare-fun res!983819 () Bool)

(assert (=> b!1452634 (=> (not res!983819) (not e!817677))))

(declare-fun lt!636825 () SeekEntryResult!11750)

(assert (=> b!1452634 (= res!983819 (= lt!636825 (Intermediate!11750 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452634 (= lt!636825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636824 mask!2687) lt!636824 lt!636823 mask!2687))))

(assert (=> b!1452634 (= lt!636824 (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452635 () Bool)

(declare-fun res!983821 () Bool)

(assert (=> b!1452635 (=> (not res!983821) (not e!817678))))

(declare-datatypes ((List!34052 0))(
  ( (Nil!34049) (Cons!34048 (h!35398 (_ BitVec 64)) (t!48738 List!34052)) )
))
(declare-fun arrayNoDuplicates!0 (array!98368 (_ BitVec 32) List!34052) Bool)

(assert (=> b!1452635 (= res!983821 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34049))))

(declare-fun b!1452636 () Bool)

(declare-fun res!983823 () Bool)

(assert (=> b!1452636 (=> (not res!983823) (not e!817678))))

(assert (=> b!1452636 (= res!983823 (validKeyInArray!0 (select (arr!47473 a!2862) j!93)))))

(declare-fun b!1452637 () Bool)

(declare-fun res!983818 () Bool)

(assert (=> b!1452637 (=> (not res!983818) (not e!817678))))

(assert (=> b!1452637 (= res!983818 (and (= (size!48025 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48025 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48025 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452638 () Bool)

(assert (=> b!1452638 (= e!817678 e!817682)))

(declare-fun res!983820 () Bool)

(assert (=> b!1452638 (=> (not res!983820) (not e!817682))))

(assert (=> b!1452638 (= res!983820 (= (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452638 (= lt!636823 (array!98369 (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48025 a!2862)))))

(declare-fun b!1452639 () Bool)

(declare-fun res!983815 () Bool)

(assert (=> b!1452639 (=> (not res!983815) (not e!817680))))

(assert (=> b!1452639 (= res!983815 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636821))))

(declare-fun b!1452640 () Bool)

(declare-fun res!983825 () Bool)

(assert (=> b!1452640 (=> (not res!983825) (not e!817678))))

(assert (=> b!1452640 (= res!983825 (validKeyInArray!0 (select (arr!47473 a!2862) i!1006)))))

(declare-fun b!1452641 () Bool)

(declare-fun res!983830 () Bool)

(assert (=> b!1452641 (=> (not res!983830) (not e!817677))))

(assert (=> b!1452641 (= res!983830 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452642 () Bool)

(assert (=> b!1452642 (= e!817683 (= lt!636825 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636824 lt!636823 mask!2687)))))

(declare-fun res!983829 () Bool)

(assert (=> start!124942 (=> (not res!983829) (not e!817678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124942 (= res!983829 (validMask!0 mask!2687))))

(assert (=> start!124942 e!817678))

(assert (=> start!124942 true))

(declare-fun array_inv!36706 (array!98368) Bool)

(assert (=> start!124942 (array_inv!36706 a!2862)))

(declare-fun b!1452630 () Bool)

(declare-fun res!983826 () Bool)

(assert (=> b!1452630 (=> (not res!983826) (not e!817676))))

(assert (=> b!1452630 (= res!983826 (= (seekEntryOrOpen!0 (select (arr!47473 a!2862) j!93) a!2862 mask!2687) (Found!11750 j!93)))))

(assert (= (and start!124942 res!983829) b!1452637))

(assert (= (and b!1452637 res!983818) b!1452640))

(assert (= (and b!1452640 res!983825) b!1452636))

(assert (= (and b!1452636 res!983823) b!1452631))

(assert (= (and b!1452631 res!983827) b!1452635))

(assert (= (and b!1452635 res!983821) b!1452625))

(assert (= (and b!1452625 res!983817) b!1452638))

(assert (= (and b!1452638 res!983820) b!1452628))

(assert (= (and b!1452628 res!983828) b!1452639))

(assert (= (and b!1452639 res!983815) b!1452634))

(assert (= (and b!1452634 res!983819) b!1452627))

(assert (= (and b!1452627 c!133918) b!1452642))

(assert (= (and b!1452627 (not c!133918)) b!1452626))

(assert (= (and b!1452627 res!983816) b!1452641))

(assert (= (and b!1452641 res!983830) b!1452629))

(assert (= (and b!1452629 res!983824) b!1452630))

(assert (= (and b!1452630 res!983826) b!1452633))

(assert (= (and b!1452629 (not res!983822)) b!1452632))

(declare-fun m!1340709 () Bool)

(assert (=> b!1452635 m!1340709))

(declare-fun m!1340711 () Bool)

(assert (=> start!124942 m!1340711))

(declare-fun m!1340713 () Bool)

(assert (=> start!124942 m!1340713))

(declare-fun m!1340715 () Bool)

(assert (=> b!1452640 m!1340715))

(assert (=> b!1452640 m!1340715))

(declare-fun m!1340717 () Bool)

(assert (=> b!1452640 m!1340717))

(declare-fun m!1340719 () Bool)

(assert (=> b!1452636 m!1340719))

(assert (=> b!1452636 m!1340719))

(declare-fun m!1340721 () Bool)

(assert (=> b!1452636 m!1340721))

(assert (=> b!1452628 m!1340719))

(assert (=> b!1452628 m!1340719))

(declare-fun m!1340723 () Bool)

(assert (=> b!1452628 m!1340723))

(assert (=> b!1452628 m!1340723))

(assert (=> b!1452628 m!1340719))

(declare-fun m!1340725 () Bool)

(assert (=> b!1452628 m!1340725))

(declare-fun m!1340727 () Bool)

(assert (=> b!1452631 m!1340727))

(declare-fun m!1340729 () Bool)

(assert (=> b!1452633 m!1340729))

(declare-fun m!1340731 () Bool)

(assert (=> b!1452633 m!1340731))

(declare-fun m!1340733 () Bool)

(assert (=> b!1452633 m!1340733))

(declare-fun m!1340735 () Bool)

(assert (=> b!1452633 m!1340735))

(assert (=> b!1452633 m!1340719))

(declare-fun m!1340737 () Bool)

(assert (=> b!1452642 m!1340737))

(declare-fun m!1340739 () Bool)

(assert (=> b!1452634 m!1340739))

(assert (=> b!1452634 m!1340739))

(declare-fun m!1340741 () Bool)

(assert (=> b!1452634 m!1340741))

(assert (=> b!1452634 m!1340729))

(declare-fun m!1340743 () Bool)

(assert (=> b!1452634 m!1340743))

(declare-fun m!1340745 () Bool)

(assert (=> b!1452626 m!1340745))

(declare-fun m!1340747 () Bool)

(assert (=> b!1452626 m!1340747))

(assert (=> b!1452639 m!1340719))

(assert (=> b!1452639 m!1340719))

(declare-fun m!1340749 () Bool)

(assert (=> b!1452639 m!1340749))

(assert (=> b!1452630 m!1340719))

(assert (=> b!1452630 m!1340719))

(declare-fun m!1340751 () Bool)

(assert (=> b!1452630 m!1340751))

(declare-fun m!1340753 () Bool)

(assert (=> b!1452632 m!1340753))

(declare-fun m!1340755 () Bool)

(assert (=> b!1452629 m!1340755))

(assert (=> b!1452629 m!1340729))

(assert (=> b!1452629 m!1340733))

(assert (=> b!1452629 m!1340735))

(declare-fun m!1340757 () Bool)

(assert (=> b!1452629 m!1340757))

(assert (=> b!1452629 m!1340719))

(assert (=> b!1452638 m!1340729))

(declare-fun m!1340759 () Bool)

(assert (=> b!1452638 m!1340759))

(check-sat (not b!1452634) (not b!1452640) (not b!1452629) (not b!1452635) (not b!1452636) (not b!1452630) (not b!1452628) (not start!124942) (not b!1452632) (not b!1452639) (not b!1452631) (not b!1452626) (not b!1452642))
(check-sat)
