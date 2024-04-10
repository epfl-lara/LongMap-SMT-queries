; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28648 () Bool)

(assert start!28648)

(declare-fun b!292857 () Bool)

(declare-fun res!153914 () Bool)

(declare-fun e!185234 () Bool)

(assert (=> b!292857 (=> (not res!153914) (not e!185234))))

(declare-datatypes ((array!14827 0))(
  ( (array!14828 (arr!7036 (Array (_ BitVec 32) (_ BitVec 64))) (size!7388 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14827)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14827 (_ BitVec 32)) Bool)

(assert (=> b!292857 (= res!153914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292858 () Bool)

(declare-fun res!153917 () Bool)

(declare-fun e!185233 () Bool)

(assert (=> b!292858 (=> (not res!153917) (not e!185233))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292858 (= res!153917 (and (= (size!7388 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7388 a!3312))))))

(declare-fun res!153915 () Bool)

(assert (=> start!28648 (=> (not res!153915) (not e!185233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28648 (= res!153915 (validMask!0 mask!3809))))

(assert (=> start!28648 e!185233))

(assert (=> start!28648 true))

(declare-fun array_inv!4999 (array!14827) Bool)

(assert (=> start!28648 (array_inv!4999 a!3312)))

(declare-fun b!292859 () Bool)

(declare-fun res!153918 () Bool)

(assert (=> b!292859 (=> (not res!153918) (not e!185233))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292859 (= res!153918 (validKeyInArray!0 k!2524))))

(declare-fun b!292860 () Bool)

(declare-fun res!153913 () Bool)

(assert (=> b!292860 (=> (not res!153913) (not e!185233))))

(declare-fun arrayContainsKey!0 (array!14827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292860 (= res!153913 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292861 () Bool)

(assert (=> b!292861 (= e!185233 e!185234)))

(declare-fun res!153916 () Bool)

(assert (=> b!292861 (=> (not res!153916) (not e!185234))))

(declare-datatypes ((SeekEntryResult!2185 0))(
  ( (MissingZero!2185 (index!10910 (_ BitVec 32))) (Found!2185 (index!10911 (_ BitVec 32))) (Intermediate!2185 (undefined!2997 Bool) (index!10912 (_ BitVec 32)) (x!29088 (_ BitVec 32))) (Undefined!2185) (MissingVacant!2185 (index!10913 (_ BitVec 32))) )
))
(declare-fun lt!145121 () SeekEntryResult!2185)

(assert (=> b!292861 (= res!153916 (or (= lt!145121 (MissingZero!2185 i!1256)) (= lt!145121 (MissingVacant!2185 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14827 (_ BitVec 32)) SeekEntryResult!2185)

(assert (=> b!292861 (= lt!145121 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292862 () Bool)

(assert (=> b!292862 (= e!185234 false)))

(declare-fun lt!145122 () (_ BitVec 32))

(declare-fun lt!145123 () SeekEntryResult!2185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14827 (_ BitVec 32)) SeekEntryResult!2185)

(assert (=> b!292862 (= lt!145123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145122 k!2524 (array!14828 (store (arr!7036 a!3312) i!1256 k!2524) (size!7388 a!3312)) mask!3809))))

(declare-fun lt!145120 () SeekEntryResult!2185)

(assert (=> b!292862 (= lt!145120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145122 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292862 (= lt!145122 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28648 res!153915) b!292858))

(assert (= (and b!292858 res!153917) b!292859))

(assert (= (and b!292859 res!153918) b!292860))

(assert (= (and b!292860 res!153913) b!292861))

(assert (= (and b!292861 res!153916) b!292857))

(assert (= (and b!292857 res!153914) b!292862))

(declare-fun m!306637 () Bool)

(assert (=> b!292862 m!306637))

(declare-fun m!306639 () Bool)

(assert (=> b!292862 m!306639))

(declare-fun m!306641 () Bool)

(assert (=> b!292862 m!306641))

(declare-fun m!306643 () Bool)

(assert (=> b!292862 m!306643))

(declare-fun m!306645 () Bool)

(assert (=> b!292859 m!306645))

(declare-fun m!306647 () Bool)

(assert (=> b!292857 m!306647))

(declare-fun m!306649 () Bool)

(assert (=> start!28648 m!306649))

(declare-fun m!306651 () Bool)

(assert (=> start!28648 m!306651))

(declare-fun m!306653 () Bool)

(assert (=> b!292861 m!306653))

(declare-fun m!306655 () Bool)

(assert (=> b!292860 m!306655))

(push 1)

(assert (not b!292862))

(assert (not b!292861))

(assert (not b!292860))

