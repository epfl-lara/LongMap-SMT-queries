; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126434 () Bool)

(assert start!126434)

(declare-fun b!1482667 () Bool)

(declare-fun e!831387 () Bool)

(declare-fun e!831388 () Bool)

(assert (=> b!1482667 (= e!831387 e!831388)))

(declare-fun res!1007821 () Bool)

(assert (=> b!1482667 (=> (not res!1007821) (not e!831388))))

(declare-datatypes ((SeekEntryResult!12239 0))(
  ( (MissingZero!12239 (index!51348 (_ BitVec 32))) (Found!12239 (index!51349 (_ BitVec 32))) (Intermediate!12239 (undefined!13051 Bool) (index!51350 (_ BitVec 32)) (x!132932 (_ BitVec 32))) (Undefined!12239) (MissingVacant!12239 (index!51351 (_ BitVec 32))) )
))
(declare-fun lt!646989 () SeekEntryResult!12239)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482667 (= res!1007821 (= lt!646989 (Intermediate!12239 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646993 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99394 0))(
  ( (array!99395 (arr!47974 (Array (_ BitVec 32) (_ BitVec 64))) (size!48526 (_ BitVec 32))) )
))
(declare-fun lt!646988 () array!99394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482667 (= lt!646989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646993 mask!2687) lt!646993 lt!646988 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99394)

