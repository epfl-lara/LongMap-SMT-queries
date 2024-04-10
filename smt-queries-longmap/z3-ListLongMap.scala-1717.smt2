; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31594 () Bool)

(assert start!31594)

(declare-fun b!316192 () Bool)

(declare-fun res!171326 () Bool)

(declare-fun e!196682 () Bool)

(assert (=> b!316192 (=> (not res!171326) (not e!196682))))

(declare-datatypes ((array!16118 0))(
  ( (array!16119 (arr!7629 (Array (_ BitVec 32) (_ BitVec 64))) (size!7981 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16118)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2769 0))(
  ( (MissingZero!2769 (index!13252 (_ BitVec 32))) (Found!2769 (index!13253 (_ BitVec 32))) (Intermediate!2769 (undefined!3581 Bool) (index!13254 (_ BitVec 32)) (x!31495 (_ BitVec 32))) (Undefined!2769) (MissingVacant!2769 (index!13255 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16118 (_ BitVec 32)) SeekEntryResult!2769)

(assert (=> b!316192 (= res!171326 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2769 i!1240)))))

(declare-fun b!316193 () Bool)

(declare-fun res!171320 () Bool)

(declare-fun e!196683 () Bool)

(assert (=> b!316193 (=> (not res!171320) (not e!196683))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316193 (= res!171320 (and (= (select (arr!7629 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7981 a!3293))))))

(declare-fun b!316195 () Bool)

(declare-fun e!196681 () Bool)

(assert (=> b!316195 (= e!196683 e!196681)))

(declare-fun res!171318 () Bool)

(assert (=> b!316195 (=> (not res!171318) (not e!196681))))

(declare-fun lt!154471 () SeekEntryResult!2769)

(declare-fun lt!154473 () SeekEntryResult!2769)

(assert (=> b!316195 (= res!171318 (and (= lt!154471 lt!154473) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7629 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16118 (_ BitVec 32)) SeekEntryResult!2769)

(assert (=> b!316195 (= lt!154471 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316196 () Bool)

(declare-fun res!171327 () Bool)

(assert (=> b!316196 (=> (not res!171327) (not e!196682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16118 (_ BitVec 32)) Bool)

(assert (=> b!316196 (= res!171327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316197 () Bool)

(assert (=> b!316197 false))

(declare-fun lt!154472 () SeekEntryResult!2769)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316197 (= lt!154472 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9772 0))(
  ( (Unit!9773) )
))
(declare-fun e!196678 () Unit!9772)

(declare-fun Unit!9774 () Unit!9772)

(assert (=> b!316197 (= e!196678 Unit!9774)))

(declare-fun b!316198 () Bool)

(declare-fun res!171319 () Bool)

(assert (=> b!316198 (=> (not res!171319) (not e!196682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316198 (= res!171319 (validKeyInArray!0 k0!2441))))

(declare-fun b!316199 () Bool)

(assert (=> b!316199 false))

(declare-fun Unit!9775 () Unit!9772)

(assert (=> b!316199 (= e!196678 Unit!9775)))

(declare-fun e!196679 () Bool)

(declare-fun b!316200 () Bool)

(assert (=> b!316200 (= e!196679 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)) mask!3709) lt!154471))))

(declare-fun b!316201 () Bool)

(declare-fun res!171323 () Bool)

(assert (=> b!316201 (=> (not res!171323) (not e!196682))))

(declare-fun arrayContainsKey!0 (array!16118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316201 (= res!171323 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316194 () Bool)

(assert (=> b!316194 (= e!196681 (not e!196679))))

(declare-fun res!171322 () Bool)

(assert (=> b!316194 (=> res!171322 e!196679)))

(assert (=> b!316194 (= res!171322 (not (= (select (arr!7629 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!316194 (= index!1781 resIndex!52)))

(declare-fun lt!154470 () Unit!9772)

(declare-fun e!196684 () Unit!9772)

(assert (=> b!316194 (= lt!154470 e!196684)))

(declare-fun c!50054 () Bool)

(assert (=> b!316194 (= c!50054 (not (= resIndex!52 index!1781)))))

(declare-fun res!171325 () Bool)

(assert (=> start!31594 (=> (not res!171325) (not e!196682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31594 (= res!171325 (validMask!0 mask!3709))))

(assert (=> start!31594 e!196682))

(declare-fun array_inv!5592 (array!16118) Bool)

(assert (=> start!31594 (array_inv!5592 a!3293)))

(assert (=> start!31594 true))

(declare-fun b!316202 () Bool)

(declare-fun Unit!9776 () Unit!9772)

(assert (=> b!316202 (= e!196684 Unit!9776)))

(declare-fun b!316203 () Bool)

(declare-fun res!171324 () Bool)

(assert (=> b!316203 (=> (not res!171324) (not e!196682))))

(assert (=> b!316203 (= res!171324 (and (= (size!7981 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7981 a!3293))))))

(declare-fun b!316204 () Bool)

(assert (=> b!316204 (= e!196684 e!196678)))

(declare-fun c!50055 () Bool)

(assert (=> b!316204 (= c!50055 (or (= (select (arr!7629 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7629 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316205 () Bool)

(assert (=> b!316205 (= e!196682 e!196683)))

(declare-fun res!171321 () Bool)

(assert (=> b!316205 (=> (not res!171321) (not e!196683))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316205 (= res!171321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154473))))

(assert (=> b!316205 (= lt!154473 (Intermediate!2769 false resIndex!52 resX!52))))

(assert (= (and start!31594 res!171325) b!316203))

(assert (= (and b!316203 res!171324) b!316198))

(assert (= (and b!316198 res!171319) b!316201))

(assert (= (and b!316201 res!171323) b!316192))

(assert (= (and b!316192 res!171326) b!316196))

(assert (= (and b!316196 res!171327) b!316205))

(assert (= (and b!316205 res!171321) b!316193))

(assert (= (and b!316193 res!171320) b!316195))

(assert (= (and b!316195 res!171318) b!316194))

(assert (= (and b!316194 c!50054) b!316204))

(assert (= (and b!316194 (not c!50054)) b!316202))

(assert (= (and b!316204 c!50055) b!316199))

(assert (= (and b!316204 (not c!50055)) b!316197))

(assert (= (and b!316194 (not res!171322)) b!316200))

(declare-fun m!325175 () Bool)

(assert (=> b!316198 m!325175))

(declare-fun m!325177 () Bool)

(assert (=> b!316204 m!325177))

(declare-fun m!325179 () Bool)

(assert (=> start!31594 m!325179))

(declare-fun m!325181 () Bool)

(assert (=> start!31594 m!325181))

(assert (=> b!316194 m!325177))

(declare-fun m!325183 () Bool)

(assert (=> b!316193 m!325183))

(assert (=> b!316195 m!325177))

(declare-fun m!325185 () Bool)

(assert (=> b!316195 m!325185))

(declare-fun m!325187 () Bool)

(assert (=> b!316205 m!325187))

(assert (=> b!316205 m!325187))

(declare-fun m!325189 () Bool)

(assert (=> b!316205 m!325189))

(declare-fun m!325191 () Bool)

(assert (=> b!316201 m!325191))

(declare-fun m!325193 () Bool)

(assert (=> b!316200 m!325193))

(declare-fun m!325195 () Bool)

(assert (=> b!316200 m!325195))

(declare-fun m!325197 () Bool)

(assert (=> b!316192 m!325197))

(declare-fun m!325199 () Bool)

(assert (=> b!316196 m!325199))

(declare-fun m!325201 () Bool)

(assert (=> b!316197 m!325201))

(assert (=> b!316197 m!325201))

(declare-fun m!325203 () Bool)

(assert (=> b!316197 m!325203))

(check-sat (not start!31594) (not b!316201) (not b!316205) (not b!316197) (not b!316198) (not b!316195) (not b!316200) (not b!316192) (not b!316196))
(check-sat)
(get-model)

(declare-fun b!316266 () Bool)

(declare-fun e!196717 () Bool)

(declare-fun lt!154491 () SeekEntryResult!2769)

(assert (=> b!316266 (= e!196717 (bvsge (x!31495 lt!154491) #b01111111111111111111111111111110))))

(declare-fun b!316268 () Bool)

(declare-fun e!196718 () SeekEntryResult!2769)

(assert (=> b!316268 (= e!196718 (Intermediate!2769 true index!1781 x!1427))))

(declare-fun e!196716 () SeekEntryResult!2769)

(declare-fun b!316269 () Bool)

(assert (=> b!316269 (= e!196716 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)) mask!3709))))

(declare-fun b!316270 () Bool)

(assert (=> b!316270 (and (bvsge (index!13254 lt!154491) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154491) (size!7981 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)))))))

(declare-fun res!171366 () Bool)

(assert (=> b!316270 (= res!171366 (= (select (arr!7629 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293))) (index!13254 lt!154491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196720 () Bool)

(assert (=> b!316270 (=> res!171366 e!196720)))

(declare-fun b!316271 () Bool)

(assert (=> b!316271 (= e!196718 e!196716)))

(declare-fun c!50070 () Bool)

(declare-fun lt!154490 () (_ BitVec 64))

(assert (=> b!316271 (= c!50070 (or (= lt!154490 k0!2441) (= (bvadd lt!154490 lt!154490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316272 () Bool)

(assert (=> b!316272 (and (bvsge (index!13254 lt!154491) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154491) (size!7981 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)))))))

(assert (=> b!316272 (= e!196720 (= (select (arr!7629 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293))) (index!13254 lt!154491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316273 () Bool)

(assert (=> b!316273 (= e!196716 (Intermediate!2769 false index!1781 x!1427))))

(declare-fun b!316274 () Bool)

(declare-fun e!196719 () Bool)

(assert (=> b!316274 (= e!196717 e!196719)))

(declare-fun res!171365 () Bool)

(get-info :version)

(assert (=> b!316274 (= res!171365 (and ((_ is Intermediate!2769) lt!154491) (not (undefined!3581 lt!154491)) (bvslt (x!31495 lt!154491) #b01111111111111111111111111111110) (bvsge (x!31495 lt!154491) #b00000000000000000000000000000000) (bvsge (x!31495 lt!154491) x!1427)))))

(assert (=> b!316274 (=> (not res!171365) (not e!196719))))

(declare-fun d!68975 () Bool)

(assert (=> d!68975 e!196717))

(declare-fun c!50068 () Bool)

(assert (=> d!68975 (= c!50068 (and ((_ is Intermediate!2769) lt!154491) (undefined!3581 lt!154491)))))

(assert (=> d!68975 (= lt!154491 e!196718)))

(declare-fun c!50069 () Bool)

(assert (=> d!68975 (= c!50069 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68975 (= lt!154490 (select (arr!7629 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293))) index!1781))))

(assert (=> d!68975 (validMask!0 mask!3709)))

(assert (=> d!68975 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)) mask!3709) lt!154491)))

(declare-fun b!316267 () Bool)

(assert (=> b!316267 (and (bvsge (index!13254 lt!154491) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154491) (size!7981 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293)))))))

(declare-fun res!171364 () Bool)

(assert (=> b!316267 (= res!171364 (= (select (arr!7629 (array!16119 (store (arr!7629 a!3293) i!1240 k0!2441) (size!7981 a!3293))) (index!13254 lt!154491)) k0!2441))))

(assert (=> b!316267 (=> res!171364 e!196720)))

(assert (=> b!316267 (= e!196719 e!196720)))

(assert (= (and d!68975 c!50069) b!316268))

(assert (= (and d!68975 (not c!50069)) b!316271))

(assert (= (and b!316271 c!50070) b!316273))

(assert (= (and b!316271 (not c!50070)) b!316269))

(assert (= (and d!68975 c!50068) b!316266))

(assert (= (and d!68975 (not c!50068)) b!316274))

(assert (= (and b!316274 res!171365) b!316267))

(assert (= (and b!316267 (not res!171364)) b!316270))

(assert (= (and b!316270 (not res!171366)) b!316272))

(declare-fun m!325235 () Bool)

(assert (=> b!316267 m!325235))

(assert (=> b!316269 m!325201))

(assert (=> b!316269 m!325201))

(declare-fun m!325237 () Bool)

(assert (=> b!316269 m!325237))

(declare-fun m!325239 () Bool)

(assert (=> d!68975 m!325239))

(assert (=> d!68975 m!325179))

(assert (=> b!316272 m!325235))

(assert (=> b!316270 m!325235))

(assert (=> b!316200 d!68975))

(declare-fun b!316275 () Bool)

(declare-fun e!196722 () Bool)

(declare-fun lt!154493 () SeekEntryResult!2769)

(assert (=> b!316275 (= e!196722 (bvsge (x!31495 lt!154493) #b01111111111111111111111111111110))))

(declare-fun b!316277 () Bool)

(declare-fun e!196723 () SeekEntryResult!2769)

(assert (=> b!316277 (= e!196723 (Intermediate!2769 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun e!196721 () SeekEntryResult!2769)

(declare-fun b!316278 () Bool)

(assert (=> b!316278 (= e!196721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316279 () Bool)

(assert (=> b!316279 (and (bvsge (index!13254 lt!154493) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154493) (size!7981 a!3293)))))

(declare-fun res!171369 () Bool)

(assert (=> b!316279 (= res!171369 (= (select (arr!7629 a!3293) (index!13254 lt!154493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196725 () Bool)

(assert (=> b!316279 (=> res!171369 e!196725)))

(declare-fun b!316280 () Bool)

(assert (=> b!316280 (= e!196723 e!196721)))

(declare-fun c!50073 () Bool)

(declare-fun lt!154492 () (_ BitVec 64))

(assert (=> b!316280 (= c!50073 (or (= lt!154492 k0!2441) (= (bvadd lt!154492 lt!154492) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316281 () Bool)

(assert (=> b!316281 (and (bvsge (index!13254 lt!154493) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154493) (size!7981 a!3293)))))

(assert (=> b!316281 (= e!196725 (= (select (arr!7629 a!3293) (index!13254 lt!154493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316282 () Bool)

(assert (=> b!316282 (= e!196721 (Intermediate!2769 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316283 () Bool)

(declare-fun e!196724 () Bool)

(assert (=> b!316283 (= e!196722 e!196724)))

(declare-fun res!171368 () Bool)

(assert (=> b!316283 (= res!171368 (and ((_ is Intermediate!2769) lt!154493) (not (undefined!3581 lt!154493)) (bvslt (x!31495 lt!154493) #b01111111111111111111111111111110) (bvsge (x!31495 lt!154493) #b00000000000000000000000000000000) (bvsge (x!31495 lt!154493) #b00000000000000000000000000000000)))))

(assert (=> b!316283 (=> (not res!171368) (not e!196724))))

(declare-fun d!68977 () Bool)

(assert (=> d!68977 e!196722))

(declare-fun c!50071 () Bool)

(assert (=> d!68977 (= c!50071 (and ((_ is Intermediate!2769) lt!154493) (undefined!3581 lt!154493)))))

(assert (=> d!68977 (= lt!154493 e!196723)))

(declare-fun c!50072 () Bool)

(assert (=> d!68977 (= c!50072 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68977 (= lt!154492 (select (arr!7629 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68977 (validMask!0 mask!3709)))

(assert (=> d!68977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154493)))

(declare-fun b!316276 () Bool)

(assert (=> b!316276 (and (bvsge (index!13254 lt!154493) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154493) (size!7981 a!3293)))))

(declare-fun res!171367 () Bool)

(assert (=> b!316276 (= res!171367 (= (select (arr!7629 a!3293) (index!13254 lt!154493)) k0!2441))))

(assert (=> b!316276 (=> res!171367 e!196725)))

(assert (=> b!316276 (= e!196724 e!196725)))

(assert (= (and d!68977 c!50072) b!316277))

(assert (= (and d!68977 (not c!50072)) b!316280))

(assert (= (and b!316280 c!50073) b!316282))

(assert (= (and b!316280 (not c!50073)) b!316278))

(assert (= (and d!68977 c!50071) b!316275))

(assert (= (and d!68977 (not c!50071)) b!316283))

(assert (= (and b!316283 res!171368) b!316276))

(assert (= (and b!316276 (not res!171367)) b!316279))

(assert (= (and b!316279 (not res!171369)) b!316281))

(declare-fun m!325241 () Bool)

(assert (=> b!316276 m!325241))

(assert (=> b!316278 m!325187))

(declare-fun m!325243 () Bool)

(assert (=> b!316278 m!325243))

(assert (=> b!316278 m!325243))

(declare-fun m!325245 () Bool)

(assert (=> b!316278 m!325245))

(assert (=> d!68977 m!325187))

(declare-fun m!325247 () Bool)

(assert (=> d!68977 m!325247))

(assert (=> d!68977 m!325179))

(assert (=> b!316281 m!325241))

(assert (=> b!316279 m!325241))

(assert (=> b!316205 d!68977))

(declare-fun d!68979 () Bool)

(declare-fun lt!154499 () (_ BitVec 32))

(declare-fun lt!154498 () (_ BitVec 32))

(assert (=> d!68979 (= lt!154499 (bvmul (bvxor lt!154498 (bvlshr lt!154498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68979 (= lt!154498 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68979 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171370 (let ((h!5370 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31498 (bvmul (bvxor h!5370 (bvlshr h!5370 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31498 (bvlshr x!31498 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171370 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171370 #b00000000000000000000000000000000))))))

(assert (=> d!68979 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154499 (bvlshr lt!154499 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316205 d!68979))

(declare-fun b!316290 () Bool)

(declare-fun e!196733 () Bool)

(declare-fun lt!154501 () SeekEntryResult!2769)

(assert (=> b!316290 (= e!196733 (bvsge (x!31495 lt!154501) #b01111111111111111111111111111110))))

(declare-fun b!316292 () Bool)

(declare-fun e!196734 () SeekEntryResult!2769)

(assert (=> b!316292 (= e!196734 (Intermediate!2769 true index!1781 x!1427))))

(declare-fun b!316293 () Bool)

(declare-fun e!196732 () SeekEntryResult!2769)

(assert (=> b!316293 (= e!196732 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316294 () Bool)

(assert (=> b!316294 (and (bvsge (index!13254 lt!154501) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154501) (size!7981 a!3293)))))

(declare-fun res!171379 () Bool)

(assert (=> b!316294 (= res!171379 (= (select (arr!7629 a!3293) (index!13254 lt!154501)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196736 () Bool)

(assert (=> b!316294 (=> res!171379 e!196736)))

(declare-fun b!316295 () Bool)

(assert (=> b!316295 (= e!196734 e!196732)))

(declare-fun c!50076 () Bool)

(declare-fun lt!154500 () (_ BitVec 64))

(assert (=> b!316295 (= c!50076 (or (= lt!154500 k0!2441) (= (bvadd lt!154500 lt!154500) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316296 () Bool)

(assert (=> b!316296 (and (bvsge (index!13254 lt!154501) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154501) (size!7981 a!3293)))))

(assert (=> b!316296 (= e!196736 (= (select (arr!7629 a!3293) (index!13254 lt!154501)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316297 () Bool)

(assert (=> b!316297 (= e!196732 (Intermediate!2769 false index!1781 x!1427))))

(declare-fun b!316298 () Bool)

(declare-fun e!196735 () Bool)

(assert (=> b!316298 (= e!196733 e!196735)))

(declare-fun res!171378 () Bool)

(assert (=> b!316298 (= res!171378 (and ((_ is Intermediate!2769) lt!154501) (not (undefined!3581 lt!154501)) (bvslt (x!31495 lt!154501) #b01111111111111111111111111111110) (bvsge (x!31495 lt!154501) #b00000000000000000000000000000000) (bvsge (x!31495 lt!154501) x!1427)))))

(assert (=> b!316298 (=> (not res!171378) (not e!196735))))

(declare-fun d!68985 () Bool)

(assert (=> d!68985 e!196733))

(declare-fun c!50074 () Bool)

(assert (=> d!68985 (= c!50074 (and ((_ is Intermediate!2769) lt!154501) (undefined!3581 lt!154501)))))

(assert (=> d!68985 (= lt!154501 e!196734)))

(declare-fun c!50075 () Bool)

(assert (=> d!68985 (= c!50075 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68985 (= lt!154500 (select (arr!7629 a!3293) index!1781))))

(assert (=> d!68985 (validMask!0 mask!3709)))

(assert (=> d!68985 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154501)))

(declare-fun b!316291 () Bool)

(assert (=> b!316291 (and (bvsge (index!13254 lt!154501) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154501) (size!7981 a!3293)))))

(declare-fun res!171377 () Bool)

(assert (=> b!316291 (= res!171377 (= (select (arr!7629 a!3293) (index!13254 lt!154501)) k0!2441))))

(assert (=> b!316291 (=> res!171377 e!196736)))

(assert (=> b!316291 (= e!196735 e!196736)))

(assert (= (and d!68985 c!50075) b!316292))

(assert (= (and d!68985 (not c!50075)) b!316295))

(assert (= (and b!316295 c!50076) b!316297))

(assert (= (and b!316295 (not c!50076)) b!316293))

(assert (= (and d!68985 c!50074) b!316290))

(assert (= (and d!68985 (not c!50074)) b!316298))

(assert (= (and b!316298 res!171378) b!316291))

(assert (= (and b!316291 (not res!171377)) b!316294))

(assert (= (and b!316294 (not res!171379)) b!316296))

(declare-fun m!325253 () Bool)

(assert (=> b!316291 m!325253))

(assert (=> b!316293 m!325201))

(assert (=> b!316293 m!325201))

(declare-fun m!325255 () Bool)

(assert (=> b!316293 m!325255))

(assert (=> d!68985 m!325177))

(assert (=> d!68985 m!325179))

(assert (=> b!316296 m!325253))

(assert (=> b!316294 m!325253))

(assert (=> b!316195 d!68985))

(declare-fun b!316344 () Bool)

(declare-fun e!196765 () SeekEntryResult!2769)

(assert (=> b!316344 (= e!196765 Undefined!2769)))

(declare-fun b!316345 () Bool)

(declare-fun e!196764 () SeekEntryResult!2769)

(assert (=> b!316345 (= e!196765 e!196764)))

(declare-fun lt!154515 () (_ BitVec 64))

(declare-fun lt!154516 () SeekEntryResult!2769)

(assert (=> b!316345 (= lt!154515 (select (arr!7629 a!3293) (index!13254 lt!154516)))))

(declare-fun c!50094 () Bool)

(assert (=> b!316345 (= c!50094 (= lt!154515 k0!2441))))

(declare-fun d!68989 () Bool)

(declare-fun lt!154514 () SeekEntryResult!2769)

(assert (=> d!68989 (and (or ((_ is Undefined!2769) lt!154514) (not ((_ is Found!2769) lt!154514)) (and (bvsge (index!13253 lt!154514) #b00000000000000000000000000000000) (bvslt (index!13253 lt!154514) (size!7981 a!3293)))) (or ((_ is Undefined!2769) lt!154514) ((_ is Found!2769) lt!154514) (not ((_ is MissingZero!2769) lt!154514)) (and (bvsge (index!13252 lt!154514) #b00000000000000000000000000000000) (bvslt (index!13252 lt!154514) (size!7981 a!3293)))) (or ((_ is Undefined!2769) lt!154514) ((_ is Found!2769) lt!154514) ((_ is MissingZero!2769) lt!154514) (not ((_ is MissingVacant!2769) lt!154514)) (and (bvsge (index!13255 lt!154514) #b00000000000000000000000000000000) (bvslt (index!13255 lt!154514) (size!7981 a!3293)))) (or ((_ is Undefined!2769) lt!154514) (ite ((_ is Found!2769) lt!154514) (= (select (arr!7629 a!3293) (index!13253 lt!154514)) k0!2441) (ite ((_ is MissingZero!2769) lt!154514) (= (select (arr!7629 a!3293) (index!13252 lt!154514)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2769) lt!154514) (= (select (arr!7629 a!3293) (index!13255 lt!154514)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68989 (= lt!154514 e!196765)))

(declare-fun c!50093 () Bool)

(assert (=> d!68989 (= c!50093 (and ((_ is Intermediate!2769) lt!154516) (undefined!3581 lt!154516)))))

(assert (=> d!68989 (= lt!154516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68989 (validMask!0 mask!3709)))

(assert (=> d!68989 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154514)))

(declare-fun b!316346 () Bool)

(assert (=> b!316346 (= e!196764 (Found!2769 (index!13254 lt!154516)))))

(declare-fun b!316347 () Bool)

(declare-fun c!50092 () Bool)

(assert (=> b!316347 (= c!50092 (= lt!154515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196766 () SeekEntryResult!2769)

(assert (=> b!316347 (= e!196764 e!196766)))

(declare-fun b!316348 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16118 (_ BitVec 32)) SeekEntryResult!2769)

(assert (=> b!316348 (= e!196766 (seekKeyOrZeroReturnVacant!0 (x!31495 lt!154516) (index!13254 lt!154516) (index!13254 lt!154516) k0!2441 a!3293 mask!3709))))

(declare-fun b!316349 () Bool)

(assert (=> b!316349 (= e!196766 (MissingZero!2769 (index!13254 lt!154516)))))

(assert (= (and d!68989 c!50093) b!316344))

(assert (= (and d!68989 (not c!50093)) b!316345))

(assert (= (and b!316345 c!50094) b!316346))

(assert (= (and b!316345 (not c!50094)) b!316347))

(assert (= (and b!316347 c!50092) b!316349))

(assert (= (and b!316347 (not c!50092)) b!316348))

(declare-fun m!325263 () Bool)

(assert (=> b!316345 m!325263))

(assert (=> d!68989 m!325187))

(assert (=> d!68989 m!325189))

(assert (=> d!68989 m!325187))

(declare-fun m!325269 () Bool)

(assert (=> d!68989 m!325269))

(declare-fun m!325273 () Bool)

(assert (=> d!68989 m!325273))

(declare-fun m!325275 () Bool)

(assert (=> d!68989 m!325275))

(assert (=> d!68989 m!325179))

(declare-fun m!325277 () Bool)

(assert (=> b!316348 m!325277))

(assert (=> b!316192 d!68989))

(declare-fun b!316350 () Bool)

(declare-fun e!196768 () Bool)

(declare-fun lt!154518 () SeekEntryResult!2769)

(assert (=> b!316350 (= e!196768 (bvsge (x!31495 lt!154518) #b01111111111111111111111111111110))))

(declare-fun b!316352 () Bool)

(declare-fun e!196769 () SeekEntryResult!2769)

(assert (=> b!316352 (= e!196769 (Intermediate!2769 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316353 () Bool)

(declare-fun e!196767 () SeekEntryResult!2769)

(assert (=> b!316353 (= e!196767 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316354 () Bool)

(assert (=> b!316354 (and (bvsge (index!13254 lt!154518) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154518) (size!7981 a!3293)))))

(declare-fun res!171397 () Bool)

(assert (=> b!316354 (= res!171397 (= (select (arr!7629 a!3293) (index!13254 lt!154518)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196771 () Bool)

(assert (=> b!316354 (=> res!171397 e!196771)))

(declare-fun b!316355 () Bool)

(assert (=> b!316355 (= e!196769 e!196767)))

(declare-fun c!50097 () Bool)

(declare-fun lt!154517 () (_ BitVec 64))

(assert (=> b!316355 (= c!50097 (or (= lt!154517 k0!2441) (= (bvadd lt!154517 lt!154517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316356 () Bool)

(assert (=> b!316356 (and (bvsge (index!13254 lt!154518) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154518) (size!7981 a!3293)))))

(assert (=> b!316356 (= e!196771 (= (select (arr!7629 a!3293) (index!13254 lt!154518)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316357 () Bool)

(assert (=> b!316357 (= e!196767 (Intermediate!2769 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316358 () Bool)

(declare-fun e!196770 () Bool)

(assert (=> b!316358 (= e!196768 e!196770)))

(declare-fun res!171396 () Bool)

(assert (=> b!316358 (= res!171396 (and ((_ is Intermediate!2769) lt!154518) (not (undefined!3581 lt!154518)) (bvslt (x!31495 lt!154518) #b01111111111111111111111111111110) (bvsge (x!31495 lt!154518) #b00000000000000000000000000000000) (bvsge (x!31495 lt!154518) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316358 (=> (not res!171396) (not e!196770))))

(declare-fun d!68997 () Bool)

(assert (=> d!68997 e!196768))

(declare-fun c!50095 () Bool)

(assert (=> d!68997 (= c!50095 (and ((_ is Intermediate!2769) lt!154518) (undefined!3581 lt!154518)))))

(assert (=> d!68997 (= lt!154518 e!196769)))

(declare-fun c!50096 () Bool)

(assert (=> d!68997 (= c!50096 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68997 (= lt!154517 (select (arr!7629 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68997 (validMask!0 mask!3709)))

(assert (=> d!68997 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154518)))

(declare-fun b!316351 () Bool)

(assert (=> b!316351 (and (bvsge (index!13254 lt!154518) #b00000000000000000000000000000000) (bvslt (index!13254 lt!154518) (size!7981 a!3293)))))

(declare-fun res!171395 () Bool)

(assert (=> b!316351 (= res!171395 (= (select (arr!7629 a!3293) (index!13254 lt!154518)) k0!2441))))

(assert (=> b!316351 (=> res!171395 e!196771)))

(assert (=> b!316351 (= e!196770 e!196771)))

(assert (= (and d!68997 c!50096) b!316352))

(assert (= (and d!68997 (not c!50096)) b!316355))

(assert (= (and b!316355 c!50097) b!316357))

(assert (= (and b!316355 (not c!50097)) b!316353))

(assert (= (and d!68997 c!50095) b!316350))

(assert (= (and d!68997 (not c!50095)) b!316358))

(assert (= (and b!316358 res!171396) b!316351))

(assert (= (and b!316351 (not res!171395)) b!316354))

(assert (= (and b!316354 (not res!171397)) b!316356))

(declare-fun m!325279 () Bool)

(assert (=> b!316351 m!325279))

(assert (=> b!316353 m!325201))

(declare-fun m!325281 () Bool)

(assert (=> b!316353 m!325281))

(assert (=> b!316353 m!325281))

(declare-fun m!325283 () Bool)

(assert (=> b!316353 m!325283))

(assert (=> d!68997 m!325201))

(declare-fun m!325285 () Bool)

(assert (=> d!68997 m!325285))

(assert (=> d!68997 m!325179))

(assert (=> b!316356 m!325279))

(assert (=> b!316354 m!325279))

(assert (=> b!316197 d!68997))

(declare-fun d!68999 () Bool)

(declare-fun lt!154525 () (_ BitVec 32))

(assert (=> d!68999 (and (bvsge lt!154525 #b00000000000000000000000000000000) (bvslt lt!154525 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68999 (= lt!154525 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68999 (validMask!0 mask!3709)))

(assert (=> d!68999 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154525)))

(declare-fun bs!11045 () Bool)

(assert (= bs!11045 d!68999))

(declare-fun m!325287 () Bool)

(assert (=> bs!11045 m!325287))

(assert (=> bs!11045 m!325179))

(assert (=> b!316197 d!68999))

(declare-fun d!69001 () Bool)

(assert (=> d!69001 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316198 d!69001))

(declare-fun d!69003 () Bool)

(assert (=> d!69003 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31594 d!69003))

(declare-fun d!69015 () Bool)

(assert (=> d!69015 (= (array_inv!5592 a!3293) (bvsge (size!7981 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31594 d!69015))

(declare-fun bm!26002 () Bool)

(declare-fun call!26005 () Bool)

(assert (=> bm!26002 (= call!26005 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316424 () Bool)

(declare-fun e!196814 () Bool)

(declare-fun e!196813 () Bool)

(assert (=> b!316424 (= e!196814 e!196813)))

(declare-fun lt!154557 () (_ BitVec 64))

(assert (=> b!316424 (= lt!154557 (select (arr!7629 a!3293) #b00000000000000000000000000000000))))

(declare-fun lt!154556 () Unit!9772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16118 (_ BitVec 64) (_ BitVec 32)) Unit!9772)

(assert (=> b!316424 (= lt!154556 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154557 #b00000000000000000000000000000000))))

(assert (=> b!316424 (arrayContainsKey!0 a!3293 lt!154557 #b00000000000000000000000000000000)))

(declare-fun lt!154558 () Unit!9772)

(assert (=> b!316424 (= lt!154558 lt!154556)))

(declare-fun res!171424 () Bool)

(assert (=> b!316424 (= res!171424 (= (seekEntryOrOpen!0 (select (arr!7629 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2769 #b00000000000000000000000000000000)))))

(assert (=> b!316424 (=> (not res!171424) (not e!196813))))

(declare-fun d!69017 () Bool)

(declare-fun res!171425 () Bool)

(declare-fun e!196812 () Bool)

(assert (=> d!69017 (=> res!171425 e!196812)))

(assert (=> d!69017 (= res!171425 (bvsge #b00000000000000000000000000000000 (size!7981 a!3293)))))

(assert (=> d!69017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196812)))

(declare-fun b!316425 () Bool)

(assert (=> b!316425 (= e!196812 e!196814)))

(declare-fun c!50118 () Bool)

(assert (=> b!316425 (= c!50118 (validKeyInArray!0 (select (arr!7629 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!316426 () Bool)

(assert (=> b!316426 (= e!196814 call!26005)))

(declare-fun b!316427 () Bool)

(assert (=> b!316427 (= e!196813 call!26005)))

(assert (= (and d!69017 (not res!171425)) b!316425))

(assert (= (and b!316425 c!50118) b!316424))

(assert (= (and b!316425 (not c!50118)) b!316426))

(assert (= (and b!316424 res!171424) b!316427))

(assert (= (or b!316427 b!316426) bm!26002))

(declare-fun m!325321 () Bool)

(assert (=> bm!26002 m!325321))

(declare-fun m!325323 () Bool)

(assert (=> b!316424 m!325323))

(declare-fun m!325325 () Bool)

(assert (=> b!316424 m!325325))

(declare-fun m!325327 () Bool)

(assert (=> b!316424 m!325327))

(assert (=> b!316424 m!325323))

(declare-fun m!325329 () Bool)

(assert (=> b!316424 m!325329))

(assert (=> b!316425 m!325323))

(assert (=> b!316425 m!325323))

(declare-fun m!325331 () Bool)

(assert (=> b!316425 m!325331))

(assert (=> b!316196 d!69017))

(declare-fun d!69023 () Bool)

(declare-fun res!171430 () Bool)

(declare-fun e!196819 () Bool)

(assert (=> d!69023 (=> res!171430 e!196819)))

(assert (=> d!69023 (= res!171430 (= (select (arr!7629 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69023 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196819)))

(declare-fun b!316432 () Bool)

(declare-fun e!196820 () Bool)

(assert (=> b!316432 (= e!196819 e!196820)))

(declare-fun res!171431 () Bool)

(assert (=> b!316432 (=> (not res!171431) (not e!196820))))

(assert (=> b!316432 (= res!171431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7981 a!3293)))))

(declare-fun b!316433 () Bool)

(assert (=> b!316433 (= e!196820 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69023 (not res!171430)) b!316432))

(assert (= (and b!316432 res!171431) b!316433))

(assert (=> d!69023 m!325323))

(declare-fun m!325333 () Bool)

(assert (=> b!316433 m!325333))

(assert (=> b!316201 d!69023))

(check-sat (not bm!26002) (not b!316278) (not d!68975) (not b!316348) (not b!316293) (not b!316433) (not d!68999) (not b!316269) (not b!316353) (not b!316424) (not d!68989) (not d!68985) (not d!68997) (not d!68977) (not b!316425))
(check-sat)
