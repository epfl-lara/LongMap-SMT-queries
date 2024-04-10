; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28288 () Bool)

(assert start!28288)

(declare-fun res!151368 () Bool)

(declare-fun e!183488 () Bool)

(assert (=> start!28288 (=> (not res!151368) (not e!183488))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28288 (= res!151368 (validMask!0 mask!3809))))

(assert (=> start!28288 e!183488))

(assert (=> start!28288 true))

(declare-datatypes ((array!14602 0))(
  ( (array!14603 (arr!6928 (Array (_ BitVec 32) (_ BitVec 64))) (size!7280 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14602)

(declare-fun array_inv!4891 (array!14602) Bool)

(assert (=> start!28288 (array_inv!4891 a!3312)))

(declare-fun b!289887 () Bool)

(declare-fun res!151371 () Bool)

(declare-fun e!183486 () Bool)

(assert (=> b!289887 (=> (not res!151371) (not e!183486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14602 (_ BitVec 32)) Bool)

(assert (=> b!289887 (= res!151371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289888 () Bool)

(declare-fun res!151366 () Bool)

(assert (=> b!289888 (=> (not res!151366) (not e!183488))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289888 (= res!151366 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289889 () Bool)

(declare-fun lt!143123 () Bool)

(assert (=> b!289889 (= e!183486 (and (not lt!143123) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!143121 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2077 0))(
  ( (MissingZero!2077 (index!10478 (_ BitVec 32))) (Found!2077 (index!10479 (_ BitVec 32))) (Intermediate!2077 (undefined!2889 Bool) (index!10480 (_ BitVec 32)) (x!28674 (_ BitVec 32))) (Undefined!2077) (MissingVacant!2077 (index!10481 (_ BitVec 32))) )
))
(declare-fun lt!143122 () SeekEntryResult!2077)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14602 (_ BitVec 32)) SeekEntryResult!2077)

(assert (=> b!289889 (= lt!143122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143121 k!2524 (array!14603 (store (arr!6928 a!3312) i!1256 k!2524) (size!7280 a!3312)) mask!3809))))

(declare-fun lt!143124 () SeekEntryResult!2077)

(assert (=> b!289889 (= lt!143124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143121 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289889 (= lt!143121 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289890 () Bool)

(declare-fun res!151367 () Bool)

(assert (=> b!289890 (=> (not res!151367) (not e!183488))))

(assert (=> b!289890 (= res!151367 (and (= (size!7280 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7280 a!3312))))))

(declare-fun b!289891 () Bool)

(assert (=> b!289891 (= e!183488 e!183486)))

(declare-fun res!151370 () Bool)

(assert (=> b!289891 (=> (not res!151370) (not e!183486))))

(declare-fun lt!143125 () SeekEntryResult!2077)

(assert (=> b!289891 (= res!151370 (or lt!143123 (= lt!143125 (MissingVacant!2077 i!1256))))))

(assert (=> b!289891 (= lt!143123 (= lt!143125 (MissingZero!2077 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14602 (_ BitVec 32)) SeekEntryResult!2077)

(assert (=> b!289891 (= lt!143125 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289892 () Bool)

(declare-fun res!151369 () Bool)

(assert (=> b!289892 (=> (not res!151369) (not e!183488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289892 (= res!151369 (validKeyInArray!0 k!2524))))

(assert (= (and start!28288 res!151368) b!289890))

(assert (= (and b!289890 res!151367) b!289892))

(assert (= (and b!289892 res!151369) b!289888))

(assert (= (and b!289888 res!151366) b!289891))

(assert (= (and b!289891 res!151370) b!289887))

(assert (= (and b!289887 res!151371) b!289889))

(declare-fun m!303967 () Bool)

(assert (=> b!289887 m!303967))

(declare-fun m!303969 () Bool)

(assert (=> b!289891 m!303969))

(declare-fun m!303971 () Bool)

(assert (=> b!289892 m!303971))

(declare-fun m!303973 () Bool)

(assert (=> b!289888 m!303973))

(declare-fun m!303975 () Bool)

(assert (=> b!289889 m!303975))

(declare-fun m!303977 () Bool)

(assert (=> b!289889 m!303977))

(declare-fun m!303979 () Bool)

(assert (=> b!289889 m!303979))

(declare-fun m!303981 () Bool)

(assert (=> b!289889 m!303981))

(declare-fun m!303983 () Bool)

(assert (=> start!28288 m!303983))

(declare-fun m!303985 () Bool)

(assert (=> start!28288 m!303985))

(push 1)

(assert (not b!289891))

(assert (not b!289887))

(assert (not b!289888))

(assert (not b!289892))

(assert (not b!289889))

(assert (not start!28288))

(check-sat)

(pop 1)

