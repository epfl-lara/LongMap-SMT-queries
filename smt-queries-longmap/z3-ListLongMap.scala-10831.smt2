; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127110 () Bool)

(assert start!127110)

(declare-fun b!1490769 () Bool)

(declare-fun res!1013187 () Bool)

(declare-fun e!835677 () Bool)

(assert (=> b!1490769 (=> (not res!1013187) (not e!835677))))

(declare-fun e!835672 () Bool)

(assert (=> b!1490769 (= res!1013187 e!835672)))

(declare-fun c!138330 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490769 (= c!138330 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!12264 0))(
  ( (MissingZero!12264 (index!51448 (_ BitVec 32))) (Found!12264 (index!51449 (_ BitVec 32))) (Intermediate!12264 (undefined!13076 Bool) (index!51450 (_ BitVec 32)) (x!133233 (_ BitVec 32))) (Undefined!12264) (MissingVacant!12264 (index!51451 (_ BitVec 32))) )
))
(declare-fun lt!650051 () SeekEntryResult!12264)

(declare-fun lt!650052 () (_ BitVec 64))

(declare-fun b!1490770 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99721 0))(
  ( (array!99722 (arr!48127 (Array (_ BitVec 32) (_ BitVec 64))) (size!48678 (_ BitVec 32))) )
))
(declare-fun lt!650055 () array!99721)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99721 (_ BitVec 32)) SeekEntryResult!12264)

(assert (=> b!1490770 (= e!835672 (= lt!650051 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650052 lt!650055 mask!2687)))))

(declare-fun b!1490771 () Bool)

(declare-fun res!1013201 () Bool)

(declare-fun e!835673 () Bool)

(assert (=> b!1490771 (=> (not res!1013201) (not e!835673))))

(declare-fun a!2862 () array!99721)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99721 (_ BitVec 32)) Bool)

(assert (=> b!1490771 (= res!1013201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490772 () Bool)

(declare-fun res!1013184 () Bool)

(declare-fun e!835675 () Bool)

(assert (=> b!1490772 (=> res!1013184 e!835675)))

(declare-fun lt!650054 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!650050 () SeekEntryResult!12264)

(assert (=> b!1490772 (= res!1013184 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650054 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650050)))))

(declare-fun b!1490773 () Bool)

(declare-fun res!1013189 () Bool)

(assert (=> b!1490773 (=> res!1013189 e!835675)))

(declare-fun e!835670 () Bool)

(assert (=> b!1490773 (= res!1013189 e!835670)))

(declare-fun c!138331 () Bool)

