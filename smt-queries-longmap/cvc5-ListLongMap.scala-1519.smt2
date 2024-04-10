; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28644 () Bool)

(assert start!28644)

(declare-fun b!292821 () Bool)

(declare-fun res!153879 () Bool)

(declare-fun e!185215 () Bool)

(assert (=> b!292821 (=> (not res!153879) (not e!185215))))

(declare-datatypes ((array!14823 0))(
  ( (array!14824 (arr!7034 (Array (_ BitVec 32) (_ BitVec 64))) (size!7386 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14823)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292821 (= res!153879 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292822 () Bool)

(declare-fun res!153882 () Bool)

(assert (=> b!292822 (=> (not res!153882) (not e!185215))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292822 (= res!153882 (and (= (size!7386 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7386 a!3312))))))

(declare-fun b!292823 () Bool)

(declare-fun e!185214 () Bool)

(assert (=> b!292823 (= e!185214 false)))

(declare-datatypes ((SeekEntryResult!2183 0))(
  ( (MissingZero!2183 (index!10902 (_ BitVec 32))) (Found!2183 (index!10903 (_ BitVec 32))) (Intermediate!2183 (undefined!2995 Bool) (index!10904 (_ BitVec 32)) (x!29086 (_ BitVec 32))) (Undefined!2183) (MissingVacant!2183 (index!10905 (_ BitVec 32))) )
))
(declare-fun lt!145096 () SeekEntryResult!2183)

(declare-fun lt!145099 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14823 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!292823 (= lt!145096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145099 k!2524 (array!14824 (store (arr!7034 a!3312) i!1256 k!2524) (size!7386 a!3312)) mask!3809))))

(declare-fun lt!145098 () SeekEntryResult!2183)

(assert (=> b!292823 (= lt!145098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145099 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292823 (= lt!145099 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!153878 () Bool)

(assert (=> start!28644 (=> (not res!153878) (not e!185215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28644 (= res!153878 (validMask!0 mask!3809))))

(assert (=> start!28644 e!185215))

(assert (=> start!28644 true))

(declare-fun array_inv!4997 (array!14823) Bool)

(assert (=> start!28644 (array_inv!4997 a!3312)))

(declare-fun b!292824 () Bool)

(declare-fun res!153881 () Bool)

(assert (=> b!292824 (=> (not res!153881) (not e!185215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292824 (= res!153881 (validKeyInArray!0 k!2524))))

(declare-fun b!292825 () Bool)

(declare-fun res!153880 () Bool)

(assert (=> b!292825 (=> (not res!153880) (not e!185214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14823 (_ BitVec 32)) Bool)

(assert (=> b!292825 (= res!153880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292826 () Bool)

(assert (=> b!292826 (= e!185215 e!185214)))

(declare-fun res!153877 () Bool)

(assert (=> b!292826 (=> (not res!153877) (not e!185214))))

(declare-fun lt!145097 () SeekEntryResult!2183)

(assert (=> b!292826 (= res!153877 (or (= lt!145097 (MissingZero!2183 i!1256)) (= lt!145097 (MissingVacant!2183 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14823 (_ BitVec 32)) SeekEntryResult!2183)

(assert (=> b!292826 (= lt!145097 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28644 res!153878) b!292822))

(assert (= (and b!292822 res!153882) b!292824))

(assert (= (and b!292824 res!153881) b!292821))

(assert (= (and b!292821 res!153879) b!292826))

(assert (= (and b!292826 res!153877) b!292825))

(assert (= (and b!292825 res!153880) b!292823))

(declare-fun m!306597 () Bool)

(assert (=> start!28644 m!306597))

(declare-fun m!306599 () Bool)

(assert (=> start!28644 m!306599))

(declare-fun m!306601 () Bool)

(assert (=> b!292823 m!306601))

(declare-fun m!306603 () Bool)

(assert (=> b!292823 m!306603))

(declare-fun m!306605 () Bool)

(assert (=> b!292823 m!306605))

(declare-fun m!306607 () Bool)

(assert (=> b!292823 m!306607))

(declare-fun m!306609 () Bool)

(assert (=> b!292824 m!306609))

(declare-fun m!306611 () Bool)

(assert (=> b!292825 m!306611))

(declare-fun m!306613 () Bool)

(assert (=> b!292821 m!306613))

(declare-fun m!306615 () Bool)

(assert (=> b!292826 m!306615))

(push 1)

