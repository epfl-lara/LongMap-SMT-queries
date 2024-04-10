; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32274 () Bool)

(assert start!32274)

(declare-fun b!321554 () Bool)

(declare-fun res!175678 () Bool)

(declare-fun e!199211 () Bool)

(assert (=> b!321554 (=> (not res!175678) (not e!199211))))

(declare-datatypes ((array!16464 0))(
  ( (array!16465 (arr!7791 (Array (_ BitVec 32) (_ BitVec 64))) (size!8143 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16464)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16464 (_ BitVec 32)) Bool)

(assert (=> b!321554 (= res!175678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321555 () Bool)

(declare-fun res!175674 () Bool)

(declare-fun e!199213 () Bool)

(assert (=> b!321555 (=> (not res!175674) (not e!199213))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321555 (= res!175674 (and (= (select (arr!7791 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8143 a!3305))))))

(declare-fun b!321556 () Bool)

(declare-fun res!175682 () Bool)

(assert (=> b!321556 (=> (not res!175682) (not e!199211))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321556 (= res!175682 (validKeyInArray!0 k0!2497))))

(declare-fun b!321557 () Bool)

(assert (=> b!321557 (= e!199211 e!199213)))

(declare-fun res!175677 () Bool)

(assert (=> b!321557 (=> (not res!175677) (not e!199213))))

(declare-datatypes ((SeekEntryResult!2922 0))(
  ( (MissingZero!2922 (index!13864 (_ BitVec 32))) (Found!2922 (index!13865 (_ BitVec 32))) (Intermediate!2922 (undefined!3734 Bool) (index!13866 (_ BitVec 32)) (x!32125 (_ BitVec 32))) (Undefined!2922) (MissingVacant!2922 (index!13867 (_ BitVec 32))) )
))
(declare-fun lt!156213 () SeekEntryResult!2922)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16464 (_ BitVec 32)) SeekEntryResult!2922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321557 (= res!175677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156213))))

(assert (=> b!321557 (= lt!156213 (Intermediate!2922 false resIndex!58 resX!58))))

(declare-fun b!321558 () Bool)

(declare-fun res!175676 () Bool)

(assert (=> b!321558 (=> (not res!175676) (not e!199211))))

(assert (=> b!321558 (= res!175676 (and (= (size!8143 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8143 a!3305))))))

(declare-fun res!175680 () Bool)

(assert (=> start!32274 (=> (not res!175680) (not e!199211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32274 (= res!175680 (validMask!0 mask!3777))))

(assert (=> start!32274 e!199211))

(declare-fun array_inv!5754 (array!16464) Bool)

(assert (=> start!32274 (array_inv!5754 a!3305)))

(assert (=> start!32274 true))

(declare-fun b!321559 () Bool)

(declare-fun res!175679 () Bool)

(assert (=> b!321559 (=> (not res!175679) (not e!199211))))

(declare-fun arrayContainsKey!0 (array!16464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321559 (= res!175679 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321560 () Bool)

(assert (=> b!321560 (= e!199213 false)))

(declare-fun lt!156212 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321560 (= lt!156212 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321561 () Bool)

(declare-fun res!175681 () Bool)

(assert (=> b!321561 (=> (not res!175681) (not e!199211))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16464 (_ BitVec 32)) SeekEntryResult!2922)

(assert (=> b!321561 (= res!175681 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2922 i!1250)))))

(declare-fun b!321562 () Bool)

(declare-fun res!175683 () Bool)

(assert (=> b!321562 (=> (not res!175683) (not e!199213))))

(assert (=> b!321562 (= res!175683 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7791 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7791 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7791 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321563 () Bool)

(declare-fun res!175675 () Bool)

(assert (=> b!321563 (=> (not res!175675) (not e!199213))))

(assert (=> b!321563 (= res!175675 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156213))))

(assert (= (and start!32274 res!175680) b!321558))

(assert (= (and b!321558 res!175676) b!321556))

(assert (= (and b!321556 res!175682) b!321559))

(assert (= (and b!321559 res!175679) b!321561))

(assert (= (and b!321561 res!175681) b!321554))

(assert (= (and b!321554 res!175678) b!321557))

(assert (= (and b!321557 res!175677) b!321555))

(assert (= (and b!321555 res!175674) b!321563))

(assert (= (and b!321563 res!175675) b!321562))

(assert (= (and b!321562 res!175683) b!321560))

(declare-fun m!329675 () Bool)

(assert (=> b!321560 m!329675))

(declare-fun m!329677 () Bool)

(assert (=> b!321561 m!329677))

(declare-fun m!329679 () Bool)

(assert (=> b!321563 m!329679))

(declare-fun m!329681 () Bool)

(assert (=> start!32274 m!329681))

(declare-fun m!329683 () Bool)

(assert (=> start!32274 m!329683))

(declare-fun m!329685 () Bool)

(assert (=> b!321554 m!329685))

(declare-fun m!329687 () Bool)

(assert (=> b!321555 m!329687))

(declare-fun m!329689 () Bool)

(assert (=> b!321559 m!329689))

(declare-fun m!329691 () Bool)

(assert (=> b!321557 m!329691))

(assert (=> b!321557 m!329691))

(declare-fun m!329693 () Bool)

(assert (=> b!321557 m!329693))

(declare-fun m!329695 () Bool)

(assert (=> b!321556 m!329695))

(declare-fun m!329697 () Bool)

(assert (=> b!321562 m!329697))

(check-sat (not b!321554) (not b!321560) (not b!321556) (not b!321561) (not b!321559) (not b!321557) (not start!32274) (not b!321563))
(check-sat)
