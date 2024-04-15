; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32378 () Bool)

(assert start!32378)

(declare-fun b!322737 () Bool)

(declare-fun res!176585 () Bool)

(declare-fun e!199600 () Bool)

(assert (=> b!322737 (=> (not res!176585) (not e!199600))))

(declare-datatypes ((array!16521 0))(
  ( (array!16522 (arr!7818 (Array (_ BitVec 32) (_ BitVec 64))) (size!8171 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16521)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322737 (= res!176585 (and (= (size!8171 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8171 a!3305))))))

(declare-fun b!322738 () Bool)

(declare-fun res!176583 () Bool)

(declare-fun e!199598 () Bool)

(assert (=> b!322738 (=> (not res!176583) (not e!199598))))

(declare-datatypes ((SeekEntryResult!2948 0))(
  ( (MissingZero!2948 (index!13968 (_ BitVec 32))) (Found!2948 (index!13969 (_ BitVec 32))) (Intermediate!2948 (undefined!3760 Bool) (index!13970 (_ BitVec 32)) (x!32243 (_ BitVec 32))) (Undefined!2948) (MissingVacant!2948 (index!13971 (_ BitVec 32))) )
))
(declare-fun lt!156321 () SeekEntryResult!2948)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16521 (_ BitVec 32)) SeekEntryResult!2948)

(assert (=> b!322738 (= res!176583 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156321))))

(declare-fun b!322739 () Bool)

(assert (=> b!322739 (= e!199600 e!199598)))

(declare-fun res!176582 () Bool)

(assert (=> b!322739 (=> (not res!176582) (not e!199598))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322739 (= res!176582 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156321))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322739 (= lt!156321 (Intermediate!2948 false resIndex!58 resX!58))))

(declare-fun b!322740 () Bool)

(declare-datatypes ((Unit!9905 0))(
  ( (Unit!9906) )
))
(declare-fun e!199601 () Unit!9905)

(declare-fun e!199599 () Unit!9905)

(assert (=> b!322740 (= e!199601 e!199599)))

(declare-fun c!50706 () Bool)

