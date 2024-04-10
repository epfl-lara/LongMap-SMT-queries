; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33220 () Bool)

(assert start!33220)

(declare-fun b!330410 () Bool)

(declare-fun res!182091 () Bool)

(declare-fun e!202824 () Bool)

(assert (=> b!330410 (=> (not res!182091) (not e!202824))))

(declare-datatypes ((array!16879 0))(
  ( (array!16880 (arr!7982 (Array (_ BitVec 32) (_ BitVec 64))) (size!8334 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16879)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330410 (= res!182091 (and (= (select (arr!7982 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8334 a!3305))))))

(declare-fun b!330411 () Bool)

(declare-fun res!182086 () Bool)

(assert (=> b!330411 (=> (not res!182086) (not e!202824))))

(declare-fun k!2497 () (_ BitVec 64))

(assert (=> b!330411 (= res!182086 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7982 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330412 () Bool)

(declare-fun res!182087 () Bool)

(declare-fun e!202825 () Bool)

(assert (=> b!330412 (=> (not res!182087) (not e!202825))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!330412 (= res!182087 (and (= (size!8334 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8334 a!3305))))))

(declare-fun b!330413 () Bool)

(assert (=> b!330413 false))

(declare-datatypes ((Unit!10281 0))(
  ( (Unit!10282) )
))
(declare-fun lt!158507 () Unit!10281)

(declare-fun e!202820 () Unit!10281)

(assert (=> b!330413 (= lt!158507 e!202820)))

(declare-fun c!51807 () Bool)

(declare-datatypes ((SeekEntryResult!3113 0))(
  ( (MissingZero!3113 (index!14628 (_ BitVec 32))) (Found!3113 (index!14629 (_ BitVec 32))) (Intermediate!3113 (undefined!3925 Bool) (index!14630 (_ BitVec 32)) (x!32912 (_ BitVec 32))) (Undefined!3113) (MissingVacant!3113 (index!14631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16879 (_ BitVec 32)) SeekEntryResult!3113)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330413 (= c!51807 (is-Intermediate!3113 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!202822 () Unit!10281)

(declare-fun Unit!10283 () Unit!10281)

(assert (=> b!330413 (= e!202822 Unit!10283)))

(declare-fun res!182092 () Bool)

(assert (=> start!33220 (=> (not res!182092) (not e!202825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33220 (= res!182092 (validMask!0 mask!3777))))

(assert (=> start!33220 e!202825))

(declare-fun array_inv!5945 (array!16879) Bool)

(assert (=> start!33220 (array_inv!5945 a!3305)))

(assert (=> start!33220 true))

(declare-fun b!330414 () Bool)

(assert (=> b!330414 (= e!202824 (not true))))

(assert (=> b!330414 (= index!1840 resIndex!58)))

(declare-fun lt!158506 () Unit!10281)

(declare-fun e!202823 () Unit!10281)

(assert (=> b!330414 (= lt!158506 e!202823)))

(declare-fun c!51805 () Bool)

(assert (=> b!330414 (= c!51805 (not (= resIndex!58 index!1840)))))

(declare-fun b!330415 () Bool)

(declare-fun res!182089 () Bool)

(assert (=> b!330415 (=> (not res!182089) (not e!202825))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16879 (_ BitVec 32)) SeekEntryResult!3113)

(assert (=> b!330415 (= res!182089 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3113 i!1250)))))

(declare-fun b!330416 () Bool)

(declare-fun Unit!10284 () Unit!10281)

(assert (=> b!330416 (= e!202823 Unit!10284)))

(declare-fun b!330417 () Bool)

(declare-fun res!182093 () Bool)

(assert (=> b!330417 (=> (not res!182093) (not e!202825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330417 (= res!182093 (validKeyInArray!0 k!2497))))

(declare-fun b!330418 () Bool)

(declare-fun Unit!10285 () Unit!10281)

(assert (=> b!330418 (= e!202820 Unit!10285)))

(declare-fun b!330419 () Bool)

(assert (=> b!330419 false))

(declare-fun Unit!10286 () Unit!10281)

(assert (=> b!330419 (= e!202822 Unit!10286)))

(declare-fun b!330420 () Bool)

(declare-fun res!182094 () Bool)

(assert (=> b!330420 (=> (not res!182094) (not e!202825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16879 (_ BitVec 32)) Bool)

(assert (=> b!330420 (= res!182094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330421 () Bool)

(declare-fun res!182085 () Bool)

(assert (=> b!330421 (=> (not res!182085) (not e!202824))))

(declare-fun lt!158508 () SeekEntryResult!3113)

(assert (=> b!330421 (= res!182085 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158508))))

(declare-fun b!330422 () Bool)

(declare-fun Unit!10287 () Unit!10281)

(assert (=> b!330422 (= e!202820 Unit!10287)))

(assert (=> b!330422 false))

(declare-fun b!330423 () Bool)

(assert (=> b!330423 (= e!202825 e!202824)))

(declare-fun res!182088 () Bool)

(assert (=> b!330423 (=> (not res!182088) (not e!202824))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330423 (= res!182088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158508))))

(assert (=> b!330423 (= lt!158508 (Intermediate!3113 false resIndex!58 resX!58))))

(declare-fun b!330424 () Bool)

(assert (=> b!330424 (= e!202823 e!202822)))

(declare-fun c!51806 () Bool)

(assert (=> b!330424 (= c!51806 (or (= (select (arr!7982 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7982 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330425 () Bool)

(declare-fun res!182090 () Bool)

(assert (=> b!330425 (=> (not res!182090) (not e!202825))))

(declare-fun arrayContainsKey!0 (array!16879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330425 (= res!182090 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33220 res!182092) b!330412))

(assert (= (and b!330412 res!182087) b!330417))

(assert (= (and b!330417 res!182093) b!330425))

(assert (= (and b!330425 res!182090) b!330415))

(assert (= (and b!330415 res!182089) b!330420))

(assert (= (and b!330420 res!182094) b!330423))

(assert (= (and b!330423 res!182088) b!330410))

(assert (= (and b!330410 res!182091) b!330421))

(assert (= (and b!330421 res!182085) b!330411))

(assert (= (and b!330411 res!182086) b!330414))

(assert (= (and b!330414 c!51805) b!330424))

(assert (= (and b!330414 (not c!51805)) b!330416))

(assert (= (and b!330424 c!51806) b!330419))

(assert (= (and b!330424 (not c!51806)) b!330413))

(assert (= (and b!330413 c!51807) b!330418))

(assert (= (and b!330413 (not c!51807)) b!330422))

(declare-fun m!335657 () Bool)

(assert (=> b!330423 m!335657))

(assert (=> b!330423 m!335657))

(declare-fun m!335659 () Bool)

(assert (=> b!330423 m!335659))

(declare-fun m!335661 () Bool)

(assert (=> b!330425 m!335661))

(declare-fun m!335663 () Bool)

(assert (=> b!330413 m!335663))

(assert (=> b!330413 m!335663))

(declare-fun m!335665 () Bool)

(assert (=> b!330413 m!335665))

(declare-fun m!335667 () Bool)

(assert (=> b!330410 m!335667))

(declare-fun m!335669 () Bool)

(assert (=> b!330417 m!335669))

(declare-fun m!335671 () Bool)

(assert (=> b!330424 m!335671))

(declare-fun m!335673 () Bool)

(assert (=> start!33220 m!335673))

(declare-fun m!335675 () Bool)

(assert (=> start!33220 m!335675))

(declare-fun m!335677 () Bool)

(assert (=> b!330420 m!335677))

(assert (=> b!330411 m!335671))

(declare-fun m!335679 () Bool)

(assert (=> b!330415 m!335679))

(declare-fun m!335681 () Bool)

(assert (=> b!330421 m!335681))

(push 1)

