; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125096 () Bool)

(assert start!125096)

(declare-datatypes ((SeekEntryResult!11812 0))(
  ( (MissingZero!11812 (index!49640 (_ BitVec 32))) (Found!11812 (index!49641 (_ BitVec 32))) (Intermediate!11812 (undefined!12624 Bool) (index!49642 (_ BitVec 32)) (x!131261 (_ BitVec 32))) (Undefined!11812) (MissingVacant!11812 (index!49643 (_ BitVec 32))) )
))
(declare-fun lt!638453 () SeekEntryResult!11812)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98544 0))(
  ( (array!98545 (arr!47560 (Array (_ BitVec 32) (_ BitVec 64))) (size!48110 (_ BitVec 32))) )
))
(declare-fun lt!638451 () array!98544)

(declare-fun e!819604 () Bool)

(declare-fun lt!638454 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1456812 () Bool)

(declare-fun lt!638456 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98544 (_ BitVec 32)) SeekEntryResult!11812)

(assert (=> b!1456812 (= e!819604 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638456 intermediateAfterIndex!19 lt!638454 lt!638451 mask!2687) lt!638453)))))

(declare-fun b!1456813 () Bool)

(declare-fun res!987244 () Bool)

(declare-fun e!819603 () Bool)

(assert (=> b!1456813 (=> (not res!987244) (not e!819603))))

(declare-fun a!2862 () array!98544)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456813 (= res!987244 (validKeyInArray!0 (select (arr!47560 a!2862) j!93)))))

(declare-fun b!1456814 () Bool)

(declare-fun e!819611 () Bool)

(declare-fun e!819602 () Bool)

(assert (=> b!1456814 (= e!819611 e!819602)))

(declare-fun res!987235 () Bool)

(assert (=> b!1456814 (=> (not res!987235) (not e!819602))))

(declare-fun lt!638455 () SeekEntryResult!11812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98544 (_ BitVec 32)) SeekEntryResult!11812)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456814 (= res!987235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47560 a!2862) j!93) mask!2687) (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638455))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456814 (= lt!638455 (Intermediate!11812 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456815 () Bool)

(declare-fun res!987232 () Bool)

(declare-fun e!819609 () Bool)

(assert (=> b!1456815 (=> (not res!987232) (not e!819609))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98544 (_ BitVec 32)) SeekEntryResult!11812)

(assert (=> b!1456815 (= res!987232 (= (seekEntryOrOpen!0 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) (Found!11812 j!93)))))

(declare-fun b!1456816 () Bool)

(declare-fun res!987234 () Bool)

(assert (=> b!1456816 (=> (not res!987234) (not e!819602))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1456816 (= res!987234 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638455))))

(declare-fun b!1456817 () Bool)

(declare-fun res!987238 () Bool)

