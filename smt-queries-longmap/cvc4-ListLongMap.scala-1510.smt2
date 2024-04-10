; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28594 () Bool)

(assert start!28594)

(declare-fun b!292369 () Bool)

(declare-fun res!153429 () Bool)

(declare-fun e!184988 () Bool)

(assert (=> b!292369 (=> (not res!153429) (not e!184988))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14773 0))(
  ( (array!14774 (arr!7009 (Array (_ BitVec 32) (_ BitVec 64))) (size!7361 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14773)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292369 (= res!153429 (and (= (size!7361 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7361 a!3312))))))

(declare-fun res!153426 () Bool)

(assert (=> start!28594 (=> (not res!153426) (not e!184988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28594 (= res!153426 (validMask!0 mask!3809))))

(assert (=> start!28594 e!184988))

(assert (=> start!28594 true))

(declare-fun array_inv!4972 (array!14773) Bool)

(assert (=> start!28594 (array_inv!4972 a!3312)))

(declare-fun b!292370 () Bool)

(declare-fun e!184987 () Bool)

(assert (=> b!292370 (= e!184987 (not true))))

(declare-datatypes ((SeekEntryResult!2158 0))(
  ( (MissingZero!2158 (index!10802 (_ BitVec 32))) (Found!2158 (index!10803 (_ BitVec 32))) (Intermediate!2158 (undefined!2970 Bool) (index!10804 (_ BitVec 32)) (x!28989 (_ BitVec 32))) (Undefined!2158) (MissingVacant!2158 (index!10805 (_ BitVec 32))) )
))
(declare-fun lt!144796 () SeekEntryResult!2158)

(declare-fun lt!144797 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((Unit!9178 0))(
  ( (Unit!9179) )
))
(declare-fun lt!144798 () Unit!9178)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9178)

(assert (=> b!292370 (= lt!144798 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144797 (index!10804 lt!144796) (x!28989 lt!144796) mask!3809))))

(assert (=> b!292370 (= (index!10804 lt!144796) i!1256)))

(declare-fun b!292371 () Bool)

(declare-fun res!153427 () Bool)

(assert (=> b!292371 (=> (not res!153427) (not e!184988))))

(declare-fun arrayContainsKey!0 (array!14773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292371 (= res!153427 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292372 () Bool)

(declare-fun e!184989 () Bool)

(assert (=> b!292372 (= e!184989 e!184987)))

(declare-fun res!153428 () Bool)

(assert (=> b!292372 (=> (not res!153428) (not e!184987))))

(declare-fun lt!144799 () Bool)

(assert (=> b!292372 (= res!153428 (and (or lt!144799 (not (undefined!2970 lt!144796))) (not lt!144799) (= (select (arr!7009 a!3312) (index!10804 lt!144796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292372 (= lt!144799 (not (is-Intermediate!2158 lt!144796)))))

(declare-fun b!292373 () Bool)

(declare-fun res!153430 () Bool)

(declare-fun e!184990 () Bool)

(assert (=> b!292373 (=> (not res!153430) (not e!184990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14773 (_ BitVec 32)) Bool)

(assert (=> b!292373 (= res!153430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292374 () Bool)

(assert (=> b!292374 (= e!184990 e!184989)))

(declare-fun res!153431 () Bool)

(assert (=> b!292374 (=> (not res!153431) (not e!184989))))

(declare-fun lt!144793 () SeekEntryResult!2158)

(declare-fun lt!144794 () Bool)

(assert (=> b!292374 (= res!153431 (and (not lt!144794) (= lt!144793 (MissingVacant!2158 i!1256))))))

(declare-fun lt!144795 () SeekEntryResult!2158)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14773 (_ BitVec 32)) SeekEntryResult!2158)

(assert (=> b!292374 (= lt!144795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144797 k!2524 (array!14774 (store (arr!7009 a!3312) i!1256 k!2524) (size!7361 a!3312)) mask!3809))))

(assert (=> b!292374 (= lt!144796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144797 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292374 (= lt!144797 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292375 () Bool)

(declare-fun res!153432 () Bool)

(assert (=> b!292375 (=> (not res!153432) (not e!184988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292375 (= res!153432 (validKeyInArray!0 k!2524))))

(declare-fun b!292376 () Bool)

(assert (=> b!292376 (= e!184988 e!184990)))

(declare-fun res!153425 () Bool)

(assert (=> b!292376 (=> (not res!153425) (not e!184990))))

(assert (=> b!292376 (= res!153425 (or lt!144794 (= lt!144793 (MissingVacant!2158 i!1256))))))

(assert (=> b!292376 (= lt!144794 (= lt!144793 (MissingZero!2158 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14773 (_ BitVec 32)) SeekEntryResult!2158)

(assert (=> b!292376 (= lt!144793 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28594 res!153426) b!292369))

(assert (= (and b!292369 res!153429) b!292375))

(assert (= (and b!292375 res!153432) b!292371))

(assert (= (and b!292371 res!153427) b!292376))

(assert (= (and b!292376 res!153425) b!292373))

(assert (= (and b!292373 res!153430) b!292374))

(assert (= (and b!292374 res!153431) b!292372))

(assert (= (and b!292372 res!153428) b!292370))

(declare-fun m!306093 () Bool)

(assert (=> b!292371 m!306093))

(declare-fun m!306095 () Bool)

(assert (=> b!292376 m!306095))

(declare-fun m!306097 () Bool)

(assert (=> b!292375 m!306097))

(declare-fun m!306099 () Bool)

(assert (=> b!292374 m!306099))

(declare-fun m!306101 () Bool)

(assert (=> b!292374 m!306101))

(declare-fun m!306103 () Bool)

(assert (=> b!292374 m!306103))

(declare-fun m!306105 () Bool)

(assert (=> b!292374 m!306105))

(declare-fun m!306107 () Bool)

(assert (=> b!292373 m!306107))

(declare-fun m!306109 () Bool)

(assert (=> b!292370 m!306109))

(declare-fun m!306111 () Bool)

(assert (=> b!292372 m!306111))

(declare-fun m!306113 () Bool)

(assert (=> start!28594 m!306113))

(declare-fun m!306115 () Bool)

(assert (=> start!28594 m!306115))

(push 1)

