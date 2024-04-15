; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32264 () Bool)

(assert start!32264)

(declare-fun b!321339 () Bool)

(declare-fun e!199055 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321339 (= e!199055 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155989 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321339 (= lt!155989 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321341 () Bool)

(declare-fun res!175605 () Bool)

(declare-fun e!199054 () Bool)

(assert (=> b!321341 (=> (not res!175605) (not e!199054))))

(declare-datatypes ((array!16458 0))(
  ( (array!16459 (arr!7788 (Array (_ BitVec 32) (_ BitVec 64))) (size!8141 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16458)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2918 0))(
  ( (MissingZero!2918 (index!13848 (_ BitVec 32))) (Found!2918 (index!13849 (_ BitVec 32))) (Intermediate!2918 (undefined!3730 Bool) (index!13850 (_ BitVec 32)) (x!32124 (_ BitVec 32))) (Undefined!2918) (MissingVacant!2918 (index!13851 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16458 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!321341 (= res!175605 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2918 i!1250)))))

(declare-fun b!321342 () Bool)

(declare-fun res!175609 () Bool)

(assert (=> b!321342 (=> (not res!175609) (not e!199054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16458 (_ BitVec 32)) Bool)

(assert (=> b!321342 (= res!175609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321343 () Bool)

(declare-fun res!175611 () Bool)

(assert (=> b!321343 (=> (not res!175611) (not e!199055))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321343 (= res!175611 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7788 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7788 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7788 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321344 () Bool)

(declare-fun res!175610 () Bool)

(assert (=> b!321344 (=> (not res!175610) (not e!199055))))

(declare-fun lt!155990 () SeekEntryResult!2918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16458 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!321344 (= res!175610 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155990))))

(declare-fun b!321345 () Bool)

(declare-fun res!175614 () Bool)

(assert (=> b!321345 (=> (not res!175614) (not e!199055))))

(assert (=> b!321345 (= res!175614 (and (= (select (arr!7788 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8141 a!3305))))))

(declare-fun b!321346 () Bool)

(declare-fun res!175613 () Bool)

(assert (=> b!321346 (=> (not res!175613) (not e!199054))))

(declare-fun arrayContainsKey!0 (array!16458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321346 (= res!175613 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321347 () Bool)

(declare-fun res!175608 () Bool)

(assert (=> b!321347 (=> (not res!175608) (not e!199054))))

(assert (=> b!321347 (= res!175608 (and (= (size!8141 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8141 a!3305))))))

(declare-fun b!321348 () Bool)

(declare-fun res!175607 () Bool)

(assert (=> b!321348 (=> (not res!175607) (not e!199054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321348 (= res!175607 (validKeyInArray!0 k0!2497))))

(declare-fun res!175606 () Bool)

(assert (=> start!32264 (=> (not res!175606) (not e!199054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32264 (= res!175606 (validMask!0 mask!3777))))

(assert (=> start!32264 e!199054))

(declare-fun array_inv!5760 (array!16458) Bool)

(assert (=> start!32264 (array_inv!5760 a!3305)))

(assert (=> start!32264 true))

(declare-fun b!321340 () Bool)

(assert (=> b!321340 (= e!199054 e!199055)))

(declare-fun res!175612 () Bool)

(assert (=> b!321340 (=> (not res!175612) (not e!199055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321340 (= res!175612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155990))))

(assert (=> b!321340 (= lt!155990 (Intermediate!2918 false resIndex!58 resX!58))))

(assert (= (and start!32264 res!175606) b!321347))

(assert (= (and b!321347 res!175608) b!321348))

(assert (= (and b!321348 res!175607) b!321346))

(assert (= (and b!321346 res!175613) b!321341))

(assert (= (and b!321341 res!175605) b!321342))

(assert (= (and b!321342 res!175609) b!321340))

(assert (= (and b!321340 res!175612) b!321345))

(assert (= (and b!321345 res!175614) b!321344))

(assert (= (and b!321344 res!175610) b!321343))

(assert (= (and b!321343 res!175611) b!321339))

(declare-fun m!328993 () Bool)

(assert (=> b!321343 m!328993))

(declare-fun m!328995 () Bool)

(assert (=> b!321341 m!328995))

(declare-fun m!328997 () Bool)

(assert (=> b!321342 m!328997))

(declare-fun m!328999 () Bool)

(assert (=> start!32264 m!328999))

(declare-fun m!329001 () Bool)

(assert (=> start!32264 m!329001))

(declare-fun m!329003 () Bool)

(assert (=> b!321348 m!329003))

(declare-fun m!329005 () Bool)

(assert (=> b!321345 m!329005))

(declare-fun m!329007 () Bool)

(assert (=> b!321340 m!329007))

(assert (=> b!321340 m!329007))

(declare-fun m!329009 () Bool)

(assert (=> b!321340 m!329009))

(declare-fun m!329011 () Bool)

(assert (=> b!321344 m!329011))

(declare-fun m!329013 () Bool)

(assert (=> b!321346 m!329013))

(declare-fun m!329015 () Bool)

(assert (=> b!321339 m!329015))

(check-sat (not b!321339) (not b!321340) (not b!321341) (not b!321348) (not b!321342) (not b!321346) (not b!321344) (not start!32264))
(check-sat)
