; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45692 () Bool)

(assert start!45692)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295521 () Bool)

(declare-fun b!504768 () Bool)

(declare-datatypes ((array!32449 0))(
  ( (array!32450 (arr!15604 (Array (_ BitVec 32) (_ BitVec 64))) (size!15968 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32449)

(declare-datatypes ((SeekEntryResult!4027 0))(
  ( (MissingZero!4027 (index!18296 (_ BitVec 32))) (Found!4027 (index!18297 (_ BitVec 32))) (Intermediate!4027 (undefined!4839 Bool) (index!18298 (_ BitVec 32)) (x!47457 (_ BitVec 32))) (Undefined!4027) (MissingVacant!4027 (index!18299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32449 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!504768 (= e!295521 (= (seekEntryOrOpen!0 (select (arr!15604 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176)))))

(declare-fun b!504769 () Bool)

(declare-datatypes ((Unit!15343 0))(
  ( (Unit!15344) )
))
(declare-fun e!295527 () Unit!15343)

(declare-fun Unit!15345 () Unit!15343)

(assert (=> b!504769 (= e!295527 Unit!15345)))

(declare-fun b!504770 () Bool)

(declare-fun e!295523 () Bool)

(declare-fun e!295525 () Bool)

(assert (=> b!504770 (= e!295523 (not e!295525))))

(declare-fun res!305958 () Bool)

(assert (=> b!504770 (=> res!305958 e!295525)))

(declare-fun lt!229943 () (_ BitVec 32))

(declare-fun lt!229935 () array!32449)

(declare-fun lt!229941 () (_ BitVec 64))

(declare-fun lt!229937 () SeekEntryResult!4027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32449 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!504770 (= res!305958 (= lt!229937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229943 lt!229941 lt!229935 mask!3524)))))

(declare-fun lt!229939 () (_ BitVec 32))

(assert (=> b!504770 (= lt!229937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229939 (select (arr!15604 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504770 (= lt!229943 (toIndex!0 lt!229941 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504770 (= lt!229941 (select (store (arr!15604 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504770 (= lt!229939 (toIndex!0 (select (arr!15604 a!3235) j!176) mask!3524))))

(assert (=> b!504770 (= lt!229935 (array!32450 (store (arr!15604 a!3235) i!1204 k0!2280) (size!15968 a!3235)))))

(assert (=> b!504770 e!295521))

(declare-fun res!305963 () Bool)

(assert (=> b!504770 (=> (not res!305963) (not e!295521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32449 (_ BitVec 32)) Bool)

(assert (=> b!504770 (= res!305963 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229936 () Unit!15343)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15343)

(assert (=> b!504770 (= lt!229936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504771 () Bool)

(declare-fun e!295520 () Bool)

(assert (=> b!504771 (= e!295520 true)))

(declare-fun lt!229944 () SeekEntryResult!4027)

(assert (=> b!504771 (= lt!229944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229939 lt!229941 lt!229935 mask!3524))))

(declare-fun b!504772 () Bool)

(declare-fun Unit!15346 () Unit!15343)

(assert (=> b!504772 (= e!295527 Unit!15346)))

(declare-fun lt!229940 () Unit!15343)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15343)

(assert (=> b!504772 (= lt!229940 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229939 #b00000000000000000000000000000000 (index!18298 lt!229937) (x!47457 lt!229937) mask!3524))))

(declare-fun res!305971 () Bool)

(assert (=> b!504772 (= res!305971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229939 lt!229941 lt!229935 mask!3524) (Intermediate!4027 false (index!18298 lt!229937) (x!47457 lt!229937))))))

(declare-fun e!295522 () Bool)

(assert (=> b!504772 (=> (not res!305971) (not e!295522))))

(assert (=> b!504772 e!295522))

(declare-fun res!305968 () Bool)

(declare-fun e!295519 () Bool)

(assert (=> start!45692 (=> (not res!305968) (not e!295519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45692 (= res!305968 (validMask!0 mask!3524))))

(assert (=> start!45692 e!295519))

(assert (=> start!45692 true))

(declare-fun array_inv!11463 (array!32449) Bool)

(assert (=> start!45692 (array_inv!11463 a!3235)))

(declare-fun b!504773 () Bool)

(declare-fun res!305967 () Bool)

(assert (=> b!504773 (=> (not res!305967) (not e!295519))))

(assert (=> b!504773 (= res!305967 (and (= (size!15968 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15968 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15968 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!295526 () Bool)

(declare-fun b!504774 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32449 (_ BitVec 32)) SeekEntryResult!4027)

(assert (=> b!504774 (= e!295526 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229939 (index!18298 lt!229937) (select (arr!15604 a!3235) j!176) a!3235 mask!3524) (Found!4027 j!176))))))

(declare-fun b!504775 () Bool)

(assert (=> b!504775 (= e!295525 e!295520)))

(declare-fun res!305964 () Bool)

(assert (=> b!504775 (=> res!305964 e!295520)))

(assert (=> b!504775 (= res!305964 (or (bvsgt (x!47457 lt!229937) #b01111111111111111111111111111110) (bvslt lt!229939 #b00000000000000000000000000000000) (bvsge lt!229939 (size!15968 a!3235)) (bvslt (index!18298 lt!229937) #b00000000000000000000000000000000) (bvsge (index!18298 lt!229937) (size!15968 a!3235)) (not (= lt!229937 (Intermediate!4027 false (index!18298 lt!229937) (x!47457 lt!229937))))))))

(assert (=> b!504775 (= (index!18298 lt!229937) i!1204)))

(declare-fun lt!229945 () Unit!15343)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15343)

(assert (=> b!504775 (= lt!229945 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229939 #b00000000000000000000000000000000 (index!18298 lt!229937) (x!47457 lt!229937) mask!3524))))

(assert (=> b!504775 (and (or (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229938 () Unit!15343)

(assert (=> b!504775 (= lt!229938 e!295527)))

(declare-fun c!59684 () Bool)

(assert (=> b!504775 (= c!59684 (= (select (arr!15604 a!3235) (index!18298 lt!229937)) (select (arr!15604 a!3235) j!176)))))

(assert (=> b!504775 (and (bvslt (x!47457 lt!229937) #b01111111111111111111111111111110) (or (= (select (arr!15604 a!3235) (index!18298 lt!229937)) (select (arr!15604 a!3235) j!176)) (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15604 a!3235) (index!18298 lt!229937)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504776 () Bool)

(declare-fun res!305957 () Bool)

(assert (=> b!504776 (=> res!305957 e!295525)))

(get-info :version)

(assert (=> b!504776 (= res!305957 (or (undefined!4839 lt!229937) (not ((_ is Intermediate!4027) lt!229937))))))

(declare-fun b!504777 () Bool)

(declare-fun res!305970 () Bool)

(assert (=> b!504777 (=> (not res!305970) (not e!295519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504777 (= res!305970 (validKeyInArray!0 (select (arr!15604 a!3235) j!176)))))

(declare-fun b!504778 () Bool)

(declare-fun res!305962 () Bool)

(assert (=> b!504778 (=> (not res!305962) (not e!295523))))

(declare-datatypes ((List!9669 0))(
  ( (Nil!9666) (Cons!9665 (h!10542 (_ BitVec 64)) (t!15889 List!9669)) )
))
(declare-fun arrayNoDuplicates!0 (array!32449 (_ BitVec 32) List!9669) Bool)

(assert (=> b!504778 (= res!305962 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9666))))

(declare-fun b!504779 () Bool)

(assert (=> b!504779 (= e!295519 e!295523)))

(declare-fun res!305961 () Bool)

(assert (=> b!504779 (=> (not res!305961) (not e!295523))))

(declare-fun lt!229942 () SeekEntryResult!4027)

(assert (=> b!504779 (= res!305961 (or (= lt!229942 (MissingZero!4027 i!1204)) (= lt!229942 (MissingVacant!4027 i!1204))))))

(assert (=> b!504779 (= lt!229942 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504780 () Bool)

(declare-fun res!305966 () Bool)

(assert (=> b!504780 (=> res!305966 e!295520)))

(assert (=> b!504780 (= res!305966 e!295526)))

(declare-fun res!305965 () Bool)

(assert (=> b!504780 (=> (not res!305965) (not e!295526))))

(assert (=> b!504780 (= res!305965 (bvsgt #b00000000000000000000000000000000 (x!47457 lt!229937)))))

(declare-fun b!504781 () Bool)

(assert (=> b!504781 (= e!295522 false)))

(declare-fun b!504782 () Bool)

(declare-fun res!305960 () Bool)

(assert (=> b!504782 (=> (not res!305960) (not e!295519))))

(assert (=> b!504782 (= res!305960 (validKeyInArray!0 k0!2280))))

(declare-fun b!504783 () Bool)

(declare-fun res!305959 () Bool)

(assert (=> b!504783 (=> (not res!305959) (not e!295523))))

(assert (=> b!504783 (= res!305959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504784 () Bool)

(declare-fun res!305969 () Bool)

(assert (=> b!504784 (=> (not res!305969) (not e!295519))))

(declare-fun arrayContainsKey!0 (array!32449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504784 (= res!305969 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45692 res!305968) b!504773))

(assert (= (and b!504773 res!305967) b!504777))

(assert (= (and b!504777 res!305970) b!504782))

(assert (= (and b!504782 res!305960) b!504784))

(assert (= (and b!504784 res!305969) b!504779))

(assert (= (and b!504779 res!305961) b!504783))

(assert (= (and b!504783 res!305959) b!504778))

(assert (= (and b!504778 res!305962) b!504770))

(assert (= (and b!504770 res!305963) b!504768))

(assert (= (and b!504770 (not res!305958)) b!504776))

(assert (= (and b!504776 (not res!305957)) b!504775))

(assert (= (and b!504775 c!59684) b!504772))

(assert (= (and b!504775 (not c!59684)) b!504769))

(assert (= (and b!504772 res!305971) b!504781))

(assert (= (and b!504775 (not res!305964)) b!504780))

(assert (= (and b!504780 res!305965) b!504774))

(assert (= (and b!504780 (not res!305966)) b!504771))

(declare-fun m!485713 () Bool)

(assert (=> b!504777 m!485713))

(assert (=> b!504777 m!485713))

(declare-fun m!485715 () Bool)

(assert (=> b!504777 m!485715))

(declare-fun m!485717 () Bool)

(assert (=> start!45692 m!485717))

(declare-fun m!485719 () Bool)

(assert (=> start!45692 m!485719))

(declare-fun m!485721 () Bool)

(assert (=> b!504784 m!485721))

(declare-fun m!485723 () Bool)

(assert (=> b!504778 m!485723))

(declare-fun m!485725 () Bool)

(assert (=> b!504771 m!485725))

(declare-fun m!485727 () Bool)

(assert (=> b!504770 m!485727))

(declare-fun m!485729 () Bool)

(assert (=> b!504770 m!485729))

(declare-fun m!485731 () Bool)

(assert (=> b!504770 m!485731))

(declare-fun m!485733 () Bool)

(assert (=> b!504770 m!485733))

(assert (=> b!504770 m!485713))

(declare-fun m!485735 () Bool)

(assert (=> b!504770 m!485735))

(assert (=> b!504770 m!485713))

(declare-fun m!485737 () Bool)

(assert (=> b!504770 m!485737))

(assert (=> b!504770 m!485713))

(declare-fun m!485739 () Bool)

(assert (=> b!504770 m!485739))

(declare-fun m!485741 () Bool)

(assert (=> b!504770 m!485741))

(assert (=> b!504768 m!485713))

(assert (=> b!504768 m!485713))

(declare-fun m!485743 () Bool)

(assert (=> b!504768 m!485743))

(declare-fun m!485745 () Bool)

(assert (=> b!504772 m!485745))

(assert (=> b!504772 m!485725))

(assert (=> b!504774 m!485713))

(assert (=> b!504774 m!485713))

(declare-fun m!485747 () Bool)

(assert (=> b!504774 m!485747))

(declare-fun m!485749 () Bool)

(assert (=> b!504775 m!485749))

(declare-fun m!485751 () Bool)

(assert (=> b!504775 m!485751))

(assert (=> b!504775 m!485713))

(declare-fun m!485753 () Bool)

(assert (=> b!504782 m!485753))

(declare-fun m!485755 () Bool)

(assert (=> b!504779 m!485755))

(declare-fun m!485757 () Bool)

(assert (=> b!504783 m!485757))

(check-sat (not b!504775) (not b!504771) (not b!504782) (not b!504784) (not b!504779) (not b!504778) (not start!45692) (not b!504777) (not b!504768) (not b!504772) (not b!504783) (not b!504774) (not b!504770))
(check-sat)
