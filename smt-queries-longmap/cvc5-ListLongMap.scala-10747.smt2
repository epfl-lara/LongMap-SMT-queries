; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125680 () Bool)

(assert start!125680)

(declare-fun b!1470684 () Bool)

(declare-fun res!998784 () Bool)

(declare-fun e!825553 () Bool)

(assert (=> b!1470684 (=> (not res!998784) (not e!825553))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99071 0))(
  ( (array!99072 (arr!47822 (Array (_ BitVec 32) (_ BitVec 64))) (size!48372 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99071)

(assert (=> b!1470684 (= res!998784 (and (= (size!48372 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48372 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48372 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470685 () Bool)

(declare-fun res!998786 () Bool)

(assert (=> b!1470685 (=> (not res!998786) (not e!825553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470685 (= res!998786 (validKeyInArray!0 (select (arr!47822 a!2862) j!93)))))

(declare-fun b!1470686 () Bool)

(declare-fun e!825551 () Bool)

(declare-datatypes ((SeekEntryResult!12062 0))(
  ( (MissingZero!12062 (index!50640 (_ BitVec 32))) (Found!12062 (index!50641 (_ BitVec 32))) (Intermediate!12062 (undefined!12874 Bool) (index!50642 (_ BitVec 32)) (x!132224 (_ BitVec 32))) (Undefined!12062) (MissingVacant!12062 (index!50643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99071 (_ BitVec 32)) SeekEntryResult!12062)

(assert (=> b!1470686 (= e!825551 (= (seekEntryOrOpen!0 (select (arr!47822 a!2862) j!93) a!2862 mask!2687) (Found!12062 j!93)))))

(declare-fun b!1470687 () Bool)

(declare-fun e!825548 () Bool)

(assert (=> b!1470687 (= e!825548 (not true))))

(assert (=> b!1470687 e!825551))

(declare-fun res!998785 () Bool)

(assert (=> b!1470687 (=> (not res!998785) (not e!825551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99071 (_ BitVec 32)) Bool)

(assert (=> b!1470687 (= res!998785 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49464 0))(
  ( (Unit!49465) )
))
(declare-fun lt!643002 () Unit!49464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49464)

(assert (=> b!1470687 (= lt!643002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470688 () Bool)

(declare-fun e!825549 () Bool)

(assert (=> b!1470688 (= e!825553 e!825549)))

(declare-fun res!998787 () Bool)

(assert (=> b!1470688 (=> (not res!998787) (not e!825549))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470688 (= res!998787 (= (select (store (arr!47822 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643001 () array!99071)

(assert (=> b!1470688 (= lt!643001 (array!99072 (store (arr!47822 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48372 a!2862)))))

(declare-fun b!1470689 () Bool)

(declare-fun res!998794 () Bool)

(assert (=> b!1470689 (=> (not res!998794) (not e!825553))))

(assert (=> b!1470689 (= res!998794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470690 () Bool)

(declare-fun res!998788 () Bool)

(assert (=> b!1470690 (=> (not res!998788) (not e!825553))))

(declare-datatypes ((List!34323 0))(
  ( (Nil!34320) (Cons!34319 (h!35672 (_ BitVec 64)) (t!49017 List!34323)) )
))
(declare-fun arrayNoDuplicates!0 (array!99071 (_ BitVec 32) List!34323) Bool)

(assert (=> b!1470690 (= res!998788 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34320))))

(declare-fun e!825554 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1470691 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643003 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99071 (_ BitVec 32)) SeekEntryResult!12062)

(assert (=> b!1470691 (= e!825554 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643003 lt!643001 mask!2687) (seekEntryOrOpen!0 lt!643003 lt!643001 mask!2687)))))

(declare-fun b!1470692 () Bool)

(declare-fun e!825550 () Bool)

(assert (=> b!1470692 (= e!825550 e!825548)))

(declare-fun res!998796 () Bool)

(assert (=> b!1470692 (=> (not res!998796) (not e!825548))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643004 () SeekEntryResult!12062)

(assert (=> b!1470692 (= res!998796 (= lt!643004 (Intermediate!12062 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99071 (_ BitVec 32)) SeekEntryResult!12062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470692 (= lt!643004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643003 mask!2687) lt!643003 lt!643001 mask!2687))))

(assert (=> b!1470692 (= lt!643003 (select (store (arr!47822 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!998793 () Bool)

(assert (=> start!125680 (=> (not res!998793) (not e!825553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125680 (= res!998793 (validMask!0 mask!2687))))

(assert (=> start!125680 e!825553))

(assert (=> start!125680 true))

(declare-fun array_inv!36850 (array!99071) Bool)

(assert (=> start!125680 (array_inv!36850 a!2862)))

(declare-fun b!1470693 () Bool)

(assert (=> b!1470693 (= e!825554 (= lt!643004 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643003 lt!643001 mask!2687)))))

(declare-fun b!1470694 () Bool)

(declare-fun res!998797 () Bool)

(assert (=> b!1470694 (=> (not res!998797) (not e!825553))))

(assert (=> b!1470694 (= res!998797 (validKeyInArray!0 (select (arr!47822 a!2862) i!1006)))))

(declare-fun b!1470695 () Bool)

(assert (=> b!1470695 (= e!825549 e!825550)))

(declare-fun res!998795 () Bool)

(assert (=> b!1470695 (=> (not res!998795) (not e!825550))))

(declare-fun lt!643005 () SeekEntryResult!12062)

(assert (=> b!1470695 (= res!998795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47822 a!2862) j!93) mask!2687) (select (arr!47822 a!2862) j!93) a!2862 mask!2687) lt!643005))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470695 (= lt!643005 (Intermediate!12062 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470696 () Bool)

(declare-fun res!998790 () Bool)

(assert (=> b!1470696 (=> (not res!998790) (not e!825553))))

(assert (=> b!1470696 (= res!998790 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48372 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48372 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48372 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470697 () Bool)

(declare-fun res!998791 () Bool)

(assert (=> b!1470697 (=> (not res!998791) (not e!825548))))

(assert (=> b!1470697 (= res!998791 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470698 () Bool)

(declare-fun res!998792 () Bool)

(assert (=> b!1470698 (=> (not res!998792) (not e!825548))))

(assert (=> b!1470698 (= res!998792 e!825554)))

(declare-fun c!135462 () Bool)

(assert (=> b!1470698 (= c!135462 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470699 () Bool)

(declare-fun res!998789 () Bool)

(assert (=> b!1470699 (=> (not res!998789) (not e!825550))))

(assert (=> b!1470699 (= res!998789 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47822 a!2862) j!93) a!2862 mask!2687) lt!643005))))

(assert (= (and start!125680 res!998793) b!1470684))

(assert (= (and b!1470684 res!998784) b!1470694))

(assert (= (and b!1470694 res!998797) b!1470685))

(assert (= (and b!1470685 res!998786) b!1470689))

(assert (= (and b!1470689 res!998794) b!1470690))

(assert (= (and b!1470690 res!998788) b!1470696))

(assert (= (and b!1470696 res!998790) b!1470688))

(assert (= (and b!1470688 res!998787) b!1470695))

(assert (= (and b!1470695 res!998795) b!1470699))

(assert (= (and b!1470699 res!998789) b!1470692))

(assert (= (and b!1470692 res!998796) b!1470698))

(assert (= (and b!1470698 c!135462) b!1470693))

(assert (= (and b!1470698 (not c!135462)) b!1470691))

(assert (= (and b!1470698 res!998792) b!1470697))

(assert (= (and b!1470697 res!998791) b!1470687))

(assert (= (and b!1470687 res!998785) b!1470686))

(declare-fun m!1357663 () Bool)

(assert (=> b!1470688 m!1357663))

(declare-fun m!1357665 () Bool)

(assert (=> b!1470688 m!1357665))

(declare-fun m!1357667 () Bool)

(assert (=> start!125680 m!1357667))

(declare-fun m!1357669 () Bool)

(assert (=> start!125680 m!1357669))

(declare-fun m!1357671 () Bool)

(assert (=> b!1470699 m!1357671))

(assert (=> b!1470699 m!1357671))

(declare-fun m!1357673 () Bool)

(assert (=> b!1470699 m!1357673))

(declare-fun m!1357675 () Bool)

(assert (=> b!1470691 m!1357675))

(declare-fun m!1357677 () Bool)

(assert (=> b!1470691 m!1357677))

(declare-fun m!1357679 () Bool)

(assert (=> b!1470692 m!1357679))

(assert (=> b!1470692 m!1357679))

(declare-fun m!1357681 () Bool)

(assert (=> b!1470692 m!1357681))

(assert (=> b!1470692 m!1357663))

(declare-fun m!1357683 () Bool)

(assert (=> b!1470692 m!1357683))

(declare-fun m!1357685 () Bool)

(assert (=> b!1470690 m!1357685))

(declare-fun m!1357687 () Bool)

(assert (=> b!1470689 m!1357687))

(declare-fun m!1357689 () Bool)

(assert (=> b!1470687 m!1357689))

(declare-fun m!1357691 () Bool)

(assert (=> b!1470687 m!1357691))

(assert (=> b!1470686 m!1357671))

(assert (=> b!1470686 m!1357671))

(declare-fun m!1357693 () Bool)

(assert (=> b!1470686 m!1357693))

(assert (=> b!1470695 m!1357671))

(assert (=> b!1470695 m!1357671))

(declare-fun m!1357695 () Bool)

(assert (=> b!1470695 m!1357695))

(assert (=> b!1470695 m!1357695))

(assert (=> b!1470695 m!1357671))

(declare-fun m!1357697 () Bool)

(assert (=> b!1470695 m!1357697))

(declare-fun m!1357699 () Bool)

(assert (=> b!1470694 m!1357699))

(assert (=> b!1470694 m!1357699))

(declare-fun m!1357701 () Bool)

(assert (=> b!1470694 m!1357701))

(assert (=> b!1470685 m!1357671))

(assert (=> b!1470685 m!1357671))

(declare-fun m!1357703 () Bool)

(assert (=> b!1470685 m!1357703))

(declare-fun m!1357705 () Bool)

(assert (=> b!1470693 m!1357705))

(push 1)

