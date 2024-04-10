; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125060 () Bool)

(assert start!125060)

(declare-fun b!1455624 () Bool)

(declare-fun e!819070 () Bool)

(declare-fun e!819067 () Bool)

(assert (=> b!1455624 (= e!819070 (not e!819067))))

(declare-fun res!986271 () Bool)

(assert (=> b!1455624 (=> res!986271 e!819067)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98508 0))(
  ( (array!98509 (arr!47542 (Array (_ BitVec 32) (_ BitVec 64))) (size!48092 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98508)

(assert (=> b!1455624 (= res!986271 (or (and (= (select (arr!47542 a!2862) index!646) (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47542 a!2862) index!646) (select (arr!47542 a!2862) j!93))) (= (select (arr!47542 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819068 () Bool)

(assert (=> b!1455624 e!819068))

(declare-fun res!986255 () Bool)

(assert (=> b!1455624 (=> (not res!986255) (not e!819068))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98508 (_ BitVec 32)) Bool)

(assert (=> b!1455624 (= res!986255 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49084 0))(
  ( (Unit!49085) )
))
(declare-fun lt!638023 () Unit!49084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49084)

(assert (=> b!1455624 (= lt!638023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455625 () Bool)

(declare-fun res!986259 () Bool)

(declare-fun e!819069 () Bool)

(assert (=> b!1455625 (=> (not res!986259) (not e!819069))))

(declare-datatypes ((SeekEntryResult!11794 0))(
  ( (MissingZero!11794 (index!49568 (_ BitVec 32))) (Found!11794 (index!49569 (_ BitVec 32))) (Intermediate!11794 (undefined!12606 Bool) (index!49570 (_ BitVec 32)) (x!131195 (_ BitVec 32))) (Undefined!11794) (MissingVacant!11794 (index!49571 (_ BitVec 32))) )
))
(declare-fun lt!638021 () SeekEntryResult!11794)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98508 (_ BitVec 32)) SeekEntryResult!11794)

(assert (=> b!1455625 (= res!986259 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638021))))

(declare-fun e!819063 () Bool)

(declare-fun b!1455626 () Bool)

(declare-fun lt!638024 () (_ BitVec 32))

(declare-fun lt!638022 () array!98508)

(declare-fun lt!638020 () (_ BitVec 64))

(declare-fun lt!638018 () SeekEntryResult!11794)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98508 (_ BitVec 32)) SeekEntryResult!11794)

(assert (=> b!1455626 (= e!819063 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638024 intermediateAfterIndex!19 lt!638020 lt!638022 mask!2687) lt!638018)))))

(declare-fun b!1455627 () Bool)

(declare-fun res!986258 () Bool)

(assert (=> b!1455627 (=> (not res!986258) (not e!819070))))

(declare-fun e!819064 () Bool)

(assert (=> b!1455627 (= res!986258 e!819064)))

(declare-fun c!134195 () Bool)

(assert (=> b!1455627 (= c!134195 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455628 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98508 (_ BitVec 32)) SeekEntryResult!11794)

(assert (=> b!1455628 (= e!819064 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638020 lt!638022 mask!2687) (seekEntryOrOpen!0 lt!638020 lt!638022 mask!2687)))))

(declare-fun b!1455629 () Bool)

(declare-fun e!819062 () Bool)

(assert (=> b!1455629 (= e!819067 e!819062)))

(declare-fun res!986264 () Bool)

(assert (=> b!1455629 (=> res!986264 e!819062)))

(assert (=> b!1455629 (= res!986264 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638024 #b00000000000000000000000000000000) (bvsge lt!638024 (size!48092 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455629 (= lt!638024 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455629 (= lt!638018 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638020 lt!638022 mask!2687))))

(assert (=> b!1455629 (= lt!638018 (seekEntryOrOpen!0 lt!638020 lt!638022 mask!2687))))

(declare-fun b!1455630 () Bool)

(declare-fun res!986262 () Bool)

(assert (=> b!1455630 (=> (not res!986262) (not e!819068))))

(assert (=> b!1455630 (= res!986262 (= (seekEntryOrOpen!0 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) (Found!11794 j!93)))))

(declare-fun b!1455631 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1455631 (= e!819068 (and (or (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47542 a!2862) intermediateBeforeIndex!19) (select (arr!47542 a!2862) j!93))) (let ((bdg!53167 (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47542 a!2862) index!646) bdg!53167) (= (select (arr!47542 a!2862) index!646) (select (arr!47542 a!2862) j!93))) (= (select (arr!47542 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53167 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455632 () Bool)

(declare-fun res!986263 () Bool)

(declare-fun e!819066 () Bool)

(assert (=> b!1455632 (=> (not res!986263) (not e!819066))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455632 (= res!986263 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48092 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48092 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48092 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455633 () Bool)

(assert (=> b!1455633 (= e!819062 true)))

(declare-fun lt!638019 () Bool)

(assert (=> b!1455633 (= lt!638019 e!819063)))

(declare-fun c!134196 () Bool)

(assert (=> b!1455633 (= c!134196 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455634 () Bool)

(declare-fun res!986269 () Bool)

(assert (=> b!1455634 (=> res!986269 e!819062)))

(assert (=> b!1455634 (= res!986269 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638024 (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638021)))))

(declare-fun b!1455635 () Bool)

(declare-fun res!986256 () Bool)

(assert (=> b!1455635 (=> (not res!986256) (not e!819066))))

(assert (=> b!1455635 (= res!986256 (and (= (size!48092 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48092 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48092 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455636 () Bool)

(declare-fun res!986265 () Bool)

(assert (=> b!1455636 (=> (not res!986265) (not e!819070))))

(assert (=> b!1455636 (= res!986265 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455637 () Bool)

(declare-fun res!986261 () Bool)

(assert (=> b!1455637 (=> (not res!986261) (not e!819066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455637 (= res!986261 (validKeyInArray!0 (select (arr!47542 a!2862) i!1006)))))

(declare-fun b!1455638 () Bool)

(declare-fun lt!638025 () SeekEntryResult!11794)

(assert (=> b!1455638 (= e!819064 (= lt!638025 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638020 lt!638022 mask!2687)))))

(declare-fun b!1455639 () Bool)

(assert (=> b!1455639 (= e!819069 e!819070)))

(declare-fun res!986266 () Bool)

(assert (=> b!1455639 (=> (not res!986266) (not e!819070))))

(assert (=> b!1455639 (= res!986266 (= lt!638025 (Intermediate!11794 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455639 (= lt!638025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638020 mask!2687) lt!638020 lt!638022 mask!2687))))

(assert (=> b!1455639 (= lt!638020 (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455640 () Bool)

(assert (=> b!1455640 (= e!819063 (not (= lt!638025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638024 lt!638020 lt!638022 mask!2687))))))

(declare-fun res!986270 () Bool)

(assert (=> start!125060 (=> (not res!986270) (not e!819066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125060 (= res!986270 (validMask!0 mask!2687))))

(assert (=> start!125060 e!819066))

(assert (=> start!125060 true))

(declare-fun array_inv!36570 (array!98508) Bool)

(assert (=> start!125060 (array_inv!36570 a!2862)))

(declare-fun b!1455641 () Bool)

(declare-fun e!819071 () Bool)

(assert (=> b!1455641 (= e!819071 e!819069)))

(declare-fun res!986260 () Bool)

(assert (=> b!1455641 (=> (not res!986260) (not e!819069))))

(assert (=> b!1455641 (= res!986260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47542 a!2862) j!93) mask!2687) (select (arr!47542 a!2862) j!93) a!2862 mask!2687) lt!638021))))

(assert (=> b!1455641 (= lt!638021 (Intermediate!11794 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455642 () Bool)

(assert (=> b!1455642 (= e!819066 e!819071)))

(declare-fun res!986272 () Bool)

(assert (=> b!1455642 (=> (not res!986272) (not e!819071))))

(assert (=> b!1455642 (= res!986272 (= (select (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455642 (= lt!638022 (array!98509 (store (arr!47542 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48092 a!2862)))))

(declare-fun b!1455643 () Bool)

(declare-fun res!986268 () Bool)

(assert (=> b!1455643 (=> (not res!986268) (not e!819066))))

(assert (=> b!1455643 (= res!986268 (validKeyInArray!0 (select (arr!47542 a!2862) j!93)))))

(declare-fun b!1455644 () Bool)

(declare-fun res!986257 () Bool)

(assert (=> b!1455644 (=> (not res!986257) (not e!819066))))

(assert (=> b!1455644 (= res!986257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455645 () Bool)

(declare-fun res!986267 () Bool)

(assert (=> b!1455645 (=> (not res!986267) (not e!819066))))

(declare-datatypes ((List!34043 0))(
  ( (Nil!34040) (Cons!34039 (h!35389 (_ BitVec 64)) (t!48737 List!34043)) )
))
(declare-fun arrayNoDuplicates!0 (array!98508 (_ BitVec 32) List!34043) Bool)

(assert (=> b!1455645 (= res!986267 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34040))))

(assert (= (and start!125060 res!986270) b!1455635))

(assert (= (and b!1455635 res!986256) b!1455637))

(assert (= (and b!1455637 res!986261) b!1455643))

(assert (= (and b!1455643 res!986268) b!1455644))

(assert (= (and b!1455644 res!986257) b!1455645))

(assert (= (and b!1455645 res!986267) b!1455632))

(assert (= (and b!1455632 res!986263) b!1455642))

(assert (= (and b!1455642 res!986272) b!1455641))

(assert (= (and b!1455641 res!986260) b!1455625))

(assert (= (and b!1455625 res!986259) b!1455639))

(assert (= (and b!1455639 res!986266) b!1455627))

(assert (= (and b!1455627 c!134195) b!1455638))

(assert (= (and b!1455627 (not c!134195)) b!1455628))

(assert (= (and b!1455627 res!986258) b!1455636))

(assert (= (and b!1455636 res!986265) b!1455624))

(assert (= (and b!1455624 res!986255) b!1455630))

(assert (= (and b!1455630 res!986262) b!1455631))

(assert (= (and b!1455624 (not res!986271)) b!1455629))

(assert (= (and b!1455629 (not res!986264)) b!1455634))

(assert (= (and b!1455634 (not res!986269)) b!1455633))

(assert (= (and b!1455633 c!134196) b!1455640))

(assert (= (and b!1455633 (not c!134196)) b!1455626))

(declare-fun m!1343823 () Bool)

(assert (=> b!1455645 m!1343823))

(declare-fun m!1343825 () Bool)

(assert (=> b!1455638 m!1343825))

(declare-fun m!1343827 () Bool)

(assert (=> b!1455643 m!1343827))

(assert (=> b!1455643 m!1343827))

(declare-fun m!1343829 () Bool)

(assert (=> b!1455643 m!1343829))

(assert (=> b!1455641 m!1343827))

(assert (=> b!1455641 m!1343827))

(declare-fun m!1343831 () Bool)

(assert (=> b!1455641 m!1343831))

(assert (=> b!1455641 m!1343831))

(assert (=> b!1455641 m!1343827))

(declare-fun m!1343833 () Bool)

(assert (=> b!1455641 m!1343833))

(declare-fun m!1343835 () Bool)

(assert (=> b!1455628 m!1343835))

(declare-fun m!1343837 () Bool)

(assert (=> b!1455628 m!1343837))

(declare-fun m!1343839 () Bool)

(assert (=> b!1455626 m!1343839))

(assert (=> b!1455634 m!1343827))

(assert (=> b!1455634 m!1343827))

(declare-fun m!1343841 () Bool)

(assert (=> b!1455634 m!1343841))

(declare-fun m!1343843 () Bool)

(assert (=> b!1455639 m!1343843))

(assert (=> b!1455639 m!1343843))

(declare-fun m!1343845 () Bool)

(assert (=> b!1455639 m!1343845))

(declare-fun m!1343847 () Bool)

(assert (=> b!1455639 m!1343847))

(declare-fun m!1343849 () Bool)

(assert (=> b!1455639 m!1343849))

(assert (=> b!1455630 m!1343827))

(assert (=> b!1455630 m!1343827))

(declare-fun m!1343851 () Bool)

(assert (=> b!1455630 m!1343851))

(assert (=> b!1455631 m!1343847))

(declare-fun m!1343853 () Bool)

(assert (=> b!1455631 m!1343853))

(declare-fun m!1343855 () Bool)

(assert (=> b!1455631 m!1343855))

(declare-fun m!1343857 () Bool)

(assert (=> b!1455631 m!1343857))

(assert (=> b!1455631 m!1343827))

(declare-fun m!1343859 () Bool)

(assert (=> b!1455624 m!1343859))

(assert (=> b!1455624 m!1343847))

(assert (=> b!1455624 m!1343855))

(assert (=> b!1455624 m!1343857))

(declare-fun m!1343861 () Bool)

(assert (=> b!1455624 m!1343861))

(assert (=> b!1455624 m!1343827))

(declare-fun m!1343863 () Bool)

(assert (=> b!1455640 m!1343863))

(declare-fun m!1343865 () Bool)

(assert (=> b!1455629 m!1343865))

(assert (=> b!1455629 m!1343835))

(assert (=> b!1455629 m!1343837))

(assert (=> b!1455642 m!1343847))

(declare-fun m!1343867 () Bool)

(assert (=> b!1455642 m!1343867))

(assert (=> b!1455625 m!1343827))

(assert (=> b!1455625 m!1343827))

(declare-fun m!1343869 () Bool)

(assert (=> b!1455625 m!1343869))

(declare-fun m!1343871 () Bool)

(assert (=> b!1455637 m!1343871))

(assert (=> b!1455637 m!1343871))

(declare-fun m!1343873 () Bool)

(assert (=> b!1455637 m!1343873))

(declare-fun m!1343875 () Bool)

(assert (=> start!125060 m!1343875))

(declare-fun m!1343877 () Bool)

(assert (=> start!125060 m!1343877))

(declare-fun m!1343879 () Bool)

(assert (=> b!1455644 m!1343879))

(push 1)

(assert (not b!1455629))

(assert (not b!1455640))

(assert (not b!1455638))

(assert (not b!1455644))

(assert (not b!1455637))

(assert (not b!1455628))

(assert (not b!1455630))

(assert (not b!1455626))

(assert (not b!1455639))

(assert (not start!125060))

(assert (not b!1455634))

(assert (not b!1455625))

(assert (not b!1455645))

(assert (not b!1455624))

(assert (not b!1455641))

(assert (not b!1455643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

