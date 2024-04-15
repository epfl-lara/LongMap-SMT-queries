; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28652 () Bool)

(assert start!28652)

(declare-fun b!292782 () Bool)

(declare-fun res!153895 () Bool)

(declare-fun e!185169 () Bool)

(assert (=> b!292782 (=> (not res!153895) (not e!185169))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14824 0))(
  ( (array!14825 (arr!7035 (Array (_ BitVec 32) (_ BitVec 64))) (size!7388 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14824)

(assert (=> b!292782 (= res!153895 (and (= (size!7388 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7388 a!3312))))))

(declare-fun b!292783 () Bool)

(declare-fun e!185168 () Bool)

(assert (=> b!292783 (= e!185168 false)))

(declare-fun lt!144990 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2183 0))(
  ( (MissingZero!2183 (index!10902 (_ BitVec 32))) (Found!2183 (index!10903 (_ BitVec 32))) (Intermediate!2183 (undefined!2995 Bool) (index!10904 (_ BitVec 32)) (x!29101 (_ BitVec 32))) (Undefined!2183) (MissingVacant!2183 (index!10905 (_ BitVec 32))) )
))
(declare-fun lt!144989 () SeekEntryResult!2183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14824 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!292783 (= lt!144989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144990 k0!2524 (array!14825 (store (arr!7035 a!3312) i!1256 k0!2524) (size!7388 a!3312)) mask!3809))))

(declare-fun lt!144988 () SeekEntryResult!2183)

(assert (=> b!292783 (= lt!144988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144990 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292783 (= lt!144990 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292784 () Bool)

(declare-fun res!153890 () Bool)

(assert (=> b!292784 (=> (not res!153890) (not e!185168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14824 (_ BitVec 32)) Bool)

(assert (=> b!292784 (= res!153890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292785 () Bool)

(declare-fun res!153894 () Bool)

(assert (=> b!292785 (=> (not res!153894) (not e!185169))))

(declare-fun arrayContainsKey!0 (array!14824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292785 (= res!153894 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153893 () Bool)

(assert (=> start!28652 (=> (not res!153893) (not e!185169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28652 (= res!153893 (validMask!0 mask!3809))))

(assert (=> start!28652 e!185169))

(assert (=> start!28652 true))

(declare-fun array_inv!5007 (array!14824) Bool)

(assert (=> start!28652 (array_inv!5007 a!3312)))

(declare-fun b!292786 () Bool)

(declare-fun res!153891 () Bool)

(assert (=> b!292786 (=> (not res!153891) (not e!185169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292786 (= res!153891 (validKeyInArray!0 k0!2524))))

(declare-fun b!292787 () Bool)

(assert (=> b!292787 (= e!185169 e!185168)))

(declare-fun res!153892 () Bool)

(assert (=> b!292787 (=> (not res!153892) (not e!185168))))

(declare-fun lt!144987 () SeekEntryResult!2183)

(assert (=> b!292787 (= res!153892 (or (= lt!144987 (MissingZero!2183 i!1256)) (= lt!144987 (MissingVacant!2183 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14824 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!292787 (= lt!144987 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28652 res!153893) b!292782))

(assert (= (and b!292782 res!153895) b!292786))

(assert (= (and b!292786 res!153891) b!292785))

(assert (= (and b!292785 res!153894) b!292787))

(assert (= (and b!292787 res!153892) b!292784))

(assert (= (and b!292784 res!153890) b!292783))

(declare-fun m!306125 () Bool)

(assert (=> b!292783 m!306125))

(declare-fun m!306127 () Bool)

(assert (=> b!292783 m!306127))

(declare-fun m!306129 () Bool)

(assert (=> b!292783 m!306129))

(declare-fun m!306131 () Bool)

(assert (=> b!292783 m!306131))

(declare-fun m!306133 () Bool)

(assert (=> b!292786 m!306133))

(declare-fun m!306135 () Bool)

(assert (=> b!292787 m!306135))

(declare-fun m!306137 () Bool)

(assert (=> b!292785 m!306137))

(declare-fun m!306139 () Bool)

(assert (=> start!28652 m!306139))

(declare-fun m!306141 () Bool)

(assert (=> start!28652 m!306141))

(declare-fun m!306143 () Bool)

(assert (=> b!292784 m!306143))

(check-sat (not b!292786) (not b!292785) (not b!292783) (not b!292784) (not b!292787) (not start!28652))
(check-sat)
