; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32286 () Bool)

(assert start!32286)

(declare-fun b!321734 () Bool)

(declare-fun res!175862 () Bool)

(declare-fun e!199265 () Bool)

(assert (=> b!321734 (=> (not res!175862) (not e!199265))))

(declare-datatypes ((array!16476 0))(
  ( (array!16477 (arr!7797 (Array (_ BitVec 32) (_ BitVec 64))) (size!8149 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16476)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2928 0))(
  ( (MissingZero!2928 (index!13888 (_ BitVec 32))) (Found!2928 (index!13889 (_ BitVec 32))) (Intermediate!2928 (undefined!3740 Bool) (index!13890 (_ BitVec 32)) (x!32147 (_ BitVec 32))) (Undefined!2928) (MissingVacant!2928 (index!13891 (_ BitVec 32))) )
))
(declare-fun lt!156248 () SeekEntryResult!2928)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16476 (_ BitVec 32)) SeekEntryResult!2928)

(assert (=> b!321734 (= res!175862 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156248))))

(declare-fun b!321735 () Bool)

(declare-fun res!175861 () Bool)

(declare-fun e!199266 () Bool)

(assert (=> b!321735 (=> (not res!175861) (not e!199266))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321735 (= res!175861 (and (= (size!8149 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8149 a!3305))))))

(declare-fun b!321736 () Bool)

(declare-fun res!175858 () Bool)

(assert (=> b!321736 (=> (not res!175858) (not e!199266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16476 (_ BitVec 32)) Bool)

(assert (=> b!321736 (= res!175858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321737 () Bool)

(declare-fun res!175859 () Bool)

(assert (=> b!321737 (=> (not res!175859) (not e!199266))))

(declare-fun arrayContainsKey!0 (array!16476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321737 (= res!175859 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175860 () Bool)

(assert (=> start!32286 (=> (not res!175860) (not e!199266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32286 (= res!175860 (validMask!0 mask!3777))))

(assert (=> start!32286 e!199266))

(declare-fun array_inv!5760 (array!16476) Bool)

(assert (=> start!32286 (array_inv!5760 a!3305)))

(assert (=> start!32286 true))

(declare-fun b!321738 () Bool)

(declare-fun res!175857 () Bool)

(assert (=> b!321738 (=> (not res!175857) (not e!199265))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321738 (= res!175857 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7797 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7797 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7797 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321739 () Bool)

(declare-fun res!175854 () Bool)

(assert (=> b!321739 (=> (not res!175854) (not e!199266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321739 (= res!175854 (validKeyInArray!0 k0!2497))))

(declare-fun b!321740 () Bool)

(declare-fun res!175863 () Bool)

(assert (=> b!321740 (=> (not res!175863) (not e!199266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16476 (_ BitVec 32)) SeekEntryResult!2928)

(assert (=> b!321740 (= res!175863 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2928 i!1250)))))

(declare-fun b!321741 () Bool)

(assert (=> b!321741 (= e!199266 e!199265)))

(declare-fun res!175855 () Bool)

(assert (=> b!321741 (=> (not res!175855) (not e!199265))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321741 (= res!175855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156248))))

(assert (=> b!321741 (= lt!156248 (Intermediate!2928 false resIndex!58 resX!58))))

(declare-fun b!321742 () Bool)

(assert (=> b!321742 (= e!199265 false)))

(declare-fun lt!156249 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321742 (= lt!156249 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321743 () Bool)

(declare-fun res!175856 () Bool)

(assert (=> b!321743 (=> (not res!175856) (not e!199265))))

(assert (=> b!321743 (= res!175856 (and (= (select (arr!7797 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8149 a!3305))))))

(assert (= (and start!32286 res!175860) b!321735))

(assert (= (and b!321735 res!175861) b!321739))

(assert (= (and b!321739 res!175854) b!321737))

(assert (= (and b!321737 res!175859) b!321740))

(assert (= (and b!321740 res!175863) b!321736))

(assert (= (and b!321736 res!175858) b!321741))

(assert (= (and b!321741 res!175855) b!321743))

(assert (= (and b!321743 res!175856) b!321734))

(assert (= (and b!321734 res!175862) b!321738))

(assert (= (and b!321738 res!175857) b!321742))

(declare-fun m!329819 () Bool)

(assert (=> b!321737 m!329819))

(declare-fun m!329821 () Bool)

(assert (=> b!321739 m!329821))

(declare-fun m!329823 () Bool)

(assert (=> start!32286 m!329823))

(declare-fun m!329825 () Bool)

(assert (=> start!32286 m!329825))

(declare-fun m!329827 () Bool)

(assert (=> b!321743 m!329827))

(declare-fun m!329829 () Bool)

(assert (=> b!321742 m!329829))

(declare-fun m!329831 () Bool)

(assert (=> b!321734 m!329831))

(declare-fun m!329833 () Bool)

(assert (=> b!321738 m!329833))

(declare-fun m!329835 () Bool)

(assert (=> b!321740 m!329835))

(declare-fun m!329837 () Bool)

(assert (=> b!321741 m!329837))

(assert (=> b!321741 m!329837))

(declare-fun m!329839 () Bool)

(assert (=> b!321741 m!329839))

(declare-fun m!329841 () Bool)

(assert (=> b!321736 m!329841))

(check-sat (not start!32286) (not b!321741) (not b!321736) (not b!321742) (not b!321734) (not b!321739) (not b!321737) (not b!321740))
(check-sat)
