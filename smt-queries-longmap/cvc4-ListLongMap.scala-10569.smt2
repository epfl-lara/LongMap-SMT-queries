; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124556 () Bool)

(assert start!124556)

(declare-fun b!1441627 () Bool)

(declare-fun res!973950 () Bool)

(declare-fun e!812653 () Bool)

(assert (=> b!1441627 (=> (not res!973950) (not e!812653))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98004 0))(
  ( (array!98005 (arr!47290 (Array (_ BitVec 32) (_ BitVec 64))) (size!47840 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98004)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11542 0))(
  ( (MissingZero!11542 (index!48560 (_ BitVec 32))) (Found!11542 (index!48561 (_ BitVec 32))) (Intermediate!11542 (undefined!12354 Bool) (index!48562 (_ BitVec 32)) (x!130271 (_ BitVec 32))) (Undefined!11542) (MissingVacant!11542 (index!48563 (_ BitVec 32))) )
))
(declare-fun lt!633307 () SeekEntryResult!11542)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98004 (_ BitVec 32)) SeekEntryResult!11542)

(assert (=> b!1441627 (= res!973950 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633307))))

(declare-fun b!1441628 () Bool)

(declare-fun e!812649 () Bool)

(assert (=> b!1441628 (= e!812649 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98004 (_ BitVec 32)) Bool)

(assert (=> b!1441628 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48580 0))(
  ( (Unit!48581) )
))
(declare-fun lt!633305 () Unit!48580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48580)

