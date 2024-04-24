; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126540 () Bool)

(assert start!126540)

(declare-fun b!1481847 () Bool)

(declare-fun res!1006600 () Bool)

(declare-fun e!831263 () Bool)

(assert (=> b!1481847 (=> (not res!1006600) (not e!831263))))

(declare-fun e!831261 () Bool)

(assert (=> b!1481847 (= res!1006600 e!831261)))

(declare-fun c!137161 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481847 (= c!137161 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481848 () Bool)

(declare-fun res!1006594 () Bool)

(declare-fun e!831268 () Bool)

(assert (=> b!1481848 (=> (not res!1006594) (not e!831268))))

(declare-datatypes ((array!99484 0))(
  ( (array!99485 (arr!48016 (Array (_ BitVec 32) (_ BitVec 64))) (size!48567 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99484)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99484 (_ BitVec 32)) Bool)

(assert (=> b!1481848 (= res!1006594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481849 () Bool)

(declare-fun res!1006584 () Bool)

(declare-fun e!831262 () Bool)

(assert (=> b!1481849 (=> res!1006584 e!831262)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12153 0))(
  ( (MissingZero!12153 (index!51004 (_ BitVec 32))) (Found!12153 (index!51005 (_ BitVec 32))) (Intermediate!12153 (undefined!12965 Bool) (index!51006 (_ BitVec 32)) (x!132769 (_ BitVec 32))) (Undefined!12153) (MissingVacant!12153 (index!51007 (_ BitVec 32))) )
))
(declare-fun lt!646941 () SeekEntryResult!12153)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12153)

(assert (=> b!1481849 (= res!1006584 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48016 a!2862) j!93) a!2862 mask!2687) lt!646941)))))

(declare-fun b!1481850 () Bool)

(declare-fun res!1006593 () Bool)

(assert (=> b!1481850 (=> (not res!1006593) (not e!831268))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481850 (= res!1006593 (validKeyInArray!0 (select (arr!48016 a!2862) i!1006)))))

(declare-fun b!1481851 () Bool)

(declare-fun res!1006599 () Bool)

