; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125088 () Bool)

(assert start!125088)

(declare-fun res!981931 () Bool)

(declare-fun e!817388 () Bool)

(assert (=> start!125088 (=> (not res!981931) (not e!817388))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125088 (= res!981931 (validMask!0 mask!2687))))

(assert (=> start!125088 e!817388))

(assert (=> start!125088 true))

(declare-datatypes ((array!98431 0))(
  ( (array!98432 (arr!47500 (Array (_ BitVec 32) (_ BitVec 64))) (size!48051 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98431)

(declare-fun array_inv!36781 (array!98431) Bool)

(assert (=> start!125088 (array_inv!36781 a!2862)))

(declare-fun lt!636619 () array!98431)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636616 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11649 0))(
  ( (MissingZero!11649 (index!48988 (_ BitVec 32))) (Found!11649 (index!48989 (_ BitVec 32))) (Intermediate!11649 (undefined!12461 Bool) (index!48990 (_ BitVec 32)) (x!130826 (_ BitVec 32))) (Undefined!11649) (MissingVacant!11649 (index!48991 (_ BitVec 32))) )
))
(declare-fun lt!636615 () SeekEntryResult!11649)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1451370 () Bool)

(declare-fun e!817392 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98431 (_ BitVec 32)) SeekEntryResult!11649)

(assert (=> b!1451370 (= e!817392 (= lt!636615 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636616 lt!636619 mask!2687)))))

(declare-fun b!1451371 () Bool)

(declare-fun e!817390 () Bool)

(declare-fun e!817386 () Bool)

(assert (=> b!1451371 (= e!817390 e!817386)))

(declare-fun res!981941 () Bool)