(assert (=> b!1482667 (= lt!646993 (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482668 () Bool)

(declare-fun e!831382 () Bool)

(assert (=> b!1482668 (= e!831382 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646990 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482668 (= lt!646990 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1482669 () Bool)

(declare-fun res!1007806 () Bool)

(assert (=> b!1482669 (=> (not res!1007806) (not e!831388))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482669 (= res!1007806 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482670 () Bool)

(declare-fun e!831386 () Bool)

(declare-fun e!831385 () Bool)

(assert (=> b!1482670 (= e!831386 e!831385)))

(declare-fun res!1007808 () Bool)

(assert (=> b!1482670 (=> (not res!1007808) (not e!831385))))

(assert (=> b!1482670 (= res!1007808 (= (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482670 (= lt!646988 (array!99395 (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48526 a!2862)))))

(declare-fun b!1482671 () Bool)

(declare-fun res!1007804 () Bool)

(declare-fun e!831380 () Bool)

(assert (=> b!1482671 (=> (not res!1007804) (not e!831380))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12239)

(assert (=> b!1482671 (= res!1007804 (= (seekEntryOrOpen!0 (select (arr!47974 a!2862) j!93) a!2862 mask!2687) (Found!12239 j!93)))))

(declare-fun b!1482672 () Bool)

(declare-fun res!1007814 () Bool)

(assert (=> b!1482672 (=> (not res!1007814) (not e!831388))))

(declare-fun e!831384 () Bool)

(assert (=> b!1482672 (= res!1007814 e!831384)))

(declare-fun c!136957 () Bool)

(assert (=> b!1482672 (= c!136957 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1007810 () Bool)

(assert (=> start!126434 (=> (not res!1007810) (not e!831386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126434 (= res!1007810 (validMask!0 mask!2687))))

(assert (=> start!126434 e!831386))

(assert (=> start!126434 true))

(declare-fun array_inv!37207 (array!99394) Bool)

(assert (=> start!126434 (array_inv!37207 a!2862)))

(declare-fun b!1482673 () Bool)

(declare-fun res!1007819 () Bool)

(assert (=> b!1482673 (=> (not res!1007819) (not e!831386))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1482673 (= res!1007819 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48526 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48526 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48526 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482674 () Bool)

(declare-fun res!1007815 () Bool)

(assert (=> b!1482674 (=> (not res!1007815) (not e!831386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482674 (= res!1007815 (validKeyInArray!0 (select (arr!47974 a!2862) i!1006)))))

(declare-fun b!1482675 () Bool)

(declare-fun res!1007811 () Bool)

(assert (=> b!1482675 (=> (not res!1007811) (not e!831386))))

(declare-datatypes ((List!34553 0))(
  ( (Nil!34550) (Cons!34549 (h!35923 (_ BitVec 64)) (t!49239 List!34553)) )
))
(declare-fun arrayNoDuplicates!0 (array!99394 (_ BitVec 32) List!34553) Bool)

(assert (=> b!1482675 (= res!1007811 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34550))))

(declare-fun b!1482676 () Bool)

(assert (=> b!1482676 (= e!831384 (= lt!646989 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646993 lt!646988 mask!2687)))))

(declare-fun b!1482677 () Bool)

(declare-fun res!1007812 () Bool)

(assert (=> b!1482677 (=> (not res!1007812) (not e!831387))))

(declare-fun lt!646992 () SeekEntryResult!12239)

(assert (=> b!1482677 (= res!1007812 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646992))))

(declare-fun b!1482678 () Bool)

(declare-fun e!831383 () Bool)

(assert (=> b!1482678 (= e!831380 e!831383)))

(declare-fun res!1007805 () Bool)

(assert (=> b!1482678 (=> res!1007805 e!831383)))

(declare-fun lt!646994 () (_ BitVec 64))

(assert (=> b!1482678 (= res!1007805 (or (and (= (select (arr!47974 a!2862) index!646) lt!646994) (= (select (arr!47974 a!2862) index!646) (select (arr!47974 a!2862) j!93))) (= (select (arr!47974 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482678 (= lt!646994 (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1482679 () Bool)

(declare-fun e!831389 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99394 (_ BitVec 32)) SeekEntryResult!12239)

(assert (=> b!1482679 (= e!831389 (= (seekEntryOrOpen!0 lt!646993 lt!646988 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646993 lt!646988 mask!2687)))))

(declare-fun b!1482680 () Bool)

(declare-fun res!1007816 () Bool)

(assert (=> b!1482680 (=> (not res!1007816) (not e!831386))))

(assert (=> b!1482680 (= res!1007816 (and (= (size!48526 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48526 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48526 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482681 () Bool)

(declare-fun res!1007820 () Bool)

(assert (=> b!1482681 (=> (not res!1007820) (not e!831386))))

(assert (=> b!1482681 (= res!1007820 (validKeyInArray!0 (select (arr!47974 a!2862) j!93)))))

(declare-fun b!1482682 () Bool)

(declare-fun res!1007803 () Bool)

(assert (=> b!1482682 (=> (not res!1007803) (not e!831386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99394 (_ BitVec 32)) Bool)

(assert (=> b!1482682 (= res!1007803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482683 () Bool)

(assert (=> b!1482683 (= e!831388 (not e!831382))))

(declare-fun res!1007807 () Bool)

(assert (=> b!1482683 (=> res!1007807 e!831382)))

(assert (=> b!1482683 (= res!1007807 (or (and (= (select (arr!47974 a!2862) index!646) (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47974 a!2862) index!646) (select (arr!47974 a!2862) j!93))) (= (select (arr!47974 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482683 e!831380))

(declare-fun res!1007817 () Bool)

(assert (=> b!1482683 (=> (not res!1007817) (not e!831380))))

(assert (=> b!1482683 (= res!1007817 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49659 0))(
  ( (Unit!49660) )
))
(declare-fun lt!646991 () Unit!49659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49659)

(assert (=> b!1482683 (= lt!646991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482684 () Bool)

(assert (=> b!1482684 (= e!831384 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646993 lt!646988 mask!2687) (seekEntryOrOpen!0 lt!646993 lt!646988 mask!2687)))))

(declare-fun b!1482685 () Bool)

(assert (=> b!1482685 (= e!831383 e!831389)))

(declare-fun res!1007818 () Bool)

(assert (=> b!1482685 (=> (not res!1007818) (not e!831389))))

(assert (=> b!1482685 (= res!1007818 (and (= index!646 intermediateAfterIndex!19) (= lt!646994 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482686 () Bool)

(assert (=> b!1482686 (= e!831385 e!831387)))

(declare-fun res!1007809 () Bool)

(assert (=> b!1482686 (=> (not res!1007809) (not e!831387))))

(assert (=> b!1482686 (= res!1007809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47974 a!2862) j!93) mask!2687) (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646992))))

(assert (=> b!1482686 (= lt!646992 (Intermediate!12239 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482687 () Bool)

(declare-fun res!1007813 () Bool)

(assert (=> b!1482687 (=> (not res!1007813) (not e!831380))))

(assert (=> b!1482687 (= res!1007813 (or (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) (select (arr!47974 a!2862) j!93))))))

(assert (= (and start!126434 res!1007810) b!1482680))

(assert (= (and b!1482680 res!1007816) b!1482674))

(assert (= (and b!1482674 res!1007815) b!1482681))

(assert (= (and b!1482681 res!1007820) b!1482682))

(assert (= (and b!1482682 res!1007803) b!1482675))

(assert (= (and b!1482675 res!1007811) b!1482673))

(assert (= (and b!1482673 res!1007819) b!1482670))

(assert (= (and b!1482670 res!1007808) b!1482686))

(assert (= (and b!1482686 res!1007809) b!1482677))

(assert (= (and b!1482677 res!1007812) b!1482667))

(assert (= (and b!1482667 res!1007821) b!1482672))

(assert (= (and b!1482672 c!136957) b!1482676))

(assert (= (and b!1482672 (not c!136957)) b!1482684))

(assert (= (and b!1482672 res!1007814) b!1482669))

(assert (= (and b!1482669 res!1007806) b!1482683))

(assert (= (and b!1482683 res!1007817) b!1482671))

(assert (= (and b!1482671 res!1007804) b!1482687))

(assert (= (and b!1482687 res!1007813) b!1482678))

(assert (= (and b!1482678 (not res!1007805)) b!1482685))

(assert (= (and b!1482685 res!1007818) b!1482679))

(assert (= (and b!1482683 (not res!1007807)) b!1482668))

(declare-fun m!1367685 () Bool)

(assert (=> b!1482674 m!1367685))

(assert (=> b!1482674 m!1367685))

(declare-fun m!1367687 () Bool)

(assert (=> b!1482674 m!1367687))

(declare-fun m!1367689 () Bool)

(assert (=> b!1482681 m!1367689))

(assert (=> b!1482681 m!1367689))

(declare-fun m!1367691 () Bool)

(assert (=> b!1482681 m!1367691))

(declare-fun m!1367693 () Bool)

(assert (=> b!1482667 m!1367693))

(assert (=> b!1482667 m!1367693))

(declare-fun m!1367695 () Bool)

(assert (=> b!1482667 m!1367695))

(declare-fun m!1367697 () Bool)

(assert (=> b!1482667 m!1367697))

(declare-fun m!1367699 () Bool)

(assert (=> b!1482667 m!1367699))

(declare-fun m!1367701 () Bool)

(assert (=> start!126434 m!1367701))

(declare-fun m!1367703 () Bool)

(assert (=> start!126434 m!1367703))

(assert (=> b!1482670 m!1367697))

(declare-fun m!1367705 () Bool)

(assert (=> b!1482670 m!1367705))

(declare-fun m!1367707 () Bool)

(assert (=> b!1482684 m!1367707))

(declare-fun m!1367709 () Bool)

(assert (=> b!1482684 m!1367709))

(declare-fun m!1367711 () Bool)

(assert (=> b!1482687 m!1367711))

(assert (=> b!1482687 m!1367689))

(declare-fun m!1367713 () Bool)

(assert (=> b!1482682 m!1367713))

(declare-fun m!1367715 () Bool)

(assert (=> b!1482678 m!1367715))

(assert (=> b!1482678 m!1367689))

(assert (=> b!1482678 m!1367697))

(declare-fun m!1367717 () Bool)

(assert (=> b!1482678 m!1367717))

(declare-fun m!1367719 () Bool)

(assert (=> b!1482675 m!1367719))

(assert (=> b!1482671 m!1367689))

(assert (=> b!1482671 m!1367689))

(declare-fun m!1367721 () Bool)

(assert (=> b!1482671 m!1367721))

(declare-fun m!1367723 () Bool)

(assert (=> b!1482683 m!1367723))

(assert (=> b!1482683 m!1367697))

(assert (=> b!1482683 m!1367717))

(assert (=> b!1482683 m!1367715))

(declare-fun m!1367725 () Bool)

(assert (=> b!1482683 m!1367725))

(assert (=> b!1482683 m!1367689))

(assert (=> b!1482677 m!1367689))

(assert (=> b!1482677 m!1367689))

(declare-fun m!1367727 () Bool)

(assert (=> b!1482677 m!1367727))

(assert (=> b!1482686 m!1367689))

(assert (=> b!1482686 m!1367689))

(declare-fun m!1367729 () Bool)

(assert (=> b!1482686 m!1367729))

(assert (=> b!1482686 m!1367729))

(assert (=> b!1482686 m!1367689))

(declare-fun m!1367731 () Bool)

(assert (=> b!1482686 m!1367731))

(declare-fun m!1367733 () Bool)

(assert (=> b!1482668 m!1367733))

(assert (=> b!1482679 m!1367709))

(assert (=> b!1482679 m!1367707))

(declare-fun m!1367735 () Bool)

(assert (=> b!1482676 m!1367735))

(check-sat (not b!1482679) (not b!1482675) (not b!1482684) (not b!1482681) (not b!1482686) (not b!1482668) (not start!126434) (not b!1482674) (not b!1482682) (not b!1482667) (not b!1482676) (not b!1482671) (not b!1482683) (not b!1482677))
(check-sat)
