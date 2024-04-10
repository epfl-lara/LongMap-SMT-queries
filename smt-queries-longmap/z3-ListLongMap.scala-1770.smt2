; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32268 () Bool)

(assert start!32268)

(declare-fun b!321468 () Bool)

(declare-fun res!175590 () Bool)

(declare-fun e!199186 () Bool)

(assert (=> b!321468 (=> (not res!175590) (not e!199186))))

(declare-datatypes ((array!16458 0))(
  ( (array!16459 (arr!7788 (Array (_ BitVec 32) (_ BitVec 64))) (size!8140 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16458)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16458 (_ BitVec 32)) Bool)

(assert (=> b!321468 (= res!175590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321469 () Bool)

(declare-fun res!175593 () Bool)

(declare-fun e!199184 () Bool)

(assert (=> b!321469 (=> (not res!175593) (not e!199184))))

(declare-datatypes ((SeekEntryResult!2919 0))(
  ( (MissingZero!2919 (index!13852 (_ BitVec 32))) (Found!2919 (index!13853 (_ BitVec 32))) (Intermediate!2919 (undefined!3731 Bool) (index!13854 (_ BitVec 32)) (x!32114 (_ BitVec 32))) (Undefined!2919) (MissingVacant!2919 (index!13855 (_ BitVec 32))) )
))
(declare-fun lt!156198 () SeekEntryResult!2919)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16458 (_ BitVec 32)) SeekEntryResult!2919)

(assert (=> b!321469 (= res!175593 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156198))))

(declare-fun b!321471 () Bool)

(assert (=> b!321471 (= e!199186 e!199184)))

(declare-fun res!175588 () Bool)

(assert (=> b!321471 (=> (not res!175588) (not e!199184))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321471 (= res!175588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156198))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321471 (= lt!156198 (Intermediate!2919 false resIndex!58 resX!58))))

(declare-fun b!321472 () Bool)

(declare-fun res!175592 () Bool)

(assert (=> b!321472 (=> (not res!175592) (not e!199186))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321472 (= res!175592 (and (= (size!8140 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8140 a!3305))))))

(declare-fun b!321473 () Bool)

(assert (=> b!321473 (= e!199184 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7788 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7788 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7788 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!321474 () Bool)

(declare-fun res!175591 () Bool)

(assert (=> b!321474 (=> (not res!175591) (not e!199186))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16458 (_ BitVec 32)) SeekEntryResult!2919)

(assert (=> b!321474 (= res!175591 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2919 i!1250)))))

(declare-fun b!321475 () Bool)

(declare-fun res!175589 () Bool)

(assert (=> b!321475 (=> (not res!175589) (not e!199186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321475 (= res!175589 (validKeyInArray!0 k0!2497))))

(declare-fun b!321476 () Bool)

(declare-fun res!175594 () Bool)

(assert (=> b!321476 (=> (not res!175594) (not e!199186))))

(declare-fun arrayContainsKey!0 (array!16458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321476 (= res!175594 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175595 () Bool)

(assert (=> start!32268 (=> (not res!175595) (not e!199186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32268 (= res!175595 (validMask!0 mask!3777))))

(assert (=> start!32268 e!199186))

(declare-fun array_inv!5751 (array!16458) Bool)

(assert (=> start!32268 (array_inv!5751 a!3305)))

(assert (=> start!32268 true))

(declare-fun b!321470 () Bool)

(declare-fun res!175596 () Bool)

(assert (=> b!321470 (=> (not res!175596) (not e!199184))))

(assert (=> b!321470 (= res!175596 (and (= (select (arr!7788 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8140 a!3305))))))

(assert (= (and start!32268 res!175595) b!321472))

(assert (= (and b!321472 res!175592) b!321475))

(assert (= (and b!321475 res!175589) b!321476))

(assert (= (and b!321476 res!175594) b!321474))

(assert (= (and b!321474 res!175591) b!321468))

(assert (= (and b!321468 res!175590) b!321471))

(assert (= (and b!321471 res!175588) b!321470))

(assert (= (and b!321470 res!175596) b!321469))

(assert (= (and b!321469 res!175593) b!321473))

(declare-fun m!329607 () Bool)

(assert (=> b!321471 m!329607))

(assert (=> b!321471 m!329607))

(declare-fun m!329609 () Bool)

(assert (=> b!321471 m!329609))

(declare-fun m!329611 () Bool)

(assert (=> start!32268 m!329611))

(declare-fun m!329613 () Bool)

(assert (=> start!32268 m!329613))

(declare-fun m!329615 () Bool)

(assert (=> b!321476 m!329615))

(declare-fun m!329617 () Bool)

(assert (=> b!321475 m!329617))

(declare-fun m!329619 () Bool)

(assert (=> b!321473 m!329619))

(declare-fun m!329621 () Bool)

(assert (=> b!321470 m!329621))

(declare-fun m!329623 () Bool)

(assert (=> b!321474 m!329623))

(declare-fun m!329625 () Bool)

(assert (=> b!321469 m!329625))

(declare-fun m!329627 () Bool)

(assert (=> b!321468 m!329627))

(check-sat (not b!321471) (not start!32268) (not b!321468) (not b!321474) (not b!321469) (not b!321476) (not b!321475))
(check-sat)
