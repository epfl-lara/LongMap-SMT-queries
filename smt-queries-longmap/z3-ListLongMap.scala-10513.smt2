; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124126 () Bool)

(assert start!124126)

(declare-fun b!1437185 () Bool)

(declare-fun res!969357 () Bool)

(declare-fun e!811162 () Bool)

(assert (=> b!1437185 (=> (not res!969357) (not e!811162))))

(declare-datatypes ((array!97751 0))(
  ( (array!97752 (arr!47173 (Array (_ BitVec 32) (_ BitVec 64))) (size!47724 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97751)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97751 (_ BitVec 32)) Bool)

(assert (=> b!1437185 (= res!969357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437186 () Bool)

(declare-fun res!969355 () Bool)

(assert (=> b!1437186 (=> (not res!969355) (not e!811162))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437186 (= res!969355 (and (= (size!47724 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47724 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47724 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437187 () Bool)

(assert (=> b!1437187 (= e!811162 (and (bvsle #b00000000000000000000000000000000 (size!47724 a!2862)) (bvsge (size!47724 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1437188 () Bool)

(declare-fun res!969354 () Bool)

(assert (=> b!1437188 (=> (not res!969354) (not e!811162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437188 (= res!969354 (validKeyInArray!0 (select (arr!47173 a!2862) i!1006)))))

(declare-fun b!1437189 () Bool)

(declare-fun res!969358 () Bool)

(assert (=> b!1437189 (=> (not res!969358) (not e!811162))))

(assert (=> b!1437189 (= res!969358 (validKeyInArray!0 (select (arr!47173 a!2862) j!93)))))

(declare-fun res!969356 () Bool)

(assert (=> start!124126 (=> (not res!969356) (not e!811162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124126 (= res!969356 (validMask!0 mask!2687))))

(assert (=> start!124126 e!811162))

(assert (=> start!124126 true))

(declare-fun array_inv!36454 (array!97751) Bool)

(assert (=> start!124126 (array_inv!36454 a!2862)))

(assert (= (and start!124126 res!969356) b!1437186))

(assert (= (and b!1437186 res!969355) b!1437188))

(assert (= (and b!1437188 res!969354) b!1437189))

(assert (= (and b!1437189 res!969358) b!1437185))

(assert (= (and b!1437185 res!969357) b!1437187))

(declare-fun m!1326679 () Bool)

(assert (=> b!1437185 m!1326679))

(declare-fun m!1326681 () Bool)

(assert (=> b!1437188 m!1326681))

(assert (=> b!1437188 m!1326681))

(declare-fun m!1326683 () Bool)

(assert (=> b!1437188 m!1326683))

(declare-fun m!1326685 () Bool)

(assert (=> b!1437189 m!1326685))

(assert (=> b!1437189 m!1326685))

(declare-fun m!1326687 () Bool)

(assert (=> b!1437189 m!1326687))

(declare-fun m!1326689 () Bool)

(assert (=> start!124126 m!1326689))

(declare-fun m!1326691 () Bool)

(assert (=> start!124126 m!1326691))

(check-sat (not b!1437189) (not b!1437185) (not start!124126) (not b!1437188))
(check-sat)
(get-model)

(declare-fun d!154815 () Bool)

(assert (=> d!154815 (= (validKeyInArray!0 (select (arr!47173 a!2862) j!93)) (and (not (= (select (arr!47173 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47173 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437189 d!154815))

(declare-fun d!154817 () Bool)

(declare-fun res!969393 () Bool)

(declare-fun e!811184 () Bool)

(assert (=> d!154817 (=> res!969393 e!811184)))

(assert (=> d!154817 (= res!969393 (bvsge #b00000000000000000000000000000000 (size!47724 a!2862)))))

(assert (=> d!154817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811184)))

(declare-fun b!1437228 () Bool)

(declare-fun e!811182 () Bool)

(assert (=> b!1437228 (= e!811184 e!811182)))

(declare-fun c!133429 () Bool)

(assert (=> b!1437228 (= c!133429 (validKeyInArray!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437229 () Bool)

(declare-fun e!811183 () Bool)

(assert (=> b!1437229 (= e!811182 e!811183)))

(declare-fun lt!632500 () (_ BitVec 64))

(assert (=> b!1437229 (= lt!632500 (select (arr!47173 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48473 0))(
  ( (Unit!48474) )
))
(declare-fun lt!632501 () Unit!48473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97751 (_ BitVec 64) (_ BitVec 32)) Unit!48473)

(assert (=> b!1437229 (= lt!632501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632500 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437229 (arrayContainsKey!0 a!2862 lt!632500 #b00000000000000000000000000000000)))

(declare-fun lt!632499 () Unit!48473)

(assert (=> b!1437229 (= lt!632499 lt!632501)))

(declare-fun res!969394 () Bool)

(declare-datatypes ((SeekEntryResult!11348 0))(
  ( (MissingZero!11348 (index!47784 (_ BitVec 32))) (Found!11348 (index!47785 (_ BitVec 32))) (Intermediate!11348 (undefined!12160 Bool) (index!47786 (_ BitVec 32)) (x!129626 (_ BitVec 32))) (Undefined!11348) (MissingVacant!11348 (index!47787 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97751 (_ BitVec 32)) SeekEntryResult!11348)

(assert (=> b!1437229 (= res!969394 (= (seekEntryOrOpen!0 (select (arr!47173 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11348 #b00000000000000000000000000000000)))))

(assert (=> b!1437229 (=> (not res!969394) (not e!811183))))

(declare-fun bm!67638 () Bool)

(declare-fun call!67641 () Bool)

(assert (=> bm!67638 (= call!67641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1437230 () Bool)

(assert (=> b!1437230 (= e!811183 call!67641)))

(declare-fun b!1437231 () Bool)

(assert (=> b!1437231 (= e!811182 call!67641)))

(assert (= (and d!154817 (not res!969393)) b!1437228))

(assert (= (and b!1437228 c!133429) b!1437229))

(assert (= (and b!1437228 (not c!133429)) b!1437231))

(assert (= (and b!1437229 res!969394) b!1437230))

(assert (= (or b!1437230 b!1437231) bm!67638))

(declare-fun m!1326721 () Bool)

(assert (=> b!1437228 m!1326721))

(assert (=> b!1437228 m!1326721))

(declare-fun m!1326723 () Bool)

(assert (=> b!1437228 m!1326723))

(assert (=> b!1437229 m!1326721))

(declare-fun m!1326725 () Bool)

(assert (=> b!1437229 m!1326725))

(declare-fun m!1326727 () Bool)

(assert (=> b!1437229 m!1326727))

(assert (=> b!1437229 m!1326721))

(declare-fun m!1326729 () Bool)

(assert (=> b!1437229 m!1326729))

(declare-fun m!1326731 () Bool)

(assert (=> bm!67638 m!1326731))

(assert (=> b!1437185 d!154817))

(declare-fun d!154823 () Bool)

(assert (=> d!154823 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124126 d!154823))

(declare-fun d!154835 () Bool)

(assert (=> d!154835 (= (array_inv!36454 a!2862) (bvsge (size!47724 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124126 d!154835))

(declare-fun d!154837 () Bool)

(assert (=> d!154837 (= (validKeyInArray!0 (select (arr!47173 a!2862) i!1006)) (and (not (= (select (arr!47173 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47173 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437188 d!154837))

(check-sat (not b!1437229) (not b!1437228) (not bm!67638))
(check-sat)
