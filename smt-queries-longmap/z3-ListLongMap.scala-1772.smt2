; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32264 () Bool)

(assert start!32264)

(declare-fun b!321561 () Bool)

(declare-fun res!175739 () Bool)

(declare-fun e!199197 () Bool)

(assert (=> b!321561 (=> (not res!175739) (not e!199197))))

(declare-datatypes ((array!16467 0))(
  ( (array!16468 (arr!7792 (Array (_ BitVec 32) (_ BitVec 64))) (size!8144 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16467)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321561 (= res!175739 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321562 () Bool)

(declare-fun res!175738 () Bool)

(assert (=> b!321562 (=> (not res!175738) (not e!199197))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16467 (_ BitVec 32)) Bool)

(assert (=> b!321562 (= res!175738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321563 () Bool)

(declare-fun res!175733 () Bool)

(declare-fun e!199195 () Bool)

(assert (=> b!321563 (=> (not res!175733) (not e!199195))))

(declare-datatypes ((SeekEntryResult!2888 0))(
  ( (MissingZero!2888 (index!13728 (_ BitVec 32))) (Found!2888 (index!13729 (_ BitVec 32))) (Intermediate!2888 (undefined!3700 Bool) (index!13730 (_ BitVec 32)) (x!32096 (_ BitVec 32))) (Undefined!2888) (MissingVacant!2888 (index!13731 (_ BitVec 32))) )
))
(declare-fun lt!156242 () SeekEntryResult!2888)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16467 (_ BitVec 32)) SeekEntryResult!2888)

(assert (=> b!321563 (= res!175733 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156242))))

(declare-fun b!321564 () Bool)

(assert (=> b!321564 (= e!199197 e!199195)))

(declare-fun res!175735 () Bool)

(assert (=> b!321564 (=> (not res!175735) (not e!199195))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321564 (= res!175735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156242))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321564 (= lt!156242 (Intermediate!2888 false resIndex!58 resX!58))))

(declare-fun b!321565 () Bool)

(declare-fun res!175731 () Bool)

(assert (=> b!321565 (=> (not res!175731) (not e!199197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321565 (= res!175731 (validKeyInArray!0 k0!2497))))

(declare-fun b!321566 () Bool)

(declare-fun res!175740 () Bool)

(assert (=> b!321566 (=> (not res!175740) (not e!199195))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321566 (= res!175740 (and (= (select (arr!7792 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8144 a!3305))))))

(declare-fun res!175736 () Bool)

(assert (=> start!32264 (=> (not res!175736) (not e!199197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32264 (= res!175736 (validMask!0 mask!3777))))

(assert (=> start!32264 e!199197))

(declare-fun array_inv!5742 (array!16467) Bool)

(assert (=> start!32264 (array_inv!5742 a!3305)))

(assert (=> start!32264 true))

(declare-fun b!321567 () Bool)

(declare-fun res!175734 () Bool)

(assert (=> b!321567 (=> (not res!175734) (not e!199197))))

(assert (=> b!321567 (= res!175734 (and (= (size!8144 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8144 a!3305))))))

(declare-fun b!321568 () Bool)

(declare-fun res!175732 () Bool)

(assert (=> b!321568 (=> (not res!175732) (not e!199197))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16467 (_ BitVec 32)) SeekEntryResult!2888)

(assert (=> b!321568 (= res!175732 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2888 i!1250)))))

(declare-fun b!321569 () Bool)

(declare-fun res!175737 () Bool)

(assert (=> b!321569 (=> (not res!175737) (not e!199195))))

(assert (=> b!321569 (= res!175737 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7792 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7792 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7792 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321570 () Bool)

(assert (=> b!321570 (= e!199195 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!156243 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321570 (= lt!156243 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (= (and start!32264 res!175736) b!321567))

(assert (= (and b!321567 res!175734) b!321565))

(assert (= (and b!321565 res!175731) b!321561))

(assert (= (and b!321561 res!175739) b!321568))

(assert (= (and b!321568 res!175732) b!321562))

(assert (= (and b!321562 res!175738) b!321564))

(assert (= (and b!321564 res!175735) b!321566))

(assert (= (and b!321566 res!175740) b!321563))

(assert (= (and b!321563 res!175733) b!321569))

(assert (= (and b!321569 res!175737) b!321570))

(declare-fun m!329899 () Bool)

(assert (=> b!321565 m!329899))

(declare-fun m!329901 () Bool)

(assert (=> b!321562 m!329901))

(declare-fun m!329903 () Bool)

(assert (=> b!321568 m!329903))

(declare-fun m!329905 () Bool)

(assert (=> b!321570 m!329905))

(declare-fun m!329907 () Bool)

(assert (=> b!321564 m!329907))

(assert (=> b!321564 m!329907))

(declare-fun m!329909 () Bool)

(assert (=> b!321564 m!329909))

(declare-fun m!329911 () Bool)

(assert (=> b!321566 m!329911))

(declare-fun m!329913 () Bool)

(assert (=> b!321563 m!329913))

(declare-fun m!329915 () Bool)

(assert (=> b!321561 m!329915))

(declare-fun m!329917 () Bool)

(assert (=> start!32264 m!329917))

(declare-fun m!329919 () Bool)

(assert (=> start!32264 m!329919))

(declare-fun m!329921 () Bool)

(assert (=> b!321569 m!329921))

(check-sat (not b!321563) (not b!321562) (not b!321561) (not b!321570) (not b!321564) (not start!32264) (not b!321568) (not b!321565))
(check-sat)
