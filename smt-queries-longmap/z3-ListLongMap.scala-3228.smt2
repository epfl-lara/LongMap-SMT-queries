; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45176 () Bool)

(assert start!45176)

(declare-fun b!495727 () Bool)

(declare-fun e!290798 () Bool)

(declare-fun e!290800 () Bool)

(assert (=> b!495727 (= e!290798 (not e!290800))))

(declare-fun res!298123 () Bool)

(assert (=> b!495727 (=> res!298123 e!290800)))

(declare-datatypes ((array!32064 0))(
  ( (array!32065 (arr!15415 (Array (_ BitVec 32) (_ BitVec 64))) (size!15779 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32064)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3882 0))(
  ( (MissingZero!3882 (index!17707 (_ BitVec 32))) (Found!3882 (index!17708 (_ BitVec 32))) (Intermediate!3882 (undefined!4694 Bool) (index!17709 (_ BitVec 32)) (x!46774 (_ BitVec 32))) (Undefined!3882) (MissingVacant!3882 (index!17710 (_ BitVec 32))) )
))
(declare-fun lt!224420 () SeekEntryResult!3882)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!224421 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32064 (_ BitVec 32)) SeekEntryResult!3882)

(assert (=> b!495727 (= res!298123 (= lt!224420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224421 (select (store (arr!15415 a!3235) i!1204 k0!2280) j!176) (array!32065 (store (arr!15415 a!3235) i!1204 k0!2280) (size!15779 a!3235)) mask!3524)))))

(declare-fun lt!224419 () (_ BitVec 32))

