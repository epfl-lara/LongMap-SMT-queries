; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124812 () Bool)

(assert start!124812)

(declare-fun b!1448370 () Bool)

(declare-fun e!815682 () Bool)

(declare-fun e!815681 () Bool)

(assert (=> b!1448370 (= e!815682 e!815681)))

(declare-fun res!979936 () Bool)

(assert (=> b!1448370 (=> (not res!979936) (not e!815681))))

(declare-datatypes ((SeekEntryResult!11670 0))(
  ( (MissingZero!11670 (index!49072 (_ BitVec 32))) (Found!11670 (index!49073 (_ BitVec 32))) (Intermediate!11670 (undefined!12482 Bool) (index!49074 (_ BitVec 32)) (x!130743 (_ BitVec 32))) (Undefined!11670) (MissingVacant!11670 (index!49075 (_ BitVec 32))) )
))
(declare-fun lt!635507 () SeekEntryResult!11670)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448370 (= res!979936 (= lt!635507 (Intermediate!11670 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635505 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98260 0))(
  ( (array!98261 (arr!47418 (Array (_ BitVec 32) (_ BitVec 64))) (size!47968 (_ BitVec 32))) )
))
(declare-fun lt!635509 () array!98260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448370 (= lt!635507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635505 mask!2687) lt!635505 lt!635509 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98260)

