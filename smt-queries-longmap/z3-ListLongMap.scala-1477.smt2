; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28244 () Bool)

(assert start!28244)

(declare-fun b!289186 () Bool)

(declare-fun res!150864 () Bool)

(declare-fun e!183084 () Bool)

(assert (=> b!289186 (=> (not res!150864) (not e!183084))))

(declare-datatypes ((array!14551 0))(
  ( (array!14552 (arr!6903 (Array (_ BitVec 32) (_ BitVec 64))) (size!7256 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14551)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289186 (= res!150864 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289187 () Bool)

(declare-fun res!150868 () Bool)

(assert (=> b!289187 (=> (not res!150868) (not e!183084))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289187 (= res!150868 (and (= (size!7256 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7256 a!3312))))))

(declare-fun b!289188 () Bool)

(declare-fun e!183086 () Bool)

(assert (=> b!289188 (= e!183086 (not true))))

(declare-datatypes ((SeekEntryResult!2051 0))(
  ( (MissingZero!2051 (index!10374 (_ BitVec 32))) (Found!2051 (index!10375 (_ BitVec 32))) (Intermediate!2051 (undefined!2863 Bool) (index!10376 (_ BitVec 32)) (x!28599 (_ BitVec 32))) (Undefined!2051) (MissingVacant!2051 (index!10377 (_ BitVec 32))) )
))
(declare-fun lt!142570 () SeekEntryResult!2051)

(assert (=> b!289188 (and (= (select (arr!6903 a!3312) (index!10376 lt!142570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10376 lt!142570) i!1256))))

(declare-fun res!150867 () Bool)

(assert (=> start!28244 (=> (not res!150867) (not e!183084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28244 (= res!150867 (validMask!0 mask!3809))))

(assert (=> start!28244 e!183084))

(assert (=> start!28244 true))

(declare-fun array_inv!4875 (array!14551) Bool)

(assert (=> start!28244 (array_inv!4875 a!3312)))

(declare-fun b!289189 () Bool)

(declare-fun e!183083 () Bool)

(assert (=> b!289189 (= e!183083 e!183086)))

(declare-fun res!150863 () Bool)

(assert (=> b!289189 (=> (not res!150863) (not e!183086))))

(declare-fun lt!142573 () Bool)

(assert (=> b!289189 (= res!150863 (and (or lt!142573 (not (undefined!2863 lt!142570))) (or lt!142573 (not (= (select (arr!6903 a!3312) (index!10376 lt!142570)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142573 (not (= (select (arr!6903 a!3312) (index!10376 lt!142570)) k0!2524))) (not lt!142573)))))

(get-info :version)

(assert (=> b!289189 (= lt!142573 (not ((_ is Intermediate!2051) lt!142570)))))

(declare-fun b!289190 () Bool)

(declare-fun e!183087 () Bool)

(assert (=> b!289190 (= e!183087 e!183083)))

(declare-fun res!150861 () Bool)

(assert (=> b!289190 (=> (not res!150861) (not e!183083))))

(declare-fun lt!142572 () Bool)

(assert (=> b!289190 (= res!150861 lt!142572)))

(declare-fun lt!142571 () SeekEntryResult!2051)

(declare-fun lt!142574 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14551 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!289190 (= lt!142571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142574 k0!2524 (array!14552 (store (arr!6903 a!3312) i!1256 k0!2524) (size!7256 a!3312)) mask!3809))))

(assert (=> b!289190 (= lt!142570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142574 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289190 (= lt!142574 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289191 () Bool)

(declare-fun res!150866 () Bool)

(assert (=> b!289191 (=> (not res!150866) (not e!183087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14551 (_ BitVec 32)) Bool)

(assert (=> b!289191 (= res!150866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289192 () Bool)

(declare-fun res!150862 () Bool)

(assert (=> b!289192 (=> (not res!150862) (not e!183084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289192 (= res!150862 (validKeyInArray!0 k0!2524))))

(declare-fun b!289193 () Bool)

(assert (=> b!289193 (= e!183084 e!183087)))

(declare-fun res!150865 () Bool)

(assert (=> b!289193 (=> (not res!150865) (not e!183087))))

(declare-fun lt!142575 () SeekEntryResult!2051)

(assert (=> b!289193 (= res!150865 (or lt!142572 (= lt!142575 (MissingVacant!2051 i!1256))))))

(assert (=> b!289193 (= lt!142572 (= lt!142575 (MissingZero!2051 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14551 (_ BitVec 32)) SeekEntryResult!2051)

(assert (=> b!289193 (= lt!142575 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28244 res!150867) b!289187))

(assert (= (and b!289187 res!150868) b!289192))

(assert (= (and b!289192 res!150862) b!289186))

(assert (= (and b!289186 res!150864) b!289193))

(assert (= (and b!289193 res!150865) b!289191))

(assert (= (and b!289191 res!150866) b!289190))

(assert (= (and b!289190 res!150861) b!289189))

(assert (= (and b!289189 res!150863) b!289188))

(declare-fun m!302897 () Bool)

(assert (=> b!289189 m!302897))

(declare-fun m!302899 () Bool)

(assert (=> b!289193 m!302899))

(declare-fun m!302901 () Bool)

(assert (=> start!28244 m!302901))

(declare-fun m!302903 () Bool)

(assert (=> start!28244 m!302903))

(declare-fun m!302905 () Bool)

(assert (=> b!289192 m!302905))

(declare-fun m!302907 () Bool)

(assert (=> b!289190 m!302907))

(declare-fun m!302909 () Bool)

(assert (=> b!289190 m!302909))

(declare-fun m!302911 () Bool)

(assert (=> b!289190 m!302911))

(declare-fun m!302913 () Bool)

(assert (=> b!289190 m!302913))

(declare-fun m!302915 () Bool)

(assert (=> b!289191 m!302915))

(declare-fun m!302917 () Bool)

(assert (=> b!289186 m!302917))

(assert (=> b!289188 m!302897))

(check-sat (not b!289191) (not b!289192) (not b!289190) (not b!289186) (not b!289193) (not start!28244))
(check-sat)
