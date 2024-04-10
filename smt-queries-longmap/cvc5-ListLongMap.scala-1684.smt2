; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30992 () Bool)

(assert start!30992)

(declare-fun b!311417 () Bool)

(declare-fun res!167878 () Bool)

(declare-fun e!194310 () Bool)

(assert (=> b!311417 (=> (not res!167878) (not e!194310))))

(declare-datatypes ((array!15894 0))(
  ( (array!15895 (arr!7529 (Array (_ BitVec 32) (_ BitVec 64))) (size!7881 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15894)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311417 (= res!167878 (and (= (size!7881 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7881 a!3293))))))

(declare-fun b!311418 () Bool)

(declare-fun res!167874 () Bool)

(assert (=> b!311418 (=> (not res!167874) (not e!194310))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2669 0))(
  ( (MissingZero!2669 (index!12852 (_ BitVec 32))) (Found!2669 (index!12853 (_ BitVec 32))) (Intermediate!2669 (undefined!3481 Bool) (index!12854 (_ BitVec 32)) (x!31074 (_ BitVec 32))) (Undefined!2669) (MissingVacant!2669 (index!12855 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15894 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!311418 (= res!167874 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2669 i!1240)))))

(declare-fun b!311419 () Bool)

(declare-fun res!167880 () Bool)

(assert (=> b!311419 (=> (not res!167880) (not e!194310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311419 (= res!167880 (validKeyInArray!0 k!2441))))

(declare-fun b!311420 () Bool)

(declare-fun res!167877 () Bool)

(assert (=> b!311420 (=> (not res!167877) (not e!194310))))

(declare-fun arrayContainsKey!0 (array!15894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311420 (= res!167877 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311421 () Bool)

(declare-fun e!194309 () Bool)

(assert (=> b!311421 (= e!194309 (not true))))

(declare-fun e!194307 () Bool)

(assert (=> b!311421 e!194307))

(declare-fun res!167875 () Bool)

(assert (=> b!311421 (=> (not res!167875) (not e!194307))))

(declare-fun lt!152348 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152347 () SeekEntryResult!2669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15894 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!311421 (= res!167875 (= lt!152347 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152348 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311421 (= lt!152348 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311422 () Bool)

(declare-fun lt!152349 () array!15894)

(assert (=> b!311422 (= e!194307 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152349 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152348 k!2441 lt!152349 mask!3709)))))

(assert (=> b!311422 (= lt!152349 (array!15895 (store (arr!7529 a!3293) i!1240 k!2441) (size!7881 a!3293)))))

(declare-fun res!167871 () Bool)

(assert (=> start!30992 (=> (not res!167871) (not e!194310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30992 (= res!167871 (validMask!0 mask!3709))))

(assert (=> start!30992 e!194310))

(declare-fun array_inv!5492 (array!15894) Bool)

(assert (=> start!30992 (array_inv!5492 a!3293)))

(assert (=> start!30992 true))

(declare-fun b!311423 () Bool)

(declare-fun e!194311 () Bool)

(assert (=> b!311423 (= e!194310 e!194311)))

(declare-fun res!167876 () Bool)

(assert (=> b!311423 (=> (not res!167876) (not e!194311))))

(declare-fun lt!152346 () SeekEntryResult!2669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311423 (= res!167876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152346))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311423 (= lt!152346 (Intermediate!2669 false resIndex!52 resX!52))))

(declare-fun b!311424 () Bool)

(assert (=> b!311424 (= e!194311 e!194309)))

(declare-fun res!167879 () Bool)

(assert (=> b!311424 (=> (not res!167879) (not e!194309))))

(assert (=> b!311424 (= res!167879 (and (= lt!152347 lt!152346) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7529 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311424 (= lt!152347 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311425 () Bool)

(declare-fun res!167872 () Bool)

(assert (=> b!311425 (=> (not res!167872) (not e!194311))))

(assert (=> b!311425 (= res!167872 (and (= (select (arr!7529 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7881 a!3293))))))

(declare-fun b!311426 () Bool)

(declare-fun res!167873 () Bool)

(assert (=> b!311426 (=> (not res!167873) (not e!194310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15894 (_ BitVec 32)) Bool)

(assert (=> b!311426 (= res!167873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30992 res!167871) b!311417))

(assert (= (and b!311417 res!167878) b!311419))

(assert (= (and b!311419 res!167880) b!311420))

(assert (= (and b!311420 res!167877) b!311418))

(assert (= (and b!311418 res!167874) b!311426))

(assert (= (and b!311426 res!167873) b!311423))

(assert (= (and b!311423 res!167876) b!311425))

(assert (= (and b!311425 res!167872) b!311424))

(assert (= (and b!311424 res!167879) b!311421))

(assert (= (and b!311421 res!167875) b!311422))

(declare-fun m!321389 () Bool)

(assert (=> b!311422 m!321389))

(declare-fun m!321391 () Bool)

(assert (=> b!311422 m!321391))

(declare-fun m!321393 () Bool)

(assert (=> b!311422 m!321393))

(declare-fun m!321395 () Bool)

(assert (=> b!311420 m!321395))

(declare-fun m!321397 () Bool)

(assert (=> b!311426 m!321397))

(declare-fun m!321399 () Bool)

(assert (=> b!311425 m!321399))

(declare-fun m!321401 () Bool)

(assert (=> b!311418 m!321401))

(declare-fun m!321403 () Bool)

(assert (=> start!30992 m!321403))

(declare-fun m!321405 () Bool)

(assert (=> start!30992 m!321405))

(declare-fun m!321407 () Bool)

(assert (=> b!311423 m!321407))

(assert (=> b!311423 m!321407))

(declare-fun m!321409 () Bool)

(assert (=> b!311423 m!321409))

(declare-fun m!321411 () Bool)

(assert (=> b!311421 m!321411))

(declare-fun m!321413 () Bool)

(assert (=> b!311421 m!321413))

(declare-fun m!321415 () Bool)

(assert (=> b!311424 m!321415))

(declare-fun m!321417 () Bool)

(assert (=> b!311424 m!321417))

(declare-fun m!321419 () Bool)

(assert (=> b!311419 m!321419))

(push 1)