(assert (=> b!1448370 (= lt!635505 (select (store (arr!47418 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448371 () Bool)

(declare-fun res!979932 () Bool)

(declare-fun e!815680 () Bool)

(assert (=> b!1448371 (=> (not res!979932) (not e!815680))))

(assert (=> b!1448371 (= res!979932 (and (= (size!47968 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47968 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47968 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448372 () Bool)

(declare-fun e!815678 () Bool)

(assert (=> b!1448372 (= e!815678 e!815682)))

(declare-fun res!979939 () Bool)

(assert (=> b!1448372 (=> (not res!979939) (not e!815682))))

(declare-fun lt!635510 () SeekEntryResult!11670)

(assert (=> b!1448372 (= res!979939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47418 a!2862) j!93) mask!2687) (select (arr!47418 a!2862) j!93) a!2862 mask!2687) lt!635510))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448372 (= lt!635510 (Intermediate!11670 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448373 () Bool)

(declare-fun e!815677 () Bool)

(declare-fun e!815684 () Bool)

(assert (=> b!1448373 (= e!815677 e!815684)))

(declare-fun res!979931 () Bool)

(assert (=> b!1448373 (=> res!979931 e!815684)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1448373 (= res!979931 (or (and (= (select (arr!47418 a!2862) index!646) (select (store (arr!47418 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47418 a!2862) index!646) (select (arr!47418 a!2862) j!93))) (not (= (select (arr!47418 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448374 () Bool)

(declare-fun res!979925 () Bool)

(assert (=> b!1448374 (=> (not res!979925) (not e!815681))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1448374 (= res!979925 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448375 () Bool)

(declare-fun res!979937 () Bool)

(assert (=> b!1448375 (=> (not res!979937) (not e!815680))))

(assert (=> b!1448375 (= res!979937 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47968 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47968 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47968 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448376 () Bool)

(declare-fun res!979930 () Bool)

(assert (=> b!1448376 (=> (not res!979930) (not e!815682))))

(assert (=> b!1448376 (= res!979930 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47418 a!2862) j!93) a!2862 mask!2687) lt!635510))))

(declare-fun e!815676 () Bool)

(declare-fun b!1448377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11670)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11670)

(assert (=> b!1448377 (= e!815676 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635505 lt!635509 mask!2687) (seekEntryOrOpen!0 lt!635505 lt!635509 mask!2687)))))

(declare-fun b!1448378 () Bool)

(declare-fun e!815675 () Bool)

(assert (=> b!1448378 (= e!815681 (not e!815675))))

(declare-fun res!979928 () Bool)

(assert (=> b!1448378 (=> res!979928 e!815675)))

(assert (=> b!1448378 (= res!979928 (or (and (= (select (arr!47418 a!2862) index!646) (select (store (arr!47418 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47418 a!2862) index!646) (select (arr!47418 a!2862) j!93))) (not (= (select (arr!47418 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47418 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448378 e!815677))

(declare-fun res!979926 () Bool)

(assert (=> b!1448378 (=> (not res!979926) (not e!815677))))

(declare-fun lt!635506 () SeekEntryResult!11670)

(assert (=> b!1448378 (= res!979926 (and (= lt!635506 (Found!11670 j!93)) (or (= (select (arr!47418 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47418 a!2862) intermediateBeforeIndex!19) (select (arr!47418 a!2862) j!93)))))))

(assert (=> b!1448378 (= lt!635506 (seekEntryOrOpen!0 (select (arr!47418 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98260 (_ BitVec 32)) Bool)

(assert (=> b!1448378 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48836 0))(
  ( (Unit!48837) )
))
(declare-fun lt!635508 () Unit!48836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48836)

(assert (=> b!1448378 (= lt!635508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448379 () Bool)

(declare-fun e!815683 () Bool)

(assert (=> b!1448379 (= e!815684 e!815683)))

(declare-fun res!979934 () Bool)

(assert (=> b!1448379 (=> (not res!979934) (not e!815683))))

(assert (=> b!1448379 (= res!979934 (= lt!635506 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47418 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448380 () Bool)

(assert (=> b!1448380 (= e!815683 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448381 () Bool)

(declare-fun res!979923 () Bool)

(assert (=> b!1448381 (=> (not res!979923) (not e!815681))))

(assert (=> b!1448381 (= res!979923 e!815676)))

(declare-fun c!133734 () Bool)

(assert (=> b!1448381 (= c!133734 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!979929 () Bool)

(assert (=> start!124812 (=> (not res!979929) (not e!815680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124812 (= res!979929 (validMask!0 mask!2687))))

(assert (=> start!124812 e!815680))

(assert (=> start!124812 true))

(declare-fun array_inv!36446 (array!98260) Bool)

(assert (=> start!124812 (array_inv!36446 a!2862)))

(declare-fun b!1448382 () Bool)

(declare-fun res!979935 () Bool)

(assert (=> b!1448382 (=> (not res!979935) (not e!815680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448382 (= res!979935 (validKeyInArray!0 (select (arr!47418 a!2862) j!93)))))

(declare-fun b!1448383 () Bool)

(declare-fun res!979938 () Bool)

(assert (=> b!1448383 (=> (not res!979938) (not e!815680))))

(declare-datatypes ((List!33919 0))(
  ( (Nil!33916) (Cons!33915 (h!35265 (_ BitVec 64)) (t!48613 List!33919)) )
))
(declare-fun arrayNoDuplicates!0 (array!98260 (_ BitVec 32) List!33919) Bool)

(assert (=> b!1448383 (= res!979938 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33916))))

(declare-fun b!1448384 () Bool)

(assert (=> b!1448384 (= e!815680 e!815678)))

(declare-fun res!979924 () Bool)

(assert (=> b!1448384 (=> (not res!979924) (not e!815678))))

(assert (=> b!1448384 (= res!979924 (= (select (store (arr!47418 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448384 (= lt!635509 (array!98261 (store (arr!47418 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47968 a!2862)))))

(declare-fun b!1448385 () Bool)

(assert (=> b!1448385 (= e!815676 (= lt!635507 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635505 lt!635509 mask!2687)))))

(declare-fun b!1448386 () Bool)

(declare-fun res!979927 () Bool)

(assert (=> b!1448386 (=> (not res!979927) (not e!815680))))

(assert (=> b!1448386 (= res!979927 (validKeyInArray!0 (select (arr!47418 a!2862) i!1006)))))

(declare-fun b!1448387 () Bool)

(assert (=> b!1448387 (= e!815675 true)))

(declare-fun lt!635511 () SeekEntryResult!11670)

(assert (=> b!1448387 (= lt!635511 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47418 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448388 () Bool)

(declare-fun res!979933 () Bool)

(assert (=> b!1448388 (=> (not res!979933) (not e!815680))))

(assert (=> b!1448388 (= res!979933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124812 res!979929) b!1448371))

(assert (= (and b!1448371 res!979932) b!1448386))

(assert (= (and b!1448386 res!979927) b!1448382))

(assert (= (and b!1448382 res!979935) b!1448388))

(assert (= (and b!1448388 res!979933) b!1448383))

(assert (= (and b!1448383 res!979938) b!1448375))

(assert (= (and b!1448375 res!979937) b!1448384))

(assert (= (and b!1448384 res!979924) b!1448372))

(assert (= (and b!1448372 res!979939) b!1448376))

(assert (= (and b!1448376 res!979930) b!1448370))

(assert (= (and b!1448370 res!979936) b!1448381))

(assert (= (and b!1448381 c!133734) b!1448385))

(assert (= (and b!1448381 (not c!133734)) b!1448377))

(assert (= (and b!1448381 res!979923) b!1448374))

(assert (= (and b!1448374 res!979925) b!1448378))

(assert (= (and b!1448378 res!979926) b!1448373))

(assert (= (and b!1448373 (not res!979931)) b!1448379))

(assert (= (and b!1448379 res!979934) b!1448380))

(assert (= (and b!1448378 (not res!979928)) b!1448387))

(declare-fun m!1337137 () Bool)

(assert (=> b!1448378 m!1337137))

(declare-fun m!1337139 () Bool)

(assert (=> b!1448378 m!1337139))

(declare-fun m!1337141 () Bool)

(assert (=> b!1448378 m!1337141))

(declare-fun m!1337143 () Bool)

(assert (=> b!1448378 m!1337143))

(declare-fun m!1337145 () Bool)

(assert (=> b!1448378 m!1337145))

(declare-fun m!1337147 () Bool)

(assert (=> b!1448378 m!1337147))

(declare-fun m!1337149 () Bool)

(assert (=> b!1448378 m!1337149))

(declare-fun m!1337151 () Bool)

(assert (=> b!1448378 m!1337151))

(assert (=> b!1448378 m!1337147))

(declare-fun m!1337153 () Bool)

(assert (=> b!1448370 m!1337153))

(assert (=> b!1448370 m!1337153))

(declare-fun m!1337155 () Bool)

(assert (=> b!1448370 m!1337155))

(assert (=> b!1448370 m!1337139))

(declare-fun m!1337157 () Bool)

(assert (=> b!1448370 m!1337157))

(assert (=> b!1448376 m!1337147))

(assert (=> b!1448376 m!1337147))

(declare-fun m!1337159 () Bool)

(assert (=> b!1448376 m!1337159))

(assert (=> b!1448379 m!1337147))

(assert (=> b!1448379 m!1337147))

(declare-fun m!1337161 () Bool)

(assert (=> b!1448379 m!1337161))

(assert (=> b!1448372 m!1337147))

(assert (=> b!1448372 m!1337147))

(declare-fun m!1337163 () Bool)

(assert (=> b!1448372 m!1337163))

(assert (=> b!1448372 m!1337163))

(assert (=> b!1448372 m!1337147))

(declare-fun m!1337165 () Bool)

(assert (=> b!1448372 m!1337165))

(assert (=> b!1448384 m!1337139))

(declare-fun m!1337167 () Bool)

(assert (=> b!1448384 m!1337167))

(assert (=> b!1448382 m!1337147))

(assert (=> b!1448382 m!1337147))

(declare-fun m!1337169 () Bool)

(assert (=> b!1448382 m!1337169))

(declare-fun m!1337171 () Bool)

(assert (=> b!1448377 m!1337171))

(declare-fun m!1337173 () Bool)

(assert (=> b!1448377 m!1337173))

(assert (=> b!1448373 m!1337145))

(assert (=> b!1448373 m!1337139))

(assert (=> b!1448373 m!1337143))

(assert (=> b!1448373 m!1337147))

(declare-fun m!1337175 () Bool)

(assert (=> start!124812 m!1337175))

(declare-fun m!1337177 () Bool)

(assert (=> start!124812 m!1337177))

(declare-fun m!1337179 () Bool)

(assert (=> b!1448385 m!1337179))

(declare-fun m!1337181 () Bool)

(assert (=> b!1448386 m!1337181))

(assert (=> b!1448386 m!1337181))

(declare-fun m!1337183 () Bool)

(assert (=> b!1448386 m!1337183))

(declare-fun m!1337185 () Bool)

(assert (=> b!1448383 m!1337185))

(declare-fun m!1337187 () Bool)

(assert (=> b!1448388 m!1337187))

(assert (=> b!1448387 m!1337147))

(assert (=> b!1448387 m!1337147))

(declare-fun m!1337189 () Bool)

(assert (=> b!1448387 m!1337189))

(check-sat (not b!1448386) (not b!1448376) (not b!1448382) (not b!1448388) (not start!124812) (not b!1448383) (not b!1448372) (not b!1448378) (not b!1448370) (not b!1448379) (not b!1448387) (not b!1448377) (not b!1448385))
(check-sat)
