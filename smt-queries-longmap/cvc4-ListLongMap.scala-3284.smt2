; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45652 () Bool)

(assert start!45652)

(declare-fun b!503554 () Bool)

(declare-fun res!304845 () Bool)

(declare-fun e!294887 () Bool)

(assert (=> b!503554 (=> (not res!304845) (not e!294887))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503554 (= res!304845 (validKeyInArray!0 k!2280))))

(declare-fun b!503555 () Bool)

(declare-fun res!304843 () Bool)

(declare-fun e!294884 () Bool)

(assert (=> b!503555 (=> res!304843 e!294884)))

(declare-datatypes ((SeekEntryResult!4051 0))(
  ( (MissingZero!4051 (index!18392 (_ BitVec 32))) (Found!4051 (index!18393 (_ BitVec 32))) (Intermediate!4051 (undefined!4863 Bool) (index!18394 (_ BitVec 32)) (x!47412 (_ BitVec 32))) (Undefined!4051) (MissingVacant!4051 (index!18395 (_ BitVec 32))) )
))
(declare-fun lt!229102 () SeekEntryResult!4051)

(assert (=> b!503555 (= res!304843 (or (undefined!4863 lt!229102) (not (is-Intermediate!4051 lt!229102))))))

(declare-fun b!503556 () Bool)

(declare-fun e!294886 () Bool)

(assert (=> b!503556 (= e!294884 e!294886)))

(declare-fun res!304842 () Bool)

(assert (=> b!503556 (=> res!304842 e!294886)))

(declare-fun lt!229099 () (_ BitVec 32))