(assert (=> b!1481851 (=> (not res!1006599) (not e!831268))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481851 (= res!1006599 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48567 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48567 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48567 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481852 () Bool)

(assert (=> b!1481852 (= e!831263 (not e!831262))))

(declare-fun res!1006589 () Bool)

(assert (=> b!1481852 (=> res!1006589 e!831262)))

(assert (=> b!1481852 (= res!1006589 (or (and (= (select (arr!48016 a!2862) index!646) (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48016 a!2862) index!646) (select (arr!48016 a!2862) j!93))) (not (= (select (arr!48016 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48016 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!831269 () Bool)

(assert (=> b!1481852 e!831269))

(declare-fun res!1006586 () Bool)

(assert (=> b!1481852 (=> (not res!1006586) (not e!831269))))

(declare-fun lt!646947 () SeekEntryResult!12153)

(assert (=> b!1481852 (= res!1006586 (and (= lt!646947 lt!646941) (or (= (select (arr!48016 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48016 a!2862) intermediateBeforeIndex!19) (select (arr!48016 a!2862) j!93)))))))

(assert (=> b!1481852 (= lt!646941 (Found!12153 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12153)

(assert (=> b!1481852 (= lt!646947 (seekEntryOrOpen!0 (select (arr!48016 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1481852 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49679 0))(
  ( (Unit!49680) )
))
(declare-fun lt!646942 () Unit!49679)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49679)

(assert (=> b!1481852 (= lt!646942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481853 () Bool)

(declare-fun res!1006587 () Bool)

(assert (=> b!1481853 (=> (not res!1006587) (not e!831268))))

(assert (=> b!1481853 (= res!1006587 (and (= (size!48567 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48567 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48567 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481854 () Bool)

(declare-fun lt!646943 () array!99484)

(declare-fun lt!646945 () (_ BitVec 64))

(assert (=> b!1481854 (= e!831262 (= lt!646947 (seekEntryOrOpen!0 lt!646945 lt!646943 mask!2687)))))

(assert (=> b!1481854 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646945 lt!646943 mask!2687) lt!646941)))

(declare-fun lt!646948 () Unit!49679)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49679)

(assert (=> b!1481854 (= lt!646948 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1481855 () Bool)

(assert (=> b!1481855 (= e!831261 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646945 lt!646943 mask!2687) (seekEntryOrOpen!0 lt!646945 lt!646943 mask!2687)))))

(declare-fun res!1006597 () Bool)

(assert (=> start!126540 (=> (not res!1006597) (not e!831268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126540 (= res!1006597 (validMask!0 mask!2687))))

(assert (=> start!126540 e!831268))

(assert (=> start!126540 true))

(declare-fun array_inv!37297 (array!99484) Bool)

(assert (=> start!126540 (array_inv!37297 a!2862)))

(declare-fun b!1481856 () Bool)

(declare-fun e!831265 () Bool)

(assert (=> b!1481856 (= e!831265 e!831263)))

(declare-fun res!1006590 () Bool)

(assert (=> b!1481856 (=> (not res!1006590) (not e!831263))))

(declare-fun lt!646946 () SeekEntryResult!12153)

(assert (=> b!1481856 (= res!1006590 (= lt!646946 (Intermediate!12153 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12153)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481856 (= lt!646946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646945 mask!2687) lt!646945 lt!646943 mask!2687))))

(assert (=> b!1481856 (= lt!646945 (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481857 () Bool)

(declare-fun e!831270 () Bool)

(assert (=> b!1481857 (= e!831270 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1481858 () Bool)

(declare-fun res!1006598 () Bool)

(assert (=> b!1481858 (=> (not res!1006598) (not e!831268))))

(declare-datatypes ((List!34504 0))(
  ( (Nil!34501) (Cons!34500 (h!35882 (_ BitVec 64)) (t!49190 List!34504)) )
))
(declare-fun arrayNoDuplicates!0 (array!99484 (_ BitVec 32) List!34504) Bool)

(assert (=> b!1481858 (= res!1006598 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34501))))

(declare-fun b!1481859 () Bool)

(declare-fun e!831264 () Bool)

(assert (=> b!1481859 (= e!831269 e!831264)))

(declare-fun res!1006591 () Bool)

(assert (=> b!1481859 (=> res!1006591 e!831264)))

(assert (=> b!1481859 (= res!1006591 (or (and (= (select (arr!48016 a!2862) index!646) (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48016 a!2862) index!646) (select (arr!48016 a!2862) j!93))) (not (= (select (arr!48016 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1481860 () Bool)

(declare-fun res!1006601 () Bool)

(assert (=> b!1481860 (=> (not res!1006601) (not e!831265))))

(declare-fun lt!646944 () SeekEntryResult!12153)

(assert (=> b!1481860 (= res!1006601 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48016 a!2862) j!93) a!2862 mask!2687) lt!646944))))

(declare-fun b!1481861 () Bool)

(declare-fun res!1006588 () Bool)

(assert (=> b!1481861 (=> (not res!1006588) (not e!831263))))

(assert (=> b!1481861 (= res!1006588 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481862 () Bool)

(declare-fun e!831266 () Bool)

(assert (=> b!1481862 (= e!831266 e!831265)))

(declare-fun res!1006585 () Bool)

(assert (=> b!1481862 (=> (not res!1006585) (not e!831265))))

(assert (=> b!1481862 (= res!1006585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48016 a!2862) j!93) mask!2687) (select (arr!48016 a!2862) j!93) a!2862 mask!2687) lt!646944))))

(assert (=> b!1481862 (= lt!646944 (Intermediate!12153 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481863 () Bool)

(assert (=> b!1481863 (= e!831261 (= lt!646946 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646945 lt!646943 mask!2687)))))

(declare-fun b!1481864 () Bool)

(assert (=> b!1481864 (= e!831268 e!831266)))

(declare-fun res!1006592 () Bool)

(assert (=> b!1481864 (=> (not res!1006592) (not e!831266))))

(assert (=> b!1481864 (= res!1006592 (= (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481864 (= lt!646943 (array!99485 (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48567 a!2862)))))

(declare-fun b!1481865 () Bool)

(declare-fun res!1006595 () Bool)

(assert (=> b!1481865 (=> (not res!1006595) (not e!831268))))

(assert (=> b!1481865 (= res!1006595 (validKeyInArray!0 (select (arr!48016 a!2862) j!93)))))

(declare-fun b!1481866 () Bool)

(assert (=> b!1481866 (= e!831264 e!831270)))

(declare-fun res!1006596 () Bool)

(assert (=> b!1481866 (=> (not res!1006596) (not e!831270))))

(assert (=> b!1481866 (= res!1006596 (= lt!646947 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48016 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!126540 res!1006597) b!1481853))

(assert (= (and b!1481853 res!1006587) b!1481850))

(assert (= (and b!1481850 res!1006593) b!1481865))

(assert (= (and b!1481865 res!1006595) b!1481848))

(assert (= (and b!1481848 res!1006594) b!1481858))

(assert (= (and b!1481858 res!1006598) b!1481851))

(assert (= (and b!1481851 res!1006599) b!1481864))

(assert (= (and b!1481864 res!1006592) b!1481862))

(assert (= (and b!1481862 res!1006585) b!1481860))

(assert (= (and b!1481860 res!1006601) b!1481856))

(assert (= (and b!1481856 res!1006590) b!1481847))

(assert (= (and b!1481847 c!137161) b!1481863))

(assert (= (and b!1481847 (not c!137161)) b!1481855))

(assert (= (and b!1481847 res!1006600) b!1481861))

(assert (= (and b!1481861 res!1006588) b!1481852))

(assert (= (and b!1481852 res!1006586) b!1481859))

(assert (= (and b!1481859 (not res!1006591)) b!1481866))

(assert (= (and b!1481866 res!1006596) b!1481857))

(assert (= (and b!1481852 (not res!1006589)) b!1481849))

(assert (= (and b!1481849 (not res!1006584)) b!1481854))

(declare-fun m!1367647 () Bool)

(assert (=> b!1481860 m!1367647))

(assert (=> b!1481860 m!1367647))

(declare-fun m!1367649 () Bool)

(assert (=> b!1481860 m!1367649))

(assert (=> b!1481866 m!1367647))

(assert (=> b!1481866 m!1367647))

(declare-fun m!1367651 () Bool)

(assert (=> b!1481866 m!1367651))

(declare-fun m!1367653 () Bool)

(assert (=> b!1481859 m!1367653))

(declare-fun m!1367655 () Bool)

(assert (=> b!1481859 m!1367655))

(declare-fun m!1367657 () Bool)

(assert (=> b!1481859 m!1367657))

(assert (=> b!1481859 m!1367647))

(declare-fun m!1367659 () Bool)

(assert (=> b!1481848 m!1367659))

(declare-fun m!1367661 () Bool)

(assert (=> b!1481850 m!1367661))

(assert (=> b!1481850 m!1367661))

(declare-fun m!1367663 () Bool)

(assert (=> b!1481850 m!1367663))

(assert (=> b!1481862 m!1367647))

(assert (=> b!1481862 m!1367647))

(declare-fun m!1367665 () Bool)

(assert (=> b!1481862 m!1367665))

(assert (=> b!1481862 m!1367665))

(assert (=> b!1481862 m!1367647))

(declare-fun m!1367667 () Bool)

(assert (=> b!1481862 m!1367667))

(declare-fun m!1367669 () Bool)

(assert (=> b!1481863 m!1367669))

(declare-fun m!1367671 () Bool)

(assert (=> b!1481858 m!1367671))

(declare-fun m!1367673 () Bool)

(assert (=> b!1481855 m!1367673))

(declare-fun m!1367675 () Bool)

(assert (=> b!1481855 m!1367675))

(declare-fun m!1367677 () Bool)

(assert (=> b!1481852 m!1367677))

(assert (=> b!1481852 m!1367655))

(declare-fun m!1367679 () Bool)

(assert (=> b!1481852 m!1367679))

(assert (=> b!1481852 m!1367657))

(assert (=> b!1481852 m!1367653))

(assert (=> b!1481852 m!1367647))

(declare-fun m!1367681 () Bool)

(assert (=> b!1481852 m!1367681))

(declare-fun m!1367683 () Bool)

(assert (=> b!1481852 m!1367683))

(assert (=> b!1481852 m!1367647))

(assert (=> b!1481849 m!1367647))

(assert (=> b!1481849 m!1367647))

(declare-fun m!1367685 () Bool)

(assert (=> b!1481849 m!1367685))

(declare-fun m!1367687 () Bool)

(assert (=> b!1481856 m!1367687))

(assert (=> b!1481856 m!1367687))

(declare-fun m!1367689 () Bool)

(assert (=> b!1481856 m!1367689))

(assert (=> b!1481856 m!1367655))

(declare-fun m!1367691 () Bool)

(assert (=> b!1481856 m!1367691))

(assert (=> b!1481864 m!1367655))

(declare-fun m!1367693 () Bool)

(assert (=> b!1481864 m!1367693))

(declare-fun m!1367695 () Bool)

(assert (=> start!126540 m!1367695))

(declare-fun m!1367697 () Bool)

(assert (=> start!126540 m!1367697))

(assert (=> b!1481865 m!1367647))

(assert (=> b!1481865 m!1367647))

(declare-fun m!1367699 () Bool)

(assert (=> b!1481865 m!1367699))

(assert (=> b!1481854 m!1367675))

(assert (=> b!1481854 m!1367673))

(declare-fun m!1367701 () Bool)

(assert (=> b!1481854 m!1367701))

(check-sat (not b!1481850) (not b!1481863) (not b!1481862) (not b!1481854) (not start!126540) (not b!1481855) (not b!1481866) (not b!1481860) (not b!1481858) (not b!1481865) (not b!1481852) (not b!1481848) (not b!1481849) (not b!1481856))
(check-sat)
