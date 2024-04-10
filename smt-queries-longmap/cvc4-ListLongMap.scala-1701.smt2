; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31146 () Bool)

(assert start!31146)

(declare-fun b!313206 () Bool)

(declare-fun e!195201 () Bool)

(declare-fun e!195202 () Bool)

(assert (=> b!313206 (= e!195201 e!195202)))

(declare-fun res!169522 () Bool)

(assert (=> b!313206 (=> (not res!169522) (not e!195202))))

(declare-datatypes ((array!16003 0))(
  ( (array!16004 (arr!7582 (Array (_ BitVec 32) (_ BitVec 64))) (size!7934 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16003)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2722 0))(
  ( (MissingZero!2722 (index!13064 (_ BitVec 32))) (Found!2722 (index!13065 (_ BitVec 32))) (Intermediate!2722 (undefined!3534 Bool) (index!13066 (_ BitVec 32)) (x!31269 (_ BitVec 32))) (Undefined!2722) (MissingVacant!2722 (index!13067 (_ BitVec 32))) )
))
(declare-fun lt!153459 () SeekEntryResult!2722)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16003 (_ BitVec 32)) SeekEntryResult!2722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313206 (= res!169522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153459))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313206 (= lt!153459 (Intermediate!2722 false resIndex!52 resX!52))))

(declare-fun b!313207 () Bool)

(declare-fun res!169523 () Bool)

(assert (=> b!313207 (=> (not res!169523) (not e!195201))))