(declare-datatypes ((array!32408 0))(
  ( (array!32409 (arr!15584 (Array (_ BitVec 32) (_ BitVec 64))) (size!15948 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32408)

(assert (=> b!503556 (= res!304842 (or (bvsgt (x!47412 lt!229102) #b01111111111111111111111111111110) (bvslt lt!229099 #b00000000000000000000000000000000) (bvsge lt!229099 (size!15948 a!3235)) (bvslt (index!18394 lt!229102) #b00000000000000000000000000000000) (bvsge (index!18394 lt!229102) (size!15948 a!3235)) (not (= lt!229102 (Intermediate!4051 false (index!18394 lt!229102) (x!47412 lt!229102))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503556 (= (index!18394 lt!229102) i!1204)))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15280 0))(
  ( (Unit!15281) )
))
(declare-fun lt!229100 () Unit!15280)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15280)

(assert (=> b!503556 (= lt!229100 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229099 #b00000000000000000000000000000000 (index!18394 lt!229102) (x!47412 lt!229102) mask!3524))))

(assert (=> b!503556 (and (or (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229101 () Unit!15280)

(declare-fun e!294885 () Unit!15280)

(assert (=> b!503556 (= lt!229101 e!294885)))

(declare-fun c!59636 () Bool)

(assert (=> b!503556 (= c!59636 (= (select (arr!15584 a!3235) (index!18394 lt!229102)) (select (arr!15584 a!3235) j!176)))))

(assert (=> b!503556 (and (bvslt (x!47412 lt!229102) #b01111111111111111111111111111110) (or (= (select (arr!15584 a!3235) (index!18394 lt!229102)) (select (arr!15584 a!3235) j!176)) (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15584 a!3235) (index!18394 lt!229102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503557 () Bool)

(declare-fun res!304846 () Bool)

(assert (=> b!503557 (=> (not res!304846) (not e!294887))))

(declare-fun arrayContainsKey!0 (array!32408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503557 (= res!304846 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!304851 () Bool)

(assert (=> start!45652 (=> (not res!304851) (not e!294887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45652 (= res!304851 (validMask!0 mask!3524))))

(assert (=> start!45652 e!294887))

(assert (=> start!45652 true))

(declare-fun array_inv!11380 (array!32408) Bool)

(assert (=> start!45652 (array_inv!11380 a!3235)))

(declare-fun b!503558 () Bool)

(declare-fun res!304853 () Bool)

(assert (=> b!503558 (=> res!304853 e!294886)))

(declare-fun e!294888 () Bool)

(assert (=> b!503558 (= res!304853 e!294888)))

(declare-fun res!304847 () Bool)

(assert (=> b!503558 (=> (not res!304847) (not e!294888))))

(assert (=> b!503558 (= res!304847 (bvsgt #b00000000000000000000000000000000 (x!47412 lt!229102)))))

(declare-fun b!503559 () Bool)

(declare-fun Unit!15282 () Unit!15280)

(assert (=> b!503559 (= e!294885 Unit!15282)))

(declare-fun b!503560 () Bool)

(declare-fun res!304839 () Bool)

(declare-fun e!294889 () Bool)

(assert (=> b!503560 (=> (not res!304839) (not e!294889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32408 (_ BitVec 32)) Bool)

(assert (=> b!503560 (= res!304839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503561 () Bool)

(assert (=> b!503561 (= e!294889 (not e!294884))))

(declare-fun res!304849 () Bool)

(assert (=> b!503561 (=> res!304849 e!294884)))

(declare-fun lt!229104 () (_ BitVec 32))

(declare-fun lt!229105 () array!32408)

(declare-fun lt!229108 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503561 (= res!304849 (= lt!229102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229104 lt!229108 lt!229105 mask!3524)))))

(assert (=> b!503561 (= lt!229102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229099 (select (arr!15584 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503561 (= lt!229104 (toIndex!0 lt!229108 mask!3524))))

(assert (=> b!503561 (= lt!229108 (select (store (arr!15584 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503561 (= lt!229099 (toIndex!0 (select (arr!15584 a!3235) j!176) mask!3524))))

(assert (=> b!503561 (= lt!229105 (array!32409 (store (arr!15584 a!3235) i!1204 k!2280) (size!15948 a!3235)))))

(declare-fun e!294890 () Bool)

(assert (=> b!503561 e!294890))

(declare-fun res!304848 () Bool)

(assert (=> b!503561 (=> (not res!304848) (not e!294890))))

(assert (=> b!503561 (= res!304848 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229107 () Unit!15280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15280)

(assert (=> b!503561 (= lt!229107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503562 () Bool)

(declare-fun res!304841 () Bool)

(assert (=> b!503562 (=> (not res!304841) (not e!294887))))

(assert (=> b!503562 (= res!304841 (validKeyInArray!0 (select (arr!15584 a!3235) j!176)))))

(declare-fun b!503563 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503563 (= e!294890 (= (seekEntryOrOpen!0 (select (arr!15584 a!3235) j!176) a!3235 mask!3524) (Found!4051 j!176)))))

(declare-fun b!503564 () Bool)

(declare-fun res!304852 () Bool)

(assert (=> b!503564 (=> (not res!304852) (not e!294887))))

(assert (=> b!503564 (= res!304852 (and (= (size!15948 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15948 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15948 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503565 () Bool)

(declare-fun Unit!15283 () Unit!15280)

(assert (=> b!503565 (= e!294885 Unit!15283)))

(declare-fun lt!229106 () Unit!15280)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32408 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15280)

(assert (=> b!503565 (= lt!229106 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229099 #b00000000000000000000000000000000 (index!18394 lt!229102) (x!47412 lt!229102) mask!3524))))

(declare-fun res!304844 () Bool)

(assert (=> b!503565 (= res!304844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229099 lt!229108 lt!229105 mask!3524) (Intermediate!4051 false (index!18394 lt!229102) (x!47412 lt!229102))))))

(declare-fun e!294883 () Bool)

(assert (=> b!503565 (=> (not res!304844) (not e!294883))))

(assert (=> b!503565 e!294883))

(declare-fun b!503566 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32408 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!503566 (= e!294888 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229099 (index!18394 lt!229102) (select (arr!15584 a!3235) j!176) a!3235 mask!3524) (Found!4051 j!176))))))

(declare-fun b!503567 () Bool)

(assert (=> b!503567 (= e!294883 false)))

(declare-fun b!503568 () Bool)

(assert (=> b!503568 (= e!294886 true)))

(declare-fun lt!229103 () SeekEntryResult!4051)

(assert (=> b!503568 (= lt!229103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229099 lt!229108 lt!229105 mask!3524))))

(declare-fun b!503569 () Bool)

(declare-fun res!304840 () Bool)

(assert (=> b!503569 (=> (not res!304840) (not e!294889))))

(declare-datatypes ((List!9742 0))(
  ( (Nil!9739) (Cons!9738 (h!10615 (_ BitVec 64)) (t!15970 List!9742)) )
))
(declare-fun arrayNoDuplicates!0 (array!32408 (_ BitVec 32) List!9742) Bool)

(assert (=> b!503569 (= res!304840 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9739))))

(declare-fun b!503570 () Bool)

(assert (=> b!503570 (= e!294887 e!294889)))

(declare-fun res!304850 () Bool)

(assert (=> b!503570 (=> (not res!304850) (not e!294889))))

(declare-fun lt!229098 () SeekEntryResult!4051)

(assert (=> b!503570 (= res!304850 (or (= lt!229098 (MissingZero!4051 i!1204)) (= lt!229098 (MissingVacant!4051 i!1204))))))

(assert (=> b!503570 (= lt!229098 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45652 res!304851) b!503564))

(assert (= (and b!503564 res!304852) b!503562))

(assert (= (and b!503562 res!304841) b!503554))

(assert (= (and b!503554 res!304845) b!503557))

(assert (= (and b!503557 res!304846) b!503570))

(assert (= (and b!503570 res!304850) b!503560))

(assert (= (and b!503560 res!304839) b!503569))

(assert (= (and b!503569 res!304840) b!503561))

(assert (= (and b!503561 res!304848) b!503563))

(assert (= (and b!503561 (not res!304849)) b!503555))

(assert (= (and b!503555 (not res!304843)) b!503556))

(assert (= (and b!503556 c!59636) b!503565))

(assert (= (and b!503556 (not c!59636)) b!503559))

(assert (= (and b!503565 res!304844) b!503567))

(assert (= (and b!503556 (not res!304842)) b!503558))

(assert (= (and b!503558 res!304847) b!503566))

(assert (= (and b!503558 (not res!304853)) b!503568))

(declare-fun m!484379 () Bool)

(assert (=> b!503566 m!484379))

(assert (=> b!503566 m!484379))

(declare-fun m!484381 () Bool)

(assert (=> b!503566 m!484381))

(assert (=> b!503562 m!484379))

(assert (=> b!503562 m!484379))

(declare-fun m!484383 () Bool)

(assert (=> b!503562 m!484383))

(assert (=> b!503563 m!484379))

(assert (=> b!503563 m!484379))

(declare-fun m!484385 () Bool)

(assert (=> b!503563 m!484385))

(declare-fun m!484387 () Bool)

(assert (=> b!503565 m!484387))

(declare-fun m!484389 () Bool)

(assert (=> b!503565 m!484389))

(declare-fun m!484391 () Bool)

(assert (=> b!503570 m!484391))

(declare-fun m!484393 () Bool)

(assert (=> b!503556 m!484393))

(declare-fun m!484395 () Bool)

(assert (=> b!503556 m!484395))

(assert (=> b!503556 m!484379))

(declare-fun m!484397 () Bool)

(assert (=> b!503557 m!484397))

(declare-fun m!484399 () Bool)

(assert (=> b!503569 m!484399))

(declare-fun m!484401 () Bool)

(assert (=> b!503560 m!484401))

(declare-fun m!484403 () Bool)

(assert (=> b!503561 m!484403))

(declare-fun m!484405 () Bool)

(assert (=> b!503561 m!484405))

(declare-fun m!484407 () Bool)

(assert (=> b!503561 m!484407))

(declare-fun m!484409 () Bool)

(assert (=> b!503561 m!484409))

(assert (=> b!503561 m!484379))

(declare-fun m!484411 () Bool)

(assert (=> b!503561 m!484411))

(declare-fun m!484413 () Bool)

(assert (=> b!503561 m!484413))

(assert (=> b!503561 m!484379))

(declare-fun m!484415 () Bool)

(assert (=> b!503561 m!484415))

(assert (=> b!503561 m!484379))

(declare-fun m!484417 () Bool)

(assert (=> b!503561 m!484417))

(declare-fun m!484419 () Bool)

(assert (=> start!45652 m!484419))

(declare-fun m!484421 () Bool)

(assert (=> start!45652 m!484421))

(assert (=> b!503568 m!484389))

(declare-fun m!484423 () Bool)

(assert (=> b!503554 m!484423))

(push 1)

