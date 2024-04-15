; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28166 () Bool)

(assert start!28166)

(declare-fun b!288250 () Bool)

(declare-fun e!182501 () Bool)

(declare-fun e!182502 () Bool)

(assert (=> b!288250 (= e!182501 e!182502)))

(declare-fun res!149930 () Bool)

(assert (=> b!288250 (=> (not res!149930) (not e!182502))))

(declare-fun lt!141870 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2012 0))(
  ( (MissingZero!2012 (index!10218 (_ BitVec 32))) (Found!2012 (index!10219 (_ BitVec 32))) (Intermediate!2012 (undefined!2824 Bool) (index!10220 (_ BitVec 32)) (x!28456 (_ BitVec 32))) (Undefined!2012) (MissingVacant!2012 (index!10221 (_ BitVec 32))) )
))
(declare-fun lt!141873 () SeekEntryResult!2012)

(assert (=> b!288250 (= res!149930 (or lt!141870 (= lt!141873 (MissingVacant!2012 i!1256))))))

(assert (=> b!288250 (= lt!141870 (= lt!141873 (MissingZero!2012 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14473 0))(
  ( (array!14474 (arr!6864 (Array (_ BitVec 32) (_ BitVec 64))) (size!7217 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14473)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14473 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!288250 (= lt!141873 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288251 () Bool)

(declare-fun e!182500 () Bool)

(assert (=> b!288251 (= e!182502 e!182500)))

(declare-fun res!149931 () Bool)

(assert (=> b!288251 (=> (not res!149931) (not e!182500))))

(assert (=> b!288251 (= res!149931 lt!141870)))

(declare-fun lt!141869 () (_ BitVec 32))

(declare-fun lt!141868 () SeekEntryResult!2012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14473 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!288251 (= lt!141868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141869 k0!2524 (array!14474 (store (arr!6864 a!3312) i!1256 k0!2524) (size!7217 a!3312)) mask!3809))))

(declare-fun lt!141871 () SeekEntryResult!2012)

(assert (=> b!288251 (= lt!141871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141869 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288251 (= lt!141869 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288252 () Bool)

(declare-fun res!149929 () Bool)

(assert (=> b!288252 (=> (not res!149929) (not e!182501))))

(declare-fun arrayContainsKey!0 (array!14473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288252 (= res!149929 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288253 () Bool)

(declare-fun e!182499 () Bool)

(assert (=> b!288253 (= e!182499 (not true))))

(assert (=> b!288253 (and (= (select (arr!6864 a!3312) (index!10220 lt!141871)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10220 lt!141871) i!1256))))

(declare-fun b!288254 () Bool)

(declare-fun res!149928 () Bool)

(assert (=> b!288254 (=> (not res!149928) (not e!182502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14473 (_ BitVec 32)) Bool)

(assert (=> b!288254 (= res!149928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149932 () Bool)

(assert (=> start!28166 (=> (not res!149932) (not e!182501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28166 (= res!149932 (validMask!0 mask!3809))))

(assert (=> start!28166 e!182501))

(assert (=> start!28166 true))

(declare-fun array_inv!4836 (array!14473) Bool)

(assert (=> start!28166 (array_inv!4836 a!3312)))

(declare-fun b!288255 () Bool)

(declare-fun res!149927 () Bool)

(assert (=> b!288255 (=> (not res!149927) (not e!182501))))

(assert (=> b!288255 (= res!149927 (and (= (size!7217 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7217 a!3312))))))

(declare-fun b!288256 () Bool)

(declare-fun res!149926 () Bool)

(assert (=> b!288256 (=> (not res!149926) (not e!182501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288256 (= res!149926 (validKeyInArray!0 k0!2524))))

(declare-fun b!288257 () Bool)

(assert (=> b!288257 (= e!182500 e!182499)))

(declare-fun res!149925 () Bool)

(assert (=> b!288257 (=> (not res!149925) (not e!182499))))

(declare-fun lt!141872 () Bool)

(assert (=> b!288257 (= res!149925 (and (or lt!141872 (not (undefined!2824 lt!141871))) (or lt!141872 (not (= (select (arr!6864 a!3312) (index!10220 lt!141871)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141872 (not (= (select (arr!6864 a!3312) (index!10220 lt!141871)) k0!2524))) (not lt!141872)))))

(get-info :version)

(assert (=> b!288257 (= lt!141872 (not ((_ is Intermediate!2012) lt!141871)))))

(assert (= (and start!28166 res!149932) b!288255))

(assert (= (and b!288255 res!149927) b!288256))

(assert (= (and b!288256 res!149926) b!288252))

(assert (= (and b!288252 res!149929) b!288250))

(assert (= (and b!288250 res!149930) b!288254))

(assert (= (and b!288254 res!149928) b!288251))

(assert (= (and b!288251 res!149931) b!288257))

(assert (= (and b!288257 res!149925) b!288253))

(declare-fun m!302039 () Bool)

(assert (=> b!288250 m!302039))

(declare-fun m!302041 () Bool)

(assert (=> b!288254 m!302041))

(declare-fun m!302043 () Bool)

(assert (=> b!288256 m!302043))

(declare-fun m!302045 () Bool)

(assert (=> b!288251 m!302045))

(declare-fun m!302047 () Bool)

(assert (=> b!288251 m!302047))

(declare-fun m!302049 () Bool)

(assert (=> b!288251 m!302049))

(declare-fun m!302051 () Bool)

(assert (=> b!288251 m!302051))

(declare-fun m!302053 () Bool)

(assert (=> b!288252 m!302053))

(declare-fun m!302055 () Bool)

(assert (=> b!288253 m!302055))

(declare-fun m!302057 () Bool)

(assert (=> start!28166 m!302057))

(declare-fun m!302059 () Bool)

(assert (=> start!28166 m!302059))

(assert (=> b!288257 m!302055))

(check-sat (not start!28166) (not b!288254) (not b!288252) (not b!288250) (not b!288251) (not b!288256))
(check-sat)
