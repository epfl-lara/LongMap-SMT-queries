; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125464 () Bool)

(assert start!125464)

(declare-fun b!1467988 () Bool)

(declare-fun res!996648 () Bool)

(declare-fun e!824380 () Bool)

(assert (=> b!1467988 (=> (not res!996648) (not e!824380))))

(declare-datatypes ((array!98890 0))(
  ( (array!98891 (arr!47734 (Array (_ BitVec 32) (_ BitVec 64))) (size!48286 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98890)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467988 (= res!996648 (validKeyInArray!0 (select (arr!47734 a!2862) j!93)))))

(declare-fun b!1467989 () Bool)

(declare-fun e!824382 () Bool)

(assert (=> b!1467989 (= e!824382 false)))

(declare-datatypes ((SeekEntryResult!11999 0))(
  ( (MissingZero!11999 (index!50388 (_ BitVec 32))) (Found!11999 (index!50389 (_ BitVec 32))) (Intermediate!11999 (undefined!12811 Bool) (index!50390 (_ BitVec 32)) (x!131979 (_ BitVec 32))) (Undefined!11999) (MissingVacant!11999 (index!50391 (_ BitVec 32))) )
))
(declare-fun lt!641999 () SeekEntryResult!11999)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98890 (_ BitVec 32)) SeekEntryResult!11999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467989 (= lt!641999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98891 (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48286 a!2862)) mask!2687))))

(declare-fun b!1467990 () Bool)

(declare-fun res!996651 () Bool)

(assert (=> b!1467990 (=> (not res!996651) (not e!824380))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1467990 (= res!996651 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48286 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48286 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48286 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47734 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467991 () Bool)

(declare-fun res!996652 () Bool)

(assert (=> b!1467991 (=> (not res!996652) (not e!824380))))

(assert (=> b!1467991 (= res!996652 (validKeyInArray!0 (select (arr!47734 a!2862) i!1006)))))

(declare-fun b!1467992 () Bool)

(declare-fun res!996644 () Bool)

(assert (=> b!1467992 (=> (not res!996644) (not e!824380))))

(declare-datatypes ((List!34313 0))(
  ( (Nil!34310) (Cons!34309 (h!35659 (_ BitVec 64)) (t!48999 List!34313)) )
))
(declare-fun arrayNoDuplicates!0 (array!98890 (_ BitVec 32) List!34313) Bool)

(assert (=> b!1467992 (= res!996644 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34310))))

(declare-fun b!1467993 () Bool)

(assert (=> b!1467993 (= e!824380 e!824382)))

(declare-fun res!996650 () Bool)

(assert (=> b!1467993 (=> (not res!996650) (not e!824382))))

(declare-fun lt!642000 () SeekEntryResult!11999)

(assert (=> b!1467993 (= res!996650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47734 a!2862) j!93) mask!2687) (select (arr!47734 a!2862) j!93) a!2862 mask!2687) lt!642000))))

(assert (=> b!1467993 (= lt!642000 (Intermediate!11999 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467994 () Bool)

(declare-fun res!996645 () Bool)

(assert (=> b!1467994 (=> (not res!996645) (not e!824380))))

(assert (=> b!1467994 (= res!996645 (and (= (size!48286 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48286 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48286 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467996 () Bool)

(declare-fun res!996646 () Bool)

(assert (=> b!1467996 (=> (not res!996646) (not e!824380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98890 (_ BitVec 32)) Bool)

(assert (=> b!1467996 (= res!996646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996647 () Bool)

(assert (=> start!125464 (=> (not res!996647) (not e!824380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125464 (= res!996647 (validMask!0 mask!2687))))

(assert (=> start!125464 e!824380))

(assert (=> start!125464 true))

(declare-fun array_inv!36967 (array!98890) Bool)

(assert (=> start!125464 (array_inv!36967 a!2862)))

(declare-fun b!1467995 () Bool)

(declare-fun res!996649 () Bool)

(assert (=> b!1467995 (=> (not res!996649) (not e!824382))))

(assert (=> b!1467995 (= res!996649 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47734 a!2862) j!93) a!2862 mask!2687) lt!642000))))

(assert (= (and start!125464 res!996647) b!1467994))

(assert (= (and b!1467994 res!996645) b!1467991))

(assert (= (and b!1467991 res!996652) b!1467988))

(assert (= (and b!1467988 res!996648) b!1467996))

(assert (= (and b!1467996 res!996646) b!1467992))

(assert (= (and b!1467992 res!996644) b!1467990))

(assert (= (and b!1467990 res!996651) b!1467993))

(assert (= (and b!1467993 res!996650) b!1467995))

(assert (= (and b!1467995 res!996649) b!1467989))

(declare-fun m!1354521 () Bool)

(assert (=> b!1467990 m!1354521))

(declare-fun m!1354523 () Bool)

(assert (=> b!1467990 m!1354523))

(assert (=> b!1467989 m!1354521))

(declare-fun m!1354525 () Bool)

(assert (=> b!1467989 m!1354525))

(assert (=> b!1467989 m!1354525))

(declare-fun m!1354527 () Bool)

(assert (=> b!1467989 m!1354527))

(assert (=> b!1467989 m!1354527))

(assert (=> b!1467989 m!1354525))

(declare-fun m!1354529 () Bool)

(assert (=> b!1467989 m!1354529))

(declare-fun m!1354531 () Bool)

(assert (=> start!125464 m!1354531))

(declare-fun m!1354533 () Bool)

(assert (=> start!125464 m!1354533))

(declare-fun m!1354535 () Bool)

(assert (=> b!1467993 m!1354535))

(assert (=> b!1467993 m!1354535))

(declare-fun m!1354537 () Bool)

(assert (=> b!1467993 m!1354537))

(assert (=> b!1467993 m!1354537))

(assert (=> b!1467993 m!1354535))

(declare-fun m!1354539 () Bool)

(assert (=> b!1467993 m!1354539))

(assert (=> b!1467988 m!1354535))

(assert (=> b!1467988 m!1354535))

(declare-fun m!1354541 () Bool)

(assert (=> b!1467988 m!1354541))

(declare-fun m!1354543 () Bool)

(assert (=> b!1467996 m!1354543))

(declare-fun m!1354545 () Bool)

(assert (=> b!1467992 m!1354545))

(declare-fun m!1354547 () Bool)

(assert (=> b!1467991 m!1354547))

(assert (=> b!1467991 m!1354547))

(declare-fun m!1354549 () Bool)

(assert (=> b!1467991 m!1354549))

(assert (=> b!1467995 m!1354535))

(assert (=> b!1467995 m!1354535))

(declare-fun m!1354551 () Bool)

(assert (=> b!1467995 m!1354551))

(check-sat (not start!125464) (not b!1467988) (not b!1467996) (not b!1467995) (not b!1467993) (not b!1467992) (not b!1467991) (not b!1467989))
(check-sat)
