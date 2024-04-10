; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125570 () Bool)

(assert start!125570)

(declare-fun b!1469241 () Bool)

(declare-fun res!997769 () Bool)

(declare-fun e!824867 () Bool)

(assert (=> b!1469241 (=> (not res!997769) (not e!824867))))

(declare-datatypes ((array!99018 0))(
  ( (array!99019 (arr!47797 (Array (_ BitVec 32) (_ BitVec 64))) (size!48347 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99018)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99018 (_ BitVec 32)) Bool)

(assert (=> b!1469241 (= res!997769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469242 () Bool)

(declare-fun res!997765 () Bool)

(assert (=> b!1469242 (=> (not res!997765) (not e!824867))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469242 (= res!997765 (validKeyInArray!0 (select (arr!47797 a!2862) i!1006)))))

(declare-fun b!1469243 () Bool)

(declare-fun res!997771 () Bool)

(assert (=> b!1469243 (=> (not res!997771) (not e!824867))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469243 (= res!997771 (and (= (size!48347 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48347 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48347 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469244 () Bool)

(declare-fun e!824863 () Bool)

(declare-fun e!824862 () Bool)

(assert (=> b!1469244 (= e!824863 e!824862)))

(declare-fun res!997772 () Bool)

(assert (=> b!1469244 (=> (not res!997772) (not e!824862))))

(declare-datatypes ((SeekEntryResult!12037 0))(
  ( (MissingZero!12037 (index!50540 (_ BitVec 32))) (Found!12037 (index!50541 (_ BitVec 32))) (Intermediate!12037 (undefined!12849 Bool) (index!50542 (_ BitVec 32)) (x!132118 (_ BitVec 32))) (Undefined!12037) (MissingVacant!12037 (index!50543 (_ BitVec 32))) )
))
(declare-fun lt!642488 () SeekEntryResult!12037)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99018 (_ BitVec 32)) SeekEntryResult!12037)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469244 (= res!997772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47797 a!2862) j!93) mask!2687) (select (arr!47797 a!2862) j!93) a!2862 mask!2687) lt!642488))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469244 (= lt!642488 (Intermediate!12037 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469245 () Bool)

(declare-fun res!997773 () Bool)

(assert (=> b!1469245 (=> (not res!997773) (not e!824867))))

(assert (=> b!1469245 (= res!997773 (validKeyInArray!0 (select (arr!47797 a!2862) j!93)))))

(declare-fun b!1469246 () Bool)

(declare-fun res!997770 () Bool)

(assert (=> b!1469246 (=> (not res!997770) (not e!824867))))

(declare-datatypes ((List!34298 0))(
  ( (Nil!34295) (Cons!34294 (h!35644 (_ BitVec 64)) (t!48992 List!34298)) )
))
(declare-fun arrayNoDuplicates!0 (array!99018 (_ BitVec 32) List!34298) Bool)

(assert (=> b!1469246 (= res!997770 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34295))))

(declare-fun b!1469247 () Bool)

(declare-fun e!824865 () Bool)

(assert (=> b!1469247 (= e!824865 false)))

(declare-fun lt!642489 () Bool)

(declare-fun e!824866 () Bool)

(assert (=> b!1469247 (= lt!642489 e!824866)))

(declare-fun c!135249 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469247 (= c!135249 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469248 () Bool)

(declare-fun res!997767 () Bool)

(assert (=> b!1469248 (=> (not res!997767) (not e!824862))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469248 (= res!997767 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47797 a!2862) j!93) a!2862 mask!2687) lt!642488))))

(declare-fun res!997766 () Bool)

(assert (=> start!125570 (=> (not res!997766) (not e!824867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125570 (= res!997766 (validMask!0 mask!2687))))

(assert (=> start!125570 e!824867))

(assert (=> start!125570 true))

(declare-fun array_inv!36825 (array!99018) Bool)

(assert (=> start!125570 (array_inv!36825 a!2862)))

(declare-fun lt!642486 () (_ BitVec 64))

(declare-fun lt!642485 () array!99018)

(declare-fun lt!642487 () SeekEntryResult!12037)

(declare-fun b!1469249 () Bool)

(assert (=> b!1469249 (= e!824866 (not (= lt!642487 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642486 lt!642485 mask!2687))))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1469250 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99018 (_ BitVec 32)) SeekEntryResult!12037)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99018 (_ BitVec 32)) SeekEntryResult!12037)

