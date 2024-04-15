; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44868 () Bool)

(assert start!44868)

(declare-fun res!295132 () Bool)

(declare-fun e!289134 () Bool)

(assert (=> start!44868 (=> (not res!295132) (not e!289134))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44868 (= res!295132 (validMask!0 mask!3524))))

(assert (=> start!44868 e!289134))

(assert (=> start!44868 true))

(declare-datatypes ((array!31880 0))(
  ( (array!31881 (arr!15326 (Array (_ BitVec 32) (_ BitVec 64))) (size!15691 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31880)

(declare-fun array_inv!11209 (array!31880) Bool)

(assert (=> start!44868 (array_inv!11209 a!3235)))

(declare-fun b!492229 () Bool)

(declare-fun res!295125 () Bool)

(declare-fun e!289131 () Bool)

(assert (=> b!492229 (=> (not res!295125) (not e!289131))))

(declare-datatypes ((List!9523 0))(
  ( (Nil!9520) (Cons!9519 (h!10384 (_ BitVec 64)) (t!15742 List!9523)) )
))
(declare-fun arrayNoDuplicates!0 (array!31880 (_ BitVec 32) List!9523) Bool)

(assert (=> b!492229 (= res!295125 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9520))))

(declare-fun b!492230 () Bool)

(declare-fun res!295126 () Bool)

(assert (=> b!492230 (=> (not res!295126) (not e!289134))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492230 (= res!295126 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492231 () Bool)

(declare-fun res!295131 () Bool)

(assert (=> b!492231 (=> (not res!295131) (not e!289131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31880 (_ BitVec 32)) Bool)

(assert (=> b!492231 (= res!295131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492232 () Bool)

(declare-fun res!295129 () Bool)

(assert (=> b!492232 (=> (not res!295129) (not e!289134))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492232 (= res!295129 (validKeyInArray!0 (select (arr!15326 a!3235) j!176)))))

(declare-fun e!289132 () Bool)

(declare-fun b!492233 () Bool)

(declare-datatypes ((SeekEntryResult!3790 0))(
  ( (MissingZero!3790 (index!17339 (_ BitVec 32))) (Found!3790 (index!17340 (_ BitVec 32))) (Intermediate!3790 (undefined!4602 Bool) (index!17341 (_ BitVec 32)) (x!46433 (_ BitVec 32))) (Undefined!3790) (MissingVacant!3790 (index!17342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31880 (_ BitVec 32)) SeekEntryResult!3790)

(assert (=> b!492233 (= e!289132 (= (seekEntryOrOpen!0 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) (Found!3790 j!176)))))

(declare-fun b!492234 () Bool)

(declare-fun e!289130 () Bool)

(assert (=> b!492234 (= e!289131 (not e!289130))))

(declare-fun res!295124 () Bool)

(assert (=> b!492234 (=> res!295124 e!289130)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!222423 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31880 (_ BitVec 32)) SeekEntryResult!3790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492234 (= res!295124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222423 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)) mask!3524)))))

(assert (=> b!492234 (= lt!222423 (toIndex!0 (select (arr!15326 a!3235) j!176) mask!3524))))

(assert (=> b!492234 e!289132))

(declare-fun res!295130 () Bool)

(assert (=> b!492234 (=> (not res!295130) (not e!289132))))

(assert (=> b!492234 (= res!295130 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14512 0))(
  ( (Unit!14513) )
))
(declare-fun lt!222424 () Unit!14512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14512)

(assert (=> b!492234 (= lt!222424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492235 () Bool)

(declare-fun res!295127 () Bool)

(assert (=> b!492235 (=> (not res!295127) (not e!289134))))

(assert (=> b!492235 (= res!295127 (and (= (size!15691 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15691 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15691 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492236 () Bool)

(declare-fun res!295128 () Bool)

(assert (=> b!492236 (=> (not res!295128) (not e!289134))))

(assert (=> b!492236 (= res!295128 (validKeyInArray!0 k0!2280))))

(declare-fun b!492237 () Bool)

(assert (=> b!492237 (= e!289130 (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!222423 #b00000000000000000000000000000000) (bvslt lt!222423 (bvadd #b00000000000000000000000000000001 mask!3524)))))))

(declare-fun b!492238 () Bool)

(assert (=> b!492238 (= e!289134 e!289131)))

(declare-fun res!295133 () Bool)

(assert (=> b!492238 (=> (not res!295133) (not e!289131))))

(declare-fun lt!222422 () SeekEntryResult!3790)

(assert (=> b!492238 (= res!295133 (or (= lt!222422 (MissingZero!3790 i!1204)) (= lt!222422 (MissingVacant!3790 i!1204))))))

(assert (=> b!492238 (= lt!222422 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44868 res!295132) b!492235))

(assert (= (and b!492235 res!295127) b!492232))

(assert (= (and b!492232 res!295129) b!492236))

(assert (= (and b!492236 res!295128) b!492230))

(assert (= (and b!492230 res!295126) b!492238))

(assert (= (and b!492238 res!295133) b!492231))

(assert (= (and b!492231 res!295131) b!492229))

(assert (= (and b!492229 res!295125) b!492234))

(assert (= (and b!492234 res!295130) b!492233))

(assert (= (and b!492234 (not res!295124)) b!492237))

(declare-fun m!472495 () Bool)

(assert (=> b!492238 m!472495))

(declare-fun m!472497 () Bool)

(assert (=> b!492234 m!472497))

(declare-fun m!472499 () Bool)

(assert (=> b!492234 m!472499))

(declare-fun m!472501 () Bool)

(assert (=> b!492234 m!472501))

(declare-fun m!472503 () Bool)

(assert (=> b!492234 m!472503))

(declare-fun m!472505 () Bool)

(assert (=> b!492234 m!472505))

(assert (=> b!492234 m!472503))

(declare-fun m!472507 () Bool)

(assert (=> b!492234 m!472507))

(declare-fun m!472509 () Bool)

(assert (=> b!492234 m!472509))

(assert (=> b!492234 m!472501))

(declare-fun m!472511 () Bool)

(assert (=> b!492234 m!472511))

(assert (=> b!492234 m!472503))

(declare-fun m!472513 () Bool)

(assert (=> b!492234 m!472513))

(assert (=> b!492234 m!472501))

(assert (=> b!492234 m!472509))

(declare-fun m!472515 () Bool)

(assert (=> b!492231 m!472515))

(declare-fun m!472517 () Bool)

(assert (=> start!44868 m!472517))

(declare-fun m!472519 () Bool)

(assert (=> start!44868 m!472519))

(declare-fun m!472521 () Bool)

(assert (=> b!492236 m!472521))

(declare-fun m!472523 () Bool)

(assert (=> b!492229 m!472523))

(assert (=> b!492233 m!472503))

(assert (=> b!492233 m!472503))

(declare-fun m!472525 () Bool)

(assert (=> b!492233 m!472525))

(assert (=> b!492232 m!472503))

(assert (=> b!492232 m!472503))

(declare-fun m!472527 () Bool)

(assert (=> b!492232 m!472527))

(declare-fun m!472529 () Bool)

(assert (=> b!492230 m!472529))

(check-sat (not b!492234) (not b!492236) (not start!44868) (not b!492230) (not b!492238) (not b!492229) (not b!492232) (not b!492231) (not b!492233))
(check-sat)
(get-model)

(declare-fun b!492307 () Bool)

(declare-fun e!289171 () Bool)

(declare-fun e!289173 () Bool)

(assert (=> b!492307 (= e!289171 e!289173)))

(declare-fun lt!222449 () (_ BitVec 64))

(assert (=> b!492307 (= lt!222449 (select (arr!15326 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222451 () Unit!14512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31880 (_ BitVec 64) (_ BitVec 32)) Unit!14512)

(assert (=> b!492307 (= lt!222451 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222449 #b00000000000000000000000000000000))))

(assert (=> b!492307 (arrayContainsKey!0 a!3235 lt!222449 #b00000000000000000000000000000000)))

(declare-fun lt!222450 () Unit!14512)

(assert (=> b!492307 (= lt!222450 lt!222451)))

(declare-fun res!295199 () Bool)

(assert (=> b!492307 (= res!295199 (= (seekEntryOrOpen!0 (select (arr!15326 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3790 #b00000000000000000000000000000000)))))

(assert (=> b!492307 (=> (not res!295199) (not e!289173))))

(declare-fun b!492308 () Bool)

(declare-fun call!31366 () Bool)

(assert (=> b!492308 (= e!289171 call!31366)))

(declare-fun b!492309 () Bool)

(declare-fun e!289172 () Bool)

(assert (=> b!492309 (= e!289172 e!289171)))

(declare-fun c!58827 () Bool)

(assert (=> b!492309 (= c!58827 (validKeyInArray!0 (select (arr!15326 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77895 () Bool)

(declare-fun res!295198 () Bool)

(assert (=> d!77895 (=> res!295198 e!289172)))

(assert (=> d!77895 (= res!295198 (bvsge #b00000000000000000000000000000000 (size!15691 a!3235)))))

(assert (=> d!77895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289172)))

(declare-fun b!492310 () Bool)

(assert (=> b!492310 (= e!289173 call!31366)))

(declare-fun bm!31363 () Bool)

(assert (=> bm!31363 (= call!31366 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77895 (not res!295198)) b!492309))

(assert (= (and b!492309 c!58827) b!492307))

(assert (= (and b!492309 (not c!58827)) b!492308))

(assert (= (and b!492307 res!295199) b!492310))

(assert (= (or b!492310 b!492308) bm!31363))

(declare-fun m!472603 () Bool)

(assert (=> b!492307 m!472603))

(declare-fun m!472605 () Bool)

(assert (=> b!492307 m!472605))

(declare-fun m!472607 () Bool)

(assert (=> b!492307 m!472607))

(assert (=> b!492307 m!472603))

(declare-fun m!472609 () Bool)

(assert (=> b!492307 m!472609))

(assert (=> b!492309 m!472603))

(assert (=> b!492309 m!472603))

(declare-fun m!472611 () Bool)

(assert (=> b!492309 m!472611))

(declare-fun m!472613 () Bool)

(assert (=> bm!31363 m!472613))

(assert (=> b!492231 d!77895))

(declare-fun d!77897 () Bool)

(assert (=> d!77897 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492236 d!77897))

(declare-fun d!77899 () Bool)

(declare-fun res!295204 () Bool)

(declare-fun e!289178 () Bool)

(assert (=> d!77899 (=> res!295204 e!289178)))

(assert (=> d!77899 (= res!295204 (= (select (arr!15326 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77899 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!289178)))

(declare-fun b!492315 () Bool)

(declare-fun e!289179 () Bool)

(assert (=> b!492315 (= e!289178 e!289179)))

(declare-fun res!295205 () Bool)

(assert (=> b!492315 (=> (not res!295205) (not e!289179))))

(assert (=> b!492315 (= res!295205 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15691 a!3235)))))

(declare-fun b!492316 () Bool)

(assert (=> b!492316 (= e!289179 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77899 (not res!295204)) b!492315))

(assert (= (and b!492315 res!295205) b!492316))

(assert (=> d!77899 m!472603))

(declare-fun m!472615 () Bool)

(assert (=> b!492316 m!472615))

(assert (=> b!492230 d!77899))

(declare-fun b!492327 () Bool)

(declare-fun e!289191 () Bool)

(declare-fun call!31369 () Bool)

(assert (=> b!492327 (= e!289191 call!31369)))

(declare-fun b!492328 () Bool)

(declare-fun e!289188 () Bool)

(declare-fun e!289189 () Bool)

(assert (=> b!492328 (= e!289188 e!289189)))

(declare-fun res!295212 () Bool)

(assert (=> b!492328 (=> (not res!295212) (not e!289189))))

(declare-fun e!289190 () Bool)

(assert (=> b!492328 (= res!295212 (not e!289190))))

(declare-fun res!295214 () Bool)

(assert (=> b!492328 (=> (not res!295214) (not e!289190))))

(assert (=> b!492328 (= res!295214 (validKeyInArray!0 (select (arr!15326 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492329 () Bool)

(assert (=> b!492329 (= e!289191 call!31369)))

(declare-fun bm!31366 () Bool)

(declare-fun c!58830 () Bool)

(assert (=> bm!31366 (= call!31369 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58830 (Cons!9519 (select (arr!15326 a!3235) #b00000000000000000000000000000000) Nil!9520) Nil!9520)))))

(declare-fun d!77901 () Bool)

(declare-fun res!295213 () Bool)

(assert (=> d!77901 (=> res!295213 e!289188)))

(assert (=> d!77901 (= res!295213 (bvsge #b00000000000000000000000000000000 (size!15691 a!3235)))))

(assert (=> d!77901 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9520) e!289188)))

(declare-fun b!492330 () Bool)

(declare-fun contains!2694 (List!9523 (_ BitVec 64)) Bool)

(assert (=> b!492330 (= e!289190 (contains!2694 Nil!9520 (select (arr!15326 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492331 () Bool)

(assert (=> b!492331 (= e!289189 e!289191)))

(assert (=> b!492331 (= c!58830 (validKeyInArray!0 (select (arr!15326 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77901 (not res!295213)) b!492328))

(assert (= (and b!492328 res!295214) b!492330))

(assert (= (and b!492328 res!295212) b!492331))

(assert (= (and b!492331 c!58830) b!492329))

(assert (= (and b!492331 (not c!58830)) b!492327))

(assert (= (or b!492329 b!492327) bm!31366))

(assert (=> b!492328 m!472603))

(assert (=> b!492328 m!472603))

(assert (=> b!492328 m!472611))

(assert (=> bm!31366 m!472603))

(declare-fun m!472617 () Bool)

(assert (=> bm!31366 m!472617))

(assert (=> b!492330 m!472603))

(assert (=> b!492330 m!472603))

(declare-fun m!472619 () Bool)

(assert (=> b!492330 m!472619))

(assert (=> b!492331 m!472603))

(assert (=> b!492331 m!472603))

(assert (=> b!492331 m!472611))

(assert (=> b!492229 d!77901))

(declare-fun b!492356 () Bool)

(declare-fun e!289211 () SeekEntryResult!3790)

(assert (=> b!492356 (= e!289211 (Intermediate!3790 false lt!222423 #b00000000000000000000000000000000))))

(declare-fun d!77903 () Bool)

(declare-fun e!289209 () Bool)

(assert (=> d!77903 e!289209))

(declare-fun c!58838 () Bool)

(declare-fun lt!222456 () SeekEntryResult!3790)

(get-info :version)

(assert (=> d!77903 (= c!58838 (and ((_ is Intermediate!3790) lt!222456) (undefined!4602 lt!222456)))))

(declare-fun e!289210 () SeekEntryResult!3790)

(assert (=> d!77903 (= lt!222456 e!289210)))

(declare-fun c!58839 () Bool)

(assert (=> d!77903 (= c!58839 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222457 () (_ BitVec 64))

(assert (=> d!77903 (= lt!222457 (select (arr!15326 a!3235) lt!222423))))

(assert (=> d!77903 (validMask!0 mask!3524)))

(assert (=> d!77903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222423 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) lt!222456)))

(declare-fun b!492357 () Bool)

(assert (=> b!492357 (and (bvsge (index!17341 lt!222456) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222456) (size!15691 a!3235)))))

(declare-fun e!289212 () Bool)

(assert (=> b!492357 (= e!289212 (= (select (arr!15326 a!3235) (index!17341 lt!222456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492358 () Bool)

(assert (=> b!492358 (and (bvsge (index!17341 lt!222456) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222456) (size!15691 a!3235)))))

(declare-fun res!295228 () Bool)

(assert (=> b!492358 (= res!295228 (= (select (arr!15326 a!3235) (index!17341 lt!222456)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492358 (=> res!295228 e!289212)))

(declare-fun b!492359 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492359 (= e!289211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!222423 #b00000000000000000000000000000000 mask!3524) (select (arr!15326 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492360 () Bool)

(assert (=> b!492360 (= e!289209 (bvsge (x!46433 lt!222456) #b01111111111111111111111111111110))))

(declare-fun b!492361 () Bool)

(declare-fun e!289208 () Bool)

(assert (=> b!492361 (= e!289209 e!289208)))

(declare-fun res!295229 () Bool)

(assert (=> b!492361 (= res!295229 (and ((_ is Intermediate!3790) lt!222456) (not (undefined!4602 lt!222456)) (bvslt (x!46433 lt!222456) #b01111111111111111111111111111110) (bvsge (x!46433 lt!222456) #b00000000000000000000000000000000) (bvsge (x!46433 lt!222456) #b00000000000000000000000000000000)))))

(assert (=> b!492361 (=> (not res!295229) (not e!289208))))

(declare-fun b!492362 () Bool)

(assert (=> b!492362 (= e!289210 (Intermediate!3790 true lt!222423 #b00000000000000000000000000000000))))

(declare-fun b!492363 () Bool)

(assert (=> b!492363 (= e!289210 e!289211)))

(declare-fun c!58837 () Bool)

(assert (=> b!492363 (= c!58837 (or (= lt!222457 (select (arr!15326 a!3235) j!176)) (= (bvadd lt!222457 lt!222457) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492364 () Bool)

(assert (=> b!492364 (and (bvsge (index!17341 lt!222456) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222456) (size!15691 a!3235)))))

(declare-fun res!295227 () Bool)

(assert (=> b!492364 (= res!295227 (= (select (arr!15326 a!3235) (index!17341 lt!222456)) (select (arr!15326 a!3235) j!176)))))

(assert (=> b!492364 (=> res!295227 e!289212)))

(assert (=> b!492364 (= e!289208 e!289212)))

(assert (= (and d!77903 c!58839) b!492362))

(assert (= (and d!77903 (not c!58839)) b!492363))

(assert (= (and b!492363 c!58837) b!492356))

(assert (= (and b!492363 (not c!58837)) b!492359))

(assert (= (and d!77903 c!58838) b!492360))

(assert (= (and d!77903 (not c!58838)) b!492361))

(assert (= (and b!492361 res!295229) b!492364))

(assert (= (and b!492364 (not res!295227)) b!492358))

(assert (= (and b!492358 (not res!295228)) b!492357))

(declare-fun m!472625 () Bool)

(assert (=> b!492364 m!472625))

(assert (=> b!492357 m!472625))

(declare-fun m!472627 () Bool)

(assert (=> b!492359 m!472627))

(assert (=> b!492359 m!472627))

(assert (=> b!492359 m!472503))

(declare-fun m!472629 () Bool)

(assert (=> b!492359 m!472629))

(declare-fun m!472631 () Bool)

(assert (=> d!77903 m!472631))

(assert (=> d!77903 m!472517))

(assert (=> b!492358 m!472625))

(assert (=> b!492234 d!77903))

(declare-fun d!77911 () Bool)

(declare-fun lt!222467 () (_ BitVec 32))

(declare-fun lt!222466 () (_ BitVec 32))

(assert (=> d!77911 (= lt!222467 (bvmul (bvxor lt!222466 (bvlshr lt!222466 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77911 (= lt!222466 ((_ extract 31 0) (bvand (bvxor (select (arr!15326 a!3235) j!176) (bvlshr (select (arr!15326 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77911 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295230 (let ((h!10387 ((_ extract 31 0) (bvand (bvxor (select (arr!15326 a!3235) j!176) (bvlshr (select (arr!15326 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46437 (bvmul (bvxor h!10387 (bvlshr h!10387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46437 (bvlshr x!46437 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295230 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295230 #b00000000000000000000000000000000))))))

(assert (=> d!77911 (= (toIndex!0 (select (arr!15326 a!3235) j!176) mask!3524) (bvand (bvxor lt!222467 (bvlshr lt!222467 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492234 d!77911))

(declare-fun b!492381 () Bool)

(declare-fun e!289225 () Bool)

(declare-fun e!289227 () Bool)

(assert (=> b!492381 (= e!289225 e!289227)))

(declare-fun lt!222470 () (_ BitVec 64))

(assert (=> b!492381 (= lt!222470 (select (arr!15326 a!3235) j!176))))

(declare-fun lt!222472 () Unit!14512)

(assert (=> b!492381 (= lt!222472 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222470 j!176))))

(assert (=> b!492381 (arrayContainsKey!0 a!3235 lt!222470 #b00000000000000000000000000000000)))

(declare-fun lt!222471 () Unit!14512)

(assert (=> b!492381 (= lt!222471 lt!222472)))

(declare-fun res!295238 () Bool)

(assert (=> b!492381 (= res!295238 (= (seekEntryOrOpen!0 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) (Found!3790 j!176)))))

(assert (=> b!492381 (=> (not res!295238) (not e!289227))))

(declare-fun b!492382 () Bool)

(declare-fun call!31370 () Bool)

(assert (=> b!492382 (= e!289225 call!31370)))

(declare-fun b!492383 () Bool)

(declare-fun e!289226 () Bool)

(assert (=> b!492383 (= e!289226 e!289225)))

(declare-fun c!58846 () Bool)

(assert (=> b!492383 (= c!58846 (validKeyInArray!0 (select (arr!15326 a!3235) j!176)))))

(declare-fun d!77921 () Bool)

(declare-fun res!295237 () Bool)

(assert (=> d!77921 (=> res!295237 e!289226)))

(assert (=> d!77921 (= res!295237 (bvsge j!176 (size!15691 a!3235)))))

(assert (=> d!77921 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289226)))

(declare-fun b!492384 () Bool)

(assert (=> b!492384 (= e!289227 call!31370)))

(declare-fun bm!31367 () Bool)

(assert (=> bm!31367 (= call!31370 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77921 (not res!295237)) b!492383))

(assert (= (and b!492383 c!58846) b!492381))

(assert (= (and b!492383 (not c!58846)) b!492382))

(assert (= (and b!492381 res!295238) b!492384))

(assert (= (or b!492384 b!492382) bm!31367))

(assert (=> b!492381 m!472503))

(declare-fun m!472633 () Bool)

(assert (=> b!492381 m!472633))

(declare-fun m!472635 () Bool)

(assert (=> b!492381 m!472635))

(assert (=> b!492381 m!472503))

(assert (=> b!492381 m!472525))

(assert (=> b!492383 m!472503))

(assert (=> b!492383 m!472503))

(assert (=> b!492383 m!472527))

(declare-fun m!472637 () Bool)

(assert (=> bm!31367 m!472637))

(assert (=> b!492234 d!77921))

(declare-fun d!77923 () Bool)

(assert (=> d!77923 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222478 () Unit!14512)

(declare-fun choose!38 (array!31880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14512)

(assert (=> d!77923 (= lt!222478 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77923 (validMask!0 mask!3524)))

(assert (=> d!77923 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222478)))

(declare-fun bs!15673 () Bool)

(assert (= bs!15673 d!77923))

(assert (=> bs!15673 m!472513))

(declare-fun m!472659 () Bool)

(assert (=> bs!15673 m!472659))

(assert (=> bs!15673 m!472517))

(assert (=> b!492234 d!77923))

(declare-fun d!77929 () Bool)

(declare-fun lt!222480 () (_ BitVec 32))

(declare-fun lt!222479 () (_ BitVec 32))

(assert (=> d!77929 (= lt!222480 (bvmul (bvxor lt!222479 (bvlshr lt!222479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77929 (= lt!222479 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77929 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295230 (let ((h!10387 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46437 (bvmul (bvxor h!10387 (bvlshr h!10387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46437 (bvlshr x!46437 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295230 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295230 #b00000000000000000000000000000000))))))

(assert (=> d!77929 (= (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222480 (bvlshr lt!222480 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492234 d!77929))

(declare-fun b!492402 () Bool)

(declare-fun e!289240 () SeekEntryResult!3790)

(assert (=> b!492402 (= e!289240 (Intermediate!3790 false (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun d!77931 () Bool)

(declare-fun e!289238 () Bool)

(assert (=> d!77931 e!289238))

(declare-fun c!58854 () Bool)

(declare-fun lt!222481 () SeekEntryResult!3790)

(assert (=> d!77931 (= c!58854 (and ((_ is Intermediate!3790) lt!222481) (undefined!4602 lt!222481)))))

(declare-fun e!289239 () SeekEntryResult!3790)

(assert (=> d!77931 (= lt!222481 e!289239)))

(declare-fun c!58855 () Bool)

(assert (=> d!77931 (= c!58855 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222482 () (_ BitVec 64))

(assert (=> d!77931 (= lt!222482 (select (arr!15326 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235))) (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!77931 (validMask!0 mask!3524)))

(assert (=> d!77931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)) mask!3524) lt!222481)))

(declare-fun b!492403 () Bool)

(assert (=> b!492403 (and (bvsge (index!17341 lt!222481) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222481) (size!15691 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)))))))

(declare-fun e!289241 () Bool)

(assert (=> b!492403 (= e!289241 (= (select (arr!15326 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235))) (index!17341 lt!222481)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492404 () Bool)

(assert (=> b!492404 (and (bvsge (index!17341 lt!222481) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222481) (size!15691 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)))))))

(declare-fun res!295243 () Bool)

(assert (=> b!492404 (= res!295243 (= (select (arr!15326 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235))) (index!17341 lt!222481)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492404 (=> res!295243 e!289241)))

(declare-fun b!492405 () Bool)

(assert (=> b!492405 (= e!289240 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)) mask!3524))))

(declare-fun b!492406 () Bool)

(assert (=> b!492406 (= e!289238 (bvsge (x!46433 lt!222481) #b01111111111111111111111111111110))))

(declare-fun b!492407 () Bool)

(declare-fun e!289237 () Bool)

(assert (=> b!492407 (= e!289238 e!289237)))

(declare-fun res!295244 () Bool)

(assert (=> b!492407 (= res!295244 (and ((_ is Intermediate!3790) lt!222481) (not (undefined!4602 lt!222481)) (bvslt (x!46433 lt!222481) #b01111111111111111111111111111110) (bvsge (x!46433 lt!222481) #b00000000000000000000000000000000) (bvsge (x!46433 lt!222481) #b00000000000000000000000000000000)))))

(assert (=> b!492407 (=> (not res!295244) (not e!289237))))

(declare-fun b!492408 () Bool)

(assert (=> b!492408 (= e!289239 (Intermediate!3790 true (toIndex!0 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492409 () Bool)

(assert (=> b!492409 (= e!289239 e!289240)))

(declare-fun c!58853 () Bool)

(assert (=> b!492409 (= c!58853 (or (= lt!222482 (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222482 lt!222482) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492410 () Bool)

(assert (=> b!492410 (and (bvsge (index!17341 lt!222481) #b00000000000000000000000000000000) (bvslt (index!17341 lt!222481) (size!15691 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235)))))))

(declare-fun res!295242 () Bool)

(assert (=> b!492410 (= res!295242 (= (select (arr!15326 (array!31881 (store (arr!15326 a!3235) i!1204 k0!2280) (size!15691 a!3235))) (index!17341 lt!222481)) (select (store (arr!15326 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!492410 (=> res!295242 e!289241)))

(assert (=> b!492410 (= e!289237 e!289241)))

(assert (= (and d!77931 c!58855) b!492408))

(assert (= (and d!77931 (not c!58855)) b!492409))

(assert (= (and b!492409 c!58853) b!492402))

(assert (= (and b!492409 (not c!58853)) b!492405))

(assert (= (and d!77931 c!58854) b!492406))

(assert (= (and d!77931 (not c!58854)) b!492407))

(assert (= (and b!492407 res!295244) b!492410))

(assert (= (and b!492410 (not res!295242)) b!492404))

(assert (= (and b!492404 (not res!295243)) b!492403))

(declare-fun m!472661 () Bool)

(assert (=> b!492410 m!472661))

(assert (=> b!492403 m!472661))

(assert (=> b!492405 m!472509))

(declare-fun m!472663 () Bool)

(assert (=> b!492405 m!472663))

(assert (=> b!492405 m!472663))

(assert (=> b!492405 m!472501))

(declare-fun m!472665 () Bool)

(assert (=> b!492405 m!472665))

(assert (=> d!77931 m!472509))

(declare-fun m!472667 () Bool)

(assert (=> d!77931 m!472667))

(assert (=> d!77931 m!472517))

(assert (=> b!492404 m!472661))

(assert (=> b!492234 d!77931))

(declare-fun d!77933 () Bool)

(assert (=> d!77933 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44868 d!77933))

(declare-fun d!77939 () Bool)

(assert (=> d!77939 (= (array_inv!11209 a!3235) (bvsge (size!15691 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44868 d!77939))

(declare-fun d!77941 () Bool)

(assert (=> d!77941 (= (validKeyInArray!0 (select (arr!15326 a!3235) j!176)) (and (not (= (select (arr!15326 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15326 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492232 d!77941))

(declare-fun b!492488 () Bool)

(declare-fun e!289294 () SeekEntryResult!3790)

(declare-fun lt!222524 () SeekEntryResult!3790)

(assert (=> b!492488 (= e!289294 (Found!3790 (index!17341 lt!222524)))))

(declare-fun b!492489 () Bool)

(declare-fun e!289293 () SeekEntryResult!3790)

(assert (=> b!492489 (= e!289293 e!289294)))

(declare-fun lt!222523 () (_ BitVec 64))

(assert (=> b!492489 (= lt!222523 (select (arr!15326 a!3235) (index!17341 lt!222524)))))

(declare-fun c!58882 () Bool)

(assert (=> b!492489 (= c!58882 (= lt!222523 (select (arr!15326 a!3235) j!176)))))

(declare-fun b!492490 () Bool)

(declare-fun e!289295 () SeekEntryResult!3790)

(assert (=> b!492490 (= e!289295 (MissingZero!3790 (index!17341 lt!222524)))))

(declare-fun d!77943 () Bool)

(declare-fun lt!222522 () SeekEntryResult!3790)

(assert (=> d!77943 (and (or ((_ is Undefined!3790) lt!222522) (not ((_ is Found!3790) lt!222522)) (and (bvsge (index!17340 lt!222522) #b00000000000000000000000000000000) (bvslt (index!17340 lt!222522) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222522) ((_ is Found!3790) lt!222522) (not ((_ is MissingZero!3790) lt!222522)) (and (bvsge (index!17339 lt!222522) #b00000000000000000000000000000000) (bvslt (index!17339 lt!222522) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222522) ((_ is Found!3790) lt!222522) ((_ is MissingZero!3790) lt!222522) (not ((_ is MissingVacant!3790) lt!222522)) (and (bvsge (index!17342 lt!222522) #b00000000000000000000000000000000) (bvslt (index!17342 lt!222522) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222522) (ite ((_ is Found!3790) lt!222522) (= (select (arr!15326 a!3235) (index!17340 lt!222522)) (select (arr!15326 a!3235) j!176)) (ite ((_ is MissingZero!3790) lt!222522) (= (select (arr!15326 a!3235) (index!17339 lt!222522)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3790) lt!222522) (= (select (arr!15326 a!3235) (index!17342 lt!222522)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77943 (= lt!222522 e!289293)))

(declare-fun c!58884 () Bool)

(assert (=> d!77943 (= c!58884 (and ((_ is Intermediate!3790) lt!222524) (undefined!4602 lt!222524)))))

(assert (=> d!77943 (= lt!222524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15326 a!3235) j!176) mask!3524) (select (arr!15326 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77943 (validMask!0 mask!3524)))

(assert (=> d!77943 (= (seekEntryOrOpen!0 (select (arr!15326 a!3235) j!176) a!3235 mask!3524) lt!222522)))

(declare-fun b!492491 () Bool)

(declare-fun c!58883 () Bool)

(assert (=> b!492491 (= c!58883 (= lt!222523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492491 (= e!289294 e!289295)))

(declare-fun b!492492 () Bool)

(assert (=> b!492492 (= e!289293 Undefined!3790)))

(declare-fun b!492493 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31880 (_ BitVec 32)) SeekEntryResult!3790)

(assert (=> b!492493 (= e!289295 (seekKeyOrZeroReturnVacant!0 (x!46433 lt!222524) (index!17341 lt!222524) (index!17341 lt!222524) (select (arr!15326 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!77943 c!58884) b!492492))

(assert (= (and d!77943 (not c!58884)) b!492489))

(assert (= (and b!492489 c!58882) b!492488))

(assert (= (and b!492489 (not c!58882)) b!492491))

(assert (= (and b!492491 c!58883) b!492490))

(assert (= (and b!492491 (not c!58883)) b!492493))

(declare-fun m!472711 () Bool)

(assert (=> b!492489 m!472711))

(assert (=> d!77943 m!472517))

(declare-fun m!472713 () Bool)

(assert (=> d!77943 m!472713))

(assert (=> d!77943 m!472503))

(assert (=> d!77943 m!472507))

(declare-fun m!472715 () Bool)

(assert (=> d!77943 m!472715))

(assert (=> d!77943 m!472507))

(assert (=> d!77943 m!472503))

(declare-fun m!472717 () Bool)

(assert (=> d!77943 m!472717))

(declare-fun m!472719 () Bool)

(assert (=> d!77943 m!472719))

(assert (=> b!492493 m!472503))

(declare-fun m!472721 () Bool)

(assert (=> b!492493 m!472721))

(assert (=> b!492233 d!77943))

(declare-fun b!492494 () Bool)

(declare-fun e!289298 () SeekEntryResult!3790)

(declare-fun lt!222530 () SeekEntryResult!3790)

(assert (=> b!492494 (= e!289298 (Found!3790 (index!17341 lt!222530)))))

(declare-fun b!492495 () Bool)

(declare-fun e!289296 () SeekEntryResult!3790)

(assert (=> b!492495 (= e!289296 e!289298)))

(declare-fun lt!222528 () (_ BitVec 64))

(assert (=> b!492495 (= lt!222528 (select (arr!15326 a!3235) (index!17341 lt!222530)))))

(declare-fun c!58885 () Bool)

(assert (=> b!492495 (= c!58885 (= lt!222528 k0!2280))))

(declare-fun b!492496 () Bool)

(declare-fun e!289299 () SeekEntryResult!3790)

(assert (=> b!492496 (= e!289299 (MissingZero!3790 (index!17341 lt!222530)))))

(declare-fun d!77957 () Bool)

(declare-fun lt!222527 () SeekEntryResult!3790)

(assert (=> d!77957 (and (or ((_ is Undefined!3790) lt!222527) (not ((_ is Found!3790) lt!222527)) (and (bvsge (index!17340 lt!222527) #b00000000000000000000000000000000) (bvslt (index!17340 lt!222527) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222527) ((_ is Found!3790) lt!222527) (not ((_ is MissingZero!3790) lt!222527)) (and (bvsge (index!17339 lt!222527) #b00000000000000000000000000000000) (bvslt (index!17339 lt!222527) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222527) ((_ is Found!3790) lt!222527) ((_ is MissingZero!3790) lt!222527) (not ((_ is MissingVacant!3790) lt!222527)) (and (bvsge (index!17342 lt!222527) #b00000000000000000000000000000000) (bvslt (index!17342 lt!222527) (size!15691 a!3235)))) (or ((_ is Undefined!3790) lt!222527) (ite ((_ is Found!3790) lt!222527) (= (select (arr!15326 a!3235) (index!17340 lt!222527)) k0!2280) (ite ((_ is MissingZero!3790) lt!222527) (= (select (arr!15326 a!3235) (index!17339 lt!222527)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3790) lt!222527) (= (select (arr!15326 a!3235) (index!17342 lt!222527)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77957 (= lt!222527 e!289296)))

(declare-fun c!58887 () Bool)

(assert (=> d!77957 (= c!58887 (and ((_ is Intermediate!3790) lt!222530) (undefined!4602 lt!222530)))))

(assert (=> d!77957 (= lt!222530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77957 (validMask!0 mask!3524)))

(assert (=> d!77957 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222527)))

(declare-fun b!492498 () Bool)

(declare-fun c!58886 () Bool)

(assert (=> b!492498 (= c!58886 (= lt!222528 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492498 (= e!289298 e!289299)))

(declare-fun b!492500 () Bool)

(assert (=> b!492500 (= e!289296 Undefined!3790)))

(declare-fun b!492502 () Bool)

(assert (=> b!492502 (= e!289299 (seekKeyOrZeroReturnVacant!0 (x!46433 lt!222530) (index!17341 lt!222530) (index!17341 lt!222530) k0!2280 a!3235 mask!3524))))

(assert (= (and d!77957 c!58887) b!492500))

(assert (= (and d!77957 (not c!58887)) b!492495))

(assert (= (and b!492495 c!58885) b!492494))

(assert (= (and b!492495 (not c!58885)) b!492498))

(assert (= (and b!492498 c!58886) b!492496))

(assert (= (and b!492498 (not c!58886)) b!492502))

(declare-fun m!472727 () Bool)

(assert (=> b!492495 m!472727))

(assert (=> d!77957 m!472517))

(declare-fun m!472731 () Bool)

(assert (=> d!77957 m!472731))

(declare-fun m!472733 () Bool)

(assert (=> d!77957 m!472733))

(declare-fun m!472735 () Bool)

(assert (=> d!77957 m!472735))

(assert (=> d!77957 m!472733))

(declare-fun m!472737 () Bool)

(assert (=> d!77957 m!472737))

(declare-fun m!472739 () Bool)

(assert (=> d!77957 m!472739))

(declare-fun m!472741 () Bool)

(assert (=> b!492502 m!472741))

(assert (=> b!492238 d!77957))

(check-sat (not b!492328) (not b!492493) (not b!492405) (not bm!31366) (not b!492331) (not bm!31367) (not bm!31363) (not b!492309) (not b!492383) (not b!492316) (not b!492330) (not b!492381) (not b!492502) (not d!77957) (not d!77903) (not d!77943) (not d!77931) (not b!492307) (not b!492359) (not d!77923))
(check-sat)
