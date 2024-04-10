; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47008 () Bool)

(assert start!47008)

(declare-fun b!518431 () Bool)

(declare-datatypes ((Unit!16072 0))(
  ( (Unit!16073) )
))
(declare-fun e!302481 () Unit!16072)

(declare-fun Unit!16074 () Unit!16072)

(assert (=> b!518431 (= e!302481 Unit!16074)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!237357 () Unit!16072)

(declare-datatypes ((array!33149 0))(
  ( (array!33150 (arr!15938 (Array (_ BitVec 32) (_ BitVec 64))) (size!16302 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33149)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4405 0))(
  ( (MissingZero!4405 (index!19808 (_ BitVec 32))) (Found!4405 (index!19809 (_ BitVec 32))) (Intermediate!4405 (undefined!5217 Bool) (index!19810 (_ BitVec 32)) (x!48770 (_ BitVec 32))) (Undefined!4405) (MissingVacant!4405 (index!19811 (_ BitVec 32))) )
))
(declare-fun lt!237358 () SeekEntryResult!4405)

(declare-fun lt!237363 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16072)

(assert (=> b!518431 (= lt!237357 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237363 #b00000000000000000000000000000000 (index!19810 lt!237358) (x!48770 lt!237358) mask!3524))))

(declare-fun lt!237360 () array!33149)

(declare-fun lt!237361 () (_ BitVec 64))

(declare-fun res!317434 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33149 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!518431 (= res!317434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237363 lt!237361 lt!237360 mask!3524) (Intermediate!4405 false (index!19810 lt!237358) (x!48770 lt!237358))))))

(declare-fun e!302483 () Bool)

(assert (=> b!518431 (=> (not res!317434) (not e!302483))))

(assert (=> b!518431 e!302483))

(declare-fun b!518432 () Bool)

(declare-fun res!317437 () Bool)

(declare-fun e!302479 () Bool)

(assert (=> b!518432 (=> (not res!317437) (not e!302479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33149 (_ BitVec 32)) Bool)

(assert (=> b!518432 (= res!317437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!302482 () Bool)

(declare-fun b!518433 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33149 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!518433 (= e!302482 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) (Found!4405 j!176)))))

(declare-fun b!518434 () Bool)

(declare-fun e!302478 () Bool)

(assert (=> b!518434 (= e!302478 e!302479)))

(declare-fun res!317430 () Bool)

(assert (=> b!518434 (=> (not res!317430) (not e!302479))))

(declare-fun lt!237356 () SeekEntryResult!4405)

(assert (=> b!518434 (= res!317430 (or (= lt!237356 (MissingZero!4405 i!1204)) (= lt!237356 (MissingVacant!4405 i!1204))))))

(assert (=> b!518434 (= lt!237356 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518435 () Bool)

(declare-fun res!317432 () Bool)

(declare-fun e!302484 () Bool)

(assert (=> b!518435 (=> res!317432 e!302484)))

(assert (=> b!518435 (= res!317432 (or (undefined!5217 lt!237358) (not (is-Intermediate!4405 lt!237358))))))

(declare-fun res!317439 () Bool)

(assert (=> start!47008 (=> (not res!317439) (not e!302478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47008 (= res!317439 (validMask!0 mask!3524))))

(assert (=> start!47008 e!302478))

(assert (=> start!47008 true))

(declare-fun array_inv!11734 (array!33149) Bool)

(assert (=> start!47008 (array_inv!11734 a!3235)))

(declare-fun b!518436 () Bool)

(declare-fun res!317441 () Bool)

(assert (=> b!518436 (=> (not res!317441) (not e!302478))))

(assert (=> b!518436 (= res!317441 (and (= (size!16302 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16302 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16302 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518437 () Bool)

(assert (=> b!518437 (= e!302483 false)))

(declare-fun b!518438 () Bool)

(declare-fun Unit!16075 () Unit!16072)

(assert (=> b!518438 (= e!302481 Unit!16075)))

(declare-fun b!518439 () Bool)

(declare-fun res!317431 () Bool)

(assert (=> b!518439 (=> (not res!317431) (not e!302479))))

(declare-datatypes ((List!10096 0))(
  ( (Nil!10093) (Cons!10092 (h!10999 (_ BitVec 64)) (t!16324 List!10096)) )
))
(declare-fun arrayNoDuplicates!0 (array!33149 (_ BitVec 32) List!10096) Bool)

(assert (=> b!518439 (= res!317431 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10093))))

(declare-fun b!518440 () Bool)

(declare-fun res!317435 () Bool)

(assert (=> b!518440 (=> (not res!317435) (not e!302478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518440 (= res!317435 (validKeyInArray!0 (select (arr!15938 a!3235) j!176)))))

(declare-fun b!518441 () Bool)

(declare-fun res!317438 () Bool)

(assert (=> b!518441 (=> (not res!317438) (not e!302478))))

(declare-fun arrayContainsKey!0 (array!33149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518441 (= res!317438 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518442 () Bool)

(assert (=> b!518442 (= e!302479 (not e!302484))))

(declare-fun res!317436 () Bool)

(assert (=> b!518442 (=> res!317436 e!302484)))

(declare-fun lt!237359 () (_ BitVec 32))

(assert (=> b!518442 (= res!317436 (= lt!237358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237359 lt!237361 lt!237360 mask!3524)))))

(assert (=> b!518442 (= lt!237358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237363 (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518442 (= lt!237359 (toIndex!0 lt!237361 mask!3524))))

(assert (=> b!518442 (= lt!237361 (select (store (arr!15938 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518442 (= lt!237363 (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524))))

(assert (=> b!518442 (= lt!237360 (array!33150 (store (arr!15938 a!3235) i!1204 k!2280) (size!16302 a!3235)))))

(assert (=> b!518442 e!302482))

(declare-fun res!317433 () Bool)

(assert (=> b!518442 (=> (not res!317433) (not e!302482))))

(assert (=> b!518442 (= res!317433 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237362 () Unit!16072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16072)

(assert (=> b!518442 (= lt!237362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518443 () Bool)

(assert (=> b!518443 (= e!302484 (and (bvsge (index!19810 lt!237358) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237358) (size!16302 a!3235))))))

(declare-fun lt!237364 () Unit!16072)

(assert (=> b!518443 (= lt!237364 e!302481)))

(declare-fun c!60794 () Bool)

(assert (=> b!518443 (= c!60794 (= (select (arr!15938 a!3235) (index!19810 lt!237358)) (select (arr!15938 a!3235) j!176)))))

(assert (=> b!518443 (and (bvslt (x!48770 lt!237358) #b01111111111111111111111111111110) (or (= (select (arr!15938 a!3235) (index!19810 lt!237358)) (select (arr!15938 a!3235) j!176)) (= (select (arr!15938 a!3235) (index!19810 lt!237358)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15938 a!3235) (index!19810 lt!237358)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518444 () Bool)

(declare-fun res!317440 () Bool)

(assert (=> b!518444 (=> (not res!317440) (not e!302478))))

(assert (=> b!518444 (= res!317440 (validKeyInArray!0 k!2280))))

(assert (= (and start!47008 res!317439) b!518436))

(assert (= (and b!518436 res!317441) b!518440))

(assert (= (and b!518440 res!317435) b!518444))

(assert (= (and b!518444 res!317440) b!518441))

(assert (= (and b!518441 res!317438) b!518434))

(assert (= (and b!518434 res!317430) b!518432))

(assert (= (and b!518432 res!317437) b!518439))

(assert (= (and b!518439 res!317431) b!518442))

(assert (= (and b!518442 res!317433) b!518433))

(assert (= (and b!518442 (not res!317436)) b!518435))

(assert (= (and b!518435 (not res!317432)) b!518443))

(assert (= (and b!518443 c!60794) b!518431))

(assert (= (and b!518443 (not c!60794)) b!518438))

(assert (= (and b!518431 res!317434) b!518437))

(declare-fun m!499809 () Bool)

(assert (=> b!518431 m!499809))

(declare-fun m!499811 () Bool)

(assert (=> b!518431 m!499811))

(declare-fun m!499813 () Bool)

(assert (=> b!518444 m!499813))

(declare-fun m!499815 () Bool)

(assert (=> b!518439 m!499815))

(declare-fun m!499817 () Bool)

(assert (=> b!518440 m!499817))

(assert (=> b!518440 m!499817))

(declare-fun m!499819 () Bool)

(assert (=> b!518440 m!499819))

(declare-fun m!499821 () Bool)

(assert (=> b!518434 m!499821))

(declare-fun m!499823 () Bool)

(assert (=> b!518442 m!499823))

(declare-fun m!499825 () Bool)

(assert (=> b!518442 m!499825))

(declare-fun m!499827 () Bool)

(assert (=> b!518442 m!499827))

(declare-fun m!499829 () Bool)

(assert (=> b!518442 m!499829))

(declare-fun m!499831 () Bool)

(assert (=> b!518442 m!499831))

(assert (=> b!518442 m!499817))

(declare-fun m!499833 () Bool)

(assert (=> b!518442 m!499833))

(assert (=> b!518442 m!499817))

(declare-fun m!499835 () Bool)

(assert (=> b!518442 m!499835))

(assert (=> b!518442 m!499817))

(declare-fun m!499837 () Bool)

(assert (=> b!518442 m!499837))

(declare-fun m!499839 () Bool)

(assert (=> b!518443 m!499839))

(assert (=> b!518443 m!499817))

(declare-fun m!499841 () Bool)

(assert (=> b!518432 m!499841))

(declare-fun m!499843 () Bool)

(assert (=> b!518441 m!499843))

(declare-fun m!499845 () Bool)

(assert (=> start!47008 m!499845))

(declare-fun m!499847 () Bool)

(assert (=> start!47008 m!499847))

(assert (=> b!518433 m!499817))

(assert (=> b!518433 m!499817))

(declare-fun m!499849 () Bool)

(assert (=> b!518433 m!499849))

(push 1)

(assert (not b!518441))

(assert (not b!518439))

(assert (not b!518431))

(assert (not start!47008))

(assert (not b!518433))

(assert (not b!518440))

(assert (not b!518442))

(assert (not b!518434))

(assert (not b!518432))

(assert (not b!518444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79879 () Bool)

(declare-fun res!317456 () Bool)

(declare-fun e!302513 () Bool)

(assert (=> d!79879 (=> res!317456 e!302513)))

(assert (=> d!79879 (= res!317456 (= (select (arr!15938 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79879 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!302513)))

(declare-fun b!518487 () Bool)

(declare-fun e!302514 () Bool)

(assert (=> b!518487 (= e!302513 e!302514)))

(declare-fun res!317457 () Bool)

(assert (=> b!518487 (=> (not res!317457) (not e!302514))))

(assert (=> b!518487 (= res!317457 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16302 a!3235)))))

(declare-fun b!518488 () Bool)

(assert (=> b!518488 (= e!302514 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79879 (not res!317456)) b!518487))

(assert (= (and b!518487 res!317457) b!518488))

(declare-fun m!499881 () Bool)

(assert (=> d!79879 m!499881))

(declare-fun m!499883 () Bool)

(assert (=> b!518488 m!499883))

(assert (=> b!518441 d!79879))

(declare-fun d!79881 () Bool)

(assert (=> d!79881 (= (validKeyInArray!0 (select (arr!15938 a!3235) j!176)) (and (not (= (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15938 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518440 d!79881))

(declare-fun b!518544 () Bool)

(declare-fun e!302551 () SeekEntryResult!4405)

(assert (=> b!518544 (= e!302551 (Intermediate!4405 false lt!237359 #b00000000000000000000000000000000))))

(declare-fun d!79883 () Bool)

(declare-fun e!302553 () Bool)

(assert (=> d!79883 e!302553))

(declare-fun c!60829 () Bool)

(declare-fun lt!237412 () SeekEntryResult!4405)

(assert (=> d!79883 (= c!60829 (and (is-Intermediate!4405 lt!237412) (undefined!5217 lt!237412)))))

(declare-fun e!302552 () SeekEntryResult!4405)

(assert (=> d!79883 (= lt!237412 e!302552)))

(declare-fun c!60830 () Bool)

(assert (=> d!79883 (= c!60830 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237411 () (_ BitVec 64))

(assert (=> d!79883 (= lt!237411 (select (arr!15938 lt!237360) lt!237359))))

(assert (=> d!79883 (validMask!0 mask!3524)))

(assert (=> d!79883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237359 lt!237361 lt!237360 mask!3524) lt!237412)))

(declare-fun b!518545 () Bool)

(assert (=> b!518545 (and (bvsge (index!19810 lt!237412) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237412) (size!16302 lt!237360)))))

(declare-fun res!317475 () Bool)

(assert (=> b!518545 (= res!317475 (= (select (arr!15938 lt!237360) (index!19810 lt!237412)) lt!237361))))

(declare-fun e!302550 () Bool)

(assert (=> b!518545 (=> res!317475 e!302550)))

(declare-fun e!302549 () Bool)

(assert (=> b!518545 (= e!302549 e!302550)))

(declare-fun b!518546 () Bool)

(assert (=> b!518546 (and (bvsge (index!19810 lt!237412) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237412) (size!16302 lt!237360)))))

(declare-fun res!317476 () Bool)

(assert (=> b!518546 (= res!317476 (= (select (arr!15938 lt!237360) (index!19810 lt!237412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518546 (=> res!317476 e!302550)))

(declare-fun b!518547 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518547 (= e!302551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237359 #b00000000000000000000000000000000 mask!3524) lt!237361 lt!237360 mask!3524))))

(declare-fun b!518548 () Bool)

(assert (=> b!518548 (= e!302553 e!302549)))

(declare-fun res!317477 () Bool)

(assert (=> b!518548 (= res!317477 (and (is-Intermediate!4405 lt!237412) (not (undefined!5217 lt!237412)) (bvslt (x!48770 lt!237412) #b01111111111111111111111111111110) (bvsge (x!48770 lt!237412) #b00000000000000000000000000000000) (bvsge (x!48770 lt!237412) #b00000000000000000000000000000000)))))

(assert (=> b!518548 (=> (not res!317477) (not e!302549))))

(declare-fun b!518549 () Bool)

(assert (=> b!518549 (and (bvsge (index!19810 lt!237412) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237412) (size!16302 lt!237360)))))

(assert (=> b!518549 (= e!302550 (= (select (arr!15938 lt!237360) (index!19810 lt!237412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518550 () Bool)

(assert (=> b!518550 (= e!302552 e!302551)))

(declare-fun c!60828 () Bool)

(assert (=> b!518550 (= c!60828 (or (= lt!237411 lt!237361) (= (bvadd lt!237411 lt!237411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518551 () Bool)

(assert (=> b!518551 (= e!302552 (Intermediate!4405 true lt!237359 #b00000000000000000000000000000000))))

(declare-fun b!518552 () Bool)

(assert (=> b!518552 (= e!302553 (bvsge (x!48770 lt!237412) #b01111111111111111111111111111110))))

(assert (= (and d!79883 c!60830) b!518551))

(assert (= (and d!79883 (not c!60830)) b!518550))

(assert (= (and b!518550 c!60828) b!518544))

(assert (= (and b!518550 (not c!60828)) b!518547))

(assert (= (and d!79883 c!60829) b!518552))

(assert (= (and d!79883 (not c!60829)) b!518548))

(assert (= (and b!518548 res!317477) b!518545))

(assert (= (and b!518545 (not res!317475)) b!518546))

(assert (= (and b!518546 (not res!317476)) b!518549))

(declare-fun m!499925 () Bool)

(assert (=> b!518546 m!499925))

(assert (=> b!518549 m!499925))

(declare-fun m!499927 () Bool)

(assert (=> b!518547 m!499927))

(assert (=> b!518547 m!499927))

(declare-fun m!499929 () Bool)

(assert (=> b!518547 m!499929))

(assert (=> b!518545 m!499925))

(declare-fun m!499931 () Bool)

(assert (=> d!79883 m!499931))

(assert (=> d!79883 m!499845))

(assert (=> b!518442 d!79883))

(declare-fun b!518553 () Bool)

(declare-fun e!302556 () SeekEntryResult!4405)

(assert (=> b!518553 (= e!302556 (Intermediate!4405 false lt!237363 #b00000000000000000000000000000000))))

(declare-fun d!79893 () Bool)

(declare-fun e!302558 () Bool)

(assert (=> d!79893 e!302558))

(declare-fun c!60832 () Bool)

(declare-fun lt!237414 () SeekEntryResult!4405)

(assert (=> d!79893 (= c!60832 (and (is-Intermediate!4405 lt!237414) (undefined!5217 lt!237414)))))

(declare-fun e!302557 () SeekEntryResult!4405)

(assert (=> d!79893 (= lt!237414 e!302557)))

(declare-fun c!60833 () Bool)

(assert (=> d!79893 (= c!60833 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237413 () (_ BitVec 64))

(assert (=> d!79893 (= lt!237413 (select (arr!15938 a!3235) lt!237363))))

(assert (=> d!79893 (validMask!0 mask!3524)))

(assert (=> d!79893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237363 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) lt!237414)))

(declare-fun b!518554 () Bool)

(assert (=> b!518554 (and (bvsge (index!19810 lt!237414) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237414) (size!16302 a!3235)))))

(declare-fun res!317478 () Bool)

(assert (=> b!518554 (= res!317478 (= (select (arr!15938 a!3235) (index!19810 lt!237414)) (select (arr!15938 a!3235) j!176)))))

(declare-fun e!302555 () Bool)

(assert (=> b!518554 (=> res!317478 e!302555)))

(declare-fun e!302554 () Bool)

(assert (=> b!518554 (= e!302554 e!302555)))

(declare-fun b!518555 () Bool)

(assert (=> b!518555 (and (bvsge (index!19810 lt!237414) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237414) (size!16302 a!3235)))))

(declare-fun res!317479 () Bool)

(assert (=> b!518555 (= res!317479 (= (select (arr!15938 a!3235) (index!19810 lt!237414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518555 (=> res!317479 e!302555)))

(declare-fun b!518556 () Bool)

(assert (=> b!518556 (= e!302556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237363 #b00000000000000000000000000000000 mask!3524) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518557 () Bool)

(assert (=> b!518557 (= e!302558 e!302554)))

(declare-fun res!317480 () Bool)

(assert (=> b!518557 (= res!317480 (and (is-Intermediate!4405 lt!237414) (not (undefined!5217 lt!237414)) (bvslt (x!48770 lt!237414) #b01111111111111111111111111111110) (bvsge (x!48770 lt!237414) #b00000000000000000000000000000000) (bvsge (x!48770 lt!237414) #b00000000000000000000000000000000)))))

(assert (=> b!518557 (=> (not res!317480) (not e!302554))))

(declare-fun b!518558 () Bool)

(assert (=> b!518558 (and (bvsge (index!19810 lt!237414) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237414) (size!16302 a!3235)))))

(assert (=> b!518558 (= e!302555 (= (select (arr!15938 a!3235) (index!19810 lt!237414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518559 () Bool)

(assert (=> b!518559 (= e!302557 e!302556)))

(declare-fun c!60831 () Bool)

(assert (=> b!518559 (= c!60831 (or (= lt!237413 (select (arr!15938 a!3235) j!176)) (= (bvadd lt!237413 lt!237413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518560 () Bool)

(assert (=> b!518560 (= e!302557 (Intermediate!4405 true lt!237363 #b00000000000000000000000000000000))))

(declare-fun b!518561 () Bool)

(assert (=> b!518561 (= e!302558 (bvsge (x!48770 lt!237414) #b01111111111111111111111111111110))))

(assert (= (and d!79893 c!60833) b!518560))

(assert (= (and d!79893 (not c!60833)) b!518559))

(assert (= (and b!518559 c!60831) b!518553))

(assert (= (and b!518559 (not c!60831)) b!518556))

(assert (= (and d!79893 c!60832) b!518561))

(assert (= (and d!79893 (not c!60832)) b!518557))

(assert (= (and b!518557 res!317480) b!518554))

(assert (= (and b!518554 (not res!317478)) b!518555))

(assert (= (and b!518555 (not res!317479)) b!518558))

(declare-fun m!499933 () Bool)

(assert (=> b!518555 m!499933))

(assert (=> b!518558 m!499933))

(declare-fun m!499935 () Bool)

(assert (=> b!518556 m!499935))

(assert (=> b!518556 m!499935))

(assert (=> b!518556 m!499817))

(declare-fun m!499937 () Bool)

(assert (=> b!518556 m!499937))

(assert (=> b!518554 m!499933))

(declare-fun m!499939 () Bool)

(assert (=> d!79893 m!499939))

(assert (=> d!79893 m!499845))

(assert (=> b!518442 d!79893))

(declare-fun d!79895 () Bool)

(declare-fun lt!237427 () (_ BitVec 32))

(declare-fun lt!237426 () (_ BitVec 32))

(assert (=> d!79895 (= lt!237427 (bvmul (bvxor lt!237426 (bvlshr lt!237426 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79895 (= lt!237426 ((_ extract 31 0) (bvand (bvxor (select (arr!15938 a!3235) j!176) (bvlshr (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79895 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317481 (let ((h!11000 ((_ extract 31 0) (bvand (bvxor (select (arr!15938 a!3235) j!176) (bvlshr (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48773 (bvmul (bvxor h!11000 (bvlshr h!11000 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48773 (bvlshr x!48773 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317481 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317481 #b00000000000000000000000000000000))))))

(assert (=> d!79895 (= (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524) (bvand (bvxor lt!237427 (bvlshr lt!237427 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518442 d!79895))

(declare-fun d!79897 () Bool)

(declare-fun lt!237429 () (_ BitVec 32))

(declare-fun lt!237428 () (_ BitVec 32))

(assert (=> d!79897 (= lt!237429 (bvmul (bvxor lt!237428 (bvlshr lt!237428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79897 (= lt!237428 ((_ extract 31 0) (bvand (bvxor lt!237361 (bvlshr lt!237361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79897 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317481 (let ((h!11000 ((_ extract 31 0) (bvand (bvxor lt!237361 (bvlshr lt!237361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48773 (bvmul (bvxor h!11000 (bvlshr h!11000 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48773 (bvlshr x!48773 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317481 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317481 #b00000000000000000000000000000000))))))

(assert (=> d!79897 (= (toIndex!0 lt!237361 mask!3524) (bvand (bvxor lt!237429 (bvlshr lt!237429 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518442 d!79897))

(declare-fun call!31712 () Bool)

(declare-fun bm!31709 () Bool)

(assert (=> bm!31709 (= call!31712 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518601 () Bool)

(declare-fun e!302584 () Bool)

(declare-fun e!302585 () Bool)

(assert (=> b!518601 (= e!302584 e!302585)))

(declare-fun c!60845 () Bool)

(assert (=> b!518601 (= c!60845 (validKeyInArray!0 (select (arr!15938 a!3235) j!176)))))

(declare-fun b!518602 () Bool)

(assert (=> b!518602 (= e!302585 call!31712)))

(declare-fun b!518603 () Bool)

(declare-fun e!302583 () Bool)

(assert (=> b!518603 (= e!302583 call!31712)))

(declare-fun b!518600 () Bool)

(assert (=> b!518600 (= e!302585 e!302583)))

(declare-fun lt!237439 () (_ BitVec 64))

(assert (=> b!518600 (= lt!237439 (select (arr!15938 a!3235) j!176))))

(declare-fun lt!237440 () Unit!16072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33149 (_ BitVec 64) (_ BitVec 32)) Unit!16072)

(assert (=> b!518600 (= lt!237440 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237439 j!176))))

(assert (=> b!518600 (arrayContainsKey!0 a!3235 lt!237439 #b00000000000000000000000000000000)))

(declare-fun lt!237438 () Unit!16072)

(assert (=> b!518600 (= lt!237438 lt!237440)))

(declare-fun res!317498 () Bool)

(assert (=> b!518600 (= res!317498 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) (Found!4405 j!176)))))

(assert (=> b!518600 (=> (not res!317498) (not e!302583))))

(declare-fun d!79901 () Bool)

(declare-fun res!317499 () Bool)

(assert (=> d!79901 (=> res!317499 e!302584)))

(assert (=> d!79901 (= res!317499 (bvsge j!176 (size!16302 a!3235)))))

(assert (=> d!79901 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302584)))

(assert (= (and d!79901 (not res!317499)) b!518601))

(assert (= (and b!518601 c!60845) b!518600))

(assert (= (and b!518601 (not c!60845)) b!518602))

(assert (= (and b!518600 res!317498) b!518603))

(assert (= (or b!518603 b!518602) bm!31709))

(declare-fun m!499953 () Bool)

(assert (=> bm!31709 m!499953))

(assert (=> b!518601 m!499817))

(assert (=> b!518601 m!499817))

(assert (=> b!518601 m!499819))

(assert (=> b!518600 m!499817))

(declare-fun m!499955 () Bool)

(assert (=> b!518600 m!499955))

(declare-fun m!499957 () Bool)

(assert (=> b!518600 m!499957))

(assert (=> b!518600 m!499817))

(assert (=> b!518600 m!499849))

(assert (=> b!518442 d!79901))

(declare-fun d!79905 () Bool)

(assert (=> d!79905 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237443 () Unit!16072)

(declare-fun choose!38 (array!33149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16072)

(assert (=> d!79905 (= lt!237443 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79905 (validMask!0 mask!3524)))

(assert (=> d!79905 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237443)))

(declare-fun bs!16360 () Bool)

(assert (= bs!16360 d!79905))

(assert (=> bs!16360 m!499835))

(declare-fun m!499963 () Bool)

(assert (=> bs!16360 m!499963))

(assert (=> bs!16360 m!499845))

(assert (=> b!518442 d!79905))

(declare-fun d!79909 () Bool)

(declare-fun e!302628 () Bool)

(assert (=> d!79909 e!302628))

(declare-fun res!317530 () Bool)

(assert (=> d!79909 (=> (not res!317530) (not e!302628))))

(assert (=> d!79909 (= res!317530 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16302 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16302 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16302 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16302 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16302 a!3235))))))

(declare-fun lt!237474 () Unit!16072)

(declare-fun choose!47 (array!33149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16072)

(assert (=> d!79909 (= lt!237474 (choose!47 a!3235 i!1204 k!2280 j!176 lt!237363 #b00000000000000000000000000000000 (index!19810 lt!237358) (x!48770 lt!237358) mask!3524))))

(assert (=> d!79909 (validMask!0 mask!3524)))

(assert (=> d!79909 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237363 #b00000000000000000000000000000000 (index!19810 lt!237358) (x!48770 lt!237358) mask!3524) lt!237474)))

(declare-fun b!518670 () Bool)

(assert (=> b!518670 (= e!302628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237363 (select (store (arr!15938 a!3235) i!1204 k!2280) j!176) (array!33150 (store (arr!15938 a!3235) i!1204 k!2280) (size!16302 a!3235)) mask!3524) (Intermediate!4405 false (index!19810 lt!237358) (x!48770 lt!237358))))))

(assert (= (and d!79909 res!317530) b!518670))

(declare-fun m!499995 () Bool)

(assert (=> d!79909 m!499995))

(assert (=> d!79909 m!499845))

(assert (=> b!518670 m!499823))

(assert (=> b!518670 m!499829))

(assert (=> b!518670 m!499829))

(declare-fun m!499997 () Bool)

(assert (=> b!518670 m!499997))

(assert (=> b!518431 d!79909))

(declare-fun b!518680 () Bool)

(declare-fun e!302636 () SeekEntryResult!4405)

(assert (=> b!518680 (= e!302636 (Intermediate!4405 false lt!237363 #b00000000000000000000000000000000))))

(declare-fun d!79927 () Bool)

(declare-fun e!302638 () Bool)

(assert (=> d!79927 e!302638))

(declare-fun c!60869 () Bool)

(declare-fun lt!237480 () SeekEntryResult!4405)

(assert (=> d!79927 (= c!60869 (and (is-Intermediate!4405 lt!237480) (undefined!5217 lt!237480)))))

(declare-fun e!302637 () SeekEntryResult!4405)

(assert (=> d!79927 (= lt!237480 e!302637)))

(declare-fun c!60870 () Bool)

(assert (=> d!79927 (= c!60870 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237479 () (_ BitVec 64))

(assert (=> d!79927 (= lt!237479 (select (arr!15938 lt!237360) lt!237363))))

(assert (=> d!79927 (validMask!0 mask!3524)))

(assert (=> d!79927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237363 lt!237361 lt!237360 mask!3524) lt!237480)))

(declare-fun b!518681 () Bool)

(assert (=> b!518681 (and (bvsge (index!19810 lt!237480) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237480) (size!16302 lt!237360)))))

(declare-fun res!317534 () Bool)

(assert (=> b!518681 (= res!317534 (= (select (arr!15938 lt!237360) (index!19810 lt!237480)) lt!237361))))

(declare-fun e!302635 () Bool)

(assert (=> b!518681 (=> res!317534 e!302635)))

(declare-fun e!302634 () Bool)

(assert (=> b!518681 (= e!302634 e!302635)))

(declare-fun b!518682 () Bool)

(assert (=> b!518682 (and (bvsge (index!19810 lt!237480) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237480) (size!16302 lt!237360)))))

(declare-fun res!317535 () Bool)

(assert (=> b!518682 (= res!317535 (= (select (arr!15938 lt!237360) (index!19810 lt!237480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518682 (=> res!317535 e!302635)))

(declare-fun b!518683 () Bool)

(assert (=> b!518683 (= e!302636 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237363 #b00000000000000000000000000000000 mask!3524) lt!237361 lt!237360 mask!3524))))

(declare-fun b!518684 () Bool)

(assert (=> b!518684 (= e!302638 e!302634)))

(declare-fun res!317536 () Bool)

(assert (=> b!518684 (= res!317536 (and (is-Intermediate!4405 lt!237480) (not (undefined!5217 lt!237480)) (bvslt (x!48770 lt!237480) #b01111111111111111111111111111110) (bvsge (x!48770 lt!237480) #b00000000000000000000000000000000) (bvsge (x!48770 lt!237480) #b00000000000000000000000000000000)))))

(assert (=> b!518684 (=> (not res!317536) (not e!302634))))

(declare-fun b!518685 () Bool)

(assert (=> b!518685 (and (bvsge (index!19810 lt!237480) #b00000000000000000000000000000000) (bvslt (index!19810 lt!237480) (size!16302 lt!237360)))))

(assert (=> b!518685 (= e!302635 (= (select (arr!15938 lt!237360) (index!19810 lt!237480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518686 () Bool)

(assert (=> b!518686 (= e!302637 e!302636)))

(declare-fun c!60868 () Bool)

(assert (=> b!518686 (= c!60868 (or (= lt!237479 lt!237361) (= (bvadd lt!237479 lt!237479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518687 () Bool)

(assert (=> b!518687 (= e!302637 (Intermediate!4405 true lt!237363 #b00000000000000000000000000000000))))

(declare-fun b!518688 () Bool)

(assert (=> b!518688 (= e!302638 (bvsge (x!48770 lt!237480) #b01111111111111111111111111111110))))

(assert (= (and d!79927 c!60870) b!518687))

(assert (= (and d!79927 (not c!60870)) b!518686))

(assert (= (and b!518686 c!60868) b!518680))

(assert (= (and b!518686 (not c!60868)) b!518683))

(assert (= (and d!79927 c!60869) b!518688))

(assert (= (and d!79927 (not c!60869)) b!518684))

(assert (= (and b!518684 res!317536) b!518681))

(assert (= (and b!518681 (not res!317534)) b!518682))

(assert (= (and b!518682 (not res!317535)) b!518685))

(declare-fun m!500007 () Bool)

(assert (=> b!518682 m!500007))

(assert (=> b!518685 m!500007))

(assert (=> b!518683 m!499935))

(assert (=> b!518683 m!499935))

(declare-fun m!500009 () Bool)

(assert (=> b!518683 m!500009))

(assert (=> b!518681 m!500007))

(declare-fun m!500011 () Bool)

(assert (=> d!79927 m!500011))

(assert (=> d!79927 m!499845))

(assert (=> b!518431 d!79927))

(declare-fun d!79931 () Bool)

(declare-fun lt!237497 () SeekEntryResult!4405)

(assert (=> d!79931 (and (or (is-Undefined!4405 lt!237497) (not (is-Found!4405 lt!237497)) (and (bvsge (index!19809 lt!237497) #b00000000000000000000000000000000) (bvslt (index!19809 lt!237497) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237497) (is-Found!4405 lt!237497) (not (is-MissingZero!4405 lt!237497)) (and (bvsge (index!19808 lt!237497) #b00000000000000000000000000000000) (bvslt (index!19808 lt!237497) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237497) (is-Found!4405 lt!237497) (is-MissingZero!4405 lt!237497) (not (is-MissingVacant!4405 lt!237497)) (and (bvsge (index!19811 lt!237497) #b00000000000000000000000000000000) (bvslt (index!19811 lt!237497) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237497) (ite (is-Found!4405 lt!237497) (= (select (arr!15938 a!3235) (index!19809 lt!237497)) (select (arr!15938 a!3235) j!176)) (ite (is-MissingZero!4405 lt!237497) (= (select (arr!15938 a!3235) (index!19808 lt!237497)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4405 lt!237497) (= (select (arr!15938 a!3235) (index!19811 lt!237497)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302667 () SeekEntryResult!4405)

(assert (=> d!79931 (= lt!237497 e!302667)))

(declare-fun c!60886 () Bool)

(declare-fun lt!237498 () SeekEntryResult!4405)

(assert (=> d!79931 (= c!60886 (and (is-Intermediate!4405 lt!237498) (undefined!5217 lt!237498)))))

(assert (=> d!79931 (= lt!237498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79931 (validMask!0 mask!3524)))

(assert (=> d!79931 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) lt!237497)))

(declare-fun b!518729 () Bool)

(declare-fun e!302666 () SeekEntryResult!4405)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33149 (_ BitVec 32)) SeekEntryResult!4405)

(assert (=> b!518729 (= e!302666 (seekKeyOrZeroReturnVacant!0 (x!48770 lt!237498) (index!19810 lt!237498) (index!19810 lt!237498) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518730 () Bool)

(assert (=> b!518730 (= e!302667 Undefined!4405)))

(declare-fun b!518731 () Bool)

(declare-fun c!60884 () Bool)

(declare-fun lt!237499 () (_ BitVec 64))

(assert (=> b!518731 (= c!60884 (= lt!237499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302665 () SeekEntryResult!4405)

(assert (=> b!518731 (= e!302665 e!302666)))

(declare-fun b!518732 () Bool)

(assert (=> b!518732 (= e!302666 (MissingZero!4405 (index!19810 lt!237498)))))

(declare-fun b!518733 () Bool)

(assert (=> b!518733 (= e!302665 (Found!4405 (index!19810 lt!237498)))))

(declare-fun b!518734 () Bool)

(assert (=> b!518734 (= e!302667 e!302665)))

(assert (=> b!518734 (= lt!237499 (select (arr!15938 a!3235) (index!19810 lt!237498)))))

(declare-fun c!60885 () Bool)

(assert (=> b!518734 (= c!60885 (= lt!237499 (select (arr!15938 a!3235) j!176)))))

(assert (= (and d!79931 c!60886) b!518730))

(assert (= (and d!79931 (not c!60886)) b!518734))

(assert (= (and b!518734 c!60885) b!518733))

(assert (= (and b!518734 (not c!60885)) b!518731))

(assert (= (and b!518731 c!60884) b!518732))

(assert (= (and b!518731 (not c!60884)) b!518729))

(declare-fun m!500031 () Bool)

(assert (=> d!79931 m!500031))

(assert (=> d!79931 m!499845))

(assert (=> d!79931 m!499833))

(assert (=> d!79931 m!499817))

(declare-fun m!500033 () Bool)

(assert (=> d!79931 m!500033))

(declare-fun m!500035 () Bool)

(assert (=> d!79931 m!500035))

(declare-fun m!500037 () Bool)

(assert (=> d!79931 m!500037))

(assert (=> d!79931 m!499817))

(assert (=> d!79931 m!499833))

(assert (=> b!518729 m!499817))

(declare-fun m!500039 () Bool)

(assert (=> b!518729 m!500039))

(declare-fun m!500041 () Bool)

(assert (=> b!518734 m!500041))

(assert (=> b!518433 d!79931))

(declare-fun d!79943 () Bool)

(assert (=> d!79943 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47008 d!79943))

(declare-fun d!79953 () Bool)

(assert (=> d!79953 (= (array_inv!11734 a!3235) (bvsge (size!16302 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47008 d!79953))

(declare-fun bm!31718 () Bool)

(declare-fun call!31721 () Bool)

(assert (=> bm!31718 (= call!31721 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518748 () Bool)

(declare-fun e!302678 () Bool)

(declare-fun e!302679 () Bool)

(assert (=> b!518748 (= e!302678 e!302679)))

(declare-fun c!60890 () Bool)

(assert (=> b!518748 (= c!60890 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518749 () Bool)

(assert (=> b!518749 (= e!302679 call!31721)))

(declare-fun b!518750 () Bool)

(declare-fun e!302677 () Bool)

(assert (=> b!518750 (= e!302677 call!31721)))

(declare-fun b!518747 () Bool)

(assert (=> b!518747 (= e!302679 e!302677)))

(declare-fun lt!237504 () (_ BitVec 64))

(assert (=> b!518747 (= lt!237504 (select (arr!15938 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237505 () Unit!16072)

(assert (=> b!518747 (= lt!237505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237504 #b00000000000000000000000000000000))))

(assert (=> b!518747 (arrayContainsKey!0 a!3235 lt!237504 #b00000000000000000000000000000000)))

(declare-fun lt!237503 () Unit!16072)

(assert (=> b!518747 (= lt!237503 lt!237505)))

(declare-fun res!317557 () Bool)

(assert (=> b!518747 (= res!317557 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4405 #b00000000000000000000000000000000)))))

(assert (=> b!518747 (=> (not res!317557) (not e!302677))))

(declare-fun d!79955 () Bool)

(declare-fun res!317558 () Bool)

(assert (=> d!79955 (=> res!317558 e!302678)))

(assert (=> d!79955 (= res!317558 (bvsge #b00000000000000000000000000000000 (size!16302 a!3235)))))

(assert (=> d!79955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302678)))

(assert (= (and d!79955 (not res!317558)) b!518748))

(assert (= (and b!518748 c!60890) b!518747))

(assert (= (and b!518748 (not c!60890)) b!518749))

(assert (= (and b!518747 res!317557) b!518750))

(assert (= (or b!518750 b!518749) bm!31718))

(declare-fun m!500057 () Bool)

(assert (=> bm!31718 m!500057))

(assert (=> b!518748 m!499881))

(assert (=> b!518748 m!499881))

(declare-fun m!500059 () Bool)

(assert (=> b!518748 m!500059))

(assert (=> b!518747 m!499881))

(declare-fun m!500061 () Bool)

(assert (=> b!518747 m!500061))

(declare-fun m!500063 () Bool)

(assert (=> b!518747 m!500063))

(assert (=> b!518747 m!499881))

(declare-fun m!500065 () Bool)

(assert (=> b!518747 m!500065))

(assert (=> b!518432 d!79955))

(declare-fun d!79957 () Bool)

(declare-fun lt!237506 () SeekEntryResult!4405)

(assert (=> d!79957 (and (or (is-Undefined!4405 lt!237506) (not (is-Found!4405 lt!237506)) (and (bvsge (index!19809 lt!237506) #b00000000000000000000000000000000) (bvslt (index!19809 lt!237506) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237506) (is-Found!4405 lt!237506) (not (is-MissingZero!4405 lt!237506)) (and (bvsge (index!19808 lt!237506) #b00000000000000000000000000000000) (bvslt (index!19808 lt!237506) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237506) (is-Found!4405 lt!237506) (is-MissingZero!4405 lt!237506) (not (is-MissingVacant!4405 lt!237506)) (and (bvsge (index!19811 lt!237506) #b00000000000000000000000000000000) (bvslt (index!19811 lt!237506) (size!16302 a!3235)))) (or (is-Undefined!4405 lt!237506) (ite (is-Found!4405 lt!237506) (= (select (arr!15938 a!3235) (index!19809 lt!237506)) k!2280) (ite (is-MissingZero!4405 lt!237506) (= (select (arr!15938 a!3235) (index!19808 lt!237506)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4405 lt!237506) (= (select (arr!15938 a!3235) (index!19811 lt!237506)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302682 () SeekEntryResult!4405)

(assert (=> d!79957 (= lt!237506 e!302682)))

(declare-fun c!60893 () Bool)

(declare-fun lt!237507 () SeekEntryResult!4405)

(assert (=> d!79957 (= c!60893 (and (is-Intermediate!4405 lt!237507) (undefined!5217 lt!237507)))))

(assert (=> d!79957 (= lt!237507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79957 (validMask!0 mask!3524)))

(assert (=> d!79957 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237506)))

(declare-fun b!518751 () Bool)

(declare-fun e!302681 () SeekEntryResult!4405)

(assert (=> b!518751 (= e!302681 (seekKeyOrZeroReturnVacant!0 (x!48770 lt!237507) (index!19810 lt!237507) (index!19810 lt!237507) k!2280 a!3235 mask!3524))))

(declare-fun b!518752 () Bool)

(assert (=> b!518752 (= e!302682 Undefined!4405)))

(declare-fun b!518753 () Bool)

(declare-fun c!60891 () Bool)

(declare-fun lt!237508 () (_ BitVec 64))

(assert (=> b!518753 (= c!60891 (= lt!237508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302680 () SeekEntryResult!4405)

(assert (=> b!518753 (= e!302680 e!302681)))

(declare-fun b!518754 () Bool)

(assert (=> b!518754 (= e!302681 (MissingZero!4405 (index!19810 lt!237507)))))

(declare-fun b!518755 () Bool)

(assert (=> b!518755 (= e!302680 (Found!4405 (index!19810 lt!237507)))))

(declare-fun b!518756 () Bool)

(assert (=> b!518756 (= e!302682 e!302680)))

(assert (=> b!518756 (= lt!237508 (select (arr!15938 a!3235) (index!19810 lt!237507)))))

(declare-fun c!60892 () Bool)

(assert (=> b!518756 (= c!60892 (= lt!237508 k!2280))))

(assert (= (and d!79957 c!60893) b!518752))

(assert (= (and d!79957 (not c!60893)) b!518756))

(assert (= (and b!518756 c!60892) b!518755))

(assert (= (and b!518756 (not c!60892)) b!518753))

(assert (= (and b!518753 c!60891) b!518754))

(assert (= (and b!518753 (not c!60891)) b!518751))

(declare-fun m!500067 () Bool)

(assert (=> d!79957 m!500067))

(assert (=> d!79957 m!499845))

(declare-fun m!500069 () Bool)

(assert (=> d!79957 m!500069))

(declare-fun m!500071 () Bool)

(assert (=> d!79957 m!500071))

(declare-fun m!500073 () Bool)

(assert (=> d!79957 m!500073))

(declare-fun m!500075 () Bool)

(assert (=> d!79957 m!500075))

(assert (=> d!79957 m!500069))

(declare-fun m!500077 () Bool)

(assert (=> b!518751 m!500077))

(declare-fun m!500079 () Bool)

(assert (=> b!518756 m!500079))

(assert (=> b!518434 d!79957))

(declare-fun b!518767 () Bool)

(declare-fun e!302692 () Bool)

(declare-fun contains!2751 (List!10096 (_ BitVec 64)) Bool)

(assert (=> b!518767 (= e!302692 (contains!2751 Nil!10093 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79959 () Bool)

(declare-fun res!317567 () Bool)

(declare-fun e!302691 () Bool)

(assert (=> d!79959 (=> res!317567 e!302691)))

(assert (=> d!79959 (= res!317567 (bvsge #b00000000000000000000000000000000 (size!16302 a!3235)))))

(assert (=> d!79959 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10093) e!302691)))

(declare-fun b!518768 () Bool)

(declare-fun e!302693 () Bool)

(declare-fun call!31724 () Bool)

(assert (=> b!518768 (= e!302693 call!31724)))

(declare-fun b!518769 () Bool)

(assert (=> b!518769 (= e!302693 call!31724)))

(declare-fun bm!31721 () Bool)

(declare-fun c!60896 () Bool)

(assert (=> bm!31721 (= call!31724 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60896 (Cons!10092 (select (arr!15938 a!3235) #b00000000000000000000000000000000) Nil!10093) Nil!10093)))))

(declare-fun b!518770 () Bool)

(declare-fun e!302694 () Bool)

(assert (=> b!518770 (= e!302691 e!302694)))

(declare-fun res!317565 () Bool)

(assert (=> b!518770 (=> (not res!317565) (not e!302694))))

(assert (=> b!518770 (= res!317565 (not e!302692))))

(declare-fun res!317566 () Bool)

(assert (=> b!518770 (=> (not res!317566) (not e!302692))))

(assert (=> b!518770 (= res!317566 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518771 () Bool)

(assert (=> b!518771 (= e!302694 e!302693)))

(assert (=> b!518771 (= c!60896 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79959 (not res!317567)) b!518770))

(assert (= (and b!518770 res!317566) b!518767))

(assert (= (and b!518770 res!317565) b!518771))

(assert (= (and b!518771 c!60896) b!518768))

(assert (= (and b!518771 (not c!60896)) b!518769))

(assert (= (or b!518768 b!518769) bm!31721))

(assert (=> b!518767 m!499881))

(assert (=> b!518767 m!499881))

(declare-fun m!500081 () Bool)

(assert (=> b!518767 m!500081))

(assert (=> bm!31721 m!499881))

(declare-fun m!500083 () Bool)

(assert (=> bm!31721 m!500083))

(assert (=> b!518770 m!499881))

(assert (=> b!518770 m!499881))

(assert (=> b!518770 m!500059))

(assert (=> b!518771 m!499881))

(assert (=> b!518771 m!499881))

(assert (=> b!518771 m!500059))

(assert (=> b!518439 d!79959))

(declare-fun d!79961 () Bool)

(assert (=> d!79961 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518444 d!79961))

(push 1)

(assert (not b!518771))

(assert (not bm!31709))

(assert (not b!518556))

(assert (not b!518670))

