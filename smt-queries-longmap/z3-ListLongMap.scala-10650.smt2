; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125256 () Bool)

(assert start!125256)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1456225 () Bool)

(declare-fun lt!638237 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98599 0))(
  ( (array!98600 (arr!47584 (Array (_ BitVec 32) (_ BitVec 64))) (size!48135 (_ BitVec 32))) )
))
(declare-fun lt!638238 () array!98599)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!819577 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11733 0))(
  ( (MissingZero!11733 (index!49324 (_ BitVec 32))) (Found!11733 (index!49325 (_ BitVec 32))) (Intermediate!11733 (undefined!12545 Bool) (index!49326 (_ BitVec 32)) (x!131134 (_ BitVec 32))) (Undefined!11733) (MissingVacant!11733 (index!49327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98599 (_ BitVec 32)) SeekEntryResult!11733)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98599 (_ BitVec 32)) SeekEntryResult!11733)

(assert (=> b!1456225 (= e!819577 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638237 lt!638238 mask!2687) (seekEntryOrOpen!0 lt!638237 lt!638238 mask!2687)))))

(declare-fun b!1456227 () Bool)

(declare-fun res!986163 () Bool)

(declare-fun e!819573 () Bool)

(assert (=> b!1456227 (=> (not res!986163) (not e!819573))))

(declare-fun a!2862 () array!98599)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456227 (= res!986163 (validKeyInArray!0 (select (arr!47584 a!2862) j!93)))))

(declare-fun b!1456228 () Bool)

(declare-fun e!819574 () Bool)

(assert (=> b!1456228 (= e!819573 e!819574)))

(declare-fun res!986164 () Bool)

