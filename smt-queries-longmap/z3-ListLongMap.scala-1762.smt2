; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32220 () Bool)

(assert start!32220)

(declare-fun b!320847 () Bool)

(declare-fun res!174969 () Bool)

(declare-fun e!198997 () Bool)

(assert (=> b!320847 (=> (not res!174969) (not e!198997))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16410 0))(
  ( (array!16411 (arr!7764 (Array (_ BitVec 32) (_ BitVec 64))) (size!8116 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16410)

(declare-datatypes ((SeekEntryResult!2895 0))(
  ( (MissingZero!2895 (index!13756 (_ BitVec 32))) (Found!2895 (index!13757 (_ BitVec 32))) (Intermediate!2895 (undefined!3707 Bool) (index!13758 (_ BitVec 32)) (x!32026 (_ BitVec 32))) (Undefined!2895) (MissingVacant!2895 (index!13759 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16410 (_ BitVec 32)) SeekEntryResult!2895)

(assert (=> b!320847 (= res!174969 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2895 i!1250)))))

(declare-fun res!174968 () Bool)

(assert (=> start!32220 (=> (not res!174968) (not e!198997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32220 (= res!174968 (validMask!0 mask!3777))))

(assert (=> start!32220 e!198997))

(declare-fun array_inv!5727 (array!16410) Bool)

(assert (=> start!32220 (array_inv!5727 a!3305)))

(assert (=> start!32220 true))

(declare-fun b!320848 () Bool)

(declare-fun res!174971 () Bool)

(assert (=> b!320848 (=> (not res!174971) (not e!198997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16410 (_ BitVec 32)) Bool)

(assert (=> b!320848 (= res!174971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun e!198996 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!320849 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320849 (= e!198996 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7764 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7764 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7764 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320850 () Bool)

(declare-fun res!174967 () Bool)

(assert (=> b!320850 (=> (not res!174967) (not e!198996))))

(assert (=> b!320850 (= res!174967 (and (= (select (arr!7764 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8116 a!3305))))))

(declare-fun b!320851 () Bool)

(assert (=> b!320851 (= e!198997 e!198996)))

(declare-fun res!174972 () Bool)

(assert (=> b!320851 (=> (not res!174972) (not e!198996))))

(declare-fun lt!156126 () SeekEntryResult!2895)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16410 (_ BitVec 32)) SeekEntryResult!2895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320851 (= res!174972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156126))))

(assert (=> b!320851 (= lt!156126 (Intermediate!2895 false resIndex!58 resX!58))))

(declare-fun b!320852 () Bool)

(declare-fun res!174975 () Bool)

(assert (=> b!320852 (=> (not res!174975) (not e!198997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320852 (= res!174975 (validKeyInArray!0 k0!2497))))

(declare-fun b!320853 () Bool)

(declare-fun res!174973 () Bool)

(assert (=> b!320853 (=> (not res!174973) (not e!198997))))

(assert (=> b!320853 (= res!174973 (and (= (size!8116 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8116 a!3305))))))

(declare-fun b!320854 () Bool)

(declare-fun res!174970 () Bool)

(assert (=> b!320854 (=> (not res!174970) (not e!198996))))

(assert (=> b!320854 (= res!174970 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156126))))

(declare-fun b!320855 () Bool)

(declare-fun res!174974 () Bool)

(assert (=> b!320855 (=> (not res!174974) (not e!198997))))

(declare-fun arrayContainsKey!0 (array!16410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320855 (= res!174974 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32220 res!174968) b!320853))

(assert (= (and b!320853 res!174973) b!320852))

(assert (= (and b!320852 res!174975) b!320855))

(assert (= (and b!320855 res!174974) b!320847))

(assert (= (and b!320847 res!174969) b!320848))

(assert (= (and b!320848 res!174971) b!320851))

(assert (= (and b!320851 res!174972) b!320850))

(assert (= (and b!320850 res!174967) b!320854))

(assert (= (and b!320854 res!174970) b!320849))

(declare-fun m!329097 () Bool)

(assert (=> b!320854 m!329097))

(declare-fun m!329099 () Bool)

(assert (=> b!320848 m!329099))

(declare-fun m!329101 () Bool)

(assert (=> start!32220 m!329101))

(declare-fun m!329103 () Bool)

(assert (=> start!32220 m!329103))

(declare-fun m!329105 () Bool)

(assert (=> b!320852 m!329105))

(declare-fun m!329107 () Bool)

(assert (=> b!320855 m!329107))

(declare-fun m!329109 () Bool)

(assert (=> b!320847 m!329109))

(declare-fun m!329111 () Bool)

(assert (=> b!320849 m!329111))

(declare-fun m!329113 () Bool)

(assert (=> b!320850 m!329113))

(declare-fun m!329115 () Bool)

(assert (=> b!320851 m!329115))

(assert (=> b!320851 m!329115))

(declare-fun m!329117 () Bool)

(assert (=> b!320851 m!329117))

(check-sat (not b!320852) (not start!32220) (not b!320854) (not b!320848) (not b!320847) (not b!320855) (not b!320851))
(check-sat)
