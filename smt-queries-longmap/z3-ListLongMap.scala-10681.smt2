; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125226 () Bool)

(assert start!125226)

(declare-fun b!1460931 () Bool)

(declare-fun e!821387 () Bool)

(assert (=> b!1460931 (= e!821387 true)))

(declare-fun lt!639969 () Bool)

(declare-fun e!821388 () Bool)

(assert (=> b!1460931 (= lt!639969 e!821388)))

(declare-fun c!134657 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460931 (= c!134657 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460932 () Bool)

(declare-fun e!821390 () Bool)

(declare-fun e!821385 () Bool)

(assert (=> b!1460932 (= e!821390 e!821385)))

(declare-fun res!990643 () Bool)

(assert (=> b!1460932 (=> (not res!990643) (not e!821385))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98674 0))(
  ( (array!98675 (arr!47625 (Array (_ BitVec 32) (_ BitVec 64))) (size!48175 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98674)

(assert (=> b!1460932 (= res!990643 (= (select (store (arr!47625 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639971 () array!98674)

(assert (=> b!1460932 (= lt!639971 (array!98675 (store (arr!47625 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48175 a!2862)))))

(declare-fun b!1460933 () Bool)

(declare-fun res!990652 () Bool)

(declare-fun e!821384 () Bool)

(assert (=> b!1460933 (=> (not res!990652) (not e!821384))))

(declare-fun e!821389 () Bool)

(assert (=> b!1460933 (= res!990652 e!821389)))

(declare-fun c!134658 () Bool)

(assert (=> b!1460933 (= c!134658 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460934 () Bool)

(declare-fun res!990651 () Bool)

(declare-fun e!821386 () Bool)

(assert (=> b!1460934 (=> (not res!990651) (not e!821386))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11877 0))(
  ( (MissingZero!11877 (index!49900 (_ BitVec 32))) (Found!11877 (index!49901 (_ BitVec 32))) (Intermediate!11877 (undefined!12689 Bool) (index!49902 (_ BitVec 32)) (x!131502 (_ BitVec 32))) (Undefined!11877) (MissingVacant!11877 (index!49903 (_ BitVec 32))) )
))
(declare-fun lt!639970 () SeekEntryResult!11877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11877)

(assert (=> b!1460934 (= res!990651 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47625 a!2862) j!93) a!2862 mask!2687) lt!639970))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821382 () Bool)

(declare-fun b!1460935 () Bool)

(assert (=> b!1460935 (= e!821382 (or (= (select (arr!47625 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47625 a!2862) intermediateBeforeIndex!19) (select (arr!47625 a!2862) j!93))))))

(declare-fun b!1460936 () Bool)

(declare-fun res!990653 () Bool)

(assert (=> b!1460936 (=> (not res!990653) (not e!821390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460936 (= res!990653 (validKeyInArray!0 (select (arr!47625 a!2862) i!1006)))))

(declare-fun b!1460937 () Bool)

(declare-fun e!821381 () Bool)

(assert (=> b!1460937 (= e!821381 e!821387)))

(declare-fun res!990654 () Bool)

(assert (=> b!1460937 (=> res!990654 e!821387)))

(declare-fun lt!639975 () (_ BitVec 32))

(assert (=> b!1460937 (= res!990654 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639975 #b00000000000000000000000000000000) (bvsge lt!639975 (size!48175 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460937 (= lt!639975 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1460938 () Bool)

(assert (=> b!1460938 (= e!821384 (not e!821381))))

(declare-fun res!990640 () Bool)

(assert (=> b!1460938 (=> res!990640 e!821381)))

(assert (=> b!1460938 (= res!990640 (or (and (= (select (arr!47625 a!2862) index!646) (select (store (arr!47625 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47625 a!2862) index!646) (select (arr!47625 a!2862) j!93))) (= (select (arr!47625 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1460938 e!821382))

(declare-fun res!990648 () Bool)

(assert (=> b!1460938 (=> (not res!990648) (not e!821382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98674 (_ BitVec 32)) Bool)

(assert (=> b!1460938 (= res!990648 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49250 0))(
  ( (Unit!49251) )
))
(declare-fun lt!639974 () Unit!49250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49250)

(assert (=> b!1460938 (= lt!639974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!639973 () (_ BitVec 64))

(declare-fun lt!639972 () SeekEntryResult!11877)

(declare-fun b!1460939 () Bool)

(assert (=> b!1460939 (= e!821389 (= lt!639972 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639973 lt!639971 mask!2687)))))

(declare-fun b!1460940 () Bool)

(assert (=> b!1460940 (= e!821385 e!821386)))

(declare-fun res!990649 () Bool)

(assert (=> b!1460940 (=> (not res!990649) (not e!821386))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460940 (= res!990649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47625 a!2862) j!93) mask!2687) (select (arr!47625 a!2862) j!93) a!2862 mask!2687) lt!639970))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460940 (= lt!639970 (Intermediate!11877 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460941 () Bool)

(declare-fun res!990638 () Bool)

(assert (=> b!1460941 (=> (not res!990638) (not e!821384))))

(assert (=> b!1460941 (= res!990638 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460942 () Bool)

(declare-fun res!990646 () Bool)

(assert (=> b!1460942 (=> (not res!990646) (not e!821390))))

(assert (=> b!1460942 (= res!990646 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48175 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48175 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48175 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460944 () Bool)

(declare-fun res!990639 () Bool)

(assert (=> b!1460944 (=> (not res!990639) (not e!821390))))

(assert (=> b!1460944 (= res!990639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460945 () Bool)

(declare-fun res!990641 () Bool)

(assert (=> b!1460945 (=> res!990641 e!821387)))

(assert (=> b!1460945 (= res!990641 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639975 (select (arr!47625 a!2862) j!93) a!2862 mask!2687) lt!639970)))))

(declare-fun b!1460946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11877)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98674 (_ BitVec 32)) SeekEntryResult!11877)

(assert (=> b!1460946 (= e!821389 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639973 lt!639971 mask!2687) (seekEntryOrOpen!0 lt!639973 lt!639971 mask!2687)))))

(declare-fun b!1460947 () Bool)

(declare-fun res!990644 () Bool)

(assert (=> b!1460947 (=> (not res!990644) (not e!821382))))

(assert (=> b!1460947 (= res!990644 (= (seekEntryOrOpen!0 (select (arr!47625 a!2862) j!93) a!2862 mask!2687) (Found!11877 j!93)))))

(declare-fun b!1460948 () Bool)

(assert (=> b!1460948 (= e!821388 (not (= lt!639972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639975 lt!639973 lt!639971 mask!2687))))))

(declare-fun b!1460949 () Bool)

(declare-fun res!990642 () Bool)

(assert (=> b!1460949 (=> (not res!990642) (not e!821390))))

(assert (=> b!1460949 (= res!990642 (validKeyInArray!0 (select (arr!47625 a!2862) j!93)))))

(declare-fun b!1460950 () Bool)

(assert (=> b!1460950 (= e!821386 e!821384)))

(declare-fun res!990655 () Bool)

(assert (=> b!1460950 (=> (not res!990655) (not e!821384))))

(assert (=> b!1460950 (= res!990655 (= lt!639972 (Intermediate!11877 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460950 (= lt!639972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639973 mask!2687) lt!639973 lt!639971 mask!2687))))

(assert (=> b!1460950 (= lt!639973 (select (store (arr!47625 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460951 () Bool)

(declare-fun res!990647 () Bool)

(assert (=> b!1460951 (=> (not res!990647) (not e!821390))))

(assert (=> b!1460951 (= res!990647 (and (= (size!48175 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48175 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48175 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460952 () Bool)

(declare-fun res!990645 () Bool)

(assert (=> b!1460952 (=> (not res!990645) (not e!821390))))

(declare-datatypes ((List!34126 0))(
  ( (Nil!34123) (Cons!34122 (h!35472 (_ BitVec 64)) (t!48820 List!34126)) )
))
(declare-fun arrayNoDuplicates!0 (array!98674 (_ BitVec 32) List!34126) Bool)

(assert (=> b!1460952 (= res!990645 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34123))))

(declare-fun res!990650 () Bool)

(assert (=> start!125226 (=> (not res!990650) (not e!821390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125226 (= res!990650 (validMask!0 mask!2687))))

(assert (=> start!125226 e!821390))

(assert (=> start!125226 true))

(declare-fun array_inv!36653 (array!98674) Bool)

(assert (=> start!125226 (array_inv!36653 a!2862)))

(declare-fun b!1460943 () Bool)

(assert (=> b!1460943 (= e!821388 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639975 intermediateAfterIndex!19 lt!639973 lt!639971 mask!2687) (seekEntryOrOpen!0 lt!639973 lt!639971 mask!2687))))))

(assert (= (and start!125226 res!990650) b!1460951))

(assert (= (and b!1460951 res!990647) b!1460936))

(assert (= (and b!1460936 res!990653) b!1460949))

(assert (= (and b!1460949 res!990642) b!1460944))

(assert (= (and b!1460944 res!990639) b!1460952))

(assert (= (and b!1460952 res!990645) b!1460942))

(assert (= (and b!1460942 res!990646) b!1460932))

(assert (= (and b!1460932 res!990643) b!1460940))

(assert (= (and b!1460940 res!990649) b!1460934))

(assert (= (and b!1460934 res!990651) b!1460950))

(assert (= (and b!1460950 res!990655) b!1460933))

(assert (= (and b!1460933 c!134658) b!1460939))

(assert (= (and b!1460933 (not c!134658)) b!1460946))

(assert (= (and b!1460933 res!990652) b!1460941))

(assert (= (and b!1460941 res!990638) b!1460938))

(assert (= (and b!1460938 res!990648) b!1460947))

(assert (= (and b!1460947 res!990644) b!1460935))

(assert (= (and b!1460938 (not res!990640)) b!1460937))

(assert (= (and b!1460937 (not res!990654)) b!1460945))

(assert (= (and b!1460945 (not res!990641)) b!1460931))

(assert (= (and b!1460931 c!134657) b!1460948))

(assert (= (and b!1460931 (not c!134657)) b!1460943))

(declare-fun m!1348571 () Bool)

(assert (=> start!125226 m!1348571))

(declare-fun m!1348573 () Bool)

(assert (=> start!125226 m!1348573))

(declare-fun m!1348575 () Bool)

(assert (=> b!1460945 m!1348575))

(assert (=> b!1460945 m!1348575))

(declare-fun m!1348577 () Bool)

(assert (=> b!1460945 m!1348577))

(declare-fun m!1348579 () Bool)

(assert (=> b!1460939 m!1348579))

(declare-fun m!1348581 () Bool)

(assert (=> b!1460937 m!1348581))

(declare-fun m!1348583 () Bool)

(assert (=> b!1460932 m!1348583))

(declare-fun m!1348585 () Bool)

(assert (=> b!1460932 m!1348585))

(declare-fun m!1348587 () Bool)

(assert (=> b!1460936 m!1348587))

(assert (=> b!1460936 m!1348587))

(declare-fun m!1348589 () Bool)

(assert (=> b!1460936 m!1348589))

(declare-fun m!1348591 () Bool)

(assert (=> b!1460935 m!1348591))

(assert (=> b!1460935 m!1348575))

(declare-fun m!1348593 () Bool)

(assert (=> b!1460948 m!1348593))

(declare-fun m!1348595 () Bool)

(assert (=> b!1460938 m!1348595))

(assert (=> b!1460938 m!1348583))

(declare-fun m!1348597 () Bool)

(assert (=> b!1460938 m!1348597))

(declare-fun m!1348599 () Bool)

(assert (=> b!1460938 m!1348599))

(declare-fun m!1348601 () Bool)

(assert (=> b!1460938 m!1348601))

(assert (=> b!1460938 m!1348575))

(assert (=> b!1460949 m!1348575))

(assert (=> b!1460949 m!1348575))

(declare-fun m!1348603 () Bool)

(assert (=> b!1460949 m!1348603))

(assert (=> b!1460934 m!1348575))

(assert (=> b!1460934 m!1348575))

(declare-fun m!1348605 () Bool)

(assert (=> b!1460934 m!1348605))

(declare-fun m!1348607 () Bool)

(assert (=> b!1460950 m!1348607))

(assert (=> b!1460950 m!1348607))

(declare-fun m!1348609 () Bool)

(assert (=> b!1460950 m!1348609))

(assert (=> b!1460950 m!1348583))

(declare-fun m!1348611 () Bool)

(assert (=> b!1460950 m!1348611))

(assert (=> b!1460947 m!1348575))

(assert (=> b!1460947 m!1348575))

(declare-fun m!1348613 () Bool)

(assert (=> b!1460947 m!1348613))

(assert (=> b!1460940 m!1348575))

(assert (=> b!1460940 m!1348575))

(declare-fun m!1348615 () Bool)

(assert (=> b!1460940 m!1348615))

(assert (=> b!1460940 m!1348615))

(assert (=> b!1460940 m!1348575))

(declare-fun m!1348617 () Bool)

(assert (=> b!1460940 m!1348617))

(declare-fun m!1348619 () Bool)

(assert (=> b!1460944 m!1348619))

(declare-fun m!1348621 () Bool)

(assert (=> b!1460946 m!1348621))

(declare-fun m!1348623 () Bool)

(assert (=> b!1460946 m!1348623))

(declare-fun m!1348625 () Bool)

(assert (=> b!1460952 m!1348625))

(declare-fun m!1348627 () Bool)

(assert (=> b!1460943 m!1348627))

(assert (=> b!1460943 m!1348623))

(check-sat (not b!1460950) (not b!1460943) (not start!125226) (not b!1460944) (not b!1460938) (not b!1460939) (not b!1460948) (not b!1460937) (not b!1460936) (not b!1460949) (not b!1460946) (not b!1460945) (not b!1460952) (not b!1460934) (not b!1460940) (not b!1460947))
(check-sat)
