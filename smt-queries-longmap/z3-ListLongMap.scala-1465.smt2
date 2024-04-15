; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28172 () Bool)

(assert start!28172)

(declare-fun b!288322 () Bool)

(declare-fun res!150001 () Bool)

(declare-fun e!182543 () Bool)

(assert (=> b!288322 (=> (not res!150001) (not e!182543))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14479 0))(
  ( (array!14480 (arr!6867 (Array (_ BitVec 32) (_ BitVec 64))) (size!7220 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14479)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288322 (= res!150001 (and (= (size!7220 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7220 a!3312))))))

(declare-fun b!288323 () Bool)

(declare-fun res!150002 () Bool)

(assert (=> b!288323 (=> (not res!150002) (not e!182543))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288323 (= res!150002 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288324 () Bool)

(declare-fun e!182547 () Bool)

(declare-fun e!182546 () Bool)

(assert (=> b!288324 (= e!182547 e!182546)))

(declare-fun res!150004 () Bool)

(assert (=> b!288324 (=> (not res!150004) (not e!182546))))

(declare-fun lt!141925 () Bool)

(assert (=> b!288324 (= res!150004 lt!141925)))

(declare-fun lt!141922 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2015 0))(
  ( (MissingZero!2015 (index!10230 (_ BitVec 32))) (Found!2015 (index!10231 (_ BitVec 32))) (Intermediate!2015 (undefined!2827 Bool) (index!10232 (_ BitVec 32)) (x!28467 (_ BitVec 32))) (Undefined!2015) (MissingVacant!2015 (index!10233 (_ BitVec 32))) )
))
(declare-fun lt!141923 () SeekEntryResult!2015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14479 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!288324 (= lt!141923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141922 k0!2524 (array!14480 (store (arr!6867 a!3312) i!1256 k0!2524) (size!7220 a!3312)) mask!3809))))

(declare-fun lt!141924 () SeekEntryResult!2015)

(assert (=> b!288324 (= lt!141924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141922 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288324 (= lt!141922 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288325 () Bool)

(declare-fun e!182545 () Bool)

(assert (=> b!288325 (= e!182546 e!182545)))

(declare-fun res!149997 () Bool)

(assert (=> b!288325 (=> (not res!149997) (not e!182545))))

(declare-fun lt!141926 () Bool)

(assert (=> b!288325 (= res!149997 (and (or lt!141926 (not (undefined!2827 lt!141924))) (or lt!141926 (not (= (select (arr!6867 a!3312) (index!10232 lt!141924)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141926 (not (= (select (arr!6867 a!3312) (index!10232 lt!141924)) k0!2524))) (not lt!141926)))))

(get-info :version)

(assert (=> b!288325 (= lt!141926 (not ((_ is Intermediate!2015) lt!141924)))))

(declare-fun b!288327 () Bool)

(declare-fun res!149998 () Bool)

(assert (=> b!288327 (=> (not res!149998) (not e!182547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14479 (_ BitVec 32)) Bool)

(assert (=> b!288327 (= res!149998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288328 () Bool)

(assert (=> b!288328 (= e!182545 (not true))))

(assert (=> b!288328 (and (= (select (arr!6867 a!3312) (index!10232 lt!141924)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10232 lt!141924) i!1256))))

(declare-fun b!288329 () Bool)

(assert (=> b!288329 (= e!182543 e!182547)))

(declare-fun res!150000 () Bool)

(assert (=> b!288329 (=> (not res!150000) (not e!182547))))

(declare-fun lt!141927 () SeekEntryResult!2015)

(assert (=> b!288329 (= res!150000 (or lt!141925 (= lt!141927 (MissingVacant!2015 i!1256))))))

(assert (=> b!288329 (= lt!141925 (= lt!141927 (MissingZero!2015 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14479 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!288329 (= lt!141927 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150003 () Bool)

(assert (=> start!28172 (=> (not res!150003) (not e!182543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28172 (= res!150003 (validMask!0 mask!3809))))

(assert (=> start!28172 e!182543))

(assert (=> start!28172 true))

(declare-fun array_inv!4839 (array!14479) Bool)

(assert (=> start!28172 (array_inv!4839 a!3312)))

(declare-fun b!288326 () Bool)

(declare-fun res!149999 () Bool)

(assert (=> b!288326 (=> (not res!149999) (not e!182543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288326 (= res!149999 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28172 res!150003) b!288322))

(assert (= (and b!288322 res!150001) b!288326))

(assert (= (and b!288326 res!149999) b!288323))

(assert (= (and b!288323 res!150002) b!288329))

(assert (= (and b!288329 res!150000) b!288327))

(assert (= (and b!288327 res!149998) b!288324))

(assert (= (and b!288324 res!150004) b!288325))

(assert (= (and b!288325 res!149997) b!288328))

(declare-fun m!302105 () Bool)

(assert (=> b!288325 m!302105))

(declare-fun m!302107 () Bool)

(assert (=> b!288324 m!302107))

(declare-fun m!302109 () Bool)

(assert (=> b!288324 m!302109))

(declare-fun m!302111 () Bool)

(assert (=> b!288324 m!302111))

(declare-fun m!302113 () Bool)

(assert (=> b!288324 m!302113))

(declare-fun m!302115 () Bool)

(assert (=> b!288326 m!302115))

(declare-fun m!302117 () Bool)

(assert (=> b!288327 m!302117))

(declare-fun m!302119 () Bool)

(assert (=> b!288329 m!302119))

(declare-fun m!302121 () Bool)

(assert (=> start!28172 m!302121))

(declare-fun m!302123 () Bool)

(assert (=> start!28172 m!302123))

(assert (=> b!288328 m!302105))

(declare-fun m!302125 () Bool)

(assert (=> b!288323 m!302125))

(check-sat (not b!288324) (not b!288327) (not b!288323) (not start!28172) (not b!288329) (not b!288326))
(check-sat)
