; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32408 () Bool)

(assert start!32408)

(declare-fun b!323396 () Bool)

(declare-datatypes ((Unit!9997 0))(
  ( (Unit!9998) )
))
(declare-fun e!199919 () Unit!9997)

(declare-fun e!199918 () Unit!9997)

(assert (=> b!323396 (= e!199919 e!199918)))

(declare-fun c!50851 () Bool)

(declare-datatypes ((array!16547 0))(
  ( (array!16548 (arr!7831 (Array (_ BitVec 32) (_ BitVec 64))) (size!8183 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16547)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!323396 (= c!50851 (or (= (select (arr!7831 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7831 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323397 () Bool)

(declare-fun res!176956 () Bool)

(declare-fun e!199920 () Bool)

(assert (=> b!323397 (=> (not res!176956) (not e!199920))))

(declare-datatypes ((SeekEntryResult!2962 0))(
  ( (MissingZero!2962 (index!14024 (_ BitVec 32))) (Found!2962 (index!14025 (_ BitVec 32))) (Intermediate!2962 (undefined!3774 Bool) (index!14026 (_ BitVec 32)) (x!32278 (_ BitVec 32))) (Undefined!2962) (MissingVacant!2962 (index!14027 (_ BitVec 32))) )
))
(declare-fun lt!156628 () SeekEntryResult!2962)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16547 (_ BitVec 32)) SeekEntryResult!2962)

(assert (=> b!323397 (= res!176956 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156628))))

(declare-fun b!323398 () Bool)

(assert (=> b!323398 false))

(declare-fun Unit!9999 () Unit!9997)

(assert (=> b!323398 (= e!199918 Unit!9999)))

(declare-fun b!323399 () Bool)

(declare-fun e!199916 () Bool)

(assert (=> b!323399 (= e!199916 e!199920)))

(declare-fun res!176950 () Bool)

(assert (=> b!323399 (=> (not res!176950) (not e!199920))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323399 (= res!176950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156628))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323399 (= lt!156628 (Intermediate!2962 false resIndex!58 resX!58))))

(declare-fun b!323400 () Bool)

(declare-fun res!176951 () Bool)

(assert (=> b!323400 (=> (not res!176951) (not e!199916))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16547 (_ BitVec 32)) SeekEntryResult!2962)

(assert (=> b!323400 (= res!176951 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2962 i!1250)))))

(declare-fun b!323401 () Bool)

(declare-fun e!199921 () Unit!9997)

(declare-fun Unit!10000 () Unit!9997)

(assert (=> b!323401 (= e!199921 Unit!10000)))

(declare-fun b!323402 () Bool)

(assert (=> b!323402 (= e!199920 (not (or (not (= (select (arr!7831 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!323402 (= index!1840 resIndex!58)))

(declare-fun lt!156629 () Unit!9997)

(assert (=> b!323402 (= lt!156629 e!199919)))

(declare-fun c!50853 () Bool)

(assert (=> b!323402 (= c!50853 (not (= resIndex!58 index!1840)))))

(declare-fun b!323403 () Bool)

(declare-fun res!176955 () Bool)

(assert (=> b!323403 (=> (not res!176955) (not e!199916))))

(assert (=> b!323403 (= res!176955 (and (= (size!8183 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8183 a!3305))))))

(declare-fun b!323404 () Bool)

(declare-fun res!176957 () Bool)

(assert (=> b!323404 (=> (not res!176957) (not e!199916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16547 (_ BitVec 32)) Bool)

(assert (=> b!323404 (= res!176957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323405 () Bool)

(declare-fun Unit!10001 () Unit!9997)

(assert (=> b!323405 (= e!199921 Unit!10001)))

(assert (=> b!323405 false))

(declare-fun b!323406 () Bool)

(declare-fun Unit!10002 () Unit!9997)

(assert (=> b!323406 (= e!199919 Unit!10002)))

(declare-fun res!176949 () Bool)

(assert (=> start!32408 (=> (not res!176949) (not e!199916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32408 (= res!176949 (validMask!0 mask!3777))))

(assert (=> start!32408 e!199916))

(declare-fun array_inv!5794 (array!16547) Bool)

(assert (=> start!32408 (array_inv!5794 a!3305)))

(assert (=> start!32408 true))

(declare-fun b!323407 () Bool)

(declare-fun res!176952 () Bool)

(assert (=> b!323407 (=> (not res!176952) (not e!199920))))

(assert (=> b!323407 (= res!176952 (and (= (select (arr!7831 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8183 a!3305))))))

(declare-fun b!323408 () Bool)

(assert (=> b!323408 false))

(declare-fun lt!156630 () Unit!9997)

(assert (=> b!323408 (= lt!156630 e!199921)))

(declare-fun c!50852 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323408 (= c!50852 (is-Intermediate!2962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10003 () Unit!9997)

(assert (=> b!323408 (= e!199918 Unit!10003)))

(declare-fun b!323409 () Bool)

(declare-fun res!176953 () Bool)

(assert (=> b!323409 (=> (not res!176953) (not e!199916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323409 (= res!176953 (validKeyInArray!0 k!2497))))

(declare-fun b!323410 () Bool)

(declare-fun res!176954 () Bool)

(assert (=> b!323410 (=> (not res!176954) (not e!199916))))

(declare-fun arrayContainsKey!0 (array!16547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323410 (= res!176954 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323411 () Bool)

(declare-fun res!176958 () Bool)

(assert (=> b!323411 (=> (not res!176958) (not e!199920))))

(assert (=> b!323411 (= res!176958 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7831 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(assert (= (and start!32408 res!176949) b!323403))

(assert (= (and b!323403 res!176955) b!323409))

(assert (= (and b!323409 res!176953) b!323410))

(assert (= (and b!323410 res!176954) b!323400))

(assert (= (and b!323400 res!176951) b!323404))

(assert (= (and b!323404 res!176957) b!323399))

(assert (= (and b!323399 res!176950) b!323407))

(assert (= (and b!323407 res!176952) b!323397))

(assert (= (and b!323397 res!176956) b!323411))

(assert (= (and b!323411 res!176958) b!323402))

(assert (= (and b!323402 c!50853) b!323396))

(assert (= (and b!323402 (not c!50853)) b!323406))

(assert (= (and b!323396 c!50851) b!323398))

(assert (= (and b!323396 (not c!50851)) b!323408))

(assert (= (and b!323408 c!50852) b!323401))

(assert (= (and b!323408 (not c!50852)) b!323405))

(declare-fun m!330795 () Bool)

(assert (=> b!323396 m!330795))

(assert (=> b!323402 m!330795))

(declare-fun m!330797 () Bool)

(assert (=> start!32408 m!330797))

(declare-fun m!330799 () Bool)

(assert (=> start!32408 m!330799))

(declare-fun m!330801 () Bool)

(assert (=> b!323404 m!330801))

(declare-fun m!330803 () Bool)

(assert (=> b!323399 m!330803))

(assert (=> b!323399 m!330803))

(declare-fun m!330805 () Bool)

(assert (=> b!323399 m!330805))

(assert (=> b!323411 m!330795))

(declare-fun m!330807 () Bool)

(assert (=> b!323410 m!330807))

(declare-fun m!330809 () Bool)

(assert (=> b!323408 m!330809))

(assert (=> b!323408 m!330809))

(declare-fun m!330811 () Bool)

(assert (=> b!323408 m!330811))

(declare-fun m!330813 () Bool)

(assert (=> b!323400 m!330813))

(declare-fun m!330815 () Bool)

(assert (=> b!323397 m!330815))

(declare-fun m!330817 () Bool)

(assert (=> b!323407 m!330817))

(declare-fun m!330819 () Bool)

(assert (=> b!323409 m!330819))

(push 1)

(assert (not b!323400))

(assert (not b!323404))

(assert (not b!323408))

(assert (not start!32408))

