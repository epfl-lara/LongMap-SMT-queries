; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28190 () Bool)

(assert start!28190)

(declare-fun res!150262 () Bool)

(declare-fun e!182752 () Bool)

(assert (=> start!28190 (=> (not res!150262) (not e!182752))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28190 (= res!150262 (validMask!0 mask!3809))))

(assert (=> start!28190 e!182752))

(assert (=> start!28190 true))

(declare-datatypes ((array!14504 0))(
  ( (array!14505 (arr!6879 (Array (_ BitVec 32) (_ BitVec 64))) (size!7231 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14504)

(declare-fun array_inv!4842 (array!14504) Bool)

(assert (=> start!28190 (array_inv!4842 a!3312)))

(declare-fun b!288637 () Bool)

(declare-fun e!182750 () Bool)

(assert (=> b!288637 (= e!182750 (not true))))

(declare-datatypes ((SeekEntryResult!2028 0))(
  ( (MissingZero!2028 (index!10282 (_ BitVec 32))) (Found!2028 (index!10283 (_ BitVec 32))) (Intermediate!2028 (undefined!2840 Bool) (index!10284 (_ BitVec 32)) (x!28497 (_ BitVec 32))) (Undefined!2028) (MissingVacant!2028 (index!10285 (_ BitVec 32))) )
))
(declare-fun lt!142230 () SeekEntryResult!2028)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288637 (and (= (select (arr!6879 a!3312) (index!10284 lt!142230)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10284 lt!142230) i!1256))))

(declare-fun b!288638 () Bool)

(declare-fun e!182753 () Bool)

(assert (=> b!288638 (= e!182753 e!182750)))

(declare-fun res!150263 () Bool)

(assert (=> b!288638 (=> (not res!150263) (not e!182750))))

(declare-fun lt!142229 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!288638 (= res!150263 (and (or lt!142229 (not (undefined!2840 lt!142230))) (or lt!142229 (not (= (select (arr!6879 a!3312) (index!10284 lt!142230)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142229 (not (= (select (arr!6879 a!3312) (index!10284 lt!142230)) k0!2524))) (not lt!142229)))))

(get-info :version)

(assert (=> b!288638 (= lt!142229 (not ((_ is Intermediate!2028) lt!142230)))))

(declare-fun b!288639 () Bool)

(declare-fun e!182749 () Bool)

(assert (=> b!288639 (= e!182752 e!182749)))

(declare-fun res!150264 () Bool)

(assert (=> b!288639 (=> (not res!150264) (not e!182749))))

(declare-fun lt!142234 () Bool)

(declare-fun lt!142231 () SeekEntryResult!2028)

(assert (=> b!288639 (= res!150264 (or lt!142234 (= lt!142231 (MissingVacant!2028 i!1256))))))

(assert (=> b!288639 (= lt!142234 (= lt!142231 (MissingZero!2028 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14504 (_ BitVec 32)) SeekEntryResult!2028)

(assert (=> b!288639 (= lt!142231 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288640 () Bool)

(assert (=> b!288640 (= e!182749 e!182753)))

(declare-fun res!150265 () Bool)

(assert (=> b!288640 (=> (not res!150265) (not e!182753))))

(assert (=> b!288640 (= res!150265 lt!142234)))

(declare-fun lt!142232 () SeekEntryResult!2028)

(declare-fun lt!142233 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14504 (_ BitVec 32)) SeekEntryResult!2028)

(assert (=> b!288640 (= lt!142232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142233 k0!2524 (array!14505 (store (arr!6879 a!3312) i!1256 k0!2524) (size!7231 a!3312)) mask!3809))))

(assert (=> b!288640 (= lt!142230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142233 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288640 (= lt!142233 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288641 () Bool)

(declare-fun res!150266 () Bool)

(assert (=> b!288641 (=> (not res!150266) (not e!182752))))

(declare-fun arrayContainsKey!0 (array!14504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288641 (= res!150266 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288642 () Bool)

(declare-fun res!150260 () Bool)

(assert (=> b!288642 (=> (not res!150260) (not e!182752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288642 (= res!150260 (validKeyInArray!0 k0!2524))))

(declare-fun b!288643 () Bool)

(declare-fun res!150267 () Bool)

(assert (=> b!288643 (=> (not res!150267) (not e!182749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14504 (_ BitVec 32)) Bool)

(assert (=> b!288643 (= res!150267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288644 () Bool)

(declare-fun res!150261 () Bool)

(assert (=> b!288644 (=> (not res!150261) (not e!182752))))

(assert (=> b!288644 (= res!150261 (and (= (size!7231 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7231 a!3312))))))

(assert (= (and start!28190 res!150262) b!288644))

(assert (= (and b!288644 res!150261) b!288642))

(assert (= (and b!288642 res!150260) b!288641))

(assert (= (and b!288641 res!150266) b!288639))

(assert (= (and b!288639 res!150264) b!288643))

(assert (= (and b!288643 res!150267) b!288640))

(assert (= (and b!288640 res!150265) b!288638))

(assert (= (and b!288638 res!150263) b!288637))

(declare-fun m!302851 () Bool)

(assert (=> b!288638 m!302851))

(declare-fun m!302853 () Bool)

(assert (=> b!288642 m!302853))

(declare-fun m!302855 () Bool)

(assert (=> b!288641 m!302855))

(declare-fun m!302857 () Bool)

(assert (=> b!288640 m!302857))

(declare-fun m!302859 () Bool)

(assert (=> b!288640 m!302859))

(declare-fun m!302861 () Bool)

(assert (=> b!288640 m!302861))

(declare-fun m!302863 () Bool)

(assert (=> b!288640 m!302863))

(declare-fun m!302865 () Bool)

(assert (=> b!288639 m!302865))

(assert (=> b!288637 m!302851))

(declare-fun m!302867 () Bool)

(assert (=> b!288643 m!302867))

(declare-fun m!302869 () Bool)

(assert (=> start!28190 m!302869))

(declare-fun m!302871 () Bool)

(assert (=> start!28190 m!302871))

(check-sat (not b!288640) (not start!28190) (not b!288643) (not b!288641) (not b!288642) (not b!288639))
(check-sat)
