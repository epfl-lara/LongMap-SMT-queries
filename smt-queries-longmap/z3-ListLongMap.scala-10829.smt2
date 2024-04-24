; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127098 () Bool)

(assert start!127098)

(declare-fun b!1490364 () Bool)

(declare-fun e!835495 () Bool)

(declare-fun e!835488 () Bool)

(assert (=> b!1490364 (= e!835495 (not e!835488))))

(declare-fun res!1012858 () Bool)

(assert (=> b!1490364 (=> res!1012858 e!835488)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99709 0))(
  ( (array!99710 (arr!48121 (Array (_ BitVec 32) (_ BitVec 64))) (size!48672 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99709)

(assert (=> b!1490364 (= res!1012858 (or (and (= (select (arr!48121 a!2862) index!646) (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48121 a!2862) index!646) (select (arr!48121 a!2862) j!93))) (= (select (arr!48121 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!835491 () Bool)

(assert (=> b!1490364 e!835491))

(declare-fun res!1012863 () Bool)

(assert (=> b!1490364 (=> (not res!1012863) (not e!835491))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99709 (_ BitVec 32)) Bool)

(assert (=> b!1490364 (= res!1012863 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49889 0))(
  ( (Unit!49890) )
))
(declare-fun lt!649921 () Unit!49889)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49889)

(assert (=> b!1490364 (= lt!649921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!835497 () Bool)

(declare-fun b!1490365 () Bool)

(declare-fun lt!649920 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12258 0))(
  ( (MissingZero!12258 (index!51424 (_ BitVec 32))) (Found!12258 (index!51425 (_ BitVec 32))) (Intermediate!12258 (undefined!13070 Bool) (index!51426 (_ BitVec 32)) (x!133211 (_ BitVec 32))) (Undefined!12258) (MissingVacant!12258 (index!51427 (_ BitVec 32))) )
))
(declare-fun lt!649916 () SeekEntryResult!12258)

(declare-fun lt!649919 () (_ BitVec 64))

(declare-fun lt!649917 () array!99709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12258)

(assert (=> b!1490365 (= e!835497 (not (= lt!649916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649920 lt!649919 lt!649917 mask!2687))))))

(declare-fun b!1490366 () Bool)

(declare-fun res!1012852 () Bool)

(declare-fun e!835496 () Bool)

(assert (=> b!1490366 (=> (not res!1012852) (not e!835496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490366 (= res!1012852 (validKeyInArray!0 (select (arr!48121 a!2862) i!1006)))))

(declare-fun res!1012851 () Bool)

(assert (=> start!127098 (=> (not res!1012851) (not e!835496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127098 (= res!1012851 (validMask!0 mask!2687))))

(assert (=> start!127098 e!835496))

(assert (=> start!127098 true))

(declare-fun array_inv!37402 (array!99709) Bool)

(assert (=> start!127098 (array_inv!37402 a!2862)))

(declare-fun b!1490367 () Bool)

(declare-fun e!835492 () Bool)

(declare-fun e!835493 () Bool)

(assert (=> b!1490367 (= e!835492 e!835493)))

(declare-fun res!1012859 () Bool)

(assert (=> b!1490367 (=> (not res!1012859) (not e!835493))))

(declare-fun lt!649918 () SeekEntryResult!12258)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490367 (= res!1012859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48121 a!2862) j!93) mask!2687) (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!649918))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490367 (= lt!649918 (Intermediate!12258 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!835494 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1490368 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12258)

(assert (=> b!1490368 (= e!835494 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649919 lt!649917 mask!2687) (seekEntryOrOpen!0 lt!649919 lt!649917 mask!2687)))))

(declare-fun b!1490369 () Bool)

(declare-fun res!1012857 () Bool)

(assert (=> b!1490369 (=> (not res!1012857) (not e!835496))))

(assert (=> b!1490369 (= res!1012857 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48672 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48672 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48672 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490370 () Bool)

(declare-fun res!1012861 () Bool)

(declare-fun e!835489 () Bool)

(assert (=> b!1490370 (=> res!1012861 e!835489)))

(assert (=> b!1490370 (= res!1012861 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649920 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!649918)))))

(declare-fun b!1490371 () Bool)

(declare-fun res!1012862 () Bool)

(assert (=> b!1490371 (=> (not res!1012862) (not e!835496))))

(assert (=> b!1490371 (= res!1012862 (validKeyInArray!0 (select (arr!48121 a!2862) j!93)))))

(declare-fun b!1490372 () Bool)

(declare-fun res!1012865 () Bool)

(assert (=> b!1490372 (=> (not res!1012865) (not e!835493))))

(assert (=> b!1490372 (= res!1012865 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!649918))))

(declare-fun b!1490373 () Bool)

(declare-fun res!1012867 () Bool)

(assert (=> b!1490373 (=> (not res!1012867) (not e!835496))))

(assert (=> b!1490373 (= res!1012867 (and (= (size!48672 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48672 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48672 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490374 () Bool)

(assert (=> b!1490374 (= e!835491 (and (or (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) (select (arr!48121 a!2862) j!93))) (let ((bdg!54654 (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48121 a!2862) index!646) bdg!54654) (= (select (arr!48121 a!2862) index!646) (select (arr!48121 a!2862) j!93))) (= (select (arr!48121 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54654 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1490375 () Bool)

(declare-fun res!1012854 () Bool)

(assert (=> b!1490375 (=> res!1012854 e!835489)))

(assert (=> b!1490375 (= res!1012854 e!835497)))

(declare-fun c!138294 () Bool)

(assert (=> b!1490375 (= c!138294 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490376 () Bool)

(declare-fun res!1012860 () Bool)

(assert (=> b!1490376 (=> (not res!1012860) (not e!835496))))

(assert (=> b!1490376 (= res!1012860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490377 () Bool)

(assert (=> b!1490377 (= e!835493 e!835495)))

(declare-fun res!1012856 () Bool)

(assert (=> b!1490377 (=> (not res!1012856) (not e!835495))))

(assert (=> b!1490377 (= res!1012856 (= lt!649916 (Intermediate!12258 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490377 (= lt!649916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649919 mask!2687) lt!649919 lt!649917 mask!2687))))

(assert (=> b!1490377 (= lt!649919 (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490378 () Bool)

(declare-fun res!1012853 () Bool)

(assert (=> b!1490378 (=> (not res!1012853) (not e!835495))))

(assert (=> b!1490378 (= res!1012853 e!835494)))

(declare-fun c!138295 () Bool)

(assert (=> b!1490378 (= c!138295 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490379 () Bool)

(declare-fun lt!649915 () SeekEntryResult!12258)

(assert (=> b!1490379 (= e!835497 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649920 intermediateAfterIndex!19 lt!649919 lt!649917 mask!2687) lt!649915)))))

(declare-fun b!1490380 () Bool)

(assert (=> b!1490380 (= e!835494 (= lt!649916 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649919 lt!649917 mask!2687)))))

(declare-fun b!1490381 () Bool)

(assert (=> b!1490381 (= e!835488 e!835489)))

(declare-fun res!1012850 () Bool)

(assert (=> b!1490381 (=> res!1012850 e!835489)))

(assert (=> b!1490381 (= res!1012850 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649920 #b00000000000000000000000000000000) (bvsge lt!649920 (size!48672 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490381 (= lt!649920 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1490381 (= lt!649915 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649919 lt!649917 mask!2687))))

(assert (=> b!1490381 (= lt!649915 (seekEntryOrOpen!0 lt!649919 lt!649917 mask!2687))))

(declare-fun b!1490382 () Bool)

(declare-fun res!1012855 () Bool)

(assert (=> b!1490382 (=> (not res!1012855) (not e!835496))))

(declare-datatypes ((List!34609 0))(
  ( (Nil!34606) (Cons!34605 (h!36002 (_ BitVec 64)) (t!49295 List!34609)) )
))
(declare-fun arrayNoDuplicates!0 (array!99709 (_ BitVec 32) List!34609) Bool)

(assert (=> b!1490382 (= res!1012855 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34606))))

(declare-fun b!1490383 () Bool)

(assert (=> b!1490383 (= e!835489 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490384 () Bool)

(assert (=> b!1490384 (= e!835496 e!835492)))

(declare-fun res!1012866 () Bool)

(assert (=> b!1490384 (=> (not res!1012866) (not e!835492))))

(assert (=> b!1490384 (= res!1012866 (= (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490384 (= lt!649917 (array!99710 (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48672 a!2862)))))

(declare-fun b!1490385 () Bool)

(declare-fun res!1012868 () Bool)

(assert (=> b!1490385 (=> (not res!1012868) (not e!835491))))

(assert (=> b!1490385 (= res!1012868 (= (seekEntryOrOpen!0 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) (Found!12258 j!93)))))

(declare-fun b!1490386 () Bool)

(declare-fun res!1012864 () Bool)

(assert (=> b!1490386 (=> (not res!1012864) (not e!835495))))

(assert (=> b!1490386 (= res!1012864 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127098 res!1012851) b!1490373))

(assert (= (and b!1490373 res!1012867) b!1490366))

(assert (= (and b!1490366 res!1012852) b!1490371))

(assert (= (and b!1490371 res!1012862) b!1490376))

(assert (= (and b!1490376 res!1012860) b!1490382))

(assert (= (and b!1490382 res!1012855) b!1490369))

(assert (= (and b!1490369 res!1012857) b!1490384))

(assert (= (and b!1490384 res!1012866) b!1490367))

(assert (= (and b!1490367 res!1012859) b!1490372))

(assert (= (and b!1490372 res!1012865) b!1490377))

(assert (= (and b!1490377 res!1012856) b!1490378))

(assert (= (and b!1490378 c!138295) b!1490380))

(assert (= (and b!1490378 (not c!138295)) b!1490368))

(assert (= (and b!1490378 res!1012853) b!1490386))

(assert (= (and b!1490386 res!1012864) b!1490364))

(assert (= (and b!1490364 res!1012863) b!1490385))

(assert (= (and b!1490385 res!1012868) b!1490374))

(assert (= (and b!1490364 (not res!1012858)) b!1490381))

(assert (= (and b!1490381 (not res!1012850)) b!1490370))

(assert (= (and b!1490370 (not res!1012861)) b!1490375))

(assert (= (and b!1490375 c!138294) b!1490365))

(assert (= (and b!1490375 (not c!138294)) b!1490379))

(assert (= (and b!1490375 (not res!1012854)) b!1490383))

(declare-fun m!1374697 () Bool)

(assert (=> b!1490366 m!1374697))

(assert (=> b!1490366 m!1374697))

(declare-fun m!1374699 () Bool)

(assert (=> b!1490366 m!1374699))

(declare-fun m!1374701 () Bool)

(assert (=> b!1490377 m!1374701))

(assert (=> b!1490377 m!1374701))

(declare-fun m!1374703 () Bool)

(assert (=> b!1490377 m!1374703))

(declare-fun m!1374705 () Bool)

(assert (=> b!1490377 m!1374705))

(declare-fun m!1374707 () Bool)

(assert (=> b!1490377 m!1374707))

(assert (=> b!1490384 m!1374705))

(declare-fun m!1374709 () Bool)

(assert (=> b!1490384 m!1374709))

(declare-fun m!1374711 () Bool)

(assert (=> b!1490376 m!1374711))

(assert (=> b!1490374 m!1374705))

(declare-fun m!1374713 () Bool)

(assert (=> b!1490374 m!1374713))

(declare-fun m!1374715 () Bool)

(assert (=> b!1490374 m!1374715))

(declare-fun m!1374717 () Bool)

(assert (=> b!1490374 m!1374717))

(declare-fun m!1374719 () Bool)

(assert (=> b!1490374 m!1374719))

(declare-fun m!1374721 () Bool)

(assert (=> b!1490382 m!1374721))

(declare-fun m!1374723 () Bool)

(assert (=> start!127098 m!1374723))

(declare-fun m!1374725 () Bool)

(assert (=> start!127098 m!1374725))

(declare-fun m!1374727 () Bool)

(assert (=> b!1490368 m!1374727))

(declare-fun m!1374729 () Bool)

(assert (=> b!1490368 m!1374729))

(declare-fun m!1374731 () Bool)

(assert (=> b!1490380 m!1374731))

(declare-fun m!1374733 () Bool)

(assert (=> b!1490381 m!1374733))

(assert (=> b!1490381 m!1374727))

(assert (=> b!1490381 m!1374729))

(assert (=> b!1490372 m!1374719))

(assert (=> b!1490372 m!1374719))

(declare-fun m!1374735 () Bool)

(assert (=> b!1490372 m!1374735))

(assert (=> b!1490385 m!1374719))

(assert (=> b!1490385 m!1374719))

(declare-fun m!1374737 () Bool)

(assert (=> b!1490385 m!1374737))

(declare-fun m!1374739 () Bool)

(assert (=> b!1490365 m!1374739))

(assert (=> b!1490367 m!1374719))

(assert (=> b!1490367 m!1374719))

(declare-fun m!1374741 () Bool)

(assert (=> b!1490367 m!1374741))

(assert (=> b!1490367 m!1374741))

(assert (=> b!1490367 m!1374719))

(declare-fun m!1374743 () Bool)

(assert (=> b!1490367 m!1374743))

(declare-fun m!1374745 () Bool)

(assert (=> b!1490364 m!1374745))

(assert (=> b!1490364 m!1374705))

(assert (=> b!1490364 m!1374715))

(assert (=> b!1490364 m!1374717))

(declare-fun m!1374747 () Bool)

(assert (=> b!1490364 m!1374747))

(assert (=> b!1490364 m!1374719))

(assert (=> b!1490371 m!1374719))

(assert (=> b!1490371 m!1374719))

(declare-fun m!1374749 () Bool)

(assert (=> b!1490371 m!1374749))

(assert (=> b!1490370 m!1374719))

(assert (=> b!1490370 m!1374719))

(declare-fun m!1374751 () Bool)

(assert (=> b!1490370 m!1374751))

(declare-fun m!1374753 () Bool)

(assert (=> b!1490379 m!1374753))

(check-sat (not b!1490376) (not b!1490365) (not b!1490381) (not b!1490370) (not b!1490372) (not b!1490379) (not b!1490367) (not b!1490380) (not b!1490382) (not b!1490368) (not b!1490371) (not b!1490364) (not b!1490366) (not start!127098) (not b!1490377) (not b!1490385))
(check-sat)
