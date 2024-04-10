; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126534 () Bool)

(assert start!126534)

(declare-fun b!1484611 () Bool)

(declare-fun e!832361 () Bool)

(assert (=> b!1484611 (= e!832361 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647820 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484611 (= lt!647820 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484612 () Bool)

(declare-fun e!832362 () Bool)

(assert (=> b!1484612 (= e!832362 (not e!832361))))

(declare-fun res!1009386 () Bool)

(assert (=> b!1484612 (=> res!1009386 e!832361)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99496 0))(
  ( (array!99497 (arr!48024 (Array (_ BitVec 32) (_ BitVec 64))) (size!48574 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99496)

(assert (=> b!1484612 (= res!1009386 (or (and (= (select (arr!48024 a!2862) index!646) (select (store (arr!48024 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48024 a!2862) index!646) (select (arr!48024 a!2862) j!93))) (= (select (arr!48024 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832358 () Bool)

(assert (=> b!1484612 e!832358))

(declare-fun res!1009377 () Bool)

(assert (=> b!1484612 (=> (not res!1009377) (not e!832358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99496 (_ BitVec 32)) Bool)

(assert (=> b!1484612 (= res!1009377 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49868 0))(
  ( (Unit!49869) )
))
(declare-fun lt!647822 () Unit!49868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49868)

(assert (=> b!1484612 (= lt!647822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484613 () Bool)

(declare-fun e!832363 () Bool)

(assert (=> b!1484613 (= e!832358 e!832363)))

(declare-fun res!1009390 () Bool)

(assert (=> b!1484613 (=> res!1009390 e!832363)))

(declare-fun lt!647823 () (_ BitVec 64))

(assert (=> b!1484613 (= res!1009390 (or (and (= (select (arr!48024 a!2862) index!646) lt!647823) (= (select (arr!48024 a!2862) index!646) (select (arr!48024 a!2862) j!93))) (= (select (arr!48024 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484613 (= lt!647823 (select (store (arr!48024 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484614 () Bool)

(declare-fun res!1009388 () Bool)

(declare-fun e!832365 () Bool)

(assert (=> b!1484614 (=> (not res!1009388) (not e!832365))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484614 (= res!1009388 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48574 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48574 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48574 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484615 () Bool)

(declare-fun res!1009381 () Bool)

(assert (=> b!1484615 (=> (not res!1009381) (not e!832365))))

(declare-datatypes ((List!34525 0))(
  ( (Nil!34522) (Cons!34521 (h!35895 (_ BitVec 64)) (t!49219 List!34525)) )
))
(declare-fun arrayNoDuplicates!0 (array!99496 (_ BitVec 32) List!34525) Bool)

(assert (=> b!1484615 (= res!1009381 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34522))))

(declare-fun b!1484616 () Bool)

(declare-fun e!832364 () Bool)

(declare-fun e!832359 () Bool)

(assert (=> b!1484616 (= e!832364 e!832359)))

(declare-fun res!1009382 () Bool)

(assert (=> b!1484616 (=> (not res!1009382) (not e!832359))))

(declare-datatypes ((SeekEntryResult!12264 0))(
  ( (MissingZero!12264 (index!51448 (_ BitVec 32))) (Found!12264 (index!51449 (_ BitVec 32))) (Intermediate!12264 (undefined!13076 Bool) (index!51450 (_ BitVec 32)) (x!133028 (_ BitVec 32))) (Undefined!12264) (MissingVacant!12264 (index!51451 (_ BitVec 32))) )
))
(declare-fun lt!647817 () SeekEntryResult!12264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99496 (_ BitVec 32)) SeekEntryResult!12264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484616 (= res!1009382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48024 a!2862) j!93) mask!2687) (select (arr!48024 a!2862) j!93) a!2862 mask!2687) lt!647817))))

(assert (=> b!1484616 (= lt!647817 (Intermediate!12264 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484617 () Bool)

(assert (=> b!1484617 (= e!832359 e!832362)))

(declare-fun res!1009379 () Bool)

(assert (=> b!1484617 (=> (not res!1009379) (not e!832362))))

(declare-fun lt!647821 () SeekEntryResult!12264)

(assert (=> b!1484617 (= res!1009379 (= lt!647821 (Intermediate!12264 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647818 () array!99496)

(declare-fun lt!647819 () (_ BitVec 64))

(assert (=> b!1484617 (= lt!647821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647819 mask!2687) lt!647819 lt!647818 mask!2687))))

(assert (=> b!1484617 (= lt!647819 (select (store (arr!48024 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!832360 () Bool)

(declare-fun b!1484618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99496 (_ BitVec 32)) SeekEntryResult!12264)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99496 (_ BitVec 32)) SeekEntryResult!12264)

(assert (=> b!1484618 (= e!832360 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647819 lt!647818 mask!2687) (seekEntryOrOpen!0 lt!647819 lt!647818 mask!2687)))))

(declare-fun b!1484619 () Bool)

(declare-fun res!1009373 () Bool)

(assert (=> b!1484619 (=> (not res!1009373) (not e!832365))))

(assert (=> b!1484619 (= res!1009373 (and (= (size!48574 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48574 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48574 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484620 () Bool)

(assert (=> b!1484620 (= e!832360 (= lt!647821 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647819 lt!647818 mask!2687)))))

(declare-fun res!1009389 () Bool)

(assert (=> start!126534 (=> (not res!1009389) (not e!832365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126534 (= res!1009389 (validMask!0 mask!2687))))

(assert (=> start!126534 e!832365))

(assert (=> start!126534 true))

(declare-fun array_inv!37052 (array!99496) Bool)

(assert (=> start!126534 (array_inv!37052 a!2862)))

(declare-fun b!1484621 () Bool)

(declare-fun res!1009380 () Bool)

(assert (=> b!1484621 (=> (not res!1009380) (not e!832365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484621 (= res!1009380 (validKeyInArray!0 (select (arr!48024 a!2862) i!1006)))))

(declare-fun b!1484622 () Bool)

(assert (=> b!1484622 (= e!832365 e!832364)))

(declare-fun res!1009385 () Bool)

(assert (=> b!1484622 (=> (not res!1009385) (not e!832364))))

(assert (=> b!1484622 (= res!1009385 (= (select (store (arr!48024 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484622 (= lt!647818 (array!99497 (store (arr!48024 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48574 a!2862)))))

(declare-fun b!1484623 () Bool)

(declare-fun e!832366 () Bool)

(assert (=> b!1484623 (= e!832366 (= (seekEntryOrOpen!0 lt!647819 lt!647818 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647819 lt!647818 mask!2687)))))

(declare-fun b!1484624 () Bool)

(assert (=> b!1484624 (= e!832363 e!832366)))

(declare-fun res!1009378 () Bool)

(assert (=> b!1484624 (=> (not res!1009378) (not e!832366))))

(assert (=> b!1484624 (= res!1009378 (and (= index!646 intermediateAfterIndex!19) (= lt!647823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484625 () Bool)

(declare-fun res!1009384 () Bool)

(assert (=> b!1484625 (=> (not res!1009384) (not e!832365))))

(assert (=> b!1484625 (= res!1009384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484626 () Bool)

(declare-fun res!1009387 () Bool)

(assert (=> b!1484626 (=> (not res!1009387) (not e!832365))))

(assert (=> b!1484626 (= res!1009387 (validKeyInArray!0 (select (arr!48024 a!2862) j!93)))))

(declare-fun b!1484627 () Bool)

(declare-fun res!1009383 () Bool)

(assert (=> b!1484627 (=> (not res!1009383) (not e!832358))))

(assert (=> b!1484627 (= res!1009383 (or (= (select (arr!48024 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48024 a!2862) intermediateBeforeIndex!19) (select (arr!48024 a!2862) j!93))))))

(declare-fun b!1484628 () Bool)

(declare-fun res!1009375 () Bool)

(assert (=> b!1484628 (=> (not res!1009375) (not e!832359))))

(assert (=> b!1484628 (= res!1009375 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48024 a!2862) j!93) a!2862 mask!2687) lt!647817))))

(declare-fun b!1484629 () Bool)

(declare-fun res!1009372 () Bool)

(assert (=> b!1484629 (=> (not res!1009372) (not e!832362))))

(assert (=> b!1484629 (= res!1009372 e!832360)))

(declare-fun c!137142 () Bool)

(assert (=> b!1484629 (= c!137142 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484630 () Bool)

(declare-fun res!1009376 () Bool)

(assert (=> b!1484630 (=> (not res!1009376) (not e!832358))))

(assert (=> b!1484630 (= res!1009376 (= (seekEntryOrOpen!0 (select (arr!48024 a!2862) j!93) a!2862 mask!2687) (Found!12264 j!93)))))

(declare-fun b!1484631 () Bool)

(declare-fun res!1009374 () Bool)

(assert (=> b!1484631 (=> (not res!1009374) (not e!832362))))

(assert (=> b!1484631 (= res!1009374 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126534 res!1009389) b!1484619))

(assert (= (and b!1484619 res!1009373) b!1484621))

(assert (= (and b!1484621 res!1009380) b!1484626))

(assert (= (and b!1484626 res!1009387) b!1484625))

(assert (= (and b!1484625 res!1009384) b!1484615))

(assert (= (and b!1484615 res!1009381) b!1484614))

(assert (= (and b!1484614 res!1009388) b!1484622))

(assert (= (and b!1484622 res!1009385) b!1484616))

(assert (= (and b!1484616 res!1009382) b!1484628))

(assert (= (and b!1484628 res!1009375) b!1484617))

(assert (= (and b!1484617 res!1009379) b!1484629))

(assert (= (and b!1484629 c!137142) b!1484620))

(assert (= (and b!1484629 (not c!137142)) b!1484618))

(assert (= (and b!1484629 res!1009372) b!1484631))

(assert (= (and b!1484631 res!1009374) b!1484612))

(assert (= (and b!1484612 res!1009377) b!1484630))

(assert (= (and b!1484630 res!1009376) b!1484627))

(assert (= (and b!1484627 res!1009383) b!1484613))

(assert (= (and b!1484613 (not res!1009390)) b!1484624))

(assert (= (and b!1484624 res!1009378) b!1484623))

(assert (= (and b!1484612 (not res!1009386)) b!1484611))

(declare-fun m!1369889 () Bool)

(assert (=> b!1484615 m!1369889))

(declare-fun m!1369891 () Bool)

(assert (=> b!1484616 m!1369891))

(assert (=> b!1484616 m!1369891))

(declare-fun m!1369893 () Bool)

(assert (=> b!1484616 m!1369893))

(assert (=> b!1484616 m!1369893))

(assert (=> b!1484616 m!1369891))

(declare-fun m!1369895 () Bool)

(assert (=> b!1484616 m!1369895))

(declare-fun m!1369897 () Bool)

(assert (=> b!1484623 m!1369897))

(declare-fun m!1369899 () Bool)

(assert (=> b!1484623 m!1369899))

(declare-fun m!1369901 () Bool)

(assert (=> b!1484627 m!1369901))

(assert (=> b!1484627 m!1369891))

(declare-fun m!1369903 () Bool)

(assert (=> b!1484625 m!1369903))

(declare-fun m!1369905 () Bool)

(assert (=> b!1484611 m!1369905))

(declare-fun m!1369907 () Bool)

(assert (=> b!1484622 m!1369907))

(declare-fun m!1369909 () Bool)

(assert (=> b!1484622 m!1369909))

(declare-fun m!1369911 () Bool)

(assert (=> b!1484620 m!1369911))

(declare-fun m!1369913 () Bool)

(assert (=> start!126534 m!1369913))

(declare-fun m!1369915 () Bool)

(assert (=> start!126534 m!1369915))

(declare-fun m!1369917 () Bool)

(assert (=> b!1484613 m!1369917))

(assert (=> b!1484613 m!1369891))

(assert (=> b!1484613 m!1369907))

(declare-fun m!1369919 () Bool)

(assert (=> b!1484613 m!1369919))

(assert (=> b!1484626 m!1369891))

(assert (=> b!1484626 m!1369891))

(declare-fun m!1369921 () Bool)

(assert (=> b!1484626 m!1369921))

(declare-fun m!1369923 () Bool)

(assert (=> b!1484621 m!1369923))

(assert (=> b!1484621 m!1369923))

(declare-fun m!1369925 () Bool)

(assert (=> b!1484621 m!1369925))

(assert (=> b!1484630 m!1369891))

(assert (=> b!1484630 m!1369891))

(declare-fun m!1369927 () Bool)

(assert (=> b!1484630 m!1369927))

(assert (=> b!1484628 m!1369891))

(assert (=> b!1484628 m!1369891))

(declare-fun m!1369929 () Bool)

(assert (=> b!1484628 m!1369929))

(declare-fun m!1369931 () Bool)

(assert (=> b!1484612 m!1369931))

(assert (=> b!1484612 m!1369907))

(assert (=> b!1484612 m!1369919))

(assert (=> b!1484612 m!1369917))

(declare-fun m!1369933 () Bool)

(assert (=> b!1484612 m!1369933))

(assert (=> b!1484612 m!1369891))

(declare-fun m!1369935 () Bool)

(assert (=> b!1484617 m!1369935))

(assert (=> b!1484617 m!1369935))

(declare-fun m!1369937 () Bool)

(assert (=> b!1484617 m!1369937))

(assert (=> b!1484617 m!1369907))

(declare-fun m!1369939 () Bool)

(assert (=> b!1484617 m!1369939))

(assert (=> b!1484618 m!1369899))

(assert (=> b!1484618 m!1369897))

(check-sat (not b!1484618) (not b!1484611) (not b!1484616) (not b!1484628) (not b!1484612) (not b!1484626) (not b!1484630) (not b!1484615) (not b!1484617) (not b!1484621) (not b!1484623) (not b!1484620) (not start!126534) (not b!1484625))
(check-sat)
