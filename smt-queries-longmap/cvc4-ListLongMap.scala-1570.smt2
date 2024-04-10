; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29960 () Bool)

(assert start!29960)

(declare-fun b!300933 () Bool)

(declare-fun e!189992 () Bool)

(assert (=> b!300933 (= e!189992 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149725 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2338 0))(
  ( (MissingZero!2338 (index!11528 (_ BitVec 32))) (Found!2338 (index!11529 (_ BitVec 32))) (Intermediate!2338 (undefined!3150 Bool) (index!11530 (_ BitVec 32)) (x!29786 (_ BitVec 32))) (Undefined!2338) (MissingVacant!2338 (index!11531 (_ BitVec 32))) )
))
(declare-fun lt!149727 () SeekEntryResult!2338)

(declare-datatypes ((array!15193 0))(
  ( (array!15194 (arr!7189 (Array (_ BitVec 32) (_ BitVec 64))) (size!7541 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15193)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15193 (_ BitVec 32)) SeekEntryResult!2338)

(assert (=> b!300933 (= lt!149727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149725 k!2524 (array!15194 (store (arr!7189 a!3312) i!1256 k!2524) (size!7541 a!3312)) mask!3809))))

(declare-fun lt!149724 () SeekEntryResult!2338)

(assert (=> b!300933 (= lt!149724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149725 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300933 (= lt!149725 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!158688 () Bool)

(declare-fun e!189993 () Bool)

(assert (=> start!29960 (=> (not res!158688) (not e!189993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29960 (= res!158688 (validMask!0 mask!3809))))

(assert (=> start!29960 e!189993))

(assert (=> start!29960 true))

(declare-fun array_inv!5152 (array!15193) Bool)

(assert (=> start!29960 (array_inv!5152 a!3312)))

(declare-fun b!300934 () Bool)

(assert (=> b!300934 (= e!189993 e!189992)))

(declare-fun res!158686 () Bool)

(assert (=> b!300934 (=> (not res!158686) (not e!189992))))

(declare-fun lt!149726 () SeekEntryResult!2338)

(assert (=> b!300934 (= res!158686 (or (= lt!149726 (MissingZero!2338 i!1256)) (= lt!149726 (MissingVacant!2338 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15193 (_ BitVec 32)) SeekEntryResult!2338)

(assert (=> b!300934 (= lt!149726 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300935 () Bool)

(declare-fun res!158685 () Bool)

(assert (=> b!300935 (=> (not res!158685) (not e!189993))))

(assert (=> b!300935 (= res!158685 (and (= (size!7541 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7541 a!3312))))))

(declare-fun b!300936 () Bool)

(declare-fun res!158687 () Bool)

(assert (=> b!300936 (=> (not res!158687) (not e!189993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300936 (= res!158687 (validKeyInArray!0 k!2524))))

(declare-fun b!300937 () Bool)

(declare-fun res!158683 () Bool)

(assert (=> b!300937 (=> (not res!158683) (not e!189992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15193 (_ BitVec 32)) Bool)

(assert (=> b!300937 (= res!158683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300938 () Bool)

(declare-fun res!158684 () Bool)

(assert (=> b!300938 (=> (not res!158684) (not e!189993))))

(declare-fun arrayContainsKey!0 (array!15193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300938 (= res!158684 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29960 res!158688) b!300935))

(assert (= (and b!300935 res!158685) b!300936))

(assert (= (and b!300936 res!158687) b!300938))

(assert (= (and b!300938 res!158684) b!300934))

(assert (= (and b!300934 res!158686) b!300937))

(assert (= (and b!300937 res!158683) b!300933))

(declare-fun m!312829 () Bool)

(assert (=> b!300936 m!312829))

(declare-fun m!312831 () Bool)

(assert (=> b!300938 m!312831))

(declare-fun m!312833 () Bool)

(assert (=> b!300933 m!312833))

(declare-fun m!312835 () Bool)

(assert (=> b!300933 m!312835))

(declare-fun m!312837 () Bool)

(assert (=> b!300933 m!312837))

(declare-fun m!312839 () Bool)

(assert (=> b!300933 m!312839))

(declare-fun m!312841 () Bool)

(assert (=> b!300934 m!312841))

(declare-fun m!312843 () Bool)

(assert (=> b!300937 m!312843))

(declare-fun m!312845 () Bool)

(assert (=> start!29960 m!312845))

(declare-fun m!312847 () Bool)

(assert (=> start!29960 m!312847))

(push 1)

