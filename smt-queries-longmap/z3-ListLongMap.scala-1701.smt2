; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31144 () Bool)

(assert start!31144)

(declare-fun b!313179 () Bool)

(declare-fun res!169494 () Bool)

(declare-fun e!195193 () Bool)

(assert (=> b!313179 (=> (not res!169494) (not e!195193))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313179 (= res!169494 (validKeyInArray!0 k0!2441))))

(declare-fun b!313180 () Bool)

(declare-fun e!195191 () Bool)

(assert (=> b!313180 (= e!195193 e!195191)))

(declare-fun res!169499 () Bool)

(assert (=> b!313180 (=> (not res!169499) (not e!195191))))

(declare-datatypes ((array!16001 0))(
  ( (array!16002 (arr!7581 (Array (_ BitVec 32) (_ BitVec 64))) (size!7933 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16001)

(declare-datatypes ((SeekEntryResult!2721 0))(
  ( (MissingZero!2721 (index!13060 (_ BitVec 32))) (Found!2721 (index!13061 (_ BitVec 32))) (Intermediate!2721 (undefined!3533 Bool) (index!13062 (_ BitVec 32)) (x!31268 (_ BitVec 32))) (Undefined!2721) (MissingVacant!2721 (index!13063 (_ BitVec 32))) )
))
(declare-fun lt!153456 () SeekEntryResult!2721)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16001 (_ BitVec 32)) SeekEntryResult!2721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313180 (= res!169499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153456))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!313180 (= lt!153456 (Intermediate!2721 false resIndex!52 resX!52))))

(declare-fun res!169493 () Bool)

