; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44470 () Bool)

(assert start!44470)

(declare-fun b!488439 () Bool)

(declare-fun res!291603 () Bool)

(declare-fun e!287324 () Bool)

(assert (=> b!488439 (=> (not res!291603) (not e!287324))))

(declare-datatypes ((array!31625 0))(
  ( (array!31626 (arr!15203 (Array (_ BitVec 32) (_ BitVec 64))) (size!15567 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31625)

(declare-datatypes ((List!9361 0))(
  ( (Nil!9358) (Cons!9357 (h!10216 (_ BitVec 64)) (t!15589 List!9361)) )
))
(declare-fun arrayNoDuplicates!0 (array!31625 (_ BitVec 32) List!9361) Bool)

(assert (=> b!488439 (= res!291603 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9358))))

(declare-fun b!488440 () Bool)

(declare-fun res!291608 () Bool)

(assert (=> b!488440 (=> (not res!291608) (not e!287324))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31625 (_ BitVec 32)) Bool)

(assert (=> b!488440 (= res!291608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488441 () Bool)

(assert (=> b!488441 (= e!287324 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(declare-fun e!287325 () Bool)

(assert (=> b!488441 e!287325))

(declare-fun res!291604 () Bool)

(assert (=> b!488441 (=> (not res!291604) (not e!287325))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488441 (= res!291604 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14286 0))(
  ( (Unit!14287) )
))
(declare-fun lt!220395 () Unit!14286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14286)

(assert (=> b!488441 (= lt!220395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291600 () Bool)

(declare-fun e!287322 () Bool)

(assert (=> start!44470 (=> (not res!291600) (not e!287322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44470 (= res!291600 (validMask!0 mask!3524))))

(assert (=> start!44470 e!287322))

(assert (=> start!44470 true))

(declare-fun array_inv!10999 (array!31625) Bool)

(assert (=> start!44470 (array_inv!10999 a!3235)))

(declare-fun b!488442 () Bool)

(assert (=> b!488442 (= e!287322 e!287324)))

(declare-fun res!291607 () Bool)

(assert (=> b!488442 (=> (not res!291607) (not e!287324))))

(declare-datatypes ((SeekEntryResult!3670 0))(
  ( (MissingZero!3670 (index!16859 (_ BitVec 32))) (Found!3670 (index!16860 (_ BitVec 32))) (Intermediate!3670 (undefined!4482 Bool) (index!16861 (_ BitVec 32)) (x!45973 (_ BitVec 32))) (Undefined!3670) (MissingVacant!3670 (index!16862 (_ BitVec 32))) )
))
(declare-fun lt!220396 () SeekEntryResult!3670)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488442 (= res!291607 (or (= lt!220396 (MissingZero!3670 i!1204)) (= lt!220396 (MissingVacant!3670 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31625 (_ BitVec 32)) SeekEntryResult!3670)

(assert (=> b!488442 (= lt!220396 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488443 () Bool)

(declare-fun res!291602 () Bool)

(assert (=> b!488443 (=> (not res!291602) (not e!287322))))

(assert (=> b!488443 (= res!291602 (and (= (size!15567 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15567 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15567 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488444 () Bool)

(declare-fun res!291605 () Bool)

(assert (=> b!488444 (=> (not res!291605) (not e!287322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488444 (= res!291605 (validKeyInArray!0 (select (arr!15203 a!3235) j!176)))))

(declare-fun b!488445 () Bool)

(declare-fun res!291601 () Bool)

(assert (=> b!488445 (=> (not res!291601) (not e!287322))))

(assert (=> b!488445 (= res!291601 (validKeyInArray!0 k!2280))))

(declare-fun b!488446 () Bool)

(declare-fun res!291606 () Bool)

(assert (=> b!488446 (=> (not res!291606) (not e!287322))))

(declare-fun arrayContainsKey!0 (array!31625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488446 (= res!291606 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488447 () Bool)

(assert (=> b!488447 (= e!287325 (= (seekEntryOrOpen!0 (select (arr!15203 a!3235) j!176) a!3235 mask!3524) (Found!3670 j!176)))))

(assert (= (and start!44470 res!291600) b!488443))

(assert (= (and b!488443 res!291602) b!488444))

(assert (= (and b!488444 res!291605) b!488445))

(assert (= (and b!488445 res!291601) b!488446))

(assert (= (and b!488446 res!291606) b!488442))

(assert (= (and b!488442 res!291607) b!488440))

(assert (= (and b!488440 res!291608) b!488439))

(assert (= (and b!488439 res!291603) b!488441))

(assert (= (and b!488441 res!291604) b!488447))

(declare-fun m!468171 () Bool)

(assert (=> start!44470 m!468171))

(declare-fun m!468173 () Bool)

(assert (=> start!44470 m!468173))

(declare-fun m!468175 () Bool)

(assert (=> b!488441 m!468175))

(declare-fun m!468177 () Bool)

(assert (=> b!488441 m!468177))

(declare-fun m!468179 () Bool)

(assert (=> b!488442 m!468179))

(declare-fun m!468181 () Bool)

(assert (=> b!488446 m!468181))

(declare-fun m!468183 () Bool)

(assert (=> b!488440 m!468183))

(declare-fun m!468185 () Bool)

(assert (=> b!488439 m!468185))

(declare-fun m!468187 () Bool)

(assert (=> b!488447 m!468187))

(assert (=> b!488447 m!468187))

(declare-fun m!468189 () Bool)

(assert (=> b!488447 m!468189))

(declare-fun m!468191 () Bool)

(assert (=> b!488445 m!468191))

(assert (=> b!488444 m!468187))

(assert (=> b!488444 m!468187))

(declare-fun m!468193 () Bool)

(assert (=> b!488444 m!468193))

(push 1)

(assert (not start!44470))

(assert (not b!488447))

(assert (not b!488445))

(assert (not b!488442))

(assert (not b!488444))

(assert (not b!488441))

(assert (not b!488446))

(assert (not b!488440))

(assert (not b!488439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77797 () Bool)

(declare-fun res!291635 () Bool)

(declare-fun e!287362 () Bool)

(assert (=> d!77797 (=> res!291635 e!287362)))

(assert (=> d!77797 (= res!291635 (bvsge #b00000000000000000000000000000000 (size!15567 a!3235)))))

(assert (=> d!77797 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9358) e!287362)))

(declare-fun b!488493 () Bool)

(declare-fun e!287363 () Bool)

(declare-fun call!31336 () Bool)

(assert (=> b!488493 (= e!287363 call!31336)))

(declare-fun bm!31333 () Bool)

(declare-fun c!58699 () Bool)

(assert (=> bm!31333 (= call!31336 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58699 (Cons!9357 (select (arr!15203 a!3235) #b00000000000000000000000000000000) Nil!9358) Nil!9358)))))

(declare-fun b!488494 () Bool)

(declare-fun e!287361 () Bool)

(assert (=> b!488494 (= e!287361 e!287363)))

(assert (=> b!488494 (= c!58699 (validKeyInArray!0 (select (arr!15203 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488495 () Bool)

(assert (=> b!488495 (= e!287362 e!287361)))

(declare-fun res!291634 () Bool)

(assert (=> b!488495 (=> (not res!291634) (not e!287361))))

(declare-fun e!287364 () Bool)

(assert (=> b!488495 (= res!291634 (not e!287364))))

(declare-fun res!291636 () Bool)

(assert (=> b!488495 (=> (not res!291636) (not e!287364))))

(assert (=> b!488495 (= res!291636 (validKeyInArray!0 (select (arr!15203 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488496 () Bool)

(assert (=> b!488496 (= e!287363 call!31336)))

(declare-fun b!488497 () Bool)

(declare-fun contains!2705 (List!9361 (_ BitVec 64)) Bool)

(assert (=> b!488497 (= e!287364 (contains!2705 Nil!9358 (select (arr!15203 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77797 (not res!291635)) b!488495))

(assert (= (and b!488495 res!291636) b!488497))

(assert (= (and b!488495 res!291634) b!488494))

(assert (= (and b!488494 c!58699) b!488493))

(assert (= (and b!488494 (not c!58699)) b!488496))

(assert (= (or b!488493 b!488496) bm!31333))

(declare-fun m!468211 () Bool)

(assert (=> bm!31333 m!468211))

(declare-fun m!468213 () Bool)

(assert (=> bm!31333 m!468213))

(assert (=> b!488494 m!468211))

(assert (=> b!488494 m!468211))

(declare-fun m!468215 () Bool)

(assert (=> b!488494 m!468215))

(assert (=> b!488495 m!468211))

(assert (=> b!488495 m!468211))

(assert (=> b!488495 m!468215))

(assert (=> b!488497 m!468211))

(assert (=> b!488497 m!468211))

(declare-fun m!468217 () Bool)

(assert (=> b!488497 m!468217))

(assert (=> b!488439 d!77797))

(declare-fun d!77801 () Bool)

(assert (=> d!77801 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44470 d!77801))

(declare-fun d!77809 () Bool)

(assert (=> d!77809 (= (array_inv!10999 a!3235) (bvsge (size!15567 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44470 d!77809))

(declare-fun d!77813 () Bool)

(assert (=> d!77813 (= (validKeyInArray!0 (select (arr!15203 a!3235) j!176)) (and (not (= (select (arr!15203 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15203 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488444 d!77813))

(declare-fun e!287413 () SeekEntryResult!3670)

(declare-fun lt!220455 () SeekEntryResult!3670)

(declare-fun b!488576 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31625 (_ BitVec 32)) SeekEntryResult!3670)

(assert (=> b!488576 (= e!287413 (seekKeyOrZeroReturnVacant!0 (x!45973 lt!220455) (index!16861 lt!220455) (index!16861 lt!220455) k!2280 a!3235 mask!3524))))

(declare-fun b!488577 () Bool)

(declare-fun e!287415 () SeekEntryResult!3670)

(assert (=> b!488577 (= e!287415 Undefined!3670)))

(declare-fun b!488578 () Bool)

(declare-fun e!287414 () SeekEntryResult!3670)

(assert (=> b!488578 (= e!287414 (Found!3670 (index!16861 lt!220455)))))

(declare-fun d!77815 () Bool)

(declare-fun lt!220454 () SeekEntryResult!3670)

(assert (=> d!77815 (and (or (is-Undefined!3670 lt!220454) (not (is-Found!3670 lt!220454)) (and (bvsge (index!16860 lt!220454) #b00000000000000000000000000000000) (bvslt (index!16860 lt!220454) (size!15567 a!3235)))) (or (is-Undefined!3670 lt!220454) (is-Found!3670 lt!220454) (not (is-MissingZero!3670 lt!220454)) (and (bvsge (index!16859 lt!220454) #b00000000000000000000000000000000) (bvslt (index!16859 lt!220454) (size!15567 a!3235)))) (or (is-Undefined!3670 lt!220454) (is-Found!3670 lt!220454) (is-MissingZero!3670 lt!220454) (not (is-MissingVacant!3670 lt!220454)) (and (bvsge (index!16862 lt!220454) #b00000000000000000000000000000000) (bvslt (index!16862 lt!220454) (size!15567 a!3235)))) (or (is-Undefined!3670 lt!220454) (ite (is-Found!3670 lt!220454) (= (select (arr!15203 a!3235) (index!16860 lt!220454)) k!2280) (ite (is-MissingZero!3670 lt!220454) (= (select (arr!15203 a!3235) (index!16859 lt!220454)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3670 lt!220454) (= (select (arr!15203 a!3235) (index!16862 lt!220454)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77815 (= lt!220454 e!287415)))

(declare-fun c!58731 () Bool)

(assert (=> d!77815 (= c!58731 (and (is-Intermediate!3670 lt!220455) (undefined!4482 lt!220455)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31625 (_ BitVec 32)) SeekEntryResult!3670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77815 (= lt!220455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77815 (validMask!0 mask!3524)))

(assert (=> d!77815 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220454)))

(declare-fun b!488579 () Bool)

(assert (=> b!488579 (= e!287413 (MissingZero!3670 (index!16861 lt!220455)))))

(declare-fun b!488580 () Bool)

(assert (=> b!488580 (= e!287415 e!287414)))

(declare-fun lt!220456 () (_ BitVec 64))

(assert (=> b!488580 (= lt!220456 (select (arr!15203 a!3235) (index!16861 lt!220455)))))

(declare-fun c!58730 () Bool)

(assert (=> b!488580 (= c!58730 (= lt!220456 k!2280))))

(declare-fun b!488581 () Bool)

(declare-fun c!58732 () Bool)

(assert (=> b!488581 (= c!58732 (= lt!220456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488581 (= e!287414 e!287413)))

(assert (= (and d!77815 c!58731) b!488577))

(assert (= (and d!77815 (not c!58731)) b!488580))

(assert (= (and b!488580 c!58730) b!488578))

(assert (= (and b!488580 (not c!58730)) b!488581))

(assert (= (and b!488581 c!58732) b!488579))

(assert (= (and b!488581 (not c!58732)) b!488576))

(declare-fun m!468289 () Bool)

(assert (=> b!488576 m!468289))

(declare-fun m!468293 () Bool)

(assert (=> d!77815 m!468293))

(declare-fun m!468297 () Bool)

(assert (=> d!77815 m!468297))

(assert (=> d!77815 m!468171))

(declare-fun m!468299 () Bool)

(assert (=> d!77815 m!468299))

(declare-fun m!468301 () Bool)

(assert (=> d!77815 m!468301))

(assert (=> d!77815 m!468299))

(declare-fun m!468303 () Bool)

(assert (=> d!77815 m!468303))

(declare-fun m!468305 () Bool)

(assert (=> b!488580 m!468305))

(assert (=> b!488442 d!77815))

(declare-fun b!488596 () Bool)

(declare-fun e!287426 () Bool)

(declare-fun e!287427 () Bool)

(assert (=> b!488596 (= e!287426 e!287427)))

(declare-fun c!58738 () Bool)

(assert (=> b!488596 (= c!58738 (validKeyInArray!0 (select (arr!15203 a!3235) j!176)))))

(declare-fun d!77831 () Bool)

(declare-fun res!291660 () Bool)

(assert (=> d!77831 (=> res!291660 e!287426)))

(assert (=> d!77831 (= res!291660 (bvsge j!176 (size!15567 a!3235)))))

(assert (=> d!77831 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287426)))

(declare-fun b!488597 () Bool)

(declare-fun e!287425 () Bool)

(assert (=> b!488597 (= e!287427 e!287425)))

(declare-fun lt!220466 () (_ BitVec 64))

(assert (=> b!488597 (= lt!220466 (select (arr!15203 a!3235) j!176))))

(declare-fun lt!220468 () Unit!14286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31625 (_ BitVec 64) (_ BitVec 32)) Unit!14286)

(assert (=> b!488597 (= lt!220468 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220466 j!176))))

(assert (=> b!488597 (arrayContainsKey!0 a!3235 lt!220466 #b00000000000000000000000000000000)))

(declare-fun lt!220467 () Unit!14286)

(assert (=> b!488597 (= lt!220467 lt!220468)))

(declare-fun res!291659 () Bool)

