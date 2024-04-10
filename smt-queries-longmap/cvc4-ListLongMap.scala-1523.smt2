; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28672 () Bool)

(assert start!28672)

(declare-fun b!293073 () Bool)

(declare-fun e!185340 () Bool)

(assert (=> b!293073 (= e!185340 false)))

(declare-datatypes ((SeekEntryResult!2197 0))(
  ( (MissingZero!2197 (index!10958 (_ BitVec 32))) (Found!2197 (index!10959 (_ BitVec 32))) (Intermediate!2197 (undefined!3009 Bool) (index!10960 (_ BitVec 32)) (x!29132 (_ BitVec 32))) (Undefined!2197) (MissingVacant!2197 (index!10961 (_ BitVec 32))) )
))
(declare-fun lt!145267 () SeekEntryResult!2197)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145264 () (_ BitVec 32))

(declare-datatypes ((array!14851 0))(
  ( (array!14852 (arr!7048 (Array (_ BitVec 32) (_ BitVec 64))) (size!7400 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14851)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14851 (_ BitVec 32)) SeekEntryResult!2197)

(assert (=> b!293073 (= lt!145267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145264 k!2524 (array!14852 (store (arr!7048 a!3312) i!1256 k!2524) (size!7400 a!3312)) mask!3809))))

(declare-fun lt!145265 () SeekEntryResult!2197)

(assert (=> b!293073 (= lt!145265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145264 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293073 (= lt!145264 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!293074 () Bool)

(declare-fun e!185342 () Bool)

(assert (=> b!293074 (= e!185342 e!185340)))

(declare-fun res!154129 () Bool)

(assert (=> b!293074 (=> (not res!154129) (not e!185340))))

(declare-fun lt!145266 () SeekEntryResult!2197)

(assert (=> b!293074 (= res!154129 (or (= lt!145266 (MissingZero!2197 i!1256)) (= lt!145266 (MissingVacant!2197 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14851 (_ BitVec 32)) SeekEntryResult!2197)

(assert (=> b!293074 (= lt!145266 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293075 () Bool)

(declare-fun res!154132 () Bool)

(assert (=> b!293075 (=> (not res!154132) (not e!185340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14851 (_ BitVec 32)) Bool)

(assert (=> b!293075 (= res!154132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293076 () Bool)

(declare-fun res!154133 () Bool)

(assert (=> b!293076 (=> (not res!154133) (not e!185342))))

(assert (=> b!293076 (= res!154133 (and (= (size!7400 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7400 a!3312))))))

(declare-fun b!293077 () Bool)

(declare-fun res!154130 () Bool)

(assert (=> b!293077 (=> (not res!154130) (not e!185342))))

(declare-fun arrayContainsKey!0 (array!14851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293077 (= res!154130 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154131 () Bool)

(assert (=> start!28672 (=> (not res!154131) (not e!185342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28672 (= res!154131 (validMask!0 mask!3809))))

(assert (=> start!28672 e!185342))

(assert (=> start!28672 true))

(declare-fun array_inv!5011 (array!14851) Bool)

(assert (=> start!28672 (array_inv!5011 a!3312)))

(declare-fun b!293078 () Bool)

(declare-fun res!154134 () Bool)

(assert (=> b!293078 (=> (not res!154134) (not e!185342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293078 (= res!154134 (validKeyInArray!0 k!2524))))

(assert (= (and start!28672 res!154131) b!293076))

(assert (= (and b!293076 res!154133) b!293078))

(assert (= (and b!293078 res!154134) b!293077))

(assert (= (and b!293077 res!154130) b!293074))

(assert (= (and b!293074 res!154129) b!293075))

(assert (= (and b!293075 res!154132) b!293073))

(declare-fun m!306877 () Bool)

(assert (=> b!293075 m!306877))

(declare-fun m!306879 () Bool)

(assert (=> b!293078 m!306879))

(declare-fun m!306881 () Bool)

(assert (=> b!293077 m!306881))

(declare-fun m!306883 () Bool)

(assert (=> b!293073 m!306883))

(declare-fun m!306885 () Bool)

(assert (=> b!293073 m!306885))

(declare-fun m!306887 () Bool)

(assert (=> b!293073 m!306887))

(declare-fun m!306889 () Bool)

(assert (=> b!293073 m!306889))

(declare-fun m!306891 () Bool)

(assert (=> start!28672 m!306891))

(declare-fun m!306893 () Bool)

(assert (=> start!28672 m!306893))

(declare-fun m!306895 () Bool)

(assert (=> b!293074 m!306895))

(push 1)

(assert (not b!293073))

(assert (not b!293074))

(assert (not b!293075))

(assert (not b!293078))

