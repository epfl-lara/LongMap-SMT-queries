; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126640 () Bool)

(assert start!126640)

(declare-fun b!1486252 () Bool)

(declare-fun res!1010632 () Bool)

(declare-fun e!833184 () Bool)

(assert (=> b!1486252 (=> (not res!1010632) (not e!833184))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12284 0))(
  ( (MissingZero!12284 (index!51528 (_ BitVec 32))) (Found!12284 (index!51529 (_ BitVec 32))) (Intermediate!12284 (undefined!13096 Bool) (index!51530 (_ BitVec 32)) (x!133116 (_ BitVec 32))) (Undefined!12284) (MissingVacant!12284 (index!51531 (_ BitVec 32))) )
))
(declare-fun lt!648405 () SeekEntryResult!12284)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99539 0))(
  ( (array!99540 (arr!48044 (Array (_ BitVec 32) (_ BitVec 64))) (size!48594 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99539)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99539 (_ BitVec 32)) SeekEntryResult!12284)

(assert (=> b!1486252 (= res!1010632 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48044 a!2862) j!93) a!2862 mask!2687) lt!648405))))

(declare-fun b!1486253 () Bool)

(declare-fun e!833187 () Bool)

(declare-fun lt!648411 () array!99539)

(declare-fun lt!648410 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99539 (_ BitVec 32)) SeekEntryResult!12284)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99539 (_ BitVec 32)) SeekEntryResult!12284)

(assert (=> b!1486253 (= e!833187 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648410 lt!648411 mask!2687) (seekEntryOrOpen!0 lt!648410 lt!648411 mask!2687)))))

(declare-fun b!1486254 () Bool)

(declare-fun res!1010620 () Bool)

(declare-fun e!833191 () Bool)

