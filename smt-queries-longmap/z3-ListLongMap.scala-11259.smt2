; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131256 () Bool)

(assert start!131256)

(declare-fun b!1539454 () Bool)

(declare-fun e!856217 () Bool)

(declare-fun e!856216 () Bool)

(assert (=> b!1539454 (= e!856217 e!856216)))

(declare-fun res!1056437 () Bool)

(assert (=> b!1539454 (=> (not res!1056437) (not e!856216))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102241 0))(
  ( (array!102242 (arr!49333 (Array (_ BitVec 32) (_ BitVec 64))) (size!49885 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102241)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13484 0))(
  ( (MissingZero!13484 (index!56331 (_ BitVec 32))) (Found!13484 (index!56332 (_ BitVec 32))) (Intermediate!13484 (undefined!14296 Bool) (index!56333 (_ BitVec 32)) (x!138064 (_ BitVec 32))) (Undefined!13484) (MissingVacant!13484 (index!56334 (_ BitVec 32))) )
))
(declare-fun lt!664841 () SeekEntryResult!13484)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102241 (_ BitVec 32)) SeekEntryResult!13484)

(assert (=> b!1539454 (= res!1056437 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) lt!664841))))

(assert (=> b!1539454 (= lt!664841 (Found!13484 j!64))))

(declare-fun res!1056441 () Bool)

(assert (=> start!131256 (=> (not res!1056441) (not e!856217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131256 (= res!1056441 (validMask!0 mask!2480))))

(assert (=> start!131256 e!856217))

(assert (=> start!131256 true))

(declare-fun array_inv!38566 (array!102241) Bool)

(assert (=> start!131256 (array_inv!38566 a!2792)))

(declare-fun b!1539455 () Bool)

(declare-fun res!1056442 () Bool)

(assert (=> b!1539455 (=> (not res!1056442) (not e!856216))))

(assert (=> b!1539455 (= res!1056442 (not (= (select (arr!49333 a!2792) index!463) (select (arr!49333 a!2792) j!64))))))

(declare-fun b!1539456 () Bool)

(declare-fun res!1056444 () Bool)

(assert (=> b!1539456 (=> (not res!1056444) (not e!856217))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539456 (= res!1056444 (validKeyInArray!0 (select (arr!49333 a!2792) i!951)))))

(declare-fun e!856218 () Bool)

(declare-fun b!1539457 () Bool)

(declare-fun lt!664842 () (_ BitVec 32))

(assert (=> b!1539457 (= e!856218 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664842 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) lt!664841)))))

(declare-fun b!1539458 () Bool)

(declare-fun res!1056438 () Bool)

(assert (=> b!1539458 (=> (not res!1056438) (not e!856217))))

(assert (=> b!1539458 (= res!1056438 (validKeyInArray!0 (select (arr!49333 a!2792) j!64)))))

(declare-fun b!1539459 () Bool)

(declare-fun res!1056439 () Bool)

(assert (=> b!1539459 (=> (not res!1056439) (not e!856217))))

(declare-datatypes ((List!35885 0))(
  ( (Nil!35882) (Cons!35881 (h!37327 (_ BitVec 64)) (t!50571 List!35885)) )
))
(declare-fun arrayNoDuplicates!0 (array!102241 (_ BitVec 32) List!35885) Bool)

(assert (=> b!1539459 (= res!1056439 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35882))))

(declare-fun b!1539460 () Bool)

(declare-fun res!1056445 () Bool)

