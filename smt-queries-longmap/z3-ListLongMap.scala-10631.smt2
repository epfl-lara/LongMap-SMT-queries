; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124926 () Bool)

(assert start!124926)

(declare-datatypes ((SeekEntryResult!11727 0))(
  ( (MissingZero!11727 (index!49300 (_ BitVec 32))) (Found!11727 (index!49301 (_ BitVec 32))) (Intermediate!11727 (undefined!12539 Bool) (index!49302 (_ BitVec 32)) (x!130952 (_ BitVec 32))) (Undefined!11727) (MissingVacant!11727 (index!49303 (_ BitVec 32))) )
))
(declare-fun lt!636712 () SeekEntryResult!11727)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98374 0))(
  ( (array!98375 (arr!47475 (Array (_ BitVec 32) (_ BitVec 64))) (size!48025 (_ BitVec 32))) )
))
(declare-fun lt!636713 () array!98374)

(declare-fun b!1451641 () Bool)

(declare-fun e!817306 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636711 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11727)

(assert (=> b!1451641 (= e!817306 (= lt!636712 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636711 lt!636713 mask!2687)))))

(declare-fun b!1451642 () Bool)

(declare-fun res!982866 () Bool)

(declare-fun e!817304 () Bool)

(assert (=> b!1451642 (=> (not res!982866) (not e!817304))))

(declare-fun a!2862 () array!98374)

(declare-datatypes ((List!33976 0))(
  ( (Nil!33973) (Cons!33972 (h!35322 (_ BitVec 64)) (t!48670 List!33976)) )
))
(declare-fun arrayNoDuplicates!0 (array!98374 (_ BitVec 32) List!33976) Bool)

(assert (=> b!1451642 (= res!982866 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33973))))

(declare-fun b!1451643 () Bool)

(declare-fun e!817309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451643 (= e!817309 (validKeyInArray!0 lt!636711))))

(declare-fun b!1451644 () Bool)

(declare-fun e!817303 () Bool)

(assert (=> b!1451644 (= e!817303 (not e!817309))))

(declare-fun res!982859 () Bool)