(declare-fun arrayContainsKey!0 (array!16003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313207 (= res!169523 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!169521 () Bool)

(assert (=> start!31146 (=> (not res!169521) (not e!195201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31146 (= res!169521 (validMask!0 mask!3709))))

(assert (=> start!31146 e!195201))

(declare-fun array_inv!5545 (array!16003) Bool)

(assert (=> start!31146 (array_inv!5545 a!3293)))

(assert (=> start!31146 true))

(declare-fun b!313208 () Bool)

(declare-fun res!169520 () Bool)

(assert (=> b!313208 (=> (not res!169520) (not e!195202))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313208 (= res!169520 (and (= (select (arr!7582 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7934 a!3293))))))

(declare-fun b!313209 () Bool)

(declare-fun res!169519 () Bool)

(assert (=> b!313209 (=> (not res!169519) (not e!195202))))

(assert (=> b!313209 (= res!169519 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153459))))

(declare-fun b!313210 () Bool)

(declare-fun res!169527 () Bool)

(assert (=> b!313210 (=> (not res!169527) (not e!195201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313210 (= res!169527 (validKeyInArray!0 k!2441))))

(declare-fun b!313211 () Bool)

(declare-fun res!169524 () Bool)

(assert (=> b!313211 (=> (not res!169524) (not e!195201))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16003 (_ BitVec 32)) SeekEntryResult!2722)

(assert (=> b!313211 (= res!169524 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2722 i!1240)))))

(declare-fun b!313212 () Bool)

(declare-fun res!169526 () Bool)

(assert (=> b!313212 (=> (not res!169526) (not e!195201))))

(assert (=> b!313212 (= res!169526 (and (= (size!7934 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7934 a!3293))))))

(declare-fun b!313213 () Bool)

(assert (=> b!313213 (= e!195202 (and (bvslt resX!52 #b01111111111111111111111111111110) (= (select (arr!7582 a!3293) index!1781) k!2441)))))

(declare-fun b!313214 () Bool)

(declare-fun res!169525 () Bool)

(assert (=> b!313214 (=> (not res!169525) (not e!195201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16003 (_ BitVec 32)) Bool)

(assert (=> b!313214 (= res!169525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31146 res!169521) b!313212))

(assert (= (and b!313212 res!169526) b!313210))

(assert (= (and b!313210 res!169527) b!313207))

(assert (= (and b!313207 res!169523) b!313211))

(assert (= (and b!313211 res!169524) b!313214))

(assert (= (and b!313214 res!169525) b!313206))

(assert (= (and b!313206 res!169522) b!313208))

(assert (= (and b!313208 res!169520) b!313209))

(assert (= (and b!313209 res!169519) b!313213))

(declare-fun m!323221 () Bool)

(assert (=> start!31146 m!323221))

(declare-fun m!323223 () Bool)

(assert (=> start!31146 m!323223))

(declare-fun m!323225 () Bool)

(assert (=> b!313214 m!323225))

(declare-fun m!323227 () Bool)

(assert (=> b!313207 m!323227))

(declare-fun m!323229 () Bool)

(assert (=> b!313206 m!323229))

(assert (=> b!313206 m!323229))

(declare-fun m!323231 () Bool)

(assert (=> b!313206 m!323231))

(declare-fun m!323233 () Bool)

(assert (=> b!313210 m!323233))

(declare-fun m!323235 () Bool)

(assert (=> b!313211 m!323235))

(declare-fun m!323237 () Bool)

(assert (=> b!313213 m!323237))

(declare-fun m!323239 () Bool)

(assert (=> b!313209 m!323239))

(declare-fun m!323241 () Bool)

(assert (=> b!313208 m!323241))

(push 1)

(assert (not b!313206))

(assert (not b!313210))

(assert (not start!31146))

(assert (not b!313209))

(assert (not b!313207))

(assert (not b!313214))

(assert (not b!313211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68537 () Bool)

(declare-fun res!169532 () Bool)

(declare-fun e!195207 () Bool)

(assert (=> d!68537 (=> res!169532 e!195207)))

(assert (=> d!68537 (= res!169532 (= (select (arr!7582 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68537 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195207)))

(declare-fun b!313219 () Bool)

(declare-fun e!195208 () Bool)

(assert (=> b!313219 (= e!195207 e!195208)))

(declare-fun res!169533 () Bool)

(assert (=> b!313219 (=> (not res!169533) (not e!195208))))

(assert (=> b!313219 (= res!169533 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7934 a!3293)))))

(declare-fun b!313220 () Bool)

(assert (=> b!313220 (= e!195208 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68537 (not res!169532)) b!313219))

(assert (= (and b!313219 res!169533) b!313220))

(declare-fun m!323243 () Bool)

(assert (=> d!68537 m!323243))

(declare-fun m!323245 () Bool)

(assert (=> b!313220 m!323245))

(assert (=> b!313207 d!68537))

(declare-fun d!68543 () Bool)

(assert (=> d!68543 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31146 d!68543))

(declare-fun d!68547 () Bool)

(assert (=> d!68547 (= (array_inv!5545 a!3293) (bvsge (size!7934 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31146 d!68547))

(declare-fun b!313323 () Bool)

(declare-fun e!195271 () SeekEntryResult!2722)

(declare-fun e!195269 () SeekEntryResult!2722)

(assert (=> b!313323 (= e!195271 e!195269)))

(declare-fun c!49488 () Bool)

(declare-fun lt!153495 () (_ BitVec 64))

(assert (=> b!313323 (= c!49488 (or (= lt!153495 k!2441) (= (bvadd lt!153495 lt!153495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313324 () Bool)

(assert (=> b!313324 (= e!195271 (Intermediate!2722 true index!1781 x!1427))))

(declare-fun b!313325 () Bool)

(declare-fun lt!153494 () SeekEntryResult!2722)

(assert (=> b!313325 (and (bvsge (index!13066 lt!153494) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153494) (size!7934 a!3293)))))

(declare-fun res!169564 () Bool)

(assert (=> b!313325 (= res!169564 (= (select (arr!7582 a!3293) (index!13066 lt!153494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195270 () Bool)

(assert (=> b!313325 (=> res!169564 e!195270)))

(declare-fun b!313326 () Bool)

(declare-fun e!195267 () Bool)

(declare-fun e!195268 () Bool)

(assert (=> b!313326 (= e!195267 e!195268)))

(declare-fun res!169566 () Bool)

(assert (=> b!313326 (= res!169566 (and (is-Intermediate!2722 lt!153494) (not (undefined!3534 lt!153494)) (bvslt (x!31269 lt!153494) #b01111111111111111111111111111110) (bvsge (x!31269 lt!153494) #b00000000000000000000000000000000) (bvsge (x!31269 lt!153494) x!1427)))))

(assert (=> b!313326 (=> (not res!169566) (not e!195268))))

(declare-fun b!313327 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313327 (= e!195269 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313328 () Bool)

(assert (=> b!313328 (and (bvsge (index!13066 lt!153494) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153494) (size!7934 a!3293)))))

(assert (=> b!313328 (= e!195270 (= (select (arr!7582 a!3293) (index!13066 lt!153494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313329 () Bool)

(assert (=> b!313329 (= e!195269 (Intermediate!2722 false index!1781 x!1427))))

(declare-fun b!313330 () Bool)

(assert (=> b!313330 (= e!195267 (bvsge (x!31269 lt!153494) #b01111111111111111111111111111110))))

(declare-fun d!68551 () Bool)

(assert (=> d!68551 e!195267))

(declare-fun c!49487 () Bool)

(assert (=> d!68551 (= c!49487 (and (is-Intermediate!2722 lt!153494) (undefined!3534 lt!153494)))))

(assert (=> d!68551 (= lt!153494 e!195271)))

(declare-fun c!49486 () Bool)

(assert (=> d!68551 (= c!49486 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68551 (= lt!153495 (select (arr!7582 a!3293) index!1781))))

(assert (=> d!68551 (validMask!0 mask!3709)))

(assert (=> d!68551 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153494)))

(declare-fun b!313331 () Bool)

(assert (=> b!313331 (and (bvsge (index!13066 lt!153494) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153494) (size!7934 a!3293)))))

(declare-fun res!169565 () Bool)

(assert (=> b!313331 (= res!169565 (= (select (arr!7582 a!3293) (index!13066 lt!153494)) k!2441))))

(assert (=> b!313331 (=> res!169565 e!195270)))

(assert (=> b!313331 (= e!195268 e!195270)))

(assert (= (and d!68551 c!49486) b!313324))

(assert (= (and d!68551 (not c!49486)) b!313323))

(assert (= (and b!313323 c!49488) b!313329))

(assert (= (and b!313323 (not c!49488)) b!313327))

(assert (= (and d!68551 c!49487) b!313330))

(assert (= (and d!68551 (not c!49487)) b!313326))

(assert (= (and b!313326 res!169566) b!313331))

(assert (= (and b!313331 (not res!169565)) b!313325))

(assert (= (and b!313325 (not res!169564)) b!313328))

(declare-fun m!323281 () Bool)

(assert (=> b!313327 m!323281))

(assert (=> b!313327 m!323281))

(declare-fun m!323283 () Bool)

(assert (=> b!313327 m!323283))

(declare-fun m!323285 () Bool)

(assert (=> b!313331 m!323285))

(assert (=> b!313325 m!323285))

(assert (=> d!68551 m!323237))

(assert (=> d!68551 m!323221))

(assert (=> b!313328 m!323285))

(assert (=> b!313209 d!68551))

(declare-fun b!313364 () Bool)

(declare-fun e!195296 () Bool)

(declare-fun e!195294 () Bool)

(assert (=> b!313364 (= e!195296 e!195294)))

(declare-fun c!49497 () Bool)

(assert (=> b!313364 (= c!49497 (validKeyInArray!0 (select (arr!7582 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313365 () Bool)

(declare-fun call!25942 () Bool)

(assert (=> b!313365 (= e!195294 call!25942)))

(declare-fun b!313366 () Bool)

(declare-fun e!195295 () Bool)

(assert (=> b!313366 (= e!195295 call!25942)))

(declare-fun d!68557 () Bool)

(declare-fun res!169585 () Bool)

(assert (=> d!68557 (=> res!169585 e!195296)))

(assert (=> d!68557 (= res!169585 (bvsge #b00000000000000000000000000000000 (size!7934 a!3293)))))

(assert (=> d!68557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195296)))

(declare-fun b!313367 () Bool)

(assert (=> b!313367 (= e!195294 e!195295)))

(declare-fun lt!153518 () (_ BitVec 64))

(assert (=> b!313367 (= lt!153518 (select (arr!7582 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9675 0))(
  ( (Unit!9676) )
))
(declare-fun lt!153520 () Unit!9675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16003 (_ BitVec 64) (_ BitVec 32)) Unit!9675)

(assert (=> b!313367 (= lt!153520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153518 #b00000000000000000000000000000000))))

(assert (=> b!313367 (arrayContainsKey!0 a!3293 lt!153518 #b00000000000000000000000000000000)))

(declare-fun lt!153519 () Unit!9675)

(assert (=> b!313367 (= lt!153519 lt!153520)))

(declare-fun res!169586 () Bool)

(assert (=> b!313367 (= res!169586 (= (seekEntryOrOpen!0 (select (arr!7582 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2722 #b00000000000000000000000000000000)))))

(assert (=> b!313367 (=> (not res!169586) (not e!195295))))

(declare-fun bm!25939 () Bool)

(assert (=> bm!25939 (= call!25942 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68557 (not res!169585)) b!313364))

(assert (= (and b!313364 c!49497) b!313367))

(assert (= (and b!313364 (not c!49497)) b!313365))

(assert (= (and b!313367 res!169586) b!313366))

(assert (= (or b!313366 b!313365) bm!25939))

(assert (=> b!313364 m!323243))

(assert (=> b!313364 m!323243))

(declare-fun m!323305 () Bool)

(assert (=> b!313364 m!323305))

(assert (=> b!313367 m!323243))

(declare-fun m!323307 () Bool)

(assert (=> b!313367 m!323307))

(declare-fun m!323309 () Bool)

(assert (=> b!313367 m!323309))

(assert (=> b!313367 m!323243))

(declare-fun m!323311 () Bool)

(assert (=> b!313367 m!323311))

(declare-fun m!323313 () Bool)

(assert (=> bm!25939 m!323313))

(assert (=> b!313214 d!68557))

(declare-fun d!68569 () Bool)

(assert (=> d!68569 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313210 d!68569))

(declare-fun b!313368 () Bool)

(declare-fun e!195301 () SeekEntryResult!2722)

(declare-fun e!195299 () SeekEntryResult!2722)

(assert (=> b!313368 (= e!195301 e!195299)))

(declare-fun c!49500 () Bool)

(declare-fun lt!153522 () (_ BitVec 64))

(assert (=> b!313368 (= c!49500 (or (= lt!153522 k!2441) (= (bvadd lt!153522 lt!153522) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313369 () Bool)

(assert (=> b!313369 (= e!195301 (Intermediate!2722 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313370 () Bool)

(declare-fun lt!153521 () SeekEntryResult!2722)

(assert (=> b!313370 (and (bvsge (index!13066 lt!153521) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153521) (size!7934 a!3293)))))

(declare-fun res!169587 () Bool)

(assert (=> b!313370 (= res!169587 (= (select (arr!7582 a!3293) (index!13066 lt!153521)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195300 () Bool)

(assert (=> b!313370 (=> res!169587 e!195300)))

(declare-fun b!313371 () Bool)

(declare-fun e!195297 () Bool)

(declare-fun e!195298 () Bool)

(assert (=> b!313371 (= e!195297 e!195298)))

(declare-fun res!169589 () Bool)

(assert (=> b!313371 (= res!169589 (and (is-Intermediate!2722 lt!153521) (not (undefined!3534 lt!153521)) (bvslt (x!31269 lt!153521) #b01111111111111111111111111111110) (bvsge (x!31269 lt!153521) #b00000000000000000000000000000000) (bvsge (x!31269 lt!153521) #b00000000000000000000000000000000)))))

(assert (=> b!313371 (=> (not res!169589) (not e!195298))))

(declare-fun b!313372 () Bool)

(assert (=> b!313372 (= e!195299 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313373 () Bool)

(assert (=> b!313373 (and (bvsge (index!13066 lt!153521) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153521) (size!7934 a!3293)))))

(assert (=> b!313373 (= e!195300 (= (select (arr!7582 a!3293) (index!13066 lt!153521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313374 () Bool)

(assert (=> b!313374 (= e!195299 (Intermediate!2722 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313375 () Bool)

(assert (=> b!313375 (= e!195297 (bvsge (x!31269 lt!153521) #b01111111111111111111111111111110))))

(declare-fun d!68571 () Bool)

(assert (=> d!68571 e!195297))

(declare-fun c!49499 () Bool)

(assert (=> d!68571 (= c!49499 (and (is-Intermediate!2722 lt!153521) (undefined!3534 lt!153521)))))

(assert (=> d!68571 (= lt!153521 e!195301)))

(declare-fun c!49498 () Bool)

(assert (=> d!68571 (= c!49498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68571 (= lt!153522 (select (arr!7582 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68571 (validMask!0 mask!3709)))

(assert (=> d!68571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153521)))

(declare-fun b!313376 () Bool)

(assert (=> b!313376 (and (bvsge (index!13066 lt!153521) #b00000000000000000000000000000000) (bvslt (index!13066 lt!153521) (size!7934 a!3293)))))

(declare-fun res!169588 () Bool)

(assert (=> b!313376 (= res!169588 (= (select (arr!7582 a!3293) (index!13066 lt!153521)) k!2441))))

(assert (=> b!313376 (=> res!169588 e!195300)))

(assert (=> b!313376 (= e!195298 e!195300)))

(assert (= (and d!68571 c!49498) b!313369))

(assert (= (and d!68571 (not c!49498)) b!313368))

(assert (= (and b!313368 c!49500) b!313374))

(assert (= (and b!313368 (not c!49500)) b!313372))

(assert (= (and d!68571 c!49499) b!313375))

(assert (= (and d!68571 (not c!49499)) b!313371))

(assert (= (and b!313371 res!169589) b!313376))

(assert (= (and b!313376 (not res!169588)) b!313370))

(assert (= (and b!313370 (not res!169587)) b!313373))

(assert (=> b!313372 m!323229))

(declare-fun m!323315 () Bool)

(assert (=> b!313372 m!323315))

(assert (=> b!313372 m!323315))

(declare-fun m!323317 () Bool)

(assert (=> b!313372 m!323317))

(declare-fun m!323319 () Bool)

(assert (=> b!313376 m!323319))

(assert (=> b!313370 m!323319))

(assert (=> d!68571 m!323229))

(declare-fun m!323321 () Bool)

(assert (=> d!68571 m!323321))

(assert (=> d!68571 m!323221))

(assert (=> b!313373 m!323319))

(assert (=> b!313206 d!68571))

(declare-fun d!68573 () Bool)

(declare-fun lt!153537 () (_ BitVec 32))

(declare-fun lt!153536 () (_ BitVec 32))

(assert (=> d!68573 (= lt!153537 (bvmul (bvxor lt!153536 (bvlshr lt!153536 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68573 (= lt!153536 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68573 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169594 (let ((h!5351 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31275 (bvmul (bvxor h!5351 (bvlshr h!5351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31275 (bvlshr x!31275 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169594 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169594 #b00000000000000000000000000000000))))))

(assert (=> d!68573 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153537 (bvlshr lt!153537 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313206 d!68573))

(declare-fun b!313425 () Bool)

(declare-fun e!195334 () SeekEntryResult!2722)

(assert (=> b!313425 (= e!195334 Undefined!2722)))

(declare-fun e!195332 () SeekEntryResult!2722)

(declare-fun lt!153554 () SeekEntryResult!2722)

(declare-fun b!313427 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16003 (_ BitVec 32)) SeekEntryResult!2722)

(assert (=> b!313427 (= e!195332 (seekKeyOrZeroReturnVacant!0 (x!31269 lt!153554) (index!13066 lt!153554) (index!13066 lt!153554) k!2441 a!3293 mask!3709))))

(declare-fun b!313428 () Bool)

(declare-fun c!49521 () Bool)

(declare-fun lt!153553 () (_ BitVec 64))

(assert (=> b!313428 (= c!49521 (= lt!153553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195333 () SeekEntryResult!2722)

(assert (=> b!313428 (= e!195333 e!195332)))

(declare-fun b!313429 () Bool)

(assert (=> b!313429 (= e!195334 e!195333)))

(assert (=> b!313429 (= lt!153553 (select (arr!7582 a!3293) (index!13066 lt!153554)))))

(declare-fun c!49519 () Bool)

(assert (=> b!313429 (= c!49519 (= lt!153553 k!2441))))

(declare-fun b!313430 () Bool)

(assert (=> b!313430 (= e!195332 (MissingZero!2722 (index!13066 lt!153554)))))

(declare-fun b!313426 () Bool)

(assert (=> b!313426 (= e!195333 (Found!2722 (index!13066 lt!153554)))))

(declare-fun d!68577 () Bool)

(declare-fun lt!153555 () SeekEntryResult!2722)

(assert (=> d!68577 (and (or (is-Undefined!2722 lt!153555) (not (is-Found!2722 lt!153555)) (and (bvsge (index!13065 lt!153555) #b00000000000000000000000000000000) (bvslt (index!13065 lt!153555) (size!7934 a!3293)))) (or (is-Undefined!2722 lt!153555) (is-Found!2722 lt!153555) (not (is-MissingZero!2722 lt!153555)) (and (bvsge (index!13064 lt!153555) #b00000000000000000000000000000000) (bvslt (index!13064 lt!153555) (size!7934 a!3293)))) (or (is-Undefined!2722 lt!153555) (is-Found!2722 lt!153555) (is-MissingZero!2722 lt!153555) (not (is-MissingVacant!2722 lt!153555)) (and (bvsge (index!13067 lt!153555) #b00000000000000000000000000000000) (bvslt (index!13067 lt!153555) (size!7934 a!3293)))) (or (is-Undefined!2722 lt!153555) (ite (is-Found!2722 lt!153555) (= (select (arr!7582 a!3293) (index!13065 lt!153555)) k!2441) (ite (is-MissingZero!2722 lt!153555) (= (select (arr!7582 a!3293) (index!13064 lt!153555)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2722 lt!153555) (= (select (arr!7582 a!3293) (index!13067 lt!153555)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68577 (= lt!153555 e!195334)))