(assert (=> start!31144 (=> (not res!169493) (not e!195193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31144 (= res!169493 (validMask!0 mask!3709))))

(assert (=> start!31144 e!195193))

(declare-fun array_inv!5544 (array!16001) Bool)

(assert (=> start!31144 (array_inv!5544 a!3293)))

(assert (=> start!31144 true))

(declare-fun b!313181 () Bool)

(declare-fun res!169492 () Bool)

(assert (=> b!313181 (=> (not res!169492) (not e!195191))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313181 (= res!169492 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153456))))

(declare-fun b!313182 () Bool)

(declare-fun res!169496 () Bool)

(assert (=> b!313182 (=> (not res!169496) (not e!195193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16001 (_ BitVec 32)) Bool)

(assert (=> b!313182 (= res!169496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313183 () Bool)

(declare-fun res!169497 () Bool)

(assert (=> b!313183 (=> (not res!169497) (not e!195193))))

(declare-fun arrayContainsKey!0 (array!16001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313183 (= res!169497 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313184 () Bool)

(declare-fun res!169495 () Bool)

(assert (=> b!313184 (=> (not res!169495) (not e!195191))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313184 (= res!169495 (and (= (select (arr!7581 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7933 a!3293))))))

(declare-fun b!313185 () Bool)

(assert (=> b!313185 (= e!195191 (and (bvslt resX!52 #b01111111111111111111111111111110) (= (select (arr!7581 a!3293) index!1781) k0!2441)))))

(declare-fun b!313186 () Bool)

(declare-fun res!169498 () Bool)

(assert (=> b!313186 (=> (not res!169498) (not e!195193))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16001 (_ BitVec 32)) SeekEntryResult!2721)

(assert (=> b!313186 (= res!169498 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2721 i!1240)))))

(declare-fun b!313187 () Bool)

(declare-fun res!169500 () Bool)

(assert (=> b!313187 (=> (not res!169500) (not e!195193))))

(assert (=> b!313187 (= res!169500 (and (= (size!7933 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7933 a!3293))))))

(assert (= (and start!31144 res!169493) b!313187))

(assert (= (and b!313187 res!169500) b!313179))

(assert (= (and b!313179 res!169494) b!313183))

(assert (= (and b!313183 res!169497) b!313186))

(assert (= (and b!313186 res!169498) b!313182))

(assert (= (and b!313182 res!169496) b!313180))

(assert (= (and b!313180 res!169499) b!313184))

(assert (= (and b!313184 res!169495) b!313181))

(assert (= (and b!313181 res!169492) b!313185))

(declare-fun m!323199 () Bool)

(assert (=> b!313181 m!323199))

(declare-fun m!323201 () Bool)

(assert (=> b!313186 m!323201))

(declare-fun m!323203 () Bool)

(assert (=> b!313184 m!323203))

(declare-fun m!323205 () Bool)

(assert (=> b!313179 m!323205))

(declare-fun m!323207 () Bool)

(assert (=> b!313183 m!323207))

(declare-fun m!323209 () Bool)

(assert (=> start!31144 m!323209))

(declare-fun m!323211 () Bool)

(assert (=> start!31144 m!323211))

(declare-fun m!323213 () Bool)

(assert (=> b!313185 m!323213))

(declare-fun m!323215 () Bool)

(assert (=> b!313182 m!323215))

(declare-fun m!323217 () Bool)

(assert (=> b!313180 m!323217))

(assert (=> b!313180 m!323217))

(declare-fun m!323219 () Bool)

(assert (=> b!313180 m!323219))

(check-sat (not b!313179) (not b!313181) (not b!313180) (not b!313182) (not b!313186) (not start!31144) (not b!313183))
(check-sat)
(get-model)

(declare-fun b!313251 () Bool)

(declare-fun lt!153474 () SeekEntryResult!2721)

(assert (=> b!313251 (and (bvsge (index!13062 lt!153474) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153474) (size!7933 a!3293)))))

(declare-fun e!195231 () Bool)

(assert (=> b!313251 (= e!195231 (= (select (arr!7581 a!3293) (index!13062 lt!153474)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313252 () Bool)

(declare-fun e!195229 () Bool)

(assert (=> b!313252 (= e!195229 (bvsge (x!31268 lt!153474) #b01111111111111111111111111111110))))

(declare-fun b!313253 () Bool)

(declare-fun e!195230 () SeekEntryResult!2721)

(assert (=> b!313253 (= e!195230 (Intermediate!2721 false index!1781 x!1427))))

(declare-fun b!313254 () Bool)

(assert (=> b!313254 (and (bvsge (index!13062 lt!153474) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153474) (size!7933 a!3293)))))

(declare-fun res!169546 () Bool)

(assert (=> b!313254 (= res!169546 (= (select (arr!7581 a!3293) (index!13062 lt!153474)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313254 (=> res!169546 e!195231)))

(declare-fun b!313256 () Bool)

(declare-fun e!195232 () Bool)

(assert (=> b!313256 (= e!195229 e!195232)))

(declare-fun res!169548 () Bool)

(get-info :version)

(assert (=> b!313256 (= res!169548 (and ((_ is Intermediate!2721) lt!153474) (not (undefined!3533 lt!153474)) (bvslt (x!31268 lt!153474) #b01111111111111111111111111111110) (bvsge (x!31268 lt!153474) #b00000000000000000000000000000000) (bvsge (x!31268 lt!153474) x!1427)))))

(assert (=> b!313256 (=> (not res!169548) (not e!195232))))

(declare-fun b!313257 () Bool)

(assert (=> b!313257 (and (bvsge (index!13062 lt!153474) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153474) (size!7933 a!3293)))))

(declare-fun res!169547 () Bool)

(assert (=> b!313257 (= res!169547 (= (select (arr!7581 a!3293) (index!13062 lt!153474)) k0!2441))))

(assert (=> b!313257 (=> res!169547 e!195231)))

(assert (=> b!313257 (= e!195232 e!195231)))

(declare-fun b!313258 () Bool)

(declare-fun e!195228 () SeekEntryResult!2721)

(assert (=> b!313258 (= e!195228 e!195230)))

(declare-fun c!49460 () Bool)

(declare-fun lt!153473 () (_ BitVec 64))

(assert (=> b!313258 (= c!49460 (or (= lt!153473 k0!2441) (= (bvadd lt!153473 lt!153473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313259 () Bool)

(assert (=> b!313259 (= e!195228 (Intermediate!2721 true index!1781 x!1427))))

(declare-fun b!313255 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313255 (= e!195230 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68535 () Bool)

(assert (=> d!68535 e!195229))

(declare-fun c!49461 () Bool)

(assert (=> d!68535 (= c!49461 (and ((_ is Intermediate!2721) lt!153474) (undefined!3533 lt!153474)))))

(assert (=> d!68535 (= lt!153474 e!195228)))

(declare-fun c!49459 () Bool)

(assert (=> d!68535 (= c!49459 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68535 (= lt!153473 (select (arr!7581 a!3293) index!1781))))

(assert (=> d!68535 (validMask!0 mask!3709)))

(assert (=> d!68535 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153474)))

(assert (= (and d!68535 c!49459) b!313259))

(assert (= (and d!68535 (not c!49459)) b!313258))

(assert (= (and b!313258 c!49460) b!313253))

(assert (= (and b!313258 (not c!49460)) b!313255))

(assert (= (and d!68535 c!49461) b!313252))

(assert (= (and d!68535 (not c!49461)) b!313256))

(assert (= (and b!313256 res!169548) b!313257))

(assert (= (and b!313257 (not res!169547)) b!313254))

(assert (= (and b!313254 (not res!169546)) b!313251))

(assert (=> d!68535 m!323213))

(assert (=> d!68535 m!323209))

(declare-fun m!323259 () Bool)

(assert (=> b!313254 m!323259))

(declare-fun m!323261 () Bool)

(assert (=> b!313255 m!323261))

(assert (=> b!313255 m!323261))

(declare-fun m!323263 () Bool)

(assert (=> b!313255 m!323263))

(assert (=> b!313251 m!323259))

(assert (=> b!313257 m!323259))

(assert (=> b!313181 d!68535))

(declare-fun d!68549 () Bool)

(declare-fun lt!153492 () SeekEntryResult!2721)

(assert (=> d!68549 (and (or ((_ is Undefined!2721) lt!153492) (not ((_ is Found!2721) lt!153492)) (and (bvsge (index!13061 lt!153492) #b00000000000000000000000000000000) (bvslt (index!13061 lt!153492) (size!7933 a!3293)))) (or ((_ is Undefined!2721) lt!153492) ((_ is Found!2721) lt!153492) (not ((_ is MissingZero!2721) lt!153492)) (and (bvsge (index!13060 lt!153492) #b00000000000000000000000000000000) (bvslt (index!13060 lt!153492) (size!7933 a!3293)))) (or ((_ is Undefined!2721) lt!153492) ((_ is Found!2721) lt!153492) ((_ is MissingZero!2721) lt!153492) (not ((_ is MissingVacant!2721) lt!153492)) (and (bvsge (index!13063 lt!153492) #b00000000000000000000000000000000) (bvslt (index!13063 lt!153492) (size!7933 a!3293)))) (or ((_ is Undefined!2721) lt!153492) (ite ((_ is Found!2721) lt!153492) (= (select (arr!7581 a!3293) (index!13061 lt!153492)) k0!2441) (ite ((_ is MissingZero!2721) lt!153492) (= (select (arr!7581 a!3293) (index!13060 lt!153492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2721) lt!153492) (= (select (arr!7581 a!3293) (index!13063 lt!153492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195265 () SeekEntryResult!2721)

(assert (=> d!68549 (= lt!153492 e!195265)))

(declare-fun c!49484 () Bool)

(declare-fun lt!153491 () SeekEntryResult!2721)

(assert (=> d!68549 (= c!49484 (and ((_ is Intermediate!2721) lt!153491) (undefined!3533 lt!153491)))))

(assert (=> d!68549 (= lt!153491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68549 (validMask!0 mask!3709)))

(assert (=> d!68549 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153492)))

(declare-fun b!313317 () Bool)

(declare-fun e!195266 () SeekEntryResult!2721)

(assert (=> b!313317 (= e!195266 (Found!2721 (index!13062 lt!153491)))))

(declare-fun b!313318 () Bool)

(declare-fun c!49485 () Bool)

(declare-fun lt!153493 () (_ BitVec 64))

(assert (=> b!313318 (= c!49485 (= lt!153493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195264 () SeekEntryResult!2721)

(assert (=> b!313318 (= e!195266 e!195264)))

(declare-fun b!313319 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16001 (_ BitVec 32)) SeekEntryResult!2721)

(assert (=> b!313319 (= e!195264 (seekKeyOrZeroReturnVacant!0 (x!31268 lt!153491) (index!13062 lt!153491) (index!13062 lt!153491) k0!2441 a!3293 mask!3709))))

(declare-fun b!313320 () Bool)

(assert (=> b!313320 (= e!195264 (MissingZero!2721 (index!13062 lt!153491)))))

(declare-fun b!313321 () Bool)

(assert (=> b!313321 (= e!195265 Undefined!2721)))

(declare-fun b!313322 () Bool)

(assert (=> b!313322 (= e!195265 e!195266)))

(assert (=> b!313322 (= lt!153493 (select (arr!7581 a!3293) (index!13062 lt!153491)))))

(declare-fun c!49483 () Bool)

(assert (=> b!313322 (= c!49483 (= lt!153493 k0!2441))))

(assert (= (and d!68549 c!49484) b!313321))

(assert (= (and d!68549 (not c!49484)) b!313322))

(assert (= (and b!313322 c!49483) b!313317))

(assert (= (and b!313322 (not c!49483)) b!313318))

(assert (= (and b!313318 c!49485) b!313320))

(assert (= (and b!313318 (not c!49485)) b!313319))

(declare-fun m!323265 () Bool)

(assert (=> d!68549 m!323265))

(assert (=> d!68549 m!323217))

(assert (=> d!68549 m!323219))

(declare-fun m!323269 () Bool)

(assert (=> d!68549 m!323269))

(assert (=> d!68549 m!323209))

(declare-fun m!323271 () Bool)

(assert (=> d!68549 m!323271))

(assert (=> d!68549 m!323217))

(declare-fun m!323275 () Bool)

(assert (=> b!313319 m!323275))

(declare-fun m!323277 () Bool)

(assert (=> b!313322 m!323277))

(assert (=> b!313186 d!68549))

(declare-fun b!313332 () Bool)

(declare-fun lt!153498 () SeekEntryResult!2721)

(assert (=> b!313332 (and (bvsge (index!13062 lt!153498) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153498) (size!7933 a!3293)))))

(declare-fun e!195278 () Bool)

(assert (=> b!313332 (= e!195278 (= (select (arr!7581 a!3293) (index!13062 lt!153498)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313333 () Bool)

(declare-fun e!195273 () Bool)

(assert (=> b!313333 (= e!195273 (bvsge (x!31268 lt!153498) #b01111111111111111111111111111110))))

(declare-fun b!313335 () Bool)

(declare-fun e!195276 () SeekEntryResult!2721)

(assert (=> b!313335 (= e!195276 (Intermediate!2721 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313337 () Bool)

(assert (=> b!313337 (and (bvsge (index!13062 lt!153498) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153498) (size!7933 a!3293)))))

(declare-fun res!169567 () Bool)

(assert (=> b!313337 (= res!169567 (= (select (arr!7581 a!3293) (index!13062 lt!153498)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313337 (=> res!169567 e!195278)))

(declare-fun b!313341 () Bool)

(declare-fun e!195281 () Bool)

(assert (=> b!313341 (= e!195273 e!195281)))

(declare-fun res!169569 () Bool)

(assert (=> b!313341 (= res!169569 (and ((_ is Intermediate!2721) lt!153498) (not (undefined!3533 lt!153498)) (bvslt (x!31268 lt!153498) #b01111111111111111111111111111110) (bvsge (x!31268 lt!153498) #b00000000000000000000000000000000) (bvsge (x!31268 lt!153498) #b00000000000000000000000000000000)))))

(assert (=> b!313341 (=> (not res!169569) (not e!195281))))

(declare-fun b!313343 () Bool)

(assert (=> b!313343 (and (bvsge (index!13062 lt!153498) #b00000000000000000000000000000000) (bvslt (index!13062 lt!153498) (size!7933 a!3293)))))

(declare-fun res!169568 () Bool)

(assert (=> b!313343 (= res!169568 (= (select (arr!7581 a!3293) (index!13062 lt!153498)) k0!2441))))

(assert (=> b!313343 (=> res!169568 e!195278)))

(assert (=> b!313343 (= e!195281 e!195278)))

(declare-fun b!313345 () Bool)

(declare-fun e!195272 () SeekEntryResult!2721)

(assert (=> b!313345 (= e!195272 e!195276)))

(declare-fun c!49491 () Bool)

(declare-fun lt!153496 () (_ BitVec 64))

(assert (=> b!313345 (= c!49491 (or (= lt!153496 k0!2441) (= (bvadd lt!153496 lt!153496) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313347 () Bool)

(assert (=> b!313347 (= e!195272 (Intermediate!2721 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313339 () Bool)

(assert (=> b!313339 (= e!195276 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68553 () Bool)

(assert (=> d!68553 e!195273))

(declare-fun c!49493 () Bool)

(assert (=> d!68553 (= c!49493 (and ((_ is Intermediate!2721) lt!153498) (undefined!3533 lt!153498)))))

(assert (=> d!68553 (= lt!153498 e!195272)))

(declare-fun c!49490 () Bool)

(assert (=> d!68553 (= c!49490 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68553 (= lt!153496 (select (arr!7581 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68553 (validMask!0 mask!3709)))

(assert (=> d!68553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153498)))

(assert (= (and d!68553 c!49490) b!313347))

(assert (= (and d!68553 (not c!49490)) b!313345))

(assert (= (and b!313345 c!49491) b!313335))

(assert (= (and b!313345 (not c!49491)) b!313339))

(assert (= (and d!68553 c!49493) b!313333))

(assert (= (and d!68553 (not c!49493)) b!313341))

(assert (= (and b!313341 res!169569) b!313343))

(assert (= (and b!313343 (not res!169568)) b!313337))

(assert (= (and b!313337 (not res!169567)) b!313332))

(assert (=> d!68553 m!323217))

(declare-fun m!323289 () Bool)

(assert (=> d!68553 m!323289))

(assert (=> d!68553 m!323209))

(declare-fun m!323291 () Bool)

(assert (=> b!313337 m!323291))

(assert (=> b!313339 m!323217))

(declare-fun m!323293 () Bool)

(assert (=> b!313339 m!323293))

(assert (=> b!313339 m!323293))

(declare-fun m!323299 () Bool)

(assert (=> b!313339 m!323299))

(assert (=> b!313332 m!323291))

(assert (=> b!313343 m!323291))

(assert (=> b!313180 d!68553))

(declare-fun d!68559 () Bool)

(declare-fun lt!153509 () (_ BitVec 32))

(declare-fun lt!153508 () (_ BitVec 32))

(assert (=> d!68559 (= lt!153509 (bvmul (bvxor lt!153508 (bvlshr lt!153508 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68559 (= lt!153508 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68559 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169573 (let ((h!5349 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31273 (bvmul (bvxor h!5349 (bvlshr h!5349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31273 (bvlshr x!31273 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169573 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169573 #b00000000000000000000000000000000))))))

(assert (=> d!68559 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153509 (bvlshr lt!153509 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313180 d!68559))

(declare-fun b!313385 () Bool)

(declare-fun e!195309 () Bool)

(declare-fun e!195308 () Bool)

(assert (=> b!313385 (= e!195309 e!195308)))

(declare-fun c!49503 () Bool)

(assert (=> b!313385 (= c!49503 (validKeyInArray!0 (select (arr!7581 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68563 () Bool)

(declare-fun res!169596 () Bool)

(assert (=> d!68563 (=> res!169596 e!195309)))

(assert (=> d!68563 (= res!169596 (bvsge #b00000000000000000000000000000000 (size!7933 a!3293)))))

(assert (=> d!68563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195309)))

(declare-fun b!313386 () Bool)

(declare-fun e!195310 () Bool)

(assert (=> b!313386 (= e!195308 e!195310)))

(declare-fun lt!153529 () (_ BitVec 64))

(assert (=> b!313386 (= lt!153529 (select (arr!7581 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9673 0))(
  ( (Unit!9674) )
))
(declare-fun lt!153530 () Unit!9673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16001 (_ BitVec 64) (_ BitVec 32)) Unit!9673)

(assert (=> b!313386 (= lt!153530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153529 #b00000000000000000000000000000000))))

(assert (=> b!313386 (arrayContainsKey!0 a!3293 lt!153529 #b00000000000000000000000000000000)))

(declare-fun lt!153531 () Unit!9673)

(assert (=> b!313386 (= lt!153531 lt!153530)))

(declare-fun res!169595 () Bool)

(assert (=> b!313386 (= res!169595 (= (seekEntryOrOpen!0 (select (arr!7581 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2721 #b00000000000000000000000000000000)))))

(assert (=> b!313386 (=> (not res!169595) (not e!195310))))

(declare-fun b!313387 () Bool)

(declare-fun call!25945 () Bool)

(assert (=> b!313387 (= e!195310 call!25945)))

(declare-fun bm!25942 () Bool)

(assert (=> bm!25942 (= call!25945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313388 () Bool)

(assert (=> b!313388 (= e!195308 call!25945)))

(assert (= (and d!68563 (not res!169596)) b!313385))

(assert (= (and b!313385 c!49503) b!313386))

(assert (= (and b!313385 (not c!49503)) b!313388))

(assert (= (and b!313386 res!169595) b!313387))

(assert (= (or b!313387 b!313388) bm!25942))

(declare-fun m!323323 () Bool)

(assert (=> b!313385 m!323323))

(assert (=> b!313385 m!323323))

(declare-fun m!323325 () Bool)

(assert (=> b!313385 m!323325))

(assert (=> b!313386 m!323323))

(declare-fun m!323327 () Bool)

(assert (=> b!313386 m!323327))

(declare-fun m!323329 () Bool)

(assert (=> b!313386 m!323329))

(assert (=> b!313386 m!323323))

(declare-fun m!323331 () Bool)

(assert (=> b!313386 m!323331))

(declare-fun m!323333 () Bool)

(assert (=> bm!25942 m!323333))

(assert (=> b!313182 d!68563))

(declare-fun d!68575 () Bool)

(declare-fun res!169601 () Bool)

(declare-fun e!195315 () Bool)

(assert (=> d!68575 (=> res!169601 e!195315)))

(assert (=> d!68575 (= res!169601 (= (select (arr!7581 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68575 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195315)))

(declare-fun b!313393 () Bool)

(declare-fun e!195316 () Bool)

(assert (=> b!313393 (= e!195315 e!195316)))

(declare-fun res!169602 () Bool)

(assert (=> b!313393 (=> (not res!169602) (not e!195316))))

(assert (=> b!313393 (= res!169602 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7933 a!3293)))))

(declare-fun b!313394 () Bool)

(assert (=> b!313394 (= e!195316 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68575 (not res!169601)) b!313393))

(assert (= (and b!313393 res!169602) b!313394))

(assert (=> d!68575 m!323323))

(declare-fun m!323335 () Bool)

(assert (=> b!313394 m!323335))

(assert (=> b!313183 d!68575))

(declare-fun d!68579 () Bool)

(assert (=> d!68579 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31144 d!68579))

(declare-fun d!68581 () Bool)

(assert (=> d!68581 (= (array_inv!5544 a!3293) (bvsge (size!7933 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31144 d!68581))

(declare-fun d!68583 () Bool)

(assert (=> d!68583 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313179 d!68583))

(check-sat (not d!68553) (not b!313394) (not b!313319) (not b!313385) (not b!313255) (not b!313339) (not d!68535) (not d!68549) (not b!313386) (not bm!25942))
(check-sat)
