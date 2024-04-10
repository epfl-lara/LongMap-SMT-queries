; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125282 () Bool)

(assert start!125282)

(declare-fun b!1462780 () Bool)

(declare-fun e!822225 () Bool)

(declare-fun e!822229 () Bool)

(assert (=> b!1462780 (= e!822225 e!822229)))

(declare-fun res!992151 () Bool)

(assert (=> b!1462780 (=> (not res!992151) (not e!822229))))

(declare-datatypes ((SeekEntryResult!11905 0))(
  ( (MissingZero!11905 (index!50012 (_ BitVec 32))) (Found!11905 (index!50013 (_ BitVec 32))) (Intermediate!11905 (undefined!12717 Bool) (index!50014 (_ BitVec 32)) (x!131602 (_ BitVec 32))) (Undefined!11905) (MissingVacant!11905 (index!50015 (_ BitVec 32))) )
))
(declare-fun lt!640561 () SeekEntryResult!11905)

(declare-datatypes ((array!98730 0))(
  ( (array!98731 (arr!47653 (Array (_ BitVec 32) (_ BitVec 64))) (size!48203 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98730)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98730 (_ BitVec 32)) SeekEntryResult!11905)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462780 (= res!992151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47653 a!2862) j!93) mask!2687) (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640561))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462780 (= lt!640561 (Intermediate!11905 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462781 () Bool)

(declare-fun res!992167 () Bool)

(declare-fun e!822224 () Bool)

(assert (=> b!1462781 (=> (not res!992167) (not e!822224))))

(declare-datatypes ((List!34154 0))(
  ( (Nil!34151) (Cons!34150 (h!35500 (_ BitVec 64)) (t!48848 List!34154)) )
))
(declare-fun arrayNoDuplicates!0 (array!98730 (_ BitVec 32) List!34154) Bool)

(assert (=> b!1462781 (= res!992167 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34151))))

(declare-fun b!1462782 () Bool)

(declare-fun res!992166 () Bool)

(assert (=> b!1462782 (=> (not res!992166) (not e!822229))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462782 (= res!992166 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640561))))

(declare-fun b!1462783 () Bool)

(declare-fun res!992152 () Bool)

(declare-fun e!822222 () Bool)

