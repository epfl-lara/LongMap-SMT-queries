; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28398 () Bool)

(assert start!28398)

(declare-fun b!290737 () Bool)

(declare-fun e!183973 () Bool)

(declare-fun e!183974 () Bool)

(assert (=> b!290737 (= e!183973 e!183974)))

(declare-fun res!152079 () Bool)

(assert (=> b!290737 (=> (not res!152079) (not e!183974))))

(declare-datatypes ((SeekEntryResult!2108 0))(
  ( (MissingZero!2108 (index!10602 (_ BitVec 32))) (Found!2108 (index!10603 (_ BitVec 32))) (Intermediate!2108 (undefined!2920 Bool) (index!10604 (_ BitVec 32)) (x!28799 (_ BitVec 32))) (Undefined!2108) (MissingVacant!2108 (index!10605 (_ BitVec 32))) )
))
(declare-fun lt!143667 () SeekEntryResult!2108)

(declare-fun lt!143670 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290737 (= res!152079 (or lt!143670 (= lt!143667 (MissingVacant!2108 i!1256))))))

(assert (=> b!290737 (= lt!143670 (= lt!143667 (MissingZero!2108 i!1256)))))

(declare-datatypes ((array!14667 0))(
  ( (array!14668 (arr!6959 (Array (_ BitVec 32) (_ BitVec 64))) (size!7311 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14667)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14667 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!290737 (= lt!143667 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290738 () Bool)

(declare-fun res!152076 () Bool)

(assert (=> b!290738 (=> (not res!152076) (not e!183973))))

(declare-fun arrayContainsKey!0 (array!14667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290738 (= res!152076 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152080 () Bool)

(assert (=> start!28398 (=> (not res!152080) (not e!183973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28398 (= res!152080 (validMask!0 mask!3809))))

(assert (=> start!28398 e!183973))

(assert (=> start!28398 true))

(declare-fun array_inv!4922 (array!14667) Bool)

(assert (=> start!28398 (array_inv!4922 a!3312)))

(declare-fun b!290739 () Bool)

(declare-fun e!183977 () Bool)

(assert (=> b!290739 (= e!183977 (not true))))

(declare-fun lt!143671 () SeekEntryResult!2108)

(assert (=> b!290739 (= (index!10604 lt!143671) i!1256)))

(declare-fun b!290740 () Bool)

(declare-fun res!152075 () Bool)

(assert (=> b!290740 (=> (not res!152075) (not e!183974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14667 (_ BitVec 32)) Bool)

(assert (=> b!290740 (= res!152075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290741 () Bool)

(declare-fun e!183975 () Bool)

(assert (=> b!290741 (= e!183975 e!183977)))

(declare-fun res!152082 () Bool)

(assert (=> b!290741 (=> (not res!152082) (not e!183977))))

(declare-fun lt!143668 () Bool)

(assert (=> b!290741 (= res!152082 (and (or lt!143668 (not (undefined!2920 lt!143671))) (not lt!143668) (= (select (arr!6959 a!3312) (index!10604 lt!143671)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290741 (= lt!143668 (not (is-Intermediate!2108 lt!143671)))))

(declare-fun b!290742 () Bool)

(assert (=> b!290742 (= e!183974 e!183975)))

(declare-fun res!152078 () Bool)

(assert (=> b!290742 (=> (not res!152078) (not e!183975))))

(assert (=> b!290742 (= res!152078 (and (not lt!143670) (= lt!143667 (MissingVacant!2108 i!1256))))))

(declare-fun lt!143669 () SeekEntryResult!2108)

(declare-fun lt!143666 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14667 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!290742 (= lt!143669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143666 k!2524 (array!14668 (store (arr!6959 a!3312) i!1256 k!2524) (size!7311 a!3312)) mask!3809))))

(assert (=> b!290742 (= lt!143671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143666 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290742 (= lt!143666 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290743 () Bool)

(declare-fun res!152081 () Bool)

(assert (=> b!290743 (=> (not res!152081) (not e!183973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290743 (= res!152081 (validKeyInArray!0 k!2524))))

(declare-fun b!290744 () Bool)

(declare-fun res!152077 () Bool)

(assert (=> b!290744 (=> (not res!152077) (not e!183973))))

(assert (=> b!290744 (= res!152077 (and (= (size!7311 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7311 a!3312))))))

(assert (= (and start!28398 res!152080) b!290744))

(assert (= (and b!290744 res!152077) b!290743))

(assert (= (and b!290743 res!152081) b!290738))

(assert (= (and b!290738 res!152076) b!290737))

(assert (= (and b!290737 res!152079) b!290740))

(assert (= (and b!290740 res!152075) b!290742))

(assert (= (and b!290742 res!152078) b!290741))

(assert (= (and b!290741 res!152082) b!290739))

(declare-fun m!304731 () Bool)

(assert (=> b!290737 m!304731))

(declare-fun m!304733 () Bool)

(assert (=> b!290738 m!304733))

(declare-fun m!304735 () Bool)

(assert (=> start!28398 m!304735))

(declare-fun m!304737 () Bool)

(assert (=> start!28398 m!304737))

(declare-fun m!304739 () Bool)

(assert (=> b!290741 m!304739))

(declare-fun m!304741 () Bool)

(assert (=> b!290740 m!304741))

(declare-fun m!304743 () Bool)

(assert (=> b!290743 m!304743))

(declare-fun m!304745 () Bool)

(assert (=> b!290742 m!304745))

(declare-fun m!304747 () Bool)

(assert (=> b!290742 m!304747))

(declare-fun m!304749 () Bool)

(assert (=> b!290742 m!304749))

(declare-fun m!304751 () Bool)

(assert (=> b!290742 m!304751))

(push 1)

