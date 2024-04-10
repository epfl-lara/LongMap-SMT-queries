; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32684 () Bool)

(assert start!32684)

(declare-fun b!326561 () Bool)

(declare-fun res!179600 () Bool)

(declare-fun e!201062 () Bool)

(assert (=> b!326561 (=> (not res!179600) (not e!201062))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326561 (= res!179600 (validKeyInArray!0 k!2497))))

(declare-fun b!326562 () Bool)

(declare-fun res!179601 () Bool)

(assert (=> b!326562 (=> (not res!179601) (not e!201062))))

(declare-datatypes ((array!16721 0))(
  ( (array!16722 (arr!7915 (Array (_ BitVec 32) (_ BitVec 64))) (size!8267 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16721)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3046 0))(
  ( (MissingZero!3046 (index!14360 (_ BitVec 32))) (Found!3046 (index!14361 (_ BitVec 32))) (Intermediate!3046 (undefined!3858 Bool) (index!14362 (_ BitVec 32)) (x!32604 (_ BitVec 32))) (Undefined!3046) (MissingVacant!3046 (index!14363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16721 (_ BitVec 32)) SeekEntryResult!3046)

(assert (=> b!326562 (= res!179601 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3046 i!1250)))))

(declare-fun b!326563 () Bool)

(declare-fun res!179599 () Bool)

(assert (=> b!326563 (=> (not res!179599) (not e!201062))))

(assert (=> b!326563 (= res!179599 (and (= (size!8267 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8267 a!3305))))))

(declare-fun e!201063 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!326564 () Bool)

(assert (=> b!326564 (= e!201063 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10126 0))(
  ( (Unit!10127) )
))
(declare-fun lt!157350 () Unit!10126)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10126)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326564 (= lt!157350 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326565 () Bool)

(declare-fun res!179598 () Bool)

(assert (=> b!326565 (=> (not res!179598) (not e!201063))))

(assert (=> b!326565 (= res!179598 (and (= (select (arr!7915 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8267 a!3305))))))

(declare-fun res!179596 () Bool)

(assert (=> start!32684 (=> (not res!179596) (not e!201062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32684 (= res!179596 (validMask!0 mask!3777))))

(assert (=> start!32684 e!201062))

(declare-fun array_inv!5878 (array!16721) Bool)

(assert (=> start!32684 (array_inv!5878 a!3305)))

(assert (=> start!32684 true))

(declare-fun b!326566 () Bool)

(declare-fun res!179597 () Bool)

(assert (=> b!326566 (=> (not res!179597) (not e!201063))))

(declare-fun lt!157349 () SeekEntryResult!3046)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16721 (_ BitVec 32)) SeekEntryResult!3046)

(assert (=> b!326566 (= res!179597 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157349))))

(declare-fun b!326567 () Bool)

(declare-fun res!179594 () Bool)

(assert (=> b!326567 (=> (not res!179594) (not e!201063))))

(assert (=> b!326567 (= res!179594 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7915 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326568 () Bool)

(assert (=> b!326568 (= e!201062 e!201063)))

(declare-fun res!179593 () Bool)

(assert (=> b!326568 (=> (not res!179593) (not e!201063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326568 (= res!179593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157349))))

(assert (=> b!326568 (= lt!157349 (Intermediate!3046 false resIndex!58 resX!58))))

(declare-fun b!326569 () Bool)

(declare-fun res!179595 () Bool)

(assert (=> b!326569 (=> (not res!179595) (not e!201062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16721 (_ BitVec 32)) Bool)

(assert (=> b!326569 (= res!179595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326570 () Bool)

(declare-fun res!179592 () Bool)

(assert (=> b!326570 (=> (not res!179592) (not e!201062))))

(declare-fun arrayContainsKey!0 (array!16721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326570 (= res!179592 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32684 res!179596) b!326563))

(assert (= (and b!326563 res!179599) b!326561))

(assert (= (and b!326561 res!179600) b!326570))

(assert (= (and b!326570 res!179592) b!326562))

(assert (= (and b!326562 res!179601) b!326569))

(assert (= (and b!326569 res!179595) b!326568))

(assert (= (and b!326568 res!179593) b!326565))

(assert (= (and b!326565 res!179598) b!326566))

(assert (= (and b!326566 res!179597) b!326567))

(assert (= (and b!326567 res!179594) b!326564))

(declare-fun m!333093 () Bool)

(assert (=> b!326568 m!333093))

(assert (=> b!326568 m!333093))

(declare-fun m!333095 () Bool)

(assert (=> b!326568 m!333095))

(declare-fun m!333097 () Bool)

(assert (=> b!326561 m!333097))

(declare-fun m!333099 () Bool)

(assert (=> b!326562 m!333099))

(declare-fun m!333101 () Bool)

(assert (=> b!326569 m!333101))

(declare-fun m!333103 () Bool)

(assert (=> b!326570 m!333103))

(declare-fun m!333105 () Bool)

(assert (=> b!326566 m!333105))

(declare-fun m!333107 () Bool)

(assert (=> start!32684 m!333107))

(declare-fun m!333109 () Bool)

(assert (=> start!32684 m!333109))

(declare-fun m!333111 () Bool)

(assert (=> b!326567 m!333111))

(declare-fun m!333113 () Bool)

(assert (=> b!326564 m!333113))

(assert (=> b!326564 m!333113))

(declare-fun m!333115 () Bool)

(assert (=> b!326564 m!333115))

(declare-fun m!333117 () Bool)

(assert (=> b!326565 m!333117))

(push 1)

(assert (not b!326568))

(assert (not b!326566))

(assert (not b!326562))

(assert (not start!32684))

(assert (not b!326570))

(assert (not b!326564))

(assert (not b!326569))

(assert (not b!326561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