(assert (=> b!1539460 (=> (not res!1056445) (not e!856217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102241 (_ BitVec 32)) Bool)

(assert (=> b!1539460 (= res!1056445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539461 () Bool)

(declare-fun res!1056443 () Bool)

(assert (=> b!1539461 (=> (not res!1056443) (not e!856217))))

(assert (=> b!1539461 (= res!1056443 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49885 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49885 a!2792)) (= (select (arr!49333 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539462 () Bool)

(declare-fun res!1056436 () Bool)

(assert (=> b!1539462 (=> (not res!1056436) (not e!856217))))

(assert (=> b!1539462 (= res!1056436 (and (= (size!49885 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49885 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49885 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539463 () Bool)

(assert (=> b!1539463 (= e!856216 e!856218)))

(declare-fun res!1056440 () Bool)

(assert (=> b!1539463 (=> (not res!1056440) (not e!856218))))

(assert (=> b!1539463 (= res!1056440 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664842 #b00000000000000000000000000000000) (bvslt lt!664842 (size!49885 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539463 (= lt!664842 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131256 res!1056441) b!1539462))

(assert (= (and b!1539462 res!1056436) b!1539456))

(assert (= (and b!1539456 res!1056444) b!1539458))

(assert (= (and b!1539458 res!1056438) b!1539460))

(assert (= (and b!1539460 res!1056445) b!1539459))

(assert (= (and b!1539459 res!1056439) b!1539461))

(assert (= (and b!1539461 res!1056443) b!1539454))

(assert (= (and b!1539454 res!1056437) b!1539455))

(assert (= (and b!1539455 res!1056442) b!1539463))

(assert (= (and b!1539463 res!1056440) b!1539457))

(declare-fun m!1421063 () Bool)

(assert (=> b!1539463 m!1421063))

(declare-fun m!1421065 () Bool)

(assert (=> b!1539457 m!1421065))

(assert (=> b!1539457 m!1421065))

(declare-fun m!1421067 () Bool)

(assert (=> b!1539457 m!1421067))

(declare-fun m!1421069 () Bool)

(assert (=> b!1539455 m!1421069))

(assert (=> b!1539455 m!1421065))

(assert (=> b!1539454 m!1421065))

(assert (=> b!1539454 m!1421065))

(declare-fun m!1421071 () Bool)

(assert (=> b!1539454 m!1421071))

(declare-fun m!1421073 () Bool)

(assert (=> start!131256 m!1421073))

(declare-fun m!1421075 () Bool)

(assert (=> start!131256 m!1421075))

(declare-fun m!1421077 () Bool)

(assert (=> b!1539459 m!1421077))

(declare-fun m!1421079 () Bool)

(assert (=> b!1539460 m!1421079))

(declare-fun m!1421081 () Bool)

(assert (=> b!1539461 m!1421081))

(declare-fun m!1421083 () Bool)

(assert (=> b!1539456 m!1421083))

(assert (=> b!1539456 m!1421083))

(declare-fun m!1421085 () Bool)

(assert (=> b!1539456 m!1421085))

(assert (=> b!1539458 m!1421065))

(assert (=> b!1539458 m!1421065))

(declare-fun m!1421087 () Bool)

(assert (=> b!1539458 m!1421087))

(check-sat (not b!1539460) (not b!1539463) (not b!1539459) (not b!1539456) (not b!1539454) (not b!1539457) (not b!1539458) (not start!131256))
(check-sat)
(get-model)

(declare-fun d!160223 () Bool)

(assert (=> d!160223 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131256 d!160223))

(declare-fun d!160225 () Bool)

(assert (=> d!160225 (= (array_inv!38566 a!2792) (bvsge (size!49885 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131256 d!160225))

(declare-fun b!1539536 () Bool)

(declare-fun e!856250 () SeekEntryResult!13484)

(declare-fun e!856252 () SeekEntryResult!13484)

(assert (=> b!1539536 (= e!856250 e!856252)))

(declare-fun lt!664860 () (_ BitVec 64))

(declare-fun c!141076 () Bool)

(assert (=> b!1539536 (= c!141076 (= lt!664860 (select (arr!49333 a!2792) j!64)))))

(declare-fun b!1539537 () Bool)

(declare-fun c!141078 () Bool)

(assert (=> b!1539537 (= c!141078 (= lt!664860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856251 () SeekEntryResult!13484)

(assert (=> b!1539537 (= e!856252 e!856251)))

(declare-fun b!1539538 () Bool)

(assert (=> b!1539538 (= e!856251 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!664859 () SeekEntryResult!13484)

(declare-fun d!160227 () Bool)

(get-info :version)

(assert (=> d!160227 (and (or ((_ is Undefined!13484) lt!664859) (not ((_ is Found!13484) lt!664859)) (and (bvsge (index!56332 lt!664859) #b00000000000000000000000000000000) (bvslt (index!56332 lt!664859) (size!49885 a!2792)))) (or ((_ is Undefined!13484) lt!664859) ((_ is Found!13484) lt!664859) (not ((_ is MissingVacant!13484) lt!664859)) (not (= (index!56334 lt!664859) vacantIndex!5)) (and (bvsge (index!56334 lt!664859) #b00000000000000000000000000000000) (bvslt (index!56334 lt!664859) (size!49885 a!2792)))) (or ((_ is Undefined!13484) lt!664859) (ite ((_ is Found!13484) lt!664859) (= (select (arr!49333 a!2792) (index!56332 lt!664859)) (select (arr!49333 a!2792) j!64)) (and ((_ is MissingVacant!13484) lt!664859) (= (index!56334 lt!664859) vacantIndex!5) (= (select (arr!49333 a!2792) (index!56334 lt!664859)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160227 (= lt!664859 e!856250)))

(declare-fun c!141077 () Bool)

(assert (=> d!160227 (= c!141077 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160227 (= lt!664860 (select (arr!49333 a!2792) index!463))))

(assert (=> d!160227 (validMask!0 mask!2480)))

(assert (=> d!160227 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) lt!664859)))

(declare-fun b!1539539 () Bool)

(assert (=> b!1539539 (= e!856252 (Found!13484 index!463))))

(declare-fun b!1539540 () Bool)

(assert (=> b!1539540 (= e!856250 Undefined!13484)))

(declare-fun b!1539541 () Bool)

(assert (=> b!1539541 (= e!856251 (MissingVacant!13484 vacantIndex!5))))

(assert (= (and d!160227 c!141077) b!1539540))

(assert (= (and d!160227 (not c!141077)) b!1539536))

(assert (= (and b!1539536 c!141076) b!1539539))

(assert (= (and b!1539536 (not c!141076)) b!1539537))

(assert (= (and b!1539537 c!141078) b!1539541))

(assert (= (and b!1539537 (not c!141078)) b!1539538))

(assert (=> b!1539538 m!1421063))

(assert (=> b!1539538 m!1421063))

(assert (=> b!1539538 m!1421065))

(declare-fun m!1421141 () Bool)

(assert (=> b!1539538 m!1421141))

(declare-fun m!1421143 () Bool)

(assert (=> d!160227 m!1421143))

(declare-fun m!1421145 () Bool)

(assert (=> d!160227 m!1421145))

(assert (=> d!160227 m!1421069))

(assert (=> d!160227 m!1421073))

(assert (=> b!1539454 d!160227))

(declare-fun b!1539562 () Bool)

(declare-fun e!856269 () Bool)

(declare-fun call!68605 () Bool)

(assert (=> b!1539562 (= e!856269 call!68605)))

(declare-fun bm!68602 () Bool)

(assert (=> bm!68602 (= call!68605 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539563 () Bool)

(declare-fun e!856268 () Bool)

(declare-fun e!856270 () Bool)

(assert (=> b!1539563 (= e!856268 e!856270)))

(declare-fun c!141084 () Bool)

(assert (=> b!1539563 (= c!141084 (validKeyInArray!0 (select (arr!49333 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539564 () Bool)

(assert (=> b!1539564 (= e!856270 call!68605)))

(declare-fun d!160233 () Bool)

(declare-fun res!1056516 () Bool)

(assert (=> d!160233 (=> res!1056516 e!856268)))

(assert (=> d!160233 (= res!1056516 (bvsge #b00000000000000000000000000000000 (size!49885 a!2792)))))

(assert (=> d!160233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856268)))

(declare-fun b!1539565 () Bool)

(assert (=> b!1539565 (= e!856270 e!856269)))

(declare-fun lt!664878 () (_ BitVec 64))

(assert (=> b!1539565 (= lt!664878 (select (arr!49333 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51249 0))(
  ( (Unit!51250) )
))
(declare-fun lt!664877 () Unit!51249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102241 (_ BitVec 64) (_ BitVec 32)) Unit!51249)

(assert (=> b!1539565 (= lt!664877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664878 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539565 (arrayContainsKey!0 a!2792 lt!664878 #b00000000000000000000000000000000)))

(declare-fun lt!664876 () Unit!51249)

(assert (=> b!1539565 (= lt!664876 lt!664877)))

(declare-fun res!1056517 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102241 (_ BitVec 32)) SeekEntryResult!13484)

(assert (=> b!1539565 (= res!1056517 (= (seekEntryOrOpen!0 (select (arr!49333 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13484 #b00000000000000000000000000000000)))))

(assert (=> b!1539565 (=> (not res!1056517) (not e!856269))))

(assert (= (and d!160233 (not res!1056516)) b!1539563))

(assert (= (and b!1539563 c!141084) b!1539565))

(assert (= (and b!1539563 (not c!141084)) b!1539564))

(assert (= (and b!1539565 res!1056517) b!1539562))

(assert (= (or b!1539562 b!1539564) bm!68602))

(declare-fun m!1421159 () Bool)

(assert (=> bm!68602 m!1421159))

(declare-fun m!1421161 () Bool)

(assert (=> b!1539563 m!1421161))

(assert (=> b!1539563 m!1421161))

(declare-fun m!1421163 () Bool)

(assert (=> b!1539563 m!1421163))

(assert (=> b!1539565 m!1421161))

(declare-fun m!1421165 () Bool)

(assert (=> b!1539565 m!1421165))

(declare-fun m!1421167 () Bool)

(assert (=> b!1539565 m!1421167))

(assert (=> b!1539565 m!1421161))

(declare-fun m!1421169 () Bool)

(assert (=> b!1539565 m!1421169))

(assert (=> b!1539460 d!160233))

(declare-fun d!160247 () Bool)

(assert (=> d!160247 (= (validKeyInArray!0 (select (arr!49333 a!2792) i!951)) (and (not (= (select (arr!49333 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49333 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539456 d!160247))

(declare-fun b!1539566 () Bool)

(declare-fun e!856271 () SeekEntryResult!13484)

(declare-fun e!856273 () SeekEntryResult!13484)

(assert (=> b!1539566 (= e!856271 e!856273)))

(declare-fun c!141085 () Bool)

(declare-fun lt!664880 () (_ BitVec 64))

(assert (=> b!1539566 (= c!141085 (= lt!664880 (select (arr!49333 a!2792) j!64)))))

(declare-fun b!1539567 () Bool)

(declare-fun c!141087 () Bool)

(assert (=> b!1539567 (= c!141087 (= lt!664880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!856272 () SeekEntryResult!13484)

(assert (=> b!1539567 (= e!856273 e!856272)))

(declare-fun b!1539568 () Bool)

(assert (=> b!1539568 (= e!856272 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!664842 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480))))

(declare-fun d!160249 () Bool)

(declare-fun lt!664879 () SeekEntryResult!13484)

(assert (=> d!160249 (and (or ((_ is Undefined!13484) lt!664879) (not ((_ is Found!13484) lt!664879)) (and (bvsge (index!56332 lt!664879) #b00000000000000000000000000000000) (bvslt (index!56332 lt!664879) (size!49885 a!2792)))) (or ((_ is Undefined!13484) lt!664879) ((_ is Found!13484) lt!664879) (not ((_ is MissingVacant!13484) lt!664879)) (not (= (index!56334 lt!664879) vacantIndex!5)) (and (bvsge (index!56334 lt!664879) #b00000000000000000000000000000000) (bvslt (index!56334 lt!664879) (size!49885 a!2792)))) (or ((_ is Undefined!13484) lt!664879) (ite ((_ is Found!13484) lt!664879) (= (select (arr!49333 a!2792) (index!56332 lt!664879)) (select (arr!49333 a!2792) j!64)) (and ((_ is MissingVacant!13484) lt!664879) (= (index!56334 lt!664879) vacantIndex!5) (= (select (arr!49333 a!2792) (index!56334 lt!664879)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160249 (= lt!664879 e!856271)))

(declare-fun c!141086 () Bool)

(assert (=> d!160249 (= c!141086 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160249 (= lt!664880 (select (arr!49333 a!2792) lt!664842))))

(assert (=> d!160249 (validMask!0 mask!2480)))

(assert (=> d!160249 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664842 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) lt!664879)))

(declare-fun b!1539569 () Bool)

(assert (=> b!1539569 (= e!856273 (Found!13484 lt!664842))))

(declare-fun b!1539570 () Bool)

(assert (=> b!1539570 (= e!856271 Undefined!13484)))

(declare-fun b!1539571 () Bool)

(assert (=> b!1539571 (= e!856272 (MissingVacant!13484 vacantIndex!5))))

(assert (= (and d!160249 c!141086) b!1539570))

(assert (= (and d!160249 (not c!141086)) b!1539566))

(assert (= (and b!1539566 c!141085) b!1539569))

(assert (= (and b!1539566 (not c!141085)) b!1539567))

(assert (= (and b!1539567 c!141087) b!1539571))

(assert (= (and b!1539567 (not c!141087)) b!1539568))

(declare-fun m!1421171 () Bool)

(assert (=> b!1539568 m!1421171))

(assert (=> b!1539568 m!1421171))

(assert (=> b!1539568 m!1421065))

(declare-fun m!1421173 () Bool)

(assert (=> b!1539568 m!1421173))

(declare-fun m!1421175 () Bool)

(assert (=> d!160249 m!1421175))

(declare-fun m!1421177 () Bool)

(assert (=> d!160249 m!1421177))

(declare-fun m!1421179 () Bool)

(assert (=> d!160249 m!1421179))

(assert (=> d!160249 m!1421073))

(assert (=> b!1539457 d!160249))

(declare-fun d!160251 () Bool)

(declare-fun lt!664883 () (_ BitVec 32))

(assert (=> d!160251 (and (bvsge lt!664883 #b00000000000000000000000000000000) (bvslt lt!664883 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160251 (= lt!664883 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160251 (validMask!0 mask!2480)))

(assert (=> d!160251 (= (nextIndex!0 index!463 x!510 mask!2480) lt!664883)))

(declare-fun bs!44160 () Bool)

(assert (= bs!44160 d!160251))

(declare-fun m!1421181 () Bool)

(assert (=> bs!44160 m!1421181))

(assert (=> bs!44160 m!1421073))

(assert (=> b!1539463 d!160251))

(declare-fun d!160253 () Bool)

(assert (=> d!160253 (= (validKeyInArray!0 (select (arr!49333 a!2792) j!64)) (and (not (= (select (arr!49333 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49333 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539458 d!160253))

(declare-fun b!1539610 () Bool)

(declare-fun e!856299 () Bool)

(declare-fun call!68608 () Bool)

(assert (=> b!1539610 (= e!856299 call!68608)))

(declare-fun b!1539611 () Bool)

(declare-fun e!856298 () Bool)

(assert (=> b!1539611 (= e!856298 e!856299)))

(declare-fun c!141104 () Bool)

(assert (=> b!1539611 (= c!141104 (validKeyInArray!0 (select (arr!49333 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539612 () Bool)

(declare-fun e!856297 () Bool)

(declare-fun contains!9979 (List!35885 (_ BitVec 64)) Bool)

(assert (=> b!1539612 (= e!856297 (contains!9979 Nil!35882 (select (arr!49333 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160255 () Bool)

(declare-fun res!1056526 () Bool)

(declare-fun e!856296 () Bool)

(assert (=> d!160255 (=> res!1056526 e!856296)))

(assert (=> d!160255 (= res!1056526 (bvsge #b00000000000000000000000000000000 (size!49885 a!2792)))))

(assert (=> d!160255 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35882) e!856296)))

(declare-fun b!1539613 () Bool)

(assert (=> b!1539613 (= e!856299 call!68608)))

(declare-fun bm!68605 () Bool)

(assert (=> bm!68605 (= call!68608 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141104 (Cons!35881 (select (arr!49333 a!2792) #b00000000000000000000000000000000) Nil!35882) Nil!35882)))))

(declare-fun b!1539614 () Bool)

(assert (=> b!1539614 (= e!856296 e!856298)))

(declare-fun res!1056525 () Bool)

(assert (=> b!1539614 (=> (not res!1056525) (not e!856298))))

(assert (=> b!1539614 (= res!1056525 (not e!856297))))

(declare-fun res!1056524 () Bool)

(assert (=> b!1539614 (=> (not res!1056524) (not e!856297))))

(assert (=> b!1539614 (= res!1056524 (validKeyInArray!0 (select (arr!49333 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160255 (not res!1056526)) b!1539614))

(assert (= (and b!1539614 res!1056524) b!1539612))

(assert (= (and b!1539614 res!1056525) b!1539611))

(assert (= (and b!1539611 c!141104) b!1539610))

(assert (= (and b!1539611 (not c!141104)) b!1539613))

(assert (= (or b!1539610 b!1539613) bm!68605))

(assert (=> b!1539611 m!1421161))

(assert (=> b!1539611 m!1421161))

(assert (=> b!1539611 m!1421163))

(assert (=> b!1539612 m!1421161))

(assert (=> b!1539612 m!1421161))

(declare-fun m!1421199 () Bool)

(assert (=> b!1539612 m!1421199))

(assert (=> bm!68605 m!1421161))

(declare-fun m!1421201 () Bool)

(assert (=> bm!68605 m!1421201))

(assert (=> b!1539614 m!1421161))

(assert (=> b!1539614 m!1421161))

(assert (=> b!1539614 m!1421163))

(assert (=> b!1539459 d!160255))

(check-sat (not d!160249) (not b!1539612) (not d!160227) (not b!1539568) (not bm!68605) (not b!1539611) (not b!1539538) (not d!160251) (not bm!68602) (not b!1539563) (not b!1539565) (not b!1539614))
(check-sat)
