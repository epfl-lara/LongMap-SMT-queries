; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28426 () Bool)

(assert start!28426)

(declare-fun b!291216 () Bool)

(declare-fun res!152532 () Bool)

(declare-fun e!184268 () Bool)

(assert (=> b!291216 (=> (not res!152532) (not e!184268))))

(declare-datatypes ((array!14700 0))(
  ( (array!14701 (arr!6976 (Array (_ BitVec 32) (_ BitVec 64))) (size!7328 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14700)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291216 (= res!152532 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291217 () Bool)

(declare-fun res!152528 () Bool)

(declare-fun e!184267 () Bool)

(assert (=> b!291217 (=> (not res!152528) (not e!184267))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14700 (_ BitVec 32)) Bool)

(assert (=> b!291217 (= res!152528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291218 () Bool)

(assert (=> b!291218 (= e!184268 e!184267)))

(declare-fun res!152530 () Bool)

(assert (=> b!291218 (=> (not res!152530) (not e!184267))))

(declare-fun lt!144054 () Bool)

(declare-datatypes ((SeekEntryResult!2090 0))(
  ( (MissingZero!2090 (index!10530 (_ BitVec 32))) (Found!2090 (index!10531 (_ BitVec 32))) (Intermediate!2090 (undefined!2902 Bool) (index!10532 (_ BitVec 32)) (x!28829 (_ BitVec 32))) (Undefined!2090) (MissingVacant!2090 (index!10533 (_ BitVec 32))) )
))
(declare-fun lt!144049 () SeekEntryResult!2090)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291218 (= res!152530 (or lt!144054 (= lt!144049 (MissingVacant!2090 i!1256))))))

(assert (=> b!291218 (= lt!144054 (= lt!144049 (MissingZero!2090 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14700 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!291218 (= lt!144049 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291219 () Bool)

(declare-fun res!152535 () Bool)

(assert (=> b!291219 (=> (not res!152535) (not e!184268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291219 (= res!152535 (validKeyInArray!0 k0!2524))))

(declare-fun b!291220 () Bool)

(declare-fun res!152531 () Bool)

(assert (=> b!291220 (=> (not res!152531) (not e!184268))))

(assert (=> b!291220 (= res!152531 (and (= (size!7328 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7328 a!3312))))))

(declare-fun b!291221 () Bool)

(declare-fun e!184271 () Bool)

(declare-fun lt!144053 () SeekEntryResult!2090)

(assert (=> b!291221 (= e!184271 (not (= lt!144053 (Intermediate!2090 false (index!10532 lt!144053) (x!28829 lt!144053)))))))

(assert (=> b!291221 (= (index!10532 lt!144053) i!1256)))

(declare-fun res!152529 () Bool)

(assert (=> start!28426 (=> (not res!152529) (not e!184268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28426 (= res!152529 (validMask!0 mask!3809))))

(assert (=> start!28426 e!184268))

(assert (=> start!28426 true))

(declare-fun array_inv!4926 (array!14700) Bool)

(assert (=> start!28426 (array_inv!4926 a!3312)))

(declare-fun b!291222 () Bool)

(declare-fun e!184269 () Bool)

(assert (=> b!291222 (= e!184269 e!184271)))

(declare-fun res!152534 () Bool)

(assert (=> b!291222 (=> (not res!152534) (not e!184271))))

(declare-fun lt!144051 () Bool)

(assert (=> b!291222 (= res!152534 (and (or lt!144051 (not (undefined!2902 lt!144053))) (not lt!144051) (= (select (arr!6976 a!3312) (index!10532 lt!144053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291222 (= lt!144051 (not ((_ is Intermediate!2090) lt!144053)))))

(declare-fun b!291223 () Bool)

(assert (=> b!291223 (= e!184267 e!184269)))

(declare-fun res!152533 () Bool)

(assert (=> b!291223 (=> (not res!152533) (not e!184269))))

(assert (=> b!291223 (= res!152533 (and (not lt!144054) (= lt!144049 (MissingVacant!2090 i!1256))))))

(declare-fun lt!144052 () SeekEntryResult!2090)

(declare-fun lt!144050 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14700 (_ BitVec 32)) SeekEntryResult!2090)

(assert (=> b!291223 (= lt!144052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144050 k0!2524 (array!14701 (store (arr!6976 a!3312) i!1256 k0!2524) (size!7328 a!3312)) mask!3809))))

(assert (=> b!291223 (= lt!144053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144050 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291223 (= lt!144050 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28426 res!152529) b!291220))

(assert (= (and b!291220 res!152531) b!291219))

(assert (= (and b!291219 res!152535) b!291216))

(assert (= (and b!291216 res!152532) b!291218))

(assert (= (and b!291218 res!152530) b!291217))

(assert (= (and b!291217 res!152528) b!291223))

(assert (= (and b!291223 res!152533) b!291222))

(assert (= (and b!291222 res!152534) b!291221))

(declare-fun m!305333 () Bool)

(assert (=> start!28426 m!305333))

(declare-fun m!305335 () Bool)

(assert (=> start!28426 m!305335))

(declare-fun m!305337 () Bool)

(assert (=> b!291222 m!305337))

(declare-fun m!305339 () Bool)

(assert (=> b!291219 m!305339))

(declare-fun m!305341 () Bool)

(assert (=> b!291218 m!305341))

(declare-fun m!305343 () Bool)

(assert (=> b!291216 m!305343))

(declare-fun m!305345 () Bool)

(assert (=> b!291223 m!305345))

(declare-fun m!305347 () Bool)

(assert (=> b!291223 m!305347))

(declare-fun m!305349 () Bool)

(assert (=> b!291223 m!305349))

(declare-fun m!305351 () Bool)

(assert (=> b!291223 m!305351))

(declare-fun m!305353 () Bool)

(assert (=> b!291217 m!305353))

(check-sat (not b!291218) (not start!28426) (not b!291216) (not b!291217) (not b!291223) (not b!291219))
(check-sat)
