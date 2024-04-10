; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28246 () Bool)

(assert start!28246)

(declare-fun b!289309 () Bool)

(declare-fun e!183172 () Bool)

(assert (=> b!289309 (= e!183172 (not true))))

(declare-datatypes ((array!14560 0))(
  ( (array!14561 (arr!6907 (Array (_ BitVec 32) (_ BitVec 64))) (size!7259 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14560)

(declare-datatypes ((SeekEntryResult!2056 0))(
  ( (MissingZero!2056 (index!10394 (_ BitVec 32))) (Found!2056 (index!10395 (_ BitVec 32))) (Intermediate!2056 (undefined!2868 Bool) (index!10396 (_ BitVec 32)) (x!28597 (_ BitVec 32))) (Undefined!2056) (MissingVacant!2056 (index!10397 (_ BitVec 32))) )
))
(declare-fun lt!142738 () SeekEntryResult!2056)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289309 (and (= (select (arr!6907 a!3312) (index!10396 lt!142738)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10396 lt!142738) i!1256))))

(declare-fun b!289310 () Bool)

(declare-fun e!183171 () Bool)

(declare-fun e!183169 () Bool)

(assert (=> b!289310 (= e!183171 e!183169)))

(declare-fun res!150938 () Bool)

(assert (=> b!289310 (=> (not res!150938) (not e!183169))))

(declare-fun lt!142737 () Bool)

(assert (=> b!289310 (= res!150938 lt!142737)))

(declare-fun lt!142734 () (_ BitVec 32))

(declare-fun lt!142736 () SeekEntryResult!2056)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14560 (_ BitVec 32)) SeekEntryResult!2056)

(assert (=> b!289310 (= lt!142736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142734 k!2524 (array!14561 (store (arr!6907 a!3312) i!1256 k!2524) (size!7259 a!3312)) mask!3809))))

(assert (=> b!289310 (= lt!142738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142734 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289310 (= lt!142734 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289311 () Bool)

(declare-fun res!150939 () Bool)

(declare-fun e!183170 () Bool)

(assert (=> b!289311 (=> (not res!150939) (not e!183170))))

(declare-fun arrayContainsKey!0 (array!14560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289311 (= res!150939 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289312 () Bool)

(assert (=> b!289312 (= e!183170 e!183171)))

(declare-fun res!150936 () Bool)

(assert (=> b!289312 (=> (not res!150936) (not e!183171))))

(declare-fun lt!142735 () SeekEntryResult!2056)

(assert (=> b!289312 (= res!150936 (or lt!142737 (= lt!142735 (MissingVacant!2056 i!1256))))))

(assert (=> b!289312 (= lt!142737 (= lt!142735 (MissingZero!2056 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14560 (_ BitVec 32)) SeekEntryResult!2056)

(assert (=> b!289312 (= lt!142735 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289314 () Bool)

(declare-fun res!150937 () Bool)

(assert (=> b!289314 (=> (not res!150937) (not e!183170))))

(assert (=> b!289314 (= res!150937 (and (= (size!7259 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7259 a!3312))))))

(declare-fun b!289315 () Bool)

(declare-fun res!150934 () Bool)

(assert (=> b!289315 (=> (not res!150934) (not e!183171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14560 (_ BitVec 32)) Bool)

(assert (=> b!289315 (= res!150934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289316 () Bool)

(assert (=> b!289316 (= e!183169 e!183172)))

(declare-fun res!150932 () Bool)

(assert (=> b!289316 (=> (not res!150932) (not e!183172))))

(declare-fun lt!142733 () Bool)

(assert (=> b!289316 (= res!150932 (and (or lt!142733 (not (undefined!2868 lt!142738))) (or lt!142733 (not (= (select (arr!6907 a!3312) (index!10396 lt!142738)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142733 (not (= (select (arr!6907 a!3312) (index!10396 lt!142738)) k!2524))) (not lt!142733)))))

(assert (=> b!289316 (= lt!142733 (not (is-Intermediate!2056 lt!142738)))))

(declare-fun res!150933 () Bool)

(assert (=> start!28246 (=> (not res!150933) (not e!183170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28246 (= res!150933 (validMask!0 mask!3809))))

(assert (=> start!28246 e!183170))

(assert (=> start!28246 true))

(declare-fun array_inv!4870 (array!14560) Bool)

(assert (=> start!28246 (array_inv!4870 a!3312)))

(declare-fun b!289313 () Bool)

(declare-fun res!150935 () Bool)

(assert (=> b!289313 (=> (not res!150935) (not e!183170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289313 (= res!150935 (validKeyInArray!0 k!2524))))

(assert (= (and start!28246 res!150933) b!289314))

(assert (= (and b!289314 res!150937) b!289313))

(assert (= (and b!289313 res!150935) b!289311))

(assert (= (and b!289311 res!150939) b!289312))

(assert (= (and b!289312 res!150936) b!289315))

(assert (= (and b!289315 res!150934) b!289310))

(assert (= (and b!289310 res!150938) b!289316))

(assert (= (and b!289316 res!150932) b!289309))

(declare-fun m!303467 () Bool)

(assert (=> b!289315 m!303467))

(declare-fun m!303469 () Bool)

(assert (=> start!28246 m!303469))

(declare-fun m!303471 () Bool)

(assert (=> start!28246 m!303471))

(declare-fun m!303473 () Bool)

(assert (=> b!289316 m!303473))

(assert (=> b!289309 m!303473))

(declare-fun m!303475 () Bool)

(assert (=> b!289311 m!303475))

(declare-fun m!303477 () Bool)

(assert (=> b!289312 m!303477))

(declare-fun m!303479 () Bool)

(assert (=> b!289313 m!303479))

(declare-fun m!303481 () Bool)

(assert (=> b!289310 m!303481))

(declare-fun m!303483 () Bool)

(assert (=> b!289310 m!303483))

(declare-fun m!303485 () Bool)

(assert (=> b!289310 m!303485))

(declare-fun m!303487 () Bool)

(assert (=> b!289310 m!303487))

(push 1)

