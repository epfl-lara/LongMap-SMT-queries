; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125044 () Bool)

(assert start!125044)

(declare-fun lt!637956 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1455891 () Bool)

(declare-fun e!819165 () Bool)

(declare-datatypes ((array!98470 0))(
  ( (array!98471 (arr!47524 (Array (_ BitVec 32) (_ BitVec 64))) (size!48076 (_ BitVec 32))) )
))
(declare-fun lt!637952 () array!98470)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11801 0))(
  ( (MissingZero!11801 (index!49596 (_ BitVec 32))) (Found!11801 (index!49597 (_ BitVec 32))) (Intermediate!11801 (undefined!12613 Bool) (index!49598 (_ BitVec 32)) (x!131221 (_ BitVec 32))) (Undefined!11801) (MissingVacant!11801 (index!49599 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11801)

(assert (=> b!1455891 (= e!819165 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637956 lt!637952 mask!2687) (seekEntryOrOpen!0 lt!637956 lt!637952 mask!2687)))))

(declare-fun b!1455893 () Bool)

(declare-fun e!819163 () Bool)

(declare-fun e!819164 () Bool)

(assert (=> b!1455893 (= e!819163 e!819164)))

(declare-fun res!986561 () Bool)

(assert (=> b!1455893 (=> res!986561 e!819164)))

(declare-fun lt!637957 () (_ BitVec 32))

(declare-fun a!2862 () array!98470)

(assert (=> b!1455893 (= res!986561 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637957 #b00000000000000000000000000000000) (bvsge lt!637957 (size!48076 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455893 (= lt!637957 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637954 () SeekEntryResult!11801)

(assert (=> b!1455893 (= lt!637954 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637956 lt!637952 mask!2687))))

(assert (=> b!1455893 (= lt!637954 (seekEntryOrOpen!0 lt!637956 lt!637952 mask!2687))))

(declare-fun b!1455894 () Bool)

(declare-fun e!819158 () Bool)

(declare-fun e!819161 () Bool)

(assert (=> b!1455894 (= e!819158 e!819161)))

(declare-fun res!986556 () Bool)

(assert (=> b!1455894 (=> (not res!986556) (not e!819161))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!637955 () SeekEntryResult!11801)

(assert (=> b!1455894 (= res!986556 (= lt!637955 (Intermediate!11801 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455894 (= lt!637955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637956 mask!2687) lt!637956 lt!637952 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455894 (= lt!637956 (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455895 () Bool)

(declare-fun res!986565 () Bool)

(declare-fun e!819156 () Bool)

(assert (=> b!1455895 (=> (not res!986565) (not e!819156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455895 (= res!986565 (validKeyInArray!0 (select (arr!47524 a!2862) j!93)))))

(declare-fun b!1455896 () Bool)

(declare-fun e!819162 () Bool)

(assert (=> b!1455896 (= e!819162 e!819158)))

(declare-fun res!986572 () Bool)

(assert (=> b!1455896 (=> (not res!986572) (not e!819158))))

(declare-fun lt!637958 () SeekEntryResult!11801)

(assert (=> b!1455896 (= res!986572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47524 a!2862) j!93) mask!2687) (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637958))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455896 (= lt!637958 (Intermediate!11801 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455897 () Bool)

(assert (=> b!1455897 (= e!819165 (= lt!637955 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637956 lt!637952 mask!2687)))))

(declare-fun b!1455898 () Bool)

(assert (=> b!1455898 (= e!819161 (not e!819163))))

(declare-fun res!986563 () Bool)

(assert (=> b!1455898 (=> res!986563 e!819163)))

(assert (=> b!1455898 (= res!986563 (or (and (= (select (arr!47524 a!2862) index!646) (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47524 a!2862) index!646) (select (arr!47524 a!2862) j!93))) (= (select (arr!47524 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819159 () Bool)

(assert (=> b!1455898 e!819159))

(declare-fun res!986571 () Bool)

(assert (=> b!1455898 (=> (not res!986571) (not e!819159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98470 (_ BitVec 32)) Bool)

(assert (=> b!1455898 (= res!986571 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48939 0))(
  ( (Unit!48940) )
))
(declare-fun lt!637953 () Unit!48939)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48939)

(assert (=> b!1455898 (= lt!637953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!819160 () Bool)

(declare-fun b!1455892 () Bool)

(assert (=> b!1455892 (= e!819160 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637957 intermediateAfterIndex!19 lt!637956 lt!637952 mask!2687) lt!637954)))))

(declare-fun res!986560 () Bool)

(assert (=> start!125044 (=> (not res!986560) (not e!819156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125044 (= res!986560 (validMask!0 mask!2687))))

(assert (=> start!125044 e!819156))

(assert (=> start!125044 true))

(declare-fun array_inv!36757 (array!98470) Bool)

(assert (=> start!125044 (array_inv!36757 a!2862)))

(declare-fun b!1455899 () Bool)

(declare-fun res!986566 () Bool)

(assert (=> b!1455899 (=> res!986566 e!819164)))

(assert (=> b!1455899 (= res!986566 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637957 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637958)))))

(declare-fun b!1455900 () Bool)

(declare-fun res!986570 () Bool)

(assert (=> b!1455900 (=> (not res!986570) (not e!819156))))

(assert (=> b!1455900 (= res!986570 (and (= (size!48076 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48076 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48076 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455901 () Bool)

(declare-fun res!986562 () Bool)

(assert (=> b!1455901 (=> (not res!986562) (not e!819159))))

(assert (=> b!1455901 (= res!986562 (= (seekEntryOrOpen!0 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) (Found!11801 j!93)))))

(declare-fun b!1455902 () Bool)

(declare-fun res!986569 () Bool)

(assert (=> b!1455902 (=> (not res!986569) (not e!819161))))

(assert (=> b!1455902 (= res!986569 e!819165)))

(declare-fun c!134181 () Bool)

(assert (=> b!1455902 (= c!134181 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455903 () Bool)

(declare-fun res!986564 () Bool)

(assert (=> b!1455903 (=> (not res!986564) (not e!819156))))

(assert (=> b!1455903 (= res!986564 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48076 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48076 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48076 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455904 () Bool)

(assert (=> b!1455904 (= e!819156 e!819162)))

(declare-fun res!986555 () Bool)

(assert (=> b!1455904 (=> (not res!986555) (not e!819162))))

(assert (=> b!1455904 (= res!986555 (= (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455904 (= lt!637952 (array!98471 (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48076 a!2862)))))

(declare-fun b!1455905 () Bool)

(declare-fun res!986568 () Bool)

(assert (=> b!1455905 (=> (not res!986568) (not e!819161))))

(assert (=> b!1455905 (= res!986568 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455906 () Bool)

(assert (=> b!1455906 (= e!819159 (and (or (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) (select (arr!47524 a!2862) j!93))) (let ((bdg!53215 (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47524 a!2862) index!646) bdg!53215) (= (select (arr!47524 a!2862) index!646) (select (arr!47524 a!2862) j!93))) (= (select (arr!47524 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53215 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455907 () Bool)

(declare-fun res!986557 () Bool)

(assert (=> b!1455907 (=> (not res!986557) (not e!819156))))

(assert (=> b!1455907 (= res!986557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455908 () Bool)

(assert (=> b!1455908 (= e!819164 true)))

(declare-fun lt!637959 () Bool)

(assert (=> b!1455908 (= lt!637959 e!819160)))

(declare-fun c!134182 () Bool)

(assert (=> b!1455908 (= c!134182 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455909 () Bool)

(assert (=> b!1455909 (= e!819160 (not (= lt!637955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637957 lt!637956 lt!637952 mask!2687))))))

(declare-fun b!1455910 () Bool)

(declare-fun res!986559 () Bool)

(assert (=> b!1455910 (=> (not res!986559) (not e!819156))))

(assert (=> b!1455910 (= res!986559 (validKeyInArray!0 (select (arr!47524 a!2862) i!1006)))))

(declare-fun b!1455911 () Bool)

(declare-fun res!986567 () Bool)

(assert (=> b!1455911 (=> (not res!986567) (not e!819158))))

(assert (=> b!1455911 (= res!986567 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637958))))

(declare-fun b!1455912 () Bool)

(declare-fun res!986558 () Bool)

(assert (=> b!1455912 (=> (not res!986558) (not e!819156))))

(declare-datatypes ((List!34103 0))(
  ( (Nil!34100) (Cons!34099 (h!35449 (_ BitVec 64)) (t!48789 List!34103)) )
))
(declare-fun arrayNoDuplicates!0 (array!98470 (_ BitVec 32) List!34103) Bool)

(assert (=> b!1455912 (= res!986558 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34100))))

(assert (= (and start!125044 res!986560) b!1455900))

(assert (= (and b!1455900 res!986570) b!1455910))

(assert (= (and b!1455910 res!986559) b!1455895))

(assert (= (and b!1455895 res!986565) b!1455907))

(assert (= (and b!1455907 res!986557) b!1455912))

(assert (= (and b!1455912 res!986558) b!1455903))

(assert (= (and b!1455903 res!986564) b!1455904))

(assert (= (and b!1455904 res!986555) b!1455896))

(assert (= (and b!1455896 res!986572) b!1455911))

(assert (= (and b!1455911 res!986567) b!1455894))

(assert (= (and b!1455894 res!986556) b!1455902))

(assert (= (and b!1455902 c!134181) b!1455897))

(assert (= (and b!1455902 (not c!134181)) b!1455891))

(assert (= (and b!1455902 res!986569) b!1455905))

(assert (= (and b!1455905 res!986568) b!1455898))

(assert (= (and b!1455898 res!986571) b!1455901))

(assert (= (and b!1455901 res!986562) b!1455906))

(assert (= (and b!1455898 (not res!986563)) b!1455893))

(assert (= (and b!1455893 (not res!986561)) b!1455899))

(assert (= (and b!1455899 (not res!986566)) b!1455908))

(assert (= (and b!1455908 c!134182) b!1455909))

(assert (= (and b!1455908 (not c!134182)) b!1455892))

(declare-fun m!1343553 () Bool)

(assert (=> b!1455894 m!1343553))

(assert (=> b!1455894 m!1343553))

(declare-fun m!1343555 () Bool)

(assert (=> b!1455894 m!1343555))

(declare-fun m!1343557 () Bool)

(assert (=> b!1455894 m!1343557))

(declare-fun m!1343559 () Bool)

(assert (=> b!1455894 m!1343559))

(declare-fun m!1343561 () Bool)

(assert (=> b!1455893 m!1343561))

(declare-fun m!1343563 () Bool)

(assert (=> b!1455893 m!1343563))

(declare-fun m!1343565 () Bool)

(assert (=> b!1455893 m!1343565))

(declare-fun m!1343567 () Bool)

(assert (=> b!1455899 m!1343567))

(assert (=> b!1455899 m!1343567))

(declare-fun m!1343569 () Bool)

(assert (=> b!1455899 m!1343569))

(assert (=> b!1455904 m!1343557))

(declare-fun m!1343571 () Bool)

(assert (=> b!1455904 m!1343571))

(assert (=> b!1455891 m!1343563))

(assert (=> b!1455891 m!1343565))

(assert (=> b!1455895 m!1343567))

(assert (=> b!1455895 m!1343567))

(declare-fun m!1343573 () Bool)

(assert (=> b!1455895 m!1343573))

(declare-fun m!1343575 () Bool)

(assert (=> start!125044 m!1343575))

(declare-fun m!1343577 () Bool)

(assert (=> start!125044 m!1343577))

(assert (=> b!1455906 m!1343557))

(declare-fun m!1343579 () Bool)

(assert (=> b!1455906 m!1343579))

(declare-fun m!1343581 () Bool)

(assert (=> b!1455906 m!1343581))

(declare-fun m!1343583 () Bool)

(assert (=> b!1455906 m!1343583))

(assert (=> b!1455906 m!1343567))

(declare-fun m!1343585 () Bool)

(assert (=> b!1455897 m!1343585))

(assert (=> b!1455896 m!1343567))

(assert (=> b!1455896 m!1343567))

(declare-fun m!1343587 () Bool)

(assert (=> b!1455896 m!1343587))

(assert (=> b!1455896 m!1343587))

(assert (=> b!1455896 m!1343567))

(declare-fun m!1343589 () Bool)

(assert (=> b!1455896 m!1343589))

(declare-fun m!1343591 () Bool)

(assert (=> b!1455912 m!1343591))

(assert (=> b!1455911 m!1343567))

(assert (=> b!1455911 m!1343567))

(declare-fun m!1343593 () Bool)

(assert (=> b!1455911 m!1343593))

(declare-fun m!1343595 () Bool)

(assert (=> b!1455907 m!1343595))

(declare-fun m!1343597 () Bool)

(assert (=> b!1455892 m!1343597))

(declare-fun m!1343599 () Bool)

(assert (=> b!1455898 m!1343599))

(assert (=> b!1455898 m!1343557))

(assert (=> b!1455898 m!1343581))

(assert (=> b!1455898 m!1343583))

(declare-fun m!1343601 () Bool)

(assert (=> b!1455898 m!1343601))

(assert (=> b!1455898 m!1343567))

(declare-fun m!1343603 () Bool)

(assert (=> b!1455910 m!1343603))

(assert (=> b!1455910 m!1343603))

(declare-fun m!1343605 () Bool)

(assert (=> b!1455910 m!1343605))

(declare-fun m!1343607 () Bool)

(assert (=> b!1455909 m!1343607))

(assert (=> b!1455901 m!1343567))

(assert (=> b!1455901 m!1343567))

(declare-fun m!1343609 () Bool)

(assert (=> b!1455901 m!1343609))

(check-sat (not b!1455891) (not b!1455895) (not b!1455893) (not b!1455909) (not b!1455899) (not start!125044) (not b!1455892) (not b!1455896) (not b!1455898) (not b!1455912) (not b!1455894) (not b!1455911) (not b!1455910) (not b!1455897) (not b!1455907) (not b!1455901))
(check-sat)
