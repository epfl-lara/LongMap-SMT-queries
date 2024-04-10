; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126214 () Bool)

(assert start!126214)

(declare-fun res!1004737 () Bool)

(declare-fun e!829506 () Bool)

(assert (=> start!126214 (=> (not res!1004737) (not e!829506))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126214 (= res!1004737 (validMask!0 mask!2687))))

(assert (=> start!126214 e!829506))

(assert (=> start!126214 true))

(declare-datatypes ((array!99320 0))(
  ( (array!99321 (arr!47939 (Array (_ BitVec 32) (_ BitVec 64))) (size!48489 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99320)

(declare-fun array_inv!36967 (array!99320) Bool)

(assert (=> start!126214 (array_inv!36967 a!2862)))

(declare-fun b!1478758 () Bool)

(declare-fun res!1004743 () Bool)

(assert (=> b!1478758 (=> (not res!1004743) (not e!829506))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478758 (= res!1004743 (validKeyInArray!0 (select (arr!47939 a!2862) j!93)))))

(declare-fun b!1478759 () Bool)

(declare-fun e!829505 () Bool)

(assert (=> b!1478759 (= e!829506 e!829505)))

(declare-fun res!1004740 () Bool)

(assert (=> b!1478759 (=> (not res!1004740) (not e!829505))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478759 (= res!1004740 (= (select (store (arr!47939 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645788 () array!99320)

(assert (=> b!1478759 (= lt!645788 (array!99321 (store (arr!47939 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48489 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!829509 () Bool)

(declare-datatypes ((SeekEntryResult!12179 0))(
  ( (MissingZero!12179 (index!51108 (_ BitVec 32))) (Found!12179 (index!51109 (_ BitVec 32))) (Intermediate!12179 (undefined!12991 Bool) (index!51110 (_ BitVec 32)) (x!132698 (_ BitVec 32))) (Undefined!12179) (MissingVacant!12179 (index!51111 (_ BitVec 32))) )
))
(declare-fun lt!645787 () SeekEntryResult!12179)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1478760 () Bool)

(declare-fun lt!645791 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12179)

(assert (=> b!1478760 (= e!829509 (= lt!645787 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645791 lt!645788 mask!2687)))))

(declare-fun b!1478761 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12179)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99320 (_ BitVec 32)) SeekEntryResult!12179)

(assert (=> b!1478761 (= e!829509 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645791 lt!645788 mask!2687) (seekEntryOrOpen!0 lt!645791 lt!645788 mask!2687)))))

(declare-fun b!1478762 () Bool)

(declare-fun res!1004738 () Bool)

(assert (=> b!1478762 (=> (not res!1004738) (not e!829506))))

(assert (=> b!1478762 (= res!1004738 (validKeyInArray!0 (select (arr!47939 a!2862) i!1006)))))

(declare-fun b!1478763 () Bool)

(declare-fun e!829510 () Bool)

(declare-fun e!829503 () Bool)

(assert (=> b!1478763 (= e!829510 e!829503)))

(declare-fun res!1004744 () Bool)

(assert (=> b!1478763 (=> res!1004744 e!829503)))

(assert (=> b!1478763 (= res!1004744 (or (and (= (select (arr!47939 a!2862) index!646) (select (store (arr!47939 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47939 a!2862) index!646) (select (arr!47939 a!2862) j!93))) (not (= (select (arr!47939 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478764 () Bool)

(declare-fun res!1004751 () Bool)

(assert (=> b!1478764 (=> (not res!1004751) (not e!829506))))

(assert (=> b!1478764 (= res!1004751 (and (= (size!48489 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48489 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48489 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478765 () Bool)

(declare-fun e!829507 () Bool)

(assert (=> b!1478765 (= e!829505 e!829507)))

(declare-fun res!1004742 () Bool)

(assert (=> b!1478765 (=> (not res!1004742) (not e!829507))))

(declare-fun lt!645790 () SeekEntryResult!12179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478765 (= res!1004742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47939 a!2862) j!93) mask!2687) (select (arr!47939 a!2862) j!93) a!2862 mask!2687) lt!645790))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478765 (= lt!645790 (Intermediate!12179 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478766 () Bool)

(declare-fun res!1004745 () Bool)

(assert (=> b!1478766 (=> (not res!1004745) (not e!829506))))

(declare-datatypes ((List!34440 0))(
  ( (Nil!34437) (Cons!34436 (h!35804 (_ BitVec 64)) (t!49134 List!34440)) )
))
(declare-fun arrayNoDuplicates!0 (array!99320 (_ BitVec 32) List!34440) Bool)

(assert (=> b!1478766 (= res!1004745 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34437))))

(declare-fun b!1478767 () Bool)

(declare-fun e!829508 () Bool)

(assert (=> b!1478767 (= e!829503 e!829508)))

(declare-fun res!1004749 () Bool)

(assert (=> b!1478767 (=> (not res!1004749) (not e!829508))))

(declare-fun lt!645789 () SeekEntryResult!12179)

(assert (=> b!1478767 (= res!1004749 (= lt!645789 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47939 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478768 () Bool)

(declare-fun res!1004746 () Bool)

(assert (=> b!1478768 (=> (not res!1004746) (not e!829507))))

(assert (=> b!1478768 (= res!1004746 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47939 a!2862) j!93) a!2862 mask!2687) lt!645790))))

(declare-fun b!1478769 () Bool)

(declare-fun e!829504 () Bool)

(assert (=> b!1478769 (= e!829504 (not true))))

(assert (=> b!1478769 e!829510))

(declare-fun res!1004741 () Bool)

(assert (=> b!1478769 (=> (not res!1004741) (not e!829510))))

(assert (=> b!1478769 (= res!1004741 (and (= lt!645789 (Found!12179 j!93)) (or (= (select (arr!47939 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47939 a!2862) intermediateBeforeIndex!19) (select (arr!47939 a!2862) j!93)))))))

(assert (=> b!1478769 (= lt!645789 (seekEntryOrOpen!0 (select (arr!47939 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99320 (_ BitVec 32)) Bool)

(assert (=> b!1478769 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49698 0))(
  ( (Unit!49699) )
))
(declare-fun lt!645792 () Unit!49698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49698)

(assert (=> b!1478769 (= lt!645792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478770 () Bool)

(declare-fun res!1004750 () Bool)

(assert (=> b!1478770 (=> (not res!1004750) (not e!829504))))

(assert (=> b!1478770 (= res!1004750 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478771 () Bool)

(declare-fun res!1004752 () Bool)

(assert (=> b!1478771 (=> (not res!1004752) (not e!829506))))

(assert (=> b!1478771 (= res!1004752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478772 () Bool)

(declare-fun res!1004739 () Bool)

(assert (=> b!1478772 (=> (not res!1004739) (not e!829504))))

(assert (=> b!1478772 (= res!1004739 e!829509)))

(declare-fun c!136530 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478772 (= c!136530 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478773 () Bool)

(assert (=> b!1478773 (= e!829507 e!829504)))

(declare-fun res!1004748 () Bool)

(assert (=> b!1478773 (=> (not res!1004748) (not e!829504))))

(assert (=> b!1478773 (= res!1004748 (= lt!645787 (Intermediate!12179 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478773 (= lt!645787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645791 mask!2687) lt!645791 lt!645788 mask!2687))))

(assert (=> b!1478773 (= lt!645791 (select (store (arr!47939 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478774 () Bool)

(declare-fun res!1004747 () Bool)

(assert (=> b!1478774 (=> (not res!1004747) (not e!829506))))

(assert (=> b!1478774 (= res!1004747 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48489 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48489 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48489 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478775 () Bool)

(assert (=> b!1478775 (= e!829508 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126214 res!1004737) b!1478764))

(assert (= (and b!1478764 res!1004751) b!1478762))

(assert (= (and b!1478762 res!1004738) b!1478758))

(assert (= (and b!1478758 res!1004743) b!1478771))

(assert (= (and b!1478771 res!1004752) b!1478766))

(assert (= (and b!1478766 res!1004745) b!1478774))

(assert (= (and b!1478774 res!1004747) b!1478759))

(assert (= (and b!1478759 res!1004740) b!1478765))

(assert (= (and b!1478765 res!1004742) b!1478768))

(assert (= (and b!1478768 res!1004746) b!1478773))

(assert (= (and b!1478773 res!1004748) b!1478772))

(assert (= (and b!1478772 c!136530) b!1478760))

(assert (= (and b!1478772 (not c!136530)) b!1478761))

(assert (= (and b!1478772 res!1004739) b!1478770))

(assert (= (and b!1478770 res!1004750) b!1478769))

(assert (= (and b!1478769 res!1004741) b!1478763))

(assert (= (and b!1478763 (not res!1004744)) b!1478767))

(assert (= (and b!1478767 res!1004749) b!1478775))

(declare-fun m!1364659 () Bool)

(assert (=> b!1478768 m!1364659))

(assert (=> b!1478768 m!1364659))

(declare-fun m!1364661 () Bool)

(assert (=> b!1478768 m!1364661))

(declare-fun m!1364663 () Bool)

(assert (=> b!1478762 m!1364663))

(assert (=> b!1478762 m!1364663))

(declare-fun m!1364665 () Bool)

(assert (=> b!1478762 m!1364665))

(declare-fun m!1364667 () Bool)

(assert (=> b!1478761 m!1364667))

(declare-fun m!1364669 () Bool)

(assert (=> b!1478761 m!1364669))

(declare-fun m!1364671 () Bool)

(assert (=> b!1478771 m!1364671))

(declare-fun m!1364673 () Bool)

(assert (=> b!1478759 m!1364673))

(declare-fun m!1364675 () Bool)

(assert (=> b!1478759 m!1364675))

(declare-fun m!1364677 () Bool)

(assert (=> b!1478763 m!1364677))

(assert (=> b!1478763 m!1364673))

(declare-fun m!1364679 () Bool)

(assert (=> b!1478763 m!1364679))

(assert (=> b!1478763 m!1364659))

(declare-fun m!1364681 () Bool)

(assert (=> b!1478766 m!1364681))

(assert (=> b!1478765 m!1364659))

(assert (=> b!1478765 m!1364659))

(declare-fun m!1364683 () Bool)

(assert (=> b!1478765 m!1364683))

(assert (=> b!1478765 m!1364683))

(assert (=> b!1478765 m!1364659))

(declare-fun m!1364685 () Bool)

(assert (=> b!1478765 m!1364685))

(assert (=> b!1478758 m!1364659))

(assert (=> b!1478758 m!1364659))

(declare-fun m!1364687 () Bool)

(assert (=> b!1478758 m!1364687))

(declare-fun m!1364689 () Bool)

(assert (=> b!1478760 m!1364689))

(declare-fun m!1364691 () Bool)

(assert (=> b!1478769 m!1364691))

(declare-fun m!1364693 () Bool)

(assert (=> b!1478769 m!1364693))

(assert (=> b!1478769 m!1364659))

(declare-fun m!1364695 () Bool)

(assert (=> b!1478769 m!1364695))

(declare-fun m!1364697 () Bool)

(assert (=> b!1478769 m!1364697))

(assert (=> b!1478769 m!1364659))

(assert (=> b!1478767 m!1364659))

(assert (=> b!1478767 m!1364659))

(declare-fun m!1364699 () Bool)

(assert (=> b!1478767 m!1364699))

(declare-fun m!1364701 () Bool)

(assert (=> start!126214 m!1364701))

(declare-fun m!1364703 () Bool)

(assert (=> start!126214 m!1364703))

(declare-fun m!1364705 () Bool)

(assert (=> b!1478773 m!1364705))

(assert (=> b!1478773 m!1364705))

(declare-fun m!1364707 () Bool)

(assert (=> b!1478773 m!1364707))

(assert (=> b!1478773 m!1364673))

(declare-fun m!1364709 () Bool)

(assert (=> b!1478773 m!1364709))

(push 1)

