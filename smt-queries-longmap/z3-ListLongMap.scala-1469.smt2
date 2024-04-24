; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28192 () Bool)

(assert start!28192)

(declare-fun b!288804 () Bool)

(declare-fun e!182849 () Bool)

(declare-fun e!182852 () Bool)

(assert (=> b!288804 (= e!182849 e!182852)))

(declare-fun res!150402 () Bool)

(assert (=> b!288804 (=> (not res!150402) (not e!182852))))

(declare-fun lt!142379 () Bool)

(assert (=> b!288804 (= res!150402 lt!142379)))

(declare-datatypes ((SeekEntryResult!1997 0))(
  ( (MissingZero!1997 (index!10158 (_ BitVec 32))) (Found!1997 (index!10159 (_ BitVec 32))) (Intermediate!1997 (undefined!2809 Bool) (index!10160 (_ BitVec 32)) (x!28482 (_ BitVec 32))) (Undefined!1997) (MissingVacant!1997 (index!10161 (_ BitVec 32))) )
))
(declare-fun lt!142382 () SeekEntryResult!1997)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142383 () (_ BitVec 32))

(declare-datatypes ((array!14511 0))(
  ( (array!14512 (arr!6883 (Array (_ BitVec 32) (_ BitVec 64))) (size!7235 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14511)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14511 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!288804 (= lt!142382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142383 k0!2524 (array!14512 (store (arr!6883 a!3312) i!1256 k0!2524) (size!7235 a!3312)) mask!3809))))

(declare-fun lt!142381 () SeekEntryResult!1997)

(assert (=> b!288804 (= lt!142381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142383 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288804 (= lt!142383 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288805 () Bool)

(declare-fun e!182848 () Bool)

(assert (=> b!288805 (= e!182848 e!182849)))

(declare-fun res!150408 () Bool)

(assert (=> b!288805 (=> (not res!150408) (not e!182849))))

(declare-fun lt!142380 () SeekEntryResult!1997)

(assert (=> b!288805 (= res!150408 (or lt!142379 (= lt!142380 (MissingVacant!1997 i!1256))))))

(assert (=> b!288805 (= lt!142379 (= lt!142380 (MissingZero!1997 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14511 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!288805 (= lt!142380 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288806 () Bool)

(declare-fun e!182851 () Bool)

(assert (=> b!288806 (= e!182852 e!182851)))

(declare-fun res!150407 () Bool)

(assert (=> b!288806 (=> (not res!150407) (not e!182851))))

(declare-fun lt!142378 () Bool)

(assert (=> b!288806 (= res!150407 (and (or lt!142378 (not (undefined!2809 lt!142381))) (or lt!142378 (not (= (select (arr!6883 a!3312) (index!10160 lt!142381)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142378 (not (= (select (arr!6883 a!3312) (index!10160 lt!142381)) k0!2524))) (not lt!142378)))))

(get-info :version)

(assert (=> b!288806 (= lt!142378 (not ((_ is Intermediate!1997) lt!142381)))))

(declare-fun b!288807 () Bool)

(declare-fun res!150403 () Bool)

(assert (=> b!288807 (=> (not res!150403) (not e!182848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288807 (= res!150403 (validKeyInArray!0 k0!2524))))

(declare-fun b!288808 () Bool)

(declare-fun res!150401 () Bool)

(assert (=> b!288808 (=> (not res!150401) (not e!182848))))

(declare-fun arrayContainsKey!0 (array!14511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288808 (= res!150401 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288810 () Bool)

(assert (=> b!288810 (= e!182851 (not true))))

(assert (=> b!288810 (and (= (select (arr!6883 a!3312) (index!10160 lt!142381)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10160 lt!142381) i!1256))))

(declare-fun b!288811 () Bool)

(declare-fun res!150404 () Bool)

(assert (=> b!288811 (=> (not res!150404) (not e!182848))))

(assert (=> b!288811 (= res!150404 (and (= (size!7235 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7235 a!3312))))))

(declare-fun b!288809 () Bool)

(declare-fun res!150406 () Bool)

(assert (=> b!288809 (=> (not res!150406) (not e!182849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14511 (_ BitVec 32)) Bool)

(assert (=> b!288809 (= res!150406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150405 () Bool)

(assert (=> start!28192 (=> (not res!150405) (not e!182848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28192 (= res!150405 (validMask!0 mask!3809))))

(assert (=> start!28192 e!182848))

(assert (=> start!28192 true))

(declare-fun array_inv!4833 (array!14511) Bool)

(assert (=> start!28192 (array_inv!4833 a!3312)))

(assert (= (and start!28192 res!150405) b!288811))

(assert (= (and b!288811 res!150404) b!288807))

(assert (= (and b!288807 res!150403) b!288808))

(assert (= (and b!288808 res!150401) b!288805))

(assert (= (and b!288805 res!150408) b!288809))

(assert (= (and b!288809 res!150406) b!288804))

(assert (= (and b!288804 res!150402) b!288806))

(assert (= (and b!288806 res!150407) b!288810))

(declare-fun m!303167 () Bool)

(assert (=> b!288808 m!303167))

(declare-fun m!303169 () Bool)

(assert (=> b!288810 m!303169))

(assert (=> b!288806 m!303169))

(declare-fun m!303171 () Bool)

(assert (=> b!288804 m!303171))

(declare-fun m!303173 () Bool)

(assert (=> b!288804 m!303173))

(declare-fun m!303175 () Bool)

(assert (=> b!288804 m!303175))

(declare-fun m!303177 () Bool)

(assert (=> b!288804 m!303177))

(declare-fun m!303179 () Bool)

(assert (=> b!288807 m!303179))

(declare-fun m!303181 () Bool)

(assert (=> b!288805 m!303181))

(declare-fun m!303183 () Bool)

(assert (=> b!288809 m!303183))

(declare-fun m!303185 () Bool)

(assert (=> start!28192 m!303185))

(declare-fun m!303187 () Bool)

(assert (=> start!28192 m!303187))

(check-sat (not b!288805) (not b!288804) (not b!288809) (not b!288808) (not b!288807) (not start!28192))
(check-sat)
