; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31182 () Bool)

(assert start!31182)

(declare-fun res!169492 () Bool)

(declare-fun e!195168 () Bool)

(assert (=> start!31182 (=> (not res!169492) (not e!195168))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31182 (= res!169492 (validMask!0 mask!3709))))

(assert (=> start!31182 e!195168))

(declare-datatypes ((array!15998 0))(
  ( (array!15999 (arr!7578 (Array (_ BitVec 32) (_ BitVec 64))) (size!7931 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15998)

(declare-fun array_inv!5550 (array!15998) Bool)

(assert (=> start!31182 (array_inv!5550 a!3293)))

(assert (=> start!31182 true))

(declare-fun b!313174 () Bool)

(declare-fun res!169499 () Bool)

(assert (=> b!313174 (=> (not res!169499) (not e!195168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15998 (_ BitVec 32)) Bool)

(assert (=> b!313174 (= res!169499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313175 () Bool)

(declare-fun res!169496 () Bool)

(assert (=> b!313175 (=> (not res!169496) (not e!195168))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313175 (= res!169496 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313176 () Bool)

(declare-fun res!169493 () Bool)

(declare-fun e!195169 () Bool)

(assert (=> b!313176 (=> (not res!169493) (not e!195169))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313176 (= res!169493 (and (= (select (arr!7578 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7931 a!3293))))))

(declare-fun b!313177 () Bool)

(declare-fun e!195167 () Bool)

(declare-datatypes ((SeekEntryResult!2717 0))(
  ( (MissingZero!2717 (index!13044 (_ BitVec 32))) (Found!2717 (index!13045 (_ BitVec 32))) (Intermediate!2717 (undefined!3529 Bool) (index!13046 (_ BitVec 32)) (x!31273 (_ BitVec 32))) (Undefined!2717) (MissingVacant!2717 (index!13047 (_ BitVec 32))) )
))
(declare-fun lt!153327 () SeekEntryResult!2717)

(get-info :version)

(assert (=> b!313177 (= e!195167 (not (or (not ((_ is Intermediate!2717) lt!153327)) (bvsge (x!31273 lt!153327) (bvadd #b00000000000000000000000000000001 x!1427)))))))

(declare-fun lt!153328 () SeekEntryResult!2717)

(assert (=> b!313177 (= lt!153328 lt!153327)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2717)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313177 (= lt!153327 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313178 () Bool)

(declare-fun res!169494 () Bool)

(assert (=> b!313178 (=> (not res!169494) (not e!195168))))

(assert (=> b!313178 (= res!169494 (and (= (size!7931 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7931 a!3293))))))

(declare-fun b!313179 () Bool)

(assert (=> b!313179 (= e!195168 e!195169)))

(declare-fun res!169497 () Bool)

(assert (=> b!313179 (=> (not res!169497) (not e!195169))))

(declare-fun lt!153329 () SeekEntryResult!2717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313179 (= res!169497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153329))))

(assert (=> b!313179 (= lt!153329 (Intermediate!2717 false resIndex!52 resX!52))))

(declare-fun b!313180 () Bool)

(assert (=> b!313180 (= e!195169 e!195167)))

(declare-fun res!169498 () Bool)

(assert (=> b!313180 (=> (not res!169498) (not e!195167))))

(assert (=> b!313180 (= res!169498 (and (= lt!153328 lt!153329) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7578 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7578 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7578 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313180 (= lt!153328 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!313181 () Bool)

(declare-fun res!169500 () Bool)

(assert (=> b!313181 (=> (not res!169500) (not e!195168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313181 (= res!169500 (validKeyInArray!0 k0!2441))))

(declare-fun b!313182 () Bool)

(declare-fun res!169495 () Bool)

(assert (=> b!313182 (=> (not res!169495) (not e!195168))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!313182 (= res!169495 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2717 i!1240)))))

(assert (= (and start!31182 res!169492) b!313178))

(assert (= (and b!313178 res!169494) b!313181))

(assert (= (and b!313181 res!169500) b!313175))

(assert (= (and b!313175 res!169496) b!313182))

(assert (= (and b!313182 res!169495) b!313174))

(assert (= (and b!313174 res!169499) b!313179))

(assert (= (and b!313179 res!169497) b!313176))

(assert (= (and b!313176 res!169493) b!313180))

(assert (= (and b!313180 res!169498) b!313177))

(declare-fun m!322627 () Bool)

(assert (=> b!313175 m!322627))

(declare-fun m!322629 () Bool)

(assert (=> b!313176 m!322629))

(declare-fun m!322631 () Bool)

(assert (=> b!313179 m!322631))

(assert (=> b!313179 m!322631))

(declare-fun m!322633 () Bool)

(assert (=> b!313179 m!322633))

(declare-fun m!322635 () Bool)

(assert (=> b!313180 m!322635))

(declare-fun m!322637 () Bool)

(assert (=> b!313180 m!322637))

(declare-fun m!322639 () Bool)

(assert (=> b!313177 m!322639))

(assert (=> b!313177 m!322639))

(declare-fun m!322641 () Bool)

(assert (=> b!313177 m!322641))

(declare-fun m!322643 () Bool)

(assert (=> b!313182 m!322643))

(declare-fun m!322645 () Bool)

(assert (=> b!313174 m!322645))

(declare-fun m!322647 () Bool)

(assert (=> start!31182 m!322647))

(declare-fun m!322649 () Bool)

(assert (=> start!31182 m!322649))

(declare-fun m!322651 () Bool)

(assert (=> b!313181 m!322651))

(check-sat (not b!313181) (not b!313180) (not b!313175) (not b!313182) (not b!313174) (not b!313179) (not b!313177) (not start!31182))
(check-sat)
(get-model)

(declare-fun d!68385 () Bool)

(assert (=> d!68385 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313181 d!68385))

(declare-fun d!68387 () Bool)

(assert (=> d!68387 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31182 d!68387))

(declare-fun d!68389 () Bool)

(assert (=> d!68389 (= (array_inv!5550 a!3293) (bvsge (size!7931 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31182 d!68389))

(declare-fun b!313267 () Bool)

(declare-fun e!195215 () SeekEntryResult!2717)

(assert (=> b!313267 (= e!195215 Undefined!2717)))

(declare-fun b!313268 () Bool)

(declare-fun e!195214 () SeekEntryResult!2717)

(declare-fun lt!153358 () SeekEntryResult!2717)

(assert (=> b!313268 (= e!195214 (MissingZero!2717 (index!13046 lt!153358)))))

(declare-fun b!313269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15998 (_ BitVec 32)) SeekEntryResult!2717)

(assert (=> b!313269 (= e!195214 (seekKeyOrZeroReturnVacant!0 (x!31273 lt!153358) (index!13046 lt!153358) (index!13046 lt!153358) k0!2441 a!3293 mask!3709))))

(declare-fun b!313270 () Bool)

(declare-fun e!195213 () SeekEntryResult!2717)

(assert (=> b!313270 (= e!195213 (Found!2717 (index!13046 lt!153358)))))

(declare-fun b!313272 () Bool)

(assert (=> b!313272 (= e!195215 e!195213)))

(declare-fun lt!153359 () (_ BitVec 64))

(assert (=> b!313272 (= lt!153359 (select (arr!7578 a!3293) (index!13046 lt!153358)))))

(declare-fun c!49463 () Bool)

(assert (=> b!313272 (= c!49463 (= lt!153359 k0!2441))))

(declare-fun d!68391 () Bool)

(declare-fun lt!153360 () SeekEntryResult!2717)

(assert (=> d!68391 (and (or ((_ is Undefined!2717) lt!153360) (not ((_ is Found!2717) lt!153360)) (and (bvsge (index!13045 lt!153360) #b00000000000000000000000000000000) (bvslt (index!13045 lt!153360) (size!7931 a!3293)))) (or ((_ is Undefined!2717) lt!153360) ((_ is Found!2717) lt!153360) (not ((_ is MissingZero!2717) lt!153360)) (and (bvsge (index!13044 lt!153360) #b00000000000000000000000000000000) (bvslt (index!13044 lt!153360) (size!7931 a!3293)))) (or ((_ is Undefined!2717) lt!153360) ((_ is Found!2717) lt!153360) ((_ is MissingZero!2717) lt!153360) (not ((_ is MissingVacant!2717) lt!153360)) (and (bvsge (index!13047 lt!153360) #b00000000000000000000000000000000) (bvslt (index!13047 lt!153360) (size!7931 a!3293)))) (or ((_ is Undefined!2717) lt!153360) (ite ((_ is Found!2717) lt!153360) (= (select (arr!7578 a!3293) (index!13045 lt!153360)) k0!2441) (ite ((_ is MissingZero!2717) lt!153360) (= (select (arr!7578 a!3293) (index!13044 lt!153360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2717) lt!153360) (= (select (arr!7578 a!3293) (index!13047 lt!153360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68391 (= lt!153360 e!195215)))

(declare-fun c!49461 () Bool)

(assert (=> d!68391 (= c!49461 (and ((_ is Intermediate!2717) lt!153358) (undefined!3529 lt!153358)))))

(assert (=> d!68391 (= lt!153358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68391 (validMask!0 mask!3709)))

(assert (=> d!68391 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153360)))

(declare-fun b!313271 () Bool)

(declare-fun c!49462 () Bool)

(assert (=> b!313271 (= c!49462 (= lt!153359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313271 (= e!195213 e!195214)))

(assert (= (and d!68391 c!49461) b!313267))

(assert (= (and d!68391 (not c!49461)) b!313272))

(assert (= (and b!313272 c!49463) b!313270))

(assert (= (and b!313272 (not c!49463)) b!313271))

(assert (= (and b!313271 c!49462) b!313268))

(assert (= (and b!313271 (not c!49462)) b!313269))

(declare-fun m!322709 () Bool)

(assert (=> b!313269 m!322709))

(declare-fun m!322711 () Bool)

(assert (=> b!313272 m!322711))

(assert (=> d!68391 m!322631))

(declare-fun m!322713 () Bool)

(assert (=> d!68391 m!322713))

(assert (=> d!68391 m!322647))

(declare-fun m!322715 () Bool)

(assert (=> d!68391 m!322715))

(declare-fun m!322717 () Bool)

(assert (=> d!68391 m!322717))

(assert (=> d!68391 m!322631))

(assert (=> d!68391 m!322633))

(assert (=> b!313182 d!68391))

(declare-fun d!68399 () Bool)

(declare-fun e!195261 () Bool)

(assert (=> d!68399 e!195261))

(declare-fun c!49485 () Bool)

(declare-fun lt!153389 () SeekEntryResult!2717)

(assert (=> d!68399 (= c!49485 (and ((_ is Intermediate!2717) lt!153389) (undefined!3529 lt!153389)))))

(declare-fun e!195259 () SeekEntryResult!2717)

(assert (=> d!68399 (= lt!153389 e!195259)))

(declare-fun c!49486 () Bool)

(assert (=> d!68399 (= c!49486 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153388 () (_ BitVec 64))

(assert (=> d!68399 (= lt!153388 (select (arr!7578 a!3293) index!1781))))

(assert (=> d!68399 (validMask!0 mask!3709)))

(assert (=> d!68399 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153389)))

(declare-fun b!313345 () Bool)

(assert (=> b!313345 (and (bvsge (index!13046 lt!153389) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153389) (size!7931 a!3293)))))

(declare-fun res!169593 () Bool)

(assert (=> b!313345 (= res!169593 (= (select (arr!7578 a!3293) (index!13046 lt!153389)) k0!2441))))

(declare-fun e!195262 () Bool)

(assert (=> b!313345 (=> res!169593 e!195262)))

(declare-fun e!195260 () Bool)

(assert (=> b!313345 (= e!195260 e!195262)))

(declare-fun b!313346 () Bool)

(declare-fun e!195263 () SeekEntryResult!2717)

(assert (=> b!313346 (= e!195259 e!195263)))

(declare-fun c!49487 () Bool)

(assert (=> b!313346 (= c!49487 (or (= lt!153388 k0!2441) (= (bvadd lt!153388 lt!153388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313347 () Bool)

(assert (=> b!313347 (and (bvsge (index!13046 lt!153389) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153389) (size!7931 a!3293)))))

(assert (=> b!313347 (= e!195262 (= (select (arr!7578 a!3293) (index!13046 lt!153389)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313348 () Bool)

(assert (=> b!313348 (= e!195263 (Intermediate!2717 false index!1781 x!1427))))

(declare-fun b!313349 () Bool)

(assert (=> b!313349 (= e!195261 e!195260)))

(declare-fun res!169592 () Bool)

(assert (=> b!313349 (= res!169592 (and ((_ is Intermediate!2717) lt!153389) (not (undefined!3529 lt!153389)) (bvslt (x!31273 lt!153389) #b01111111111111111111111111111110) (bvsge (x!31273 lt!153389) #b00000000000000000000000000000000) (bvsge (x!31273 lt!153389) x!1427)))))

(assert (=> b!313349 (=> (not res!169592) (not e!195260))))

(declare-fun b!313350 () Bool)

(assert (=> b!313350 (= e!195263 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313351 () Bool)

(assert (=> b!313351 (= e!195259 (Intermediate!2717 true index!1781 x!1427))))

(declare-fun b!313352 () Bool)

(assert (=> b!313352 (and (bvsge (index!13046 lt!153389) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153389) (size!7931 a!3293)))))

(declare-fun res!169594 () Bool)

(assert (=> b!313352 (= res!169594 (= (select (arr!7578 a!3293) (index!13046 lt!153389)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313352 (=> res!169594 e!195262)))

(declare-fun b!313353 () Bool)

(assert (=> b!313353 (= e!195261 (bvsge (x!31273 lt!153389) #b01111111111111111111111111111110))))

(assert (= (and d!68399 c!49486) b!313351))

(assert (= (and d!68399 (not c!49486)) b!313346))

(assert (= (and b!313346 c!49487) b!313348))

(assert (= (and b!313346 (not c!49487)) b!313350))

(assert (= (and d!68399 c!49485) b!313353))

(assert (= (and d!68399 (not c!49485)) b!313349))

(assert (= (and b!313349 res!169592) b!313345))

(assert (= (and b!313345 (not res!169593)) b!313352))

(assert (= (and b!313352 (not res!169594)) b!313347))

(assert (=> d!68399 m!322635))

(assert (=> d!68399 m!322647))

(declare-fun m!322743 () Bool)

(assert (=> b!313352 m!322743))

(assert (=> b!313347 m!322743))

(assert (=> b!313345 m!322743))

(assert (=> b!313350 m!322639))

(assert (=> b!313350 m!322639))

(declare-fun m!322745 () Bool)

(assert (=> b!313350 m!322745))

(assert (=> b!313180 d!68399))

(declare-fun d!68409 () Bool)

(declare-fun res!169599 () Bool)

(declare-fun e!195268 () Bool)

(assert (=> d!68409 (=> res!169599 e!195268)))

(assert (=> d!68409 (= res!169599 (= (select (arr!7578 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68409 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195268)))

(declare-fun b!313358 () Bool)

(declare-fun e!195269 () Bool)

(assert (=> b!313358 (= e!195268 e!195269)))

(declare-fun res!169600 () Bool)

(assert (=> b!313358 (=> (not res!169600) (not e!195269))))

(assert (=> b!313358 (= res!169600 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7931 a!3293)))))

(declare-fun b!313359 () Bool)

(assert (=> b!313359 (= e!195269 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68409 (not res!169599)) b!313358))

(assert (= (and b!313358 res!169600) b!313359))

(declare-fun m!322747 () Bool)

(assert (=> d!68409 m!322747))

(declare-fun m!322749 () Bool)

(assert (=> b!313359 m!322749))

(assert (=> b!313175 d!68409))

(declare-fun d!68411 () Bool)

(declare-fun e!195272 () Bool)

(assert (=> d!68411 e!195272))

(declare-fun c!49488 () Bool)

(declare-fun lt!153391 () SeekEntryResult!2717)

(assert (=> d!68411 (= c!49488 (and ((_ is Intermediate!2717) lt!153391) (undefined!3529 lt!153391)))))

(declare-fun e!195270 () SeekEntryResult!2717)

(assert (=> d!68411 (= lt!153391 e!195270)))

(declare-fun c!49489 () Bool)

(assert (=> d!68411 (= c!49489 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153390 () (_ BitVec 64))

(assert (=> d!68411 (= lt!153390 (select (arr!7578 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68411 (validMask!0 mask!3709)))

(assert (=> d!68411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153391)))

(declare-fun b!313360 () Bool)

(assert (=> b!313360 (and (bvsge (index!13046 lt!153391) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153391) (size!7931 a!3293)))))

(declare-fun res!169602 () Bool)

(assert (=> b!313360 (= res!169602 (= (select (arr!7578 a!3293) (index!13046 lt!153391)) k0!2441))))

(declare-fun e!195273 () Bool)

(assert (=> b!313360 (=> res!169602 e!195273)))

(declare-fun e!195271 () Bool)

(assert (=> b!313360 (= e!195271 e!195273)))

(declare-fun b!313361 () Bool)

(declare-fun e!195274 () SeekEntryResult!2717)

(assert (=> b!313361 (= e!195270 e!195274)))

(declare-fun c!49490 () Bool)

(assert (=> b!313361 (= c!49490 (or (= lt!153390 k0!2441) (= (bvadd lt!153390 lt!153390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313362 () Bool)

(assert (=> b!313362 (and (bvsge (index!13046 lt!153391) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153391) (size!7931 a!3293)))))

(assert (=> b!313362 (= e!195273 (= (select (arr!7578 a!3293) (index!13046 lt!153391)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313363 () Bool)

(assert (=> b!313363 (= e!195274 (Intermediate!2717 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313364 () Bool)

(assert (=> b!313364 (= e!195272 e!195271)))

(declare-fun res!169601 () Bool)

(assert (=> b!313364 (= res!169601 (and ((_ is Intermediate!2717) lt!153391) (not (undefined!3529 lt!153391)) (bvslt (x!31273 lt!153391) #b01111111111111111111111111111110) (bvsge (x!31273 lt!153391) #b00000000000000000000000000000000) (bvsge (x!31273 lt!153391) #b00000000000000000000000000000000)))))

(assert (=> b!313364 (=> (not res!169601) (not e!195271))))

(declare-fun b!313365 () Bool)

(assert (=> b!313365 (= e!195274 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313366 () Bool)

(assert (=> b!313366 (= e!195270 (Intermediate!2717 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313367 () Bool)

(assert (=> b!313367 (and (bvsge (index!13046 lt!153391) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153391) (size!7931 a!3293)))))

(declare-fun res!169603 () Bool)

(assert (=> b!313367 (= res!169603 (= (select (arr!7578 a!3293) (index!13046 lt!153391)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313367 (=> res!169603 e!195273)))

(declare-fun b!313368 () Bool)

(assert (=> b!313368 (= e!195272 (bvsge (x!31273 lt!153391) #b01111111111111111111111111111110))))

(assert (= (and d!68411 c!49489) b!313366))

(assert (= (and d!68411 (not c!49489)) b!313361))

(assert (= (and b!313361 c!49490) b!313363))

(assert (= (and b!313361 (not c!49490)) b!313365))

(assert (= (and d!68411 c!49488) b!313368))

(assert (= (and d!68411 (not c!49488)) b!313364))

(assert (= (and b!313364 res!169601) b!313360))

(assert (= (and b!313360 (not res!169602)) b!313367))

(assert (= (and b!313367 (not res!169603)) b!313362))

(assert (=> d!68411 m!322631))

(declare-fun m!322751 () Bool)

(assert (=> d!68411 m!322751))

(assert (=> d!68411 m!322647))

(declare-fun m!322753 () Bool)

(assert (=> b!313367 m!322753))

(assert (=> b!313362 m!322753))

(assert (=> b!313360 m!322753))

(assert (=> b!313365 m!322631))

(declare-fun m!322755 () Bool)

(assert (=> b!313365 m!322755))

(assert (=> b!313365 m!322755))

(declare-fun m!322757 () Bool)

(assert (=> b!313365 m!322757))

(assert (=> b!313179 d!68411))

(declare-fun d!68413 () Bool)

(declare-fun lt!153408 () (_ BitVec 32))

(declare-fun lt!153407 () (_ BitVec 32))

(assert (=> d!68413 (= lt!153408 (bvmul (bvxor lt!153407 (bvlshr lt!153407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68413 (= lt!153407 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68413 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169608 (let ((h!5321 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31280 (bvmul (bvxor h!5321 (bvlshr h!5321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31280 (bvlshr x!31280 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169608 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169608 #b00000000000000000000000000000000))))))

(assert (=> d!68413 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153408 (bvlshr lt!153408 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313179 d!68413))

(declare-fun b!313413 () Bool)

(declare-fun e!195307 () Bool)

(declare-fun call!25928 () Bool)

(assert (=> b!313413 (= e!195307 call!25928)))

(declare-fun bm!25925 () Bool)

(assert (=> bm!25925 (= call!25928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68421 () Bool)

(declare-fun res!169627 () Bool)

(declare-fun e!195306 () Bool)

(assert (=> d!68421 (=> res!169627 e!195306)))

(assert (=> d!68421 (= res!169627 (bvsge #b00000000000000000000000000000000 (size!7931 a!3293)))))

(assert (=> d!68421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195306)))

(declare-fun b!313414 () Bool)

(declare-fun e!195308 () Bool)

(assert (=> b!313414 (= e!195308 call!25928)))

(declare-fun b!313415 () Bool)

(assert (=> b!313415 (= e!195306 e!195308)))

(declare-fun c!49502 () Bool)

(assert (=> b!313415 (= c!49502 (validKeyInArray!0 (select (arr!7578 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313416 () Bool)

(assert (=> b!313416 (= e!195308 e!195307)))

(declare-fun lt!153420 () (_ BitVec 64))

(assert (=> b!313416 (= lt!153420 (select (arr!7578 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9637 0))(
  ( (Unit!9638) )
))
(declare-fun lt!153422 () Unit!9637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15998 (_ BitVec 64) (_ BitVec 32)) Unit!9637)

(assert (=> b!313416 (= lt!153422 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153420 #b00000000000000000000000000000000))))

(assert (=> b!313416 (arrayContainsKey!0 a!3293 lt!153420 #b00000000000000000000000000000000)))

(declare-fun lt!153421 () Unit!9637)

(assert (=> b!313416 (= lt!153421 lt!153422)))

(declare-fun res!169628 () Bool)

(assert (=> b!313416 (= res!169628 (= (seekEntryOrOpen!0 (select (arr!7578 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2717 #b00000000000000000000000000000000)))))

(assert (=> b!313416 (=> (not res!169628) (not e!195307))))

(assert (= (and d!68421 (not res!169627)) b!313415))

(assert (= (and b!313415 c!49502) b!313416))

(assert (= (and b!313415 (not c!49502)) b!313414))

(assert (= (and b!313416 res!169628) b!313413))

(assert (= (or b!313413 b!313414) bm!25925))

(declare-fun m!322785 () Bool)

(assert (=> bm!25925 m!322785))

(assert (=> b!313415 m!322747))

(assert (=> b!313415 m!322747))

(declare-fun m!322787 () Bool)

(assert (=> b!313415 m!322787))

(assert (=> b!313416 m!322747))

(declare-fun m!322789 () Bool)

(assert (=> b!313416 m!322789))

(declare-fun m!322791 () Bool)

(assert (=> b!313416 m!322791))

(assert (=> b!313416 m!322747))

(declare-fun m!322793 () Bool)

(assert (=> b!313416 m!322793))

(assert (=> b!313174 d!68421))

(declare-fun d!68431 () Bool)

(declare-fun e!195311 () Bool)

(assert (=> d!68431 e!195311))

(declare-fun c!49503 () Bool)

(declare-fun lt!153424 () SeekEntryResult!2717)

(assert (=> d!68431 (= c!49503 (and ((_ is Intermediate!2717) lt!153424) (undefined!3529 lt!153424)))))

(declare-fun e!195309 () SeekEntryResult!2717)

(assert (=> d!68431 (= lt!153424 e!195309)))

(declare-fun c!49504 () Bool)

(assert (=> d!68431 (= c!49504 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!153423 () (_ BitVec 64))

(assert (=> d!68431 (= lt!153423 (select (arr!7578 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68431 (validMask!0 mask!3709)))

(assert (=> d!68431 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!153424)))

(declare-fun b!313417 () Bool)

(assert (=> b!313417 (and (bvsge (index!13046 lt!153424) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153424) (size!7931 a!3293)))))

(declare-fun res!169630 () Bool)

(assert (=> b!313417 (= res!169630 (= (select (arr!7578 a!3293) (index!13046 lt!153424)) k0!2441))))

(declare-fun e!195312 () Bool)

(assert (=> b!313417 (=> res!169630 e!195312)))

(declare-fun e!195310 () Bool)

(assert (=> b!313417 (= e!195310 e!195312)))

(declare-fun b!313418 () Bool)

(declare-fun e!195313 () SeekEntryResult!2717)

(assert (=> b!313418 (= e!195309 e!195313)))

(declare-fun c!49505 () Bool)

(assert (=> b!313418 (= c!49505 (or (= lt!153423 k0!2441) (= (bvadd lt!153423 lt!153423) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313419 () Bool)

(assert (=> b!313419 (and (bvsge (index!13046 lt!153424) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153424) (size!7931 a!3293)))))

(assert (=> b!313419 (= e!195312 (= (select (arr!7578 a!3293) (index!13046 lt!153424)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313420 () Bool)

(assert (=> b!313420 (= e!195313 (Intermediate!2717 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313421 () Bool)

(assert (=> b!313421 (= e!195311 e!195310)))

(declare-fun res!169629 () Bool)

(assert (=> b!313421 (= res!169629 (and ((_ is Intermediate!2717) lt!153424) (not (undefined!3529 lt!153424)) (bvslt (x!31273 lt!153424) #b01111111111111111111111111111110) (bvsge (x!31273 lt!153424) #b00000000000000000000000000000000) (bvsge (x!31273 lt!153424) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!313421 (=> (not res!169629) (not e!195310))))

(declare-fun b!313422 () Bool)

(assert (=> b!313422 (= e!195313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313423 () Bool)

(assert (=> b!313423 (= e!195309 (Intermediate!2717 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!313424 () Bool)

(assert (=> b!313424 (and (bvsge (index!13046 lt!153424) #b00000000000000000000000000000000) (bvslt (index!13046 lt!153424) (size!7931 a!3293)))))

(declare-fun res!169631 () Bool)

(assert (=> b!313424 (= res!169631 (= (select (arr!7578 a!3293) (index!13046 lt!153424)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313424 (=> res!169631 e!195312)))

(declare-fun b!313425 () Bool)

(assert (=> b!313425 (= e!195311 (bvsge (x!31273 lt!153424) #b01111111111111111111111111111110))))

(assert (= (and d!68431 c!49504) b!313423))

(assert (= (and d!68431 (not c!49504)) b!313418))

(assert (= (and b!313418 c!49505) b!313420))

(assert (= (and b!313418 (not c!49505)) b!313422))

(assert (= (and d!68431 c!49503) b!313425))

(assert (= (and d!68431 (not c!49503)) b!313421))

(assert (= (and b!313421 res!169629) b!313417))

(assert (= (and b!313417 (not res!169630)) b!313424))

(assert (= (and b!313424 (not res!169631)) b!313419))

(assert (=> d!68431 m!322639))

(declare-fun m!322795 () Bool)

(assert (=> d!68431 m!322795))

(assert (=> d!68431 m!322647))

(declare-fun m!322797 () Bool)

(assert (=> b!313424 m!322797))

(assert (=> b!313419 m!322797))

(assert (=> b!313417 m!322797))

(assert (=> b!313422 m!322639))

(declare-fun m!322799 () Bool)

(assert (=> b!313422 m!322799))

(assert (=> b!313422 m!322799))

(declare-fun m!322801 () Bool)

(assert (=> b!313422 m!322801))

(assert (=> b!313177 d!68431))

(declare-fun d!68433 () Bool)

(declare-fun lt!153427 () (_ BitVec 32))

(assert (=> d!68433 (and (bvsge lt!153427 #b00000000000000000000000000000000) (bvslt lt!153427 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68433 (= lt!153427 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68433 (validMask!0 mask!3709)))

(assert (=> d!68433 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!153427)))

(declare-fun bs!10962 () Bool)

(assert (= bs!10962 d!68433))

(declare-fun m!322803 () Bool)

(assert (=> bs!10962 m!322803))

(assert (=> bs!10962 m!322647))

(assert (=> b!313177 d!68433))

(check-sat (not b!313350) (not d!68431) (not b!313416) (not d!68391) (not b!313415) (not b!313365) (not b!313269) (not b!313422) (not d!68433) (not bm!25925) (not d!68399) (not b!313359) (not d!68411))
(check-sat)
