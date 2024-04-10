; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67376 () Bool)

(assert start!67376)

(declare-fun b!779545 () Bool)

(declare-fun res!527495 () Bool)

(declare-fun e!433656 () Bool)

(assert (=> b!779545 (=> (not res!527495) (not e!433656))))

(declare-datatypes ((array!42605 0))(
  ( (array!42606 (arr!20395 (Array (_ BitVec 32) (_ BitVec 64))) (size!20816 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42605)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42605 (_ BitVec 32)) Bool)

(assert (=> b!779545 (= res!527495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779546 () Bool)

(declare-fun res!527489 () Bool)

(assert (=> b!779546 (=> (not res!527489) (not e!433656))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779546 (= res!527489 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20816 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20816 a!3186))))))

(declare-fun b!779547 () Bool)

(declare-fun e!433664 () Bool)

(declare-fun e!433660 () Bool)

(assert (=> b!779547 (= e!433664 (not e!433660))))

(declare-fun res!527501 () Bool)

(assert (=> b!779547 (=> res!527501 e!433660)))

(declare-datatypes ((SeekEntryResult!7995 0))(
  ( (MissingZero!7995 (index!34348 (_ BitVec 32))) (Found!7995 (index!34349 (_ BitVec 32))) (Intermediate!7995 (undefined!8807 Bool) (index!34350 (_ BitVec 32)) (x!65292 (_ BitVec 32))) (Undefined!7995) (MissingVacant!7995 (index!34351 (_ BitVec 32))) )
))
(declare-fun lt!347366 () SeekEntryResult!7995)

(get-info :version)

(assert (=> b!779547 (= res!527501 (or (not ((_ is Intermediate!7995) lt!347366)) (bvslt x!1131 (x!65292 lt!347366)) (not (= x!1131 (x!65292 lt!347366))) (not (= index!1321 (index!34350 lt!347366)))))))

(declare-fun e!433658 () Bool)

(assert (=> b!779547 e!433658))

(declare-fun res!527497 () Bool)

(assert (=> b!779547 (=> (not res!527497) (not e!433658))))

(declare-fun lt!347369 () SeekEntryResult!7995)

(declare-fun lt!347363 () SeekEntryResult!7995)

(assert (=> b!779547 (= res!527497 (= lt!347369 lt!347363))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!779547 (= lt!347363 (Found!7995 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42605 (_ BitVec 32)) SeekEntryResult!7995)

(assert (=> b!779547 (= lt!347369 (seekEntryOrOpen!0 (select (arr!20395 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779547 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26884 0))(
  ( (Unit!26885) )
))
(declare-fun lt!347364 () Unit!26884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26884)

(assert (=> b!779547 (= lt!347364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779548 () Bool)

(declare-fun e!433663 () Bool)

(assert (=> b!779548 (= e!433663 true)))

(declare-fun lt!347361 () SeekEntryResult!7995)

(assert (=> b!779548 (= lt!347369 lt!347361)))

(declare-fun b!779549 () Bool)

(declare-fun e!433661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42605 (_ BitVec 32)) SeekEntryResult!7995)

(assert (=> b!779549 (= e!433661 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) (Found!7995 j!159)))))

(declare-fun lt!347368 () SeekEntryResult!7995)

(declare-fun b!779550 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42605 (_ BitVec 32)) SeekEntryResult!7995)

(assert (=> b!779550 (= e!433661 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347368))))

(declare-fun b!779551 () Bool)

(declare-fun e!433657 () Bool)

(assert (=> b!779551 (= e!433657 e!433664)))

(declare-fun res!527498 () Bool)

(assert (=> b!779551 (=> (not res!527498) (not e!433664))))

(declare-fun lt!347362 () SeekEntryResult!7995)

(assert (=> b!779551 (= res!527498 (= lt!347362 lt!347366))))

(declare-fun lt!347365 () array!42605)

(declare-fun lt!347360 () (_ BitVec 64))

(assert (=> b!779551 (= lt!347366 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347360 lt!347365 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779551 (= lt!347362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347360 mask!3328) lt!347360 lt!347365 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!779551 (= lt!347360 (select (store (arr!20395 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779551 (= lt!347365 (array!42606 (store (arr!20395 a!3186) i!1173 k0!2102) (size!20816 a!3186)))))

(declare-fun b!779552 () Bool)

(declare-fun res!527502 () Bool)

(declare-fun e!433659 () Bool)

(assert (=> b!779552 (=> (not res!527502) (not e!433659))))

(declare-fun arrayContainsKey!0 (array!42605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779552 (= res!527502 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779553 () Bool)

(declare-fun res!527496 () Bool)

(assert (=> b!779553 (=> (not res!527496) (not e!433656))))

(declare-datatypes ((List!14397 0))(
  ( (Nil!14394) (Cons!14393 (h!15507 (_ BitVec 64)) (t!20712 List!14397)) )
))
(declare-fun arrayNoDuplicates!0 (array!42605 (_ BitVec 32) List!14397) Bool)

(assert (=> b!779553 (= res!527496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14394))))

(declare-fun b!779554 () Bool)

(declare-fun res!527504 () Bool)

(assert (=> b!779554 (=> (not res!527504) (not e!433659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779554 (= res!527504 (validKeyInArray!0 (select (arr!20395 a!3186) j!159)))))

(declare-fun res!527490 () Bool)

(assert (=> start!67376 (=> (not res!527490) (not e!433659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67376 (= res!527490 (validMask!0 mask!3328))))

(assert (=> start!67376 e!433659))

(assert (=> start!67376 true))

(declare-fun array_inv!16191 (array!42605) Bool)

(assert (=> start!67376 (array_inv!16191 a!3186)))

(declare-fun b!779555 () Bool)

(assert (=> b!779555 (= e!433656 e!433657)))

(declare-fun res!527491 () Bool)

(assert (=> b!779555 (=> (not res!527491) (not e!433657))))

(assert (=> b!779555 (= res!527491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20395 a!3186) j!159) mask!3328) (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347368))))

(assert (=> b!779555 (= lt!347368 (Intermediate!7995 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779556 () Bool)

(declare-fun res!527494 () Bool)

(assert (=> b!779556 (=> (not res!527494) (not e!433659))))

(assert (=> b!779556 (= res!527494 (and (= (size!20816 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20816 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20816 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779557 () Bool)

(declare-fun res!527493 () Bool)

(assert (=> b!779557 (=> (not res!527493) (not e!433657))))

(assert (=> b!779557 (= res!527493 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20395 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779558 () Bool)

(assert (=> b!779558 (= e!433659 e!433656)))

(declare-fun res!527492 () Bool)

(assert (=> b!779558 (=> (not res!527492) (not e!433656))))

(declare-fun lt!347367 () SeekEntryResult!7995)

(assert (=> b!779558 (= res!527492 (or (= lt!347367 (MissingZero!7995 i!1173)) (= lt!347367 (MissingVacant!7995 i!1173))))))

(assert (=> b!779558 (= lt!347367 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779559 () Bool)

(assert (=> b!779559 (= e!433660 e!433663)))

(declare-fun res!527503 () Bool)

(assert (=> b!779559 (=> res!527503 e!433663)))

(assert (=> b!779559 (= res!527503 (or (not (= lt!347361 lt!347363)) (= (select (store (arr!20395 a!3186) i!1173 k0!2102) index!1321) lt!347360) (not (= (select (store (arr!20395 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!779559 (= lt!347361 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779560 () Bool)

(declare-fun res!527500 () Bool)

(assert (=> b!779560 (=> (not res!527500) (not e!433657))))

(assert (=> b!779560 (= res!527500 e!433661)))

(declare-fun c!86431 () Bool)

(assert (=> b!779560 (= c!86431 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779561 () Bool)

(assert (=> b!779561 (= e!433658 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347363))))

(declare-fun b!779562 () Bool)

(declare-fun res!527499 () Bool)

(assert (=> b!779562 (=> (not res!527499) (not e!433659))))

(assert (=> b!779562 (= res!527499 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67376 res!527490) b!779556))

(assert (= (and b!779556 res!527494) b!779554))

(assert (= (and b!779554 res!527504) b!779562))

(assert (= (and b!779562 res!527499) b!779552))

(assert (= (and b!779552 res!527502) b!779558))

(assert (= (and b!779558 res!527492) b!779545))

(assert (= (and b!779545 res!527495) b!779553))

(assert (= (and b!779553 res!527496) b!779546))

(assert (= (and b!779546 res!527489) b!779555))

(assert (= (and b!779555 res!527491) b!779557))

(assert (= (and b!779557 res!527493) b!779560))

(assert (= (and b!779560 c!86431) b!779550))

(assert (= (and b!779560 (not c!86431)) b!779549))

(assert (= (and b!779560 res!527500) b!779551))

(assert (= (and b!779551 res!527498) b!779547))

(assert (= (and b!779547 res!527497) b!779561))

(assert (= (and b!779547 (not res!527501)) b!779559))

(assert (= (and b!779559 (not res!527503)) b!779548))

(declare-fun m!723047 () Bool)

(assert (=> start!67376 m!723047))

(declare-fun m!723049 () Bool)

(assert (=> start!67376 m!723049))

(declare-fun m!723051 () Bool)

(assert (=> b!779561 m!723051))

(assert (=> b!779561 m!723051))

(declare-fun m!723053 () Bool)

(assert (=> b!779561 m!723053))

(assert (=> b!779555 m!723051))

(assert (=> b!779555 m!723051))

(declare-fun m!723055 () Bool)

(assert (=> b!779555 m!723055))

(assert (=> b!779555 m!723055))

(assert (=> b!779555 m!723051))

(declare-fun m!723057 () Bool)

(assert (=> b!779555 m!723057))

(assert (=> b!779549 m!723051))

(assert (=> b!779549 m!723051))

(declare-fun m!723059 () Bool)

(assert (=> b!779549 m!723059))

(declare-fun m!723061 () Bool)

(assert (=> b!779545 m!723061))

(assert (=> b!779554 m!723051))

(assert (=> b!779554 m!723051))

(declare-fun m!723063 () Bool)

(assert (=> b!779554 m!723063))

(assert (=> b!779547 m!723051))

(assert (=> b!779547 m!723051))

(declare-fun m!723065 () Bool)

(assert (=> b!779547 m!723065))

(declare-fun m!723067 () Bool)

(assert (=> b!779547 m!723067))

(declare-fun m!723069 () Bool)

(assert (=> b!779547 m!723069))

(declare-fun m!723071 () Bool)

(assert (=> b!779557 m!723071))

(declare-fun m!723073 () Bool)

(assert (=> b!779562 m!723073))

(declare-fun m!723075 () Bool)

(assert (=> b!779552 m!723075))

(declare-fun m!723077 () Bool)

(assert (=> b!779558 m!723077))

(declare-fun m!723079 () Bool)

(assert (=> b!779551 m!723079))

(declare-fun m!723081 () Bool)

(assert (=> b!779551 m!723081))

(declare-fun m!723083 () Bool)

(assert (=> b!779551 m!723083))

(assert (=> b!779551 m!723083))

(declare-fun m!723085 () Bool)

(assert (=> b!779551 m!723085))

(declare-fun m!723087 () Bool)

(assert (=> b!779551 m!723087))

(assert (=> b!779550 m!723051))

(assert (=> b!779550 m!723051))

(declare-fun m!723089 () Bool)

(assert (=> b!779550 m!723089))

(assert (=> b!779559 m!723079))

(declare-fun m!723091 () Bool)

(assert (=> b!779559 m!723091))

(assert (=> b!779559 m!723051))

(assert (=> b!779559 m!723051))

(assert (=> b!779559 m!723059))

(declare-fun m!723093 () Bool)

(assert (=> b!779553 m!723093))

(check-sat (not b!779550) (not b!779551) (not start!67376) (not b!779559) (not b!779561) (not b!779552) (not b!779554) (not b!779553) (not b!779555) (not b!779562) (not b!779558) (not b!779547) (not b!779549) (not b!779545))
(check-sat)