(assert (=> b!1441628 (= lt!633305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!973952 () Bool)

(declare-fun e!812654 () Bool)

(assert (=> start!124556 (=> (not res!973952) (not e!812654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124556 (= res!973952 (validMask!0 mask!2687))))

(assert (=> start!124556 e!812654))

(assert (=> start!124556 true))

(declare-fun array_inv!36318 (array!98004) Bool)

(assert (=> start!124556 (array_inv!36318 a!2862)))

(declare-fun b!1441629 () Bool)

(declare-fun e!812652 () Bool)

(assert (=> b!1441629 (= e!812654 e!812652)))

(declare-fun res!973960 () Bool)

(assert (=> b!1441629 (=> (not res!973960) (not e!812652))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441629 (= res!973960 (= (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633306 () array!98004)

(assert (=> b!1441629 (= lt!633306 (array!98005 (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47840 a!2862)))))

(declare-fun b!1441630 () Bool)

(declare-fun res!973955 () Bool)

(assert (=> b!1441630 (=> (not res!973955) (not e!812654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441630 (= res!973955 (validKeyInArray!0 (select (arr!47290 a!2862) i!1006)))))

(declare-fun b!1441631 () Bool)

(assert (=> b!1441631 (= e!812652 e!812653)))

(declare-fun res!973953 () Bool)

(assert (=> b!1441631 (=> (not res!973953) (not e!812653))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441631 (= res!973953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47290 a!2862) j!93) mask!2687) (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633307))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441631 (= lt!633307 (Intermediate!11542 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441632 () Bool)

(declare-fun res!973957 () Bool)

(assert (=> b!1441632 (=> (not res!973957) (not e!812654))))

(declare-datatypes ((List!33791 0))(
  ( (Nil!33788) (Cons!33787 (h!35137 (_ BitVec 64)) (t!48485 List!33791)) )
))
(declare-fun arrayNoDuplicates!0 (array!98004 (_ BitVec 32) List!33791) Bool)

(assert (=> b!1441632 (= res!973957 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33788))))

(declare-fun b!1441633 () Bool)

(declare-fun res!973956 () Bool)

(assert (=> b!1441633 (=> (not res!973956) (not e!812654))))

(assert (=> b!1441633 (= res!973956 (and (= (size!47840 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47840 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47840 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441634 () Bool)

(declare-fun res!973954 () Bool)

(assert (=> b!1441634 (=> (not res!973954) (not e!812654))))

(assert (=> b!1441634 (= res!973954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!633308 () (_ BitVec 64))

(declare-fun e!812651 () Bool)

(declare-fun lt!633309 () SeekEntryResult!11542)

(declare-fun b!1441635 () Bool)

(assert (=> b!1441635 (= e!812651 (= lt!633309 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633308 lt!633306 mask!2687)))))

(declare-fun b!1441636 () Bool)

(declare-fun res!973958 () Bool)

(assert (=> b!1441636 (=> (not res!973958) (not e!812649))))

(assert (=> b!1441636 (= res!973958 e!812651)))

(declare-fun c!133350 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441636 (= c!133350 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441637 () Bool)

(declare-fun res!973959 () Bool)

(assert (=> b!1441637 (=> (not res!973959) (not e!812654))))

(assert (=> b!1441637 (= res!973959 (validKeyInArray!0 (select (arr!47290 a!2862) j!93)))))

(declare-fun b!1441638 () Bool)

(declare-fun res!973951 () Bool)

(assert (=> b!1441638 (=> (not res!973951) (not e!812649))))

(assert (=> b!1441638 (= res!973951 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441639 () Bool)

(assert (=> b!1441639 (= e!812653 e!812649)))

(declare-fun res!973949 () Bool)

(assert (=> b!1441639 (=> (not res!973949) (not e!812649))))

(assert (=> b!1441639 (= res!973949 (= lt!633309 (Intermediate!11542 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441639 (= lt!633309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633308 mask!2687) lt!633308 lt!633306 mask!2687))))

(assert (=> b!1441639 (= lt!633308 (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98004 (_ BitVec 32)) SeekEntryResult!11542)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98004 (_ BitVec 32)) SeekEntryResult!11542)

(assert (=> b!1441640 (= e!812651 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633308 lt!633306 mask!2687) (seekEntryOrOpen!0 lt!633308 lt!633306 mask!2687)))))

(declare-fun b!1441641 () Bool)

(declare-fun res!973948 () Bool)

(assert (=> b!1441641 (=> (not res!973948) (not e!812654))))

(assert (=> b!1441641 (= res!973948 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47840 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47840 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47840 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124556 res!973952) b!1441633))

(assert (= (and b!1441633 res!973956) b!1441630))

(assert (= (and b!1441630 res!973955) b!1441637))

(assert (= (and b!1441637 res!973959) b!1441634))

(assert (= (and b!1441634 res!973954) b!1441632))

(assert (= (and b!1441632 res!973957) b!1441641))

(assert (= (and b!1441641 res!973948) b!1441629))

(assert (= (and b!1441629 res!973960) b!1441631))

(assert (= (and b!1441631 res!973953) b!1441627))

(assert (= (and b!1441627 res!973950) b!1441639))

(assert (= (and b!1441639 res!973949) b!1441636))

(assert (= (and b!1441636 c!133350) b!1441635))

(assert (= (and b!1441636 (not c!133350)) b!1441640))

(assert (= (and b!1441636 res!973958) b!1441638))

(assert (= (and b!1441638 res!973951) b!1441628))

(declare-fun m!1330837 () Bool)

(assert (=> b!1441635 m!1330837))

(declare-fun m!1330839 () Bool)

(assert (=> b!1441631 m!1330839))

(assert (=> b!1441631 m!1330839))

(declare-fun m!1330841 () Bool)

(assert (=> b!1441631 m!1330841))

(assert (=> b!1441631 m!1330841))

(assert (=> b!1441631 m!1330839))

(declare-fun m!1330843 () Bool)

(assert (=> b!1441631 m!1330843))

(declare-fun m!1330845 () Bool)

(assert (=> b!1441630 m!1330845))

(assert (=> b!1441630 m!1330845))

(declare-fun m!1330847 () Bool)

(assert (=> b!1441630 m!1330847))

(declare-fun m!1330849 () Bool)

(assert (=> b!1441629 m!1330849))

(declare-fun m!1330851 () Bool)

(assert (=> b!1441629 m!1330851))

(declare-fun m!1330853 () Bool)

(assert (=> start!124556 m!1330853))

(declare-fun m!1330855 () Bool)

(assert (=> start!124556 m!1330855))

(declare-fun m!1330857 () Bool)

(assert (=> b!1441634 m!1330857))

(declare-fun m!1330859 () Bool)

(assert (=> b!1441640 m!1330859))

(declare-fun m!1330861 () Bool)

(assert (=> b!1441640 m!1330861))

(assert (=> b!1441627 m!1330839))

(assert (=> b!1441627 m!1330839))

(declare-fun m!1330863 () Bool)

(assert (=> b!1441627 m!1330863))

(declare-fun m!1330865 () Bool)

(assert (=> b!1441639 m!1330865))

(assert (=> b!1441639 m!1330865))

(declare-fun m!1330867 () Bool)

(assert (=> b!1441639 m!1330867))

(assert (=> b!1441639 m!1330849))

(declare-fun m!1330869 () Bool)

(assert (=> b!1441639 m!1330869))

(assert (=> b!1441637 m!1330839))

(assert (=> b!1441637 m!1330839))

(declare-fun m!1330871 () Bool)

(assert (=> b!1441637 m!1330871))

(declare-fun m!1330873 () Bool)

(assert (=> b!1441628 m!1330873))

(declare-fun m!1330875 () Bool)

(assert (=> b!1441628 m!1330875))

(declare-fun m!1330877 () Bool)

(assert (=> b!1441632 m!1330877))

(push 1)

(assert (not b!1441637))

(assert (not b!1441639))

(assert (not b!1441632))

