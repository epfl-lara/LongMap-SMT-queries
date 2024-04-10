; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64264 () Bool)

(assert start!64264)

(declare-fun b!721564 () Bool)

(declare-fun e!404609 () Bool)

(declare-fun e!404607 () Bool)

(assert (=> b!721564 (= e!404609 e!404607)))

(declare-fun res!483405 () Bool)

(assert (=> b!721564 (=> (not res!483405) (not e!404607))))

(declare-datatypes ((SeekEntryResult!7145 0))(
  ( (MissingZero!7145 (index!30948 (_ BitVec 32))) (Found!7145 (index!30949 (_ BitVec 32))) (Intermediate!7145 (undefined!7957 Bool) (index!30950 (_ BitVec 32)) (x!61962 (_ BitVec 32))) (Undefined!7145) (MissingVacant!7145 (index!30951 (_ BitVec 32))) )
))
(declare-fun lt!320110 () SeekEntryResult!7145)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721564 (= res!483405 (or (= lt!320110 (MissingZero!7145 i!1173)) (= lt!320110 (MissingVacant!7145 i!1173))))))

(declare-datatypes ((array!40845 0))(
  ( (array!40846 (arr!19545 (Array (_ BitVec 32) (_ BitVec 64))) (size!19966 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40845)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40845 (_ BitVec 32)) SeekEntryResult!7145)

(assert (=> b!721564 (= lt!320110 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721565 () Bool)

(declare-fun res!483406 () Bool)

(declare-fun e!404605 () Bool)

(assert (=> b!721565 (=> (not res!483406) (not e!404605))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!721565 (= res!483406 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19545 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!404606 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721566 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40845 (_ BitVec 32)) SeekEntryResult!7145)

(assert (=> b!721566 (= e!404606 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19545 a!3186) j!159) a!3186 mask!3328) (Found!7145 j!159)))))

(declare-fun b!721567 () Bool)

(declare-fun res!483402 () Bool)

(assert (=> b!721567 (=> (not res!483402) (not e!404609))))

(declare-fun arrayContainsKey!0 (array!40845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721567 (= res!483402 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721568 () Bool)

(declare-fun res!483410 () Bool)

(assert (=> b!721568 (=> (not res!483410) (not e!404609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721568 (= res!483410 (validKeyInArray!0 (select (arr!19545 a!3186) j!159)))))

(declare-fun b!721569 () Bool)

(declare-fun e!404608 () Bool)

(assert (=> b!721569 (= e!404605 e!404608)))

(declare-fun res!483413 () Bool)

(assert (=> b!721569 (=> (not res!483413) (not e!404608))))

(declare-fun lt!320109 () (_ BitVec 32))

(assert (=> b!721569 (= res!483413 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge lt!320109 #b00000000000000000000000000000000) (bvslt lt!320109 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721569 (= lt!320109 (toIndex!0 (select (store (arr!19545 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!721570 () Bool)

(declare-fun res!483408 () Bool)

(assert (=> b!721570 (=> (not res!483408) (not e!404605))))

(assert (=> b!721570 (= res!483408 e!404606)))

(declare-fun c!79453 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721570 (= c!79453 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721572 () Bool)

(assert (=> b!721572 (= e!404607 e!404605)))

(declare-fun res!483411 () Bool)

(assert (=> b!721572 (=> (not res!483411) (not e!404605))))

(declare-fun lt!320111 () SeekEntryResult!7145)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40845 (_ BitVec 32)) SeekEntryResult!7145)

(assert (=> b!721572 (= res!483411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19545 a!3186) j!159) mask!3328) (select (arr!19545 a!3186) j!159) a!3186 mask!3328) lt!320111))))

(assert (=> b!721572 (= lt!320111 (Intermediate!7145 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721573 () Bool)

(assert (=> b!721573 (= e!404606 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19545 a!3186) j!159) a!3186 mask!3328) lt!320111))))

(declare-fun b!721574 () Bool)

(declare-fun res!483407 () Bool)

(assert (=> b!721574 (=> (not res!483407) (not e!404607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40845 (_ BitVec 32)) Bool)

(assert (=> b!721574 (= res!483407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721571 () Bool)

(declare-fun res!483404 () Bool)

(assert (=> b!721571 (=> (not res!483404) (not e!404607))))

(declare-datatypes ((List!13547 0))(
  ( (Nil!13544) (Cons!13543 (h!14597 (_ BitVec 64)) (t!19862 List!13547)) )
))
(declare-fun arrayNoDuplicates!0 (array!40845 (_ BitVec 32) List!13547) Bool)

(assert (=> b!721571 (= res!483404 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13544))))

(declare-fun res!483403 () Bool)

(assert (=> start!64264 (=> (not res!483403) (not e!404609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64264 (= res!483403 (validMask!0 mask!3328))))

(assert (=> start!64264 e!404609))

(assert (=> start!64264 true))

(declare-fun array_inv!15341 (array!40845) Bool)

(assert (=> start!64264 (array_inv!15341 a!3186)))

(declare-fun b!721575 () Bool)

(assert (=> b!721575 (= e!404608 (not (validKeyInArray!0 (select (store (arr!19545 a!3186) i!1173 k!2102) j!159))))))

(declare-fun b!721576 () Bool)

(declare-fun res!483401 () Bool)

(assert (=> b!721576 (=> (not res!483401) (not e!404609))))

(assert (=> b!721576 (= res!483401 (validKeyInArray!0 k!2102))))

(declare-fun b!721577 () Bool)

(declare-fun res!483409 () Bool)

(assert (=> b!721577 (=> (not res!483409) (not e!404607))))

(assert (=> b!721577 (= res!483409 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19966 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19966 a!3186))))))

(declare-fun b!721578 () Bool)

(declare-fun res!483412 () Bool)

(assert (=> b!721578 (=> (not res!483412) (not e!404609))))

(assert (=> b!721578 (= res!483412 (and (= (size!19966 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19966 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19966 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64264 res!483403) b!721578))

(assert (= (and b!721578 res!483412) b!721568))

(assert (= (and b!721568 res!483410) b!721576))

(assert (= (and b!721576 res!483401) b!721567))

(assert (= (and b!721567 res!483402) b!721564))

(assert (= (and b!721564 res!483405) b!721574))

(assert (= (and b!721574 res!483407) b!721571))

(assert (= (and b!721571 res!483404) b!721577))

(assert (= (and b!721577 res!483409) b!721572))

(assert (= (and b!721572 res!483411) b!721565))

(assert (= (and b!721565 res!483406) b!721570))

(assert (= (and b!721570 c!79453) b!721573))

(assert (= (and b!721570 (not c!79453)) b!721566))

(assert (= (and b!721570 res!483408) b!721569))

(assert (= (and b!721569 res!483413) b!721575))

(declare-fun m!676333 () Bool)

(assert (=> b!721564 m!676333))

(declare-fun m!676335 () Bool)

(assert (=> b!721573 m!676335))

(assert (=> b!721573 m!676335))

(declare-fun m!676337 () Bool)

(assert (=> b!721573 m!676337))

(declare-fun m!676339 () Bool)

(assert (=> b!721571 m!676339))

(declare-fun m!676341 () Bool)

(assert (=> start!64264 m!676341))

(declare-fun m!676343 () Bool)

(assert (=> start!64264 m!676343))

(declare-fun m!676345 () Bool)

(assert (=> b!721575 m!676345))

(declare-fun m!676347 () Bool)

(assert (=> b!721575 m!676347))

(assert (=> b!721575 m!676347))

(declare-fun m!676349 () Bool)

(assert (=> b!721575 m!676349))

(declare-fun m!676351 () Bool)

(assert (=> b!721565 m!676351))

(declare-fun m!676353 () Bool)

(assert (=> b!721576 m!676353))

(assert (=> b!721572 m!676335))

(assert (=> b!721572 m!676335))

(declare-fun m!676355 () Bool)

(assert (=> b!721572 m!676355))

(assert (=> b!721572 m!676355))

(assert (=> b!721572 m!676335))

(declare-fun m!676357 () Bool)

(assert (=> b!721572 m!676357))

(assert (=> b!721568 m!676335))

(assert (=> b!721568 m!676335))

(declare-fun m!676359 () Bool)

(assert (=> b!721568 m!676359))

(declare-fun m!676361 () Bool)

(assert (=> b!721574 m!676361))

(assert (=> b!721569 m!676345))

(assert (=> b!721569 m!676347))

(assert (=> b!721569 m!676347))

(declare-fun m!676363 () Bool)

(assert (=> b!721569 m!676363))

(declare-fun m!676365 () Bool)

(assert (=> b!721567 m!676365))

(assert (=> b!721566 m!676335))

(assert (=> b!721566 m!676335))

(declare-fun m!676367 () Bool)

(assert (=> b!721566 m!676367))

(push 1)

