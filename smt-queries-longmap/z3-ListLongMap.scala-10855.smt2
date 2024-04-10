; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127110 () Bool)

(assert start!127110)

(declare-fun b!1493980 () Bool)

(declare-fun res!1016408 () Bool)

(declare-fun e!836871 () Bool)

(assert (=> b!1493980 (=> (not res!1016408) (not e!836871))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493980 (= res!1016408 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493981 () Bool)

(declare-fun res!1016419 () Bool)

(assert (=> b!1493981 (=> (not res!1016419) (not e!836871))))

(declare-fun e!836870 () Bool)

(assert (=> b!1493981 (= res!1016419 e!836870)))

(declare-fun c!138318 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493981 (= c!138318 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1016409 () Bool)

(declare-fun e!836868 () Bool)

(assert (=> start!127110 (=> (not res!1016409) (not e!836868))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127110 (= res!1016409 (validMask!0 mask!2687))))

(assert (=> start!127110 e!836868))

(assert (=> start!127110 true))

(declare-datatypes ((array!99757 0))(
  ( (array!99758 (arr!48147 (Array (_ BitVec 32) (_ BitVec 64))) (size!48697 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99757)

(declare-fun array_inv!37175 (array!99757) Bool)

(assert (=> start!127110 (array_inv!37175 a!2862)))

(declare-fun b!1493982 () Bool)

(declare-fun e!836872 () Bool)

(declare-fun e!836867 () Bool)

(assert (=> b!1493982 (= e!836872 e!836867)))

(declare-fun res!1016414 () Bool)

(assert (=> b!1493982 (=> (not res!1016414) (not e!836867))))

(declare-datatypes ((SeekEntryResult!12387 0))(
  ( (MissingZero!12387 (index!51940 (_ BitVec 32))) (Found!12387 (index!51941 (_ BitVec 32))) (Intermediate!12387 (undefined!13199 Bool) (index!51942 (_ BitVec 32)) (x!133539 (_ BitVec 32))) (Undefined!12387) (MissingVacant!12387 (index!51943 (_ BitVec 32))) )
))
(declare-fun lt!651206 () SeekEntryResult!12387)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12387)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493982 (= res!1016414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48147 a!2862) j!93) mask!2687) (select (arr!48147 a!2862) j!93) a!2862 mask!2687) lt!651206))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1493982 (= lt!651206 (Intermediate!12387 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493983 () Bool)

(declare-fun res!1016407 () Bool)

(assert (=> b!1493983 (=> (not res!1016407) (not e!836867))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1493983 (= res!1016407 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48147 a!2862) j!93) a!2862 mask!2687) lt!651206))))

(declare-fun b!1493984 () Bool)

(declare-fun e!836866 () Bool)

(assert (=> b!1493984 (= e!836866 true)))

