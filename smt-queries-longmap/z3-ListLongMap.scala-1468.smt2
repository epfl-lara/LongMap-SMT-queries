; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28186 () Bool)

(assert start!28186)

(declare-fun b!288732 () Bool)

(declare-fun e!182803 () Bool)

(declare-fun e!182806 () Bool)

(assert (=> b!288732 (= e!182803 e!182806)))

(declare-fun res!150334 () Bool)

(assert (=> b!288732 (=> (not res!150334) (not e!182806))))

(declare-fun lt!142329 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1994 0))(
  ( (MissingZero!1994 (index!10146 (_ BitVec 32))) (Found!1994 (index!10147 (_ BitVec 32))) (Intermediate!1994 (undefined!2806 Bool) (index!10148 (_ BitVec 32)) (x!28471 (_ BitVec 32))) (Undefined!1994) (MissingVacant!1994 (index!10149 (_ BitVec 32))) )
))
(declare-fun lt!142325 () SeekEntryResult!1994)

(assert (=> b!288732 (= res!150334 (or lt!142329 (= lt!142325 (MissingVacant!1994 i!1256))))))

(assert (=> b!288732 (= lt!142329 (= lt!142325 (MissingZero!1994 i!1256)))))

(declare-datatypes ((array!14505 0))(
  ( (array!14506 (arr!6880 (Array (_ BitVec 32) (_ BitVec 64))) (size!7232 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14505)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14505 (_ BitVec 32)) SeekEntryResult!1994)

(assert (=> b!288732 (= lt!142325 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288733 () Bool)

(declare-fun e!182805 () Bool)

(declare-fun e!182807 () Bool)

(assert (=> b!288733 (= e!182805 e!182807)))

(declare-fun res!150332 () Bool)

(assert (=> b!288733 (=> (not res!150332) (not e!182807))))

(declare-fun lt!142328 () SeekEntryResult!1994)

(declare-fun lt!142324 () Bool)

(assert (=> b!288733 (= res!150332 (and (or lt!142324 (not (undefined!2806 lt!142328))) (or lt!142324 (not (= (select (arr!6880 a!3312) (index!10148 lt!142328)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142324 (not (= (select (arr!6880 a!3312) (index!10148 lt!142328)) k0!2524))) (not lt!142324)))))

(get-info :version)

(assert (=> b!288733 (= lt!142324 (not ((_ is Intermediate!1994) lt!142328)))))

(declare-fun b!288734 () Bool)

(assert (=> b!288734 (= e!182806 e!182805)))

(declare-fun res!150329 () Bool)

(assert (=> b!288734 (=> (not res!150329) (not e!182805))))

(assert (=> b!288734 (= res!150329 lt!142329)))

(declare-fun lt!142326 () (_ BitVec 32))

(declare-fun lt!142327 () SeekEntryResult!1994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14505 (_ BitVec 32)) SeekEntryResult!1994)

(assert (=> b!288734 (= lt!142327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142326 k0!2524 (array!14506 (store (arr!6880 a!3312) i!1256 k0!2524) (size!7232 a!3312)) mask!3809))))

(assert (=> b!288734 (= lt!142328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142326 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288734 (= lt!142326 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288735 () Bool)

(declare-fun res!150333 () Bool)

(assert (=> b!288735 (=> (not res!150333) (not e!182803))))

(assert (=> b!288735 (= res!150333 (and (= (size!7232 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7232 a!3312))))))

(declare-fun b!288736 () Bool)

(declare-fun res!150335 () Bool)

(assert (=> b!288736 (=> (not res!150335) (not e!182803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288736 (= res!150335 (validKeyInArray!0 k0!2524))))

(declare-fun b!288737 () Bool)

(declare-fun res!150331 () Bool)

(assert (=> b!288737 (=> (not res!150331) (not e!182806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14505 (_ BitVec 32)) Bool)

(assert (=> b!288737 (= res!150331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150330 () Bool)

(assert (=> start!28186 (=> (not res!150330) (not e!182803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28186 (= res!150330 (validMask!0 mask!3809))))

(assert (=> start!28186 e!182803))

(assert (=> start!28186 true))

(declare-fun array_inv!4830 (array!14505) Bool)

(assert (=> start!28186 (array_inv!4830 a!3312)))

(declare-fun b!288738 () Bool)

(assert (=> b!288738 (= e!182807 (not true))))

(assert (=> b!288738 (and (= (select (arr!6880 a!3312) (index!10148 lt!142328)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10148 lt!142328) i!1256))))

(declare-fun b!288739 () Bool)

(declare-fun res!150336 () Bool)

(assert (=> b!288739 (=> (not res!150336) (not e!182803))))

(declare-fun arrayContainsKey!0 (array!14505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288739 (= res!150336 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28186 res!150330) b!288735))

(assert (= (and b!288735 res!150333) b!288736))

(assert (= (and b!288736 res!150335) b!288739))

(assert (= (and b!288739 res!150336) b!288732))

(assert (= (and b!288732 res!150334) b!288737))

(assert (= (and b!288737 res!150331) b!288734))

(assert (= (and b!288734 res!150329) b!288733))

(assert (= (and b!288733 res!150332) b!288738))

(declare-fun m!303101 () Bool)

(assert (=> b!288733 m!303101))

(declare-fun m!303103 () Bool)

(assert (=> b!288737 m!303103))

(declare-fun m!303105 () Bool)

(assert (=> b!288732 m!303105))

(assert (=> b!288738 m!303101))

(declare-fun m!303107 () Bool)

(assert (=> b!288734 m!303107))

(declare-fun m!303109 () Bool)

(assert (=> b!288734 m!303109))

(declare-fun m!303111 () Bool)

(assert (=> b!288734 m!303111))

(declare-fun m!303113 () Bool)

(assert (=> b!288734 m!303113))

(declare-fun m!303115 () Bool)

(assert (=> b!288739 m!303115))

(declare-fun m!303117 () Bool)

(assert (=> start!28186 m!303117))

(declare-fun m!303119 () Bool)

(assert (=> start!28186 m!303119))

(declare-fun m!303121 () Bool)

(assert (=> b!288736 m!303121))

(check-sat (not b!288732) (not b!288736) (not b!288734) (not b!288739) (not b!288737) (not start!28186))
(check-sat)
