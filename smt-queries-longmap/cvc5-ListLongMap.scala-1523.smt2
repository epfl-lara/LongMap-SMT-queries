; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28668 () Bool)

(assert start!28668)

(declare-fun b!293037 () Bool)

(declare-fun res!154098 () Bool)

(declare-fun e!185322 () Bool)

(assert (=> b!293037 (=> (not res!154098) (not e!185322))))

(declare-datatypes ((array!14847 0))(
  ( (array!14848 (arr!7046 (Array (_ BitVec 32) (_ BitVec 64))) (size!7398 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14847)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14847 (_ BitVec 32)) Bool)

(assert (=> b!293037 (= res!154098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293038 () Bool)

(declare-fun res!154093 () Bool)

(declare-fun e!185323 () Bool)

(assert (=> b!293038 (=> (not res!154093) (not e!185323))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293038 (= res!154093 (and (= (size!7398 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7398 a!3312))))))

(declare-fun b!293039 () Bool)

(assert (=> b!293039 (= e!185322 false)))

(declare-fun lt!145243 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2195 0))(
  ( (MissingZero!2195 (index!10950 (_ BitVec 32))) (Found!2195 (index!10951 (_ BitVec 32))) (Intermediate!2195 (undefined!3007 Bool) (index!10952 (_ BitVec 32)) (x!29130 (_ BitVec 32))) (Undefined!2195) (MissingVacant!2195 (index!10953 (_ BitVec 32))) )
))
(declare-fun lt!145242 () SeekEntryResult!2195)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14847 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!293039 (= lt!145242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145243 k!2524 (array!14848 (store (arr!7046 a!3312) i!1256 k!2524) (size!7398 a!3312)) mask!3809))))

(declare-fun lt!145241 () SeekEntryResult!2195)

(assert (=> b!293039 (= lt!145241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145243 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293039 (= lt!145243 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!154094 () Bool)

(assert (=> start!28668 (=> (not res!154094) (not e!185323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28668 (= res!154094 (validMask!0 mask!3809))))

(assert (=> start!28668 e!185323))

(assert (=> start!28668 true))

(declare-fun array_inv!5009 (array!14847) Bool)

(assert (=> start!28668 (array_inv!5009 a!3312)))

(declare-fun b!293040 () Bool)

(declare-fun res!154096 () Bool)

(assert (=> b!293040 (=> (not res!154096) (not e!185323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293040 (= res!154096 (validKeyInArray!0 k!2524))))

(declare-fun b!293041 () Bool)

(declare-fun res!154095 () Bool)

(assert (=> b!293041 (=> (not res!154095) (not e!185323))))

(declare-fun arrayContainsKey!0 (array!14847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293041 (= res!154095 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293042 () Bool)

(assert (=> b!293042 (= e!185323 e!185322)))

(declare-fun res!154097 () Bool)

(assert (=> b!293042 (=> (not res!154097) (not e!185322))))

(declare-fun lt!145240 () SeekEntryResult!2195)

(assert (=> b!293042 (= res!154097 (or (= lt!145240 (MissingZero!2195 i!1256)) (= lt!145240 (MissingVacant!2195 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14847 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!293042 (= lt!145240 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28668 res!154094) b!293038))

(assert (= (and b!293038 res!154093) b!293040))

(assert (= (and b!293040 res!154096) b!293041))

(assert (= (and b!293041 res!154095) b!293042))

(assert (= (and b!293042 res!154097) b!293037))

(assert (= (and b!293037 res!154098) b!293039))

(declare-fun m!306837 () Bool)

(assert (=> b!293039 m!306837))

(declare-fun m!306839 () Bool)

(assert (=> b!293039 m!306839))

(declare-fun m!306841 () Bool)

(assert (=> b!293039 m!306841))

(declare-fun m!306843 () Bool)

(assert (=> b!293039 m!306843))

(declare-fun m!306845 () Bool)

(assert (=> b!293040 m!306845))

(declare-fun m!306847 () Bool)

(assert (=> b!293042 m!306847))

(declare-fun m!306849 () Bool)

(assert (=> start!28668 m!306849))

(declare-fun m!306851 () Bool)

(assert (=> start!28668 m!306851))

(declare-fun m!306853 () Bool)

(assert (=> b!293037 m!306853))

(declare-fun m!306855 () Bool)

(assert (=> b!293041 m!306855))

(push 1)

