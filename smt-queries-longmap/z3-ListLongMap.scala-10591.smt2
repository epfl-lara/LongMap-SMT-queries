; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124654 () Bool)

(assert start!124654)

(declare-fun b!1444703 () Bool)

(declare-fun e!813907 () Bool)

(declare-fun e!813903 () Bool)

(assert (=> b!1444703 (= e!813907 e!813903)))

(declare-fun res!976771 () Bool)

(assert (=> b!1444703 (=> (not res!976771) (not e!813903))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98080 0))(
  ( (array!98081 (arr!47329 (Array (_ BitVec 32) (_ BitVec 64))) (size!47881 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98080)

(assert (=> b!1444703 (= res!976771 (= (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634105 () array!98080)

(assert (=> b!1444703 (= lt!634105 (array!98081 (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47881 a!2862)))))

(declare-fun b!1444704 () Bool)

(declare-fun res!976767 () Bool)

(declare-fun e!813908 () Bool)

(assert (=> b!1444704 (=> (not res!976767) (not e!813908))))

(declare-datatypes ((SeekEntryResult!11606 0))(
  ( (MissingZero!11606 (index!48816 (_ BitVec 32))) (Found!11606 (index!48817 (_ BitVec 32))) (Intermediate!11606 (undefined!12418 Bool) (index!48818 (_ BitVec 32)) (x!130506 (_ BitVec 32))) (Undefined!11606) (MissingVacant!11606 (index!48819 (_ BitVec 32))) )
))
(declare-fun lt!634104 () SeekEntryResult!11606)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11606)

(assert (=> b!1444704 (= res!976767 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!634104))))

(declare-fun b!1444705 () Bool)

(declare-fun lt!634106 () SeekEntryResult!11606)

(declare-fun e!813904 () Bool)

(declare-fun lt!634103 () (_ BitVec 64))

(assert (=> b!1444705 (= e!813904 (= lt!634106 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634103 lt!634105 mask!2687)))))

(declare-fun b!1444706 () Bool)

(declare-fun e!813909 () Bool)

(assert (=> b!1444706 (= e!813909 (not true))))

(declare-fun e!813905 () Bool)

(assert (=> b!1444706 e!813905))

(declare-fun res!976764 () Bool)

(assert (=> b!1444706 (=> (not res!976764) (not e!813905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98080 (_ BitVec 32)) Bool)

(assert (=> b!1444706 (= res!976764 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48549 0))(
  ( (Unit!48550) )
))
(declare-fun lt!634107 () Unit!48549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48549)

(assert (=> b!1444706 (= lt!634107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444707 () Bool)

(declare-fun res!976761 () Bool)

(assert (=> b!1444707 (=> (not res!976761) (not e!813909))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444707 (= res!976761 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444708 () Bool)

(declare-fun res!976760 () Bool)

(assert (=> b!1444708 (=> (not res!976760) (not e!813907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444708 (= res!976760 (validKeyInArray!0 (select (arr!47329 a!2862) j!93)))))

(declare-fun res!976762 () Bool)

(assert (=> start!124654 (=> (not res!976762) (not e!813907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124654 (= res!976762 (validMask!0 mask!2687))))

(assert (=> start!124654 e!813907))

(assert (=> start!124654 true))

(declare-fun array_inv!36562 (array!98080) Bool)

(assert (=> start!124654 (array_inv!36562 a!2862)))

(declare-fun b!1444709 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11606)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98080 (_ BitVec 32)) SeekEntryResult!11606)

(assert (=> b!1444709 (= e!813904 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634103 lt!634105 mask!2687) (seekEntryOrOpen!0 lt!634103 lt!634105 mask!2687)))))

(declare-fun b!1444710 () Bool)

(declare-fun res!976770 () Bool)

(assert (=> b!1444710 (=> (not res!976770) (not e!813907))))

(assert (=> b!1444710 (= res!976770 (validKeyInArray!0 (select (arr!47329 a!2862) i!1006)))))

(declare-fun b!1444711 () Bool)

(assert (=> b!1444711 (= e!813903 e!813908)))

(declare-fun res!976765 () Bool)

(assert (=> b!1444711 (=> (not res!976765) (not e!813908))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444711 (= res!976765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47329 a!2862) j!93) mask!2687) (select (arr!47329 a!2862) j!93) a!2862 mask!2687) lt!634104))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444711 (= lt!634104 (Intermediate!11606 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444712 () Bool)

(declare-fun res!976768 () Bool)

(assert (=> b!1444712 (=> (not res!976768) (not e!813905))))

(assert (=> b!1444712 (= res!976768 (= (seekEntryOrOpen!0 (select (arr!47329 a!2862) j!93) a!2862 mask!2687) (Found!11606 j!93)))))

(declare-fun b!1444713 () Bool)

(declare-fun res!976763 () Bool)

(assert (=> b!1444713 (=> (not res!976763) (not e!813907))))

(declare-datatypes ((List!33908 0))(
  ( (Nil!33905) (Cons!33904 (h!35254 (_ BitVec 64)) (t!48594 List!33908)) )
))
(declare-fun arrayNoDuplicates!0 (array!98080 (_ BitVec 32) List!33908) Bool)

(assert (=> b!1444713 (= res!976763 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33905))))

(declare-fun b!1444714 () Bool)

(declare-fun res!976759 () Bool)

(assert (=> b!1444714 (=> (not res!976759) (not e!813907))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444714 (= res!976759 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47881 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47881 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47881 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444715 () Bool)

(declare-fun res!976766 () Bool)

(assert (=> b!1444715 (=> (not res!976766) (not e!813907))))

(assert (=> b!1444715 (= res!976766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444716 () Bool)

(declare-fun res!976757 () Bool)

(assert (=> b!1444716 (=> (not res!976757) (not e!813909))))

(assert (=> b!1444716 (= res!976757 e!813904)))

(declare-fun c!133486 () Bool)

(assert (=> b!1444716 (= c!133486 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444717 () Bool)

(assert (=> b!1444717 (= e!813905 (or (= (select (arr!47329 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47329 a!2862) intermediateBeforeIndex!19) (select (arr!47329 a!2862) j!93))))))

(declare-fun b!1444718 () Bool)

(declare-fun res!976769 () Bool)

(assert (=> b!1444718 (=> (not res!976769) (not e!813907))))

(assert (=> b!1444718 (= res!976769 (and (= (size!47881 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47881 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47881 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444719 () Bool)

(assert (=> b!1444719 (= e!813908 e!813909)))

(declare-fun res!976758 () Bool)

(assert (=> b!1444719 (=> (not res!976758) (not e!813909))))

(assert (=> b!1444719 (= res!976758 (= lt!634106 (Intermediate!11606 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444719 (= lt!634106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634103 mask!2687) lt!634103 lt!634105 mask!2687))))

(assert (=> b!1444719 (= lt!634103 (select (store (arr!47329 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124654 res!976762) b!1444718))

(assert (= (and b!1444718 res!976769) b!1444710))

(assert (= (and b!1444710 res!976770) b!1444708))

(assert (= (and b!1444708 res!976760) b!1444715))

(assert (= (and b!1444715 res!976766) b!1444713))

(assert (= (and b!1444713 res!976763) b!1444714))

(assert (= (and b!1444714 res!976759) b!1444703))

(assert (= (and b!1444703 res!976771) b!1444711))

(assert (= (and b!1444711 res!976765) b!1444704))

(assert (= (and b!1444704 res!976767) b!1444719))

(assert (= (and b!1444719 res!976758) b!1444716))

(assert (= (and b!1444716 c!133486) b!1444705))

(assert (= (and b!1444716 (not c!133486)) b!1444709))

(assert (= (and b!1444716 res!976757) b!1444707))

(assert (= (and b!1444707 res!976761) b!1444706))

(assert (= (and b!1444706 res!976764) b!1444712))

(assert (= (and b!1444712 res!976768) b!1444717))

(declare-fun m!1333221 () Bool)

(assert (=> b!1444704 m!1333221))

(assert (=> b!1444704 m!1333221))

(declare-fun m!1333223 () Bool)

(assert (=> b!1444704 m!1333223))

(declare-fun m!1333225 () Bool)

(assert (=> b!1444717 m!1333225))

(assert (=> b!1444717 m!1333221))

(assert (=> b!1444712 m!1333221))

(assert (=> b!1444712 m!1333221))

(declare-fun m!1333227 () Bool)

(assert (=> b!1444712 m!1333227))

(declare-fun m!1333229 () Bool)

(assert (=> start!124654 m!1333229))

(declare-fun m!1333231 () Bool)

(assert (=> start!124654 m!1333231))

(assert (=> b!1444708 m!1333221))

(assert (=> b!1444708 m!1333221))

(declare-fun m!1333233 () Bool)

(assert (=> b!1444708 m!1333233))

(declare-fun m!1333235 () Bool)

(assert (=> b!1444705 m!1333235))

(declare-fun m!1333237 () Bool)

(assert (=> b!1444719 m!1333237))

(assert (=> b!1444719 m!1333237))

(declare-fun m!1333239 () Bool)

(assert (=> b!1444719 m!1333239))

(declare-fun m!1333241 () Bool)

(assert (=> b!1444719 m!1333241))

(declare-fun m!1333243 () Bool)

(assert (=> b!1444719 m!1333243))

(declare-fun m!1333245 () Bool)

(assert (=> b!1444706 m!1333245))

(declare-fun m!1333247 () Bool)

(assert (=> b!1444706 m!1333247))

(declare-fun m!1333249 () Bool)

(assert (=> b!1444709 m!1333249))

(declare-fun m!1333251 () Bool)

(assert (=> b!1444709 m!1333251))

(declare-fun m!1333253 () Bool)

(assert (=> b!1444713 m!1333253))

(declare-fun m!1333255 () Bool)

(assert (=> b!1444710 m!1333255))

(assert (=> b!1444710 m!1333255))

(declare-fun m!1333257 () Bool)

(assert (=> b!1444710 m!1333257))

(assert (=> b!1444711 m!1333221))

(assert (=> b!1444711 m!1333221))

(declare-fun m!1333259 () Bool)

(assert (=> b!1444711 m!1333259))

(assert (=> b!1444711 m!1333259))

(assert (=> b!1444711 m!1333221))

(declare-fun m!1333261 () Bool)

(assert (=> b!1444711 m!1333261))

(assert (=> b!1444703 m!1333241))

(declare-fun m!1333263 () Bool)

(assert (=> b!1444703 m!1333263))

(declare-fun m!1333265 () Bool)

(assert (=> b!1444715 m!1333265))

(check-sat (not b!1444709) (not start!124654) (not b!1444704) (not b!1444711) (not b!1444705) (not b!1444706) (not b!1444719) (not b!1444715) (not b!1444712) (not b!1444708) (not b!1444713) (not b!1444710))
(check-sat)
