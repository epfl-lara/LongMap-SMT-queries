; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125514 () Bool)

(assert start!125514)

(declare-fun b!1462969 () Bool)

(declare-fun res!991532 () Bool)

(declare-fun e!822601 () Bool)

(assert (=> b!1462969 (=> (not res!991532) (not e!822601))))

(declare-datatypes ((array!98800 0))(
  ( (array!98801 (arr!47683 (Array (_ BitVec 32) (_ BitVec 64))) (size!48234 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98800)

(declare-datatypes ((List!34171 0))(
  ( (Nil!34168) (Cons!34167 (h!35531 (_ BitVec 64)) (t!48857 List!34171)) )
))
(declare-fun arrayNoDuplicates!0 (array!98800 (_ BitVec 32) List!34171) Bool)

(assert (=> b!1462969 (= res!991532 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34168))))

(declare-fun b!1462970 () Bool)

(declare-fun res!991521 () Bool)

(assert (=> b!1462970 (=> (not res!991521) (not e!822601))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98800 (_ BitVec 32)) Bool)

(assert (=> b!1462970 (= res!991521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1462971 () Bool)

(declare-fun lt!640715 () (_ BitVec 32))

(declare-fun lt!640714 () array!98800)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!640717 () (_ BitVec 64))

(declare-fun e!822596 () Bool)

(declare-datatypes ((SeekEntryResult!11832 0))(
  ( (MissingZero!11832 (index!49720 (_ BitVec 32))) (Found!11832 (index!49721 (_ BitVec 32))) (Intermediate!11832 (undefined!12644 Bool) (index!49722 (_ BitVec 32)) (x!131506 (_ BitVec 32))) (Undefined!11832) (MissingVacant!11832 (index!49723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11832)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11832)

(assert (=> b!1462971 (= e!822596 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640715 intermediateAfterIndex!19 lt!640717 lt!640714 mask!2687) (seekEntryOrOpen!0 lt!640717 lt!640714 mask!2687))))))

(declare-fun b!1462972 () Bool)

(declare-fun res!991518 () Bool)

(assert (=> b!1462972 (=> (not res!991518) (not e!822601))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462972 (= res!991518 (validKeyInArray!0 (select (arr!47683 a!2862) i!1006)))))

(declare-fun b!1462973 () Bool)

(declare-fun res!991528 () Bool)

(declare-fun e!822603 () Bool)

(assert (=> b!1462973 (=> (not res!991528) (not e!822603))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462973 (= res!991528 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462974 () Bool)

(declare-fun e!822599 () Bool)

(assert (=> b!1462974 (= e!822603 (not e!822599))))

(declare-fun res!991535 () Bool)

(assert (=> b!1462974 (=> res!991535 e!822599)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462974 (= res!991535 (or (and (= (select (arr!47683 a!2862) index!646) (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47683 a!2862) index!646) (select (arr!47683 a!2862) j!93))) (= (select (arr!47683 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822602 () Bool)

(assert (=> b!1462974 e!822602))

(declare-fun res!991520 () Bool)

(assert (=> b!1462974 (=> (not res!991520) (not e!822602))))

(assert (=> b!1462974 (= res!991520 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49193 0))(
  ( (Unit!49194) )
))
(declare-fun lt!640716 () Unit!49193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49193)

(assert (=> b!1462974 (= lt!640716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462975 () Bool)

(declare-fun e!822598 () Bool)

(declare-fun e!822597 () Bool)

(assert (=> b!1462975 (= e!822598 e!822597)))

(declare-fun res!991526 () Bool)

(assert (=> b!1462975 (=> (not res!991526) (not e!822597))))

(declare-fun lt!640713 () SeekEntryResult!11832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462975 (= res!991526 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47683 a!2862) j!93) mask!2687) (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!640713))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1462975 (= lt!640713 (Intermediate!11832 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462976 () Bool)

(declare-fun res!991531 () Bool)

(assert (=> b!1462976 (=> (not res!991531) (not e!822601))))

(assert (=> b!1462976 (= res!991531 (validKeyInArray!0 (select (arr!47683 a!2862) j!93)))))

(declare-fun res!991533 () Bool)

(assert (=> start!125514 (=> (not res!991533) (not e!822601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125514 (= res!991533 (validMask!0 mask!2687))))

(assert (=> start!125514 e!822601))

(assert (=> start!125514 true))

(declare-fun array_inv!36964 (array!98800) Bool)

(assert (=> start!125514 (array_inv!36964 a!2862)))

(declare-fun e!822594 () Bool)

(declare-fun b!1462977 () Bool)

(assert (=> b!1462977 (= e!822594 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640717 lt!640714 mask!2687) (seekEntryOrOpen!0 lt!640717 lt!640714 mask!2687)))))

(declare-fun b!1462978 () Bool)

(declare-fun res!991524 () Bool)

(assert (=> b!1462978 (=> (not res!991524) (not e!822603))))

(assert (=> b!1462978 (= res!991524 e!822594)))

(declare-fun c!135247 () Bool)

(assert (=> b!1462978 (= c!135247 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462979 () Bool)

(declare-fun res!991529 () Bool)

(assert (=> b!1462979 (=> (not res!991529) (not e!822597))))

(assert (=> b!1462979 (= res!991529 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!640713))))

(declare-fun b!1462980 () Bool)

(assert (=> b!1462980 (= e!822601 e!822598)))

(declare-fun res!991534 () Bool)

(assert (=> b!1462980 (=> (not res!991534) (not e!822598))))

(assert (=> b!1462980 (= res!991534 (= (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462980 (= lt!640714 (array!98801 (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48234 a!2862)))))

(declare-fun b!1462981 () Bool)

(declare-fun e!822595 () Bool)

(assert (=> b!1462981 (= e!822599 e!822595)))

(declare-fun res!991522 () Bool)

(assert (=> b!1462981 (=> res!991522 e!822595)))

(assert (=> b!1462981 (= res!991522 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640715 #b00000000000000000000000000000000) (bvsge lt!640715 (size!48234 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462981 (= lt!640715 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1462982 () Bool)

(declare-fun res!991519 () Bool)

(assert (=> b!1462982 (=> (not res!991519) (not e!822601))))

(assert (=> b!1462982 (= res!991519 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48234 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48234 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48234 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462983 () Bool)

(assert (=> b!1462983 (= e!822602 (or (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) (select (arr!47683 a!2862) j!93))))))

(declare-fun b!1462984 () Bool)

(assert (=> b!1462984 (= e!822597 e!822603)))

(declare-fun res!991527 () Bool)

(assert (=> b!1462984 (=> (not res!991527) (not e!822603))))

(declare-fun lt!640712 () SeekEntryResult!11832)

(assert (=> b!1462984 (= res!991527 (= lt!640712 (Intermediate!11832 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462984 (= lt!640712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640717 mask!2687) lt!640717 lt!640714 mask!2687))))

(assert (=> b!1462984 (= lt!640717 (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462985 () Bool)

(assert (=> b!1462985 (= e!822595 true)))

(declare-fun lt!640711 () Bool)

(assert (=> b!1462985 (= lt!640711 e!822596)))

(declare-fun c!135246 () Bool)

(assert (=> b!1462985 (= c!135246 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462986 () Bool)

(assert (=> b!1462986 (= e!822596 (not (= lt!640712 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640715 lt!640717 lt!640714 mask!2687))))))

(declare-fun b!1462987 () Bool)

(declare-fun res!991530 () Bool)

(assert (=> b!1462987 (=> (not res!991530) (not e!822602))))

(assert (=> b!1462987 (= res!991530 (= (seekEntryOrOpen!0 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) (Found!11832 j!93)))))

(declare-fun b!1462988 () Bool)

(declare-fun res!991523 () Bool)

(assert (=> b!1462988 (=> (not res!991523) (not e!822601))))

(assert (=> b!1462988 (= res!991523 (and (= (size!48234 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48234 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48234 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462989 () Bool)

(declare-fun res!991525 () Bool)

(assert (=> b!1462989 (=> res!991525 e!822595)))

(assert (=> b!1462989 (= res!991525 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640715 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!640713)))))

(declare-fun b!1462990 () Bool)

(assert (=> b!1462990 (= e!822594 (= lt!640712 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640717 lt!640714 mask!2687)))))

(assert (= (and start!125514 res!991533) b!1462988))

(assert (= (and b!1462988 res!991523) b!1462972))

(assert (= (and b!1462972 res!991518) b!1462976))

(assert (= (and b!1462976 res!991531) b!1462970))

(assert (= (and b!1462970 res!991521) b!1462969))

(assert (= (and b!1462969 res!991532) b!1462982))

(assert (= (and b!1462982 res!991519) b!1462980))

(assert (= (and b!1462980 res!991534) b!1462975))

(assert (= (and b!1462975 res!991526) b!1462979))

(assert (= (and b!1462979 res!991529) b!1462984))

(assert (= (and b!1462984 res!991527) b!1462978))

(assert (= (and b!1462978 c!135247) b!1462990))

(assert (= (and b!1462978 (not c!135247)) b!1462977))

(assert (= (and b!1462978 res!991524) b!1462973))

(assert (= (and b!1462973 res!991528) b!1462974))

(assert (= (and b!1462974 res!991520) b!1462987))

(assert (= (and b!1462987 res!991530) b!1462983))

(assert (= (and b!1462974 (not res!991535)) b!1462981))

(assert (= (and b!1462981 (not res!991522)) b!1462989))

(assert (= (and b!1462989 (not res!991525)) b!1462985))

(assert (= (and b!1462985 c!135246) b!1462986))

(assert (= (and b!1462985 (not c!135246)) b!1462971))

(declare-fun m!1350547 () Bool)

(assert (=> b!1462976 m!1350547))

(assert (=> b!1462976 m!1350547))

(declare-fun m!1350549 () Bool)

(assert (=> b!1462976 m!1350549))

(declare-fun m!1350551 () Bool)

(assert (=> b!1462977 m!1350551))

(declare-fun m!1350553 () Bool)

(assert (=> b!1462977 m!1350553))

(declare-fun m!1350555 () Bool)

(assert (=> b!1462974 m!1350555))

(declare-fun m!1350557 () Bool)

(assert (=> b!1462974 m!1350557))

(declare-fun m!1350559 () Bool)

(assert (=> b!1462974 m!1350559))

(declare-fun m!1350561 () Bool)

(assert (=> b!1462974 m!1350561))

(declare-fun m!1350563 () Bool)

(assert (=> b!1462974 m!1350563))

(assert (=> b!1462974 m!1350547))

(declare-fun m!1350565 () Bool)

(assert (=> b!1462969 m!1350565))

(assert (=> b!1462979 m!1350547))

(assert (=> b!1462979 m!1350547))

(declare-fun m!1350567 () Bool)

(assert (=> b!1462979 m!1350567))

(declare-fun m!1350569 () Bool)

(assert (=> b!1462981 m!1350569))

(declare-fun m!1350571 () Bool)

(assert (=> b!1462970 m!1350571))

(assert (=> b!1462980 m!1350557))

(declare-fun m!1350573 () Bool)

(assert (=> b!1462980 m!1350573))

(declare-fun m!1350575 () Bool)

(assert (=> b!1462983 m!1350575))

(assert (=> b!1462983 m!1350547))

(declare-fun m!1350577 () Bool)

(assert (=> b!1462984 m!1350577))

(assert (=> b!1462984 m!1350577))

(declare-fun m!1350579 () Bool)

(assert (=> b!1462984 m!1350579))

(assert (=> b!1462984 m!1350557))

(declare-fun m!1350581 () Bool)

(assert (=> b!1462984 m!1350581))

(assert (=> b!1462987 m!1350547))

(assert (=> b!1462987 m!1350547))

(declare-fun m!1350583 () Bool)

(assert (=> b!1462987 m!1350583))

(assert (=> b!1462975 m!1350547))

(assert (=> b!1462975 m!1350547))

(declare-fun m!1350585 () Bool)

(assert (=> b!1462975 m!1350585))

(assert (=> b!1462975 m!1350585))

(assert (=> b!1462975 m!1350547))

(declare-fun m!1350587 () Bool)

(assert (=> b!1462975 m!1350587))

(declare-fun m!1350589 () Bool)

(assert (=> start!125514 m!1350589))

(declare-fun m!1350591 () Bool)

(assert (=> start!125514 m!1350591))

(declare-fun m!1350593 () Bool)

(assert (=> b!1462986 m!1350593))

(assert (=> b!1462989 m!1350547))

(assert (=> b!1462989 m!1350547))

(declare-fun m!1350595 () Bool)

(assert (=> b!1462989 m!1350595))

(declare-fun m!1350597 () Bool)

(assert (=> b!1462971 m!1350597))

(assert (=> b!1462971 m!1350553))

(declare-fun m!1350599 () Bool)

(assert (=> b!1462972 m!1350599))

(assert (=> b!1462972 m!1350599))

(declare-fun m!1350601 () Bool)

(assert (=> b!1462972 m!1350601))

(declare-fun m!1350603 () Bool)

(assert (=> b!1462990 m!1350603))

(check-sat (not b!1462987) (not b!1462977) (not b!1462979) (not b!1462990) (not b!1462986) (not b!1462975) (not b!1462976) (not b!1462971) (not b!1462969) (not start!125514) (not b!1462970) (not b!1462972) (not b!1462981) (not b!1462984) (not b!1462974) (not b!1462989))
(check-sat)