(assert (=> b!1456228 (=> (not res!986164) (not e!819574))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456228 (= res!986164 (= (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456228 (= lt!638238 (array!98600 (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48135 a!2862)))))

(declare-fun b!1456229 () Bool)

(declare-fun e!819571 () Bool)

(declare-fun e!819576 () Bool)

(assert (=> b!1456229 (= e!819571 e!819576)))

(declare-fun res!986176 () Bool)

(assert (=> b!1456229 (=> res!986176 e!819576)))

(declare-fun lt!638234 () (_ BitVec 32))

(assert (=> b!1456229 (= res!986176 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638234 #b00000000000000000000000000000000) (bvsge lt!638234 (size!48135 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456229 (= lt!638234 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638236 () SeekEntryResult!11733)

(assert (=> b!1456229 (= lt!638236 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638237 lt!638238 mask!2687))))

(assert (=> b!1456229 (= lt!638236 (seekEntryOrOpen!0 lt!638237 lt!638238 mask!2687))))

(declare-fun lt!638235 () SeekEntryResult!11733)

(declare-fun b!1456230 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98599 (_ BitVec 32)) SeekEntryResult!11733)

(assert (=> b!1456230 (= e!819577 (= lt!638235 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638237 lt!638238 mask!2687)))))

(declare-fun b!1456231 () Bool)

(declare-fun e!819572 () Bool)

(assert (=> b!1456231 (= e!819574 e!819572)))

(declare-fun res!986165 () Bool)

(assert (=> b!1456231 (=> (not res!986165) (not e!819572))))

(declare-fun lt!638232 () SeekEntryResult!11733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456231 (= res!986165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47584 a!2862) j!93) mask!2687) (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!638232))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456231 (= lt!638232 (Intermediate!11733 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456232 () Bool)

(declare-fun res!986170 () Bool)

(assert (=> b!1456232 (=> (not res!986170) (not e!819572))))

(assert (=> b!1456232 (= res!986170 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!638232))))

(declare-fun b!1456233 () Bool)

(declare-fun res!986175 () Bool)

(assert (=> b!1456233 (=> (not res!986175) (not e!819573))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456233 (= res!986175 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48135 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48135 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48135 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456234 () Bool)

(declare-fun res!986179 () Bool)

(declare-fun e!819575 () Bool)

(assert (=> b!1456234 (=> (not res!986179) (not e!819575))))

(assert (=> b!1456234 (= res!986179 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456235 () Bool)

(declare-fun res!986177 () Bool)

(declare-fun e!819570 () Bool)

(assert (=> b!1456235 (=> (not res!986177) (not e!819570))))

(assert (=> b!1456235 (= res!986177 (= (seekEntryOrOpen!0 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) (Found!11733 j!93)))))

(declare-fun b!1456236 () Bool)

(assert (=> b!1456236 (= e!819570 (and (or (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) (select (arr!47584 a!2862) j!93))) (let ((bdg!53108 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47584 a!2862) index!646) bdg!53108) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53108 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456237 () Bool)

(assert (=> b!1456237 (= e!819576 true)))

(declare-fun lt!638233 () Bool)

(declare-fun e!819578 () Bool)

(assert (=> b!1456237 (= lt!638233 e!819578)))

(declare-fun c!134551 () Bool)

(assert (=> b!1456237 (= c!134551 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986167 () Bool)

(assert (=> start!125256 (=> (not res!986167) (not e!819573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125256 (= res!986167 (validMask!0 mask!2687))))

(assert (=> start!125256 e!819573))

(assert (=> start!125256 true))

(declare-fun array_inv!36865 (array!98599) Bool)

(assert (=> start!125256 (array_inv!36865 a!2862)))

(declare-fun b!1456226 () Bool)

(assert (=> b!1456226 (= e!819578 (not (= lt!638235 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 lt!638237 lt!638238 mask!2687))))))

(declare-fun b!1456238 () Bool)

(assert (=> b!1456238 (= e!819578 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 intermediateAfterIndex!19 lt!638237 lt!638238 mask!2687) lt!638236)))))

(declare-fun b!1456239 () Bool)

(declare-fun res!986173 () Bool)

(assert (=> b!1456239 (=> (not res!986173) (not e!819573))))

(assert (=> b!1456239 (= res!986173 (and (= (size!48135 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48135 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48135 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456240 () Bool)

(declare-fun res!986171 () Bool)

(assert (=> b!1456240 (=> (not res!986171) (not e!819573))))

(declare-datatypes ((List!34072 0))(
  ( (Nil!34069) (Cons!34068 (h!35429 (_ BitVec 64)) (t!48758 List!34072)) )
))
(declare-fun arrayNoDuplicates!0 (array!98599 (_ BitVec 32) List!34072) Bool)

(assert (=> b!1456240 (= res!986171 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34069))))

(declare-fun b!1456241 () Bool)

(declare-fun res!986169 () Bool)

(assert (=> b!1456241 (=> (not res!986169) (not e!819573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98599 (_ BitVec 32)) Bool)

(assert (=> b!1456241 (= res!986169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456242 () Bool)

(declare-fun res!986168 () Bool)

(assert (=> b!1456242 (=> res!986168 e!819576)))

(assert (=> b!1456242 (= res!986168 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638234 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!638232)))))

(declare-fun b!1456243 () Bool)

(assert (=> b!1456243 (= e!819572 e!819575)))

(declare-fun res!986166 () Bool)

(assert (=> b!1456243 (=> (not res!986166) (not e!819575))))

(assert (=> b!1456243 (= res!986166 (= lt!638235 (Intermediate!11733 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456243 (= lt!638235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638237 mask!2687) lt!638237 lt!638238 mask!2687))))

(assert (=> b!1456243 (= lt!638237 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456244 () Bool)

(assert (=> b!1456244 (= e!819575 (not e!819571))))

(declare-fun res!986174 () Bool)

(assert (=> b!1456244 (=> res!986174 e!819571)))

(assert (=> b!1456244 (= res!986174 (or (and (= (select (arr!47584 a!2862) index!646) (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456244 e!819570))

(declare-fun res!986180 () Bool)

(assert (=> b!1456244 (=> (not res!986180) (not e!819570))))

(assert (=> b!1456244 (= res!986180 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48995 0))(
  ( (Unit!48996) )
))
(declare-fun lt!638239 () Unit!48995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48995)

(assert (=> b!1456244 (= lt!638239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456245 () Bool)

(declare-fun res!986172 () Bool)

(assert (=> b!1456245 (=> (not res!986172) (not e!819575))))

(assert (=> b!1456245 (= res!986172 e!819577)))

(declare-fun c!134550 () Bool)

(assert (=> b!1456245 (= c!134550 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456246 () Bool)

(declare-fun res!986178 () Bool)

(assert (=> b!1456246 (=> (not res!986178) (not e!819573))))

(assert (=> b!1456246 (= res!986178 (validKeyInArray!0 (select (arr!47584 a!2862) i!1006)))))

(assert (= (and start!125256 res!986167) b!1456239))

(assert (= (and b!1456239 res!986173) b!1456246))

(assert (= (and b!1456246 res!986178) b!1456227))

(assert (= (and b!1456227 res!986163) b!1456241))

(assert (= (and b!1456241 res!986169) b!1456240))

(assert (= (and b!1456240 res!986171) b!1456233))

(assert (= (and b!1456233 res!986175) b!1456228))

(assert (= (and b!1456228 res!986164) b!1456231))

(assert (= (and b!1456231 res!986165) b!1456232))

(assert (= (and b!1456232 res!986170) b!1456243))

(assert (= (and b!1456243 res!986166) b!1456245))

(assert (= (and b!1456245 c!134550) b!1456230))

(assert (= (and b!1456245 (not c!134550)) b!1456225))

(assert (= (and b!1456245 res!986172) b!1456234))

(assert (= (and b!1456234 res!986179) b!1456244))

(assert (= (and b!1456244 res!986180) b!1456235))

(assert (= (and b!1456235 res!986177) b!1456236))

(assert (= (and b!1456244 (not res!986174)) b!1456229))

(assert (= (and b!1456229 (not res!986176)) b!1456242))

(assert (= (and b!1456242 (not res!986168)) b!1456237))

(assert (= (and b!1456237 c!134551) b!1456226))

(assert (= (and b!1456237 (not c!134551)) b!1456238))

(declare-fun m!1344625 () Bool)

(assert (=> b!1456246 m!1344625))

(assert (=> b!1456246 m!1344625))

(declare-fun m!1344627 () Bool)

(assert (=> b!1456246 m!1344627))

(declare-fun m!1344629 () Bool)

(assert (=> b!1456244 m!1344629))

(declare-fun m!1344631 () Bool)

(assert (=> b!1456244 m!1344631))

(declare-fun m!1344633 () Bool)

(assert (=> b!1456244 m!1344633))

(declare-fun m!1344635 () Bool)

(assert (=> b!1456244 m!1344635))

(declare-fun m!1344637 () Bool)

(assert (=> b!1456244 m!1344637))

(declare-fun m!1344639 () Bool)

(assert (=> b!1456244 m!1344639))

(assert (=> b!1456232 m!1344639))

(assert (=> b!1456232 m!1344639))

(declare-fun m!1344641 () Bool)

(assert (=> b!1456232 m!1344641))

(declare-fun m!1344643 () Bool)

(assert (=> b!1456241 m!1344643))

(declare-fun m!1344645 () Bool)

(assert (=> b!1456229 m!1344645))

(declare-fun m!1344647 () Bool)

(assert (=> b!1456229 m!1344647))

(declare-fun m!1344649 () Bool)

(assert (=> b!1456229 m!1344649))

(declare-fun m!1344651 () Bool)

(assert (=> b!1456238 m!1344651))

(declare-fun m!1344653 () Bool)

(assert (=> b!1456240 m!1344653))

(declare-fun m!1344655 () Bool)

(assert (=> start!125256 m!1344655))

(declare-fun m!1344657 () Bool)

(assert (=> start!125256 m!1344657))

(assert (=> b!1456235 m!1344639))

(assert (=> b!1456235 m!1344639))

(declare-fun m!1344659 () Bool)

(assert (=> b!1456235 m!1344659))

(assert (=> b!1456231 m!1344639))

(assert (=> b!1456231 m!1344639))

(declare-fun m!1344661 () Bool)

(assert (=> b!1456231 m!1344661))

(assert (=> b!1456231 m!1344661))

(assert (=> b!1456231 m!1344639))

(declare-fun m!1344663 () Bool)

(assert (=> b!1456231 m!1344663))

(assert (=> b!1456228 m!1344631))

(declare-fun m!1344665 () Bool)

(assert (=> b!1456228 m!1344665))

(declare-fun m!1344667 () Bool)

(assert (=> b!1456230 m!1344667))

(assert (=> b!1456236 m!1344631))

(declare-fun m!1344669 () Bool)

(assert (=> b!1456236 m!1344669))

(assert (=> b!1456236 m!1344633))

(assert (=> b!1456236 m!1344635))

(assert (=> b!1456236 m!1344639))

(assert (=> b!1456242 m!1344639))

(assert (=> b!1456242 m!1344639))

(declare-fun m!1344671 () Bool)

(assert (=> b!1456242 m!1344671))

(declare-fun m!1344673 () Bool)

(assert (=> b!1456243 m!1344673))

(assert (=> b!1456243 m!1344673))

(declare-fun m!1344675 () Bool)

(assert (=> b!1456243 m!1344675))

(assert (=> b!1456243 m!1344631))

(declare-fun m!1344677 () Bool)

(assert (=> b!1456243 m!1344677))

(assert (=> b!1456227 m!1344639))

(assert (=> b!1456227 m!1344639))

(declare-fun m!1344679 () Bool)

(assert (=> b!1456227 m!1344679))

(assert (=> b!1456225 m!1344647))

(assert (=> b!1456225 m!1344649))

(declare-fun m!1344681 () Bool)

(assert (=> b!1456226 m!1344681))

(check-sat (not b!1456246) (not b!1456235) (not b!1456230) (not b!1456241) (not b!1456238) (not b!1456231) (not b!1456242) (not b!1456227) (not b!1456232) (not b!1456225) (not b!1456226) (not b!1456244) (not b!1456229) (not start!125256) (not b!1456240) (not b!1456243))
(check-sat)
