; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125914 () Bool)

(assert start!125914)

(declare-fun res!1001587 () Bool)

(declare-fun e!827244 () Bool)

(assert (=> start!125914 (=> (not res!1001587) (not e!827244))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125914 (= res!1001587 (validMask!0 mask!2687))))

(assert (=> start!125914 e!827244))

(assert (=> start!125914 true))

(declare-datatypes ((array!99191 0))(
  ( (array!99192 (arr!47879 (Array (_ BitVec 32) (_ BitVec 64))) (size!48429 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99191)

(declare-fun array_inv!36907 (array!99191) Bool)

(assert (=> start!125914 (array_inv!36907 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644231 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644230 () array!99191)

(declare-fun e!827241 () Bool)

(declare-fun b!1474364 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12119 0))(
  ( (MissingZero!12119 (index!50868 (_ BitVec 32))) (Found!12119 (index!50869 (_ BitVec 32))) (Intermediate!12119 (undefined!12931 Bool) (index!50870 (_ BitVec 32)) (x!132451 (_ BitVec 32))) (Undefined!12119) (MissingVacant!12119 (index!50871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99191 (_ BitVec 32)) SeekEntryResult!12119)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99191 (_ BitVec 32)) SeekEntryResult!12119)

(assert (=> b!1474364 (= e!827241 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644231 lt!644230 mask!2687) (seekEntryOrOpen!0 lt!644231 lt!644230 mask!2687)))))

(declare-fun b!1474365 () Bool)

(declare-fun res!1001582 () Bool)

(assert (=> b!1474365 (=> (not res!1001582) (not e!827244))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474365 (= res!1001582 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48429 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48429 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48429 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474366 () Bool)

(declare-fun e!827245 () Bool)

(assert (=> b!1474366 (= e!827244 e!827245)))

(declare-fun res!1001589 () Bool)

(assert (=> b!1474366 (=> (not res!1001589) (not e!827245))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474366 (= res!1001589 (= (select (store (arr!47879 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474366 (= lt!644230 (array!99192 (store (arr!47879 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48429 a!2862)))))

(declare-fun b!1474367 () Bool)

(declare-fun e!827243 () Bool)

(declare-fun e!827242 () Bool)

(assert (=> b!1474367 (= e!827243 e!827242)))

(declare-fun res!1001585 () Bool)

(assert (=> b!1474367 (=> (not res!1001585) (not e!827242))))

(declare-fun lt!644229 () SeekEntryResult!12119)

(assert (=> b!1474367 (= res!1001585 (= lt!644229 (Intermediate!12119 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99191 (_ BitVec 32)) SeekEntryResult!12119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474367 (= lt!644229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644231 mask!2687) lt!644231 lt!644230 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474367 (= lt!644231 (select (store (arr!47879 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474368 () Bool)

(declare-fun res!1001586 () Bool)

(assert (=> b!1474368 (=> (not res!1001586) (not e!827244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474368 (= res!1001586 (validKeyInArray!0 (select (arr!47879 a!2862) i!1006)))))

(declare-fun b!1474369 () Bool)

(declare-fun res!1001577 () Bool)

(assert (=> b!1474369 (=> (not res!1001577) (not e!827244))))

(assert (=> b!1474369 (= res!1001577 (validKeyInArray!0 (select (arr!47879 a!2862) j!93)))))

(declare-fun b!1474370 () Bool)

(declare-fun res!1001576 () Bool)

(assert (=> b!1474370 (=> (not res!1001576) (not e!827242))))

(assert (=> b!1474370 (= res!1001576 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474371 () Bool)

(declare-fun res!1001588 () Bool)

(assert (=> b!1474371 (=> (not res!1001588) (not e!827243))))

(declare-fun lt!644228 () SeekEntryResult!12119)

(assert (=> b!1474371 (= res!1001588 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47879 a!2862) j!93) a!2862 mask!2687) lt!644228))))

(declare-fun b!1474372 () Bool)

(declare-fun res!1001581 () Bool)

(declare-fun e!827246 () Bool)

(assert (=> b!1474372 (=> (not res!1001581) (not e!827246))))

(assert (=> b!1474372 (= res!1001581 (= (seekEntryOrOpen!0 (select (arr!47879 a!2862) j!93) a!2862 mask!2687) (Found!12119 j!93)))))

(declare-fun b!1474373 () Bool)

(declare-fun res!1001590 () Bool)

(assert (=> b!1474373 (=> (not res!1001590) (not e!827244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99191 (_ BitVec 32)) Bool)

(assert (=> b!1474373 (= res!1001590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474374 () Bool)

(declare-fun res!1001578 () Bool)

(assert (=> b!1474374 (=> (not res!1001578) (not e!827242))))

(assert (=> b!1474374 (= res!1001578 e!827241)))

(declare-fun c!135909 () Bool)

(assert (=> b!1474374 (= c!135909 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474375 () Bool)

(declare-fun res!1001579 () Bool)

(assert (=> b!1474375 (=> (not res!1001579) (not e!827244))))

(assert (=> b!1474375 (= res!1001579 (and (= (size!48429 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48429 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48429 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474376 () Bool)

(assert (=> b!1474376 (= e!827246 (or (= (select (arr!47879 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47879 a!2862) intermediateBeforeIndex!19) (select (arr!47879 a!2862) j!93))))))

(declare-fun b!1474377 () Bool)

(assert (=> b!1474377 (= e!827245 e!827243)))

(declare-fun res!1001584 () Bool)

(assert (=> b!1474377 (=> (not res!1001584) (not e!827243))))

(assert (=> b!1474377 (= res!1001584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47879 a!2862) j!93) mask!2687) (select (arr!47879 a!2862) j!93) a!2862 mask!2687) lt!644228))))

(assert (=> b!1474377 (= lt!644228 (Intermediate!12119 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474378 () Bool)

(declare-fun res!1001583 () Bool)

(assert (=> b!1474378 (=> (not res!1001583) (not e!827244))))

(declare-datatypes ((List!34380 0))(
  ( (Nil!34377) (Cons!34376 (h!35735 (_ BitVec 64)) (t!49074 List!34380)) )
))
(declare-fun arrayNoDuplicates!0 (array!99191 (_ BitVec 32) List!34380) Bool)

(assert (=> b!1474378 (= res!1001583 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34377))))

(declare-fun b!1474379 () Bool)

(assert (=> b!1474379 (= e!827242 (not true))))

(assert (=> b!1474379 e!827246))

(declare-fun res!1001580 () Bool)

(assert (=> b!1474379 (=> (not res!1001580) (not e!827246))))

(assert (=> b!1474379 (= res!1001580 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49578 0))(
  ( (Unit!49579) )
))
(declare-fun lt!644232 () Unit!49578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49578)

(assert (=> b!1474379 (= lt!644232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474380 () Bool)

(assert (=> b!1474380 (= e!827241 (= lt!644229 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644231 lt!644230 mask!2687)))))

(assert (= (and start!125914 res!1001587) b!1474375))

(assert (= (and b!1474375 res!1001579) b!1474368))

(assert (= (and b!1474368 res!1001586) b!1474369))

(assert (= (and b!1474369 res!1001577) b!1474373))

(assert (= (and b!1474373 res!1001590) b!1474378))

(assert (= (and b!1474378 res!1001583) b!1474365))

(assert (= (and b!1474365 res!1001582) b!1474366))

(assert (= (and b!1474366 res!1001589) b!1474377))

(assert (= (and b!1474377 res!1001584) b!1474371))

(assert (= (and b!1474371 res!1001588) b!1474367))

(assert (= (and b!1474367 res!1001585) b!1474374))

(assert (= (and b!1474374 c!135909) b!1474380))

(assert (= (and b!1474374 (not c!135909)) b!1474364))

(assert (= (and b!1474374 res!1001578) b!1474370))

(assert (= (and b!1474370 res!1001576) b!1474379))

(assert (= (and b!1474379 res!1001580) b!1474372))

(assert (= (and b!1474372 res!1001581) b!1474376))

(declare-fun m!1360819 () Bool)

(assert (=> b!1474369 m!1360819))

(assert (=> b!1474369 m!1360819))

(declare-fun m!1360821 () Bool)

(assert (=> b!1474369 m!1360821))

(assert (=> b!1474371 m!1360819))

(assert (=> b!1474371 m!1360819))

(declare-fun m!1360823 () Bool)

(assert (=> b!1474371 m!1360823))

(assert (=> b!1474372 m!1360819))

(assert (=> b!1474372 m!1360819))

(declare-fun m!1360825 () Bool)

(assert (=> b!1474372 m!1360825))

(declare-fun m!1360827 () Bool)

(assert (=> start!125914 m!1360827))

(declare-fun m!1360829 () Bool)

(assert (=> start!125914 m!1360829))

(declare-fun m!1360831 () Bool)

(assert (=> b!1474364 m!1360831))

(declare-fun m!1360833 () Bool)

(assert (=> b!1474364 m!1360833))

(declare-fun m!1360835 () Bool)

(assert (=> b!1474373 m!1360835))

(declare-fun m!1360837 () Bool)

(assert (=> b!1474368 m!1360837))

(assert (=> b!1474368 m!1360837))

(declare-fun m!1360839 () Bool)

(assert (=> b!1474368 m!1360839))

(declare-fun m!1360841 () Bool)

(assert (=> b!1474378 m!1360841))

(declare-fun m!1360843 () Bool)

(assert (=> b!1474379 m!1360843))

(declare-fun m!1360845 () Bool)

(assert (=> b!1474379 m!1360845))

(assert (=> b!1474377 m!1360819))

(assert (=> b!1474377 m!1360819))

(declare-fun m!1360847 () Bool)

(assert (=> b!1474377 m!1360847))

(assert (=> b!1474377 m!1360847))

(assert (=> b!1474377 m!1360819))

(declare-fun m!1360849 () Bool)

(assert (=> b!1474377 m!1360849))

(declare-fun m!1360851 () Bool)

(assert (=> b!1474380 m!1360851))

(declare-fun m!1360853 () Bool)

(assert (=> b!1474376 m!1360853))

(assert (=> b!1474376 m!1360819))

(declare-fun m!1360855 () Bool)

(assert (=> b!1474366 m!1360855))

(declare-fun m!1360857 () Bool)

(assert (=> b!1474366 m!1360857))

(declare-fun m!1360859 () Bool)

(assert (=> b!1474367 m!1360859))

(assert (=> b!1474367 m!1360859))

(declare-fun m!1360861 () Bool)

(assert (=> b!1474367 m!1360861))

(assert (=> b!1474367 m!1360855))

(declare-fun m!1360863 () Bool)

(assert (=> b!1474367 m!1360863))

(push 1)

