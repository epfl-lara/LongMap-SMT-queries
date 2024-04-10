; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130960 () Bool)

(assert start!130960)

(declare-fun b!1536265 () Bool)

(declare-fun e!855099 () Bool)

(declare-fun e!855100 () Bool)

(assert (=> b!1536265 (= e!855099 e!855100)))

(declare-fun res!1053357 () Bool)

(assert (=> b!1536265 (=> (not res!1053357) (not e!855100))))

(declare-datatypes ((SeekEntryResult!13377 0))(
  ( (MissingZero!13377 (index!55903 (_ BitVec 32))) (Found!13377 (index!55904 (_ BitVec 32))) (Intermediate!13377 (undefined!14189 Bool) (index!55905 (_ BitVec 32)) (x!137643 (_ BitVec 32))) (Undefined!13377) (MissingVacant!13377 (index!55906 (_ BitVec 32))) )
))
(declare-fun lt!664284 () SeekEntryResult!13377)

(declare-fun lt!664283 () SeekEntryResult!13377)

(assert (=> b!1536265 (= res!1053357 (= lt!664284 lt!664283))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102058 0))(
  ( (array!102059 (arr!49245 (Array (_ BitVec 32) (_ BitVec 64))) (size!49795 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102058)

(declare-fun lt!664285 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102058 (_ BitVec 32)) SeekEntryResult!13377)

(assert (=> b!1536265 (= lt!664284 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664285 vacantIndex!5 (select (arr!49245 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536266 () Bool)

(declare-fun res!1053356 () Bool)

(declare-fun e!855102 () Bool)

(assert (=> b!1536266 (=> (not res!1053356) (not e!855102))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536266 (= res!1053356 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49795 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49795 a!2792)) (= (select (arr!49245 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536267 () Bool)

(declare-fun res!1053359 () Bool)

(assert (=> b!1536267 (=> (not res!1053359) (not e!855102))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536267 (= res!1053359 (validKeyInArray!0 (select (arr!49245 a!2792) i!951)))))

(declare-fun b!1536268 () Bool)

(declare-fun e!855103 () Bool)

(assert (=> b!1536268 (= e!855102 e!855103)))

(declare-fun res!1053352 () Bool)

(assert (=> b!1536268 (=> (not res!1053352) (not e!855103))))

(assert (=> b!1536268 (= res!1053352 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49245 a!2792) j!64) a!2792 mask!2480) lt!664283))))

(assert (=> b!1536268 (= lt!664283 (Found!13377 j!64))))

(declare-fun b!1536269 () Bool)

(assert (=> b!1536269 (= e!855103 e!855099)))

(declare-fun res!1053354 () Bool)

(assert (=> b!1536269 (=> (not res!1053354) (not e!855099))))

(assert (=> b!1536269 (= res!1053354 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664285 #b00000000000000000000000000000000) (bvslt lt!664285 (size!49795 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536269 (= lt!664285 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536270 () Bool)

(declare-fun res!1053358 () Bool)

(assert (=> b!1536270 (=> (not res!1053358) (not e!855102))))

(assert (=> b!1536270 (= res!1053358 (and (= (size!49795 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49795 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49795 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536272 () Bool)

(assert (=> b!1536272 (= e!855100 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1536272 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664285 vacantIndex!5 (select (store (arr!49245 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102059 (store (arr!49245 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49795 a!2792)) mask!2480) lt!664284)))

(declare-datatypes ((Unit!51326 0))(
  ( (Unit!51327) )
))
(declare-fun lt!664282 () Unit!51326)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51326)

(assert (=> b!1536272 (= lt!664282 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664285 vacantIndex!5 mask!2480))))

(declare-fun b!1536273 () Bool)

(declare-fun res!1053355 () Bool)

(assert (=> b!1536273 (=> (not res!1053355) (not e!855103))))

(assert (=> b!1536273 (= res!1053355 (not (= (select (arr!49245 a!2792) index!463) (select (arr!49245 a!2792) j!64))))))

(declare-fun b!1536274 () Bool)

(declare-fun res!1053351 () Bool)

(assert (=> b!1536274 (=> (not res!1053351) (not e!855102))))

(declare-datatypes ((List!35719 0))(
  ( (Nil!35716) (Cons!35715 (h!37160 (_ BitVec 64)) (t!50413 List!35719)) )
))
(declare-fun arrayNoDuplicates!0 (array!102058 (_ BitVec 32) List!35719) Bool)

(assert (=> b!1536274 (= res!1053351 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35716))))

(declare-fun b!1536275 () Bool)

(declare-fun res!1053361 () Bool)

(assert (=> b!1536275 (=> (not res!1053361) (not e!855102))))

(assert (=> b!1536275 (= res!1053361 (validKeyInArray!0 (select (arr!49245 a!2792) j!64)))))

(declare-fun res!1053360 () Bool)

(assert (=> start!130960 (=> (not res!1053360) (not e!855102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130960 (= res!1053360 (validMask!0 mask!2480))))

(assert (=> start!130960 e!855102))

(assert (=> start!130960 true))

(declare-fun array_inv!38273 (array!102058) Bool)

(assert (=> start!130960 (array_inv!38273 a!2792)))

(declare-fun b!1536271 () Bool)

(declare-fun res!1053353 () Bool)

(assert (=> b!1536271 (=> (not res!1053353) (not e!855102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102058 (_ BitVec 32)) Bool)

(assert (=> b!1536271 (= res!1053353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130960 res!1053360) b!1536270))

(assert (= (and b!1536270 res!1053358) b!1536267))

(assert (= (and b!1536267 res!1053359) b!1536275))

(assert (= (and b!1536275 res!1053361) b!1536271))

(assert (= (and b!1536271 res!1053353) b!1536274))

(assert (= (and b!1536274 res!1053351) b!1536266))

(assert (= (and b!1536266 res!1053356) b!1536268))

(assert (= (and b!1536268 res!1053352) b!1536273))

(assert (= (and b!1536273 res!1053355) b!1536269))

(assert (= (and b!1536269 res!1053354) b!1536265))

(assert (= (and b!1536265 res!1053357) b!1536272))

(declare-fun m!1418725 () Bool)

(assert (=> b!1536269 m!1418725))

(declare-fun m!1418727 () Bool)

(assert (=> b!1536274 m!1418727))

(declare-fun m!1418729 () Bool)

(assert (=> b!1536266 m!1418729))

(declare-fun m!1418731 () Bool)

(assert (=> b!1536272 m!1418731))

(declare-fun m!1418733 () Bool)

(assert (=> b!1536272 m!1418733))

(assert (=> b!1536272 m!1418733))

(declare-fun m!1418735 () Bool)

(assert (=> b!1536272 m!1418735))

(declare-fun m!1418737 () Bool)

(assert (=> b!1536272 m!1418737))

(declare-fun m!1418739 () Bool)

(assert (=> b!1536265 m!1418739))

(assert (=> b!1536265 m!1418739))

(declare-fun m!1418741 () Bool)

(assert (=> b!1536265 m!1418741))

(assert (=> b!1536275 m!1418739))

(assert (=> b!1536275 m!1418739))

(declare-fun m!1418743 () Bool)

(assert (=> b!1536275 m!1418743))

(declare-fun m!1418745 () Bool)

(assert (=> b!1536267 m!1418745))

(assert (=> b!1536267 m!1418745))

(declare-fun m!1418747 () Bool)

(assert (=> b!1536267 m!1418747))

(declare-fun m!1418749 () Bool)

(assert (=> b!1536273 m!1418749))

(assert (=> b!1536273 m!1418739))

(declare-fun m!1418751 () Bool)

(assert (=> b!1536271 m!1418751))

(assert (=> b!1536268 m!1418739))

(assert (=> b!1536268 m!1418739))

(declare-fun m!1418753 () Bool)

(assert (=> b!1536268 m!1418753))

(declare-fun m!1418755 () Bool)

(assert (=> start!130960 m!1418755))

(declare-fun m!1418757 () Bool)

(assert (=> start!130960 m!1418757))

(check-sat (not b!1536271) (not b!1536272) (not b!1536268) (not b!1536274) (not b!1536265) (not b!1536267) (not b!1536269) (not b!1536275) (not start!130960))
(check-sat)