(assert (=> b!1486254 (=> (not res!1010620) (not e!833191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99539 (_ BitVec 32)) Bool)

(assert (=> b!1486254 (= res!1010620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486255 () Bool)

(declare-fun e!833192 () Bool)

(assert (=> b!1486255 (= e!833192 e!833184)))

(declare-fun res!1010626 () Bool)

(assert (=> b!1486255 (=> (not res!1010626) (not e!833184))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486255 (= res!1010626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48044 a!2862) j!93) mask!2687) (select (arr!48044 a!2862) j!93) a!2862 mask!2687) lt!648405))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486255 (= lt!648405 (Intermediate!12284 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486256 () Bool)

(declare-fun res!1010621 () Bool)

(assert (=> b!1486256 (=> (not res!1010621) (not e!833191))))

(declare-datatypes ((List!34545 0))(
  ( (Nil!34542) (Cons!34541 (h!35918 (_ BitVec 64)) (t!49239 List!34545)) )
))
(declare-fun arrayNoDuplicates!0 (array!99539 (_ BitVec 32) List!34545) Bool)

(assert (=> b!1486256 (= res!1010621 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34542))))

(declare-fun b!1486257 () Bool)

(declare-fun res!1010628 () Bool)

(assert (=> b!1486257 (=> (not res!1010628) (not e!833191))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486257 (= res!1010628 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48594 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48594 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48594 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486258 () Bool)

(declare-fun res!1010635 () Bool)

(assert (=> b!1486258 (=> (not res!1010635) (not e!833191))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486258 (= res!1010635 (validKeyInArray!0 (select (arr!48044 a!2862) i!1006)))))

(declare-fun b!1486259 () Bool)

(declare-fun e!833188 () Bool)

(declare-fun e!833185 () Bool)

(assert (=> b!1486259 (= e!833188 (not e!833185))))

(declare-fun res!1010630 () Bool)

(assert (=> b!1486259 (=> res!1010630 e!833185)))

(assert (=> b!1486259 (= res!1010630 (or (and (= (select (arr!48044 a!2862) index!646) (select (store (arr!48044 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48044 a!2862) index!646) (select (arr!48044 a!2862) j!93))) (= (select (arr!48044 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833190 () Bool)

(assert (=> b!1486259 e!833190))

(declare-fun res!1010631 () Bool)

(assert (=> b!1486259 (=> (not res!1010631) (not e!833190))))

(assert (=> b!1486259 (= res!1010631 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49908 0))(
  ( (Unit!49909) )
))
(declare-fun lt!648408 () Unit!49908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49908)

(assert (=> b!1486259 (= lt!648408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486260 () Bool)

(declare-fun e!833186 () Bool)

(assert (=> b!1486260 (= e!833186 (= (seekEntryOrOpen!0 lt!648410 lt!648411 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648410 lt!648411 mask!2687)))))

(declare-fun b!1486261 () Bool)

(declare-fun res!1010627 () Bool)

(assert (=> b!1486261 (=> (not res!1010627) (not e!833190))))

(assert (=> b!1486261 (= res!1010627 (= (seekEntryOrOpen!0 (select (arr!48044 a!2862) j!93) a!2862 mask!2687) (Found!12284 j!93)))))

(declare-fun b!1486262 () Bool)

(assert (=> b!1486262 (= e!833191 e!833192)))

(declare-fun res!1010634 () Bool)

(assert (=> b!1486262 (=> (not res!1010634) (not e!833192))))

(assert (=> b!1486262 (= res!1010634 (= (select (store (arr!48044 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486262 (= lt!648411 (array!99540 (store (arr!48044 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48594 a!2862)))))

(declare-fun b!1486263 () Bool)

(assert (=> b!1486263 (= e!833185 true)))

(declare-fun lt!648407 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486263 (= lt!648407 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486265 () Bool)

(declare-fun e!833189 () Bool)

(assert (=> b!1486265 (= e!833189 e!833186)))

(declare-fun res!1010623 () Bool)

(assert (=> b!1486265 (=> (not res!1010623) (not e!833186))))

(declare-fun lt!648406 () (_ BitVec 64))

(assert (=> b!1486265 (= res!1010623 (and (= index!646 intermediateAfterIndex!19) (= lt!648406 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!648409 () SeekEntryResult!12284)

(declare-fun b!1486266 () Bool)

(assert (=> b!1486266 (= e!833187 (= lt!648409 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648410 lt!648411 mask!2687)))))

(declare-fun b!1486267 () Bool)

(declare-fun res!1010625 () Bool)

(assert (=> b!1486267 (=> (not res!1010625) (not e!833190))))

(assert (=> b!1486267 (= res!1010625 (or (= (select (arr!48044 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48044 a!2862) intermediateBeforeIndex!19) (select (arr!48044 a!2862) j!93))))))

(declare-fun b!1486268 () Bool)

(declare-fun res!1010636 () Bool)

(assert (=> b!1486268 (=> (not res!1010636) (not e!833188))))

(assert (=> b!1486268 (= res!1010636 e!833187)))

(declare-fun c!137340 () Bool)

(assert (=> b!1486268 (= c!137340 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486269 () Bool)

(declare-fun res!1010633 () Bool)

(assert (=> b!1486269 (=> (not res!1010633) (not e!833191))))

(assert (=> b!1486269 (= res!1010633 (validKeyInArray!0 (select (arr!48044 a!2862) j!93)))))

(declare-fun b!1486270 () Bool)

(assert (=> b!1486270 (= e!833184 e!833188)))

(declare-fun res!1010624 () Bool)

(assert (=> b!1486270 (=> (not res!1010624) (not e!833188))))

(assert (=> b!1486270 (= res!1010624 (= lt!648409 (Intermediate!12284 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486270 (= lt!648409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648410 mask!2687) lt!648410 lt!648411 mask!2687))))

(assert (=> b!1486270 (= lt!648410 (select (store (arr!48044 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486271 () Bool)

(declare-fun res!1010637 () Bool)

(assert (=> b!1486271 (=> (not res!1010637) (not e!833188))))

(assert (=> b!1486271 (= res!1010637 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486272 () Bool)

(assert (=> b!1486272 (= e!833190 e!833189)))

(declare-fun res!1010638 () Bool)

(assert (=> b!1486272 (=> res!1010638 e!833189)))

(assert (=> b!1486272 (= res!1010638 (or (and (= (select (arr!48044 a!2862) index!646) lt!648406) (= (select (arr!48044 a!2862) index!646) (select (arr!48044 a!2862) j!93))) (= (select (arr!48044 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486272 (= lt!648406 (select (store (arr!48044 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun res!1010622 () Bool)

(assert (=> start!126640 (=> (not res!1010622) (not e!833191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126640 (= res!1010622 (validMask!0 mask!2687))))

(assert (=> start!126640 e!833191))

(assert (=> start!126640 true))

(declare-fun array_inv!37072 (array!99539) Bool)

(assert (=> start!126640 (array_inv!37072 a!2862)))

(declare-fun b!1486264 () Bool)

(declare-fun res!1010629 () Bool)

(assert (=> b!1486264 (=> (not res!1010629) (not e!833191))))

(assert (=> b!1486264 (= res!1010629 (and (= (size!48594 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48594 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48594 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126640 res!1010622) b!1486264))

(assert (= (and b!1486264 res!1010629) b!1486258))

(assert (= (and b!1486258 res!1010635) b!1486269))

(assert (= (and b!1486269 res!1010633) b!1486254))

(assert (= (and b!1486254 res!1010620) b!1486256))

(assert (= (and b!1486256 res!1010621) b!1486257))

(assert (= (and b!1486257 res!1010628) b!1486262))

(assert (= (and b!1486262 res!1010634) b!1486255))

(assert (= (and b!1486255 res!1010626) b!1486252))

(assert (= (and b!1486252 res!1010632) b!1486270))

(assert (= (and b!1486270 res!1010624) b!1486268))

(assert (= (and b!1486268 c!137340) b!1486266))

(assert (= (and b!1486268 (not c!137340)) b!1486253))

(assert (= (and b!1486268 res!1010636) b!1486271))

(assert (= (and b!1486271 res!1010637) b!1486259))

(assert (= (and b!1486259 res!1010631) b!1486261))

(assert (= (and b!1486261 res!1010627) b!1486267))

(assert (= (and b!1486267 res!1010625) b!1486272))

(assert (= (and b!1486272 (not res!1010638)) b!1486265))

(assert (= (and b!1486265 res!1010623) b!1486260))

(assert (= (and b!1486259 (not res!1010630)) b!1486263))

(declare-fun m!1371163 () Bool)

(assert (=> b!1486253 m!1371163))

(declare-fun m!1371165 () Bool)

(assert (=> b!1486253 m!1371165))

(declare-fun m!1371167 () Bool)

(assert (=> b!1486267 m!1371167))

(declare-fun m!1371169 () Bool)

(assert (=> b!1486267 m!1371169))

(declare-fun m!1371171 () Bool)

(assert (=> b!1486258 m!1371171))

(assert (=> b!1486258 m!1371171))

(declare-fun m!1371173 () Bool)

(assert (=> b!1486258 m!1371173))

(declare-fun m!1371175 () Bool)

(assert (=> b!1486270 m!1371175))

(assert (=> b!1486270 m!1371175))

(declare-fun m!1371177 () Bool)

(assert (=> b!1486270 m!1371177))

(declare-fun m!1371179 () Bool)

(assert (=> b!1486270 m!1371179))

(declare-fun m!1371181 () Bool)

(assert (=> b!1486270 m!1371181))

(assert (=> b!1486261 m!1371169))

(assert (=> b!1486261 m!1371169))

(declare-fun m!1371183 () Bool)

(assert (=> b!1486261 m!1371183))

(declare-fun m!1371185 () Bool)

(assert (=> b!1486259 m!1371185))

(assert (=> b!1486259 m!1371179))

(declare-fun m!1371187 () Bool)

(assert (=> b!1486259 m!1371187))

(declare-fun m!1371189 () Bool)

(assert (=> b!1486259 m!1371189))

(declare-fun m!1371191 () Bool)

(assert (=> b!1486259 m!1371191))

(assert (=> b!1486259 m!1371169))

(assert (=> b!1486269 m!1371169))

(assert (=> b!1486269 m!1371169))

(declare-fun m!1371193 () Bool)

(assert (=> b!1486269 m!1371193))

(declare-fun m!1371195 () Bool)

(assert (=> b!1486266 m!1371195))

(declare-fun m!1371197 () Bool)

(assert (=> b!1486254 m!1371197))

(assert (=> b!1486252 m!1371169))

(assert (=> b!1486252 m!1371169))

(declare-fun m!1371199 () Bool)

(assert (=> b!1486252 m!1371199))

(declare-fun m!1371201 () Bool)

(assert (=> b!1486263 m!1371201))

(assert (=> b!1486272 m!1371189))

(assert (=> b!1486272 m!1371169))

(assert (=> b!1486272 m!1371179))

(assert (=> b!1486272 m!1371187))

(assert (=> b!1486255 m!1371169))

(assert (=> b!1486255 m!1371169))

(declare-fun m!1371203 () Bool)

(assert (=> b!1486255 m!1371203))

(assert (=> b!1486255 m!1371203))

(assert (=> b!1486255 m!1371169))

(declare-fun m!1371205 () Bool)

(assert (=> b!1486255 m!1371205))

(declare-fun m!1371207 () Bool)

(assert (=> b!1486256 m!1371207))

(assert (=> b!1486260 m!1371165))

(assert (=> b!1486260 m!1371163))

(declare-fun m!1371209 () Bool)

(assert (=> start!126640 m!1371209))

(declare-fun m!1371211 () Bool)

(assert (=> start!126640 m!1371211))

(assert (=> b!1486262 m!1371179))

(declare-fun m!1371213 () Bool)

(assert (=> b!1486262 m!1371213))

(push 1)