(assert (=> b!1469250 (= e!824866 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642486 lt!642485 mask!2687) (seekEntryOrOpen!0 lt!642486 lt!642485 mask!2687))))))

(declare-fun b!1469251 () Bool)

(declare-fun res!997774 () Bool)

(assert (=> b!1469251 (=> (not res!997774) (not e!824867))))

(assert (=> b!1469251 (= res!997774 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48347 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48347 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48347 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469252 () Bool)

(assert (=> b!1469252 (= e!824862 e!824865)))

(declare-fun res!997764 () Bool)

(assert (=> b!1469252 (=> (not res!997764) (not e!824865))))

(assert (=> b!1469252 (= res!997764 (= lt!642487 (Intermediate!12037 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469252 (= lt!642487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642486 mask!2687) lt!642486 lt!642485 mask!2687))))

(assert (=> b!1469252 (= lt!642486 (select (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469253 () Bool)

(assert (=> b!1469253 (= e!824867 e!824863)))

(declare-fun res!997768 () Bool)

(assert (=> b!1469253 (=> (not res!997768) (not e!824863))))

(assert (=> b!1469253 (= res!997768 (= (select (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469253 (= lt!642485 (array!99019 (store (arr!47797 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48347 a!2862)))))

(assert (= (and start!125570 res!997766) b!1469243))

(assert (= (and b!1469243 res!997771) b!1469242))

(assert (= (and b!1469242 res!997765) b!1469245))

(assert (= (and b!1469245 res!997773) b!1469241))

(assert (= (and b!1469241 res!997769) b!1469246))

(assert (= (and b!1469246 res!997770) b!1469251))

(assert (= (and b!1469251 res!997774) b!1469253))

(assert (= (and b!1469253 res!997768) b!1469244))

(assert (= (and b!1469244 res!997772) b!1469248))

(assert (= (and b!1469248 res!997767) b!1469252))

(assert (= (and b!1469252 res!997764) b!1469247))

(assert (= (and b!1469247 c!135249) b!1469249))

(assert (= (and b!1469247 (not c!135249)) b!1469250))

(declare-fun m!1356425 () Bool)

(assert (=> b!1469242 m!1356425))

(assert (=> b!1469242 m!1356425))

(declare-fun m!1356427 () Bool)

(assert (=> b!1469242 m!1356427))

(declare-fun m!1356429 () Bool)

(assert (=> b!1469250 m!1356429))

(declare-fun m!1356431 () Bool)

(assert (=> b!1469250 m!1356431))

(declare-fun m!1356433 () Bool)

(assert (=> b!1469245 m!1356433))

(assert (=> b!1469245 m!1356433))

(declare-fun m!1356435 () Bool)

(assert (=> b!1469245 m!1356435))

(declare-fun m!1356437 () Bool)

(assert (=> b!1469241 m!1356437))

(declare-fun m!1356439 () Bool)

(assert (=> b!1469252 m!1356439))

(assert (=> b!1469252 m!1356439))

(declare-fun m!1356441 () Bool)

(assert (=> b!1469252 m!1356441))

(declare-fun m!1356443 () Bool)

(assert (=> b!1469252 m!1356443))

(declare-fun m!1356445 () Bool)

(assert (=> b!1469252 m!1356445))

(declare-fun m!1356447 () Bool)

(assert (=> b!1469246 m!1356447))

(assert (=> b!1469248 m!1356433))

(assert (=> b!1469248 m!1356433))

(declare-fun m!1356449 () Bool)

(assert (=> b!1469248 m!1356449))

(assert (=> b!1469244 m!1356433))

(assert (=> b!1469244 m!1356433))

(declare-fun m!1356451 () Bool)

(assert (=> b!1469244 m!1356451))

(assert (=> b!1469244 m!1356451))

(assert (=> b!1469244 m!1356433))

(declare-fun m!1356453 () Bool)

(assert (=> b!1469244 m!1356453))

(assert (=> b!1469253 m!1356443))

(declare-fun m!1356455 () Bool)

(assert (=> b!1469253 m!1356455))

(declare-fun m!1356457 () Bool)

(assert (=> start!125570 m!1356457))

(declare-fun m!1356459 () Bool)

(assert (=> start!125570 m!1356459))

(declare-fun m!1356461 () Bool)

(assert (=> b!1469249 m!1356461))

(push 1)

(assert (not b!1469248))

(assert (not b!1469252))

(assert (not b!1469250))

