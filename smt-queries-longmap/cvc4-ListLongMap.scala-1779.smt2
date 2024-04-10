; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32378 () Bool)

(assert start!32378)

(declare-fun b!322676 () Bool)

(declare-fun res!176504 () Bool)

(declare-fun e!199648 () Bool)

(assert (=> b!322676 (=> (not res!176504) (not e!199648))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322676 (= res!176504 (validKeyInArray!0 k!2497))))

(declare-fun b!322677 () Bool)

(declare-fun e!199647 () Bool)

(assert (=> b!322677 (= e!199648 e!199647)))

(declare-fun res!176506 () Bool)

(assert (=> b!322677 (=> (not res!176506) (not e!199647))))

(declare-datatypes ((array!16517 0))(
  ( (array!16518 (arr!7816 (Array (_ BitVec 32) (_ BitVec 64))) (size!8168 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16517)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2947 0))(
  ( (MissingZero!2947 (index!13964 (_ BitVec 32))) (Found!2947 (index!13965 (_ BitVec 32))) (Intermediate!2947 (undefined!3759 Bool) (index!13966 (_ BitVec 32)) (x!32223 (_ BitVec 32))) (Undefined!2947) (MissingVacant!2947 (index!13967 (_ BitVec 32))) )
))
(declare-fun lt!156494 () SeekEntryResult!2947)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16517 (_ BitVec 32)) SeekEntryResult!2947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322677 (= res!176506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156494))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322677 (= lt!156494 (Intermediate!2947 false resIndex!58 resX!58))))

(declare-fun b!322678 () Bool)

(declare-datatypes ((Unit!9892 0))(
  ( (Unit!9893) )
))
(declare-fun e!199651 () Unit!9892)

(declare-fun Unit!9894 () Unit!9892)

(assert (=> b!322678 (= e!199651 Unit!9894)))

(assert (=> b!322678 false))

(declare-fun b!322679 () Bool)

(declare-fun res!176505 () Bool)

