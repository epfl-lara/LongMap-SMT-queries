; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64378 () Bool)

(assert start!64378)

(declare-fun b!724041 () Bool)

(declare-fun e!405563 () Bool)

(declare-fun e!405560 () Bool)

(assert (=> b!724041 (= e!405563 e!405560)))

(declare-fun res!485548 () Bool)

(assert (=> b!724041 (=> (not res!485548) (not e!405560))))

(declare-fun lt!320860 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!40959 0))(
  ( (array!40960 (arr!19602 (Array (_ BitVec 32) (_ BitVec 64))) (size!20023 (_ BitVec 32))) )
))
(declare-fun lt!320863 () array!40959)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7202 0))(
  ( (MissingZero!7202 (index!31176 (_ BitVec 32))) (Found!7202 (index!31177 (_ BitVec 32))) (Intermediate!7202 (undefined!8014 Bool) (index!31178 (_ BitVec 32)) (x!62171 (_ BitVec 32))) (Undefined!7202) (MissingVacant!7202 (index!31179 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40959 (_ BitVec 32)) SeekEntryResult!7202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724041 (= res!485548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320860 mask!3328) lt!320860 lt!320863 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320860 lt!320863 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!40959)

(assert (=> b!724041 (= lt!320860 (select (store (arr!19602 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724041 (= lt!320863 (array!40960 (store (arr!19602 a!3186) i!1173 k!2102) (size!20023 a!3186)))))

(declare-fun b!724042 () Bool)

(declare-fun res!485544 () Bool)

(declare-fun e!405564 () Bool)

(assert (=> b!724042 (=> (not res!485544) (not e!405564))))

(declare-datatypes ((List!13604 0))(
  ( (Nil!13601) (Cons!13600 (h!14654 (_ BitVec 64)) (t!19919 List!13604)) )
))
(declare-fun arrayNoDuplicates!0 (array!40959 (_ BitVec 32) List!13604) Bool)

(assert (=> b!724042 (= res!485544 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13601))))

(declare-fun b!724043 () Bool)

(declare-fun res!485540 () Bool)

(declare-fun e!405562 () Bool)

(assert (=> b!724043 (=> (not res!485540) (not e!405562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724043 (= res!485540 (validKeyInArray!0 (select (arr!19602 a!3186) j!159)))))

(declare-fun b!724044 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!724044 (= e!405560 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!405566 () Bool)

(assert (=> b!724044 e!405566))

(declare-fun res!485542 () Bool)

(assert (=> b!724044 (=> (not res!485542) (not e!405566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40959 (_ BitVec 32)) Bool)

(assert (=> b!724044 (= res!485542 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24722 0))(
  ( (Unit!24723) )
))
(declare-fun lt!320861 () Unit!24722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24722)

(assert (=> b!724044 (= lt!320861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724045 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40959 (_ BitVec 32)) SeekEntryResult!7202)

(assert (=> b!724045 (= e!405566 (= (seekEntryOrOpen!0 (select (arr!19602 a!3186) j!159) a!3186 mask!3328) (Found!7202 j!159)))))

(declare-fun b!724046 () Bool)

(declare-fun res!485546 () Bool)

(assert (=> b!724046 (=> (not res!485546) (not e!405562))))

(assert (=> b!724046 (= res!485546 (validKeyInArray!0 k!2102))))

(declare-fun b!724047 () Bool)

(declare-fun res!485538 () Bool)

(assert (=> b!724047 (=> (not res!485538) (not e!405562))))

(assert (=> b!724047 (= res!485538 (and (= (size!20023 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20023 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20023 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724048 () Bool)

(declare-fun res!485537 () Bool)

(assert (=> b!724048 (=> (not res!485537) (not e!405564))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724048 (= res!485537 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20023 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20023 a!3186))))))

(declare-fun res!485543 () Bool)

(assert (=> start!64378 (=> (not res!485543) (not e!405562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64378 (= res!485543 (validMask!0 mask!3328))))

(assert (=> start!64378 e!405562))

(assert (=> start!64378 true))

(declare-fun array_inv!15398 (array!40959) Bool)

(assert (=> start!64378 (array_inv!15398 a!3186)))

(declare-fun b!724049 () Bool)

(declare-fun res!485549 () Bool)

(assert (=> b!724049 (=> (not res!485549) (not e!405564))))

(assert (=> b!724049 (= res!485549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724050 () Bool)

(declare-fun res!485547 () Bool)

(assert (=> b!724050 (=> (not res!485547) (not e!405563))))

(declare-fun e!405561 () Bool)

(assert (=> b!724050 (= res!485547 e!405561)))

(declare-fun c!79624 () Bool)

(assert (=> b!724050 (= c!79624 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724051 () Bool)

(declare-fun res!485539 () Bool)

(assert (=> b!724051 (=> (not res!485539) (not e!405562))))

(declare-fun arrayContainsKey!0 (array!40959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724051 (= res!485539 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724052 () Bool)

(assert (=> b!724052 (= e!405564 e!405563)))

(declare-fun res!485536 () Bool)

(assert (=> b!724052 (=> (not res!485536) (not e!405563))))

(declare-fun lt!320864 () SeekEntryResult!7202)

(assert (=> b!724052 (= res!485536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19602 a!3186) j!159) mask!3328) (select (arr!19602 a!3186) j!159) a!3186 mask!3328) lt!320864))))

(assert (=> b!724052 (= lt!320864 (Intermediate!7202 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724053 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40959 (_ BitVec 32)) SeekEntryResult!7202)

(assert (=> b!724053 (= e!405561 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19602 a!3186) j!159) a!3186 mask!3328) (Found!7202 j!159)))))

(declare-fun b!724054 () Bool)

(assert (=> b!724054 (= e!405561 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19602 a!3186) j!159) a!3186 mask!3328) lt!320864))))

(declare-fun b!724055 () Bool)

(assert (=> b!724055 (= e!405562 e!405564)))

(declare-fun res!485545 () Bool)

(assert (=> b!724055 (=> (not res!485545) (not e!405564))))

(declare-fun lt!320862 () SeekEntryResult!7202)

(assert (=> b!724055 (= res!485545 (or (= lt!320862 (MissingZero!7202 i!1173)) (= lt!320862 (MissingVacant!7202 i!1173))))))

(assert (=> b!724055 (= lt!320862 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724056 () Bool)

(declare-fun res!485541 () Bool)

(assert (=> b!724056 (=> (not res!485541) (not e!405563))))

(assert (=> b!724056 (= res!485541 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19602 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64378 res!485543) b!724047))

(assert (= (and b!724047 res!485538) b!724043))

(assert (= (and b!724043 res!485540) b!724046))

(assert (= (and b!724046 res!485546) b!724051))

(assert (= (and b!724051 res!485539) b!724055))

(assert (= (and b!724055 res!485545) b!724049))

(assert (= (and b!724049 res!485549) b!724042))

(assert (= (and b!724042 res!485544) b!724048))

(assert (= (and b!724048 res!485537) b!724052))

(assert (= (and b!724052 res!485536) b!724056))

(assert (= (and b!724056 res!485541) b!724050))

(assert (= (and b!724050 c!79624) b!724054))

(assert (= (and b!724050 (not c!79624)) b!724053))

(assert (= (and b!724050 res!485547) b!724041))

(assert (= (and b!724041 res!485548) b!724044))

(assert (= (and b!724044 res!485542) b!724045))

(declare-fun m!678433 () Bool)

(assert (=> b!724041 m!678433))

(declare-fun m!678435 () Bool)

(assert (=> b!724041 m!678435))

(declare-fun m!678437 () Bool)

(assert (=> b!724041 m!678437))

(declare-fun m!678439 () Bool)

(assert (=> b!724041 m!678439))

(assert (=> b!724041 m!678435))

(declare-fun m!678441 () Bool)

(assert (=> b!724041 m!678441))

(declare-fun m!678443 () Bool)

(assert (=> b!724055 m!678443))

(declare-fun m!678445 () Bool)

(assert (=> b!724052 m!678445))

(assert (=> b!724052 m!678445))

(declare-fun m!678447 () Bool)

(assert (=> b!724052 m!678447))

(assert (=> b!724052 m!678447))

(assert (=> b!724052 m!678445))

(declare-fun m!678449 () Bool)

(assert (=> b!724052 m!678449))

(assert (=> b!724053 m!678445))

(assert (=> b!724053 m!678445))

(declare-fun m!678451 () Bool)

(assert (=> b!724053 m!678451))

(declare-fun m!678453 () Bool)

(assert (=> start!64378 m!678453))

(declare-fun m!678455 () Bool)

(assert (=> start!64378 m!678455))

(assert (=> b!724045 m!678445))

(assert (=> b!724045 m!678445))

(declare-fun m!678457 () Bool)

(assert (=> b!724045 m!678457))

(declare-fun m!678459 () Bool)

(assert (=> b!724056 m!678459))

(declare-fun m!678461 () Bool)

(assert (=> b!724051 m!678461))

(assert (=> b!724043 m!678445))

(assert (=> b!724043 m!678445))

(declare-fun m!678463 () Bool)

(assert (=> b!724043 m!678463))

(declare-fun m!678465 () Bool)

(assert (=> b!724044 m!678465))

(declare-fun m!678467 () Bool)

(assert (=> b!724044 m!678467))

(declare-fun m!678469 () Bool)

(assert (=> b!724042 m!678469))

(assert (=> b!724054 m!678445))

(assert (=> b!724054 m!678445))

(declare-fun m!678471 () Bool)

(assert (=> b!724054 m!678471))

(declare-fun m!678473 () Bool)

(assert (=> b!724046 m!678473))

(declare-fun m!678475 () Bool)

(assert (=> b!724049 m!678475))

(push 1)

(assert (not b!724041))

(assert (not b!724052))

(assert (not b!724042))

(assert (not b!724051))

(assert (not start!64378))

(assert (not b!724053))

(assert (not b!724045))

(assert (not b!724044))

(assert (not b!724043))

(assert (not b!724054))

(assert (not b!724049))

(assert (not b!724046))

(assert (not b!724055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

