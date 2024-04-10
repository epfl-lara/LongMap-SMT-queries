; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28646 () Bool)

(assert start!28646)

(declare-fun b!292839 () Bool)

(declare-fun res!153897 () Bool)

(declare-fun e!185223 () Bool)

(assert (=> b!292839 (=> (not res!153897) (not e!185223))))

(declare-datatypes ((array!14825 0))(
  ( (array!14826 (arr!7035 (Array (_ BitVec 32) (_ BitVec 64))) (size!7387 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14825)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14825 (_ BitVec 32)) Bool)

(assert (=> b!292839 (= res!153897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292840 () Bool)

(declare-fun e!185224 () Bool)

(assert (=> b!292840 (= e!185224 e!185223)))

(declare-fun res!153899 () Bool)

(assert (=> b!292840 (=> (not res!153899) (not e!185223))))

(declare-datatypes ((SeekEntryResult!2184 0))(
  ( (MissingZero!2184 (index!10906 (_ BitVec 32))) (Found!2184 (index!10907 (_ BitVec 32))) (Intermediate!2184 (undefined!2996 Bool) (index!10908 (_ BitVec 32)) (x!29087 (_ BitVec 32))) (Undefined!2184) (MissingVacant!2184 (index!10909 (_ BitVec 32))) )
))
(declare-fun lt!145111 () SeekEntryResult!2184)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292840 (= res!153899 (or (= lt!145111 (MissingZero!2184 i!1256)) (= lt!145111 (MissingVacant!2184 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14825 (_ BitVec 32)) SeekEntryResult!2184)

(assert (=> b!292840 (= lt!145111 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153896 () Bool)

(assert (=> start!28646 (=> (not res!153896) (not e!185224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28646 (= res!153896 (validMask!0 mask!3809))))

(assert (=> start!28646 e!185224))

(assert (=> start!28646 true))

(declare-fun array_inv!4998 (array!14825) Bool)

(assert (=> start!28646 (array_inv!4998 a!3312)))

(declare-fun b!292841 () Bool)

(assert (=> b!292841 (= e!185223 false)))

(declare-fun lt!145108 () SeekEntryResult!2184)

(declare-fun lt!145109 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14825 (_ BitVec 32)) SeekEntryResult!2184)

(assert (=> b!292841 (= lt!145108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145109 k0!2524 (array!14826 (store (arr!7035 a!3312) i!1256 k0!2524) (size!7387 a!3312)) mask!3809))))

(declare-fun lt!145110 () SeekEntryResult!2184)

(assert (=> b!292841 (= lt!145110 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145109 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292841 (= lt!145109 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292842 () Bool)

(declare-fun res!153900 () Bool)

(assert (=> b!292842 (=> (not res!153900) (not e!185224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292842 (= res!153900 (validKeyInArray!0 k0!2524))))

(declare-fun b!292843 () Bool)

(declare-fun res!153895 () Bool)

(assert (=> b!292843 (=> (not res!153895) (not e!185224))))

(assert (=> b!292843 (= res!153895 (and (= (size!7387 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7387 a!3312))))))

(declare-fun b!292844 () Bool)

(declare-fun res!153898 () Bool)

(assert (=> b!292844 (=> (not res!153898) (not e!185224))))

(declare-fun arrayContainsKey!0 (array!14825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292844 (= res!153898 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28646 res!153896) b!292843))

(assert (= (and b!292843 res!153895) b!292842))

(assert (= (and b!292842 res!153900) b!292844))

(assert (= (and b!292844 res!153898) b!292840))

(assert (= (and b!292840 res!153899) b!292839))

(assert (= (and b!292839 res!153897) b!292841))

(declare-fun m!306617 () Bool)

(assert (=> b!292839 m!306617))

(declare-fun m!306619 () Bool)

(assert (=> b!292841 m!306619))

(declare-fun m!306621 () Bool)

(assert (=> b!292841 m!306621))

(declare-fun m!306623 () Bool)

(assert (=> b!292841 m!306623))

(declare-fun m!306625 () Bool)

(assert (=> b!292841 m!306625))

(declare-fun m!306627 () Bool)

(assert (=> b!292842 m!306627))

(declare-fun m!306629 () Bool)

(assert (=> b!292844 m!306629))

(declare-fun m!306631 () Bool)

(assert (=> b!292840 m!306631))

(declare-fun m!306633 () Bool)

(assert (=> start!28646 m!306633))

(declare-fun m!306635 () Bool)

(assert (=> start!28646 m!306635))

(check-sat (not b!292840) (not start!28646) (not b!292839) (not b!292842) (not b!292841) (not b!292844))
(check-sat)
