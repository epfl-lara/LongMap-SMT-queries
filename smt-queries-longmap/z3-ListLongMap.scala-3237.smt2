; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45216 () Bool)

(assert start!45216)

(declare-fun b!496314 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32114 0))(
  ( (array!32115 (arr!15440 (Array (_ BitVec 32) (_ BitVec 64))) (size!15805 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32114)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!291016 () Bool)

(declare-datatypes ((SeekEntryResult!3904 0))(
  ( (MissingZero!3904 (index!17795 (_ BitVec 32))) (Found!3904 (index!17796 (_ BitVec 32))) (Intermediate!3904 (undefined!4716 Bool) (index!17797 (_ BitVec 32)) (x!46863 (_ BitVec 32))) (Undefined!3904) (MissingVacant!3904 (index!17798 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32114 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!496314 (= e!291016 (= (seekEntryOrOpen!0 (select (arr!15440 a!3235) j!176) a!3235 mask!3524) (Found!3904 j!176)))))

(declare-fun b!496315 () Bool)

(declare-fun e!291014 () Bool)

(assert (=> b!496315 (= e!291014 true)))

(declare-fun lt!224578 () SeekEntryResult!3904)

(assert (=> b!496315 (and (bvslt (x!46863 lt!224578) #b01111111111111111111111111111110) (or (= (select (arr!15440 a!3235) (index!17797 lt!224578)) (select (arr!15440 a!3235) j!176)) (= (select (arr!15440 a!3235) (index!17797 lt!224578)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15440 a!3235) (index!17797 lt!224578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496316 () Bool)

(declare-fun res!298845 () Bool)

(declare-fun e!291018 () Bool)

(assert (=> b!496316 (=> (not res!298845) (not e!291018))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496316 (= res!298845 (validKeyInArray!0 k0!2280))))

(declare-fun b!496317 () Bool)

(declare-fun res!298848 () Bool)

(assert (=> b!496317 (=> (not res!298848) (not e!291018))))

(assert (=> b!496317 (= res!298848 (validKeyInArray!0 (select (arr!15440 a!3235) j!176)))))

(declare-fun b!496318 () Bool)

(declare-fun res!298850 () Bool)

(assert (=> b!496318 (=> (not res!298850) (not e!291018))))

(declare-fun arrayContainsKey!0 (array!32114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496318 (= res!298850 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496320 () Bool)

(declare-fun e!291017 () Bool)

(assert (=> b!496320 (= e!291017 (not e!291014))))

(declare-fun res!298844 () Bool)

(assert (=> b!496320 (=> res!298844 e!291014)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224577 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32114 (_ BitVec 32)) SeekEntryResult!3904)

(assert (=> b!496320 (= res!298844 (= lt!224578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224577 (select (store (arr!15440 a!3235) i!1204 k0!2280) j!176) (array!32115 (store (arr!15440 a!3235) i!1204 k0!2280) (size!15805 a!3235)) mask!3524)))))

(declare-fun lt!224576 () (_ BitVec 32))

(assert (=> b!496320 (= lt!224578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224576 (select (arr!15440 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496320 (= lt!224577 (toIndex!0 (select (store (arr!15440 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496320 (= lt!224576 (toIndex!0 (select (arr!15440 a!3235) j!176) mask!3524))))

(assert (=> b!496320 e!291016))

(declare-fun res!298853 () Bool)

(assert (=> b!496320 (=> (not res!298853) (not e!291016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32114 (_ BitVec 32)) Bool)

(assert (=> b!496320 (= res!298853 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14740 0))(
  ( (Unit!14741) )
))
(declare-fun lt!224574 () Unit!14740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14740)

(assert (=> b!496320 (= lt!224574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496321 () Bool)

(declare-fun res!298846 () Bool)

(assert (=> b!496321 (=> (not res!298846) (not e!291017))))

(declare-datatypes ((List!9637 0))(
  ( (Nil!9634) (Cons!9633 (h!10504 (_ BitVec 64)) (t!15856 List!9637)) )
))
(declare-fun arrayNoDuplicates!0 (array!32114 (_ BitVec 32) List!9637) Bool)

(assert (=> b!496321 (= res!298846 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9634))))

(declare-fun b!496322 () Bool)

(declare-fun res!298852 () Bool)

(assert (=> b!496322 (=> (not res!298852) (not e!291018))))

(assert (=> b!496322 (= res!298852 (and (= (size!15805 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15805 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15805 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496323 () Bool)

(declare-fun res!298843 () Bool)

(assert (=> b!496323 (=> (not res!298843) (not e!291017))))

(assert (=> b!496323 (= res!298843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496324 () Bool)

(declare-fun res!298849 () Bool)

(assert (=> b!496324 (=> res!298849 e!291014)))

(get-info :version)

(assert (=> b!496324 (= res!298849 (or (undefined!4716 lt!224578) (not ((_ is Intermediate!3904) lt!224578))))))

(declare-fun b!496319 () Bool)

(assert (=> b!496319 (= e!291018 e!291017)))

(declare-fun res!298851 () Bool)

(assert (=> b!496319 (=> (not res!298851) (not e!291017))))

(declare-fun lt!224575 () SeekEntryResult!3904)

(assert (=> b!496319 (= res!298851 (or (= lt!224575 (MissingZero!3904 i!1204)) (= lt!224575 (MissingVacant!3904 i!1204))))))

(assert (=> b!496319 (= lt!224575 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298847 () Bool)

(assert (=> start!45216 (=> (not res!298847) (not e!291018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45216 (= res!298847 (validMask!0 mask!3524))))

(assert (=> start!45216 e!291018))

(assert (=> start!45216 true))

(declare-fun array_inv!11323 (array!32114) Bool)

(assert (=> start!45216 (array_inv!11323 a!3235)))

(assert (= (and start!45216 res!298847) b!496322))

(assert (= (and b!496322 res!298852) b!496317))

(assert (= (and b!496317 res!298848) b!496316))

(assert (= (and b!496316 res!298845) b!496318))

(assert (= (and b!496318 res!298850) b!496319))

(assert (= (and b!496319 res!298851) b!496323))

(assert (= (and b!496323 res!298843) b!496321))

(assert (= (and b!496321 res!298846) b!496320))

(assert (= (and b!496320 res!298853) b!496314))

(assert (= (and b!496320 (not res!298844)) b!496324))

(assert (= (and b!496324 (not res!298849)) b!496315))

(declare-fun m!477091 () Bool)

(assert (=> b!496320 m!477091))

(declare-fun m!477093 () Bool)

(assert (=> b!496320 m!477093))

(declare-fun m!477095 () Bool)

(assert (=> b!496320 m!477095))

(declare-fun m!477097 () Bool)

(assert (=> b!496320 m!477097))

(declare-fun m!477099 () Bool)

(assert (=> b!496320 m!477099))

(assert (=> b!496320 m!477099))

(declare-fun m!477101 () Bool)

(assert (=> b!496320 m!477101))

(assert (=> b!496320 m!477091))

(declare-fun m!477103 () Bool)

(assert (=> b!496320 m!477103))

(assert (=> b!496320 m!477091))

(declare-fun m!477105 () Bool)

(assert (=> b!496320 m!477105))

(assert (=> b!496320 m!477099))

(declare-fun m!477107 () Bool)

(assert (=> b!496320 m!477107))

(assert (=> b!496317 m!477091))

(assert (=> b!496317 m!477091))

(declare-fun m!477109 () Bool)

(assert (=> b!496317 m!477109))

(declare-fun m!477111 () Bool)

(assert (=> b!496321 m!477111))

(assert (=> b!496314 m!477091))

(assert (=> b!496314 m!477091))

(declare-fun m!477113 () Bool)

(assert (=> b!496314 m!477113))

(declare-fun m!477115 () Bool)

(assert (=> b!496315 m!477115))

(assert (=> b!496315 m!477091))

(declare-fun m!477117 () Bool)

(assert (=> b!496318 m!477117))

(declare-fun m!477119 () Bool)

(assert (=> start!45216 m!477119))

(declare-fun m!477121 () Bool)

(assert (=> start!45216 m!477121))

(declare-fun m!477123 () Bool)

(assert (=> b!496319 m!477123))

(declare-fun m!477125 () Bool)

(assert (=> b!496323 m!477125))

(declare-fun m!477127 () Bool)

(assert (=> b!496316 m!477127))

(check-sat (not b!496314) (not b!496323) (not b!496320) (not b!496317) (not b!496318) (not b!496321) (not b!496316) (not b!496319) (not start!45216))
(check-sat)
