; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125068 () Bool)

(assert start!125068)

(declare-fun res!987206 () Bool)

(declare-fun e!819519 () Bool)

(assert (=> start!125068 (=> (not res!987206) (not e!819519))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125068 (= res!987206 (validMask!0 mask!2687))))

(assert (=> start!125068 e!819519))

(assert (=> start!125068 true))

(declare-datatypes ((array!98494 0))(
  ( (array!98495 (arr!47536 (Array (_ BitVec 32) (_ BitVec 64))) (size!48088 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98494)

(declare-fun array_inv!36769 (array!98494) Bool)

(assert (=> start!125068 (array_inv!36769 a!2862)))

(declare-fun b!1456683 () Bool)

(declare-fun res!987220 () Bool)

(assert (=> b!1456683 (=> (not res!987220) (not e!819519))))

(declare-datatypes ((List!34115 0))(
  ( (Nil!34112) (Cons!34111 (h!35461 (_ BitVec 64)) (t!48801 List!34115)) )
))
(declare-fun arrayNoDuplicates!0 (array!98494 (_ BitVec 32) List!34115) Bool)

(assert (=> b!1456683 (= res!987220 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34112))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638242 () array!98494)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!638240 () (_ BitVec 64))

(declare-fun b!1456684 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!819517 () Bool)

(declare-datatypes ((SeekEntryResult!11813 0))(
  ( (MissingZero!11813 (index!49644 (_ BitVec 32))) (Found!11813 (index!49645 (_ BitVec 32))) (Intermediate!11813 (undefined!12625 Bool) (index!49646 (_ BitVec 32)) (x!131265 (_ BitVec 32))) (Undefined!11813) (MissingVacant!11813 (index!49647 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11813)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11813)

(assert (=> b!1456684 (= e!819517 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638240 lt!638242 mask!2687) (seekEntryOrOpen!0 lt!638240 lt!638242 mask!2687)))))

(declare-fun b!1456685 () Bool)

(declare-fun lt!638243 () (_ BitVec 32))

(declare-fun lt!638246 () SeekEntryResult!11813)

(declare-fun e!819520 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98494 (_ BitVec 32)) SeekEntryResult!11813)

(assert (=> b!1456685 (= e!819520 (not (= lt!638246 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638243 lt!638240 lt!638242 mask!2687))))))

(declare-fun b!1456686 () Bool)

(declare-fun e!819521 () Bool)

(declare-fun e!819524 () Bool)

(assert (=> b!1456686 (= e!819521 e!819524)))

(declare-fun res!987210 () Bool)

(assert (=> b!1456686 (=> res!987210 e!819524)))

(assert (=> b!1456686 (= res!987210 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638243 #b00000000000000000000000000000000) (bvsge lt!638243 (size!48088 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456686 (= lt!638243 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638245 () SeekEntryResult!11813)

(assert (=> b!1456686 (= lt!638245 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638240 lt!638242 mask!2687))))

(assert (=> b!1456686 (= lt!638245 (seekEntryOrOpen!0 lt!638240 lt!638242 mask!2687))))

(declare-fun b!1456687 () Bool)

(declare-fun res!987213 () Bool)

(assert (=> b!1456687 (=> (not res!987213) (not e!819519))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456687 (= res!987213 (validKeyInArray!0 (select (arr!47536 a!2862) j!93)))))

(declare-fun b!1456688 () Bool)

(declare-fun e!819523 () Bool)

(declare-fun e!819525 () Bool)

(assert (=> b!1456688 (= e!819523 e!819525)))

(declare-fun res!987219 () Bool)

(assert (=> b!1456688 (=> (not res!987219) (not e!819525))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456688 (= res!987219 (= lt!638246 (Intermediate!11813 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456688 (= lt!638246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638240 mask!2687) lt!638240 lt!638242 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456688 (= lt!638240 (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456689 () Bool)

(declare-fun res!987204 () Bool)

(assert (=> b!1456689 (=> (not res!987204) (not e!819525))))

(assert (=> b!1456689 (= res!987204 e!819517)))

(declare-fun c!134253 () Bool)

(assert (=> b!1456689 (= c!134253 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456690 () Bool)

(declare-fun res!987214 () Bool)

(assert (=> b!1456690 (=> res!987214 e!819524)))

(declare-fun lt!638244 () SeekEntryResult!11813)

(assert (=> b!1456690 (= res!987214 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638243 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!638244)))))

(declare-fun b!1456691 () Bool)

(declare-fun e!819518 () Bool)

(assert (=> b!1456691 (= e!819519 e!819518)))

(declare-fun res!987203 () Bool)

(assert (=> b!1456691 (=> (not res!987203) (not e!819518))))

(assert (=> b!1456691 (= res!987203 (= (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456691 (= lt!638242 (array!98495 (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48088 a!2862)))))

(declare-fun b!1456692 () Bool)

(declare-fun res!987207 () Bool)

(assert (=> b!1456692 (=> (not res!987207) (not e!819519))))

(assert (=> b!1456692 (= res!987207 (and (= (size!48088 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48088 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48088 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456693 () Bool)

(declare-fun res!987216 () Bool)

(declare-fun e!819516 () Bool)

(assert (=> b!1456693 (=> (not res!987216) (not e!819516))))

(assert (=> b!1456693 (= res!987216 (= (seekEntryOrOpen!0 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) (Found!11813 j!93)))))

(declare-fun b!1456694 () Bool)

(declare-fun res!987215 () Bool)

(assert (=> b!1456694 (=> (not res!987215) (not e!819525))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456694 (= res!987215 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456695 () Bool)

(assert (=> b!1456695 (= e!819520 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638243 intermediateAfterIndex!19 lt!638240 lt!638242 mask!2687) lt!638245)))))

(declare-fun b!1456696 () Bool)

(declare-fun res!987218 () Bool)

(assert (=> b!1456696 (=> (not res!987218) (not e!819519))))

(assert (=> b!1456696 (= res!987218 (validKeyInArray!0 (select (arr!47536 a!2862) i!1006)))))

(declare-fun b!1456697 () Bool)

(assert (=> b!1456697 (= e!819525 (not e!819521))))

(declare-fun res!987211 () Bool)

(assert (=> b!1456697 (=> res!987211 e!819521)))

(assert (=> b!1456697 (= res!987211 (or (and (= (select (arr!47536 a!2862) index!646) (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47536 a!2862) index!646) (select (arr!47536 a!2862) j!93))) (= (select (arr!47536 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456697 e!819516))

(declare-fun res!987217 () Bool)

(assert (=> b!1456697 (=> (not res!987217) (not e!819516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98494 (_ BitVec 32)) Bool)

(assert (=> b!1456697 (= res!987217 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48963 0))(
  ( (Unit!48964) )
))
(declare-fun lt!638247 () Unit!48963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48963)

(assert (=> b!1456697 (= lt!638247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456698 () Bool)

(assert (=> b!1456698 (= e!819524 true)))

(declare-fun lt!638241 () Bool)

(assert (=> b!1456698 (= lt!638241 e!819520)))

(declare-fun c!134254 () Bool)

(assert (=> b!1456698 (= c!134254 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456699 () Bool)

(declare-fun res!987209 () Bool)

(assert (=> b!1456699 (=> (not res!987209) (not e!819523))))

(assert (=> b!1456699 (= res!987209 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!638244))))

(declare-fun b!1456700 () Bool)

(assert (=> b!1456700 (= e!819518 e!819523)))

(declare-fun res!987212 () Bool)

(assert (=> b!1456700 (=> (not res!987212) (not e!819523))))

(assert (=> b!1456700 (= res!987212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47536 a!2862) j!93) mask!2687) (select (arr!47536 a!2862) j!93) a!2862 mask!2687) lt!638244))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1456700 (= lt!638244 (Intermediate!11813 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456701 () Bool)

(assert (=> b!1456701 (= e!819517 (= lt!638246 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638240 lt!638242 mask!2687)))))

(declare-fun b!1456702 () Bool)

(declare-fun res!987205 () Bool)

(assert (=> b!1456702 (=> (not res!987205) (not e!819519))))

(assert (=> b!1456702 (= res!987205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456703 () Bool)

(assert (=> b!1456703 (= e!819516 (and (or (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47536 a!2862) intermediateBeforeIndex!19) (select (arr!47536 a!2862) j!93))) (let ((bdg!53287 (select (store (arr!47536 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47536 a!2862) index!646) bdg!53287) (= (select (arr!47536 a!2862) index!646) (select (arr!47536 a!2862) j!93))) (= (select (arr!47536 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53287 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456704 () Bool)

(declare-fun res!987208 () Bool)

(assert (=> b!1456704 (=> (not res!987208) (not e!819519))))

(assert (=> b!1456704 (= res!987208 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48088 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48088 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48088 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125068 res!987206) b!1456692))

(assert (= (and b!1456692 res!987207) b!1456696))

(assert (= (and b!1456696 res!987218) b!1456687))

(assert (= (and b!1456687 res!987213) b!1456702))

(assert (= (and b!1456702 res!987205) b!1456683))

(assert (= (and b!1456683 res!987220) b!1456704))

(assert (= (and b!1456704 res!987208) b!1456691))

(assert (= (and b!1456691 res!987203) b!1456700))

(assert (= (and b!1456700 res!987212) b!1456699))

(assert (= (and b!1456699 res!987209) b!1456688))

(assert (= (and b!1456688 res!987219) b!1456689))

(assert (= (and b!1456689 c!134253) b!1456701))

(assert (= (and b!1456689 (not c!134253)) b!1456684))

(assert (= (and b!1456689 res!987204) b!1456694))

(assert (= (and b!1456694 res!987215) b!1456697))

(assert (= (and b!1456697 res!987217) b!1456693))

(assert (= (and b!1456693 res!987216) b!1456703))

(assert (= (and b!1456697 (not res!987211)) b!1456686))

(assert (= (and b!1456686 (not res!987210)) b!1456690))

(assert (= (and b!1456690 (not res!987214)) b!1456698))

(assert (= (and b!1456698 c!134254) b!1456685))

(assert (= (and b!1456698 (not c!134254)) b!1456695))

(declare-fun m!1344249 () Bool)

(assert (=> b!1456688 m!1344249))

(assert (=> b!1456688 m!1344249))

(declare-fun m!1344251 () Bool)

(assert (=> b!1456688 m!1344251))

(declare-fun m!1344253 () Bool)

(assert (=> b!1456688 m!1344253))

(declare-fun m!1344255 () Bool)

(assert (=> b!1456688 m!1344255))

(declare-fun m!1344257 () Bool)

(assert (=> b!1456702 m!1344257))

(declare-fun m!1344259 () Bool)

(assert (=> b!1456695 m!1344259))

(declare-fun m!1344261 () Bool)

(assert (=> b!1456699 m!1344261))

(assert (=> b!1456699 m!1344261))

(declare-fun m!1344263 () Bool)

(assert (=> b!1456699 m!1344263))

(declare-fun m!1344265 () Bool)

(assert (=> b!1456696 m!1344265))

(assert (=> b!1456696 m!1344265))

(declare-fun m!1344267 () Bool)

(assert (=> b!1456696 m!1344267))

(declare-fun m!1344269 () Bool)

(assert (=> b!1456697 m!1344269))

(assert (=> b!1456697 m!1344253))

(declare-fun m!1344271 () Bool)

(assert (=> b!1456697 m!1344271))

(declare-fun m!1344273 () Bool)

(assert (=> b!1456697 m!1344273))

(declare-fun m!1344275 () Bool)

(assert (=> b!1456697 m!1344275))

(assert (=> b!1456697 m!1344261))

(declare-fun m!1344277 () Bool)

(assert (=> start!125068 m!1344277))

(declare-fun m!1344279 () Bool)

(assert (=> start!125068 m!1344279))

(declare-fun m!1344281 () Bool)

(assert (=> b!1456683 m!1344281))

(assert (=> b!1456687 m!1344261))

(assert (=> b!1456687 m!1344261))

(declare-fun m!1344283 () Bool)

(assert (=> b!1456687 m!1344283))

(assert (=> b!1456691 m!1344253))

(declare-fun m!1344285 () Bool)

(assert (=> b!1456691 m!1344285))

(declare-fun m!1344287 () Bool)

(assert (=> b!1456701 m!1344287))

(declare-fun m!1344289 () Bool)

(assert (=> b!1456686 m!1344289))

(declare-fun m!1344291 () Bool)

(assert (=> b!1456686 m!1344291))

(declare-fun m!1344293 () Bool)

(assert (=> b!1456686 m!1344293))

(assert (=> b!1456690 m!1344261))

(assert (=> b!1456690 m!1344261))

(declare-fun m!1344295 () Bool)

(assert (=> b!1456690 m!1344295))

(declare-fun m!1344297 () Bool)

(assert (=> b!1456685 m!1344297))

(assert (=> b!1456693 m!1344261))

(assert (=> b!1456693 m!1344261))

(declare-fun m!1344299 () Bool)

(assert (=> b!1456693 m!1344299))

(assert (=> b!1456703 m!1344253))

(declare-fun m!1344301 () Bool)

(assert (=> b!1456703 m!1344301))

(assert (=> b!1456703 m!1344271))

(assert (=> b!1456703 m!1344273))

(assert (=> b!1456703 m!1344261))

(assert (=> b!1456684 m!1344291))

(assert (=> b!1456684 m!1344293))

(assert (=> b!1456700 m!1344261))

(assert (=> b!1456700 m!1344261))

(declare-fun m!1344303 () Bool)

(assert (=> b!1456700 m!1344303))

(assert (=> b!1456700 m!1344303))

(assert (=> b!1456700 m!1344261))

(declare-fun m!1344305 () Bool)

(assert (=> b!1456700 m!1344305))

(check-sat (not b!1456702) (not b!1456685) (not b!1456693) (not b!1456686) (not b!1456683) (not b!1456701) (not b!1456688) (not b!1456684) (not b!1456700) (not start!125068) (not b!1456697) (not b!1456699) (not b!1456696) (not b!1456687) (not b!1456695) (not b!1456690))
(check-sat)
