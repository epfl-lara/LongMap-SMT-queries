; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126394 () Bool)

(assert start!126394)

(declare-fun b!1481873 () Bool)

(declare-fun res!1007152 () Bool)

(declare-fun e!831055 () Bool)

(assert (=> b!1481873 (=> (not res!1007152) (not e!831055))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99413 0))(
  ( (array!99414 (arr!47984 (Array (_ BitVec 32) (_ BitVec 64))) (size!48534 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99413)

(assert (=> b!1481873 (= res!1007152 (and (= (size!48534 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48534 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48534 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1007157 () Bool)

(assert (=> start!126394 (=> (not res!1007157) (not e!831055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126394 (= res!1007157 (validMask!0 mask!2687))))

(assert (=> start!126394 e!831055))

(assert (=> start!126394 true))

(declare-fun array_inv!37012 (array!99413) Bool)

(assert (=> start!126394 (array_inv!37012 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1481874 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!831058 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481874 (= e!831058 (and (or (= (select (arr!47984 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47984 a!2862) intermediateBeforeIndex!19) (select (arr!47984 a!2862) j!93))) (or (and (= (select (arr!47984 a!2862) index!646) (select (store (arr!47984 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47984 a!2862) index!646) (select (arr!47984 a!2862) j!93))) (= (select (arr!47984 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47984 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481875 () Bool)

(declare-fun res!1007149 () Bool)

(assert (=> b!1481875 (=> (not res!1007149) (not e!831055))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481875 (= res!1007149 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48534 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48534 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48534 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!831056 () Bool)

(declare-fun lt!646908 () array!99413)

(declare-fun lt!646904 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12224 0))(
  ( (MissingZero!12224 (index!51288 (_ BitVec 32))) (Found!12224 (index!51289 (_ BitVec 32))) (Intermediate!12224 (undefined!13036 Bool) (index!51290 (_ BitVec 32)) (x!132875 (_ BitVec 32))) (Undefined!12224) (MissingVacant!12224 (index!51291 (_ BitVec 32))) )
))
(declare-fun lt!646906 () SeekEntryResult!12224)

(declare-fun b!1481876 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99413 (_ BitVec 32)) SeekEntryResult!12224)

(assert (=> b!1481876 (= e!831056 (= lt!646906 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646904 lt!646908 mask!2687)))))

(declare-fun b!1481877 () Bool)

(declare-fun e!831057 () Bool)

(declare-fun e!831059 () Bool)

(assert (=> b!1481877 (= e!831057 e!831059)))

(declare-fun res!1007150 () Bool)

(assert (=> b!1481877 (=> (not res!1007150) (not e!831059))))

(assert (=> b!1481877 (= res!1007150 (= lt!646906 (Intermediate!12224 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481877 (= lt!646906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646904 mask!2687) lt!646904 lt!646908 mask!2687))))

(assert (=> b!1481877 (= lt!646904 (select (store (arr!47984 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481878 () Bool)

(declare-fun res!1007160 () Bool)

(assert (=> b!1481878 (=> (not res!1007160) (not e!831055))))

(declare-datatypes ((List!34485 0))(
  ( (Nil!34482) (Cons!34481 (h!35852 (_ BitVec 64)) (t!49179 List!34485)) )
))
(declare-fun arrayNoDuplicates!0 (array!99413 (_ BitVec 32) List!34485) Bool)

(assert (=> b!1481878 (= res!1007160 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34482))))

(declare-fun b!1481879 () Bool)

(declare-fun res!1007147 () Bool)

(assert (=> b!1481879 (=> (not res!1007147) (not e!831055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481879 (= res!1007147 (validKeyInArray!0 (select (arr!47984 a!2862) j!93)))))

(declare-fun b!1481880 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99413 (_ BitVec 32)) SeekEntryResult!12224)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99413 (_ BitVec 32)) SeekEntryResult!12224)

(assert (=> b!1481880 (= e!831056 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646904 lt!646908 mask!2687) (seekEntryOrOpen!0 lt!646904 lt!646908 mask!2687)))))

(declare-fun b!1481881 () Bool)

(declare-fun res!1007155 () Bool)

(assert (=> b!1481881 (=> (not res!1007155) (not e!831055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99413 (_ BitVec 32)) Bool)

(assert (=> b!1481881 (= res!1007155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481882 () Bool)

(declare-fun res!1007154 () Bool)

(assert (=> b!1481882 (=> (not res!1007154) (not e!831058))))

(assert (=> b!1481882 (= res!1007154 (= (seekEntryOrOpen!0 (select (arr!47984 a!2862) j!93) a!2862 mask!2687) (Found!12224 j!93)))))

(declare-fun b!1481883 () Bool)

(declare-fun res!1007159 () Bool)

(assert (=> b!1481883 (=> (not res!1007159) (not e!831057))))

(declare-fun lt!646905 () SeekEntryResult!12224)

(assert (=> b!1481883 (= res!1007159 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47984 a!2862) j!93) a!2862 mask!2687) lt!646905))))

(declare-fun b!1481884 () Bool)

(declare-fun e!831054 () Bool)

(assert (=> b!1481884 (= e!831054 e!831057)))

(declare-fun res!1007148 () Bool)

(assert (=> b!1481884 (=> (not res!1007148) (not e!831057))))

(assert (=> b!1481884 (= res!1007148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47984 a!2862) j!93) mask!2687) (select (arr!47984 a!2862) j!93) a!2862 mask!2687) lt!646905))))

(assert (=> b!1481884 (= lt!646905 (Intermediate!12224 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481885 () Bool)

(declare-fun res!1007158 () Bool)

(assert (=> b!1481885 (=> (not res!1007158) (not e!831059))))

(assert (=> b!1481885 (= res!1007158 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481886 () Bool)

(declare-fun res!1007153 () Bool)

(assert (=> b!1481886 (=> (not res!1007153) (not e!831055))))

(assert (=> b!1481886 (= res!1007153 (validKeyInArray!0 (select (arr!47984 a!2862) i!1006)))))

(declare-fun b!1481887 () Bool)

(declare-fun res!1007161 () Bool)

(assert (=> b!1481887 (=> (not res!1007161) (not e!831059))))

(assert (=> b!1481887 (= res!1007161 e!831056)))

(declare-fun c!136884 () Bool)

(assert (=> b!1481887 (= c!136884 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481888 () Bool)

(assert (=> b!1481888 (= e!831055 e!831054)))

(declare-fun res!1007151 () Bool)

(assert (=> b!1481888 (=> (not res!1007151) (not e!831054))))

(assert (=> b!1481888 (= res!1007151 (= (select (store (arr!47984 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481888 (= lt!646908 (array!99414 (store (arr!47984 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48534 a!2862)))))

(declare-fun b!1481889 () Bool)

(assert (=> b!1481889 (= e!831059 (not true))))

(assert (=> b!1481889 e!831058))

(declare-fun res!1007156 () Bool)

(assert (=> b!1481889 (=> (not res!1007156) (not e!831058))))

(assert (=> b!1481889 (= res!1007156 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49788 0))(
  ( (Unit!49789) )
))
(declare-fun lt!646907 () Unit!49788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49788)

(assert (=> b!1481889 (= lt!646907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126394 res!1007157) b!1481873))

(assert (= (and b!1481873 res!1007152) b!1481886))

(assert (= (and b!1481886 res!1007153) b!1481879))

(assert (= (and b!1481879 res!1007147) b!1481881))

(assert (= (and b!1481881 res!1007155) b!1481878))

(assert (= (and b!1481878 res!1007160) b!1481875))

(assert (= (and b!1481875 res!1007149) b!1481888))

(assert (= (and b!1481888 res!1007151) b!1481884))

(assert (= (and b!1481884 res!1007148) b!1481883))

(assert (= (and b!1481883 res!1007159) b!1481877))

(assert (= (and b!1481877 res!1007150) b!1481887))

(assert (= (and b!1481887 c!136884) b!1481876))

(assert (= (and b!1481887 (not c!136884)) b!1481880))

(assert (= (and b!1481887 res!1007161) b!1481885))

(assert (= (and b!1481885 res!1007158) b!1481889))

(assert (= (and b!1481889 res!1007156) b!1481882))

(assert (= (and b!1481882 res!1007154) b!1481874))

(declare-fun m!1367605 () Bool)

(assert (=> b!1481886 m!1367605))

(assert (=> b!1481886 m!1367605))

(declare-fun m!1367607 () Bool)

(assert (=> b!1481886 m!1367607))

(declare-fun m!1367609 () Bool)

(assert (=> b!1481881 m!1367609))

(declare-fun m!1367611 () Bool)

(assert (=> b!1481884 m!1367611))

(assert (=> b!1481884 m!1367611))

(declare-fun m!1367613 () Bool)

(assert (=> b!1481884 m!1367613))

(assert (=> b!1481884 m!1367613))

(assert (=> b!1481884 m!1367611))

(declare-fun m!1367615 () Bool)

(assert (=> b!1481884 m!1367615))

(assert (=> b!1481883 m!1367611))

(assert (=> b!1481883 m!1367611))

(declare-fun m!1367617 () Bool)

(assert (=> b!1481883 m!1367617))

(declare-fun m!1367619 () Bool)

(assert (=> b!1481878 m!1367619))

(declare-fun m!1367621 () Bool)

(assert (=> b!1481877 m!1367621))

(assert (=> b!1481877 m!1367621))

(declare-fun m!1367623 () Bool)

(assert (=> b!1481877 m!1367623))

(declare-fun m!1367625 () Bool)

(assert (=> b!1481877 m!1367625))

(declare-fun m!1367627 () Bool)

(assert (=> b!1481877 m!1367627))

(declare-fun m!1367629 () Bool)

(assert (=> b!1481880 m!1367629))

(declare-fun m!1367631 () Bool)

(assert (=> b!1481880 m!1367631))

(declare-fun m!1367633 () Bool)

(assert (=> b!1481876 m!1367633))

(declare-fun m!1367635 () Bool)

(assert (=> b!1481889 m!1367635))

(declare-fun m!1367637 () Bool)

(assert (=> b!1481889 m!1367637))

(assert (=> b!1481888 m!1367625))

(declare-fun m!1367639 () Bool)

(assert (=> b!1481888 m!1367639))

(assert (=> b!1481874 m!1367625))

(declare-fun m!1367641 () Bool)

(assert (=> b!1481874 m!1367641))

(declare-fun m!1367643 () Bool)

(assert (=> b!1481874 m!1367643))

(declare-fun m!1367645 () Bool)

(assert (=> b!1481874 m!1367645))

(assert (=> b!1481874 m!1367611))

(assert (=> b!1481879 m!1367611))

(assert (=> b!1481879 m!1367611))

(declare-fun m!1367647 () Bool)

(assert (=> b!1481879 m!1367647))

(declare-fun m!1367649 () Bool)

(assert (=> start!126394 m!1367649))

(declare-fun m!1367651 () Bool)

(assert (=> start!126394 m!1367651))

(assert (=> b!1481882 m!1367611))

(assert (=> b!1481882 m!1367611))

(declare-fun m!1367653 () Bool)

(assert (=> b!1481882 m!1367653))

(push 1)