(assert (=> b!1462783 (=> (not res!992152) (not e!822222))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462783 (= res!992152 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462784 () Bool)

(declare-fun res!992164 () Bool)

(assert (=> b!1462784 (=> (not res!992164) (not e!822224))))

(assert (=> b!1462784 (= res!992164 (and (= (size!48203 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48203 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48203 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462785 () Bool)

(assert (=> b!1462785 (= e!822224 e!822225)))

(declare-fun res!992162 () Bool)

(assert (=> b!1462785 (=> (not res!992162) (not e!822225))))

(assert (=> b!1462785 (= res!992162 (= (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640559 () array!98730)

(assert (=> b!1462785 (= lt!640559 (array!98731 (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48203 a!2862)))))

(declare-fun b!1462786 () Bool)

(declare-fun lt!640557 () SeekEntryResult!11905)

(declare-fun e!822223 () Bool)

(declare-fun lt!640563 () (_ BitVec 64))

(assert (=> b!1462786 (= e!822223 (= lt!640557 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640563 lt!640559 mask!2687)))))

(declare-fun b!1462787 () Bool)

(declare-fun res!992153 () Bool)

(assert (=> b!1462787 (=> (not res!992153) (not e!822224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462787 (= res!992153 (validKeyInArray!0 (select (arr!47653 a!2862) i!1006)))))

(declare-fun b!1462788 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98730 (_ BitVec 32)) SeekEntryResult!11905)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98730 (_ BitVec 32)) SeekEntryResult!11905)

(assert (=> b!1462788 (= e!822223 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640563 lt!640559 mask!2687) (seekEntryOrOpen!0 lt!640563 lt!640559 mask!2687)))))

(declare-fun b!1462789 () Bool)

(declare-fun e!822221 () Bool)

(assert (=> b!1462789 (= e!822221 true)))

(declare-fun lt!640562 () Bool)

(declare-fun e!822226 () Bool)

(assert (=> b!1462789 (= lt!640562 e!822226)))

(declare-fun c!134826 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462789 (= c!134826 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462790 () Bool)

(declare-fun res!992157 () Bool)

(declare-fun e!822227 () Bool)

(assert (=> b!1462790 (=> (not res!992157) (not e!822227))))

(assert (=> b!1462790 (= res!992157 (= (seekEntryOrOpen!0 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) (Found!11905 j!93)))))

(declare-fun b!1462791 () Bool)

(declare-fun e!822230 () Bool)

(assert (=> b!1462791 (= e!822230 e!822221)))

(declare-fun res!992155 () Bool)

(assert (=> b!1462791 (=> res!992155 e!822221)))

(declare-fun lt!640558 () (_ BitVec 32))

(assert (=> b!1462791 (= res!992155 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640558 #b00000000000000000000000000000000) (bvsge lt!640558 (size!48203 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462791 (= lt!640558 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462792 () Bool)

(assert (=> b!1462792 (= e!822229 e!822222)))

(declare-fun res!992158 () Bool)

(assert (=> b!1462792 (=> (not res!992158) (not e!822222))))

(assert (=> b!1462792 (= res!992158 (= lt!640557 (Intermediate!11905 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462792 (= lt!640557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640563 mask!2687) lt!640563 lt!640559 mask!2687))))

(assert (=> b!1462792 (= lt!640563 (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462793 () Bool)

(declare-fun res!992165 () Bool)

(assert (=> b!1462793 (=> (not res!992165) (not e!822224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98730 (_ BitVec 32)) Bool)

(assert (=> b!1462793 (= res!992165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462794 () Bool)

(declare-fun res!992163 () Bool)

(assert (=> b!1462794 (=> res!992163 e!822221)))

(assert (=> b!1462794 (= res!992163 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640558 (select (arr!47653 a!2862) j!93) a!2862 mask!2687) lt!640561)))))

(declare-fun b!1462779 () Bool)

(assert (=> b!1462779 (= e!822226 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640558 intermediateAfterIndex!19 lt!640563 lt!640559 mask!2687) (seekEntryOrOpen!0 lt!640563 lt!640559 mask!2687))))))

(declare-fun res!992156 () Bool)

(assert (=> start!125282 (=> (not res!992156) (not e!822224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125282 (= res!992156 (validMask!0 mask!2687))))

(assert (=> start!125282 e!822224))

(assert (=> start!125282 true))

(declare-fun array_inv!36681 (array!98730) Bool)

(assert (=> start!125282 (array_inv!36681 a!2862)))

(declare-fun b!1462795 () Bool)

(assert (=> b!1462795 (= e!822222 (not e!822230))))

(declare-fun res!992154 () Bool)

(assert (=> b!1462795 (=> res!992154 e!822230)))

(assert (=> b!1462795 (= res!992154 (or (and (= (select (arr!47653 a!2862) index!646) (select (store (arr!47653 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47653 a!2862) index!646) (select (arr!47653 a!2862) j!93))) (= (select (arr!47653 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462795 e!822227))

(declare-fun res!992160 () Bool)

(assert (=> b!1462795 (=> (not res!992160) (not e!822227))))

(assert (=> b!1462795 (= res!992160 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49306 0))(
  ( (Unit!49307) )
))
(declare-fun lt!640560 () Unit!49306)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49306)

(assert (=> b!1462795 (= lt!640560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462796 () Bool)

(declare-fun res!992150 () Bool)

(assert (=> b!1462796 (=> (not res!992150) (not e!822224))))

(assert (=> b!1462796 (= res!992150 (validKeyInArray!0 (select (arr!47653 a!2862) j!93)))))

(declare-fun b!1462797 () Bool)

(declare-fun res!992159 () Bool)

(assert (=> b!1462797 (=> (not res!992159) (not e!822224))))

(assert (=> b!1462797 (= res!992159 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48203 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48203 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48203 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462798 () Bool)

(declare-fun res!992161 () Bool)

(assert (=> b!1462798 (=> (not res!992161) (not e!822222))))

(assert (=> b!1462798 (= res!992161 e!822223)))

(declare-fun c!134825 () Bool)

(assert (=> b!1462798 (= c!134825 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462799 () Bool)

(assert (=> b!1462799 (= e!822227 (or (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47653 a!2862) intermediateBeforeIndex!19) (select (arr!47653 a!2862) j!93))))))

(declare-fun b!1462800 () Bool)

(assert (=> b!1462800 (= e!822226 (not (= lt!640557 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640558 lt!640563 lt!640559 mask!2687))))))

(assert (= (and start!125282 res!992156) b!1462784))

(assert (= (and b!1462784 res!992164) b!1462787))

(assert (= (and b!1462787 res!992153) b!1462796))

(assert (= (and b!1462796 res!992150) b!1462793))

(assert (= (and b!1462793 res!992165) b!1462781))

(assert (= (and b!1462781 res!992167) b!1462797))

(assert (= (and b!1462797 res!992159) b!1462785))

(assert (= (and b!1462785 res!992162) b!1462780))

(assert (= (and b!1462780 res!992151) b!1462782))

(assert (= (and b!1462782 res!992166) b!1462792))

(assert (= (and b!1462792 res!992158) b!1462798))

(assert (= (and b!1462798 c!134825) b!1462786))

(assert (= (and b!1462798 (not c!134825)) b!1462788))

(assert (= (and b!1462798 res!992161) b!1462783))

(assert (= (and b!1462783 res!992152) b!1462795))

(assert (= (and b!1462795 res!992160) b!1462790))

(assert (= (and b!1462790 res!992157) b!1462799))

(assert (= (and b!1462795 (not res!992154)) b!1462791))

(assert (= (and b!1462791 (not res!992155)) b!1462794))

(assert (= (and b!1462794 (not res!992163)) b!1462789))

(assert (= (and b!1462789 c!134826) b!1462800))

(assert (= (and b!1462789 (not c!134826)) b!1462779))

(declare-fun m!1350195 () Bool)

(assert (=> b!1462796 m!1350195))

(assert (=> b!1462796 m!1350195))

(declare-fun m!1350197 () Bool)

(assert (=> b!1462796 m!1350197))

(declare-fun m!1350199 () Bool)

(assert (=> b!1462785 m!1350199))

(declare-fun m!1350201 () Bool)

(assert (=> b!1462785 m!1350201))

(assert (=> b!1462780 m!1350195))

(assert (=> b!1462780 m!1350195))

(declare-fun m!1350203 () Bool)

(assert (=> b!1462780 m!1350203))

(assert (=> b!1462780 m!1350203))

(assert (=> b!1462780 m!1350195))

(declare-fun m!1350205 () Bool)

(assert (=> b!1462780 m!1350205))

(declare-fun m!1350207 () Bool)

(assert (=> b!1462788 m!1350207))

(declare-fun m!1350209 () Bool)

(assert (=> b!1462788 m!1350209))

(assert (=> b!1462782 m!1350195))

(assert (=> b!1462782 m!1350195))

(declare-fun m!1350211 () Bool)

(assert (=> b!1462782 m!1350211))

(declare-fun m!1350213 () Bool)

(assert (=> b!1462795 m!1350213))

(assert (=> b!1462795 m!1350199))

(declare-fun m!1350215 () Bool)

(assert (=> b!1462795 m!1350215))

(declare-fun m!1350217 () Bool)

(assert (=> b!1462795 m!1350217))

(declare-fun m!1350219 () Bool)

(assert (=> b!1462795 m!1350219))

(assert (=> b!1462795 m!1350195))

(declare-fun m!1350221 () Bool)

(assert (=> b!1462800 m!1350221))

(declare-fun m!1350223 () Bool)

(assert (=> b!1462779 m!1350223))

(assert (=> b!1462779 m!1350209))

(declare-fun m!1350225 () Bool)

(assert (=> b!1462793 m!1350225))

(declare-fun m!1350227 () Bool)

(assert (=> start!125282 m!1350227))

(declare-fun m!1350229 () Bool)

(assert (=> start!125282 m!1350229))

(declare-fun m!1350231 () Bool)

(assert (=> b!1462792 m!1350231))

(assert (=> b!1462792 m!1350231))

(declare-fun m!1350233 () Bool)

(assert (=> b!1462792 m!1350233))

(assert (=> b!1462792 m!1350199))

(declare-fun m!1350235 () Bool)

(assert (=> b!1462792 m!1350235))

(assert (=> b!1462790 m!1350195))

(assert (=> b!1462790 m!1350195))

(declare-fun m!1350237 () Bool)

(assert (=> b!1462790 m!1350237))

(declare-fun m!1350239 () Bool)

(assert (=> b!1462787 m!1350239))

(assert (=> b!1462787 m!1350239))

(declare-fun m!1350241 () Bool)

(assert (=> b!1462787 m!1350241))

(assert (=> b!1462794 m!1350195))

(assert (=> b!1462794 m!1350195))

(declare-fun m!1350243 () Bool)

(assert (=> b!1462794 m!1350243))

(declare-fun m!1350245 () Bool)

(assert (=> b!1462781 m!1350245))

(declare-fun m!1350247 () Bool)

(assert (=> b!1462799 m!1350247))

(assert (=> b!1462799 m!1350195))

(declare-fun m!1350249 () Bool)

(assert (=> b!1462791 m!1350249))

(declare-fun m!1350251 () Bool)

(assert (=> b!1462786 m!1350251))

(push 1)