(assert (=> b!1451371 (=> (not res!981941) (not e!817386))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451371 (= res!981941 (= lt!636615 (Intermediate!11649 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451371 (= lt!636615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636616 mask!2687) lt!636616 lt!636619 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451371 (= lt!636616 (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451372 () Bool)

(declare-fun e!817391 () Bool)

(declare-fun e!817385 () Bool)

(assert (=> b!1451372 (= e!817391 e!817385)))

(declare-fun res!981940 () Bool)

(assert (=> b!1451372 (=> res!981940 e!817385)))

(assert (=> b!1451372 (= res!981940 (or (and (= (select (arr!47500 a!2862) index!646) (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (not (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1451373 () Bool)

(declare-fun res!981939 () Bool)

(assert (=> b!1451373 (=> (not res!981939) (not e!817390))))

(declare-fun lt!636614 () SeekEntryResult!11649)

(assert (=> b!1451373 (= res!981939 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!636614))))

(declare-fun b!1451374 () Bool)

(declare-fun e!817387 () Bool)

(assert (=> b!1451374 (= e!817385 e!817387)))

(declare-fun res!981927 () Bool)

(assert (=> b!1451374 (=> (not res!981927) (not e!817387))))

(declare-fun lt!636612 () SeekEntryResult!11649)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98431 (_ BitVec 32)) SeekEntryResult!11649)

(assert (=> b!1451374 (= res!981927 (= lt!636612 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47500 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1451375 () Bool)

(declare-fun res!981930 () Bool)

(assert (=> b!1451375 (=> (not res!981930) (not e!817386))))

(assert (=> b!1451375 (= res!981930 e!817392)))

(declare-fun c!134242 () Bool)

(assert (=> b!1451375 (= c!134242 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451376 () Bool)

(declare-fun res!981928 () Bool)

(assert (=> b!1451376 (=> (not res!981928) (not e!817388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451376 (= res!981928 (validKeyInArray!0 (select (arr!47500 a!2862) i!1006)))))

(declare-fun b!1451377 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98431 (_ BitVec 32)) SeekEntryResult!11649)

(assert (=> b!1451377 (= e!817392 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636616 lt!636619 mask!2687) (seekEntryOrOpen!0 lt!636616 lt!636619 mask!2687)))))

(declare-fun b!1451378 () Bool)

(declare-fun res!981936 () Bool)

(declare-fun e!817389 () Bool)

(assert (=> b!1451378 (=> res!981936 e!817389)))

(declare-fun lt!636617 () SeekEntryResult!11649)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451378 (= res!981936 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!636617)))))

(declare-fun b!1451379 () Bool)

(declare-fun res!981935 () Bool)

(assert (=> b!1451379 (=> (not res!981935) (not e!817388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98431 (_ BitVec 32)) Bool)

(assert (=> b!1451379 (= res!981935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451380 () Bool)

(declare-fun res!981938 () Bool)

(assert (=> b!1451380 (=> (not res!981938) (not e!817386))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451380 (= res!981938 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451381 () Bool)

(declare-fun res!981937 () Bool)

(assert (=> b!1451381 (=> (not res!981937) (not e!817388))))

(declare-datatypes ((List!33988 0))(
  ( (Nil!33985) (Cons!33984 (h!35345 (_ BitVec 64)) (t!48674 List!33988)) )
))
(declare-fun arrayNoDuplicates!0 (array!98431 (_ BitVec 32) List!33988) Bool)

(assert (=> b!1451381 (= res!981937 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33985))))

(declare-fun b!1451382 () Bool)

(assert (=> b!1451382 (= e!817389 true)))

(assert (=> b!1451382 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636616 lt!636619 mask!2687) lt!636617)))

(declare-datatypes ((Unit!48827 0))(
  ( (Unit!48828) )
))
(declare-fun lt!636613 () Unit!48827)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48827)

(assert (=> b!1451382 (= lt!636613 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1451383 () Bool)

(declare-fun e!817383 () Bool)

(assert (=> b!1451383 (= e!817388 e!817383)))

(declare-fun res!981932 () Bool)

(assert (=> b!1451383 (=> (not res!981932) (not e!817383))))

(assert (=> b!1451383 (= res!981932 (= (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451383 (= lt!636619 (array!98432 (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48051 a!2862)))))

(declare-fun b!1451384 () Bool)

(declare-fun res!981929 () Bool)

(assert (=> b!1451384 (=> (not res!981929) (not e!817388))))

(assert (=> b!1451384 (= res!981929 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48051 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48051 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48051 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451385 () Bool)

(assert (=> b!1451385 (= e!817386 (not e!817389))))

(declare-fun res!981924 () Bool)

(assert (=> b!1451385 (=> res!981924 e!817389)))

(assert (=> b!1451385 (= res!981924 (or (and (= (select (arr!47500 a!2862) index!646) (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (not (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1451385 e!817391))

(declare-fun res!981926 () Bool)

(assert (=> b!1451385 (=> (not res!981926) (not e!817391))))

(assert (=> b!1451385 (= res!981926 (and (= lt!636612 lt!636617) (or (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) (select (arr!47500 a!2862) j!93)))))))

(assert (=> b!1451385 (= lt!636617 (Found!11649 j!93))))

(assert (=> b!1451385 (= lt!636612 (seekEntryOrOpen!0 (select (arr!47500 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1451385 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636618 () Unit!48827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48827)

(assert (=> b!1451385 (= lt!636618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451386 () Bool)

(assert (=> b!1451386 (= e!817387 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1451387 () Bool)

(declare-fun res!981934 () Bool)

(assert (=> b!1451387 (=> (not res!981934) (not e!817388))))

(assert (=> b!1451387 (= res!981934 (validKeyInArray!0 (select (arr!47500 a!2862) j!93)))))

(declare-fun b!1451388 () Bool)

(assert (=> b!1451388 (= e!817383 e!817390)))

(declare-fun res!981933 () Bool)

(assert (=> b!1451388 (=> (not res!981933) (not e!817390))))

(assert (=> b!1451388 (= res!981933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47500 a!2862) j!93) mask!2687) (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!636614))))

(assert (=> b!1451388 (= lt!636614 (Intermediate!11649 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451389 () Bool)

(declare-fun res!981925 () Bool)

(assert (=> b!1451389 (=> (not res!981925) (not e!817388))))

(assert (=> b!1451389 (= res!981925 (and (= (size!48051 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48051 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48051 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125088 res!981931) b!1451389))

(assert (= (and b!1451389 res!981925) b!1451376))

(assert (= (and b!1451376 res!981928) b!1451387))

(assert (= (and b!1451387 res!981934) b!1451379))

(assert (= (and b!1451379 res!981935) b!1451381))

(assert (= (and b!1451381 res!981937) b!1451384))

(assert (= (and b!1451384 res!981929) b!1451383))

(assert (= (and b!1451383 res!981932) b!1451388))

(assert (= (and b!1451388 res!981933) b!1451373))

(assert (= (and b!1451373 res!981939) b!1451371))

(assert (= (and b!1451371 res!981941) b!1451375))

(assert (= (and b!1451375 c!134242) b!1451370))

(assert (= (and b!1451375 (not c!134242)) b!1451377))

(assert (= (and b!1451375 res!981930) b!1451380))

(assert (= (and b!1451380 res!981938) b!1451385))

(assert (= (and b!1451385 res!981926) b!1451372))

(assert (= (and b!1451372 (not res!981940)) b!1451374))

(assert (= (and b!1451374 res!981927) b!1451386))

(assert (= (and b!1451385 (not res!981924)) b!1451378))

(assert (= (and b!1451378 (not res!981936)) b!1451382))

(declare-fun m!1340155 () Bool)

(assert (=> b!1451385 m!1340155))

(declare-fun m!1340157 () Bool)

(assert (=> b!1451385 m!1340157))

(declare-fun m!1340159 () Bool)

(assert (=> b!1451385 m!1340159))

(declare-fun m!1340161 () Bool)

(assert (=> b!1451385 m!1340161))

(declare-fun m!1340163 () Bool)

(assert (=> b!1451385 m!1340163))

(declare-fun m!1340165 () Bool)

(assert (=> b!1451385 m!1340165))

(declare-fun m!1340167 () Bool)

(assert (=> b!1451385 m!1340167))

(declare-fun m!1340169 () Bool)

(assert (=> b!1451385 m!1340169))

(assert (=> b!1451385 m!1340165))

(declare-fun m!1340171 () Bool)

(assert (=> b!1451382 m!1340171))

(declare-fun m!1340173 () Bool)

(assert (=> b!1451382 m!1340173))

(assert (=> b!1451374 m!1340165))

(assert (=> b!1451374 m!1340165))

(declare-fun m!1340175 () Bool)

(assert (=> b!1451374 m!1340175))

(declare-fun m!1340177 () Bool)

(assert (=> start!125088 m!1340177))

(declare-fun m!1340179 () Bool)

(assert (=> start!125088 m!1340179))

(assert (=> b!1451373 m!1340165))

(assert (=> b!1451373 m!1340165))

(declare-fun m!1340181 () Bool)

(assert (=> b!1451373 m!1340181))

(assert (=> b!1451383 m!1340157))

(declare-fun m!1340183 () Bool)

(assert (=> b!1451383 m!1340183))

(declare-fun m!1340185 () Bool)

(assert (=> b!1451379 m!1340185))

(assert (=> b!1451388 m!1340165))

(assert (=> b!1451388 m!1340165))

(declare-fun m!1340187 () Bool)

(assert (=> b!1451388 m!1340187))

(assert (=> b!1451388 m!1340187))

(assert (=> b!1451388 m!1340165))

(declare-fun m!1340189 () Bool)

(assert (=> b!1451388 m!1340189))

(declare-fun m!1340191 () Bool)

(assert (=> b!1451381 m!1340191))

(assert (=> b!1451378 m!1340165))

(assert (=> b!1451378 m!1340165))

(declare-fun m!1340193 () Bool)

(assert (=> b!1451378 m!1340193))

(declare-fun m!1340195 () Bool)

(assert (=> b!1451371 m!1340195))

(assert (=> b!1451371 m!1340195))

(declare-fun m!1340197 () Bool)

(assert (=> b!1451371 m!1340197))

(assert (=> b!1451371 m!1340157))

(declare-fun m!1340199 () Bool)

(assert (=> b!1451371 m!1340199))

(assert (=> b!1451387 m!1340165))

(assert (=> b!1451387 m!1340165))

(declare-fun m!1340201 () Bool)

(assert (=> b!1451387 m!1340201))

(declare-fun m!1340203 () Bool)

(assert (=> b!1451370 m!1340203))

(assert (=> b!1451377 m!1340171))

(declare-fun m!1340205 () Bool)

(assert (=> b!1451377 m!1340205))

(declare-fun m!1340207 () Bool)

(assert (=> b!1451376 m!1340207))

(assert (=> b!1451376 m!1340207))

(declare-fun m!1340209 () Bool)

(assert (=> b!1451376 m!1340209))

(assert (=> b!1451372 m!1340163))

(assert (=> b!1451372 m!1340157))

(assert (=> b!1451372 m!1340161))

(assert (=> b!1451372 m!1340165))

(check-sat (not b!1451387) (not b!1451388) (not b!1451371) (not b!1451374) (not b!1451373) (not b!1451379) (not b!1451385) (not b!1451381) (not b!1451377) (not b!1451378) (not b!1451370) (not start!125088) (not b!1451382) (not b!1451376))
(check-sat)