(assert (=> b!322740 (= c!50706 (or (= (select (arr!7818 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7818 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322741 () Bool)

(declare-fun e!199597 () Unit!9905)

(declare-fun Unit!9907 () Unit!9905)

(assert (=> b!322741 (= e!199597 Unit!9907)))

(declare-fun b!322742 () Bool)

(declare-fun Unit!9908 () Unit!9905)

(assert (=> b!322742 (= e!199597 Unit!9908)))

(assert (=> b!322742 false))

(declare-fun res!176580 () Bool)

(assert (=> start!32378 (=> (not res!176580) (not e!199600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32378 (= res!176580 (validMask!0 mask!3777))))

(assert (=> start!32378 e!199600))

(declare-fun array_inv!5790 (array!16521) Bool)

(assert (=> start!32378 (array_inv!5790 a!3305)))

(assert (=> start!32378 true))

(declare-fun b!322743 () Bool)

(declare-fun res!176589 () Bool)

(assert (=> b!322743 (=> (not res!176589) (not e!199598))))

(assert (=> b!322743 (= res!176589 (and (= (select (arr!7818 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8171 a!3305))))))

(declare-fun b!322744 () Bool)

(assert (=> b!322744 false))

(declare-fun Unit!9909 () Unit!9905)

(assert (=> b!322744 (= e!199599 Unit!9909)))

(declare-fun b!322745 () Bool)

(assert (=> b!322745 false))

(declare-fun lt!156323 () Unit!9905)

(assert (=> b!322745 (= lt!156323 e!199597)))

(declare-fun c!50707 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322745 (= c!50707 ((_ is Intermediate!2948) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9910 () Unit!9905)

(assert (=> b!322745 (= e!199599 Unit!9910)))

(declare-fun b!322746 () Bool)

(declare-fun res!176584 () Bool)

(assert (=> b!322746 (=> (not res!176584) (not e!199598))))

(assert (=> b!322746 (= res!176584 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7818 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322747 () Bool)

(declare-fun Unit!9911 () Unit!9905)

(assert (=> b!322747 (= e!199601 Unit!9911)))

(declare-fun b!322748 () Bool)

(declare-fun res!176588 () Bool)

(assert (=> b!322748 (=> (not res!176588) (not e!199600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322748 (= res!176588 (validKeyInArray!0 k0!2497))))

(declare-fun b!322749 () Bool)

(declare-fun res!176581 () Bool)

(assert (=> b!322749 (=> (not res!176581) (not e!199600))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16521 (_ BitVec 32)) SeekEntryResult!2948)

(assert (=> b!322749 (= res!176581 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2948 i!1250)))))

(declare-fun b!322750 () Bool)

(assert (=> b!322750 (= e!199598 (not true))))

(assert (=> b!322750 (= index!1840 resIndex!58)))

(declare-fun lt!156322 () Unit!9905)

(assert (=> b!322750 (= lt!156322 e!199601)))

(declare-fun c!50708 () Bool)

(assert (=> b!322750 (= c!50708 (not (= resIndex!58 index!1840)))))

(declare-fun b!322751 () Bool)

(declare-fun res!176587 () Bool)

(assert (=> b!322751 (=> (not res!176587) (not e!199600))))

(declare-fun arrayContainsKey!0 (array!16521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322751 (= res!176587 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322752 () Bool)

(declare-fun res!176586 () Bool)

(assert (=> b!322752 (=> (not res!176586) (not e!199600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16521 (_ BitVec 32)) Bool)

(assert (=> b!322752 (= res!176586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32378 res!176580) b!322737))

(assert (= (and b!322737 res!176585) b!322748))

(assert (= (and b!322748 res!176588) b!322751))

(assert (= (and b!322751 res!176587) b!322749))

(assert (= (and b!322749 res!176581) b!322752))

(assert (= (and b!322752 res!176586) b!322739))

(assert (= (and b!322739 res!176582) b!322743))

(assert (= (and b!322743 res!176589) b!322738))

(assert (= (and b!322738 res!176583) b!322746))

(assert (= (and b!322746 res!176584) b!322750))

(assert (= (and b!322750 c!50708) b!322740))

(assert (= (and b!322750 (not c!50708)) b!322747))

(assert (= (and b!322740 c!50706) b!322744))

(assert (= (and b!322740 (not c!50706)) b!322745))

(assert (= (and b!322745 c!50707) b!322741))

(assert (= (and b!322745 (not c!50707)) b!322742))

(declare-fun m!329857 () Bool)

(assert (=> b!322746 m!329857))

(declare-fun m!329859 () Bool)

(assert (=> b!322739 m!329859))

(assert (=> b!322739 m!329859))

(declare-fun m!329861 () Bool)

(assert (=> b!322739 m!329861))

(declare-fun m!329863 () Bool)

(assert (=> b!322743 m!329863))

(declare-fun m!329865 () Bool)

(assert (=> start!32378 m!329865))

(declare-fun m!329867 () Bool)

(assert (=> start!32378 m!329867))

(declare-fun m!329869 () Bool)

(assert (=> b!322749 m!329869))

(declare-fun m!329871 () Bool)

(assert (=> b!322748 m!329871))

(declare-fun m!329873 () Bool)

(assert (=> b!322745 m!329873))

(assert (=> b!322745 m!329873))

(declare-fun m!329875 () Bool)

(assert (=> b!322745 m!329875))

(declare-fun m!329877 () Bool)

(assert (=> b!322738 m!329877))

(declare-fun m!329879 () Bool)

(assert (=> b!322751 m!329879))

(assert (=> b!322740 m!329857))

(declare-fun m!329881 () Bool)

(assert (=> b!322752 m!329881))

(check-sat (not b!322752) (not b!322749) (not b!322739) (not b!322748) (not b!322751) (not start!32378) (not b!322738) (not b!322745))
(check-sat)
