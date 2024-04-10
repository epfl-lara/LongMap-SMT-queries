; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31062 () Bool)

(assert start!31062)

(declare-fun b!312467 () Bool)

(declare-fun e!194834 () Bool)

(declare-fun e!194835 () Bool)

(assert (=> b!312467 (= e!194834 (not e!194835))))

(declare-fun res!168922 () Bool)

(assert (=> b!312467 (=> res!168922 e!194835)))

(declare-datatypes ((array!15964 0))(
  ( (array!15965 (arr!7564 (Array (_ BitVec 32) (_ BitVec 64))) (size!7916 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15964)

(declare-datatypes ((SeekEntryResult!2704 0))(
  ( (MissingZero!2704 (index!12992 (_ BitVec 32))) (Found!2704 (index!12993 (_ BitVec 32))) (Intermediate!2704 (undefined!3516 Bool) (index!12994 (_ BitVec 32)) (x!31197 (_ BitVec 32))) (Undefined!2704) (MissingVacant!2704 (index!12995 (_ BitVec 32))) )
))
(declare-fun lt!153053 () SeekEntryResult!2704)

(declare-fun lt!153051 () SeekEntryResult!2704)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!153056 () (_ BitVec 32))

(assert (=> b!312467 (= res!168922 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153056 #b00000000000000000000000000000000) (bvsge lt!153056 (size!7916 a!3293)) (not (= lt!153051 lt!153053))))))

(declare-fun lt!153057 () SeekEntryResult!2704)

(declare-fun lt!153050 () SeekEntryResult!2704)

(assert (=> b!312467 (= lt!153057 lt!153050)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun lt!153054 () array!15964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15964 (_ BitVec 32)) SeekEntryResult!2704)

(assert (=> b!312467 (= lt!153050 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153056 k!2441 lt!153054 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312467 (= lt!153057 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153054 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312467 (= lt!153054 (array!15965 (store (arr!7564 a!3293) i!1240 k!2441) (size!7916 a!3293)))))

(declare-fun lt!153055 () SeekEntryResult!2704)

(assert (=> b!312467 (= lt!153055 lt!153051)))

(assert (=> b!312467 (= lt!153051 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153056 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312467 (= lt!153056 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312468 () Bool)

(declare-fun res!168921 () Bool)

(declare-fun e!194836 () Bool)

(assert (=> b!312468 (=> (not res!168921) (not e!194836))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312468 (= res!168921 (and (= (select (arr!7564 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7916 a!3293))))))

(declare-fun b!312469 () Bool)

(declare-fun res!168930 () Bool)

(declare-fun e!194832 () Bool)

(assert (=> b!312469 (=> (not res!168930) (not e!194832))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15964 (_ BitVec 32)) SeekEntryResult!2704)

(assert (=> b!312469 (= res!168930 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2704 i!1240)))))

(declare-fun b!312470 () Bool)

(declare-fun res!168926 () Bool)

(assert (=> b!312470 (=> (not res!168926) (not e!194832))))

(assert (=> b!312470 (= res!168926 (and (= (size!7916 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7916 a!3293))))))

(declare-fun res!168923 () Bool)

(assert (=> start!31062 (=> (not res!168923) (not e!194832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31062 (= res!168923 (validMask!0 mask!3709))))

(assert (=> start!31062 e!194832))

(declare-fun array_inv!5527 (array!15964) Bool)

(assert (=> start!31062 (array_inv!5527 a!3293)))

(assert (=> start!31062 true))

(declare-fun b!312471 () Bool)

(declare-fun res!168928 () Bool)

(assert (=> b!312471 (=> (not res!168928) (not e!194832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312471 (= res!168928 (validKeyInArray!0 k!2441))))

(declare-fun b!312472 () Bool)

(assert (=> b!312472 (= e!194836 e!194834)))

(declare-fun res!168929 () Bool)

(assert (=> b!312472 (=> (not res!168929) (not e!194834))))

(assert (=> b!312472 (= res!168929 (and (= lt!153055 lt!153053) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7564 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312472 (= lt!153055 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312473 () Bool)

(assert (=> b!312473 (= e!194832 e!194836)))

(declare-fun res!168924 () Bool)

(assert (=> b!312473 (=> (not res!168924) (not e!194836))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312473 (= res!168924 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153053))))

(assert (=> b!312473 (= lt!153053 (Intermediate!2704 false resIndex!52 resX!52))))

(declare-fun b!312474 () Bool)

(assert (=> b!312474 (= e!194835 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!312474 (= lt!153050 lt!153051)))

(declare-datatypes ((Unit!9639 0))(
  ( (Unit!9640) )
))
(declare-fun lt!153052 () Unit!9639)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15964 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9639)

(assert (=> b!312474 (= lt!153052 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153056 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312475 () Bool)

(declare-fun res!168925 () Bool)

(assert (=> b!312475 (=> (not res!168925) (not e!194832))))

(declare-fun arrayContainsKey!0 (array!15964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312475 (= res!168925 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312476 () Bool)

(declare-fun res!168927 () Bool)

(assert (=> b!312476 (=> (not res!168927) (not e!194832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15964 (_ BitVec 32)) Bool)

(assert (=> b!312476 (= res!168927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31062 res!168923) b!312470))

(assert (= (and b!312470 res!168926) b!312471))

(assert (= (and b!312471 res!168928) b!312475))

(assert (= (and b!312475 res!168925) b!312469))

(assert (= (and b!312469 res!168930) b!312476))

(assert (= (and b!312476 res!168927) b!312473))

(assert (= (and b!312473 res!168924) b!312468))

(assert (= (and b!312468 res!168921) b!312472))

(assert (= (and b!312472 res!168929) b!312467))

(assert (= (and b!312467 (not res!168922)) b!312474))

(declare-fun m!322555 () Bool)

(assert (=> b!312468 m!322555))

(declare-fun m!322557 () Bool)

(assert (=> b!312467 m!322557))

(declare-fun m!322559 () Bool)

(assert (=> b!312467 m!322559))

(declare-fun m!322561 () Bool)

(assert (=> b!312467 m!322561))

(declare-fun m!322563 () Bool)

(assert (=> b!312467 m!322563))

(declare-fun m!322565 () Bool)

(assert (=> b!312467 m!322565))

(declare-fun m!322567 () Bool)

(assert (=> start!31062 m!322567))

(declare-fun m!322569 () Bool)

(assert (=> start!31062 m!322569))

(declare-fun m!322571 () Bool)

(assert (=> b!312473 m!322571))

(assert (=> b!312473 m!322571))

(declare-fun m!322573 () Bool)

(assert (=> b!312473 m!322573))

(declare-fun m!322575 () Bool)

(assert (=> b!312472 m!322575))

(declare-fun m!322577 () Bool)

(assert (=> b!312472 m!322577))

(declare-fun m!322579 () Bool)

(assert (=> b!312469 m!322579))

(declare-fun m!322581 () Bool)

(assert (=> b!312471 m!322581))

(declare-fun m!322583 () Bool)

(assert (=> b!312475 m!322583))

(declare-fun m!322585 () Bool)

(assert (=> b!312474 m!322585))

(declare-fun m!322587 () Bool)

(assert (=> b!312476 m!322587))

(push 1)

(assert (not b!312473))

(assert (not b!312474))

(assert (not b!312472))

(assert (not b!312475))

(assert (not b!312467))

(assert (not b!312476))

(assert (not b!312471))

(assert (not start!31062))

(assert (not b!312469))

(check-sat)

