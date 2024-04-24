; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124860 () Bool)

(assert start!124860)

(declare-fun b!1445120 () Bool)

(declare-fun res!976373 () Bool)

(declare-fun e!814391 () Bool)

(assert (=> b!1445120 (=> (not res!976373) (not e!814391))))

(declare-datatypes ((array!98203 0))(
  ( (array!98204 (arr!47386 (Array (_ BitVec 32) (_ BitVec 64))) (size!47937 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98203)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445120 (= res!976373 (validKeyInArray!0 (select (arr!47386 a!2862) j!93)))))

(declare-fun b!1445121 () Bool)

(declare-fun res!976365 () Bool)

(declare-fun e!814395 () Bool)

(assert (=> b!1445121 (=> (not res!976365) (not e!814395))))

(declare-fun e!814397 () Bool)

(assert (=> b!1445121 (= res!976365 e!814397)))

(declare-fun c!133900 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445121 (= c!133900 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445122 () Bool)

(declare-fun e!814396 () Bool)

(assert (=> b!1445122 (= e!814395 (not e!814396))))

(declare-fun res!976359 () Bool)

(assert (=> b!1445122 (=> res!976359 e!814396)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445122 (= res!976359 (or (not (= (select (arr!47386 a!2862) index!646) (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47386 a!2862) index!646) (select (arr!47386 a!2862) j!93)))))))

(declare-fun e!814398 () Bool)

(assert (=> b!1445122 e!814398))

(declare-fun res!976364 () Bool)

(assert (=> b!1445122 (=> (not res!976364) (not e!814398))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98203 (_ BitVec 32)) Bool)

(assert (=> b!1445122 (= res!976364 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48599 0))(
  ( (Unit!48600) )
))
(declare-fun lt!634459 () Unit!48599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48599)

(assert (=> b!1445122 (= lt!634459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445123 () Bool)

(declare-fun res!976358 () Bool)

(declare-fun e!814392 () Bool)

(assert (=> b!1445123 (=> (not res!976358) (not e!814392))))

(declare-datatypes ((SeekEntryResult!11535 0))(
  ( (MissingZero!11535 (index!48532 (_ BitVec 32))) (Found!11535 (index!48533 (_ BitVec 32))) (Intermediate!11535 (undefined!12347 Bool) (index!48534 (_ BitVec 32)) (x!130408 (_ BitVec 32))) (Undefined!11535) (MissingVacant!11535 (index!48535 (_ BitVec 32))) )
))
(declare-fun lt!634462 () SeekEntryResult!11535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98203 (_ BitVec 32)) SeekEntryResult!11535)

(assert (=> b!1445123 (= res!976358 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!634462))))

(declare-fun b!1445124 () Bool)

(declare-fun e!814394 () Bool)

(assert (=> b!1445124 (= e!814391 e!814394)))

(declare-fun res!976362 () Bool)

(assert (=> b!1445124 (=> (not res!976362) (not e!814394))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445124 (= res!976362 (= (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634458 () array!98203)

(assert (=> b!1445124 (= lt!634458 (array!98204 (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47937 a!2862)))))

(declare-fun b!1445125 () Bool)

(declare-fun res!976368 () Bool)

(assert (=> b!1445125 (=> (not res!976368) (not e!814391))))

(assert (=> b!1445125 (= res!976368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445126 () Bool)

(assert (=> b!1445126 (= e!814392 e!814395)))

(declare-fun res!976372 () Bool)

(assert (=> b!1445126 (=> (not res!976372) (not e!814395))))

(declare-fun lt!634460 () SeekEntryResult!11535)

(assert (=> b!1445126 (= res!976372 (= lt!634460 (Intermediate!11535 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634457 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445126 (= lt!634460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634457 mask!2687) lt!634457 lt!634458 mask!2687))))

(assert (=> b!1445126 (= lt!634457 (select (store (arr!47386 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445127 () Bool)

(assert (=> b!1445127 (= e!814396 true)))

(declare-fun lt!634461 () SeekEntryResult!11535)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98203 (_ BitVec 32)) SeekEntryResult!11535)

(assert (=> b!1445127 (= lt!634461 (seekEntryOrOpen!0 lt!634457 lt!634458 mask!2687))))

(declare-fun b!1445128 () Bool)

(declare-fun res!976367 () Bool)

(assert (=> b!1445128 (=> (not res!976367) (not e!814398))))

(assert (=> b!1445128 (= res!976367 (= (seekEntryOrOpen!0 (select (arr!47386 a!2862) j!93) a!2862 mask!2687) (Found!11535 j!93)))))

(declare-fun b!1445129 () Bool)

(declare-fun res!976369 () Bool)

(assert (=> b!1445129 (=> (not res!976369) (not e!814395))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445129 (= res!976369 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445130 () Bool)

(declare-fun res!976361 () Bool)

(assert (=> b!1445130 (=> (not res!976361) (not e!814391))))

(declare-datatypes ((List!33874 0))(
  ( (Nil!33871) (Cons!33870 (h!35231 (_ BitVec 64)) (t!48560 List!33874)) )
))
(declare-fun arrayNoDuplicates!0 (array!98203 (_ BitVec 32) List!33874) Bool)

(assert (=> b!1445130 (= res!976361 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33871))))

(declare-fun b!1445131 () Bool)

(assert (=> b!1445131 (= e!814394 e!814392)))

(declare-fun res!976371 () Bool)

(assert (=> b!1445131 (=> (not res!976371) (not e!814392))))

(assert (=> b!1445131 (= res!976371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47386 a!2862) j!93) mask!2687) (select (arr!47386 a!2862) j!93) a!2862 mask!2687) lt!634462))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445131 (= lt!634462 (Intermediate!11535 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445133 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98203 (_ BitVec 32)) SeekEntryResult!11535)

(assert (=> b!1445133 (= e!814397 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634457 lt!634458 mask!2687) (seekEntryOrOpen!0 lt!634457 lt!634458 mask!2687)))))

(declare-fun b!1445134 () Bool)

(declare-fun res!976370 () Bool)

(assert (=> b!1445134 (=> (not res!976370) (not e!814391))))

(assert (=> b!1445134 (= res!976370 (and (= (size!47937 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47937 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47937 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445135 () Bool)

(assert (=> b!1445135 (= e!814397 (= lt!634460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634457 lt!634458 mask!2687)))))

(declare-fun b!1445136 () Bool)

(declare-fun res!976360 () Bool)

(assert (=> b!1445136 (=> (not res!976360) (not e!814391))))

(assert (=> b!1445136 (= res!976360 (validKeyInArray!0 (select (arr!47386 a!2862) i!1006)))))

(declare-fun b!1445137 () Bool)

(assert (=> b!1445137 (= e!814398 (or (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47386 a!2862) intermediateBeforeIndex!19) (select (arr!47386 a!2862) j!93))))))

(declare-fun b!1445132 () Bool)

(declare-fun res!976366 () Bool)

(assert (=> b!1445132 (=> (not res!976366) (not e!814391))))

(assert (=> b!1445132 (= res!976366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47937 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47937 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47937 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!976363 () Bool)

(assert (=> start!124860 (=> (not res!976363) (not e!814391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124860 (= res!976363 (validMask!0 mask!2687))))

(assert (=> start!124860 e!814391))

(assert (=> start!124860 true))

(declare-fun array_inv!36667 (array!98203) Bool)

(assert (=> start!124860 (array_inv!36667 a!2862)))

(assert (= (and start!124860 res!976363) b!1445134))

(assert (= (and b!1445134 res!976370) b!1445136))

(assert (= (and b!1445136 res!976360) b!1445120))

(assert (= (and b!1445120 res!976373) b!1445125))

(assert (= (and b!1445125 res!976368) b!1445130))

(assert (= (and b!1445130 res!976361) b!1445132))

(assert (= (and b!1445132 res!976366) b!1445124))

(assert (= (and b!1445124 res!976362) b!1445131))

(assert (= (and b!1445131 res!976371) b!1445123))

(assert (= (and b!1445123 res!976358) b!1445126))

(assert (= (and b!1445126 res!976372) b!1445121))

(assert (= (and b!1445121 c!133900) b!1445135))

(assert (= (and b!1445121 (not c!133900)) b!1445133))

(assert (= (and b!1445121 res!976365) b!1445129))

(assert (= (and b!1445129 res!976369) b!1445122))

(assert (= (and b!1445122 res!976364) b!1445128))

(assert (= (and b!1445128 res!976367) b!1445137))

(assert (= (and b!1445122 (not res!976359)) b!1445127))

(declare-fun m!1334293 () Bool)

(assert (=> b!1445124 m!1334293))

(declare-fun m!1334295 () Bool)

(assert (=> b!1445124 m!1334295))

(declare-fun m!1334297 () Bool)

(assert (=> b!1445120 m!1334297))

(assert (=> b!1445120 m!1334297))

(declare-fun m!1334299 () Bool)

(assert (=> b!1445120 m!1334299))

(declare-fun m!1334301 () Bool)

(assert (=> b!1445130 m!1334301))

(declare-fun m!1334303 () Bool)

(assert (=> b!1445125 m!1334303))

(declare-fun m!1334305 () Bool)

(assert (=> b!1445137 m!1334305))

(assert (=> b!1445137 m!1334297))

(declare-fun m!1334307 () Bool)

(assert (=> b!1445133 m!1334307))

(declare-fun m!1334309 () Bool)

(assert (=> b!1445133 m!1334309))

(declare-fun m!1334311 () Bool)

(assert (=> b!1445136 m!1334311))

(assert (=> b!1445136 m!1334311))

(declare-fun m!1334313 () Bool)

(assert (=> b!1445136 m!1334313))

(assert (=> b!1445127 m!1334309))

(declare-fun m!1334315 () Bool)

(assert (=> b!1445135 m!1334315))

(declare-fun m!1334317 () Bool)

(assert (=> b!1445126 m!1334317))

(assert (=> b!1445126 m!1334317))

(declare-fun m!1334319 () Bool)

(assert (=> b!1445126 m!1334319))

(assert (=> b!1445126 m!1334293))

(declare-fun m!1334321 () Bool)

(assert (=> b!1445126 m!1334321))

(declare-fun m!1334323 () Bool)

(assert (=> b!1445122 m!1334323))

(assert (=> b!1445122 m!1334293))

(declare-fun m!1334325 () Bool)

(assert (=> b!1445122 m!1334325))

(declare-fun m!1334327 () Bool)

(assert (=> b!1445122 m!1334327))

(declare-fun m!1334329 () Bool)

(assert (=> b!1445122 m!1334329))

(assert (=> b!1445122 m!1334297))

(assert (=> b!1445128 m!1334297))

(assert (=> b!1445128 m!1334297))

(declare-fun m!1334331 () Bool)

(assert (=> b!1445128 m!1334331))

(assert (=> b!1445123 m!1334297))

(assert (=> b!1445123 m!1334297))

(declare-fun m!1334333 () Bool)

(assert (=> b!1445123 m!1334333))

(assert (=> b!1445131 m!1334297))

(assert (=> b!1445131 m!1334297))

(declare-fun m!1334335 () Bool)

(assert (=> b!1445131 m!1334335))

(assert (=> b!1445131 m!1334335))

(assert (=> b!1445131 m!1334297))

(declare-fun m!1334337 () Bool)

(assert (=> b!1445131 m!1334337))

(declare-fun m!1334339 () Bool)

(assert (=> start!124860 m!1334339))

(declare-fun m!1334341 () Bool)

(assert (=> start!124860 m!1334341))

(check-sat (not b!1445123) (not b!1445131) (not b!1445128) (not b!1445133) (not b!1445136) (not start!124860) (not b!1445135) (not b!1445130) (not b!1445126) (not b!1445122) (not b!1445120) (not b!1445127) (not b!1445125))
(check-sat)
