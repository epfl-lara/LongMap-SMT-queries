; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130950 () Bool)

(assert start!130950)

(declare-fun b!1534690 () Bool)

(declare-fun res!1050347 () Bool)

(declare-fun e!855222 () Bool)

(assert (=> b!1534690 (=> (not res!1050347) (not e!855222))))

(declare-datatypes ((array!101866 0))(
  ( (array!101867 (arr!49147 (Array (_ BitVec 32) (_ BitVec 64))) (size!49698 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101866)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101866 (_ BitVec 32)) Bool)

(assert (=> b!1534690 (= res!1050347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534691 () Bool)

(declare-fun res!1050345 () Bool)

(assert (=> b!1534691 (=> (not res!1050345) (not e!855222))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534691 (= res!1050345 (and (= (size!49698 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49698 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49698 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534692 () Bool)

(declare-fun res!1050344 () Bool)

(assert (=> b!1534692 (=> (not res!1050344) (not e!855222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534692 (= res!1050344 (validKeyInArray!0 (select (arr!49147 a!2792) i!951)))))

(declare-fun b!1534693 () Bool)

(assert (=> b!1534693 (= e!855222 (and (bvsle #b00000000000000000000000000000000 (size!49698 a!2792)) (bvsge (size!49698 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1534694 () Bool)

(declare-fun res!1050346 () Bool)

(assert (=> b!1534694 (=> (not res!1050346) (not e!855222))))

(assert (=> b!1534694 (= res!1050346 (validKeyInArray!0 (select (arr!49147 a!2792) j!64)))))

(declare-fun res!1050348 () Bool)

(assert (=> start!130950 (=> (not res!1050348) (not e!855222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130950 (= res!1050348 (validMask!0 mask!2480))))

(assert (=> start!130950 e!855222))

(assert (=> start!130950 true))

(declare-fun array_inv!38428 (array!101866) Bool)

(assert (=> start!130950 (array_inv!38428 a!2792)))

(assert (= (and start!130950 res!1050348) b!1534691))

(assert (= (and b!1534691 res!1050345) b!1534692))

(assert (= (and b!1534692 res!1050344) b!1534694))

(assert (= (and b!1534694 res!1050346) b!1534690))

(assert (= (and b!1534690 res!1050347) b!1534693))

(declare-fun m!1417285 () Bool)

(assert (=> b!1534690 m!1417285))

(declare-fun m!1417287 () Bool)

(assert (=> b!1534692 m!1417287))

(assert (=> b!1534692 m!1417287))

(declare-fun m!1417289 () Bool)

(assert (=> b!1534692 m!1417289))

(declare-fun m!1417291 () Bool)

(assert (=> b!1534694 m!1417291))

(assert (=> b!1534694 m!1417291))

(declare-fun m!1417293 () Bool)

(assert (=> b!1534694 m!1417293))

(declare-fun m!1417295 () Bool)

(assert (=> start!130950 m!1417295))

(declare-fun m!1417297 () Bool)

(assert (=> start!130950 m!1417297))

(check-sat (not b!1534694) (not b!1534692) (not b!1534690) (not start!130950))
(check-sat)
(get-model)

(declare-fun d!160709 () Bool)

(assert (=> d!160709 (= (validKeyInArray!0 (select (arr!49147 a!2792) j!64)) (and (not (= (select (arr!49147 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49147 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534694 d!160709))

(declare-fun d!160711 () Bool)

(assert (=> d!160711 (= (validKeyInArray!0 (select (arr!49147 a!2792) i!951)) (and (not (= (select (arr!49147 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49147 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1534692 d!160711))

(declare-fun b!1534733 () Bool)

(declare-fun e!855242 () Bool)

(declare-fun call!68688 () Bool)

(assert (=> b!1534733 (= e!855242 call!68688)))

(declare-fun b!1534734 () Bool)

(declare-fun e!855243 () Bool)

(assert (=> b!1534734 (= e!855242 e!855243)))

(declare-fun lt!664521 () (_ BitVec 64))

(assert (=> b!1534734 (= lt!664521 (select (arr!49147 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51217 0))(
  ( (Unit!51218) )
))
(declare-fun lt!664520 () Unit!51217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101866 (_ BitVec 64) (_ BitVec 32)) Unit!51217)

(assert (=> b!1534734 (= lt!664520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664521 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1534734 (arrayContainsKey!0 a!2792 lt!664521 #b00000000000000000000000000000000)))

(declare-fun lt!664519 () Unit!51217)

(assert (=> b!1534734 (= lt!664519 lt!664520)))

(declare-fun res!1050384 () Bool)

(declare-datatypes ((SeekEntryResult!13199 0))(
  ( (MissingZero!13199 (index!55191 (_ BitVec 32))) (Found!13199 (index!55192 (_ BitVec 32))) (Intermediate!13199 (undefined!14011 Bool) (index!55193 (_ BitVec 32)) (x!137112 (_ BitVec 32))) (Undefined!13199) (MissingVacant!13199 (index!55194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101866 (_ BitVec 32)) SeekEntryResult!13199)

(assert (=> b!1534734 (= res!1050384 (= (seekEntryOrOpen!0 (select (arr!49147 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13199 #b00000000000000000000000000000000)))))

(assert (=> b!1534734 (=> (not res!1050384) (not e!855243))))

(declare-fun b!1534735 () Bool)

(assert (=> b!1534735 (= e!855243 call!68688)))

(declare-fun d!160713 () Bool)

(declare-fun res!1050383 () Bool)

(declare-fun e!855244 () Bool)

(assert (=> d!160713 (=> res!1050383 e!855244)))

(assert (=> d!160713 (= res!1050383 (bvsge #b00000000000000000000000000000000 (size!49698 a!2792)))))

(assert (=> d!160713 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855244)))

(declare-fun b!1534736 () Bool)

(assert (=> b!1534736 (= e!855244 e!855242)))

(declare-fun c!141745 () Bool)

(assert (=> b!1534736 (= c!141745 (validKeyInArray!0 (select (arr!49147 a!2792) #b00000000000000000000000000000000)))))

(declare-fun bm!68685 () Bool)

(assert (=> bm!68685 (= call!68688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160713 (not res!1050383)) b!1534736))

(assert (= (and b!1534736 c!141745) b!1534734))

(assert (= (and b!1534736 (not c!141745)) b!1534733))

(assert (= (and b!1534734 res!1050384) b!1534735))

(assert (= (or b!1534735 b!1534733) bm!68685))

(declare-fun m!1417327 () Bool)

(assert (=> b!1534734 m!1417327))

(declare-fun m!1417329 () Bool)

(assert (=> b!1534734 m!1417329))

(declare-fun m!1417331 () Bool)

(assert (=> b!1534734 m!1417331))

(assert (=> b!1534734 m!1417327))

(declare-fun m!1417333 () Bool)

(assert (=> b!1534734 m!1417333))

(assert (=> b!1534736 m!1417327))

(assert (=> b!1534736 m!1417327))

(declare-fun m!1417335 () Bool)

(assert (=> b!1534736 m!1417335))

(declare-fun m!1417337 () Bool)

(assert (=> bm!68685 m!1417337))

(assert (=> b!1534690 d!160713))

(declare-fun d!160725 () Bool)

(assert (=> d!160725 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130950 d!160725))

(declare-fun d!160735 () Bool)

(assert (=> d!160735 (= (array_inv!38428 a!2792) (bvsge (size!49698 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130950 d!160735))

(check-sat (not bm!68685) (not b!1534736) (not b!1534734))
(check-sat)
