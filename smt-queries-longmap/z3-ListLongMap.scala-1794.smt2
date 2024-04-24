; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32450 () Bool)

(assert start!32450)

(declare-fun b!324360 () Bool)

(declare-fun res!177749 () Bool)

(declare-fun e!200236 () Bool)

(assert (=> b!324360 (=> (not res!177749) (not e!200236))))

(declare-datatypes ((array!16602 0))(
  ( (array!16603 (arr!7858 (Array (_ BitVec 32) (_ BitVec 64))) (size!8210 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16602)

(declare-datatypes ((SeekEntryResult!2954 0))(
  ( (MissingZero!2954 (index!13992 (_ BitVec 32))) (Found!2954 (index!13993 (_ BitVec 32))) (Intermediate!2954 (undefined!3766 Bool) (index!13994 (_ BitVec 32)) (x!32347 (_ BitVec 32))) (Undefined!2954) (MissingVacant!2954 (index!13995 (_ BitVec 32))) )
))
(declare-fun lt!156816 () SeekEntryResult!2954)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16602 (_ BitVec 32)) SeekEntryResult!2954)

(assert (=> b!324360 (= res!177749 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156816))))

(declare-fun res!177744 () Bool)

(declare-fun e!200237 () Bool)

(assert (=> start!32450 (=> (not res!177744) (not e!200237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32450 (= res!177744 (validMask!0 mask!3777))))

(assert (=> start!32450 e!200237))

(declare-fun array_inv!5808 (array!16602) Bool)

(assert (=> start!32450 (array_inv!5808 a!3305)))

(assert (=> start!32450 true))

(declare-fun b!324361 () Bool)

(declare-fun res!177745 () Bool)

(assert (=> b!324361 (=> (not res!177745) (not e!200237))))

(declare-fun arrayContainsKey!0 (array!16602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324361 (= res!177745 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324362 () Bool)

(declare-fun res!177746 () Bool)

(assert (=> b!324362 (=> (not res!177746) (not e!200237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16602 (_ BitVec 32)) Bool)

(assert (=> b!324362 (= res!177746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324363 () Bool)

(declare-fun res!177747 () Bool)

(assert (=> b!324363 (=> (not res!177747) (not e!200236))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324363 (= res!177747 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7858 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324364 () Bool)

(declare-fun res!177748 () Bool)

(assert (=> b!324364 (=> (not res!177748) (not e!200237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324364 (= res!177748 (validKeyInArray!0 k0!2497))))

(declare-fun b!324365 () Bool)

(assert (=> b!324365 (= e!200237 e!200236)))

(declare-fun res!177742 () Bool)

(assert (=> b!324365 (=> (not res!177742) (not e!200236))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324365 (= res!177742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156816))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324365 (= lt!156816 (Intermediate!2954 false resIndex!58 resX!58))))

(declare-fun b!324366 () Bool)

(declare-fun res!177750 () Bool)

(assert (=> b!324366 (=> (not res!177750) (not e!200237))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324366 (= res!177750 (and (= (size!8210 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8210 a!3305))))))

(declare-fun b!324367 () Bool)

(declare-fun res!177743 () Bool)

(assert (=> b!324367 (=> (not res!177743) (not e!200236))))

(assert (=> b!324367 (= res!177743 (and (= (select (arr!7858 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8210 a!3305))))))

(declare-fun b!324368 () Bool)

(assert (=> b!324368 (= e!200236 false)))

(declare-fun lt!156815 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324368 (= lt!156815 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324369 () Bool)

(declare-fun res!177741 () Bool)

(assert (=> b!324369 (=> (not res!177741) (not e!200237))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16602 (_ BitVec 32)) SeekEntryResult!2954)

(assert (=> b!324369 (= res!177741 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2954 i!1250)))))

(assert (= (and start!32450 res!177744) b!324366))

(assert (= (and b!324366 res!177750) b!324364))

(assert (= (and b!324364 res!177748) b!324361))

(assert (= (and b!324361 res!177745) b!324369))

(assert (= (and b!324369 res!177741) b!324362))

(assert (= (and b!324362 res!177746) b!324365))

(assert (= (and b!324365 res!177742) b!324367))

(assert (= (and b!324367 res!177743) b!324360))

(assert (= (and b!324360 res!177749) b!324363))

(assert (= (and b!324363 res!177747) b!324368))

(declare-fun m!331645 () Bool)

(assert (=> b!324364 m!331645))

(declare-fun m!331647 () Bool)

(assert (=> b!324361 m!331647))

(declare-fun m!331649 () Bool)

(assert (=> b!324369 m!331649))

(declare-fun m!331651 () Bool)

(assert (=> start!32450 m!331651))

(declare-fun m!331653 () Bool)

(assert (=> start!32450 m!331653))

(declare-fun m!331655 () Bool)

(assert (=> b!324360 m!331655))

(declare-fun m!331657 () Bool)

(assert (=> b!324362 m!331657))

(declare-fun m!331659 () Bool)

(assert (=> b!324365 m!331659))

(assert (=> b!324365 m!331659))

(declare-fun m!331661 () Bool)

(assert (=> b!324365 m!331661))

(declare-fun m!331663 () Bool)

(assert (=> b!324367 m!331663))

(declare-fun m!331665 () Bool)

(assert (=> b!324363 m!331665))

(declare-fun m!331667 () Bool)

(assert (=> b!324368 m!331667))

(check-sat (not b!324369) (not b!324365) (not b!324364) (not b!324368) (not b!324361) (not start!32450) (not b!324362) (not b!324360))
(check-sat)
