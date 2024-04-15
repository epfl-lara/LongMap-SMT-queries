; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32690 () Bool)

(assert start!32690)

(declare-fun b!326586 () Bool)

(declare-fun res!179766 () Bool)

(declare-fun e!200977 () Bool)

(assert (=> b!326586 (=> (not res!179766) (not e!200977))))

(declare-datatypes ((array!16731 0))(
  ( (array!16732 (arr!7920 (Array (_ BitVec 32) (_ BitVec 64))) (size!8273 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16731)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!326586 (= res!179766 (and (= (select (arr!7920 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8273 a!3305))))))

(declare-fun b!326587 () Bool)

(declare-fun res!179770 () Bool)

(declare-fun e!200976 () Bool)

(assert (=> b!326587 (=> (not res!179770) (not e!200976))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3050 0))(
  ( (MissingZero!3050 (index!14376 (_ BitVec 32))) (Found!3050 (index!14377 (_ BitVec 32))) (Intermediate!3050 (undefined!3862 Bool) (index!14378 (_ BitVec 32)) (x!32635 (_ BitVec 32))) (Undefined!3050) (MissingVacant!3050 (index!14379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16731 (_ BitVec 32)) SeekEntryResult!3050)

(assert (=> b!326587 (= res!179770 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3050 i!1250)))))

(declare-fun b!326588 () Bool)

(declare-fun res!179772 () Bool)

(assert (=> b!326588 (=> (not res!179772) (not e!200976))))

(assert (=> b!326588 (= res!179772 (and (= (size!8273 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8273 a!3305))))))

(declare-fun b!326589 () Bool)

(assert (=> b!326589 (= e!200976 e!200977)))

(declare-fun res!179763 () Bool)

(assert (=> b!326589 (=> (not res!179763) (not e!200977))))

(declare-fun lt!157174 () SeekEntryResult!3050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16731 (_ BitVec 32)) SeekEntryResult!3050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326589 (= res!179763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157174))))

(assert (=> b!326589 (= lt!157174 (Intermediate!3050 false resIndex!58 resX!58))))

(declare-fun res!179767 () Bool)

(assert (=> start!32690 (=> (not res!179767) (not e!200976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32690 (= res!179767 (validMask!0 mask!3777))))

(assert (=> start!32690 e!200976))

(declare-fun array_inv!5892 (array!16731) Bool)

(assert (=> start!32690 (array_inv!5892 a!3305)))

(assert (=> start!32690 true))

(declare-fun b!326590 () Bool)

(assert (=> b!326590 (= e!200977 false)))

(declare-datatypes ((Unit!10112 0))(
  ( (Unit!10113) )
))
(declare-fun lt!157175 () Unit!10112)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10112)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326590 (= lt!157175 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326591 () Bool)

(declare-fun res!179769 () Bool)

(assert (=> b!326591 (=> (not res!179769) (not e!200976))))

(declare-fun arrayContainsKey!0 (array!16731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326591 (= res!179769 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326592 () Bool)

(declare-fun res!179771 () Bool)

(assert (=> b!326592 (=> (not res!179771) (not e!200977))))

(assert (=> b!326592 (= res!179771 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157174))))

(declare-fun b!326593 () Bool)

(declare-fun res!179768 () Bool)

(assert (=> b!326593 (=> (not res!179768) (not e!200976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16731 (_ BitVec 32)) Bool)

(assert (=> b!326593 (= res!179768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326594 () Bool)

(declare-fun res!179764 () Bool)

(assert (=> b!326594 (=> (not res!179764) (not e!200976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326594 (= res!179764 (validKeyInArray!0 k0!2497))))

(declare-fun b!326595 () Bool)

(declare-fun res!179765 () Bool)

(assert (=> b!326595 (=> (not res!179765) (not e!200977))))

(assert (=> b!326595 (= res!179765 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7920 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32690 res!179767) b!326588))

(assert (= (and b!326588 res!179772) b!326594))

(assert (= (and b!326594 res!179764) b!326591))

(assert (= (and b!326591 res!179769) b!326587))

(assert (= (and b!326587 res!179770) b!326593))

(assert (= (and b!326593 res!179768) b!326589))

(assert (= (and b!326589 res!179763) b!326586))

(assert (= (and b!326586 res!179766) b!326592))

(assert (= (and b!326592 res!179771) b!326595))

(assert (= (and b!326595 res!179765) b!326590))

(declare-fun m!332623 () Bool)

(assert (=> b!326593 m!332623))

(declare-fun m!332625 () Bool)

(assert (=> b!326587 m!332625))

(declare-fun m!332627 () Bool)

(assert (=> b!326589 m!332627))

(assert (=> b!326589 m!332627))

(declare-fun m!332629 () Bool)

(assert (=> b!326589 m!332629))

(declare-fun m!332631 () Bool)

(assert (=> b!326592 m!332631))

(declare-fun m!332633 () Bool)

(assert (=> start!32690 m!332633))

(declare-fun m!332635 () Bool)

(assert (=> start!32690 m!332635))

(declare-fun m!332637 () Bool)

(assert (=> b!326595 m!332637))

(declare-fun m!332639 () Bool)

(assert (=> b!326586 m!332639))

(declare-fun m!332641 () Bool)

(assert (=> b!326594 m!332641))

(declare-fun m!332643 () Bool)

(assert (=> b!326591 m!332643))

(declare-fun m!332645 () Bool)

(assert (=> b!326590 m!332645))

(assert (=> b!326590 m!332645))

(declare-fun m!332647 () Bool)

(assert (=> b!326590 m!332647))

(check-sat (not b!326593) (not b!326590) (not b!326587) (not b!326592) (not start!32690) (not b!326591) (not b!326594) (not b!326589))
(check-sat)
