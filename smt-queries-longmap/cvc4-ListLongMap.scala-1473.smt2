; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28228 () Bool)

(assert start!28228)

(declare-fun b!289093 () Bool)

(declare-fun e!183037 () Bool)

(declare-fun e!183038 () Bool)

(assert (=> b!289093 (= e!183037 e!183038)))

(declare-fun res!150722 () Bool)

(assert (=> b!289093 (=> (not res!150722) (not e!183038))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142574 () Bool)

(declare-datatypes ((SeekEntryResult!2047 0))(
  ( (MissingZero!2047 (index!10358 (_ BitVec 32))) (Found!2047 (index!10359 (_ BitVec 32))) (Intermediate!2047 (undefined!2859 Bool) (index!10360 (_ BitVec 32)) (x!28564 (_ BitVec 32))) (Undefined!2047) (MissingVacant!2047 (index!10361 (_ BitVec 32))) )
))
(declare-fun lt!142572 () SeekEntryResult!2047)

(assert (=> b!289093 (= res!150722 (or lt!142574 (= lt!142572 (MissingVacant!2047 i!1256))))))

(assert (=> b!289093 (= lt!142574 (= lt!142572 (MissingZero!2047 i!1256)))))

(declare-datatypes ((array!14542 0))(
  ( (array!14543 (arr!6898 (Array (_ BitVec 32) (_ BitVec 64))) (size!7250 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14542)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14542 (_ BitVec 32)) SeekEntryResult!2047)

(assert (=> b!289093 (= lt!142572 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289094 () Bool)

(declare-fun res!150721 () Bool)

(assert (=> b!289094 (=> (not res!150721) (not e!183038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14542 (_ BitVec 32)) Bool)

(assert (=> b!289094 (= res!150721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289095 () Bool)

(declare-fun e!183034 () Bool)

(assert (=> b!289095 (= e!183034 (not true))))

(declare-fun lt!142575 () SeekEntryResult!2047)

(assert (=> b!289095 (and (= (select (arr!6898 a!3312) (index!10360 lt!142575)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10360 lt!142575) i!1256))))

(declare-fun res!150716 () Bool)

(assert (=> start!28228 (=> (not res!150716) (not e!183037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28228 (= res!150716 (validMask!0 mask!3809))))

(assert (=> start!28228 e!183037))

(assert (=> start!28228 true))

(declare-fun array_inv!4861 (array!14542) Bool)

(assert (=> start!28228 (array_inv!4861 a!3312)))

(declare-fun b!289096 () Bool)

(declare-fun res!150723 () Bool)

(assert (=> b!289096 (=> (not res!150723) (not e!183037))))

(declare-fun arrayContainsKey!0 (array!14542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289096 (= res!150723 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289097 () Bool)

(declare-fun e!183036 () Bool)

(assert (=> b!289097 (= e!183036 e!183034)))

(declare-fun res!150717 () Bool)

(assert (=> b!289097 (=> (not res!150717) (not e!183034))))

(declare-fun lt!142573 () Bool)

(assert (=> b!289097 (= res!150717 (and (or lt!142573 (not (undefined!2859 lt!142575))) (or lt!142573 (not (= (select (arr!6898 a!3312) (index!10360 lt!142575)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142573 (not (= (select (arr!6898 a!3312) (index!10360 lt!142575)) k!2524))) (not lt!142573)))))

(assert (=> b!289097 (= lt!142573 (not (is-Intermediate!2047 lt!142575)))))

(declare-fun b!289098 () Bool)

(declare-fun res!150720 () Bool)

(assert (=> b!289098 (=> (not res!150720) (not e!183037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289098 (= res!150720 (validKeyInArray!0 k!2524))))

(declare-fun b!289099 () Bool)

(assert (=> b!289099 (= e!183038 e!183036)))

(declare-fun res!150719 () Bool)

(assert (=> b!289099 (=> (not res!150719) (not e!183036))))

(assert (=> b!289099 (= res!150719 lt!142574)))

(declare-fun lt!142576 () (_ BitVec 32))

(declare-fun lt!142571 () SeekEntryResult!2047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14542 (_ BitVec 32)) SeekEntryResult!2047)

(assert (=> b!289099 (= lt!142571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142576 k!2524 (array!14543 (store (arr!6898 a!3312) i!1256 k!2524) (size!7250 a!3312)) mask!3809))))

(assert (=> b!289099 (= lt!142575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142576 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289099 (= lt!142576 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289100 () Bool)

(declare-fun res!150718 () Bool)

(assert (=> b!289100 (=> (not res!150718) (not e!183037))))

(assert (=> b!289100 (= res!150718 (and (= (size!7250 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7250 a!3312))))))

(assert (= (and start!28228 res!150716) b!289100))

(assert (= (and b!289100 res!150718) b!289098))

(assert (= (and b!289098 res!150720) b!289096))

(assert (= (and b!289096 res!150723) b!289093))

(assert (= (and b!289093 res!150722) b!289094))

(assert (= (and b!289094 res!150721) b!289099))

(assert (= (and b!289099 res!150719) b!289097))

(assert (= (and b!289097 res!150717) b!289095))

(declare-fun m!303269 () Bool)

(assert (=> b!289093 m!303269))

(declare-fun m!303271 () Bool)

(assert (=> b!289099 m!303271))

(declare-fun m!303273 () Bool)

(assert (=> b!289099 m!303273))

(declare-fun m!303275 () Bool)

(assert (=> b!289099 m!303275))

(declare-fun m!303277 () Bool)

(assert (=> b!289099 m!303277))

(declare-fun m!303279 () Bool)

(assert (=> start!28228 m!303279))

(declare-fun m!303281 () Bool)

(assert (=> start!28228 m!303281))

(declare-fun m!303283 () Bool)

(assert (=> b!289098 m!303283))

(declare-fun m!303285 () Bool)

(assert (=> b!289097 m!303285))

(declare-fun m!303287 () Bool)

(assert (=> b!289096 m!303287))

(assert (=> b!289095 m!303285))

(declare-fun m!303289 () Bool)

(assert (=> b!289094 m!303289))

(push 1)

