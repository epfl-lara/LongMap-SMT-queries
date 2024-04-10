; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125004 () Bool)

(assert start!125004)

(declare-fun b!1453776 () Bool)

(declare-fun res!984753 () Bool)

(declare-fun e!818227 () Bool)

(assert (=> b!1453776 (=> (not res!984753) (not e!818227))))

(declare-datatypes ((array!98452 0))(
  ( (array!98453 (arr!47514 (Array (_ BitVec 32) (_ BitVec 64))) (size!48064 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98452)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453776 (= res!984753 (validKeyInArray!0 (select (arr!47514 a!2862) i!1006)))))

(declare-fun e!818229 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11766 0))(
  ( (MissingZero!11766 (index!49456 (_ BitVec 32))) (Found!11766 (index!49457 (_ BitVec 32))) (Intermediate!11766 (undefined!12578 Bool) (index!49458 (_ BitVec 32)) (x!131095 (_ BitVec 32))) (Undefined!11766) (MissingVacant!11766 (index!49459 (_ BitVec 32))) )
))
(declare-fun lt!637351 () SeekEntryResult!11766)

(declare-fun lt!637349 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1453778 () Bool)

(declare-fun lt!637353 () array!98452)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1453778 (= e!818229 (not (= lt!637351 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637349 lt!637348 lt!637353 mask!2687))))))

(declare-fun e!818228 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1453779 () Bool)

(assert (=> b!1453779 (= e!818228 (= lt!637351 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637348 lt!637353 mask!2687)))))

(declare-fun b!1453780 () Bool)

(declare-fun res!984748 () Bool)

(declare-fun e!818223 () Bool)

(assert (=> b!1453780 (=> res!984748 e!818223)))

(declare-fun lt!637347 () SeekEntryResult!11766)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1453780 (= res!984748 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637349 (select (arr!47514 a!2862) j!93) a!2862 mask!2687) lt!637347)))))

(declare-fun b!1453781 () Bool)

(declare-fun res!984760 () Bool)

(declare-fun e!818231 () Bool)