(assert (=> b!1490773 (= c!138331 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490774 () Bool)

(declare-fun e!835674 () Bool)

(assert (=> b!1490774 (= e!835674 e!835675)))

(declare-fun res!1013194 () Bool)

(assert (=> b!1490774 (=> res!1013194 e!835675)))

(assert (=> b!1490774 (= res!1013194 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650054 #b00000000000000000000000000000000) (bvsge lt!650054 (size!48678 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490774 (= lt!650054 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!650053 () SeekEntryResult!12264)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99721 (_ BitVec 32)) SeekEntryResult!12264)

(assert (=> b!1490774 (= lt!650053 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650052 lt!650055 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99721 (_ BitVec 32)) SeekEntryResult!12264)

(assert (=> b!1490774 (= lt!650053 (seekEntryOrOpen!0 lt!650052 lt!650055 mask!2687))))

(declare-fun b!1490775 () Bool)

(declare-fun res!1013197 () Bool)

(assert (=> b!1490775 (=> (not res!1013197) (not e!835673))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490775 (= res!1013197 (validKeyInArray!0 (select (arr!48127 a!2862) i!1006)))))

(declare-fun b!1490777 () Bool)

(assert (=> b!1490777 (= e!835677 (not e!835674))))

(declare-fun res!1013198 () Bool)

(assert (=> b!1490777 (=> res!1013198 e!835674)))

(assert (=> b!1490777 (= res!1013198 (or (and (= (select (arr!48127 a!2862) index!646) (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48127 a!2862) index!646) (select (arr!48127 a!2862) j!93))) (= (select (arr!48127 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!835668 () Bool)

(assert (=> b!1490777 e!835668))

(declare-fun res!1013193 () Bool)

(assert (=> b!1490777 (=> (not res!1013193) (not e!835668))))

(assert (=> b!1490777 (= res!1013193 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49901 0))(
  ( (Unit!49902) )
))
(declare-fun lt!650056 () Unit!49901)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49901)

(assert (=> b!1490777 (= lt!650056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490778 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490778 (= e!835675 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1490779 () Bool)

(declare-fun e!835669 () Bool)

(assert (=> b!1490779 (= e!835669 e!835677)))

(declare-fun res!1013199 () Bool)

(assert (=> b!1490779 (=> (not res!1013199) (not e!835677))))

(assert (=> b!1490779 (= res!1013199 (= lt!650051 (Intermediate!12264 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490779 (= lt!650051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650052 mask!2687) lt!650052 lt!650055 mask!2687))))

(assert (=> b!1490779 (= lt!650052 (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490780 () Bool)

(declare-fun res!1013188 () Bool)

(assert (=> b!1490780 (=> (not res!1013188) (not e!835673))))

(assert (=> b!1490780 (= res!1013188 (and (= (size!48678 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48678 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48678 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490781 () Bool)

(declare-fun res!1013186 () Bool)

(assert (=> b!1490781 (=> (not res!1013186) (not e!835673))))

(assert (=> b!1490781 (= res!1013186 (validKeyInArray!0 (select (arr!48127 a!2862) j!93)))))

(declare-fun b!1490782 () Bool)

(declare-fun res!1013195 () Bool)

(assert (=> b!1490782 (=> (not res!1013195) (not e!835669))))

(assert (=> b!1490782 (= res!1013195 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650050))))

(declare-fun b!1490783 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1490783 (= e!835668 (and (or (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48127 a!2862) intermediateBeforeIndex!19) (select (arr!48127 a!2862) j!93))) (let ((bdg!54689 (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48127 a!2862) index!646) bdg!54689) (= (select (arr!48127 a!2862) index!646) (select (arr!48127 a!2862) j!93))) (= (select (arr!48127 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54689 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1490784 () Bool)

(assert (=> b!1490784 (= e!835670 (not (= lt!650051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650054 lt!650052 lt!650055 mask!2687))))))

(declare-fun b!1490785 () Bool)

(declare-fun e!835671 () Bool)

(assert (=> b!1490785 (= e!835673 e!835671)))

(declare-fun res!1013190 () Bool)

(assert (=> b!1490785 (=> (not res!1013190) (not e!835671))))

(assert (=> b!1490785 (= res!1013190 (= (select (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490785 (= lt!650055 (array!99722 (store (arr!48127 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48678 a!2862)))))

(declare-fun b!1490786 () Bool)

(declare-fun res!1013200 () Bool)

(assert (=> b!1490786 (=> (not res!1013200) (not e!835673))))

(declare-datatypes ((List!34615 0))(
  ( (Nil!34612) (Cons!34611 (h!36008 (_ BitVec 64)) (t!49301 List!34615)) )
))
(declare-fun arrayNoDuplicates!0 (array!99721 (_ BitVec 32) List!34615) Bool)

(assert (=> b!1490786 (= res!1013200 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34612))))

(declare-fun b!1490787 () Bool)

(declare-fun res!1013196 () Bool)

(assert (=> b!1490787 (=> (not res!1013196) (not e!835677))))

(assert (=> b!1490787 (= res!1013196 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1013183 () Bool)

(assert (=> start!127110 (=> (not res!1013183) (not e!835673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127110 (= res!1013183 (validMask!0 mask!2687))))

(assert (=> start!127110 e!835673))

(assert (=> start!127110 true))

(declare-fun array_inv!37408 (array!99721) Bool)

(assert (=> start!127110 (array_inv!37408 a!2862)))

(declare-fun b!1490776 () Bool)

(assert (=> b!1490776 (= e!835671 e!835669)))

(declare-fun res!1013191 () Bool)

(assert (=> b!1490776 (=> (not res!1013191) (not e!835669))))

(assert (=> b!1490776 (= res!1013191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48127 a!2862) j!93) mask!2687) (select (arr!48127 a!2862) j!93) a!2862 mask!2687) lt!650050))))

(assert (=> b!1490776 (= lt!650050 (Intermediate!12264 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490788 () Bool)

(declare-fun res!1013192 () Bool)

(assert (=> b!1490788 (=> (not res!1013192) (not e!835668))))

(assert (=> b!1490788 (= res!1013192 (= (seekEntryOrOpen!0 (select (arr!48127 a!2862) j!93) a!2862 mask!2687) (Found!12264 j!93)))))

(declare-fun b!1490789 () Bool)

(assert (=> b!1490789 (= e!835672 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650052 lt!650055 mask!2687) (seekEntryOrOpen!0 lt!650052 lt!650055 mask!2687)))))

(declare-fun b!1490790 () Bool)

(declare-fun res!1013185 () Bool)

(assert (=> b!1490790 (=> (not res!1013185) (not e!835673))))

(assert (=> b!1490790 (= res!1013185 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48678 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48678 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48678 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490791 () Bool)

(assert (=> b!1490791 (= e!835670 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650054 intermediateAfterIndex!19 lt!650052 lt!650055 mask!2687) lt!650053)))))

(assert (= (and start!127110 res!1013183) b!1490780))

(assert (= (and b!1490780 res!1013188) b!1490775))

(assert (= (and b!1490775 res!1013197) b!1490781))

(assert (= (and b!1490781 res!1013186) b!1490771))

(assert (= (and b!1490771 res!1013201) b!1490786))

(assert (= (and b!1490786 res!1013200) b!1490790))

(assert (= (and b!1490790 res!1013185) b!1490785))

(assert (= (and b!1490785 res!1013190) b!1490776))

(assert (= (and b!1490776 res!1013191) b!1490782))

(assert (= (and b!1490782 res!1013195) b!1490779))

(assert (= (and b!1490779 res!1013199) b!1490769))

(assert (= (and b!1490769 c!138330) b!1490770))

(assert (= (and b!1490769 (not c!138330)) b!1490789))

(assert (= (and b!1490769 res!1013187) b!1490787))

(assert (= (and b!1490787 res!1013196) b!1490777))

(assert (= (and b!1490777 res!1013193) b!1490788))

(assert (= (and b!1490788 res!1013192) b!1490783))

(assert (= (and b!1490777 (not res!1013198)) b!1490774))

(assert (= (and b!1490774 (not res!1013194)) b!1490772))

(assert (= (and b!1490772 (not res!1013184)) b!1490773))

(assert (= (and b!1490773 c!138331) b!1490784))

(assert (= (and b!1490773 (not c!138331)) b!1490791))

(assert (= (and b!1490773 (not res!1013189)) b!1490778))

(declare-fun m!1375045 () Bool)

(assert (=> b!1490770 m!1375045))

(declare-fun m!1375047 () Bool)

(assert (=> b!1490781 m!1375047))

(assert (=> b!1490781 m!1375047))

(declare-fun m!1375049 () Bool)

(assert (=> b!1490781 m!1375049))

(assert (=> b!1490782 m!1375047))

(assert (=> b!1490782 m!1375047))

(declare-fun m!1375051 () Bool)

(assert (=> b!1490782 m!1375051))

(declare-fun m!1375053 () Bool)

(assert (=> b!1490789 m!1375053))

(declare-fun m!1375055 () Bool)

(assert (=> b!1490789 m!1375055))

(assert (=> b!1490788 m!1375047))

(assert (=> b!1490788 m!1375047))

(declare-fun m!1375057 () Bool)

(assert (=> b!1490788 m!1375057))

(assert (=> b!1490772 m!1375047))

(assert (=> b!1490772 m!1375047))

(declare-fun m!1375059 () Bool)

(assert (=> b!1490772 m!1375059))

(declare-fun m!1375061 () Bool)

(assert (=> b!1490774 m!1375061))

(assert (=> b!1490774 m!1375053))

(assert (=> b!1490774 m!1375055))

(declare-fun m!1375063 () Bool)

(assert (=> b!1490783 m!1375063))

(declare-fun m!1375065 () Bool)

(assert (=> b!1490783 m!1375065))

(declare-fun m!1375067 () Bool)

(assert (=> b!1490783 m!1375067))

(declare-fun m!1375069 () Bool)

(assert (=> b!1490783 m!1375069))

(assert (=> b!1490783 m!1375047))

(declare-fun m!1375071 () Bool)

(assert (=> b!1490771 m!1375071))

(declare-fun m!1375073 () Bool)

(assert (=> b!1490779 m!1375073))

(assert (=> b!1490779 m!1375073))

(declare-fun m!1375075 () Bool)

(assert (=> b!1490779 m!1375075))

(assert (=> b!1490779 m!1375063))

(declare-fun m!1375077 () Bool)

(assert (=> b!1490779 m!1375077))

(declare-fun m!1375079 () Bool)

(assert (=> b!1490777 m!1375079))

(assert (=> b!1490777 m!1375063))

(assert (=> b!1490777 m!1375067))

(assert (=> b!1490777 m!1375069))

(declare-fun m!1375081 () Bool)

(assert (=> b!1490777 m!1375081))

(assert (=> b!1490777 m!1375047))

(declare-fun m!1375083 () Bool)

(assert (=> b!1490786 m!1375083))

(declare-fun m!1375085 () Bool)

(assert (=> b!1490784 m!1375085))

(declare-fun m!1375087 () Bool)

(assert (=> b!1490791 m!1375087))

(declare-fun m!1375089 () Bool)

(assert (=> b!1490775 m!1375089))

(assert (=> b!1490775 m!1375089))

(declare-fun m!1375091 () Bool)

(assert (=> b!1490775 m!1375091))

(assert (=> b!1490776 m!1375047))

(assert (=> b!1490776 m!1375047))

(declare-fun m!1375093 () Bool)

(assert (=> b!1490776 m!1375093))

(assert (=> b!1490776 m!1375093))

(assert (=> b!1490776 m!1375047))

(declare-fun m!1375095 () Bool)

(assert (=> b!1490776 m!1375095))

(assert (=> b!1490785 m!1375063))

(declare-fun m!1375097 () Bool)

(assert (=> b!1490785 m!1375097))

(declare-fun m!1375099 () Bool)

(assert (=> start!127110 m!1375099))

(declare-fun m!1375101 () Bool)

(assert (=> start!127110 m!1375101))

(check-sat (not b!1490777) (not b!1490774) (not b!1490771) (not b!1490770) (not b!1490781) (not b!1490789) (not b!1490788) (not start!127110) (not b!1490772) (not b!1490791) (not b!1490782) (not b!1490786) (not b!1490775) (not b!1490779) (not b!1490784) (not b!1490776))
(check-sat)
