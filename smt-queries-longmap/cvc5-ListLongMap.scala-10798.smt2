; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126376 () Bool)

(assert start!126376)

(declare-fun b!1481414 () Bool)

(declare-fun res!1006746 () Bool)

(declare-fun e!830867 () Bool)

(assert (=> b!1481414 (=> (not res!1006746) (not e!830867))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481414 (= res!1006746 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481415 () Bool)

(declare-fun e!830870 () Bool)

(declare-fun e!830865 () Bool)

(assert (=> b!1481415 (= e!830870 e!830865)))

(declare-fun res!1006744 () Bool)

(assert (=> b!1481415 (=> (not res!1006744) (not e!830865))))

(declare-datatypes ((SeekEntryResult!12215 0))(
  ( (MissingZero!12215 (index!51252 (_ BitVec 32))) (Found!12215 (index!51253 (_ BitVec 32))) (Intermediate!12215 (undefined!13027 Bool) (index!51254 (_ BitVec 32)) (x!132842 (_ BitVec 32))) (Undefined!12215) (MissingVacant!12215 (index!51255 (_ BitVec 32))) )
))
(declare-fun lt!646772 () SeekEntryResult!12215)

(declare-datatypes ((array!99395 0))(
  ( (array!99396 (arr!47975 (Array (_ BitVec 32) (_ BitVec 64))) (size!48525 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99395)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99395 (_ BitVec 32)) SeekEntryResult!12215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481415 (= res!1006744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47975 a!2862) j!93) mask!2687) (select (arr!47975 a!2862) j!93) a!2862 mask!2687) lt!646772))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481415 (= lt!646772 (Intermediate!12215 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481416 () Bool)

(declare-fun res!1006751 () Bool)

(assert (=> b!1481416 (=> (not res!1006751) (not e!830867))))

(declare-fun e!830869 () Bool)

(assert (=> b!1481416 (= res!1006751 e!830869)))

(declare-fun c!136857 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481416 (= c!136857 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481417 () Bool)

(declare-fun res!1006747 () Bool)

(declare-fun e!830864 () Bool)

(assert (=> b!1481417 (=> (not res!1006747) (not e!830864))))

(declare-datatypes ((List!34476 0))(
  ( (Nil!34473) (Cons!34472 (h!35843 (_ BitVec 64)) (t!49170 List!34476)) )
))
(declare-fun arrayNoDuplicates!0 (array!99395 (_ BitVec 32) List!34476) Bool)

(assert (=> b!1481417 (= res!1006747 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34473))))

(declare-fun b!1481418 () Bool)

(declare-fun res!1006742 () Bool)

(declare-fun e!830866 () Bool)

(assert (=> b!1481418 (=> (not res!1006742) (not e!830866))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99395 (_ BitVec 32)) SeekEntryResult!12215)

(assert (=> b!1481418 (= res!1006742 (= (seekEntryOrOpen!0 (select (arr!47975 a!2862) j!93) a!2862 mask!2687) (Found!12215 j!93)))))

(declare-fun res!1006756 () Bool)

(assert (=> start!126376 (=> (not res!1006756) (not e!830864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126376 (= res!1006756 (validMask!0 mask!2687))))

(assert (=> start!126376 e!830864))

(assert (=> start!126376 true))

(declare-fun array_inv!37003 (array!99395) Bool)

(assert (=> start!126376 (array_inv!37003 a!2862)))

(declare-fun b!1481419 () Bool)

(assert (=> b!1481419 (= e!830864 e!830870)))

(declare-fun res!1006755 () Bool)

(assert (=> b!1481419 (=> (not res!1006755) (not e!830870))))

(assert (=> b!1481419 (= res!1006755 (= (select (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646769 () array!99395)

(assert (=> b!1481419 (= lt!646769 (array!99396 (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48525 a!2862)))))

(declare-fun b!1481420 () Bool)

(assert (=> b!1481420 (= e!830865 e!830867)))

(declare-fun res!1006752 () Bool)

(assert (=> b!1481420 (=> (not res!1006752) (not e!830867))))

(declare-fun lt!646773 () SeekEntryResult!12215)

(assert (=> b!1481420 (= res!1006752 (= lt!646773 (Intermediate!12215 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646771 () (_ BitVec 64))

(assert (=> b!1481420 (= lt!646773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646771 mask!2687) lt!646771 lt!646769 mask!2687))))

(assert (=> b!1481420 (= lt!646771 (select (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481421 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1481421 (= e!830867 (not (or (and (= (select (arr!47975 a!2862) index!646) (select (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47975 a!2862) index!646) (select (arr!47975 a!2862) j!93))) (= (select (arr!47975 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= (select (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1481421 e!830866))

(declare-fun res!1006749 () Bool)

(assert (=> b!1481421 (=> (not res!1006749) (not e!830866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99395 (_ BitVec 32)) Bool)

(assert (=> b!1481421 (= res!1006749 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49770 0))(
  ( (Unit!49771) )
))
(declare-fun lt!646770 () Unit!49770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49770)

(assert (=> b!1481421 (= lt!646770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481422 () Bool)

(declare-fun res!1006750 () Bool)

(assert (=> b!1481422 (=> (not res!1006750) (not e!830864))))

(assert (=> b!1481422 (= res!1006750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481423 () Bool)

(declare-fun res!1006745 () Bool)

(assert (=> b!1481423 (=> (not res!1006745) (not e!830864))))

(assert (=> b!1481423 (= res!1006745 (and (= (size!48525 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48525 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48525 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481424 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99395 (_ BitVec 32)) SeekEntryResult!12215)

(assert (=> b!1481424 (= e!830869 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646771 lt!646769 mask!2687) (seekEntryOrOpen!0 lt!646771 lt!646769 mask!2687)))))

(declare-fun b!1481425 () Bool)

(declare-fun res!1006754 () Bool)

(assert (=> b!1481425 (=> (not res!1006754) (not e!830864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481425 (= res!1006754 (validKeyInArray!0 (select (arr!47975 a!2862) j!93)))))

(declare-fun b!1481426 () Bool)

(declare-fun res!1006753 () Bool)

(assert (=> b!1481426 (=> (not res!1006753) (not e!830864))))

(assert (=> b!1481426 (= res!1006753 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48525 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48525 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48525 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481427 () Bool)

(assert (=> b!1481427 (= e!830866 (and (or (= (select (arr!47975 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47975 a!2862) intermediateBeforeIndex!19) (select (arr!47975 a!2862) j!93))) (or (and (= (select (arr!47975 a!2862) index!646) (select (store (arr!47975 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47975 a!2862) index!646) (select (arr!47975 a!2862) j!93))) (= (select (arr!47975 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481428 () Bool)

(assert (=> b!1481428 (= e!830869 (= lt!646773 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646771 lt!646769 mask!2687)))))

(declare-fun b!1481429 () Bool)

(declare-fun res!1006748 () Bool)

(assert (=> b!1481429 (=> (not res!1006748) (not e!830865))))

(assert (=> b!1481429 (= res!1006748 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47975 a!2862) j!93) a!2862 mask!2687) lt!646772))))

(declare-fun b!1481430 () Bool)

(declare-fun res!1006743 () Bool)

(assert (=> b!1481430 (=> (not res!1006743) (not e!830864))))

(assert (=> b!1481430 (= res!1006743 (validKeyInArray!0 (select (arr!47975 a!2862) i!1006)))))

(assert (= (and start!126376 res!1006756) b!1481423))

(assert (= (and b!1481423 res!1006745) b!1481430))

(assert (= (and b!1481430 res!1006743) b!1481425))

(assert (= (and b!1481425 res!1006754) b!1481422))

(assert (= (and b!1481422 res!1006750) b!1481417))

(assert (= (and b!1481417 res!1006747) b!1481426))

(assert (= (and b!1481426 res!1006753) b!1481419))

(assert (= (and b!1481419 res!1006755) b!1481415))

(assert (= (and b!1481415 res!1006744) b!1481429))

(assert (= (and b!1481429 res!1006748) b!1481420))

(assert (= (and b!1481420 res!1006752) b!1481416))

(assert (= (and b!1481416 c!136857) b!1481428))

(assert (= (and b!1481416 (not c!136857)) b!1481424))

(assert (= (and b!1481416 res!1006751) b!1481414))

(assert (= (and b!1481414 res!1006746) b!1481421))

(assert (= (and b!1481421 res!1006749) b!1481418))

(assert (= (and b!1481418 res!1006742) b!1481427))

(declare-fun m!1367155 () Bool)

(assert (=> b!1481428 m!1367155))

(declare-fun m!1367157 () Bool)

(assert (=> b!1481429 m!1367157))

(assert (=> b!1481429 m!1367157))

(declare-fun m!1367159 () Bool)

(assert (=> b!1481429 m!1367159))

(assert (=> b!1481418 m!1367157))

(assert (=> b!1481418 m!1367157))

(declare-fun m!1367161 () Bool)

(assert (=> b!1481418 m!1367161))

(assert (=> b!1481415 m!1367157))

(assert (=> b!1481415 m!1367157))

(declare-fun m!1367163 () Bool)

(assert (=> b!1481415 m!1367163))

(assert (=> b!1481415 m!1367163))

(assert (=> b!1481415 m!1367157))

(declare-fun m!1367165 () Bool)

(assert (=> b!1481415 m!1367165))

(declare-fun m!1367167 () Bool)

(assert (=> b!1481427 m!1367167))

(declare-fun m!1367169 () Bool)

(assert (=> b!1481427 m!1367169))

(declare-fun m!1367171 () Bool)

(assert (=> b!1481427 m!1367171))

(declare-fun m!1367173 () Bool)

(assert (=> b!1481427 m!1367173))

(assert (=> b!1481427 m!1367157))

(declare-fun m!1367175 () Bool)

(assert (=> b!1481430 m!1367175))

(assert (=> b!1481430 m!1367175))

(declare-fun m!1367177 () Bool)

(assert (=> b!1481430 m!1367177))

(declare-fun m!1367179 () Bool)

(assert (=> b!1481422 m!1367179))

(declare-fun m!1367181 () Bool)

(assert (=> b!1481424 m!1367181))

(declare-fun m!1367183 () Bool)

(assert (=> b!1481424 m!1367183))

(declare-fun m!1367185 () Bool)

(assert (=> b!1481417 m!1367185))

(assert (=> b!1481425 m!1367157))

(assert (=> b!1481425 m!1367157))

(declare-fun m!1367187 () Bool)

(assert (=> b!1481425 m!1367187))

(declare-fun m!1367189 () Bool)

(assert (=> b!1481420 m!1367189))

(assert (=> b!1481420 m!1367189))

(declare-fun m!1367191 () Bool)

(assert (=> b!1481420 m!1367191))

(assert (=> b!1481420 m!1367167))

(declare-fun m!1367193 () Bool)

(assert (=> b!1481420 m!1367193))

(assert (=> b!1481419 m!1367167))

(declare-fun m!1367195 () Bool)

(assert (=> b!1481419 m!1367195))

(declare-fun m!1367197 () Bool)

(assert (=> b!1481421 m!1367197))

(assert (=> b!1481421 m!1367167))

(assert (=> b!1481421 m!1367171))

(assert (=> b!1481421 m!1367173))

(declare-fun m!1367199 () Bool)

(assert (=> b!1481421 m!1367199))

(assert (=> b!1481421 m!1367157))

(declare-fun m!1367201 () Bool)

(assert (=> start!126376 m!1367201))

(declare-fun m!1367203 () Bool)

(assert (=> start!126376 m!1367203))

(push 1)