(assert (=> b!1453781 (=> (not res!984760) (not e!818231))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453781 (= res!984760 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453782 () Bool)

(declare-fun res!984756 () Bool)

(assert (=> b!1453782 (=> (not res!984756) (not e!818227))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453782 (= res!984756 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48064 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48064 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48064 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453783 () Bool)

(declare-fun e!818226 () Bool)

(assert (=> b!1453783 (= e!818231 (not e!818226))))

(declare-fun res!984758 () Bool)

(assert (=> b!1453783 (=> res!984758 e!818226)))

(assert (=> b!1453783 (= res!984758 (or (and (= (select (arr!47514 a!2862) index!646) (select (store (arr!47514 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47514 a!2862) index!646) (select (arr!47514 a!2862) j!93))) (= (select (arr!47514 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818230 () Bool)

(assert (=> b!1453783 e!818230))

(declare-fun res!984743 () Bool)

(assert (=> b!1453783 (=> (not res!984743) (not e!818230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98452 (_ BitVec 32)) Bool)

(assert (=> b!1453783 (= res!984743 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49028 0))(
  ( (Unit!49029) )
))
(declare-fun lt!637350 () Unit!49028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49028)

(assert (=> b!1453783 (= lt!637350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453784 () Bool)

(assert (=> b!1453784 (= e!818230 (and (or (= (select (arr!47514 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47514 a!2862) intermediateBeforeIndex!19) (select (arr!47514 a!2862) j!93))) (let ((bdg!53002 (select (store (arr!47514 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47514 a!2862) index!646) bdg!53002) (= (select (arr!47514 a!2862) index!646) (select (arr!47514 a!2862) j!93))) (= (select (arr!47514 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53002 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453785 () Bool)

(declare-fun lt!637352 () SeekEntryResult!11766)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1453785 (= e!818229 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637349 intermediateAfterIndex!19 lt!637348 lt!637353 mask!2687) lt!637352)))))

(declare-fun b!1453786 () Bool)

(declare-fun e!818222 () Bool)

(assert (=> b!1453786 (= e!818222 e!818231)))

(declare-fun res!984744 () Bool)

(assert (=> b!1453786 (=> (not res!984744) (not e!818231))))

(assert (=> b!1453786 (= res!984744 (= lt!637351 (Intermediate!11766 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453786 (= lt!637351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637348 mask!2687) lt!637348 lt!637353 mask!2687))))

(assert (=> b!1453786 (= lt!637348 (select (store (arr!47514 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453787 () Bool)

(declare-fun res!984749 () Bool)

(assert (=> b!1453787 (=> (not res!984749) (not e!818227))))

(assert (=> b!1453787 (= res!984749 (and (= (size!48064 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48064 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48064 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453788 () Bool)

(declare-fun res!984747 () Bool)

(assert (=> b!1453788 (=> (not res!984747) (not e!818227))))

(assert (=> b!1453788 (= res!984747 (validKeyInArray!0 (select (arr!47514 a!2862) j!93)))))

(declare-fun b!1453789 () Bool)

(declare-fun res!984759 () Bool)

(assert (=> b!1453789 (=> (not res!984759) (not e!818222))))

(assert (=> b!1453789 (= res!984759 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47514 a!2862) j!93) a!2862 mask!2687) lt!637347))))

(declare-fun b!1453790 () Bool)

(assert (=> b!1453790 (= e!818223 true)))

(declare-fun lt!637346 () Bool)

(assert (=> b!1453790 (= lt!637346 e!818229)))

(declare-fun c!134027 () Bool)

(assert (=> b!1453790 (= c!134027 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453791 () Bool)

(declare-fun res!984745 () Bool)

(assert (=> b!1453791 (=> (not res!984745) (not e!818227))))

(declare-datatypes ((List!34015 0))(
  ( (Nil!34012) (Cons!34011 (h!35361 (_ BitVec 64)) (t!48709 List!34015)) )
))
(declare-fun arrayNoDuplicates!0 (array!98452 (_ BitVec 32) List!34015) Bool)

(assert (=> b!1453791 (= res!984745 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34012))))

(declare-fun res!984757 () Bool)

(assert (=> start!125004 (=> (not res!984757) (not e!818227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125004 (= res!984757 (validMask!0 mask!2687))))

(assert (=> start!125004 e!818227))

(assert (=> start!125004 true))

(declare-fun array_inv!36542 (array!98452) Bool)

(assert (=> start!125004 (array_inv!36542 a!2862)))

(declare-fun b!1453777 () Bool)

(assert (=> b!1453777 (= e!818226 e!818223)))

(declare-fun res!984755 () Bool)

(assert (=> b!1453777 (=> res!984755 e!818223)))

(assert (=> b!1453777 (= res!984755 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637349 #b00000000000000000000000000000000) (bvsge lt!637349 (size!48064 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453777 (= lt!637349 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453777 (= lt!637352 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637348 lt!637353 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98452 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1453777 (= lt!637352 (seekEntryOrOpen!0 lt!637348 lt!637353 mask!2687))))

(declare-fun b!1453792 () Bool)

(declare-fun e!818224 () Bool)

(assert (=> b!1453792 (= e!818224 e!818222)))

(declare-fun res!984754 () Bool)

(assert (=> b!1453792 (=> (not res!984754) (not e!818222))))

(assert (=> b!1453792 (= res!984754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47514 a!2862) j!93) mask!2687) (select (arr!47514 a!2862) j!93) a!2862 mask!2687) lt!637347))))

(assert (=> b!1453792 (= lt!637347 (Intermediate!11766 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453793 () Bool)

(declare-fun res!984746 () Bool)

(assert (=> b!1453793 (=> (not res!984746) (not e!818230))))

(assert (=> b!1453793 (= res!984746 (= (seekEntryOrOpen!0 (select (arr!47514 a!2862) j!93) a!2862 mask!2687) (Found!11766 j!93)))))

(declare-fun b!1453794 () Bool)

(assert (=> b!1453794 (= e!818228 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637348 lt!637353 mask!2687) (seekEntryOrOpen!0 lt!637348 lt!637353 mask!2687)))))

(declare-fun b!1453795 () Bool)

(declare-fun res!984750 () Bool)

(assert (=> b!1453795 (=> (not res!984750) (not e!818227))))

(assert (=> b!1453795 (= res!984750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453796 () Bool)

(assert (=> b!1453796 (= e!818227 e!818224)))

(declare-fun res!984751 () Bool)

(assert (=> b!1453796 (=> (not res!984751) (not e!818224))))

(assert (=> b!1453796 (= res!984751 (= (select (store (arr!47514 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453796 (= lt!637353 (array!98453 (store (arr!47514 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48064 a!2862)))))

(declare-fun b!1453797 () Bool)

(declare-fun res!984752 () Bool)

(assert (=> b!1453797 (=> (not res!984752) (not e!818231))))

(assert (=> b!1453797 (= res!984752 e!818228)))

(declare-fun c!134028 () Bool)

(assert (=> b!1453797 (= c!134028 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125004 res!984757) b!1453787))

(assert (= (and b!1453787 res!984749) b!1453776))

(assert (= (and b!1453776 res!984753) b!1453788))

(assert (= (and b!1453788 res!984747) b!1453795))

(assert (= (and b!1453795 res!984750) b!1453791))

(assert (= (and b!1453791 res!984745) b!1453782))

(assert (= (and b!1453782 res!984756) b!1453796))

(assert (= (and b!1453796 res!984751) b!1453792))

(assert (= (and b!1453792 res!984754) b!1453789))

(assert (= (and b!1453789 res!984759) b!1453786))

(assert (= (and b!1453786 res!984744) b!1453797))

(assert (= (and b!1453797 c!134028) b!1453779))

(assert (= (and b!1453797 (not c!134028)) b!1453794))

(assert (= (and b!1453797 res!984752) b!1453781))

(assert (= (and b!1453781 res!984760) b!1453783))

(assert (= (and b!1453783 res!984743) b!1453793))

(assert (= (and b!1453793 res!984746) b!1453784))

(assert (= (and b!1453783 (not res!984758)) b!1453777))

(assert (= (and b!1453777 (not res!984755)) b!1453780))

(assert (= (and b!1453780 (not res!984748)) b!1453790))

(assert (= (and b!1453790 c!134027) b!1453778))

(assert (= (and b!1453790 (not c!134027)) b!1453785))

(declare-fun m!1342199 () Bool)

(assert (=> b!1453789 m!1342199))

(assert (=> b!1453789 m!1342199))

(declare-fun m!1342201 () Bool)

(assert (=> b!1453789 m!1342201))

(declare-fun m!1342203 () Bool)

(assert (=> b!1453785 m!1342203))

(declare-fun m!1342205 () Bool)

(assert (=> b!1453783 m!1342205))

(declare-fun m!1342207 () Bool)

(assert (=> b!1453783 m!1342207))

(declare-fun m!1342209 () Bool)

(assert (=> b!1453783 m!1342209))

(declare-fun m!1342211 () Bool)

(assert (=> b!1453783 m!1342211))

(declare-fun m!1342213 () Bool)

(assert (=> b!1453783 m!1342213))

(assert (=> b!1453783 m!1342199))

(declare-fun m!1342215 () Bool)

(assert (=> b!1453795 m!1342215))

(declare-fun m!1342217 () Bool)

(assert (=> b!1453794 m!1342217))

(declare-fun m!1342219 () Bool)

(assert (=> b!1453794 m!1342219))

(declare-fun m!1342221 () Bool)

(assert (=> b!1453776 m!1342221))

(assert (=> b!1453776 m!1342221))

(declare-fun m!1342223 () Bool)

(assert (=> b!1453776 m!1342223))

(declare-fun m!1342225 () Bool)

(assert (=> b!1453779 m!1342225))

(assert (=> b!1453796 m!1342207))

(declare-fun m!1342227 () Bool)

(assert (=> b!1453796 m!1342227))

(assert (=> b!1453793 m!1342199))

(assert (=> b!1453793 m!1342199))

(declare-fun m!1342229 () Bool)

(assert (=> b!1453793 m!1342229))

(declare-fun m!1342231 () Bool)

(assert (=> b!1453786 m!1342231))

(assert (=> b!1453786 m!1342231))

(declare-fun m!1342233 () Bool)

(assert (=> b!1453786 m!1342233))

(assert (=> b!1453786 m!1342207))

(declare-fun m!1342235 () Bool)

(assert (=> b!1453786 m!1342235))

(declare-fun m!1342237 () Bool)

(assert (=> b!1453791 m!1342237))

(assert (=> b!1453780 m!1342199))

(assert (=> b!1453780 m!1342199))

(declare-fun m!1342239 () Bool)

(assert (=> b!1453780 m!1342239))

(assert (=> b!1453792 m!1342199))

(assert (=> b!1453792 m!1342199))

(declare-fun m!1342241 () Bool)

(assert (=> b!1453792 m!1342241))

(assert (=> b!1453792 m!1342241))

(assert (=> b!1453792 m!1342199))

(declare-fun m!1342243 () Bool)

(assert (=> b!1453792 m!1342243))

(assert (=> b!1453784 m!1342207))

(declare-fun m!1342245 () Bool)

(assert (=> b!1453784 m!1342245))

(assert (=> b!1453784 m!1342209))

(assert (=> b!1453784 m!1342211))

(assert (=> b!1453784 m!1342199))

(declare-fun m!1342247 () Bool)

(assert (=> b!1453778 m!1342247))

(assert (=> b!1453788 m!1342199))

(assert (=> b!1453788 m!1342199))

(declare-fun m!1342249 () Bool)

(assert (=> b!1453788 m!1342249))

(declare-fun m!1342251 () Bool)

(assert (=> start!125004 m!1342251))

(declare-fun m!1342253 () Bool)

(assert (=> start!125004 m!1342253))

(declare-fun m!1342255 () Bool)

(assert (=> b!1453777 m!1342255))

(assert (=> b!1453777 m!1342217))

(assert (=> b!1453777 m!1342219))

(check-sat (not b!1453795) (not b!1453777) (not b!1453783) (not b!1453779) (not b!1453792) (not b!1453785) (not b!1453786) (not b!1453789) (not b!1453776) (not b!1453793) (not b!1453791) (not b!1453794) (not b!1453778) (not start!125004) (not b!1453780) (not b!1453788))
(check-sat)
