; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32480 () Bool)

(assert start!32480)

(declare-fun res!178193 () Bool)

(declare-fun e!200371 () Bool)

(assert (=> start!32480 (=> (not res!178193) (not e!200371))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32480 (= res!178193 (validMask!0 mask!3777))))

(assert (=> start!32480 e!200371))

(declare-datatypes ((array!16632 0))(
  ( (array!16633 (arr!7873 (Array (_ BitVec 32) (_ BitVec 64))) (size!8225 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16632)

(declare-fun array_inv!5823 (array!16632) Bool)

(assert (=> start!32480 (array_inv!5823 a!3305)))

(assert (=> start!32480 true))

(declare-fun b!324810 () Bool)

(declare-fun res!178196 () Bool)

(assert (=> b!324810 (=> (not res!178196) (not e!200371))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2969 0))(
  ( (MissingZero!2969 (index!14052 (_ BitVec 32))) (Found!2969 (index!14053 (_ BitVec 32))) (Intermediate!2969 (undefined!3781 Bool) (index!14054 (_ BitVec 32)) (x!32402 (_ BitVec 32))) (Undefined!2969) (MissingVacant!2969 (index!14055 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16632 (_ BitVec 32)) SeekEntryResult!2969)

(assert (=> b!324810 (= res!178196 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2969 i!1250)))))

(declare-fun b!324811 () Bool)

(declare-fun res!178192 () Bool)

(declare-fun e!200373 () Bool)

(assert (=> b!324811 (=> (not res!178192) (not e!200373))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324811 (= res!178192 (and (= (select (arr!7873 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8225 a!3305))))))

(declare-fun b!324812 () Bool)

(declare-fun res!178191 () Bool)

(assert (=> b!324812 (=> (not res!178191) (not e!200373))))

(assert (=> b!324812 (= res!178191 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7873 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324813 () Bool)

(assert (=> b!324813 (= e!200373 false)))

(declare-fun lt!156905 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324813 (= lt!156905 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324814 () Bool)

(declare-fun res!178200 () Bool)

(assert (=> b!324814 (=> (not res!178200) (not e!200371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16632 (_ BitVec 32)) Bool)

(assert (=> b!324814 (= res!178200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324815 () Bool)

(declare-fun res!178198 () Bool)

(assert (=> b!324815 (=> (not res!178198) (not e!200371))))

(declare-fun arrayContainsKey!0 (array!16632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324815 (= res!178198 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324816 () Bool)

(declare-fun res!178195 () Bool)

(assert (=> b!324816 (=> (not res!178195) (not e!200371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324816 (= res!178195 (validKeyInArray!0 k0!2497))))

(declare-fun b!324817 () Bool)

(declare-fun res!178194 () Bool)

(assert (=> b!324817 (=> (not res!178194) (not e!200373))))

(declare-fun lt!156906 () SeekEntryResult!2969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16632 (_ BitVec 32)) SeekEntryResult!2969)

(assert (=> b!324817 (= res!178194 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156906))))

(declare-fun b!324818 () Bool)

(declare-fun res!178199 () Bool)

(assert (=> b!324818 (=> (not res!178199) (not e!200371))))

(assert (=> b!324818 (= res!178199 (and (= (size!8225 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8225 a!3305))))))

(declare-fun b!324819 () Bool)

(assert (=> b!324819 (= e!200371 e!200373)))

(declare-fun res!178197 () Bool)

(assert (=> b!324819 (=> (not res!178197) (not e!200373))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324819 (= res!178197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156906))))

(assert (=> b!324819 (= lt!156906 (Intermediate!2969 false resIndex!58 resX!58))))

(assert (= (and start!32480 res!178193) b!324818))

(assert (= (and b!324818 res!178199) b!324816))

(assert (= (and b!324816 res!178195) b!324815))

(assert (= (and b!324815 res!178198) b!324810))

(assert (= (and b!324810 res!178196) b!324814))

(assert (= (and b!324814 res!178200) b!324819))

(assert (= (and b!324819 res!178197) b!324811))

(assert (= (and b!324811 res!178192) b!324817))

(assert (= (and b!324817 res!178194) b!324812))

(assert (= (and b!324812 res!178191) b!324813))

(declare-fun m!332005 () Bool)

(assert (=> b!324815 m!332005))

(declare-fun m!332007 () Bool)

(assert (=> b!324814 m!332007))

(declare-fun m!332009 () Bool)

(assert (=> b!324816 m!332009))

(declare-fun m!332011 () Bool)

(assert (=> b!324812 m!332011))

(declare-fun m!332013 () Bool)

(assert (=> b!324819 m!332013))

(assert (=> b!324819 m!332013))

(declare-fun m!332015 () Bool)

(assert (=> b!324819 m!332015))

(declare-fun m!332017 () Bool)

(assert (=> b!324813 m!332017))

(declare-fun m!332019 () Bool)

(assert (=> start!32480 m!332019))

(declare-fun m!332021 () Bool)

(assert (=> start!32480 m!332021))

(declare-fun m!332023 () Bool)

(assert (=> b!324811 m!332023))

(declare-fun m!332025 () Bool)

(assert (=> b!324817 m!332025))

(declare-fun m!332027 () Bool)

(assert (=> b!324810 m!332027))

(check-sat (not b!324816) (not start!32480) (not b!324819) (not b!324817) (not b!324814) (not b!324813) (not b!324815) (not b!324810))
(check-sat)
