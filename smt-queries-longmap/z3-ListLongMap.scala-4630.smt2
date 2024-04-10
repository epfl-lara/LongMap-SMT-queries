; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64482 () Bool)

(assert start!64482)

(declare-datatypes ((array!41000 0))(
  ( (array!41001 (arr!19621 (Array (_ BitVec 32) (_ BitVec 64))) (size!20042 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41000)

(declare-fun e!406219 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!725366 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7221 0))(
  ( (MissingZero!7221 (index!31252 (_ BitVec 32))) (Found!7221 (index!31253 (_ BitVec 32))) (Intermediate!7221 (undefined!8033 Bool) (index!31254 (_ BitVec 32)) (x!62247 (_ BitVec 32))) (Undefined!7221) (MissingVacant!7221 (index!31255 (_ BitVec 32))) )
))
(declare-fun lt!321320 () SeekEntryResult!7221)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41000 (_ BitVec 32)) SeekEntryResult!7221)

(assert (=> b!725366 (= e!406219 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321320))))

(declare-fun b!725367 () Bool)

(declare-fun e!406218 () Bool)

(assert (=> b!725367 (= e!406218 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun e!406223 () Bool)

(assert (=> b!725367 e!406223))

(declare-fun res!486476 () Bool)

(assert (=> b!725367 (=> (not res!486476) (not e!406223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41000 (_ BitVec 32)) Bool)

(assert (=> b!725367 (= res!486476 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24760 0))(
  ( (Unit!24761) )
))
(declare-fun lt!321318 () Unit!24760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24760)

(assert (=> b!725367 (= lt!321318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725368 () Bool)

(declare-fun res!486485 () Bool)

(declare-fun e!406221 () Bool)

(assert (=> b!725368 (=> (not res!486485) (not e!406221))))

(declare-datatypes ((List!13623 0))(
  ( (Nil!13620) (Cons!13619 (h!14676 (_ BitVec 64)) (t!19938 List!13623)) )
))
(declare-fun arrayNoDuplicates!0 (array!41000 (_ BitVec 32) List!13623) Bool)

(assert (=> b!725368 (= res!486485 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13620))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!725369 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41000 (_ BitVec 32)) SeekEntryResult!7221)

(assert (=> b!725369 (= e!406219 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) (Found!7221 j!159)))))

(declare-fun b!725370 () Bool)

(declare-fun res!486488 () Bool)

(assert (=> b!725370 (=> (not res!486488) (not e!406221))))

(assert (=> b!725370 (= res!486488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725371 () Bool)

(declare-fun e!406217 () Bool)

(assert (=> b!725371 (= e!406223 e!406217)))

(declare-fun res!486483 () Bool)

(assert (=> b!725371 (=> (not res!486483) (not e!406217))))

(declare-fun lt!321322 () SeekEntryResult!7221)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41000 (_ BitVec 32)) SeekEntryResult!7221)

(assert (=> b!725371 (= res!486483 (= (seekEntryOrOpen!0 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321322))))

(assert (=> b!725371 (= lt!321322 (Found!7221 j!159))))

(declare-fun b!725372 () Bool)

(declare-fun res!486480 () Bool)

(declare-fun e!406216 () Bool)

(assert (=> b!725372 (=> (not res!486480) (not e!406216))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725372 (= res!486480 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725373 () Bool)

(declare-fun e!406220 () Bool)

(assert (=> b!725373 (= e!406221 e!406220)))

(declare-fun res!486482 () Bool)

(assert (=> b!725373 (=> (not res!486482) (not e!406220))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725373 (= res!486482 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19621 a!3186) j!159) mask!3328) (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321320))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725373 (= lt!321320 (Intermediate!7221 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725374 () Bool)

(declare-fun res!486479 () Bool)

(assert (=> b!725374 (=> (not res!486479) (not e!406216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725374 (= res!486479 (validKeyInArray!0 (select (arr!19621 a!3186) j!159)))))

(declare-fun b!725375 () Bool)

(assert (=> b!725375 (= e!406220 e!406218)))

(declare-fun res!486487 () Bool)

(assert (=> b!725375 (=> (not res!486487) (not e!406218))))

(declare-fun lt!321323 () (_ BitVec 64))

(declare-fun lt!321319 () array!41000)

(assert (=> b!725375 (= res!486487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321323 mask!3328) lt!321323 lt!321319 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321323 lt!321319 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725375 (= lt!321323 (select (store (arr!19621 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725375 (= lt!321319 (array!41001 (store (arr!19621 a!3186) i!1173 k0!2102) (size!20042 a!3186)))))

(declare-fun res!486474 () Bool)

(assert (=> start!64482 (=> (not res!486474) (not e!406216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64482 (= res!486474 (validMask!0 mask!3328))))

(assert (=> start!64482 e!406216))

(assert (=> start!64482 true))

(declare-fun array_inv!15417 (array!41000) Bool)

(assert (=> start!64482 (array_inv!15417 a!3186)))

(declare-fun b!725376 () Bool)

(declare-fun res!486478 () Bool)

(assert (=> b!725376 (=> (not res!486478) (not e!406216))))

(assert (=> b!725376 (= res!486478 (and (= (size!20042 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20042 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20042 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725377 () Bool)

(assert (=> b!725377 (= e!406216 e!406221)))

(declare-fun res!486484 () Bool)

(assert (=> b!725377 (=> (not res!486484) (not e!406221))))

(declare-fun lt!321321 () SeekEntryResult!7221)

(assert (=> b!725377 (= res!486484 (or (= lt!321321 (MissingZero!7221 i!1173)) (= lt!321321 (MissingVacant!7221 i!1173))))))

(assert (=> b!725377 (= lt!321321 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725378 () Bool)

(assert (=> b!725378 (= e!406217 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19621 a!3186) j!159) a!3186 mask!3328) lt!321322))))

(declare-fun b!725379 () Bool)

(declare-fun res!486475 () Bool)

(assert (=> b!725379 (=> (not res!486475) (not e!406216))))

(assert (=> b!725379 (= res!486475 (validKeyInArray!0 k0!2102))))

(declare-fun b!725380 () Bool)

(declare-fun res!486481 () Bool)

(assert (=> b!725380 (=> (not res!486481) (not e!406221))))

(assert (=> b!725380 (= res!486481 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20042 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20042 a!3186))))))

(declare-fun b!725381 () Bool)

(declare-fun res!486486 () Bool)

(assert (=> b!725381 (=> (not res!486486) (not e!406220))))

(assert (=> b!725381 (= res!486486 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19621 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725382 () Bool)

(declare-fun res!486477 () Bool)

(assert (=> b!725382 (=> (not res!486477) (not e!406220))))

(assert (=> b!725382 (= res!486477 e!406219)))

(declare-fun c!79819 () Bool)

(assert (=> b!725382 (= c!79819 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64482 res!486474) b!725376))

(assert (= (and b!725376 res!486478) b!725374))

(assert (= (and b!725374 res!486479) b!725379))

(assert (= (and b!725379 res!486475) b!725372))

(assert (= (and b!725372 res!486480) b!725377))

(assert (= (and b!725377 res!486484) b!725370))

(assert (= (and b!725370 res!486488) b!725368))

(assert (= (and b!725368 res!486485) b!725380))

(assert (= (and b!725380 res!486481) b!725373))

(assert (= (and b!725373 res!486482) b!725381))

(assert (= (and b!725381 res!486486) b!725382))

(assert (= (and b!725382 c!79819) b!725366))

(assert (= (and b!725382 (not c!79819)) b!725369))

(assert (= (and b!725382 res!486477) b!725375))

(assert (= (and b!725375 res!486487) b!725367))

(assert (= (and b!725367 res!486476) b!725371))

(assert (= (and b!725371 res!486483) b!725378))

(declare-fun m!679535 () Bool)

(assert (=> start!64482 m!679535))

(declare-fun m!679537 () Bool)

(assert (=> start!64482 m!679537))

(declare-fun m!679539 () Bool)

(assert (=> b!725372 m!679539))

(declare-fun m!679541 () Bool)

(assert (=> b!725377 m!679541))

(declare-fun m!679543 () Bool)

(assert (=> b!725374 m!679543))

(assert (=> b!725374 m!679543))

(declare-fun m!679545 () Bool)

(assert (=> b!725374 m!679545))

(assert (=> b!725371 m!679543))

(assert (=> b!725371 m!679543))

(declare-fun m!679547 () Bool)

(assert (=> b!725371 m!679547))

(assert (=> b!725378 m!679543))

(assert (=> b!725378 m!679543))

(declare-fun m!679549 () Bool)

(assert (=> b!725378 m!679549))

(assert (=> b!725369 m!679543))

(assert (=> b!725369 m!679543))

(declare-fun m!679551 () Bool)

(assert (=> b!725369 m!679551))

(declare-fun m!679553 () Bool)

(assert (=> b!725375 m!679553))

(declare-fun m!679555 () Bool)

(assert (=> b!725375 m!679555))

(declare-fun m!679557 () Bool)

(assert (=> b!725375 m!679557))

(declare-fun m!679559 () Bool)

(assert (=> b!725375 m!679559))

(assert (=> b!725375 m!679559))

(declare-fun m!679561 () Bool)

(assert (=> b!725375 m!679561))

(assert (=> b!725373 m!679543))

(assert (=> b!725373 m!679543))

(declare-fun m!679563 () Bool)

(assert (=> b!725373 m!679563))

(assert (=> b!725373 m!679563))

(assert (=> b!725373 m!679543))

(declare-fun m!679565 () Bool)

(assert (=> b!725373 m!679565))

(declare-fun m!679567 () Bool)

(assert (=> b!725379 m!679567))

(declare-fun m!679569 () Bool)

(assert (=> b!725368 m!679569))

(declare-fun m!679571 () Bool)

(assert (=> b!725381 m!679571))

(assert (=> b!725366 m!679543))

(assert (=> b!725366 m!679543))

(declare-fun m!679573 () Bool)

(assert (=> b!725366 m!679573))

(declare-fun m!679575 () Bool)

(assert (=> b!725367 m!679575))

(declare-fun m!679577 () Bool)

(assert (=> b!725367 m!679577))

(declare-fun m!679579 () Bool)

(assert (=> b!725370 m!679579))

(check-sat (not b!725374) (not b!725378) (not b!725377) (not b!725369) (not b!725366) (not b!725379) (not b!725367) (not start!64482) (not b!725375) (not b!725371) (not b!725368) (not b!725372) (not b!725370) (not b!725373))
(check-sat)
