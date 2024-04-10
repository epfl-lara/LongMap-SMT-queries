; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44882 () Bool)

(assert start!44882)

(declare-fun b!492530 () Bool)

(declare-fun res!295288 () Bool)

(declare-fun e!289323 () Bool)

(assert (=> b!492530 (=> (not res!295288) (not e!289323))))

(declare-datatypes ((array!31884 0))(
  ( (array!31885 (arr!15328 (Array (_ BitVec 32) (_ BitVec 64))) (size!15692 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31884)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31884 (_ BitVec 32)) Bool)

(assert (=> b!492530 (= res!295288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492531 () Bool)

(declare-fun res!295287 () Bool)

(declare-fun e!289322 () Bool)

(assert (=> b!492531 (=> (not res!295287) (not e!289322))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492531 (= res!295287 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492532 () Bool)

(declare-fun e!289319 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3795 0))(
  ( (MissingZero!3795 (index!17359 (_ BitVec 32))) (Found!3795 (index!17360 (_ BitVec 32))) (Intermediate!3795 (undefined!4607 Bool) (index!17361 (_ BitVec 32)) (x!46443 (_ BitVec 32))) (Undefined!3795) (MissingVacant!3795 (index!17362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31884 (_ BitVec 32)) SeekEntryResult!3795)

(assert (=> b!492532 (= e!289319 (= (seekEntryOrOpen!0 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) (Found!3795 j!176)))))

(declare-fun res!295290 () Bool)

(assert (=> start!44882 (=> (not res!295290) (not e!289322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44882 (= res!295290 (validMask!0 mask!3524))))

(assert (=> start!44882 e!289322))

(assert (=> start!44882 true))

(declare-fun array_inv!11124 (array!31884) Bool)

(assert (=> start!44882 (array_inv!11124 a!3235)))

(declare-fun b!492533 () Bool)

(declare-fun e!289321 () Bool)

(assert (=> b!492533 (= e!289323 (not e!289321))))

(declare-fun res!295284 () Bool)

(assert (=> b!492533 (=> res!295284 e!289321)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!222667 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31884 (_ BitVec 32)) SeekEntryResult!3795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492533 (= res!295284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222667 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)) mask!3524)))))

(assert (=> b!492533 (= lt!222667 (toIndex!0 (select (arr!15328 a!3235) j!176) mask!3524))))

(assert (=> b!492533 e!289319))

(declare-fun res!295286 () Bool)

(assert (=> b!492533 (=> (not res!295286) (not e!289319))))

(assert (=> b!492533 (= res!295286 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14536 0))(
  ( (Unit!14537) )
))
(declare-fun lt!222666 () Unit!14536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14536)

(assert (=> b!492533 (= lt!222666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492534 () Bool)

(declare-fun res!295292 () Bool)

(assert (=> b!492534 (=> (not res!295292) (not e!289322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492534 (= res!295292 (validKeyInArray!0 k0!2280))))

(declare-fun b!492535 () Bool)

(assert (=> b!492535 (= e!289322 e!289323)))

(declare-fun res!295283 () Bool)

(assert (=> b!492535 (=> (not res!295283) (not e!289323))))

(declare-fun lt!222665 () SeekEntryResult!3795)

(assert (=> b!492535 (= res!295283 (or (= lt!222665 (MissingZero!3795 i!1204)) (= lt!222665 (MissingVacant!3795 i!1204))))))

(assert (=> b!492535 (= lt!222665 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492536 () Bool)

(declare-fun res!295285 () Bool)

(assert (=> b!492536 (=> (not res!295285) (not e!289322))))

(assert (=> b!492536 (= res!295285 (validKeyInArray!0 (select (arr!15328 a!3235) j!176)))))

(declare-fun b!492537 () Bool)

(declare-fun res!295291 () Bool)

(assert (=> b!492537 (=> (not res!295291) (not e!289322))))

(assert (=> b!492537 (= res!295291 (and (= (size!15692 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15692 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15692 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492538 () Bool)

(assert (=> b!492538 (= e!289321 (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!222667 #b00000000000000000000000000000000) (bvslt lt!222667 (bvadd #b00000000000000000000000000000001 mask!3524)))))))

(declare-fun b!492539 () Bool)

(declare-fun res!295289 () Bool)

(assert (=> b!492539 (=> (not res!295289) (not e!289323))))

(declare-datatypes ((List!9486 0))(
  ( (Nil!9483) (Cons!9482 (h!10347 (_ BitVec 64)) (t!15714 List!9486)) )
))
(declare-fun arrayNoDuplicates!0 (array!31884 (_ BitVec 32) List!9486) Bool)

(assert (=> b!492539 (= res!295289 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9483))))

(assert (= (and start!44882 res!295290) b!492537))

(assert (= (and b!492537 res!295291) b!492536))

(assert (= (and b!492536 res!295285) b!492534))

(assert (= (and b!492534 res!295292) b!492531))

(assert (= (and b!492531 res!295287) b!492535))

(assert (= (and b!492535 res!295283) b!492530))

(assert (= (and b!492530 res!295288) b!492539))

(assert (= (and b!492539 res!295289) b!492533))

(assert (= (and b!492533 res!295286) b!492532))

(assert (= (and b!492533 (not res!295284)) b!492538))

(declare-fun m!473283 () Bool)

(assert (=> b!492532 m!473283))

(assert (=> b!492532 m!473283))

(declare-fun m!473285 () Bool)

(assert (=> b!492532 m!473285))

(declare-fun m!473287 () Bool)

(assert (=> start!44882 m!473287))

(declare-fun m!473289 () Bool)

(assert (=> start!44882 m!473289))

(declare-fun m!473291 () Bool)

(assert (=> b!492534 m!473291))

(assert (=> b!492536 m!473283))

(assert (=> b!492536 m!473283))

(declare-fun m!473293 () Bool)

(assert (=> b!492536 m!473293))

(declare-fun m!473295 () Bool)

(assert (=> b!492531 m!473295))

(declare-fun m!473297 () Bool)

(assert (=> b!492533 m!473297))

(declare-fun m!473299 () Bool)

(assert (=> b!492533 m!473299))

(declare-fun m!473301 () Bool)

(assert (=> b!492533 m!473301))

(assert (=> b!492533 m!473283))

(declare-fun m!473303 () Bool)

(assert (=> b!492533 m!473303))

(declare-fun m!473305 () Bool)

(assert (=> b!492533 m!473305))

(assert (=> b!492533 m!473301))

(declare-fun m!473307 () Bool)

(assert (=> b!492533 m!473307))

(assert (=> b!492533 m!473283))

(declare-fun m!473309 () Bool)

(assert (=> b!492533 m!473309))

(assert (=> b!492533 m!473301))

(assert (=> b!492533 m!473305))

(assert (=> b!492533 m!473283))

(declare-fun m!473311 () Bool)

(assert (=> b!492533 m!473311))

(declare-fun m!473313 () Bool)

(assert (=> b!492535 m!473313))

(declare-fun m!473315 () Bool)

(assert (=> b!492530 m!473315))

(declare-fun m!473317 () Bool)

(assert (=> b!492539 m!473317))

(check-sat (not b!492535) (not b!492539) (not b!492531) (not b!492534) (not b!492530) (not start!44882) (not b!492536) (not b!492532) (not b!492533))
(check-sat)
(get-model)

(declare-fun b!492582 () Bool)

(declare-fun e!289347 () SeekEntryResult!3795)

(declare-fun lt!222685 () SeekEntryResult!3795)

(assert (=> b!492582 (= e!289347 (MissingZero!3795 (index!17361 lt!222685)))))

(declare-fun b!492583 () Bool)

(declare-fun e!289345 () SeekEntryResult!3795)

(assert (=> b!492583 (= e!289345 (Found!3795 (index!17361 lt!222685)))))

(declare-fun b!492584 () Bool)

(declare-fun c!58904 () Bool)

(declare-fun lt!222684 () (_ BitVec 64))

(assert (=> b!492584 (= c!58904 (= lt!222684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492584 (= e!289345 e!289347)))

(declare-fun d!78099 () Bool)

(declare-fun lt!222683 () SeekEntryResult!3795)

(get-info :version)

(assert (=> d!78099 (and (or ((_ is Undefined!3795) lt!222683) (not ((_ is Found!3795) lt!222683)) (and (bvsge (index!17360 lt!222683) #b00000000000000000000000000000000) (bvslt (index!17360 lt!222683) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222683) ((_ is Found!3795) lt!222683) (not ((_ is MissingZero!3795) lt!222683)) (and (bvsge (index!17359 lt!222683) #b00000000000000000000000000000000) (bvslt (index!17359 lt!222683) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222683) ((_ is Found!3795) lt!222683) ((_ is MissingZero!3795) lt!222683) (not ((_ is MissingVacant!3795) lt!222683)) (and (bvsge (index!17362 lt!222683) #b00000000000000000000000000000000) (bvslt (index!17362 lt!222683) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222683) (ite ((_ is Found!3795) lt!222683) (= (select (arr!15328 a!3235) (index!17360 lt!222683)) (select (arr!15328 a!3235) j!176)) (ite ((_ is MissingZero!3795) lt!222683) (= (select (arr!15328 a!3235) (index!17359 lt!222683)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3795) lt!222683) (= (select (arr!15328 a!3235) (index!17362 lt!222683)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289346 () SeekEntryResult!3795)

(assert (=> d!78099 (= lt!222683 e!289346)))

(declare-fun c!58903 () Bool)

(assert (=> d!78099 (= c!58903 (and ((_ is Intermediate!3795) lt!222685) (undefined!4607 lt!222685)))))

(assert (=> d!78099 (= lt!222685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15328 a!3235) j!176) mask!3524) (select (arr!15328 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78099 (validMask!0 mask!3524)))

(assert (=> d!78099 (= (seekEntryOrOpen!0 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) lt!222683)))

(declare-fun b!492585 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31884 (_ BitVec 32)) SeekEntryResult!3795)

(assert (=> b!492585 (= e!289347 (seekKeyOrZeroReturnVacant!0 (x!46443 lt!222685) (index!17361 lt!222685) (index!17361 lt!222685) (select (arr!15328 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492586 () Bool)

(assert (=> b!492586 (= e!289346 Undefined!3795)))

(declare-fun b!492587 () Bool)

(assert (=> b!492587 (= e!289346 e!289345)))

(assert (=> b!492587 (= lt!222684 (select (arr!15328 a!3235) (index!17361 lt!222685)))))

(declare-fun c!58902 () Bool)

(assert (=> b!492587 (= c!58902 (= lt!222684 (select (arr!15328 a!3235) j!176)))))

(assert (= (and d!78099 c!58903) b!492586))

(assert (= (and d!78099 (not c!58903)) b!492587))

(assert (= (and b!492587 c!58902) b!492583))

(assert (= (and b!492587 (not c!58902)) b!492584))

(assert (= (and b!492584 c!58904) b!492582))

(assert (= (and b!492584 (not c!58904)) b!492585))

(assert (=> d!78099 m!473303))

(assert (=> d!78099 m!473283))

(declare-fun m!473355 () Bool)

(assert (=> d!78099 m!473355))

(declare-fun m!473357 () Bool)

(assert (=> d!78099 m!473357))

(assert (=> d!78099 m!473283))

(assert (=> d!78099 m!473303))

(declare-fun m!473359 () Bool)

(assert (=> d!78099 m!473359))

(declare-fun m!473361 () Bool)

(assert (=> d!78099 m!473361))

(assert (=> d!78099 m!473287))

(assert (=> b!492585 m!473283))

(declare-fun m!473363 () Bool)

(assert (=> b!492585 m!473363))

(declare-fun m!473365 () Bool)

(assert (=> b!492587 m!473365))

(assert (=> b!492532 d!78099))

(declare-fun d!78103 () Bool)

(declare-fun res!295327 () Bool)

(declare-fun e!289352 () Bool)

(assert (=> d!78103 (=> res!295327 e!289352)))

(assert (=> d!78103 (= res!295327 (= (select (arr!15328 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78103 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!289352)))

(declare-fun b!492592 () Bool)

(declare-fun e!289353 () Bool)

(assert (=> b!492592 (= e!289352 e!289353)))

(declare-fun res!295328 () Bool)

(assert (=> b!492592 (=> (not res!295328) (not e!289353))))

(assert (=> b!492592 (= res!295328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15692 a!3235)))))

(declare-fun b!492593 () Bool)

(assert (=> b!492593 (= e!289353 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78103 (not res!295327)) b!492592))

(assert (= (and b!492592 res!295328) b!492593))

(declare-fun m!473367 () Bool)

(assert (=> d!78103 m!473367))

(declare-fun m!473369 () Bool)

(assert (=> b!492593 m!473369))

(assert (=> b!492531 d!78103))

(declare-fun d!78105 () Bool)

(declare-fun lt!222697 () (_ BitVec 32))

(declare-fun lt!222696 () (_ BitVec 32))

(assert (=> d!78105 (= lt!222697 (bvmul (bvxor lt!222696 (bvlshr lt!222696 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78105 (= lt!222696 ((_ extract 31 0) (bvand (bvxor (select (arr!15328 a!3235) j!176) (bvlshr (select (arr!15328 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78105 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295329 (let ((h!10349 ((_ extract 31 0) (bvand (bvxor (select (arr!15328 a!3235) j!176) (bvlshr (select (arr!15328 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46445 (bvmul (bvxor h!10349 (bvlshr h!10349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46445 (bvlshr x!46445 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295329 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295329 #b00000000000000000000000000000000))))))

(assert (=> d!78105 (= (toIndex!0 (select (arr!15328 a!3235) j!176) mask!3524) (bvand (bvxor lt!222697 (bvlshr lt!222697 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492533 d!78105))

(declare-fun b!492614 () Bool)

(declare-fun e!289371 () Bool)

(declare-fun call!31394 () Bool)

(assert (=> b!492614 (= e!289371 call!31394)))

(declare-fun bm!31391 () Bool)

(assert (=> bm!31391 (= call!31394 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492615 () Bool)

(declare-fun e!289370 () Bool)

(assert (=> b!492615 (= e!289370 call!31394)))

(declare-fun d!78107 () Bool)

(declare-fun res!295340 () Bool)

(declare-fun e!289369 () Bool)

(assert (=> d!78107 (=> res!295340 e!289369)))

(assert (=> d!78107 (= res!295340 (bvsge j!176 (size!15692 a!3235)))))

(assert (=> d!78107 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289369)))

(declare-fun b!492616 () Bool)

(assert (=> b!492616 (= e!289370 e!289371)))

(declare-fun lt!222707 () (_ BitVec 64))

(assert (=> b!492616 (= lt!222707 (select (arr!15328 a!3235) j!176))))

(declare-fun lt!222708 () Unit!14536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31884 (_ BitVec 64) (_ BitVec 32)) Unit!14536)

(assert (=> b!492616 (= lt!222708 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222707 j!176))))

(assert (=> b!492616 (arrayContainsKey!0 a!3235 lt!222707 #b00000000000000000000000000000000)))

(declare-fun lt!222709 () Unit!14536)

(assert (=> b!492616 (= lt!222709 lt!222708)))

(declare-fun res!295341 () Bool)

(assert (=> b!492616 (= res!295341 (= (seekEntryOrOpen!0 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) (Found!3795 j!176)))))

(assert (=> b!492616 (=> (not res!295341) (not e!289371))))

(declare-fun b!492617 () Bool)

(assert (=> b!492617 (= e!289369 e!289370)))

(declare-fun c!58910 () Bool)

(assert (=> b!492617 (= c!58910 (validKeyInArray!0 (select (arr!15328 a!3235) j!176)))))

(assert (= (and d!78107 (not res!295340)) b!492617))

(assert (= (and b!492617 c!58910) b!492616))

(assert (= (and b!492617 (not c!58910)) b!492615))

(assert (= (and b!492616 res!295341) b!492614))

(assert (= (or b!492614 b!492615) bm!31391))

(declare-fun m!473383 () Bool)

(assert (=> bm!31391 m!473383))

(assert (=> b!492616 m!473283))

(declare-fun m!473385 () Bool)

(assert (=> b!492616 m!473385))

(declare-fun m!473387 () Bool)

(assert (=> b!492616 m!473387))

(assert (=> b!492616 m!473283))

(assert (=> b!492616 m!473285))

(assert (=> b!492617 m!473283))

(assert (=> b!492617 m!473283))

(assert (=> b!492617 m!473293))

(assert (=> b!492533 d!78107))

(declare-fun d!78115 () Bool)

(assert (=> d!78115 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222712 () Unit!14536)

(declare-fun choose!38 (array!31884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14536)

(assert (=> d!78115 (= lt!222712 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78115 (validMask!0 mask!3524)))

(assert (=> d!78115 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222712)))

(declare-fun bs!15703 () Bool)

(assert (= bs!15703 d!78115))

(assert (=> bs!15703 m!473309))

(declare-fun m!473389 () Bool)

(assert (=> bs!15703 m!473389))

(assert (=> bs!15703 m!473287))

(assert (=> b!492533 d!78115))

(declare-fun d!78117 () Bool)

(declare-fun e!289391 () Bool)

(assert (=> d!78117 e!289391))

(declare-fun c!58926 () Bool)

(declare-fun lt!222732 () SeekEntryResult!3795)

(assert (=> d!78117 (= c!58926 (and ((_ is Intermediate!3795) lt!222732) (undefined!4607 lt!222732)))))

(declare-fun e!289392 () SeekEntryResult!3795)

(assert (=> d!78117 (= lt!222732 e!289392)))

(declare-fun c!58927 () Bool)

(assert (=> d!78117 (= c!58927 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222733 () (_ BitVec 64))

(assert (=> d!78117 (= lt!222733 (select (arr!15328 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235))) (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!78117 (validMask!0 mask!3524)))

(assert (=> d!78117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)) mask!3524) lt!222732)))

(declare-fun b!492654 () Bool)

(declare-fun e!289395 () SeekEntryResult!3795)

(assert (=> b!492654 (= e!289392 e!289395)))

(declare-fun c!58928 () Bool)

(assert (=> b!492654 (= c!58928 (or (= lt!222733 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222733 lt!222733) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492655 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492655 (= e!289395 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)) mask!3524))))

(declare-fun b!492656 () Bool)

(assert (=> b!492656 (= e!289395 (Intermediate!3795 false (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492657 () Bool)

(assert (=> b!492657 (and (bvsge (index!17361 lt!222732) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222732) (size!15692 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)))))))

(declare-fun e!289393 () Bool)

(assert (=> b!492657 (= e!289393 (= (select (arr!15328 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235))) (index!17361 lt!222732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492658 () Bool)

(assert (=> b!492658 (and (bvsge (index!17361 lt!222732) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222732) (size!15692 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)))))))

(declare-fun res!295351 () Bool)

(assert (=> b!492658 (= res!295351 (= (select (arr!15328 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235))) (index!17361 lt!222732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492658 (=> res!295351 e!289393)))

(declare-fun b!492659 () Bool)

(assert (=> b!492659 (= e!289392 (Intermediate!3795 true (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492660 () Bool)

(declare-fun e!289394 () Bool)

(assert (=> b!492660 (= e!289391 e!289394)))

(declare-fun res!295349 () Bool)

(assert (=> b!492660 (= res!295349 (and ((_ is Intermediate!3795) lt!222732) (not (undefined!4607 lt!222732)) (bvslt (x!46443 lt!222732) #b01111111111111111111111111111110) (bvsge (x!46443 lt!222732) #b00000000000000000000000000000000) (bvsge (x!46443 lt!222732) #b00000000000000000000000000000000)))))

(assert (=> b!492660 (=> (not res!295349) (not e!289394))))

(declare-fun b!492661 () Bool)

(assert (=> b!492661 (and (bvsge (index!17361 lt!222732) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222732) (size!15692 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235)))))))

(declare-fun res!295350 () Bool)

(assert (=> b!492661 (= res!295350 (= (select (arr!15328 (array!31885 (store (arr!15328 a!3235) i!1204 k0!2280) (size!15692 a!3235))) (index!17361 lt!222732)) (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!492661 (=> res!295350 e!289393)))

(assert (=> b!492661 (= e!289394 e!289393)))

(declare-fun b!492662 () Bool)

(assert (=> b!492662 (= e!289391 (bvsge (x!46443 lt!222732) #b01111111111111111111111111111110))))

(assert (= (and d!78117 c!58927) b!492659))

(assert (= (and d!78117 (not c!58927)) b!492654))

(assert (= (and b!492654 c!58928) b!492656))

(assert (= (and b!492654 (not c!58928)) b!492655))

(assert (= (and d!78117 c!58926) b!492662))

(assert (= (and d!78117 (not c!58926)) b!492660))

(assert (= (and b!492660 res!295349) b!492661))

(assert (= (and b!492661 (not res!295350)) b!492658))

(assert (= (and b!492658 (not res!295351)) b!492657))

(assert (=> b!492655 m!473305))

(declare-fun m!473403 () Bool)

(assert (=> b!492655 m!473403))

(assert (=> b!492655 m!473403))

(assert (=> b!492655 m!473301))

(declare-fun m!473405 () Bool)

(assert (=> b!492655 m!473405))

(assert (=> d!78117 m!473305))

(declare-fun m!473407 () Bool)

(assert (=> d!78117 m!473407))

(assert (=> d!78117 m!473287))

(declare-fun m!473409 () Bool)

(assert (=> b!492657 m!473409))

(assert (=> b!492661 m!473409))

(assert (=> b!492658 m!473409))

(assert (=> b!492533 d!78117))

(declare-fun d!78133 () Bool)

(declare-fun lt!222735 () (_ BitVec 32))

(declare-fun lt!222734 () (_ BitVec 32))

(assert (=> d!78133 (= lt!222735 (bvmul (bvxor lt!222734 (bvlshr lt!222734 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78133 (= lt!222734 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78133 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295329 (let ((h!10349 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46445 (bvmul (bvxor h!10349 (bvlshr h!10349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46445 (bvlshr x!46445 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295329 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295329 #b00000000000000000000000000000000))))))

(assert (=> d!78133 (= (toIndex!0 (select (store (arr!15328 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222735 (bvlshr lt!222735 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492533 d!78133))

(declare-fun d!78135 () Bool)

(declare-fun e!289396 () Bool)

(assert (=> d!78135 e!289396))

(declare-fun c!58929 () Bool)

(declare-fun lt!222736 () SeekEntryResult!3795)

(assert (=> d!78135 (= c!58929 (and ((_ is Intermediate!3795) lt!222736) (undefined!4607 lt!222736)))))

(declare-fun e!289397 () SeekEntryResult!3795)

(assert (=> d!78135 (= lt!222736 e!289397)))

(declare-fun c!58930 () Bool)

(assert (=> d!78135 (= c!58930 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222737 () (_ BitVec 64))

(assert (=> d!78135 (= lt!222737 (select (arr!15328 a!3235) lt!222667))))

(assert (=> d!78135 (validMask!0 mask!3524)))

(assert (=> d!78135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222667 (select (arr!15328 a!3235) j!176) a!3235 mask!3524) lt!222736)))

(declare-fun b!492663 () Bool)

(declare-fun e!289400 () SeekEntryResult!3795)

(assert (=> b!492663 (= e!289397 e!289400)))

(declare-fun c!58931 () Bool)

(assert (=> b!492663 (= c!58931 (or (= lt!222737 (select (arr!15328 a!3235) j!176)) (= (bvadd lt!222737 lt!222737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492664 () Bool)

(assert (=> b!492664 (= e!289400 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!222667 #b00000000000000000000000000000000 mask!3524) (select (arr!15328 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492665 () Bool)

(assert (=> b!492665 (= e!289400 (Intermediate!3795 false lt!222667 #b00000000000000000000000000000000))))

(declare-fun b!492666 () Bool)

(assert (=> b!492666 (and (bvsge (index!17361 lt!222736) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222736) (size!15692 a!3235)))))

(declare-fun e!289398 () Bool)

(assert (=> b!492666 (= e!289398 (= (select (arr!15328 a!3235) (index!17361 lt!222736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492667 () Bool)

(assert (=> b!492667 (and (bvsge (index!17361 lt!222736) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222736) (size!15692 a!3235)))))

(declare-fun res!295354 () Bool)

(assert (=> b!492667 (= res!295354 (= (select (arr!15328 a!3235) (index!17361 lt!222736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492667 (=> res!295354 e!289398)))

(declare-fun b!492668 () Bool)

(assert (=> b!492668 (= e!289397 (Intermediate!3795 true lt!222667 #b00000000000000000000000000000000))))

(declare-fun b!492669 () Bool)

(declare-fun e!289399 () Bool)

(assert (=> b!492669 (= e!289396 e!289399)))

(declare-fun res!295352 () Bool)

(assert (=> b!492669 (= res!295352 (and ((_ is Intermediate!3795) lt!222736) (not (undefined!4607 lt!222736)) (bvslt (x!46443 lt!222736) #b01111111111111111111111111111110) (bvsge (x!46443 lt!222736) #b00000000000000000000000000000000) (bvsge (x!46443 lt!222736) #b00000000000000000000000000000000)))))

(assert (=> b!492669 (=> (not res!295352) (not e!289399))))

(declare-fun b!492670 () Bool)

(assert (=> b!492670 (and (bvsge (index!17361 lt!222736) #b00000000000000000000000000000000) (bvslt (index!17361 lt!222736) (size!15692 a!3235)))))

(declare-fun res!295353 () Bool)

(assert (=> b!492670 (= res!295353 (= (select (arr!15328 a!3235) (index!17361 lt!222736)) (select (arr!15328 a!3235) j!176)))))

(assert (=> b!492670 (=> res!295353 e!289398)))

(assert (=> b!492670 (= e!289399 e!289398)))

(declare-fun b!492671 () Bool)

(assert (=> b!492671 (= e!289396 (bvsge (x!46443 lt!222736) #b01111111111111111111111111111110))))

(assert (= (and d!78135 c!58930) b!492668))

(assert (= (and d!78135 (not c!58930)) b!492663))

(assert (= (and b!492663 c!58931) b!492665))

(assert (= (and b!492663 (not c!58931)) b!492664))

(assert (= (and d!78135 c!58929) b!492671))

(assert (= (and d!78135 (not c!58929)) b!492669))

(assert (= (and b!492669 res!295352) b!492670))

(assert (= (and b!492670 (not res!295353)) b!492667))

(assert (= (and b!492667 (not res!295354)) b!492666))

(declare-fun m!473411 () Bool)

(assert (=> b!492664 m!473411))

(assert (=> b!492664 m!473411))

(assert (=> b!492664 m!473283))

(declare-fun m!473413 () Bool)

(assert (=> b!492664 m!473413))

(declare-fun m!473415 () Bool)

(assert (=> d!78135 m!473415))

(assert (=> d!78135 m!473287))

(declare-fun m!473417 () Bool)

(assert (=> b!492666 m!473417))

(assert (=> b!492670 m!473417))

(assert (=> b!492667 m!473417))

(assert (=> b!492533 d!78135))

(declare-fun d!78137 () Bool)

(assert (=> d!78137 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44882 d!78137))

(declare-fun d!78147 () Bool)

(assert (=> d!78147 (= (array_inv!11124 a!3235) (bvsge (size!15692 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44882 d!78147))

(declare-fun d!78151 () Bool)

(assert (=> d!78151 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492534 d!78151))

(declare-fun b!492745 () Bool)

(declare-fun e!289453 () Bool)

(declare-fun e!289452 () Bool)

(assert (=> b!492745 (= e!289453 e!289452)))

(declare-fun res!295390 () Bool)

(assert (=> b!492745 (=> (not res!295390) (not e!289452))))

(declare-fun e!289450 () Bool)

(assert (=> b!492745 (= res!295390 (not e!289450))))

(declare-fun res!295391 () Bool)

(assert (=> b!492745 (=> (not res!295391) (not e!289450))))

(assert (=> b!492745 (= res!295391 (validKeyInArray!0 (select (arr!15328 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492746 () Bool)

(declare-fun e!289451 () Bool)

(declare-fun call!31403 () Bool)

(assert (=> b!492746 (= e!289451 call!31403)))

(declare-fun b!492747 () Bool)

(declare-fun contains!2712 (List!9486 (_ BitVec 64)) Bool)

(assert (=> b!492747 (= e!289450 (contains!2712 Nil!9483 (select (arr!15328 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31400 () Bool)

(declare-fun c!58952 () Bool)

(assert (=> bm!31400 (= call!31403 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58952 (Cons!9482 (select (arr!15328 a!3235) #b00000000000000000000000000000000) Nil!9483) Nil!9483)))))

(declare-fun b!492748 () Bool)

(assert (=> b!492748 (= e!289451 call!31403)))

(declare-fun b!492749 () Bool)

(assert (=> b!492749 (= e!289452 e!289451)))

(assert (=> b!492749 (= c!58952 (validKeyInArray!0 (select (arr!15328 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78153 () Bool)

(declare-fun res!295389 () Bool)

(assert (=> d!78153 (=> res!295389 e!289453)))

(assert (=> d!78153 (= res!295389 (bvsge #b00000000000000000000000000000000 (size!15692 a!3235)))))

(assert (=> d!78153 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9483) e!289453)))

(assert (= (and d!78153 (not res!295389)) b!492745))

(assert (= (and b!492745 res!295391) b!492747))

(assert (= (and b!492745 res!295390) b!492749))

(assert (= (and b!492749 c!58952) b!492748))

(assert (= (and b!492749 (not c!58952)) b!492746))

(assert (= (or b!492748 b!492746) bm!31400))

(assert (=> b!492745 m!473367))

(assert (=> b!492745 m!473367))

(declare-fun m!473451 () Bool)

(assert (=> b!492745 m!473451))

(assert (=> b!492747 m!473367))

(assert (=> b!492747 m!473367))

(declare-fun m!473453 () Bool)

(assert (=> b!492747 m!473453))

(assert (=> bm!31400 m!473367))

(declare-fun m!473455 () Bool)

(assert (=> bm!31400 m!473455))

(assert (=> b!492749 m!473367))

(assert (=> b!492749 m!473367))

(assert (=> b!492749 m!473451))

(assert (=> b!492539 d!78153))

(declare-fun d!78161 () Bool)

(assert (=> d!78161 (= (validKeyInArray!0 (select (arr!15328 a!3235) j!176)) (and (not (= (select (arr!15328 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15328 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492536 d!78161))

(declare-fun b!492750 () Bool)

(declare-fun e!289456 () Bool)

(declare-fun call!31404 () Bool)

(assert (=> b!492750 (= e!289456 call!31404)))

(declare-fun bm!31401 () Bool)

(assert (=> bm!31401 (= call!31404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492751 () Bool)

(declare-fun e!289455 () Bool)

(assert (=> b!492751 (= e!289455 call!31404)))

(declare-fun d!78163 () Bool)

(declare-fun res!295392 () Bool)

(declare-fun e!289454 () Bool)

(assert (=> d!78163 (=> res!295392 e!289454)))

(assert (=> d!78163 (= res!295392 (bvsge #b00000000000000000000000000000000 (size!15692 a!3235)))))

(assert (=> d!78163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289454)))

(declare-fun b!492752 () Bool)

(assert (=> b!492752 (= e!289455 e!289456)))

(declare-fun lt!222766 () (_ BitVec 64))

(assert (=> b!492752 (= lt!222766 (select (arr!15328 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222767 () Unit!14536)

(assert (=> b!492752 (= lt!222767 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222766 #b00000000000000000000000000000000))))

(assert (=> b!492752 (arrayContainsKey!0 a!3235 lt!222766 #b00000000000000000000000000000000)))

(declare-fun lt!222768 () Unit!14536)

(assert (=> b!492752 (= lt!222768 lt!222767)))

(declare-fun res!295393 () Bool)

(assert (=> b!492752 (= res!295393 (= (seekEntryOrOpen!0 (select (arr!15328 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3795 #b00000000000000000000000000000000)))))

(assert (=> b!492752 (=> (not res!295393) (not e!289456))))

(declare-fun b!492753 () Bool)

(assert (=> b!492753 (= e!289454 e!289455)))

(declare-fun c!58953 () Bool)

(assert (=> b!492753 (= c!58953 (validKeyInArray!0 (select (arr!15328 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78163 (not res!295392)) b!492753))

(assert (= (and b!492753 c!58953) b!492752))

(assert (= (and b!492753 (not c!58953)) b!492751))

(assert (= (and b!492752 res!295393) b!492750))

(assert (= (or b!492750 b!492751) bm!31401))

(declare-fun m!473457 () Bool)

(assert (=> bm!31401 m!473457))

(assert (=> b!492752 m!473367))

(declare-fun m!473459 () Bool)

(assert (=> b!492752 m!473459))

(declare-fun m!473461 () Bool)

(assert (=> b!492752 m!473461))

(assert (=> b!492752 m!473367))

(declare-fun m!473463 () Bool)

(assert (=> b!492752 m!473463))

(assert (=> b!492753 m!473367))

(assert (=> b!492753 m!473367))

(assert (=> b!492753 m!473451))

(assert (=> b!492530 d!78163))

(declare-fun b!492758 () Bool)

(declare-fun e!289462 () SeekEntryResult!3795)

(declare-fun lt!222774 () SeekEntryResult!3795)

(assert (=> b!492758 (= e!289462 (MissingZero!3795 (index!17361 lt!222774)))))

(declare-fun b!492759 () Bool)

(declare-fun e!289460 () SeekEntryResult!3795)

(assert (=> b!492759 (= e!289460 (Found!3795 (index!17361 lt!222774)))))

(declare-fun b!492760 () Bool)

(declare-fun c!58957 () Bool)

(declare-fun lt!222773 () (_ BitVec 64))

(assert (=> b!492760 (= c!58957 (= lt!222773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492760 (= e!289460 e!289462)))

(declare-fun d!78165 () Bool)

(declare-fun lt!222772 () SeekEntryResult!3795)

(assert (=> d!78165 (and (or ((_ is Undefined!3795) lt!222772) (not ((_ is Found!3795) lt!222772)) (and (bvsge (index!17360 lt!222772) #b00000000000000000000000000000000) (bvslt (index!17360 lt!222772) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222772) ((_ is Found!3795) lt!222772) (not ((_ is MissingZero!3795) lt!222772)) (and (bvsge (index!17359 lt!222772) #b00000000000000000000000000000000) (bvslt (index!17359 lt!222772) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222772) ((_ is Found!3795) lt!222772) ((_ is MissingZero!3795) lt!222772) (not ((_ is MissingVacant!3795) lt!222772)) (and (bvsge (index!17362 lt!222772) #b00000000000000000000000000000000) (bvslt (index!17362 lt!222772) (size!15692 a!3235)))) (or ((_ is Undefined!3795) lt!222772) (ite ((_ is Found!3795) lt!222772) (= (select (arr!15328 a!3235) (index!17360 lt!222772)) k0!2280) (ite ((_ is MissingZero!3795) lt!222772) (= (select (arr!15328 a!3235) (index!17359 lt!222772)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3795) lt!222772) (= (select (arr!15328 a!3235) (index!17362 lt!222772)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289461 () SeekEntryResult!3795)

(assert (=> d!78165 (= lt!222772 e!289461)))

(declare-fun c!58956 () Bool)

(assert (=> d!78165 (= c!58956 (and ((_ is Intermediate!3795) lt!222774) (undefined!4607 lt!222774)))))

(assert (=> d!78165 (= lt!222774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78165 (validMask!0 mask!3524)))

(assert (=> d!78165 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222772)))

(declare-fun b!492761 () Bool)

(assert (=> b!492761 (= e!289462 (seekKeyOrZeroReturnVacant!0 (x!46443 lt!222774) (index!17361 lt!222774) (index!17361 lt!222774) k0!2280 a!3235 mask!3524))))

(declare-fun b!492762 () Bool)

(assert (=> b!492762 (= e!289461 Undefined!3795)))

(declare-fun b!492763 () Bool)

(assert (=> b!492763 (= e!289461 e!289460)))

(assert (=> b!492763 (= lt!222773 (select (arr!15328 a!3235) (index!17361 lt!222774)))))

(declare-fun c!58955 () Bool)

(assert (=> b!492763 (= c!58955 (= lt!222773 k0!2280))))

(assert (= (and d!78165 c!58956) b!492762))

(assert (= (and d!78165 (not c!58956)) b!492763))

(assert (= (and b!492763 c!58955) b!492759))

(assert (= (and b!492763 (not c!58955)) b!492760))

(assert (= (and b!492760 c!58957) b!492758))

(assert (= (and b!492760 (not c!58957)) b!492761))

(declare-fun m!473471 () Bool)

(assert (=> d!78165 m!473471))

(declare-fun m!473473 () Bool)

(assert (=> d!78165 m!473473))

(declare-fun m!473475 () Bool)

(assert (=> d!78165 m!473475))

(assert (=> d!78165 m!473471))

(declare-fun m!473477 () Bool)

(assert (=> d!78165 m!473477))

(declare-fun m!473479 () Bool)

(assert (=> d!78165 m!473479))

(assert (=> d!78165 m!473287))

(declare-fun m!473481 () Bool)

(assert (=> b!492761 m!473481))

(declare-fun m!473483 () Bool)

(assert (=> b!492763 m!473483))

(assert (=> b!492535 d!78165))

(check-sat (not bm!31400) (not b!492761) (not b!492749) (not b!492655) (not b!492745) (not bm!31401) (not bm!31391) (not d!78135) (not b!492664) (not d!78117) (not d!78165) (not b!492617) (not b!492752) (not b!492616) (not b!492753) (not d!78115) (not b!492747) (not d!78099) (not b!492593) (not b!492585))
(check-sat)
