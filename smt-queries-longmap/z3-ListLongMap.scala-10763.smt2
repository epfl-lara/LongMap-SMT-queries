; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125866 () Bool)

(assert start!125866)

(declare-fun b!1473695 () Bool)

(declare-fun res!1001092 () Bool)

(declare-fun e!826922 () Bool)

(assert (=> b!1473695 (=> (not res!1001092) (not e!826922))))

(declare-fun e!826919 () Bool)

(assert (=> b!1473695 (= res!1001092 e!826919)))

(declare-fun c!135826 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473695 (= c!135826 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473696 () Bool)

(declare-fun res!1001090 () Bool)

(declare-fun e!826926 () Bool)

(assert (=> b!1473696 (=> (not res!1001090) (not e!826926))))

(declare-datatypes ((array!99121 0))(
  ( (array!99122 (arr!47845 (Array (_ BitVec 32) (_ BitVec 64))) (size!48397 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99121)

(declare-datatypes ((List!34424 0))(
  ( (Nil!34421) (Cons!34420 (h!35779 (_ BitVec 64)) (t!49110 List!34424)) )
))
(declare-fun arrayNoDuplicates!0 (array!99121 (_ BitVec 32) List!34424) Bool)

(assert (=> b!1473696 (= res!1001090 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34421))))

(declare-fun b!1473697 () Bool)

(declare-fun res!1001082 () Bool)

(assert (=> b!1473697 (=> (not res!1001082) (not e!826926))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99121 (_ BitVec 32)) Bool)

(assert (=> b!1473697 (= res!1001082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473698 () Bool)

(declare-fun res!1001079 () Bool)

(declare-fun e!826920 () Bool)

(assert (=> b!1473698 (=> (not res!1001079) (not e!826920))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12110 0))(
  ( (MissingZero!12110 (index!50832 (_ BitVec 32))) (Found!12110 (index!50833 (_ BitVec 32))) (Intermediate!12110 (undefined!12922 Bool) (index!50834 (_ BitVec 32)) (x!132413 (_ BitVec 32))) (Undefined!12110) (MissingVacant!12110 (index!50835 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99121 (_ BitVec 32)) SeekEntryResult!12110)

(assert (=> b!1473698 (= res!1001079 (= (seekEntryOrOpen!0 (select (arr!47845 a!2862) j!93) a!2862 mask!2687) (Found!12110 j!93)))))

(declare-fun b!1473699 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643844 () (_ BitVec 64))

(declare-fun lt!643843 () array!99121)

(declare-fun lt!643847 () SeekEntryResult!12110)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99121 (_ BitVec 32)) SeekEntryResult!12110)

(assert (=> b!1473699 (= e!826919 (= lt!643847 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643844 lt!643843 mask!2687)))))

(declare-fun b!1473700 () Bool)

(declare-fun res!1001080 () Bool)

(assert (=> b!1473700 (=> (not res!1001080) (not e!826926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473700 (= res!1001080 (validKeyInArray!0 (select (arr!47845 a!2862) j!93)))))

(declare-fun b!1473701 () Bool)

(declare-fun e!826924 () Bool)

(assert (=> b!1473701 (= e!826924 true)))

(declare-fun lt!643845 () SeekEntryResult!12110)

(assert (=> b!1473701 (= lt!643845 (seekEntryOrOpen!0 lt!643844 lt!643843 mask!2687))))

(declare-fun b!1473702 () Bool)

(assert (=> b!1473702 (= e!826922 (not e!826924))))

(declare-fun res!1001086 () Bool)

(assert (=> b!1473702 (=> res!1001086 e!826924)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473702 (= res!1001086 (or (not (= (select (arr!47845 a!2862) index!646) (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47845 a!2862) index!646) (select (arr!47845 a!2862) j!93)))))))

(assert (=> b!1473702 e!826920))

(declare-fun res!1001081 () Bool)

(assert (=> b!1473702 (=> (not res!1001081) (not e!826920))))

(assert (=> b!1473702 (= res!1001081 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49401 0))(
  ( (Unit!49402) )
))
(declare-fun lt!643846 () Unit!49401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49401)

(assert (=> b!1473702 (= lt!643846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473703 () Bool)

(declare-fun res!1001084 () Bool)

(assert (=> b!1473703 (=> (not res!1001084) (not e!826926))))

(assert (=> b!1473703 (= res!1001084 (and (= (size!48397 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48397 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48397 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473704 () Bool)

(assert (=> b!1473704 (= e!826920 (or (= (select (arr!47845 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47845 a!2862) intermediateBeforeIndex!19) (select (arr!47845 a!2862) j!93))))))

(declare-fun b!1473705 () Bool)

(declare-fun e!826923 () Bool)

(declare-fun e!826925 () Bool)

(assert (=> b!1473705 (= e!826923 e!826925)))

(declare-fun res!1001083 () Bool)

(assert (=> b!1473705 (=> (not res!1001083) (not e!826925))))

(declare-fun lt!643848 () SeekEntryResult!12110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473705 (= res!1001083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47845 a!2862) j!93) mask!2687) (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643848))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473705 (= lt!643848 (Intermediate!12110 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473706 () Bool)

(assert (=> b!1473706 (= e!826925 e!826922)))

(declare-fun res!1001078 () Bool)

(assert (=> b!1473706 (=> (not res!1001078) (not e!826922))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473706 (= res!1001078 (= lt!643847 (Intermediate!12110 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473706 (= lt!643847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643844 mask!2687) lt!643844 lt!643843 mask!2687))))

(assert (=> b!1473706 (= lt!643844 (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473707 () Bool)

(assert (=> b!1473707 (= e!826926 e!826923)))

(declare-fun res!1001091 () Bool)

(assert (=> b!1473707 (=> (not res!1001091) (not e!826923))))

(assert (=> b!1473707 (= res!1001091 (= (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473707 (= lt!643843 (array!99122 (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48397 a!2862)))))

(declare-fun res!1001085 () Bool)

(assert (=> start!125866 (=> (not res!1001085) (not e!826926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125866 (= res!1001085 (validMask!0 mask!2687))))

(assert (=> start!125866 e!826926))

(assert (=> start!125866 true))

(declare-fun array_inv!37078 (array!99121) Bool)

(assert (=> start!125866 (array_inv!37078 a!2862)))

(declare-fun b!1473694 () Bool)

(declare-fun res!1001087 () Bool)

(assert (=> b!1473694 (=> (not res!1001087) (not e!826926))))

(assert (=> b!1473694 (= res!1001087 (validKeyInArray!0 (select (arr!47845 a!2862) i!1006)))))

(declare-fun b!1473708 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99121 (_ BitVec 32)) SeekEntryResult!12110)

(assert (=> b!1473708 (= e!826919 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643844 lt!643843 mask!2687) (seekEntryOrOpen!0 lt!643844 lt!643843 mask!2687)))))

(declare-fun b!1473709 () Bool)

(declare-fun res!1001077 () Bool)

(assert (=> b!1473709 (=> (not res!1001077) (not e!826926))))

(assert (=> b!1473709 (= res!1001077 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48397 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48397 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48397 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473710 () Bool)

(declare-fun res!1001088 () Bool)

(assert (=> b!1473710 (=> (not res!1001088) (not e!826922))))

(assert (=> b!1473710 (= res!1001088 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473711 () Bool)

(declare-fun res!1001089 () Bool)

(assert (=> b!1473711 (=> (not res!1001089) (not e!826925))))

(assert (=> b!1473711 (= res!1001089 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643848))))

(assert (= (and start!125866 res!1001085) b!1473703))

(assert (= (and b!1473703 res!1001084) b!1473694))

(assert (= (and b!1473694 res!1001087) b!1473700))

(assert (= (and b!1473700 res!1001080) b!1473697))

(assert (= (and b!1473697 res!1001082) b!1473696))

(assert (= (and b!1473696 res!1001090) b!1473709))

(assert (= (and b!1473709 res!1001077) b!1473707))

(assert (= (and b!1473707 res!1001091) b!1473705))

(assert (= (and b!1473705 res!1001083) b!1473711))

(assert (= (and b!1473711 res!1001089) b!1473706))

(assert (= (and b!1473706 res!1001078) b!1473695))

(assert (= (and b!1473695 c!135826) b!1473699))

(assert (= (and b!1473695 (not c!135826)) b!1473708))

(assert (= (and b!1473695 res!1001092) b!1473710))

(assert (= (and b!1473710 res!1001088) b!1473702))

(assert (= (and b!1473702 res!1001081) b!1473698))

(assert (= (and b!1473698 res!1001079) b!1473704))

(assert (= (and b!1473702 (not res!1001086)) b!1473701))

(declare-fun m!1359705 () Bool)

(assert (=> b!1473694 m!1359705))

(assert (=> b!1473694 m!1359705))

(declare-fun m!1359707 () Bool)

(assert (=> b!1473694 m!1359707))

(declare-fun m!1359709 () Bool)

(assert (=> start!125866 m!1359709))

(declare-fun m!1359711 () Bool)

(assert (=> start!125866 m!1359711))

(declare-fun m!1359713 () Bool)

(assert (=> b!1473705 m!1359713))

(assert (=> b!1473705 m!1359713))

(declare-fun m!1359715 () Bool)

(assert (=> b!1473705 m!1359715))

(assert (=> b!1473705 m!1359715))

(assert (=> b!1473705 m!1359713))

(declare-fun m!1359717 () Bool)

(assert (=> b!1473705 m!1359717))

(declare-fun m!1359719 () Bool)

(assert (=> b!1473696 m!1359719))

(declare-fun m!1359721 () Bool)

(assert (=> b!1473702 m!1359721))

(declare-fun m!1359723 () Bool)

(assert (=> b!1473702 m!1359723))

(declare-fun m!1359725 () Bool)

(assert (=> b!1473702 m!1359725))

(declare-fun m!1359727 () Bool)

(assert (=> b!1473702 m!1359727))

(declare-fun m!1359729 () Bool)

(assert (=> b!1473702 m!1359729))

(assert (=> b!1473702 m!1359713))

(declare-fun m!1359731 () Bool)

(assert (=> b!1473708 m!1359731))

(declare-fun m!1359733 () Bool)

(assert (=> b!1473708 m!1359733))

(assert (=> b!1473707 m!1359723))

(declare-fun m!1359735 () Bool)

(assert (=> b!1473707 m!1359735))

(assert (=> b!1473701 m!1359733))

(assert (=> b!1473698 m!1359713))

(assert (=> b!1473698 m!1359713))

(declare-fun m!1359737 () Bool)

(assert (=> b!1473698 m!1359737))

(declare-fun m!1359739 () Bool)

(assert (=> b!1473706 m!1359739))

(assert (=> b!1473706 m!1359739))

(declare-fun m!1359741 () Bool)

(assert (=> b!1473706 m!1359741))

(assert (=> b!1473706 m!1359723))

(declare-fun m!1359743 () Bool)

(assert (=> b!1473706 m!1359743))

(declare-fun m!1359745 () Bool)

(assert (=> b!1473704 m!1359745))

(assert (=> b!1473704 m!1359713))

(declare-fun m!1359747 () Bool)

(assert (=> b!1473697 m!1359747))

(assert (=> b!1473711 m!1359713))

(assert (=> b!1473711 m!1359713))

(declare-fun m!1359749 () Bool)

(assert (=> b!1473711 m!1359749))

(assert (=> b!1473700 m!1359713))

(assert (=> b!1473700 m!1359713))

(declare-fun m!1359751 () Bool)

(assert (=> b!1473700 m!1359751))

(declare-fun m!1359753 () Bool)

(assert (=> b!1473699 m!1359753))

(check-sat (not b!1473699) (not b!1473711) (not b!1473698) (not b!1473701) (not b!1473697) (not b!1473700) (not b!1473705) (not b!1473696) (not start!125866) (not b!1473694) (not b!1473702) (not b!1473708) (not b!1473706))
(check-sat)
