; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123172 () Bool)

(assert start!123172)

(declare-fun b!1428360 () Bool)

(declare-fun res!963197 () Bool)

(declare-fun e!806656 () Bool)

(assert (=> b!1428360 (=> (not res!963197) (not e!806656))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97384 0))(
  ( (array!97385 (arr!47005 (Array (_ BitVec 32) (_ BitVec 64))) (size!47555 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97384)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428360 (= res!963197 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47555 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47555 a!2831))))))

(declare-fun b!1428361 () Bool)

(declare-fun res!963191 () Bool)

(declare-fun e!806657 () Bool)

(assert (=> b!1428361 (=> (not res!963191) (not e!806657))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428361 (= res!963191 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!963201 () Bool)

(assert (=> start!123172 (=> (not res!963201) (not e!806656))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123172 (= res!963201 (validMask!0 mask!2608))))

(assert (=> start!123172 e!806656))

(assert (=> start!123172 true))

(declare-fun array_inv!36033 (array!97384) Bool)

(assert (=> start!123172 (array_inv!36033 a!2831)))

(declare-fun b!1428362 () Bool)

(declare-fun res!963196 () Bool)

(assert (=> b!1428362 (=> (not res!963196) (not e!806656))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428362 (= res!963196 (validKeyInArray!0 (select (arr!47005 a!2831) j!81)))))

(declare-fun b!1428363 () Bool)

(declare-fun res!963193 () Bool)

(assert (=> b!1428363 (=> (not res!963193) (not e!806656))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428363 (= res!963193 (validKeyInArray!0 (select (arr!47005 a!2831) i!982)))))

(declare-fun e!806655 () Bool)

(declare-fun b!1428364 () Bool)

(declare-datatypes ((SeekEntryResult!11284 0))(
  ( (MissingZero!11284 (index!47528 (_ BitVec 32))) (Found!11284 (index!47529 (_ BitVec 32))) (Intermediate!11284 (undefined!12096 Bool) (index!47530 (_ BitVec 32)) (x!129160 (_ BitVec 32))) (Undefined!11284) (MissingVacant!11284 (index!47531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97384 (_ BitVec 32)) SeekEntryResult!11284)

(assert (=> b!1428364 (= e!806655 (= (seekEntryOrOpen!0 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) (Found!11284 j!81)))))

(declare-fun b!1428365 () Bool)

(assert (=> b!1428365 (= e!806657 (not (or (= (select (arr!47005 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47005 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!47005 a!2831) index!585) (select (arr!47005 a!2831) j!81))))))))

(assert (=> b!1428365 e!806655))

(declare-fun res!963192 () Bool)

(assert (=> b!1428365 (=> (not res!963192) (not e!806655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97384 (_ BitVec 32)) Bool)

(assert (=> b!1428365 (= res!963192 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48314 0))(
  ( (Unit!48315) )
))
(declare-fun lt!628939 () Unit!48314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48314)

(assert (=> b!1428365 (= lt!628939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428366 () Bool)

(declare-fun e!806654 () Bool)

(assert (=> b!1428366 (= e!806654 e!806657)))

(declare-fun res!963199 () Bool)

(assert (=> b!1428366 (=> (not res!963199) (not e!806657))))

(declare-fun lt!628937 () (_ BitVec 64))

(declare-fun lt!628940 () array!97384)

(declare-fun lt!628938 () SeekEntryResult!11284)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97384 (_ BitVec 32)) SeekEntryResult!11284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428366 (= res!963199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628937 mask!2608) lt!628937 lt!628940 mask!2608) lt!628938))))

(assert (=> b!1428366 (= lt!628938 (Intermediate!11284 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428366 (= lt!628937 (select (store (arr!47005 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428366 (= lt!628940 (array!97385 (store (arr!47005 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47555 a!2831)))))

(declare-fun b!1428367 () Bool)

(declare-fun res!963190 () Bool)

(assert (=> b!1428367 (=> (not res!963190) (not e!806656))))

(assert (=> b!1428367 (= res!963190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428368 () Bool)

(declare-fun res!963200 () Bool)

(assert (=> b!1428368 (=> (not res!963200) (not e!806656))))

(declare-datatypes ((List!33515 0))(
  ( (Nil!33512) (Cons!33511 (h!34822 (_ BitVec 64)) (t!48209 List!33515)) )
))
(declare-fun arrayNoDuplicates!0 (array!97384 (_ BitVec 32) List!33515) Bool)

(assert (=> b!1428368 (= res!963200 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33512))))

(declare-fun b!1428369 () Bool)

(declare-fun res!963194 () Bool)

(assert (=> b!1428369 (=> (not res!963194) (not e!806657))))

(declare-fun lt!628941 () SeekEntryResult!11284)

(assert (=> b!1428369 (= res!963194 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!628941))))

(declare-fun b!1428370 () Bool)

(declare-fun res!963198 () Bool)

(assert (=> b!1428370 (=> (not res!963198) (not e!806657))))

(assert (=> b!1428370 (= res!963198 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628937 lt!628940 mask!2608) lt!628938))))

(declare-fun b!1428371 () Bool)

(assert (=> b!1428371 (= e!806656 e!806654)))

(declare-fun res!963195 () Bool)

(assert (=> b!1428371 (=> (not res!963195) (not e!806654))))

(assert (=> b!1428371 (= res!963195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!628941))))

(assert (=> b!1428371 (= lt!628941 (Intermediate!11284 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428372 () Bool)

(declare-fun res!963202 () Bool)

(assert (=> b!1428372 (=> (not res!963202) (not e!806656))))

(assert (=> b!1428372 (= res!963202 (and (= (size!47555 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47555 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47555 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123172 res!963201) b!1428372))

(assert (= (and b!1428372 res!963202) b!1428363))

(assert (= (and b!1428363 res!963193) b!1428362))

(assert (= (and b!1428362 res!963196) b!1428367))

(assert (= (and b!1428367 res!963190) b!1428368))

(assert (= (and b!1428368 res!963200) b!1428360))

(assert (= (and b!1428360 res!963197) b!1428371))

(assert (= (and b!1428371 res!963195) b!1428366))

(assert (= (and b!1428366 res!963199) b!1428369))

(assert (= (and b!1428369 res!963194) b!1428370))

(assert (= (and b!1428370 res!963198) b!1428361))

(assert (= (and b!1428361 res!963191) b!1428365))

(assert (= (and b!1428365 res!963192) b!1428364))

(declare-fun m!1318601 () Bool)

(assert (=> b!1428365 m!1318601))

(declare-fun m!1318603 () Bool)

(assert (=> b!1428365 m!1318603))

(declare-fun m!1318605 () Bool)

(assert (=> b!1428365 m!1318605))

(declare-fun m!1318607 () Bool)

(assert (=> b!1428365 m!1318607))

(declare-fun m!1318609 () Bool)

(assert (=> b!1428363 m!1318609))

(assert (=> b!1428363 m!1318609))

(declare-fun m!1318611 () Bool)

(assert (=> b!1428363 m!1318611))

(declare-fun m!1318613 () Bool)

(assert (=> b!1428367 m!1318613))

(declare-fun m!1318615 () Bool)

(assert (=> b!1428368 m!1318615))

(declare-fun m!1318617 () Bool)

(assert (=> start!123172 m!1318617))

(declare-fun m!1318619 () Bool)

(assert (=> start!123172 m!1318619))

(assert (=> b!1428362 m!1318603))

(assert (=> b!1428362 m!1318603))

(declare-fun m!1318621 () Bool)

(assert (=> b!1428362 m!1318621))

(assert (=> b!1428364 m!1318603))

(assert (=> b!1428364 m!1318603))

(declare-fun m!1318623 () Bool)

(assert (=> b!1428364 m!1318623))

(declare-fun m!1318625 () Bool)

(assert (=> b!1428366 m!1318625))

(assert (=> b!1428366 m!1318625))

(declare-fun m!1318627 () Bool)

(assert (=> b!1428366 m!1318627))

(declare-fun m!1318629 () Bool)

(assert (=> b!1428366 m!1318629))

(declare-fun m!1318631 () Bool)

(assert (=> b!1428366 m!1318631))

(assert (=> b!1428371 m!1318603))

(assert (=> b!1428371 m!1318603))

(declare-fun m!1318633 () Bool)

(assert (=> b!1428371 m!1318633))

(assert (=> b!1428371 m!1318633))

(assert (=> b!1428371 m!1318603))

(declare-fun m!1318635 () Bool)

(assert (=> b!1428371 m!1318635))

(assert (=> b!1428369 m!1318603))

(assert (=> b!1428369 m!1318603))

(declare-fun m!1318637 () Bool)

(assert (=> b!1428369 m!1318637))

(declare-fun m!1318639 () Bool)

(assert (=> b!1428370 m!1318639))

(push 1)

(assert (not b!1428369))

(assert (not start!123172))

(assert (not b!1428363))

(assert (not b!1428366))

(assert (not b!1428365))

(assert (not b!1428364))

(assert (not b!1428371))

(assert (not b!1428367))

(assert (not b!1428362))

(assert (not b!1428368))

(assert (not b!1428370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1428451 () Bool)

(declare-fun e!806710 () Bool)

(declare-fun lt!628972 () SeekEntryResult!11284)

(assert (=> b!1428451 (= e!806710 (bvsge (x!129160 lt!628972) #b01111111111111111111111111111110))))

(declare-fun b!1428452 () Bool)

(declare-fun e!806707 () Bool)

(assert (=> b!1428452 (= e!806710 e!806707)))

(declare-fun res!963235 () Bool)

(assert (=> b!1428452 (= res!963235 (and (is-Intermediate!11284 lt!628972) (not (undefined!12096 lt!628972)) (bvslt (x!129160 lt!628972) #b01111111111111111111111111111110) (bvsge (x!129160 lt!628972) #b00000000000000000000000000000000) (bvsge (x!129160 lt!628972) x!605)))))

(assert (=> b!1428452 (=> (not res!963235) (not e!806707))))

(declare-fun b!1428454 () Bool)

(declare-fun e!806708 () SeekEntryResult!11284)

(assert (=> b!1428454 (= e!806708 (Intermediate!11284 false index!585 x!605))))

(declare-fun b!1428455 () Bool)

(assert (=> b!1428455 (and (bvsge (index!47530 lt!628972) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628972) (size!47555 a!2831)))))

(declare-fun e!806709 () Bool)

(assert (=> b!1428455 (= e!806709 (= (select (arr!47005 a!2831) (index!47530 lt!628972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428456 () Bool)

(assert (=> b!1428456 (and (bvsge (index!47530 lt!628972) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628972) (size!47555 a!2831)))))

(declare-fun res!963234 () Bool)

(assert (=> b!1428456 (= res!963234 (= (select (arr!47005 a!2831) (index!47530 lt!628972)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428456 (=> res!963234 e!806709)))

(declare-fun b!1428457 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428457 (= e!806708 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428458 () Bool)

(declare-fun e!806706 () SeekEntryResult!11284)

(assert (=> b!1428458 (= e!806706 e!806708)))

(declare-fun c!132100 () Bool)

(declare-fun lt!628973 () (_ BitVec 64))

(assert (=> b!1428458 (= c!132100 (or (= lt!628973 (select (arr!47005 a!2831) j!81)) (= (bvadd lt!628973 lt!628973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428459 () Bool)

(assert (=> b!1428459 (= e!806706 (Intermediate!11284 true index!585 x!605))))

(declare-fun b!1428453 () Bool)

(assert (=> b!1428453 (and (bvsge (index!47530 lt!628972) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628972) (size!47555 a!2831)))))

(declare-fun res!963233 () Bool)

(assert (=> b!1428453 (= res!963233 (= (select (arr!47005 a!2831) (index!47530 lt!628972)) (select (arr!47005 a!2831) j!81)))))

(assert (=> b!1428453 (=> res!963233 e!806709)))

(assert (=> b!1428453 (= e!806707 e!806709)))

(declare-fun d!153467 () Bool)

(assert (=> d!153467 e!806710))

(declare-fun c!132102 () Bool)

(assert (=> d!153467 (= c!132102 (and (is-Intermediate!11284 lt!628972) (undefined!12096 lt!628972)))))

(assert (=> d!153467 (= lt!628972 e!806706)))

(declare-fun c!132101 () Bool)

(assert (=> d!153467 (= c!132101 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153467 (= lt!628973 (select (arr!47005 a!2831) index!585))))

(assert (=> d!153467 (validMask!0 mask!2608)))

(assert (=> d!153467 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!628972)))

(assert (= (and d!153467 c!132101) b!1428459))

(assert (= (and d!153467 (not c!132101)) b!1428458))

(assert (= (and b!1428458 c!132100) b!1428454))

(assert (= (and b!1428458 (not c!132100)) b!1428457))

(assert (= (and d!153467 c!132102) b!1428451))

(assert (= (and d!153467 (not c!132102)) b!1428452))

(assert (= (and b!1428452 res!963235) b!1428453))

(assert (= (and b!1428453 (not res!963233)) b!1428456))

(assert (= (and b!1428456 (not res!963234)) b!1428455))

(declare-fun m!1318671 () Bool)

(assert (=> b!1428453 m!1318671))

(declare-fun m!1318673 () Bool)

(assert (=> b!1428457 m!1318673))

(assert (=> b!1428457 m!1318673))

(assert (=> b!1428457 m!1318603))

(declare-fun m!1318675 () Bool)

(assert (=> b!1428457 m!1318675))

(assert (=> b!1428455 m!1318671))

(assert (=> d!153467 m!1318601))

(assert (=> d!153467 m!1318617))

(assert (=> b!1428456 m!1318671))

(assert (=> b!1428369 d!153467))

(declare-fun b!1428460 () Bool)

(declare-fun e!806715 () Bool)

(declare-fun lt!628974 () SeekEntryResult!11284)

(assert (=> b!1428460 (= e!806715 (bvsge (x!129160 lt!628974) #b01111111111111111111111111111110))))

(declare-fun b!1428461 () Bool)

(declare-fun e!806712 () Bool)

(assert (=> b!1428461 (= e!806715 e!806712)))

(declare-fun res!963238 () Bool)

(assert (=> b!1428461 (= res!963238 (and (is-Intermediate!11284 lt!628974) (not (undefined!12096 lt!628974)) (bvslt (x!129160 lt!628974) #b01111111111111111111111111111110) (bvsge (x!129160 lt!628974) #b00000000000000000000000000000000) (bvsge (x!129160 lt!628974) x!605)))))

(assert (=> b!1428461 (=> (not res!963238) (not e!806712))))

(declare-fun b!1428463 () Bool)

(declare-fun e!806713 () SeekEntryResult!11284)

(assert (=> b!1428463 (= e!806713 (Intermediate!11284 false index!585 x!605))))

(declare-fun b!1428464 () Bool)

(assert (=> b!1428464 (and (bvsge (index!47530 lt!628974) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628974) (size!47555 lt!628940)))))

(declare-fun e!806714 () Bool)

(assert (=> b!1428464 (= e!806714 (= (select (arr!47005 lt!628940) (index!47530 lt!628974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428465 () Bool)

(assert (=> b!1428465 (and (bvsge (index!47530 lt!628974) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628974) (size!47555 lt!628940)))))

(declare-fun res!963237 () Bool)

(assert (=> b!1428465 (= res!963237 (= (select (arr!47005 lt!628940) (index!47530 lt!628974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428465 (=> res!963237 e!806714)))

(declare-fun b!1428466 () Bool)

(assert (=> b!1428466 (= e!806713 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628937 lt!628940 mask!2608))))

(declare-fun b!1428467 () Bool)

(declare-fun e!806711 () SeekEntryResult!11284)

(assert (=> b!1428467 (= e!806711 e!806713)))

(declare-fun c!132103 () Bool)

(declare-fun lt!628975 () (_ BitVec 64))

(assert (=> b!1428467 (= c!132103 (or (= lt!628975 lt!628937) (= (bvadd lt!628975 lt!628975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428468 () Bool)

(assert (=> b!1428468 (= e!806711 (Intermediate!11284 true index!585 x!605))))

(declare-fun b!1428462 () Bool)

(assert (=> b!1428462 (and (bvsge (index!47530 lt!628974) #b00000000000000000000000000000000) (bvslt (index!47530 lt!628974) (size!47555 lt!628940)))))

(declare-fun res!963236 () Bool)

(assert (=> b!1428462 (= res!963236 (= (select (arr!47005 lt!628940) (index!47530 lt!628974)) lt!628937))))

(assert (=> b!1428462 (=> res!963236 e!806714)))

(assert (=> b!1428462 (= e!806712 e!806714)))

(declare-fun d!153485 () Bool)

(assert (=> d!153485 e!806715))

(declare-fun c!132105 () Bool)

(assert (=> d!153485 (= c!132105 (and (is-Intermediate!11284 lt!628974) (undefined!12096 lt!628974)))))

(assert (=> d!153485 (= lt!628974 e!806711)))

(declare-fun c!132104 () Bool)

(assert (=> d!153485 (= c!132104 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153485 (= lt!628975 (select (arr!47005 lt!628940) index!585))))

(assert (=> d!153485 (validMask!0 mask!2608)))

(assert (=> d!153485 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628937 lt!628940 mask!2608) lt!628974)))

(assert (= (and d!153485 c!132104) b!1428468))

(assert (= (and d!153485 (not c!132104)) b!1428467))

(assert (= (and b!1428467 c!132103) b!1428463))

(assert (= (and b!1428467 (not c!132103)) b!1428466))

(assert (= (and d!153485 c!132105) b!1428460))

(assert (= (and d!153485 (not c!132105)) b!1428461))

(assert (= (and b!1428461 res!963238) b!1428462))

(assert (= (and b!1428462 (not res!963236)) b!1428465))

(assert (= (and b!1428465 (not res!963237)) b!1428464))

(declare-fun m!1318677 () Bool)

(assert (=> b!1428462 m!1318677))

(assert (=> b!1428466 m!1318673))

(assert (=> b!1428466 m!1318673))

(declare-fun m!1318679 () Bool)

(assert (=> b!1428466 m!1318679))

(assert (=> b!1428464 m!1318677))

(declare-fun m!1318681 () Bool)

(assert (=> d!153485 m!1318681))

(assert (=> d!153485 m!1318617))

(assert (=> b!1428465 m!1318677))

(assert (=> b!1428370 d!153485))

(declare-fun bm!67393 () Bool)

(declare-fun call!67396 () Bool)

(declare-fun c!132117 () Bool)

(assert (=> bm!67393 (= call!67396 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132117 (Cons!33511 (select (arr!47005 a!2831) #b00000000000000000000000000000000) Nil!33512) Nil!33512)))))

(declare-fun b!1428505 () Bool)

(declare-fun e!806741 () Bool)

(assert (=> b!1428505 (= e!806741 call!67396)))

(declare-fun d!153487 () Bool)

(declare-fun res!963253 () Bool)

(declare-fun e!806742 () Bool)

(assert (=> d!153487 (=> res!963253 e!806742)))

(assert (=> d!153487 (= res!963253 (bvsge #b00000000000000000000000000000000 (size!47555 a!2831)))))

(assert (=> d!153487 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33512) e!806742)))

(declare-fun b!1428506 () Bool)

(declare-fun e!806743 () Bool)

(assert (=> b!1428506 (= e!806742 e!806743)))

(declare-fun res!963254 () Bool)

(assert (=> b!1428506 (=> (not res!963254) (not e!806743))))

(declare-fun e!806744 () Bool)

(assert (=> b!1428506 (= res!963254 (not e!806744))))

(declare-fun res!963255 () Bool)

(assert (=> b!1428506 (=> (not res!963255) (not e!806744))))

(assert (=> b!1428506 (= res!963255 (validKeyInArray!0 (select (arr!47005 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428507 () Bool)

(assert (=> b!1428507 (= e!806741 call!67396)))

(declare-fun b!1428508 () Bool)

(declare-fun contains!9857 (List!33515 (_ BitVec 64)) Bool)

(assert (=> b!1428508 (= e!806744 (contains!9857 Nil!33512 (select (arr!47005 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1428509 () Bool)

(assert (=> b!1428509 (= e!806743 e!806741)))

(assert (=> b!1428509 (= c!132117 (validKeyInArray!0 (select (arr!47005 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153487 (not res!963253)) b!1428506))

(assert (= (and b!1428506 res!963255) b!1428508))

(assert (= (and b!1428506 res!963254) b!1428509))

(assert (= (and b!1428509 c!132117) b!1428505))

(assert (= (and b!1428509 (not c!132117)) b!1428507))

(assert (= (or b!1428505 b!1428507) bm!67393))

(declare-fun m!1318697 () Bool)

(assert (=> bm!67393 m!1318697))

(declare-fun m!1318699 () Bool)

(assert (=> bm!67393 m!1318699))

(assert (=> b!1428506 m!1318697))

(assert (=> b!1428506 m!1318697))

(declare-fun m!1318701 () Bool)

(assert (=> b!1428506 m!1318701))

(assert (=> b!1428508 m!1318697))

(assert (=> b!1428508 m!1318697))

(declare-fun m!1318703 () Bool)

(assert (=> b!1428508 m!1318703))

(assert (=> b!1428509 m!1318697))

(assert (=> b!1428509 m!1318697))

(assert (=> b!1428509 m!1318701))

(assert (=> b!1428368 d!153487))

(declare-fun b!1428539 () Bool)

(declare-fun e!806767 () Bool)

(declare-fun call!67402 () Bool)

(assert (=> b!1428539 (= e!806767 call!67402)))

(declare-fun b!1428540 () Bool)

(declare-fun e!806766 () Bool)

(assert (=> b!1428540 (= e!806766 call!67402)))

(declare-fun b!1428541 () Bool)

(assert (=> b!1428541 (= e!806767 e!806766)))

(declare-fun lt!628999 () (_ BitVec 64))

(assert (=> b!1428541 (= lt!628999 (select (arr!47005 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628997 () Unit!48314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97384 (_ BitVec 64) (_ BitVec 32)) Unit!48314)

(assert (=> b!1428541 (= lt!628997 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628999 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1428541 (arrayContainsKey!0 a!2831 lt!628999 #b00000000000000000000000000000000)))

(declare-fun lt!628998 () Unit!48314)

(assert (=> b!1428541 (= lt!628998 lt!628997)))

(declare-fun res!963270 () Bool)

(assert (=> b!1428541 (= res!963270 (= (seekEntryOrOpen!0 (select (arr!47005 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11284 #b00000000000000000000000000000000)))))

(assert (=> b!1428541 (=> (not res!963270) (not e!806766))))

(declare-fun bm!67399 () Bool)

(assert (=> bm!67399 (= call!67402 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153493 () Bool)

(declare-fun res!963269 () Bool)

(declare-fun e!806768 () Bool)

(assert (=> d!153493 (=> res!963269 e!806768)))

(assert (=> d!153493 (= res!963269 (bvsge #b00000000000000000000000000000000 (size!47555 a!2831)))))

(assert (=> d!153493 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806768)))

(declare-fun b!1428542 () Bool)

(assert (=> b!1428542 (= e!806768 e!806767)))

(declare-fun c!132126 () Bool)

(assert (=> b!1428542 (= c!132126 (validKeyInArray!0 (select (arr!47005 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153493 (not res!963269)) b!1428542))

(assert (= (and b!1428542 c!132126) b!1428541))

(assert (= (and b!1428542 (not c!132126)) b!1428539))

(assert (= (and b!1428541 res!963270) b!1428540))

(assert (= (or b!1428540 b!1428539) bm!67399))

(assert (=> b!1428541 m!1318697))

(declare-fun m!1318719 () Bool)

(assert (=> b!1428541 m!1318719))

(declare-fun m!1318721 () Bool)

(assert (=> b!1428541 m!1318721))

(assert (=> b!1428541 m!1318697))

(declare-fun m!1318723 () Bool)

(assert (=> b!1428541 m!1318723))

(declare-fun m!1318725 () Bool)

(assert (=> bm!67399 m!1318725))

(assert (=> b!1428542 m!1318697))

(assert (=> b!1428542 m!1318697))

(assert (=> b!1428542 m!1318701))

(assert (=> b!1428367 d!153493))

(declare-fun b!1428548 () Bool)

(declare-fun e!806774 () Bool)

(declare-fun call!67404 () Bool)

(assert (=> b!1428548 (= e!806774 call!67404)))

(declare-fun b!1428549 () Bool)

(declare-fun e!806773 () Bool)

(assert (=> b!1428549 (= e!806773 call!67404)))

(declare-fun b!1428550 () Bool)

(assert (=> b!1428550 (= e!806774 e!806773)))

(declare-fun lt!629002 () (_ BitVec 64))

(assert (=> b!1428550 (= lt!629002 (select (arr!47005 a!2831) j!81))))

(declare-fun lt!629000 () Unit!48314)

(assert (=> b!1428550 (= lt!629000 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629002 j!81))))

(assert (=> b!1428550 (arrayContainsKey!0 a!2831 lt!629002 #b00000000000000000000000000000000)))

(declare-fun lt!629001 () Unit!48314)

(assert (=> b!1428550 (= lt!629001 lt!629000)))

(declare-fun res!963275 () Bool)

(assert (=> b!1428550 (= res!963275 (= (seekEntryOrOpen!0 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) (Found!11284 j!81)))))

(assert (=> b!1428550 (=> (not res!963275) (not e!806773))))

(declare-fun bm!67401 () Bool)

(assert (=> bm!67401 (= call!67404 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153499 () Bool)

(declare-fun res!963274 () Bool)

(declare-fun e!806775 () Bool)

(assert (=> d!153499 (=> res!963274 e!806775)))

(assert (=> d!153499 (= res!963274 (bvsge j!81 (size!47555 a!2831)))))

(assert (=> d!153499 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!806775)))

(declare-fun b!1428551 () Bool)

(assert (=> b!1428551 (= e!806775 e!806774)))

(declare-fun c!132128 () Bool)

(assert (=> b!1428551 (= c!132128 (validKeyInArray!0 (select (arr!47005 a!2831) j!81)))))

(assert (= (and d!153499 (not res!963274)) b!1428551))

(assert (= (and b!1428551 c!132128) b!1428550))

(assert (= (and b!1428551 (not c!132128)) b!1428548))

(assert (= (and b!1428550 res!963275) b!1428549))

(assert (= (or b!1428549 b!1428548) bm!67401))

(assert (=> b!1428550 m!1318603))

(declare-fun m!1318729 () Bool)

(assert (=> b!1428550 m!1318729))

(declare-fun m!1318731 () Bool)

(assert (=> b!1428550 m!1318731))

(assert (=> b!1428550 m!1318603))

(assert (=> b!1428550 m!1318623))

(declare-fun m!1318735 () Bool)

(assert (=> bm!67401 m!1318735))

(assert (=> b!1428551 m!1318603))

(assert (=> b!1428551 m!1318603))

(assert (=> b!1428551 m!1318621))

(assert (=> b!1428365 d!153499))

(declare-fun d!153503 () Bool)

(assert (=> d!153503 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629008 () Unit!48314)

(declare-fun choose!38 (array!97384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48314)

(assert (=> d!153503 (= lt!629008 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153503 (validMask!0 mask!2608)))

(assert (=> d!153503 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629008)))

(declare-fun bs!41625 () Bool)

(assert (= bs!41625 d!153503))

(assert (=> bs!41625 m!1318605))

(declare-fun m!1318743 () Bool)

(assert (=> bs!41625 m!1318743))

(assert (=> bs!41625 m!1318617))

(assert (=> b!1428365 d!153503))

(declare-fun b!1428556 () Bool)

(declare-fun e!806783 () Bool)

(declare-fun lt!629011 () SeekEntryResult!11284)

(assert (=> b!1428556 (= e!806783 (bvsge (x!129160 lt!629011) #b01111111111111111111111111111110))))

(declare-fun b!1428557 () Bool)

(declare-fun e!806780 () Bool)

(assert (=> b!1428557 (= e!806783 e!806780)))

(declare-fun res!963280 () Bool)

(assert (=> b!1428557 (= res!963280 (and (is-Intermediate!11284 lt!629011) (not (undefined!12096 lt!629011)) (bvslt (x!129160 lt!629011) #b01111111111111111111111111111110) (bvsge (x!129160 lt!629011) #b00000000000000000000000000000000) (bvsge (x!129160 lt!629011) #b00000000000000000000000000000000)))))

(assert (=> b!1428557 (=> (not res!963280) (not e!806780))))

(declare-fun b!1428559 () Bool)

(declare-fun e!806781 () SeekEntryResult!11284)

(assert (=> b!1428559 (= e!806781 (Intermediate!11284 false (toIndex!0 lt!628937 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428560 () Bool)

(assert (=> b!1428560 (and (bvsge (index!47530 lt!629011) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629011) (size!47555 lt!628940)))))

(declare-fun e!806782 () Bool)

(assert (=> b!1428560 (= e!806782 (= (select (arr!47005 lt!628940) (index!47530 lt!629011)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428561 () Bool)

(assert (=> b!1428561 (and (bvsge (index!47530 lt!629011) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629011) (size!47555 lt!628940)))))

(declare-fun res!963279 () Bool)

(assert (=> b!1428561 (= res!963279 (= (select (arr!47005 lt!628940) (index!47530 lt!629011)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428561 (=> res!963279 e!806782)))

(declare-fun b!1428562 () Bool)

(assert (=> b!1428562 (= e!806781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628937 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628937 lt!628940 mask!2608))))

(declare-fun b!1428563 () Bool)

(declare-fun e!806779 () SeekEntryResult!11284)

(assert (=> b!1428563 (= e!806779 e!806781)))

(declare-fun c!132130 () Bool)

(declare-fun lt!629012 () (_ BitVec 64))

(assert (=> b!1428563 (= c!132130 (or (= lt!629012 lt!628937) (= (bvadd lt!629012 lt!629012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428564 () Bool)

(assert (=> b!1428564 (= e!806779 (Intermediate!11284 true (toIndex!0 lt!628937 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428558 () Bool)

(assert (=> b!1428558 (and (bvsge (index!47530 lt!629011) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629011) (size!47555 lt!628940)))))

(declare-fun res!963278 () Bool)

(assert (=> b!1428558 (= res!963278 (= (select (arr!47005 lt!628940) (index!47530 lt!629011)) lt!628937))))

(assert (=> b!1428558 (=> res!963278 e!806782)))

(assert (=> b!1428558 (= e!806780 e!806782)))

(declare-fun d!153507 () Bool)

(assert (=> d!153507 e!806783))

(declare-fun c!132132 () Bool)

(assert (=> d!153507 (= c!132132 (and (is-Intermediate!11284 lt!629011) (undefined!12096 lt!629011)))))

(assert (=> d!153507 (= lt!629011 e!806779)))

(declare-fun c!132131 () Bool)

(assert (=> d!153507 (= c!132131 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153507 (= lt!629012 (select (arr!47005 lt!628940) (toIndex!0 lt!628937 mask!2608)))))

(assert (=> d!153507 (validMask!0 mask!2608)))

(assert (=> d!153507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628937 mask!2608) lt!628937 lt!628940 mask!2608) lt!629011)))

(assert (= (and d!153507 c!132131) b!1428564))

(assert (= (and d!153507 (not c!132131)) b!1428563))

(assert (= (and b!1428563 c!132130) b!1428559))

(assert (= (and b!1428563 (not c!132130)) b!1428562))

(assert (= (and d!153507 c!132132) b!1428556))

(assert (= (and d!153507 (not c!132132)) b!1428557))

(assert (= (and b!1428557 res!963280) b!1428558))

(assert (= (and b!1428558 (not res!963278)) b!1428561))

(assert (= (and b!1428561 (not res!963279)) b!1428560))

(declare-fun m!1318747 () Bool)

(assert (=> b!1428558 m!1318747))

(assert (=> b!1428562 m!1318625))

(declare-fun m!1318749 () Bool)

(assert (=> b!1428562 m!1318749))

(assert (=> b!1428562 m!1318749))

(declare-fun m!1318751 () Bool)

(assert (=> b!1428562 m!1318751))

(assert (=> b!1428560 m!1318747))

(assert (=> d!153507 m!1318625))

(declare-fun m!1318753 () Bool)

(assert (=> d!153507 m!1318753))

(assert (=> d!153507 m!1318617))

(assert (=> b!1428561 m!1318747))

(assert (=> b!1428366 d!153507))

(declare-fun d!153513 () Bool)

(declare-fun lt!629025 () (_ BitVec 32))

(declare-fun lt!629024 () (_ BitVec 32))

(assert (=> d!153513 (= lt!629025 (bvmul (bvxor lt!629024 (bvlshr lt!629024 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153513 (= lt!629024 ((_ extract 31 0) (bvand (bvxor lt!628937 (bvlshr lt!628937 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153513 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963284 (let ((h!34823 ((_ extract 31 0) (bvand (bvxor lt!628937 (bvlshr lt!628937 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129163 (bvmul (bvxor h!34823 (bvlshr h!34823 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129163 (bvlshr x!129163 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963284 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963284 #b00000000000000000000000000000000))))))

(assert (=> d!153513 (= (toIndex!0 lt!628937 mask!2608) (bvand (bvxor lt!629025 (bvlshr lt!629025 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428366 d!153513))

(declare-fun b!1428649 () Bool)

(declare-fun e!806830 () SeekEntryResult!11284)

(declare-fun lt!629059 () SeekEntryResult!11284)

(assert (=> b!1428649 (= e!806830 (MissingZero!11284 (index!47530 lt!629059)))))

(declare-fun b!1428650 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97384 (_ BitVec 32)) SeekEntryResult!11284)

(assert (=> b!1428650 (= e!806830 (seekKeyOrZeroReturnVacant!0 (x!129160 lt!629059) (index!47530 lt!629059) (index!47530 lt!629059) (select (arr!47005 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!153517 () Bool)

(declare-fun lt!629060 () SeekEntryResult!11284)

(assert (=> d!153517 (and (or (is-Undefined!11284 lt!629060) (not (is-Found!11284 lt!629060)) (and (bvsge (index!47529 lt!629060) #b00000000000000000000000000000000) (bvslt (index!47529 lt!629060) (size!47555 a!2831)))) (or (is-Undefined!11284 lt!629060) (is-Found!11284 lt!629060) (not (is-MissingZero!11284 lt!629060)) (and (bvsge (index!47528 lt!629060) #b00000000000000000000000000000000) (bvslt (index!47528 lt!629060) (size!47555 a!2831)))) (or (is-Undefined!11284 lt!629060) (is-Found!11284 lt!629060) (is-MissingZero!11284 lt!629060) (not (is-MissingVacant!11284 lt!629060)) (and (bvsge (index!47531 lt!629060) #b00000000000000000000000000000000) (bvslt (index!47531 lt!629060) (size!47555 a!2831)))) (or (is-Undefined!11284 lt!629060) (ite (is-Found!11284 lt!629060) (= (select (arr!47005 a!2831) (index!47529 lt!629060)) (select (arr!47005 a!2831) j!81)) (ite (is-MissingZero!11284 lt!629060) (= (select (arr!47005 a!2831) (index!47528 lt!629060)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11284 lt!629060) (= (select (arr!47005 a!2831) (index!47531 lt!629060)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!806832 () SeekEntryResult!11284)

(assert (=> d!153517 (= lt!629060 e!806832)))

(declare-fun c!132164 () Bool)

(assert (=> d!153517 (= c!132164 (and (is-Intermediate!11284 lt!629059) (undefined!12096 lt!629059)))))

(assert (=> d!153517 (= lt!629059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153517 (validMask!0 mask!2608)))

(assert (=> d!153517 (= (seekEntryOrOpen!0 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!629060)))

(declare-fun b!1428651 () Bool)

(assert (=> b!1428651 (= e!806832 Undefined!11284)))

(declare-fun b!1428652 () Bool)

(declare-fun c!132163 () Bool)

(declare-fun lt!629058 () (_ BitVec 64))

(assert (=> b!1428652 (= c!132163 (= lt!629058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!806831 () SeekEntryResult!11284)

(assert (=> b!1428652 (= e!806831 e!806830)))

(declare-fun b!1428653 () Bool)

(assert (=> b!1428653 (= e!806832 e!806831)))

(assert (=> b!1428653 (= lt!629058 (select (arr!47005 a!2831) (index!47530 lt!629059)))))

(declare-fun c!132165 () Bool)

(assert (=> b!1428653 (= c!132165 (= lt!629058 (select (arr!47005 a!2831) j!81)))))

(declare-fun b!1428654 () Bool)

(assert (=> b!1428654 (= e!806831 (Found!11284 (index!47530 lt!629059)))))

(assert (= (and d!153517 c!132164) b!1428651))

(assert (= (and d!153517 (not c!132164)) b!1428653))

(assert (= (and b!1428653 c!132165) b!1428654))

(assert (= (and b!1428653 (not c!132165)) b!1428652))

(assert (= (and b!1428652 c!132163) b!1428649))

(assert (= (and b!1428652 (not c!132163)) b!1428650))

(assert (=> b!1428650 m!1318603))

(declare-fun m!1318799 () Bool)

(assert (=> b!1428650 m!1318799))

(declare-fun m!1318801 () Bool)

(assert (=> d!153517 m!1318801))

(assert (=> d!153517 m!1318617))

(assert (=> d!153517 m!1318633))

(assert (=> d!153517 m!1318603))

(assert (=> d!153517 m!1318635))

(declare-fun m!1318803 () Bool)

(assert (=> d!153517 m!1318803))

(declare-fun m!1318805 () Bool)

(assert (=> d!153517 m!1318805))

(assert (=> d!153517 m!1318603))

(assert (=> d!153517 m!1318633))

(declare-fun m!1318807 () Bool)

(assert (=> b!1428653 m!1318807))

(assert (=> b!1428364 d!153517))

(declare-fun d!153537 () Bool)

(assert (=> d!153537 (= (validKeyInArray!0 (select (arr!47005 a!2831) i!982)) (and (not (= (select (arr!47005 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47005 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428363 d!153537))

(declare-fun d!153539 () Bool)

(assert (=> d!153539 (= (validKeyInArray!0 (select (arr!47005 a!2831) j!81)) (and (not (= (select (arr!47005 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47005 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1428362 d!153539))

(declare-fun d!153541 () Bool)

(assert (=> d!153541 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123172 d!153541))

(declare-fun d!153543 () Bool)

(assert (=> d!153543 (= (array_inv!36033 a!2831) (bvsge (size!47555 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123172 d!153543))

(declare-fun b!1428667 () Bool)

(declare-fun e!806843 () Bool)

(declare-fun lt!629067 () SeekEntryResult!11284)

(assert (=> b!1428667 (= e!806843 (bvsge (x!129160 lt!629067) #b01111111111111111111111111111110))))

(declare-fun b!1428668 () Bool)

(declare-fun e!806840 () Bool)

(assert (=> b!1428668 (= e!806843 e!806840)))

(declare-fun res!963310 () Bool)

(assert (=> b!1428668 (= res!963310 (and (is-Intermediate!11284 lt!629067) (not (undefined!12096 lt!629067)) (bvslt (x!129160 lt!629067) #b01111111111111111111111111111110) (bvsge (x!129160 lt!629067) #b00000000000000000000000000000000) (bvsge (x!129160 lt!629067) #b00000000000000000000000000000000)))))

(assert (=> b!1428668 (=> (not res!963310) (not e!806840))))

(declare-fun e!806841 () SeekEntryResult!11284)

(declare-fun b!1428670 () Bool)

(assert (=> b!1428670 (= e!806841 (Intermediate!11284 false (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428671 () Bool)

(assert (=> b!1428671 (and (bvsge (index!47530 lt!629067) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629067) (size!47555 a!2831)))))

(declare-fun e!806842 () Bool)

(assert (=> b!1428671 (= e!806842 (= (select (arr!47005 a!2831) (index!47530 lt!629067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1428672 () Bool)

(assert (=> b!1428672 (and (bvsge (index!47530 lt!629067) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629067) (size!47555 a!2831)))))

(declare-fun res!963309 () Bool)

(assert (=> b!1428672 (= res!963309 (= (select (arr!47005 a!2831) (index!47530 lt!629067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1428672 (=> res!963309 e!806842)))

(declare-fun b!1428673 () Bool)

(assert (=> b!1428673 (= e!806841 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1428674 () Bool)

(declare-fun e!806839 () SeekEntryResult!11284)

(assert (=> b!1428674 (= e!806839 e!806841)))

(declare-fun lt!629068 () (_ BitVec 64))

(declare-fun c!132172 () Bool)

(assert (=> b!1428674 (= c!132172 (or (= lt!629068 (select (arr!47005 a!2831) j!81)) (= (bvadd lt!629068 lt!629068) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1428675 () Bool)

(assert (=> b!1428675 (= e!806839 (Intermediate!11284 true (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1428669 () Bool)

(assert (=> b!1428669 (and (bvsge (index!47530 lt!629067) #b00000000000000000000000000000000) (bvslt (index!47530 lt!629067) (size!47555 a!2831)))))

(declare-fun res!963308 () Bool)

(assert (=> b!1428669 (= res!963308 (= (select (arr!47005 a!2831) (index!47530 lt!629067)) (select (arr!47005 a!2831) j!81)))))

(assert (=> b!1428669 (=> res!963308 e!806842)))

(assert (=> b!1428669 (= e!806840 e!806842)))

(declare-fun d!153545 () Bool)

(assert (=> d!153545 e!806843))

(declare-fun c!132174 () Bool)

(assert (=> d!153545 (= c!132174 (and (is-Intermediate!11284 lt!629067) (undefined!12096 lt!629067)))))

(assert (=> d!153545 (= lt!629067 e!806839)))

(declare-fun c!132173 () Bool)

(assert (=> d!153545 (= c!132173 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153545 (= lt!629068 (select (arr!47005 a!2831) (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608)))))

(assert (=> d!153545 (validMask!0 mask!2608)))

(assert (=> d!153545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!629067)))

(assert (= (and d!153545 c!132173) b!1428675))

(assert (= (and d!153545 (not c!132173)) b!1428674))

(assert (= (and b!1428674 c!132172) b!1428670))

(assert (= (and b!1428674 (not c!132172)) b!1428673))

(assert (= (and d!153545 c!132174) b!1428667))

(assert (= (and d!153545 (not c!132174)) b!1428668))

(assert (= (and b!1428668 res!963310) b!1428669))

(assert (= (and b!1428669 (not res!963308)) b!1428672))

(assert (= (and b!1428672 (not res!963309)) b!1428671))

(declare-fun m!1318809 () Bool)

(assert (=> b!1428669 m!1318809))

(assert (=> b!1428673 m!1318633))

(declare-fun m!1318811 () Bool)

(assert (=> b!1428673 m!1318811))

(assert (=> b!1428673 m!1318811))

(assert (=> b!1428673 m!1318603))

(declare-fun m!1318813 () Bool)

(assert (=> b!1428673 m!1318813))

(assert (=> b!1428671 m!1318809))

(assert (=> d!153545 m!1318633))

(declare-fun m!1318815 () Bool)

(assert (=> d!153545 m!1318815))

(assert (=> d!153545 m!1318617))

(assert (=> b!1428672 m!1318809))

(assert (=> b!1428371 d!153545))

(declare-fun d!153547 () Bool)

(declare-fun lt!629070 () (_ BitVec 32))

(declare-fun lt!629069 () (_ BitVec 32))

(assert (=> d!153547 (= lt!629070 (bvmul (bvxor lt!629069 (bvlshr lt!629069 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153547 (= lt!629069 ((_ extract 31 0) (bvand (bvxor (select (arr!47005 a!2831) j!81) (bvlshr (select (arr!47005 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153547 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963284 (let ((h!34823 ((_ extract 31 0) (bvand (bvxor (select (arr!47005 a!2831) j!81) (bvlshr (select (arr!47005 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129163 (bvmul (bvxor h!34823 (bvlshr h!34823 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129163 (bvlshr x!129163 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963284 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963284 #b00000000000000000000000000000000))))))

(assert (=> d!153547 (= (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) (bvand (bvxor lt!629070 (bvlshr lt!629070 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1428371 d!153547))

(push 1)