(declare-fun lt!651207 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493984 (= lt!651207 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493985 () Bool)

(assert (=> b!1493985 (= e!836871 (not e!836866))))

(declare-fun res!1016418 () Bool)

(assert (=> b!1493985 (=> res!1016418 e!836866)))

(assert (=> b!1493985 (= res!1016418 (or (and (= (select (arr!48147 a!2862) index!646) (select (store (arr!48147 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48147 a!2862) index!646) (select (arr!48147 a!2862) j!93))) (= (select (arr!48147 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836873 () Bool)

(assert (=> b!1493985 e!836873))

(declare-fun res!1016406 () Bool)

(assert (=> b!1493985 (=> (not res!1016406) (not e!836873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99757 (_ BitVec 32)) Bool)

(assert (=> b!1493985 (= res!1016406 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50114 0))(
  ( (Unit!50115) )
))
(declare-fun lt!651210 () Unit!50114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50114)

(assert (=> b!1493985 (= lt!651210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493986 () Bool)

(declare-fun res!1016416 () Bool)

(assert (=> b!1493986 (=> (not res!1016416) (not e!836873))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12387)

(assert (=> b!1493986 (= res!1016416 (= (seekEntryOrOpen!0 (select (arr!48147 a!2862) j!93) a!2862 mask!2687) (Found!12387 j!93)))))

(declare-fun lt!651209 () (_ BitVec 64))

(declare-fun b!1493987 () Bool)

(declare-fun lt!651205 () array!99757)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12387)

(assert (=> b!1493987 (= e!836870 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651209 lt!651205 mask!2687) (seekEntryOrOpen!0 lt!651209 lt!651205 mask!2687)))))

(declare-fun b!1493988 () Bool)

(declare-fun res!1016410 () Bool)

(assert (=> b!1493988 (=> (not res!1016410) (not e!836868))))

(declare-datatypes ((List!34648 0))(
  ( (Nil!34645) (Cons!34644 (h!36033 (_ BitVec 64)) (t!49342 List!34648)) )
))
(declare-fun arrayNoDuplicates!0 (array!99757 (_ BitVec 32) List!34648) Bool)

(assert (=> b!1493988 (= res!1016410 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34645))))

(declare-fun b!1493989 () Bool)

(declare-fun res!1016413 () Bool)

(assert (=> b!1493989 (=> (not res!1016413) (not e!836868))))

(assert (=> b!1493989 (= res!1016413 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48697 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48697 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48697 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493990 () Bool)

(assert (=> b!1493990 (= e!836873 (or (= (select (arr!48147 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48147 a!2862) intermediateBeforeIndex!19) (select (arr!48147 a!2862) j!93))))))

(declare-fun b!1493991 () Bool)

(declare-fun res!1016412 () Bool)

(assert (=> b!1493991 (=> (not res!1016412) (not e!836868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493991 (= res!1016412 (validKeyInArray!0 (select (arr!48147 a!2862) j!93)))))

(declare-fun b!1493992 () Bool)

(declare-fun res!1016415 () Bool)

(assert (=> b!1493992 (=> (not res!1016415) (not e!836868))))

(assert (=> b!1493992 (= res!1016415 (and (= (size!48697 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48697 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48697 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493993 () Bool)

(declare-fun res!1016405 () Bool)

(assert (=> b!1493993 (=> (not res!1016405) (not e!836868))))

(assert (=> b!1493993 (= res!1016405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493994 () Bool)

(assert (=> b!1493994 (= e!836867 e!836871)))

(declare-fun res!1016411 () Bool)

(assert (=> b!1493994 (=> (not res!1016411) (not e!836871))))

(declare-fun lt!651208 () SeekEntryResult!12387)

(assert (=> b!1493994 (= res!1016411 (= lt!651208 (Intermediate!12387 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493994 (= lt!651208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651209 mask!2687) lt!651209 lt!651205 mask!2687))))

(assert (=> b!1493994 (= lt!651209 (select (store (arr!48147 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493995 () Bool)

(assert (=> b!1493995 (= e!836868 e!836872)))

(declare-fun res!1016417 () Bool)

(assert (=> b!1493995 (=> (not res!1016417) (not e!836872))))

(assert (=> b!1493995 (= res!1016417 (= (select (store (arr!48147 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493995 (= lt!651205 (array!99758 (store (arr!48147 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48697 a!2862)))))

(declare-fun b!1493996 () Bool)

(declare-fun res!1016404 () Bool)

(assert (=> b!1493996 (=> (not res!1016404) (not e!836868))))

(assert (=> b!1493996 (= res!1016404 (validKeyInArray!0 (select (arr!48147 a!2862) i!1006)))))

(declare-fun b!1493997 () Bool)

(assert (=> b!1493997 (= e!836870 (= lt!651208 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651209 lt!651205 mask!2687)))))

(assert (= (and start!127110 res!1016409) b!1493992))

(assert (= (and b!1493992 res!1016415) b!1493996))

(assert (= (and b!1493996 res!1016404) b!1493991))

(assert (= (and b!1493991 res!1016412) b!1493993))

(assert (= (and b!1493993 res!1016405) b!1493988))

(assert (= (and b!1493988 res!1016410) b!1493989))

(assert (= (and b!1493989 res!1016413) b!1493995))

(assert (= (and b!1493995 res!1016417) b!1493982))

(assert (= (and b!1493982 res!1016414) b!1493983))

(assert (= (and b!1493983 res!1016407) b!1493994))

(assert (= (and b!1493994 res!1016411) b!1493981))

(assert (= (and b!1493981 c!138318) b!1493997))

(assert (= (and b!1493981 (not c!138318)) b!1493987))

(assert (= (and b!1493981 res!1016419) b!1493980))

(assert (= (and b!1493980 res!1016408) b!1493985))

(assert (= (and b!1493985 res!1016406) b!1493986))

(assert (= (and b!1493986 res!1016416) b!1493990))

(assert (= (and b!1493985 (not res!1016418)) b!1493984))

(declare-fun m!1377743 () Bool)

(assert (=> b!1493996 m!1377743))

(assert (=> b!1493996 m!1377743))

(declare-fun m!1377745 () Bool)

(assert (=> b!1493996 m!1377745))

(declare-fun m!1377747 () Bool)

(assert (=> b!1493993 m!1377747))

(declare-fun m!1377749 () Bool)

(assert (=> b!1493982 m!1377749))

(assert (=> b!1493982 m!1377749))

(declare-fun m!1377751 () Bool)

(assert (=> b!1493982 m!1377751))

(assert (=> b!1493982 m!1377751))

(assert (=> b!1493982 m!1377749))

(declare-fun m!1377753 () Bool)

(assert (=> b!1493982 m!1377753))

(declare-fun m!1377755 () Bool)

(assert (=> b!1493987 m!1377755))

(declare-fun m!1377757 () Bool)

(assert (=> b!1493987 m!1377757))

(assert (=> b!1493991 m!1377749))

(assert (=> b!1493991 m!1377749))

(declare-fun m!1377759 () Bool)

(assert (=> b!1493991 m!1377759))

(assert (=> b!1493986 m!1377749))

(assert (=> b!1493986 m!1377749))

(declare-fun m!1377761 () Bool)

(assert (=> b!1493986 m!1377761))

(declare-fun m!1377763 () Bool)

(assert (=> b!1493984 m!1377763))

(declare-fun m!1377765 () Bool)

(assert (=> start!127110 m!1377765))

(declare-fun m!1377767 () Bool)

(assert (=> start!127110 m!1377767))

(declare-fun m!1377769 () Bool)

(assert (=> b!1493988 m!1377769))

(declare-fun m!1377771 () Bool)

(assert (=> b!1493997 m!1377771))

(declare-fun m!1377773 () Bool)

(assert (=> b!1493990 m!1377773))

(assert (=> b!1493990 m!1377749))

(declare-fun m!1377775 () Bool)

(assert (=> b!1493995 m!1377775))

(declare-fun m!1377777 () Bool)

(assert (=> b!1493995 m!1377777))

(declare-fun m!1377779 () Bool)

(assert (=> b!1493985 m!1377779))

(assert (=> b!1493985 m!1377775))

(declare-fun m!1377781 () Bool)

(assert (=> b!1493985 m!1377781))

(declare-fun m!1377783 () Bool)

(assert (=> b!1493985 m!1377783))

(declare-fun m!1377785 () Bool)

(assert (=> b!1493985 m!1377785))

(assert (=> b!1493985 m!1377749))

(assert (=> b!1493983 m!1377749))

(assert (=> b!1493983 m!1377749))

(declare-fun m!1377787 () Bool)

(assert (=> b!1493983 m!1377787))

(declare-fun m!1377789 () Bool)

(assert (=> b!1493994 m!1377789))

(assert (=> b!1493994 m!1377789))

(declare-fun m!1377791 () Bool)

(assert (=> b!1493994 m!1377791))

(assert (=> b!1493994 m!1377775))

(declare-fun m!1377793 () Bool)

(assert (=> b!1493994 m!1377793))

(check-sat (not b!1493987) (not b!1493997) (not b!1493982) (not b!1493988) (not b!1493985) (not b!1493984) (not b!1493996) (not b!1493991) (not start!127110) (not b!1493983) (not b!1493993) (not b!1493994) (not b!1493986))
