; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29958 () Bool)

(assert start!29958)

(declare-fun b!300915 () Bool)

(declare-fun e!189984 () Bool)

(assert (=> b!300915 (= e!189984 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149713 () (_ BitVec 32))

(declare-datatypes ((array!15191 0))(
  ( (array!15192 (arr!7188 (Array (_ BitVec 32) (_ BitVec 64))) (size!7540 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15191)

(declare-datatypes ((SeekEntryResult!2337 0))(
  ( (MissingZero!2337 (index!11524 (_ BitVec 32))) (Found!2337 (index!11525 (_ BitVec 32))) (Intermediate!2337 (undefined!3149 Bool) (index!11526 (_ BitVec 32)) (x!29785 (_ BitVec 32))) (Undefined!2337) (MissingVacant!2337 (index!11527 (_ BitVec 32))) )
))
(declare-fun lt!149715 () SeekEntryResult!2337)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15191 (_ BitVec 32)) SeekEntryResult!2337)

(assert (=> b!300915 (= lt!149715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149713 k0!2524 (array!15192 (store (arr!7188 a!3312) i!1256 k0!2524) (size!7540 a!3312)) mask!3809))))

(declare-fun lt!149714 () SeekEntryResult!2337)

(assert (=> b!300915 (= lt!149714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149713 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300915 (= lt!149713 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300916 () Bool)

(declare-fun e!189983 () Bool)

(assert (=> b!300916 (= e!189983 e!189984)))

(declare-fun res!158665 () Bool)

(assert (=> b!300916 (=> (not res!158665) (not e!189984))))

(declare-fun lt!149712 () SeekEntryResult!2337)

(assert (=> b!300916 (= res!158665 (or (= lt!149712 (MissingZero!2337 i!1256)) (= lt!149712 (MissingVacant!2337 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15191 (_ BitVec 32)) SeekEntryResult!2337)

(assert (=> b!300916 (= lt!149712 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!158670 () Bool)

(assert (=> start!29958 (=> (not res!158670) (not e!189983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29958 (= res!158670 (validMask!0 mask!3809))))

(assert (=> start!29958 e!189983))

(assert (=> start!29958 true))

(declare-fun array_inv!5151 (array!15191) Bool)

(assert (=> start!29958 (array_inv!5151 a!3312)))

(declare-fun b!300917 () Bool)

(declare-fun res!158667 () Bool)

(assert (=> b!300917 (=> (not res!158667) (not e!189983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300917 (= res!158667 (validKeyInArray!0 k0!2524))))

(declare-fun b!300918 () Bool)

(declare-fun res!158666 () Bool)

(assert (=> b!300918 (=> (not res!158666) (not e!189983))))

(declare-fun arrayContainsKey!0 (array!15191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300918 (= res!158666 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300919 () Bool)

(declare-fun res!158668 () Bool)

(assert (=> b!300919 (=> (not res!158668) (not e!189983))))

(assert (=> b!300919 (= res!158668 (and (= (size!7540 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7540 a!3312))))))

(declare-fun b!300920 () Bool)

(declare-fun res!158669 () Bool)

(assert (=> b!300920 (=> (not res!158669) (not e!189984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15191 (_ BitVec 32)) Bool)

(assert (=> b!300920 (= res!158669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29958 res!158670) b!300919))

(assert (= (and b!300919 res!158668) b!300917))

(assert (= (and b!300917 res!158667) b!300918))

(assert (= (and b!300918 res!158666) b!300916))

(assert (= (and b!300916 res!158665) b!300920))

(assert (= (and b!300920 res!158669) b!300915))

(declare-fun m!312809 () Bool)

(assert (=> b!300917 m!312809))

(declare-fun m!312811 () Bool)

(assert (=> b!300918 m!312811))

(declare-fun m!312813 () Bool)

(assert (=> start!29958 m!312813))

(declare-fun m!312815 () Bool)

(assert (=> start!29958 m!312815))

(declare-fun m!312817 () Bool)

(assert (=> b!300916 m!312817))

(declare-fun m!312819 () Bool)

(assert (=> b!300915 m!312819))

(declare-fun m!312821 () Bool)

(assert (=> b!300915 m!312821))

(declare-fun m!312823 () Bool)

(assert (=> b!300915 m!312823))

(declare-fun m!312825 () Bool)

(assert (=> b!300915 m!312825))

(declare-fun m!312827 () Bool)

(assert (=> b!300920 m!312827))

(check-sat (not b!300917) (not b!300918) (not start!29958) (not b!300920) (not b!300915) (not b!300916))
(check-sat)
