; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125374 () Bool)

(assert start!125374)

(declare-fun b!1466610 () Bool)

(declare-fun e!823893 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1466610 (= e!823893 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!641656 () (_ BitVec 64))

(declare-datatypes ((array!98800 0))(
  ( (array!98801 (arr!47689 (Array (_ BitVec 32) (_ BitVec 64))) (size!48241 (_ BitVec 32))) )
))
(declare-fun lt!641652 () array!98800)

(declare-datatypes ((SeekEntryResult!11966 0))(
  ( (MissingZero!11966 (index!50256 (_ BitVec 32))) (Found!11966 (index!50257 (_ BitVec 32))) (Intermediate!11966 (undefined!12778 Bool) (index!50258 (_ BitVec 32)) (x!131826 (_ BitVec 32))) (Undefined!11966) (MissingVacant!11966 (index!50259 (_ BitVec 32))) )
))
(declare-fun lt!641658 () SeekEntryResult!11966)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11966)

(assert (=> b!1466610 (= lt!641658 (seekEntryOrOpen!0 lt!641656 lt!641652 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49269 0))(
  ( (Unit!49270) )
))
(declare-fun lt!641657 () Unit!49269)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98800)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!641653 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49269)

(assert (=> b!1466610 (= lt!641657 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641653 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466611 () Bool)

(declare-fun res!995367 () Bool)

(assert (=> b!1466611 (=> res!995367 e!823893)))

(declare-fun e!823894 () Bool)

(assert (=> b!1466611 (= res!995367 e!823894)))

(declare-fun c!135135 () Bool)

(assert (=> b!1466611 (= c!135135 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466612 () Bool)

(declare-fun res!995378 () Bool)

(declare-fun e!823892 () Bool)

(assert (=> b!1466612 (=> (not res!995378) (not e!823892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466612 (= res!995378 (validKeyInArray!0 (select (arr!47689 a!2862) i!1006)))))

(declare-fun b!1466613 () Bool)

(declare-fun e!823890 () Bool)

(assert (=> b!1466613 (= e!823892 e!823890)))

(declare-fun res!995372 () Bool)

(assert (=> b!1466613 (=> (not res!995372) (not e!823890))))

(assert (=> b!1466613 (= res!995372 (= (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466613 (= lt!641652 (array!98801 (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48241 a!2862)))))

(declare-fun b!1466614 () Bool)

(declare-fun e!823891 () Bool)

(declare-fun e!823896 () Bool)

(assert (=> b!1466614 (= e!823891 e!823896)))

(declare-fun res!995374 () Bool)

(assert (=> b!1466614 (=> (not res!995374) (not e!823896))))

(declare-fun lt!641654 () SeekEntryResult!11966)

(assert (=> b!1466614 (= res!995374 (= lt!641654 (Intermediate!11966 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466614 (= lt!641654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641656 mask!2687) lt!641656 lt!641652 mask!2687))))

(assert (=> b!1466614 (= lt!641656 (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466615 () Bool)

(declare-fun res!995379 () Bool)

(assert (=> b!1466615 (=> (not res!995379) (not e!823892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98800 (_ BitVec 32)) Bool)

(assert (=> b!1466615 (= res!995379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!823888 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1466616 () Bool)

(assert (=> b!1466616 (= e!823888 (= lt!641654 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641656 lt!641652 mask!2687)))))

(declare-fun b!1466618 () Bool)

(declare-fun e!823895 () Bool)

(assert (=> b!1466618 (= e!823896 (not e!823895))))

(declare-fun res!995381 () Bool)

(assert (=> b!1466618 (=> res!995381 e!823895)))

(assert (=> b!1466618 (= res!995381 (or (and (= (select (arr!47689 a!2862) index!646) (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47689 a!2862) index!646) (select (arr!47689 a!2862) j!93))) (= (select (arr!47689 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466618 (and (= lt!641658 (Found!11966 j!93)) (or (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) (select (arr!47689 a!2862) j!93))))))

(assert (=> b!1466618 (= lt!641658 (seekEntryOrOpen!0 (select (arr!47689 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466618 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641651 () Unit!49269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49269)

(assert (=> b!1466618 (= lt!641651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466619 () Bool)

(declare-fun res!995371 () Bool)

(assert (=> b!1466619 (=> (not res!995371) (not e!823896))))

(assert (=> b!1466619 (= res!995371 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466620 () Bool)

(declare-fun res!995383 () Bool)

(assert (=> b!1466620 (=> (not res!995383) (not e!823891))))

(declare-fun lt!641655 () SeekEntryResult!11966)

(assert (=> b!1466620 (= res!995383 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641655))))

(declare-fun b!1466621 () Bool)

(declare-fun res!995380 () Bool)

(assert (=> b!1466621 (=> res!995380 e!823893)))

(assert (=> b!1466621 (= res!995380 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466622 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98800 (_ BitVec 32)) SeekEntryResult!11966)

(assert (=> b!1466622 (= e!823894 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641653 intermediateAfterIndex!19 lt!641656 lt!641652 mask!2687) (seekEntryOrOpen!0 lt!641656 lt!641652 mask!2687))))))

(declare-fun b!1466623 () Bool)

(assert (=> b!1466623 (= e!823895 e!823893)))

(declare-fun res!995368 () Bool)

(assert (=> b!1466623 (=> res!995368 e!823893)))

(assert (=> b!1466623 (= res!995368 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641653 #b00000000000000000000000000000000) (bvsge lt!641653 (size!48241 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466623 (= lt!641653 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!995370 () Bool)

(assert (=> start!125374 (=> (not res!995370) (not e!823892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125374 (= res!995370 (validMask!0 mask!2687))))

(assert (=> start!125374 e!823892))

(assert (=> start!125374 true))

(declare-fun array_inv!36922 (array!98800) Bool)

(assert (=> start!125374 (array_inv!36922 a!2862)))

(declare-fun b!1466617 () Bool)

(assert (=> b!1466617 (= e!823888 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641656 lt!641652 mask!2687) (seekEntryOrOpen!0 lt!641656 lt!641652 mask!2687)))))

(declare-fun b!1466624 () Bool)

(assert (=> b!1466624 (= e!823894 (not (= lt!641654 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641653 lt!641656 lt!641652 mask!2687))))))

(declare-fun b!1466625 () Bool)

(declare-fun res!995376 () Bool)

(assert (=> b!1466625 (=> (not res!995376) (not e!823896))))

(assert (=> b!1466625 (= res!995376 e!823888)))

(declare-fun c!135136 () Bool)

(assert (=> b!1466625 (= c!135136 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466626 () Bool)

(assert (=> b!1466626 (= e!823890 e!823891)))

(declare-fun res!995366 () Bool)

(assert (=> b!1466626 (=> (not res!995366) (not e!823891))))

(assert (=> b!1466626 (= res!995366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47689 a!2862) j!93) mask!2687) (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641655))))

(assert (=> b!1466626 (= lt!641655 (Intermediate!11966 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466627 () Bool)

(declare-fun res!995382 () Bool)

(assert (=> b!1466627 (=> (not res!995382) (not e!823892))))

(declare-datatypes ((List!34268 0))(
  ( (Nil!34265) (Cons!34264 (h!35614 (_ BitVec 64)) (t!48954 List!34268)) )
))
(declare-fun arrayNoDuplicates!0 (array!98800 (_ BitVec 32) List!34268) Bool)

(assert (=> b!1466627 (= res!995382 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34265))))

(declare-fun b!1466628 () Bool)

(declare-fun res!995373 () Bool)

(assert (=> b!1466628 (=> res!995373 e!823893)))

(assert (=> b!1466628 (= res!995373 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641653 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641655)))))

(declare-fun b!1466629 () Bool)

(declare-fun res!995377 () Bool)

(assert (=> b!1466629 (=> (not res!995377) (not e!823892))))

(assert (=> b!1466629 (= res!995377 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48241 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48241 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48241 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466630 () Bool)

(declare-fun res!995375 () Bool)

(assert (=> b!1466630 (=> (not res!995375) (not e!823892))))

(assert (=> b!1466630 (= res!995375 (validKeyInArray!0 (select (arr!47689 a!2862) j!93)))))

(declare-fun b!1466631 () Bool)

(declare-fun res!995369 () Bool)

(assert (=> b!1466631 (=> (not res!995369) (not e!823892))))

(assert (=> b!1466631 (= res!995369 (and (= (size!48241 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48241 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48241 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125374 res!995370) b!1466631))

(assert (= (and b!1466631 res!995369) b!1466612))

(assert (= (and b!1466612 res!995378) b!1466630))

(assert (= (and b!1466630 res!995375) b!1466615))

(assert (= (and b!1466615 res!995379) b!1466627))

(assert (= (and b!1466627 res!995382) b!1466629))

(assert (= (and b!1466629 res!995377) b!1466613))

(assert (= (and b!1466613 res!995372) b!1466626))

(assert (= (and b!1466626 res!995366) b!1466620))

(assert (= (and b!1466620 res!995383) b!1466614))

(assert (= (and b!1466614 res!995374) b!1466625))

(assert (= (and b!1466625 c!135136) b!1466616))

(assert (= (and b!1466625 (not c!135136)) b!1466617))

(assert (= (and b!1466625 res!995376) b!1466619))

(assert (= (and b!1466619 res!995371) b!1466618))

(assert (= (and b!1466618 (not res!995381)) b!1466623))

(assert (= (and b!1466623 (not res!995368)) b!1466628))

(assert (= (and b!1466628 (not res!995373)) b!1466611))

(assert (= (and b!1466611 c!135135) b!1466624))

(assert (= (and b!1466611 (not c!135135)) b!1466622))

(assert (= (and b!1466611 (not res!995367)) b!1466621))

(assert (= (and b!1466621 (not res!995380)) b!1466610))

(declare-fun m!1353087 () Bool)

(assert (=> start!125374 m!1353087))

(declare-fun m!1353089 () Bool)

(assert (=> start!125374 m!1353089))

(declare-fun m!1353091 () Bool)

(assert (=> b!1466610 m!1353091))

(declare-fun m!1353093 () Bool)

(assert (=> b!1466610 m!1353093))

(declare-fun m!1353095 () Bool)

(assert (=> b!1466612 m!1353095))

(assert (=> b!1466612 m!1353095))

(declare-fun m!1353097 () Bool)

(assert (=> b!1466612 m!1353097))

(declare-fun m!1353099 () Bool)

(assert (=> b!1466626 m!1353099))

(assert (=> b!1466626 m!1353099))

(declare-fun m!1353101 () Bool)

(assert (=> b!1466626 m!1353101))

(assert (=> b!1466626 m!1353101))

(assert (=> b!1466626 m!1353099))

(declare-fun m!1353103 () Bool)

(assert (=> b!1466626 m!1353103))

(declare-fun m!1353105 () Bool)

(assert (=> b!1466618 m!1353105))

(declare-fun m!1353107 () Bool)

(assert (=> b!1466618 m!1353107))

(declare-fun m!1353109 () Bool)

(assert (=> b!1466618 m!1353109))

(declare-fun m!1353111 () Bool)

(assert (=> b!1466618 m!1353111))

(declare-fun m!1353113 () Bool)

(assert (=> b!1466618 m!1353113))

(assert (=> b!1466618 m!1353099))

(declare-fun m!1353115 () Bool)

(assert (=> b!1466618 m!1353115))

(declare-fun m!1353117 () Bool)

(assert (=> b!1466618 m!1353117))

(assert (=> b!1466618 m!1353099))

(declare-fun m!1353119 () Bool)

(assert (=> b!1466624 m!1353119))

(assert (=> b!1466628 m!1353099))

(assert (=> b!1466628 m!1353099))

(declare-fun m!1353121 () Bool)

(assert (=> b!1466628 m!1353121))

(declare-fun m!1353123 () Bool)

(assert (=> b!1466627 m!1353123))

(declare-fun m!1353125 () Bool)

(assert (=> b!1466615 m!1353125))

(declare-fun m!1353127 () Bool)

(assert (=> b!1466622 m!1353127))

(assert (=> b!1466622 m!1353091))

(assert (=> b!1466620 m!1353099))

(assert (=> b!1466620 m!1353099))

(declare-fun m!1353129 () Bool)

(assert (=> b!1466620 m!1353129))

(assert (=> b!1466613 m!1353107))

(declare-fun m!1353131 () Bool)

(assert (=> b!1466613 m!1353131))

(declare-fun m!1353133 () Bool)

(assert (=> b!1466616 m!1353133))

(declare-fun m!1353135 () Bool)

(assert (=> b!1466617 m!1353135))

(assert (=> b!1466617 m!1353091))

(assert (=> b!1466630 m!1353099))

(assert (=> b!1466630 m!1353099))

(declare-fun m!1353137 () Bool)

(assert (=> b!1466630 m!1353137))

(declare-fun m!1353139 () Bool)

(assert (=> b!1466623 m!1353139))

(declare-fun m!1353141 () Bool)

(assert (=> b!1466614 m!1353141))

(assert (=> b!1466614 m!1353141))

(declare-fun m!1353143 () Bool)

(assert (=> b!1466614 m!1353143))

(assert (=> b!1466614 m!1353107))

(declare-fun m!1353145 () Bool)

(assert (=> b!1466614 m!1353145))

(check-sat (not b!1466627) (not b!1466622) (not b!1466615) (not b!1466626) (not b!1466614) (not b!1466620) (not b!1466610) (not b!1466617) (not b!1466616) (not b!1466628) (not start!125374) (not b!1466618) (not b!1466624) (not b!1466630) (not b!1466623) (not b!1466612))
(check-sat)
