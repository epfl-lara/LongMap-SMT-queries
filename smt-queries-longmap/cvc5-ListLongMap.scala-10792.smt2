; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126250 () Bool)

(assert start!126250)

(declare-fun b!1479779 () Bool)

(declare-fun res!1005650 () Bool)

(declare-fun e!830022 () Bool)

(assert (=> b!1479779 (=> (not res!1005650) (not e!830022))))

(declare-datatypes ((array!99356 0))(
  ( (array!99357 (arr!47957 (Array (_ BitVec 32) (_ BitVec 64))) (size!48507 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99356)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479779 (= res!1005650 (validKeyInArray!0 (select (arr!47957 a!2862) i!1006)))))

(declare-fun b!1479780 () Bool)

(declare-fun e!830027 () Bool)

(declare-fun e!830020 () Bool)

(assert (=> b!1479780 (= e!830027 e!830020)))

(declare-fun res!1005661 () Bool)

(assert (=> b!1479780 (=> (not res!1005661) (not e!830020))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12197 0))(
  ( (MissingZero!12197 (index!51180 (_ BitVec 32))) (Found!12197 (index!51181 (_ BitVec 32))) (Intermediate!12197 (undefined!13009 Bool) (index!51182 (_ BitVec 32)) (x!132764 (_ BitVec 32))) (Undefined!12197) (MissingVacant!12197 (index!51183 (_ BitVec 32))) )
))
(declare-fun lt!646162 () SeekEntryResult!12197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99356 (_ BitVec 32)) SeekEntryResult!12197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479780 (= res!1005661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47957 a!2862) j!93) mask!2687) (select (arr!47957 a!2862) j!93) a!2862 mask!2687) lt!646162))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479780 (= lt!646162 (Intermediate!12197 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479781 () Bool)

(declare-fun e!830018 () Bool)

(declare-fun e!830023 () Bool)

(assert (=> b!1479781 (= e!830018 (not e!830023))))

(declare-fun res!1005662 () Bool)

(assert (=> b!1479781 (=> res!1005662 e!830023)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479781 (= res!1005662 (or (and (= (select (arr!47957 a!2862) index!646) (select (store (arr!47957 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47957 a!2862) index!646) (select (arr!47957 a!2862) j!93))) (not (= (select (arr!47957 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47957 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830026 () Bool)

(assert (=> b!1479781 e!830026))

(declare-fun res!1005654 () Bool)

(assert (=> b!1479781 (=> (not res!1005654) (not e!830026))))

(declare-fun lt!646167 () SeekEntryResult!12197)

(declare-fun lt!646166 () SeekEntryResult!12197)

(assert (=> b!1479781 (= res!1005654 (and (= lt!646166 lt!646167) (or (= (select (arr!47957 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47957 a!2862) intermediateBeforeIndex!19) (select (arr!47957 a!2862) j!93)))))))

(assert (=> b!1479781 (= lt!646167 (Found!12197 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99356 (_ BitVec 32)) SeekEntryResult!12197)

(assert (=> b!1479781 (= lt!646166 (seekEntryOrOpen!0 (select (arr!47957 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99356 (_ BitVec 32)) Bool)

(assert (=> b!1479781 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49734 0))(
  ( (Unit!49735) )
))
(declare-fun lt!646160 () Unit!49734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49734)

(assert (=> b!1479781 (= lt!646160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!830025 () Bool)

(declare-fun b!1479782 () Bool)

(assert (=> b!1479782 (= e!830025 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479783 () Bool)

(declare-fun res!1005659 () Bool)

(assert (=> b!1479783 (=> (not res!1005659) (not e!830022))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479783 (= res!1005659 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48507 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48507 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48507 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1005652 () Bool)

(assert (=> start!126250 (=> (not res!1005652) (not e!830022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126250 (= res!1005652 (validMask!0 mask!2687))))

(assert (=> start!126250 e!830022))

(assert (=> start!126250 true))

(declare-fun array_inv!36985 (array!99356) Bool)

(assert (=> start!126250 (array_inv!36985 a!2862)))

(declare-fun b!1479784 () Bool)

(declare-fun e!830021 () Bool)

(assert (=> b!1479784 (= e!830021 e!830025)))

(declare-fun res!1005663 () Bool)

(assert (=> b!1479784 (=> (not res!1005663) (not e!830025))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99356 (_ BitVec 32)) SeekEntryResult!12197)

(assert (=> b!1479784 (= res!1005663 (= lt!646166 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47957 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479785 () Bool)

(declare-fun res!1005658 () Bool)

(assert (=> b!1479785 (=> (not res!1005658) (not e!830022))))

(assert (=> b!1479785 (= res!1005658 (validKeyInArray!0 (select (arr!47957 a!2862) j!93)))))

(declare-fun b!1479786 () Bool)

(declare-fun res!1005657 () Bool)

(assert (=> b!1479786 (=> (not res!1005657) (not e!830020))))

(assert (=> b!1479786 (= res!1005657 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47957 a!2862) j!93) a!2862 mask!2687) lt!646162))))

(declare-fun b!1479787 () Bool)

(assert (=> b!1479787 (= e!830023 true)))

(declare-fun lt!646164 () array!99356)

(declare-fun lt!646165 () (_ BitVec 64))

(assert (=> b!1479787 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646165 lt!646164 mask!2687) lt!646167)))

(declare-fun lt!646163 () Unit!49734)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49734)

(assert (=> b!1479787 (= lt!646163 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479788 () Bool)

(assert (=> b!1479788 (= e!830020 e!830018)))

(declare-fun res!1005665 () Bool)

(assert (=> b!1479788 (=> (not res!1005665) (not e!830018))))

(declare-fun lt!646161 () SeekEntryResult!12197)

(assert (=> b!1479788 (= res!1005665 (= lt!646161 (Intermediate!12197 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479788 (= lt!646161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646165 mask!2687) lt!646165 lt!646164 mask!2687))))

(assert (=> b!1479788 (= lt!646165 (select (store (arr!47957 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479789 () Bool)

(declare-fun res!1005667 () Bool)

(assert (=> b!1479789 (=> (not res!1005667) (not e!830022))))

(assert (=> b!1479789 (= res!1005667 (and (= (size!48507 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48507 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48507 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479790 () Bool)

(assert (=> b!1479790 (= e!830022 e!830027)))

(declare-fun res!1005656 () Bool)

(assert (=> b!1479790 (=> (not res!1005656) (not e!830027))))

(assert (=> b!1479790 (= res!1005656 (= (select (store (arr!47957 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479790 (= lt!646164 (array!99357 (store (arr!47957 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48507 a!2862)))))

(declare-fun b!1479791 () Bool)

(declare-fun e!830019 () Bool)

(assert (=> b!1479791 (= e!830019 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646165 lt!646164 mask!2687) (seekEntryOrOpen!0 lt!646165 lt!646164 mask!2687)))))

(declare-fun b!1479792 () Bool)

(assert (=> b!1479792 (= e!830026 e!830021)))

(declare-fun res!1005660 () Bool)

(assert (=> b!1479792 (=> res!1005660 e!830021)))

(assert (=> b!1479792 (= res!1005660 (or (and (= (select (arr!47957 a!2862) index!646) (select (store (arr!47957 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47957 a!2862) index!646) (select (arr!47957 a!2862) j!93))) (not (= (select (arr!47957 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479793 () Bool)

(declare-fun res!1005666 () Bool)

(assert (=> b!1479793 (=> (not res!1005666) (not e!830018))))

(assert (=> b!1479793 (= res!1005666 e!830019)))

(declare-fun c!136584 () Bool)

(assert (=> b!1479793 (= c!136584 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479794 () Bool)

(assert (=> b!1479794 (= e!830019 (= lt!646161 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646165 lt!646164 mask!2687)))))

(declare-fun b!1479795 () Bool)

(declare-fun res!1005651 () Bool)

(assert (=> b!1479795 (=> (not res!1005651) (not e!830022))))

(declare-datatypes ((List!34458 0))(
  ( (Nil!34455) (Cons!34454 (h!35822 (_ BitVec 64)) (t!49152 List!34458)) )
))
(declare-fun arrayNoDuplicates!0 (array!99356 (_ BitVec 32) List!34458) Bool)

(assert (=> b!1479795 (= res!1005651 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34455))))

(declare-fun b!1479796 () Bool)

(declare-fun res!1005655 () Bool)

(assert (=> b!1479796 (=> (not res!1005655) (not e!830018))))

(assert (=> b!1479796 (= res!1005655 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479797 () Bool)

(declare-fun res!1005653 () Bool)

(assert (=> b!1479797 (=> (not res!1005653) (not e!830022))))

(assert (=> b!1479797 (= res!1005653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479798 () Bool)

(declare-fun res!1005664 () Bool)

(assert (=> b!1479798 (=> res!1005664 e!830023)))

(assert (=> b!1479798 (= res!1005664 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47957 a!2862) j!93) a!2862 mask!2687) lt!646167)))))

(assert (= (and start!126250 res!1005652) b!1479789))

(assert (= (and b!1479789 res!1005667) b!1479779))

(assert (= (and b!1479779 res!1005650) b!1479785))

(assert (= (and b!1479785 res!1005658) b!1479797))

(assert (= (and b!1479797 res!1005653) b!1479795))

(assert (= (and b!1479795 res!1005651) b!1479783))

(assert (= (and b!1479783 res!1005659) b!1479790))

(assert (= (and b!1479790 res!1005656) b!1479780))

(assert (= (and b!1479780 res!1005661) b!1479786))

(assert (= (and b!1479786 res!1005657) b!1479788))

(assert (= (and b!1479788 res!1005665) b!1479793))

(assert (= (and b!1479793 c!136584) b!1479794))

(assert (= (and b!1479793 (not c!136584)) b!1479791))

(assert (= (and b!1479793 res!1005666) b!1479796))

(assert (= (and b!1479796 res!1005655) b!1479781))

(assert (= (and b!1479781 res!1005654) b!1479792))

(assert (= (and b!1479792 (not res!1005660)) b!1479784))

(assert (= (and b!1479784 res!1005663) b!1479782))

(assert (= (and b!1479781 (not res!1005662)) b!1479798))

(assert (= (and b!1479798 (not res!1005664)) b!1479787))

(declare-fun m!1365625 () Bool)

(assert (=> b!1479786 m!1365625))

(assert (=> b!1479786 m!1365625))

(declare-fun m!1365627 () Bool)

(assert (=> b!1479786 m!1365627))

(declare-fun m!1365629 () Bool)

(assert (=> b!1479795 m!1365629))

(assert (=> b!1479798 m!1365625))

(assert (=> b!1479798 m!1365625))

(declare-fun m!1365631 () Bool)

(assert (=> b!1479798 m!1365631))

(declare-fun m!1365633 () Bool)

(assert (=> b!1479792 m!1365633))

(declare-fun m!1365635 () Bool)

(assert (=> b!1479792 m!1365635))

(declare-fun m!1365637 () Bool)

(assert (=> b!1479792 m!1365637))

(assert (=> b!1479792 m!1365625))

(assert (=> b!1479785 m!1365625))

(assert (=> b!1479785 m!1365625))

(declare-fun m!1365639 () Bool)

(assert (=> b!1479785 m!1365639))

(assert (=> b!1479780 m!1365625))

(assert (=> b!1479780 m!1365625))

(declare-fun m!1365641 () Bool)

(assert (=> b!1479780 m!1365641))

(assert (=> b!1479780 m!1365641))

(assert (=> b!1479780 m!1365625))

(declare-fun m!1365643 () Bool)

(assert (=> b!1479780 m!1365643))

(declare-fun m!1365645 () Bool)

(assert (=> b!1479794 m!1365645))

(declare-fun m!1365647 () Bool)

(assert (=> b!1479788 m!1365647))

(assert (=> b!1479788 m!1365647))

(declare-fun m!1365649 () Bool)

(assert (=> b!1479788 m!1365649))

(assert (=> b!1479788 m!1365635))

(declare-fun m!1365651 () Bool)

(assert (=> b!1479788 m!1365651))

(declare-fun m!1365653 () Bool)

(assert (=> b!1479787 m!1365653))

(declare-fun m!1365655 () Bool)

(assert (=> b!1479787 m!1365655))

(assert (=> b!1479790 m!1365635))

(declare-fun m!1365657 () Bool)

(assert (=> b!1479790 m!1365657))

(declare-fun m!1365659 () Bool)

(assert (=> b!1479797 m!1365659))

(declare-fun m!1365661 () Bool)

(assert (=> start!126250 m!1365661))

(declare-fun m!1365663 () Bool)

(assert (=> start!126250 m!1365663))

(assert (=> b!1479784 m!1365625))

(assert (=> b!1479784 m!1365625))

(declare-fun m!1365665 () Bool)

(assert (=> b!1479784 m!1365665))

(declare-fun m!1365667 () Bool)

(assert (=> b!1479781 m!1365667))

(assert (=> b!1479781 m!1365635))

(declare-fun m!1365669 () Bool)

(assert (=> b!1479781 m!1365669))

(assert (=> b!1479781 m!1365637))

(assert (=> b!1479781 m!1365633))

(assert (=> b!1479781 m!1365625))

(declare-fun m!1365671 () Bool)

(assert (=> b!1479781 m!1365671))

(declare-fun m!1365673 () Bool)

(assert (=> b!1479781 m!1365673))

(assert (=> b!1479781 m!1365625))

(assert (=> b!1479791 m!1365653))

(declare-fun m!1365675 () Bool)

(assert (=> b!1479791 m!1365675))

(declare-fun m!1365677 () Bool)

(assert (=> b!1479779 m!1365677))

(assert (=> b!1479779 m!1365677))

(declare-fun m!1365679 () Bool)

(assert (=> b!1479779 m!1365679))

(push 1)

