; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28258 () Bool)

(assert start!28258)

(declare-fun b!289477 () Bool)

(assert (=> b!289477 false))

(declare-datatypes ((Unit!9090 0))(
  ( (Unit!9091) )
))
(declare-fun e!183272 () Unit!9090)

(declare-fun Unit!9092 () Unit!9090)

(assert (=> b!289477 (= e!183272 Unit!9092)))

(declare-fun b!289478 () Bool)

(declare-fun e!183269 () Unit!9090)

(declare-fun Unit!9093 () Unit!9090)

(assert (=> b!289478 (= e!183269 Unit!9093)))

(assert (=> b!289478 false))

(declare-fun b!289479 () Bool)

(declare-fun res!151074 () Bool)

(declare-fun e!183268 () Bool)

(assert (=> b!289479 (=> (not res!151074) (not e!183268))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14572 0))(
  ( (array!14573 (arr!6913 (Array (_ BitVec 32) (_ BitVec 64))) (size!7265 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14572)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289479 (= res!151074 (and (= (size!7265 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7265 a!3312))))))

(declare-datatypes ((SeekEntryResult!2062 0))(
  ( (MissingZero!2062 (index!10418 (_ BitVec 32))) (Found!2062 (index!10419 (_ BitVec 32))) (Intermediate!2062 (undefined!2874 Bool) (index!10420 (_ BitVec 32)) (x!28619 (_ BitVec 32))) (Undefined!2062) (MissingVacant!2062 (index!10421 (_ BitVec 32))) )
))
(declare-fun lt!142849 () SeekEntryResult!2062)

(declare-fun lt!142851 () SeekEntryResult!2062)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun b!289480 () Bool)

(assert (=> b!289480 (and (= lt!142851 lt!142849) (= (select (store (arr!6913 a!3312) i!1256 k!2524) (index!10420 lt!142849)) k!2524))))

(declare-fun lt!142854 () (_ BitVec 32))

(declare-fun lt!142850 () Unit!9090)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14572 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9090)

(assert (=> b!289480 (= lt!142850 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142854 (index!10420 lt!142849) (x!28619 lt!142849) mask!3809))))

(assert (=> b!289480 (and (= (select (arr!6913 a!3312) (index!10420 lt!142849)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10420 lt!142849) i!1256))))

(declare-fun Unit!9094 () Unit!9090)

(assert (=> b!289480 (= e!183272 Unit!9094)))

(declare-fun b!289482 () Bool)

(declare-fun res!151069 () Bool)

(declare-fun e!183271 () Bool)

(assert (=> b!289482 (=> (not res!151069) (not e!183271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14572 (_ BitVec 32)) Bool)

(assert (=> b!289482 (= res!151069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289483 () Bool)

(assert (=> b!289483 (= e!183269 e!183272)))

(declare-fun c!46767 () Bool)

(assert (=> b!289483 (= c!46767 (is-Intermediate!2062 lt!142849))))

(declare-fun b!289484 () Bool)

(declare-fun res!151073 () Bool)

(assert (=> b!289484 (=> (not res!151073) (not e!183268))))

(declare-fun arrayContainsKey!0 (array!14572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289484 (= res!151073 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289485 () Bool)

(declare-fun e!183267 () Bool)

(assert (=> b!289485 (= e!183271 e!183267)))

(declare-fun res!151072 () Bool)

(assert (=> b!289485 (=> (not res!151072) (not e!183267))))

(declare-fun lt!142852 () Bool)

(assert (=> b!289485 (= res!151072 lt!142852)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14572 (_ BitVec 32)) SeekEntryResult!2062)

(assert (=> b!289485 (= lt!142851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142854 k!2524 (array!14573 (store (arr!6913 a!3312) i!1256 k!2524) (size!7265 a!3312)) mask!3809))))

(assert (=> b!289485 (= lt!142849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142854 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289485 (= lt!142854 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289481 () Bool)

(assert (=> b!289481 (= e!183267 false)))

(declare-fun lt!142853 () Unit!9090)

(assert (=> b!289481 (= lt!142853 e!183269)))

(declare-fun c!46766 () Bool)

(assert (=> b!289481 (= c!46766 (or (and (is-Intermediate!2062 lt!142849) (undefined!2874 lt!142849)) (and (is-Intermediate!2062 lt!142849) (= (select (arr!6913 a!3312) (index!10420 lt!142849)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2062 lt!142849) (= (select (arr!6913 a!3312) (index!10420 lt!142849)) k!2524))))))

(declare-fun res!151071 () Bool)

(assert (=> start!28258 (=> (not res!151071) (not e!183268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28258 (= res!151071 (validMask!0 mask!3809))))

(assert (=> start!28258 e!183268))

(assert (=> start!28258 true))

(declare-fun array_inv!4876 (array!14572) Bool)

(assert (=> start!28258 (array_inv!4876 a!3312)))

(declare-fun b!289486 () Bool)

(assert (=> b!289486 (= e!183268 e!183271)))

(declare-fun res!151068 () Bool)

(assert (=> b!289486 (=> (not res!151068) (not e!183271))))

(declare-fun lt!142855 () SeekEntryResult!2062)

(assert (=> b!289486 (= res!151068 (or lt!142852 (= lt!142855 (MissingVacant!2062 i!1256))))))

(assert (=> b!289486 (= lt!142852 (= lt!142855 (MissingZero!2062 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14572 (_ BitVec 32)) SeekEntryResult!2062)

(assert (=> b!289486 (= lt!142855 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289487 () Bool)

(declare-fun res!151070 () Bool)

(assert (=> b!289487 (=> (not res!151070) (not e!183268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289487 (= res!151070 (validKeyInArray!0 k!2524))))

(assert (= (and start!28258 res!151071) b!289479))

(assert (= (and b!289479 res!151074) b!289487))

(assert (= (and b!289487 res!151070) b!289484))

(assert (= (and b!289484 res!151073) b!289486))

(assert (= (and b!289486 res!151068) b!289482))

(assert (= (and b!289482 res!151069) b!289485))

(assert (= (and b!289485 res!151072) b!289481))

(assert (= (and b!289481 c!46766) b!289478))

(assert (= (and b!289481 (not c!46766)) b!289483))

(assert (= (and b!289483 c!46767) b!289480))

(assert (= (and b!289483 (not c!46767)) b!289477))

(declare-fun m!303607 () Bool)

(assert (=> b!289487 m!303607))

(declare-fun m!303609 () Bool)

(assert (=> b!289482 m!303609))

(declare-fun m!303611 () Bool)

(assert (=> b!289485 m!303611))

(declare-fun m!303613 () Bool)

(assert (=> b!289485 m!303613))

(declare-fun m!303615 () Bool)

(assert (=> b!289485 m!303615))

(declare-fun m!303617 () Bool)

(assert (=> b!289485 m!303617))

(declare-fun m!303619 () Bool)

(assert (=> b!289484 m!303619))

(declare-fun m!303621 () Bool)

(assert (=> b!289486 m!303621))

(assert (=> b!289480 m!303611))

(declare-fun m!303623 () Bool)

(assert (=> b!289480 m!303623))

(declare-fun m!303625 () Bool)

(assert (=> b!289480 m!303625))

(declare-fun m!303627 () Bool)

(assert (=> b!289480 m!303627))

(assert (=> b!289481 m!303627))

(declare-fun m!303629 () Bool)

(assert (=> start!28258 m!303629))

(declare-fun m!303631 () Bool)

(assert (=> start!28258 m!303631))

(push 1)