(assert (=> b!1451644 (=> res!982859 e!817309)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451644 (= res!982859 (or (and (= (select (arr!47475 a!2862) index!646) (select (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47475 a!2862) index!646) (select (arr!47475 a!2862) j!93))) (= (select (arr!47475 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun e!817310 () Bool)

(assert (=> b!1451644 e!817310))

(declare-fun res!982861 () Bool)

(assert (=> b!1451644 (=> (not res!982861) (not e!817310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98374 (_ BitVec 32)) Bool)

(assert (=> b!1451644 (= res!982861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48950 0))(
  ( (Unit!48951) )
))
(declare-fun lt!636710 () Unit!48950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48950)

(assert (=> b!1451644 (= lt!636710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451645 () Bool)

(declare-fun res!982858 () Bool)

(assert (=> b!1451645 (=> (not res!982858) (not e!817304))))

(assert (=> b!1451645 (= res!982858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451646 () Bool)

(declare-fun res!982853 () Bool)

(assert (=> b!1451646 (=> (not res!982853) (not e!817304))))

(assert (=> b!1451646 (= res!982853 (and (= (size!48025 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48025 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48025 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451648 () Bool)

(declare-fun e!817305 () Bool)

(declare-fun e!817308 () Bool)

(assert (=> b!1451648 (= e!817305 e!817308)))

(declare-fun res!982852 () Bool)

(assert (=> b!1451648 (=> (not res!982852) (not e!817308))))

(declare-fun lt!636714 () SeekEntryResult!11727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451648 (= res!982852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47475 a!2862) j!93) mask!2687) (select (arr!47475 a!2862) j!93) a!2862 mask!2687) lt!636714))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451648 (= lt!636714 (Intermediate!11727 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451649 () Bool)

(declare-fun res!982863 () Bool)

(assert (=> b!1451649 (=> (not res!982863) (not e!817304))))

(assert (=> b!1451649 (= res!982863 (validKeyInArray!0 (select (arr!47475 a!2862) i!1006)))))

(declare-fun b!1451650 () Bool)

(declare-fun res!982860 () Bool)

(assert (=> b!1451650 (=> (not res!982860) (not e!817304))))

(assert (=> b!1451650 (= res!982860 (validKeyInArray!0 (select (arr!47475 a!2862) j!93)))))

(declare-fun b!1451651 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11727)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11727)

(assert (=> b!1451651 (= e!817306 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636711 lt!636713 mask!2687) (seekEntryOrOpen!0 lt!636711 lt!636713 mask!2687)))))

(declare-fun b!1451652 () Bool)

(assert (=> b!1451652 (= e!817304 e!817305)))

(declare-fun res!982856 () Bool)

(assert (=> b!1451652 (=> (not res!982856) (not e!817305))))

(assert (=> b!1451652 (= res!982856 (= (select (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451652 (= lt!636713 (array!98375 (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48025 a!2862)))))

(declare-fun b!1451653 () Bool)

(declare-fun res!982864 () Bool)

(assert (=> b!1451653 (=> (not res!982864) (not e!817310))))

(assert (=> b!1451653 (= res!982864 (= (seekEntryOrOpen!0 (select (arr!47475 a!2862) j!93) a!2862 mask!2687) (Found!11727 j!93)))))

(declare-fun res!982854 () Bool)

(assert (=> start!124926 (=> (not res!982854) (not e!817304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124926 (= res!982854 (validMask!0 mask!2687))))

(assert (=> start!124926 e!817304))

(assert (=> start!124926 true))

(declare-fun array_inv!36503 (array!98374) Bool)

(assert (=> start!124926 (array_inv!36503 a!2862)))

(declare-fun b!1451647 () Bool)

(declare-fun res!982865 () Bool)

(assert (=> b!1451647 (=> (not res!982865) (not e!817303))))

(assert (=> b!1451647 (= res!982865 e!817306)))

(declare-fun c!133905 () Bool)

(assert (=> b!1451647 (= c!133905 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451654 () Bool)

(assert (=> b!1451654 (= e!817310 (and (or (= (select (arr!47475 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47475 a!2862) intermediateBeforeIndex!19) (select (arr!47475 a!2862) j!93))) (or (and (= (select (arr!47475 a!2862) index!646) (select (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47475 a!2862) index!646) (select (arr!47475 a!2862) j!93))) (= (select (arr!47475 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451655 () Bool)

(declare-fun res!982867 () Bool)

(assert (=> b!1451655 (=> (not res!982867) (not e!817308))))

(assert (=> b!1451655 (= res!982867 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47475 a!2862) j!93) a!2862 mask!2687) lt!636714))))

(declare-fun b!1451656 () Bool)

(declare-fun res!982862 () Bool)

(assert (=> b!1451656 (=> (not res!982862) (not e!817303))))

(assert (=> b!1451656 (= res!982862 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451657 () Bool)

(assert (=> b!1451657 (= e!817308 e!817303)))

(declare-fun res!982855 () Bool)

(assert (=> b!1451657 (=> (not res!982855) (not e!817303))))

(assert (=> b!1451657 (= res!982855 (= lt!636712 (Intermediate!11727 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451657 (= lt!636712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636711 mask!2687) lt!636711 lt!636713 mask!2687))))

(assert (=> b!1451657 (= lt!636711 (select (store (arr!47475 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451658 () Bool)

(declare-fun res!982857 () Bool)

(assert (=> b!1451658 (=> (not res!982857) (not e!817304))))

(assert (=> b!1451658 (= res!982857 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48025 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48025 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48025 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124926 res!982854) b!1451646))

(assert (= (and b!1451646 res!982853) b!1451649))

(assert (= (and b!1451649 res!982863) b!1451650))

(assert (= (and b!1451650 res!982860) b!1451645))

(assert (= (and b!1451645 res!982858) b!1451642))

(assert (= (and b!1451642 res!982866) b!1451658))

(assert (= (and b!1451658 res!982857) b!1451652))

(assert (= (and b!1451652 res!982856) b!1451648))

(assert (= (and b!1451648 res!982852) b!1451655))

(assert (= (and b!1451655 res!982867) b!1451657))

(assert (= (and b!1451657 res!982855) b!1451647))

(assert (= (and b!1451647 c!133905) b!1451641))

(assert (= (and b!1451647 (not c!133905)) b!1451651))

(assert (= (and b!1451647 res!982865) b!1451656))

(assert (= (and b!1451656 res!982862) b!1451644))

(assert (= (and b!1451644 res!982861) b!1451653))

(assert (= (and b!1451653 res!982864) b!1451654))

(assert (= (and b!1451644 (not res!982859)) b!1451643))

(declare-fun m!1340231 () Bool)

(assert (=> b!1451651 m!1340231))

(declare-fun m!1340233 () Bool)

(assert (=> b!1451651 m!1340233))

(declare-fun m!1340235 () Bool)

(assert (=> b!1451657 m!1340235))

(assert (=> b!1451657 m!1340235))

(declare-fun m!1340237 () Bool)

(assert (=> b!1451657 m!1340237))

(declare-fun m!1340239 () Bool)

(assert (=> b!1451657 m!1340239))

(declare-fun m!1340241 () Bool)

(assert (=> b!1451657 m!1340241))

(declare-fun m!1340243 () Bool)

(assert (=> b!1451648 m!1340243))

(assert (=> b!1451648 m!1340243))

(declare-fun m!1340245 () Bool)

(assert (=> b!1451648 m!1340245))

(assert (=> b!1451648 m!1340245))

(assert (=> b!1451648 m!1340243))

(declare-fun m!1340247 () Bool)

(assert (=> b!1451648 m!1340247))

(declare-fun m!1340249 () Bool)

(assert (=> b!1451642 m!1340249))

(declare-fun m!1340251 () Bool)

(assert (=> b!1451645 m!1340251))

(declare-fun m!1340253 () Bool)

(assert (=> b!1451649 m!1340253))

(assert (=> b!1451649 m!1340253))

(declare-fun m!1340255 () Bool)

(assert (=> b!1451649 m!1340255))

(assert (=> b!1451653 m!1340243))

(assert (=> b!1451653 m!1340243))

(declare-fun m!1340257 () Bool)

(assert (=> b!1451653 m!1340257))

(declare-fun m!1340259 () Bool)

(assert (=> b!1451641 m!1340259))

(assert (=> b!1451654 m!1340239))

(declare-fun m!1340261 () Bool)

(assert (=> b!1451654 m!1340261))

(declare-fun m!1340263 () Bool)

(assert (=> b!1451654 m!1340263))

(declare-fun m!1340265 () Bool)

(assert (=> b!1451654 m!1340265))

(assert (=> b!1451654 m!1340243))

(declare-fun m!1340267 () Bool)

(assert (=> b!1451643 m!1340267))

(assert (=> b!1451655 m!1340243))

(assert (=> b!1451655 m!1340243))

(declare-fun m!1340269 () Bool)

(assert (=> b!1451655 m!1340269))

(assert (=> b!1451652 m!1340239))

(declare-fun m!1340271 () Bool)

(assert (=> b!1451652 m!1340271))

(declare-fun m!1340273 () Bool)

(assert (=> b!1451644 m!1340273))

(assert (=> b!1451644 m!1340239))

(assert (=> b!1451644 m!1340263))

(assert (=> b!1451644 m!1340265))

(declare-fun m!1340275 () Bool)

(assert (=> b!1451644 m!1340275))

(assert (=> b!1451644 m!1340243))

(declare-fun m!1340277 () Bool)

(assert (=> start!124926 m!1340277))

(declare-fun m!1340279 () Bool)

(assert (=> start!124926 m!1340279))

(assert (=> b!1451650 m!1340243))

(assert (=> b!1451650 m!1340243))

(declare-fun m!1340281 () Bool)

(assert (=> b!1451650 m!1340281))

(check-sat (not b!1451657) (not b!1451653) (not b!1451644) (not b!1451641) (not b!1451648) (not b!1451645) (not b!1451655) (not b!1451642) (not b!1451651) (not b!1451649) (not b!1451650) (not start!124926) (not b!1451643))
(check-sat)