(assert (=> b!495727 (= lt!224420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224419 (select (arr!15415 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495727 (= lt!224421 (toIndex!0 (select (store (arr!15415 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495727 (= lt!224419 (toIndex!0 (select (arr!15415 a!3235) j!176) mask!3524))))

(declare-fun e!290801 () Bool)

(assert (=> b!495727 e!290801))

(declare-fun res!298120 () Bool)

(assert (=> b!495727 (=> (not res!298120) (not e!290801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32064 (_ BitVec 32)) Bool)

(assert (=> b!495727 (= res!298120 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14710 0))(
  ( (Unit!14711) )
))
(declare-fun lt!224418 () Unit!14710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14710)

(assert (=> b!495727 (= lt!224418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495728 () Bool)

(declare-fun res!298121 () Bool)

(assert (=> b!495728 (=> (not res!298121) (not e!290798))))

(assert (=> b!495728 (= res!298121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495729 () Bool)

(declare-fun e!290799 () Bool)

(assert (=> b!495729 (= e!290799 e!290798)))

(declare-fun res!298114 () Bool)

(assert (=> b!495729 (=> (not res!298114) (not e!290798))))

(declare-fun lt!224422 () SeekEntryResult!3882)

(assert (=> b!495729 (= res!298114 (or (= lt!224422 (MissingZero!3882 i!1204)) (= lt!224422 (MissingVacant!3882 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32064 (_ BitVec 32)) SeekEntryResult!3882)

(assert (=> b!495729 (= lt!224422 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495730 () Bool)

(declare-fun res!298122 () Bool)

(assert (=> b!495730 (=> (not res!298122) (not e!290799))))

(declare-fun arrayContainsKey!0 (array!32064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495730 (= res!298122 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495731 () Bool)

(declare-fun res!298119 () Bool)

(assert (=> b!495731 (=> (not res!298119) (not e!290798))))

(declare-datatypes ((List!9573 0))(
  ( (Nil!9570) (Cons!9569 (h!10440 (_ BitVec 64)) (t!15801 List!9573)) )
))
(declare-fun arrayNoDuplicates!0 (array!32064 (_ BitVec 32) List!9573) Bool)

(assert (=> b!495731 (= res!298119 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9570))))

(declare-fun b!495732 () Bool)

(declare-fun res!298115 () Bool)

(assert (=> b!495732 (=> (not res!298115) (not e!290799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495732 (= res!298115 (validKeyInArray!0 (select (arr!15415 a!3235) j!176)))))

(declare-fun b!495733 () Bool)

(assert (=> b!495733 (= e!290801 (= (seekEntryOrOpen!0 (select (arr!15415 a!3235) j!176) a!3235 mask!3524) (Found!3882 j!176)))))

(declare-fun b!495735 () Bool)

(declare-fun res!298118 () Bool)

(assert (=> b!495735 (=> res!298118 e!290800)))

(get-info :version)

(assert (=> b!495735 (= res!298118 (or (undefined!4694 lt!224420) (not ((_ is Intermediate!3882) lt!224420))))))

(declare-fun b!495736 () Bool)

(declare-fun res!298116 () Bool)

(assert (=> b!495736 (=> (not res!298116) (not e!290799))))

(assert (=> b!495736 (= res!298116 (and (= (size!15779 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15779 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15779 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495737 () Bool)

(declare-fun res!298124 () Bool)

(assert (=> b!495737 (=> (not res!298124) (not e!290799))))

(assert (=> b!495737 (= res!298124 (validKeyInArray!0 k0!2280))))

(declare-fun b!495734 () Bool)

(assert (=> b!495734 (= e!290800 true)))

(assert (=> b!495734 (and (bvslt (x!46774 lt!224420) #b01111111111111111111111111111110) (or (= (select (arr!15415 a!3235) (index!17709 lt!224420)) (select (arr!15415 a!3235) j!176)) (= (select (arr!15415 a!3235) (index!17709 lt!224420)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15415 a!3235) (index!17709 lt!224420)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!298117 () Bool)

(assert (=> start!45176 (=> (not res!298117) (not e!290799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45176 (= res!298117 (validMask!0 mask!3524))))

(assert (=> start!45176 e!290799))

(assert (=> start!45176 true))

(declare-fun array_inv!11211 (array!32064) Bool)

(assert (=> start!45176 (array_inv!11211 a!3235)))

(assert (= (and start!45176 res!298117) b!495736))

(assert (= (and b!495736 res!298116) b!495732))

(assert (= (and b!495732 res!298115) b!495737))

(assert (= (and b!495737 res!298124) b!495730))

(assert (= (and b!495730 res!298122) b!495729))

(assert (= (and b!495729 res!298114) b!495728))

(assert (= (and b!495728 res!298121) b!495731))

(assert (= (and b!495731 res!298119) b!495727))

(assert (= (and b!495727 res!298120) b!495733))

(assert (= (and b!495727 (not res!298123)) b!495735))

(assert (= (and b!495735 (not res!298118)) b!495734))

(declare-fun m!476855 () Bool)

(assert (=> b!495734 m!476855))

(declare-fun m!476857 () Bool)

(assert (=> b!495734 m!476857))

(declare-fun m!476859 () Bool)

(assert (=> b!495728 m!476859))

(assert (=> b!495733 m!476857))

(assert (=> b!495733 m!476857))

(declare-fun m!476861 () Bool)

(assert (=> b!495733 m!476861))

(declare-fun m!476863 () Bool)

(assert (=> start!45176 m!476863))

(declare-fun m!476865 () Bool)

(assert (=> start!45176 m!476865))

(declare-fun m!476867 () Bool)

(assert (=> b!495737 m!476867))

(declare-fun m!476869 () Bool)

(assert (=> b!495729 m!476869))

(declare-fun m!476871 () Bool)

(assert (=> b!495730 m!476871))

(declare-fun m!476873 () Bool)

(assert (=> b!495731 m!476873))

(assert (=> b!495732 m!476857))

(assert (=> b!495732 m!476857))

(declare-fun m!476875 () Bool)

(assert (=> b!495732 m!476875))

(assert (=> b!495727 m!476857))

(declare-fun m!476877 () Bool)

(assert (=> b!495727 m!476877))

(declare-fun m!476879 () Bool)

(assert (=> b!495727 m!476879))

(declare-fun m!476881 () Bool)

(assert (=> b!495727 m!476881))

(declare-fun m!476883 () Bool)

(assert (=> b!495727 m!476883))

(assert (=> b!495727 m!476857))

(declare-fun m!476885 () Bool)

(assert (=> b!495727 m!476885))

(assert (=> b!495727 m!476883))

(declare-fun m!476887 () Bool)

(assert (=> b!495727 m!476887))

(assert (=> b!495727 m!476883))

(declare-fun m!476889 () Bool)

(assert (=> b!495727 m!476889))

(assert (=> b!495727 m!476857))

(declare-fun m!476891 () Bool)

(assert (=> b!495727 m!476891))

(check-sat (not b!495732) (not b!495729) (not b!495737) (not b!495731) (not start!45176) (not b!495733) (not b!495727) (not b!495728) (not b!495730))
(check-sat)
