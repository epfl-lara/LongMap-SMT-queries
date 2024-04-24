; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125646 () Bool)

(assert start!125646)

(declare-fun b!1467325 () Bool)

(declare-fun res!995087 () Bool)

(declare-fun e!824575 () Bool)

(assert (=> b!1467325 (=> (not res!995087) (not e!824575))))

(declare-datatypes ((array!98932 0))(
  ( (array!98933 (arr!47749 (Array (_ BitVec 32) (_ BitVec 64))) (size!48300 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98932)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98932 (_ BitVec 32)) Bool)

(assert (=> b!1467325 (= res!995087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467326 () Bool)

(declare-fun e!824583 () Bool)

(declare-fun e!824579 () Bool)

(assert (=> b!1467326 (= e!824583 (not e!824579))))

(declare-fun res!995095 () Bool)

(assert (=> b!1467326 (=> res!995095 e!824579)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467326 (= res!995095 (or (and (= (select (arr!47749 a!2862) index!646) (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47749 a!2862) index!646) (select (arr!47749 a!2862) j!93))) (= (select (arr!47749 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!824581 () Bool)

(assert (=> b!1467326 e!824581))

(declare-fun res!995086 () Bool)

(assert (=> b!1467326 (=> (not res!995086) (not e!824581))))

(assert (=> b!1467326 (= res!995086 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49325 0))(
  ( (Unit!49326) )
))
(declare-fun lt!642103 () Unit!49325)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49325)

(assert (=> b!1467326 (= lt!642103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!642101 () array!98932)

(declare-fun lt!642099 () (_ BitVec 32))

(declare-fun lt!642102 () (_ BitVec 64))

(declare-fun b!1467327 () Bool)

(declare-fun e!824574 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11898 0))(
  ( (MissingZero!11898 (index!49984 (_ BitVec 32))) (Found!11898 (index!49985 (_ BitVec 32))) (Intermediate!11898 (undefined!12710 Bool) (index!49986 (_ BitVec 32)) (x!131748 (_ BitVec 32))) (Undefined!11898) (MissingVacant!11898 (index!49987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98932 (_ BitVec 32)) SeekEntryResult!11898)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98932 (_ BitVec 32)) SeekEntryResult!11898)

(assert (=> b!1467327 (= e!824574 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642099 intermediateAfterIndex!19 lt!642102 lt!642101 mask!2687) (seekEntryOrOpen!0 lt!642102 lt!642101 mask!2687))))))

(declare-fun b!1467328 () Bool)

(declare-fun e!824577 () Bool)

(assert (=> b!1467328 (= e!824579 e!824577)))

(declare-fun res!995090 () Bool)

(assert (=> b!1467328 (=> res!995090 e!824577)))

(assert (=> b!1467328 (= res!995090 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642099 #b00000000000000000000000000000000) (bvsge lt!642099 (size!48300 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467328 (= lt!642099 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1467329 () Bool)

(declare-fun res!995093 () Bool)

(assert (=> b!1467329 (=> (not res!995093) (not e!824575))))

(declare-datatypes ((List!34237 0))(
  ( (Nil!34234) (Cons!34233 (h!35597 (_ BitVec 64)) (t!48923 List!34237)) )
))
(declare-fun arrayNoDuplicates!0 (array!98932 (_ BitVec 32) List!34237) Bool)

(assert (=> b!1467329 (= res!995093 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34234))))

(declare-fun b!1467330 () Bool)

(declare-fun res!995097 () Bool)

(assert (=> b!1467330 (=> (not res!995097) (not e!824583))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467330 (= res!995097 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467331 () Bool)

(declare-fun e!824582 () Bool)

(assert (=> b!1467331 (= e!824575 e!824582)))

(declare-fun res!995089 () Bool)

(assert (=> b!1467331 (=> (not res!995089) (not e!824582))))

(assert (=> b!1467331 (= res!995089 (= (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467331 (= lt!642101 (array!98933 (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48300 a!2862)))))

(declare-fun res!995098 () Bool)

(assert (=> start!125646 (=> (not res!995098) (not e!824575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125646 (= res!995098 (validMask!0 mask!2687))))

(assert (=> start!125646 e!824575))

(assert (=> start!125646 true))

(declare-fun array_inv!37030 (array!98932) Bool)

(assert (=> start!125646 (array_inv!37030 a!2862)))

(declare-fun b!1467332 () Bool)

(declare-fun res!995099 () Bool)

(assert (=> b!1467332 (=> (not res!995099) (not e!824575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467332 (= res!995099 (validKeyInArray!0 (select (arr!47749 a!2862) i!1006)))))

(declare-fun lt!642100 () SeekEntryResult!11898)

(declare-fun b!1467333 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98932 (_ BitVec 32)) SeekEntryResult!11898)

(assert (=> b!1467333 (= e!824574 (not (= lt!642100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642099 lt!642102 lt!642101 mask!2687))))))

(declare-fun b!1467334 () Bool)

(assert (=> b!1467334 (= e!824577 true)))

(declare-fun lt!642097 () Bool)

(assert (=> b!1467334 (= lt!642097 e!824574)))

(declare-fun c!135643 () Bool)

(assert (=> b!1467334 (= c!135643 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1467335 () Bool)

(assert (=> b!1467335 (= e!824581 (or (= (select (arr!47749 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47749 a!2862) intermediateBeforeIndex!19) (select (arr!47749 a!2862) j!93))))))

(declare-fun b!1467336 () Bool)

(declare-fun e!824578 () Bool)

(assert (=> b!1467336 (= e!824582 e!824578)))

(declare-fun res!995085 () Bool)

(assert (=> b!1467336 (=> (not res!995085) (not e!824578))))

(declare-fun lt!642098 () SeekEntryResult!11898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467336 (= res!995085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47749 a!2862) j!93) mask!2687) (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642098))))

(assert (=> b!1467336 (= lt!642098 (Intermediate!11898 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467337 () Bool)

(declare-fun res!995083 () Bool)

(assert (=> b!1467337 (=> (not res!995083) (not e!824581))))

(assert (=> b!1467337 (= res!995083 (= (seekEntryOrOpen!0 (select (arr!47749 a!2862) j!93) a!2862 mask!2687) (Found!11898 j!93)))))

(declare-fun b!1467338 () Bool)

(declare-fun res!995092 () Bool)

(assert (=> b!1467338 (=> res!995092 e!824577)))

(assert (=> b!1467338 (= res!995092 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642099 (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642098)))))

(declare-fun b!1467339 () Bool)

(declare-fun res!995088 () Bool)

(assert (=> b!1467339 (=> (not res!995088) (not e!824578))))

(assert (=> b!1467339 (= res!995088 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642098))))

(declare-fun b!1467340 () Bool)

(declare-fun res!995096 () Bool)

(assert (=> b!1467340 (=> (not res!995096) (not e!824575))))

(assert (=> b!1467340 (= res!995096 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48300 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48300 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48300 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467341 () Bool)

(assert (=> b!1467341 (= e!824578 e!824583)))

(declare-fun res!995082 () Bool)

(assert (=> b!1467341 (=> (not res!995082) (not e!824583))))

(assert (=> b!1467341 (= res!995082 (= lt!642100 (Intermediate!11898 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467341 (= lt!642100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642102 mask!2687) lt!642102 lt!642101 mask!2687))))

(assert (=> b!1467341 (= lt!642102 (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467342 () Bool)

(declare-fun e!824576 () Bool)

(assert (=> b!1467342 (= e!824576 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642102 lt!642101 mask!2687) (seekEntryOrOpen!0 lt!642102 lt!642101 mask!2687)))))

(declare-fun b!1467343 () Bool)

(declare-fun res!995094 () Bool)

(assert (=> b!1467343 (=> (not res!995094) (not e!824575))))

(assert (=> b!1467343 (= res!995094 (validKeyInArray!0 (select (arr!47749 a!2862) j!93)))))

(declare-fun b!1467344 () Bool)

(declare-fun res!995084 () Bool)

(assert (=> b!1467344 (=> (not res!995084) (not e!824583))))

(assert (=> b!1467344 (= res!995084 e!824576)))

(declare-fun c!135642 () Bool)

(assert (=> b!1467344 (= c!135642 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467345 () Bool)

(assert (=> b!1467345 (= e!824576 (= lt!642100 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642102 lt!642101 mask!2687)))))

(declare-fun b!1467346 () Bool)

(declare-fun res!995091 () Bool)

(assert (=> b!1467346 (=> (not res!995091) (not e!824575))))

(assert (=> b!1467346 (= res!995091 (and (= (size!48300 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48300 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48300 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125646 res!995098) b!1467346))

(assert (= (and b!1467346 res!995091) b!1467332))

(assert (= (and b!1467332 res!995099) b!1467343))

(assert (= (and b!1467343 res!995094) b!1467325))

(assert (= (and b!1467325 res!995087) b!1467329))

(assert (= (and b!1467329 res!995093) b!1467340))

(assert (= (and b!1467340 res!995096) b!1467331))

(assert (= (and b!1467331 res!995089) b!1467336))

(assert (= (and b!1467336 res!995085) b!1467339))

(assert (= (and b!1467339 res!995088) b!1467341))

(assert (= (and b!1467341 res!995082) b!1467344))

(assert (= (and b!1467344 c!135642) b!1467345))

(assert (= (and b!1467344 (not c!135642)) b!1467342))

(assert (= (and b!1467344 res!995084) b!1467330))

(assert (= (and b!1467330 res!995097) b!1467326))

(assert (= (and b!1467326 res!995086) b!1467337))

(assert (= (and b!1467337 res!995083) b!1467335))

(assert (= (and b!1467326 (not res!995095)) b!1467328))

(assert (= (and b!1467328 (not res!995090)) b!1467338))

(assert (= (and b!1467338 (not res!995092)) b!1467334))

(assert (= (and b!1467334 c!135643) b!1467333))

(assert (= (and b!1467334 (not c!135643)) b!1467327))

(declare-fun m!1354375 () Bool)

(assert (=> b!1467343 m!1354375))

(assert (=> b!1467343 m!1354375))

(declare-fun m!1354377 () Bool)

(assert (=> b!1467343 m!1354377))

(declare-fun m!1354379 () Bool)

(assert (=> b!1467342 m!1354379))

(declare-fun m!1354381 () Bool)

(assert (=> b!1467342 m!1354381))

(declare-fun m!1354383 () Bool)

(assert (=> b!1467333 m!1354383))

(declare-fun m!1354385 () Bool)

(assert (=> b!1467328 m!1354385))

(declare-fun m!1354387 () Bool)

(assert (=> b!1467332 m!1354387))

(assert (=> b!1467332 m!1354387))

(declare-fun m!1354389 () Bool)

(assert (=> b!1467332 m!1354389))

(assert (=> b!1467336 m!1354375))

(assert (=> b!1467336 m!1354375))

(declare-fun m!1354391 () Bool)

(assert (=> b!1467336 m!1354391))

(assert (=> b!1467336 m!1354391))

(assert (=> b!1467336 m!1354375))

(declare-fun m!1354393 () Bool)

(assert (=> b!1467336 m!1354393))

(declare-fun m!1354395 () Bool)

(assert (=> b!1467345 m!1354395))

(declare-fun m!1354397 () Bool)

(assert (=> start!125646 m!1354397))

(declare-fun m!1354399 () Bool)

(assert (=> start!125646 m!1354399))

(assert (=> b!1467338 m!1354375))

(assert (=> b!1467338 m!1354375))

(declare-fun m!1354401 () Bool)

(assert (=> b!1467338 m!1354401))

(declare-fun m!1354403 () Bool)

(assert (=> b!1467331 m!1354403))

(declare-fun m!1354405 () Bool)

(assert (=> b!1467331 m!1354405))

(declare-fun m!1354407 () Bool)

(assert (=> b!1467341 m!1354407))

(assert (=> b!1467341 m!1354407))

(declare-fun m!1354409 () Bool)

(assert (=> b!1467341 m!1354409))

(assert (=> b!1467341 m!1354403))

(declare-fun m!1354411 () Bool)

(assert (=> b!1467341 m!1354411))

(declare-fun m!1354413 () Bool)

(assert (=> b!1467326 m!1354413))

(assert (=> b!1467326 m!1354403))

(declare-fun m!1354415 () Bool)

(assert (=> b!1467326 m!1354415))

(declare-fun m!1354417 () Bool)

(assert (=> b!1467326 m!1354417))

(declare-fun m!1354419 () Bool)

(assert (=> b!1467326 m!1354419))

(assert (=> b!1467326 m!1354375))

(declare-fun m!1354421 () Bool)

(assert (=> b!1467327 m!1354421))

(assert (=> b!1467327 m!1354381))

(assert (=> b!1467339 m!1354375))

(assert (=> b!1467339 m!1354375))

(declare-fun m!1354423 () Bool)

(assert (=> b!1467339 m!1354423))

(declare-fun m!1354425 () Bool)

(assert (=> b!1467325 m!1354425))

(declare-fun m!1354427 () Bool)

(assert (=> b!1467329 m!1354427))

(assert (=> b!1467337 m!1354375))

(assert (=> b!1467337 m!1354375))

(declare-fun m!1354429 () Bool)

(assert (=> b!1467337 m!1354429))

(declare-fun m!1354431 () Bool)

(assert (=> b!1467335 m!1354431))

(assert (=> b!1467335 m!1354375))

(check-sat (not start!125646) (not b!1467328) (not b!1467326) (not b!1467336) (not b!1467342) (not b!1467329) (not b!1467343) (not b!1467338) (not b!1467333) (not b!1467332) (not b!1467345) (not b!1467327) (not b!1467337) (not b!1467339) (not b!1467325) (not b!1467341))
(check-sat)