(assert (=> b!322679 (=> (not res!176505) (not e!199648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16517 (_ BitVec 32)) Bool)

(assert (=> b!322679 (= res!176505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322680 () Bool)

(declare-fun e!199649 () Unit!9892)

(declare-fun Unit!9895 () Unit!9892)

(assert (=> b!322680 (= e!199649 Unit!9895)))

(declare-fun b!322681 () Bool)

(declare-fun e!199646 () Unit!9892)

(assert (=> b!322681 (= e!199649 e!199646)))

(declare-fun c!50716 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!322681 (= c!50716 (or (= (select (arr!7816 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7816 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322682 () Bool)

(declare-fun res!176501 () Bool)

(assert (=> b!322682 (=> (not res!176501) (not e!199647))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322682 (= res!176501 (and (= (select (arr!7816 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8168 a!3305))))))

(declare-fun b!322683 () Bool)

(declare-fun res!176502 () Bool)

(assert (=> b!322683 (=> (not res!176502) (not e!199648))))

(declare-fun arrayContainsKey!0 (array!16517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322683 (= res!176502 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!176503 () Bool)

(assert (=> start!32378 (=> (not res!176503) (not e!199648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32378 (= res!176503 (validMask!0 mask!3777))))

(assert (=> start!32378 e!199648))

(declare-fun array_inv!5779 (array!16517) Bool)

(assert (=> start!32378 (array_inv!5779 a!3305)))

(assert (=> start!32378 true))

(declare-fun b!322684 () Bool)

(declare-fun res!176499 () Bool)

(assert (=> b!322684 (=> (not res!176499) (not e!199648))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16517 (_ BitVec 32)) SeekEntryResult!2947)

(assert (=> b!322684 (= res!176499 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2947 i!1250)))))

(declare-fun b!322685 () Bool)

(declare-fun res!176500 () Bool)

(assert (=> b!322685 (=> (not res!176500) (not e!199648))))

(assert (=> b!322685 (= res!176500 (and (= (size!8168 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8168 a!3305))))))

(declare-fun b!322686 () Bool)

(declare-fun Unit!9896 () Unit!9892)

(assert (=> b!322686 (= e!199651 Unit!9896)))

(declare-fun b!322687 () Bool)

(declare-fun res!176508 () Bool)

(assert (=> b!322687 (=> (not res!176508) (not e!199647))))

(assert (=> b!322687 (= res!176508 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156494))))

(declare-fun b!322688 () Bool)

(assert (=> b!322688 false))

(declare-fun lt!156495 () Unit!9892)

(assert (=> b!322688 (= lt!156495 e!199651)))

(declare-fun c!50718 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322688 (= c!50718 (is-Intermediate!2947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9897 () Unit!9892)

(assert (=> b!322688 (= e!199646 Unit!9897)))

(declare-fun b!322689 () Bool)

(declare-fun res!176507 () Bool)

(assert (=> b!322689 (=> (not res!176507) (not e!199647))))

(assert (=> b!322689 (= res!176507 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7816 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322690 () Bool)

(assert (=> b!322690 false))

(declare-fun Unit!9898 () Unit!9892)

(assert (=> b!322690 (= e!199646 Unit!9898)))

(declare-fun b!322691 () Bool)

(assert (=> b!322691 (= e!199647 (not true))))

(assert (=> b!322691 (= index!1840 resIndex!58)))

(declare-fun lt!156493 () Unit!9892)

(assert (=> b!322691 (= lt!156493 e!199649)))

(declare-fun c!50717 () Bool)

(assert (=> b!322691 (= c!50717 (not (= resIndex!58 index!1840)))))

(assert (= (and start!32378 res!176503) b!322685))

(assert (= (and b!322685 res!176500) b!322676))

(assert (= (and b!322676 res!176504) b!322683))

(assert (= (and b!322683 res!176502) b!322684))

(assert (= (and b!322684 res!176499) b!322679))

(assert (= (and b!322679 res!176505) b!322677))

(assert (= (and b!322677 res!176506) b!322682))

(assert (= (and b!322682 res!176501) b!322687))

(assert (= (and b!322687 res!176508) b!322689))

(assert (= (and b!322689 res!176507) b!322691))

(assert (= (and b!322691 c!50717) b!322681))

(assert (= (and b!322691 (not c!50717)) b!322680))

(assert (= (and b!322681 c!50716) b!322690))

(assert (= (and b!322681 (not c!50716)) b!322688))

(assert (= (and b!322688 c!50718) b!322686))

(assert (= (and b!322688 (not c!50718)) b!322678))

(declare-fun m!330405 () Bool)

(assert (=> b!322682 m!330405))

(declare-fun m!330407 () Bool)

(assert (=> b!322688 m!330407))

(assert (=> b!322688 m!330407))

(declare-fun m!330409 () Bool)

(assert (=> b!322688 m!330409))

(declare-fun m!330411 () Bool)

(assert (=> b!322684 m!330411))

(declare-fun m!330413 () Bool)

(assert (=> b!322679 m!330413))

(declare-fun m!330415 () Bool)

(assert (=> b!322677 m!330415))

(assert (=> b!322677 m!330415))

(declare-fun m!330417 () Bool)

(assert (=> b!322677 m!330417))

(declare-fun m!330419 () Bool)

(assert (=> b!322689 m!330419))

(declare-fun m!330421 () Bool)

(assert (=> b!322676 m!330421))

(declare-fun m!330423 () Bool)

(assert (=> start!32378 m!330423))

(declare-fun m!330425 () Bool)

(assert (=> start!32378 m!330425))

(declare-fun m!330427 () Bool)

(assert (=> b!322687 m!330427))

(declare-fun m!330429 () Bool)

(assert (=> b!322683 m!330429))

(assert (=> b!322681 m!330419))

(push 1)