(assert (=> b!1456817 (=> (not res!987238) (not e!819603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98544 (_ BitVec 32)) Bool)

(assert (=> b!1456817 (= res!987238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!987237 () Bool)

(assert (=> start!125096 (=> (not res!987237) (not e!819603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125096 (= res!987237 (validMask!0 mask!2687))))

(assert (=> start!125096 e!819603))

(assert (=> start!125096 true))

(declare-fun array_inv!36588 (array!98544) Bool)

(assert (=> start!125096 (array_inv!36588 a!2862)))

(declare-fun b!1456818 () Bool)

(declare-fun res!987242 () Bool)

(declare-fun e!819605 () Bool)

(assert (=> b!1456818 (=> (not res!987242) (not e!819605))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456818 (= res!987242 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456819 () Bool)

(declare-fun res!987240 () Bool)

(assert (=> b!1456819 (=> (not res!987240) (not e!819603))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456819 (= res!987240 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48110 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48110 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48110 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456820 () Bool)

(assert (=> b!1456820 (= e!819603 e!819611)))

(declare-fun res!987243 () Bool)

(assert (=> b!1456820 (=> (not res!987243) (not e!819611))))

(assert (=> b!1456820 (= res!987243 (= (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456820 (= lt!638451 (array!98545 (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48110 a!2862)))))

(declare-fun b!1456821 () Bool)

(declare-fun res!987228 () Bool)

(assert (=> b!1456821 (=> (not res!987228) (not e!819605))))

(declare-fun e!819607 () Bool)

(assert (=> b!1456821 (= res!987228 e!819607)))

(declare-fun c!134304 () Bool)

(assert (=> b!1456821 (= c!134304 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456822 () Bool)

(assert (=> b!1456822 (= e!819609 (and (or (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47560 a!2862) intermediateBeforeIndex!19) (select (arr!47560 a!2862) j!93))) (let ((bdg!53275 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47560 a!2862) index!646) bdg!53275) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53275 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456823 () Bool)

(declare-fun res!987230 () Bool)

(assert (=> b!1456823 (=> (not res!987230) (not e!819603))))

(assert (=> b!1456823 (= res!987230 (validKeyInArray!0 (select (arr!47560 a!2862) i!1006)))))

(declare-fun b!1456824 () Bool)

(assert (=> b!1456824 (= e!819607 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638454 lt!638451 mask!2687) (seekEntryOrOpen!0 lt!638454 lt!638451 mask!2687)))))

(declare-fun b!1456825 () Bool)

(declare-fun e!819606 () Bool)

(assert (=> b!1456825 (= e!819606 true)))

(declare-fun lt!638450 () Bool)

(assert (=> b!1456825 (= lt!638450 e!819604)))

(declare-fun c!134303 () Bool)

(assert (=> b!1456825 (= c!134303 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456826 () Bool)

(declare-fun e!819608 () Bool)

(assert (=> b!1456826 (= e!819608 e!819606)))

(declare-fun res!987229 () Bool)

(assert (=> b!1456826 (=> res!987229 e!819606)))

(assert (=> b!1456826 (= res!987229 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638456 #b00000000000000000000000000000000) (bvsge lt!638456 (size!48110 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456826 (= lt!638456 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456826 (= lt!638453 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638454 lt!638451 mask!2687))))

(assert (=> b!1456826 (= lt!638453 (seekEntryOrOpen!0 lt!638454 lt!638451 mask!2687))))

(declare-fun b!1456827 () Bool)

(assert (=> b!1456827 (= e!819602 e!819605)))

(declare-fun res!987233 () Bool)

(assert (=> b!1456827 (=> (not res!987233) (not e!819605))))

(declare-fun lt!638452 () SeekEntryResult!11812)

(assert (=> b!1456827 (= res!987233 (= lt!638452 (Intermediate!11812 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456827 (= lt!638452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638454 mask!2687) lt!638454 lt!638451 mask!2687))))

(assert (=> b!1456827 (= lt!638454 (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456828 () Bool)

(declare-fun res!987241 () Bool)

(assert (=> b!1456828 (=> (not res!987241) (not e!819603))))

(declare-datatypes ((List!34061 0))(
  ( (Nil!34058) (Cons!34057 (h!35407 (_ BitVec 64)) (t!48755 List!34061)) )
))
(declare-fun arrayNoDuplicates!0 (array!98544 (_ BitVec 32) List!34061) Bool)

(assert (=> b!1456828 (= res!987241 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34058))))

(declare-fun b!1456829 () Bool)

(assert (=> b!1456829 (= e!819604 (not (= lt!638452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638456 lt!638454 lt!638451 mask!2687))))))

(declare-fun b!1456830 () Bool)

(declare-fun res!987239 () Bool)

(assert (=> b!1456830 (=> res!987239 e!819606)))

(assert (=> b!1456830 (= res!987239 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638456 (select (arr!47560 a!2862) j!93) a!2862 mask!2687) lt!638455)))))

(declare-fun b!1456831 () Bool)

(declare-fun res!987231 () Bool)

(assert (=> b!1456831 (=> (not res!987231) (not e!819603))))

(assert (=> b!1456831 (= res!987231 (and (= (size!48110 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48110 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48110 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456832 () Bool)

(assert (=> b!1456832 (= e!819607 (= lt!638452 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638454 lt!638451 mask!2687)))))

(declare-fun b!1456833 () Bool)

(assert (=> b!1456833 (= e!819605 (not e!819608))))

(declare-fun res!987227 () Bool)

(assert (=> b!1456833 (=> res!987227 e!819608)))

(assert (=> b!1456833 (= res!987227 (or (and (= (select (arr!47560 a!2862) index!646) (select (store (arr!47560 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47560 a!2862) index!646) (select (arr!47560 a!2862) j!93))) (= (select (arr!47560 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456833 e!819609))

(declare-fun res!987236 () Bool)

(assert (=> b!1456833 (=> (not res!987236) (not e!819609))))

(assert (=> b!1456833 (= res!987236 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49120 0))(
  ( (Unit!49121) )
))
(declare-fun lt!638457 () Unit!49120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49120)

(assert (=> b!1456833 (= lt!638457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125096 res!987237) b!1456831))

(assert (= (and b!1456831 res!987231) b!1456823))

(assert (= (and b!1456823 res!987230) b!1456813))

(assert (= (and b!1456813 res!987244) b!1456817))

(assert (= (and b!1456817 res!987238) b!1456828))

(assert (= (and b!1456828 res!987241) b!1456819))

(assert (= (and b!1456819 res!987240) b!1456820))

(assert (= (and b!1456820 res!987243) b!1456814))

(assert (= (and b!1456814 res!987235) b!1456816))

(assert (= (and b!1456816 res!987234) b!1456827))

(assert (= (and b!1456827 res!987233) b!1456821))

(assert (= (and b!1456821 c!134304) b!1456832))

(assert (= (and b!1456821 (not c!134304)) b!1456824))

(assert (= (and b!1456821 res!987228) b!1456818))

(assert (= (and b!1456818 res!987242) b!1456833))

(assert (= (and b!1456833 res!987236) b!1456815))

(assert (= (and b!1456815 res!987232) b!1456822))

(assert (= (and b!1456833 (not res!987227)) b!1456826))

(assert (= (and b!1456826 (not res!987229)) b!1456830))

(assert (= (and b!1456830 (not res!987239)) b!1456825))

(assert (= (and b!1456825 c!134303) b!1456829))

(assert (= (and b!1456825 (not c!134303)) b!1456812))

(declare-fun m!1344867 () Bool)

(assert (=> b!1456833 m!1344867))

(declare-fun m!1344869 () Bool)

(assert (=> b!1456833 m!1344869))

(declare-fun m!1344871 () Bool)

(assert (=> b!1456833 m!1344871))

(declare-fun m!1344873 () Bool)

(assert (=> b!1456833 m!1344873))

(declare-fun m!1344875 () Bool)

(assert (=> b!1456833 m!1344875))

(declare-fun m!1344877 () Bool)

(assert (=> b!1456833 m!1344877))

(declare-fun m!1344879 () Bool)

(assert (=> b!1456832 m!1344879))

(declare-fun m!1344881 () Bool)

(assert (=> b!1456826 m!1344881))

(declare-fun m!1344883 () Bool)

(assert (=> b!1456826 m!1344883))

(declare-fun m!1344885 () Bool)

(assert (=> b!1456826 m!1344885))

(declare-fun m!1344887 () Bool)

(assert (=> b!1456823 m!1344887))

(assert (=> b!1456823 m!1344887))

(declare-fun m!1344889 () Bool)

(assert (=> b!1456823 m!1344889))

(assert (=> b!1456820 m!1344869))

(declare-fun m!1344891 () Bool)

(assert (=> b!1456820 m!1344891))

(assert (=> b!1456822 m!1344869))

(declare-fun m!1344893 () Bool)

(assert (=> b!1456822 m!1344893))

(assert (=> b!1456822 m!1344871))

(assert (=> b!1456822 m!1344873))

(assert (=> b!1456822 m!1344877))

(declare-fun m!1344895 () Bool)

(assert (=> b!1456827 m!1344895))

(assert (=> b!1456827 m!1344895))

(declare-fun m!1344897 () Bool)

(assert (=> b!1456827 m!1344897))

(assert (=> b!1456827 m!1344869))

(declare-fun m!1344899 () Bool)

(assert (=> b!1456827 m!1344899))

(declare-fun m!1344901 () Bool)

(assert (=> b!1456812 m!1344901))

(declare-fun m!1344903 () Bool)

(assert (=> start!125096 m!1344903))

(declare-fun m!1344905 () Bool)

(assert (=> start!125096 m!1344905))

(assert (=> b!1456816 m!1344877))

(assert (=> b!1456816 m!1344877))

(declare-fun m!1344907 () Bool)

(assert (=> b!1456816 m!1344907))

(assert (=> b!1456815 m!1344877))

(assert (=> b!1456815 m!1344877))

(declare-fun m!1344909 () Bool)

(assert (=> b!1456815 m!1344909))

(declare-fun m!1344911 () Bool)

(assert (=> b!1456828 m!1344911))

(declare-fun m!1344913 () Bool)

(assert (=> b!1456829 m!1344913))

(assert (=> b!1456830 m!1344877))

(assert (=> b!1456830 m!1344877))

(declare-fun m!1344915 () Bool)

(assert (=> b!1456830 m!1344915))

(assert (=> b!1456824 m!1344883))

(assert (=> b!1456824 m!1344885))

(assert (=> b!1456813 m!1344877))

(assert (=> b!1456813 m!1344877))

(declare-fun m!1344917 () Bool)

(assert (=> b!1456813 m!1344917))

(declare-fun m!1344919 () Bool)

(assert (=> b!1456817 m!1344919))

(assert (=> b!1456814 m!1344877))

(assert (=> b!1456814 m!1344877))

(declare-fun m!1344921 () Bool)

(assert (=> b!1456814 m!1344921))

(assert (=> b!1456814 m!1344921))

(assert (=> b!1456814 m!1344877))

(declare-fun m!1344923 () Bool)

(assert (=> b!1456814 m!1344923))

(push 1)

