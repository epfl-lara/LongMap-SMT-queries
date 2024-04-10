; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45710 () Bool)

(assert start!45710)

(declare-fun b!505033 () Bool)

(declare-fun res!306148 () Bool)

(declare-fun e!295668 () Bool)

(assert (=> b!505033 (=> (not res!306148) (not e!295668))))

(declare-datatypes ((array!32466 0))(
  ( (array!32467 (arr!15613 (Array (_ BitVec 32) (_ BitVec 64))) (size!15977 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32466)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505033 (= res!306148 (validKeyInArray!0 (select (arr!15613 a!3235) j!176)))))

(declare-fun b!505034 () Bool)

(declare-datatypes ((Unit!15396 0))(
  ( (Unit!15397) )
))
(declare-fun e!295673 () Unit!15396)

(declare-fun Unit!15398 () Unit!15396)

(assert (=> b!505034 (= e!295673 Unit!15398)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4080 0))(
  ( (MissingZero!4080 (index!18508 (_ BitVec 32))) (Found!4080 (index!18509 (_ BitVec 32))) (Intermediate!4080 (undefined!4892 Bool) (index!18510 (_ BitVec 32)) (x!47521 (_ BitVec 32))) (Undefined!4080) (MissingVacant!4080 (index!18511 (_ BitVec 32))) )
))
(declare-fun lt!230062 () SeekEntryResult!4080)

(declare-fun lt!230061 () Unit!15396)

(declare-fun lt!230057 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15396)

(assert (=> b!505034 (= lt!230061 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230057 #b00000000000000000000000000000000 (index!18510 lt!230062) (x!47521 lt!230062) mask!3524))))

(declare-fun lt!230065 () (_ BitVec 64))

(declare-fun res!306158 () Bool)

(declare-fun lt!230063 () array!32466)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32466 (_ BitVec 32)) SeekEntryResult!4080)

(assert (=> b!505034 (= res!306158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230057 lt!230065 lt!230063 mask!3524) (Intermediate!4080 false (index!18510 lt!230062) (x!47521 lt!230062))))))

(declare-fun e!295670 () Bool)

(assert (=> b!505034 (=> (not res!306158) (not e!295670))))

(assert (=> b!505034 e!295670))

(declare-fun b!505035 () Bool)

(declare-fun e!295674 () Bool)

(assert (=> b!505035 (= e!295674 true)))

(declare-fun lt!230056 () SeekEntryResult!4080)

(assert (=> b!505035 (= lt!230056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230057 lt!230065 lt!230063 mask!3524))))

(declare-fun b!505036 () Bool)

(declare-fun res!306144 () Bool)

(assert (=> b!505036 (=> (not res!306144) (not e!295668))))

(declare-fun arrayContainsKey!0 (array!32466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505036 (= res!306144 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505037 () Bool)

(declare-fun res!306145 () Bool)

(declare-fun e!295669 () Bool)

(assert (=> b!505037 (=> (not res!306145) (not e!295669))))

(declare-datatypes ((List!9771 0))(
  ( (Nil!9768) (Cons!9767 (h!10644 (_ BitVec 64)) (t!15999 List!9771)) )
))
(declare-fun arrayNoDuplicates!0 (array!32466 (_ BitVec 32) List!9771) Bool)

(assert (=> b!505037 (= res!306145 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9768))))

(declare-fun b!505038 () Bool)

(assert (=> b!505038 (= e!295670 false)))

(declare-fun b!505040 () Bool)

(declare-fun res!306155 () Bool)

(assert (=> b!505040 (=> (not res!306155) (not e!295668))))

(assert (=> b!505040 (= res!306155 (validKeyInArray!0 k0!2280))))

(declare-fun b!505041 () Bool)

(declare-fun e!295667 () Bool)

(assert (=> b!505041 (= e!295669 (not e!295667))))

(declare-fun res!306147 () Bool)

(assert (=> b!505041 (=> res!306147 e!295667)))

(declare-fun lt!230060 () (_ BitVec 32))

(assert (=> b!505041 (= res!306147 (= lt!230062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230060 lt!230065 lt!230063 mask!3524)))))

(assert (=> b!505041 (= lt!230062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230057 (select (arr!15613 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505041 (= lt!230060 (toIndex!0 lt!230065 mask!3524))))

(assert (=> b!505041 (= lt!230065 (select (store (arr!15613 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505041 (= lt!230057 (toIndex!0 (select (arr!15613 a!3235) j!176) mask!3524))))

(assert (=> b!505041 (= lt!230063 (array!32467 (store (arr!15613 a!3235) i!1204 k0!2280) (size!15977 a!3235)))))

(declare-fun e!295672 () Bool)

(assert (=> b!505041 e!295672))

(declare-fun res!306152 () Bool)

(assert (=> b!505041 (=> (not res!306152) (not e!295672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32466 (_ BitVec 32)) Bool)

(assert (=> b!505041 (= res!306152 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230059 () Unit!15396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15396)

(assert (=> b!505041 (= lt!230059 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505042 () Bool)

(declare-fun res!306153 () Bool)

(assert (=> b!505042 (=> res!306153 e!295667)))

(get-info :version)

(assert (=> b!505042 (= res!306153 (or (undefined!4892 lt!230062) (not ((_ is Intermediate!4080) lt!230062))))))

(declare-fun b!505043 () Bool)

(declare-fun Unit!15399 () Unit!15396)

(assert (=> b!505043 (= e!295673 Unit!15399)))

(declare-fun b!505044 () Bool)

(declare-fun e!295671 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32466 (_ BitVec 32)) SeekEntryResult!4080)

(assert (=> b!505044 (= e!295671 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230057 (index!18510 lt!230062) (select (arr!15613 a!3235) j!176) a!3235 mask!3524) (Found!4080 j!176))))))

(declare-fun b!505045 () Bool)

(assert (=> b!505045 (= e!295668 e!295669)))

(declare-fun res!306149 () Bool)

(assert (=> b!505045 (=> (not res!306149) (not e!295669))))

(declare-fun lt!230064 () SeekEntryResult!4080)

(assert (=> b!505045 (= res!306149 (or (= lt!230064 (MissingZero!4080 i!1204)) (= lt!230064 (MissingVacant!4080 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32466 (_ BitVec 32)) SeekEntryResult!4080)

(assert (=> b!505045 (= lt!230064 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505039 () Bool)

(declare-fun res!306150 () Bool)

(assert (=> b!505039 (=> (not res!306150) (not e!295669))))

(assert (=> b!505039 (= res!306150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!306146 () Bool)

(assert (=> start!45710 (=> (not res!306146) (not e!295668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45710 (= res!306146 (validMask!0 mask!3524))))

(assert (=> start!45710 e!295668))

(assert (=> start!45710 true))

(declare-fun array_inv!11409 (array!32466) Bool)

(assert (=> start!45710 (array_inv!11409 a!3235)))

(declare-fun b!505046 () Bool)

(assert (=> b!505046 (= e!295672 (= (seekEntryOrOpen!0 (select (arr!15613 a!3235) j!176) a!3235 mask!3524) (Found!4080 j!176)))))

(declare-fun b!505047 () Bool)

(declare-fun res!306154 () Bool)

(assert (=> b!505047 (=> (not res!306154) (not e!295668))))

(assert (=> b!505047 (= res!306154 (and (= (size!15977 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15977 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15977 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505048 () Bool)

(declare-fun res!306157 () Bool)

(assert (=> b!505048 (=> res!306157 e!295674)))

(assert (=> b!505048 (= res!306157 e!295671)))

(declare-fun res!306156 () Bool)

(assert (=> b!505048 (=> (not res!306156) (not e!295671))))

(assert (=> b!505048 (= res!306156 (bvsgt #b00000000000000000000000000000000 (x!47521 lt!230062)))))

(declare-fun b!505049 () Bool)

(assert (=> b!505049 (= e!295667 e!295674)))

(declare-fun res!306151 () Bool)

(assert (=> b!505049 (=> res!306151 e!295674)))

(assert (=> b!505049 (= res!306151 (or (bvsgt (x!47521 lt!230062) #b01111111111111111111111111111110) (bvslt lt!230057 #b00000000000000000000000000000000) (bvsge lt!230057 (size!15977 a!3235)) (bvslt (index!18510 lt!230062) #b00000000000000000000000000000000) (bvsge (index!18510 lt!230062) (size!15977 a!3235)) (not (= lt!230062 (Intermediate!4080 false (index!18510 lt!230062) (x!47521 lt!230062))))))))

(assert (=> b!505049 (= (index!18510 lt!230062) i!1204)))

(declare-fun lt!230055 () Unit!15396)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15396)

(assert (=> b!505049 (= lt!230055 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230057 #b00000000000000000000000000000000 (index!18510 lt!230062) (x!47521 lt!230062) mask!3524))))

(assert (=> b!505049 (and (or (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230058 () Unit!15396)

(assert (=> b!505049 (= lt!230058 e!295673)))

(declare-fun c!59723 () Bool)

(assert (=> b!505049 (= c!59723 (= (select (arr!15613 a!3235) (index!18510 lt!230062)) (select (arr!15613 a!3235) j!176)))))

(assert (=> b!505049 (and (bvslt (x!47521 lt!230062) #b01111111111111111111111111111110) (or (= (select (arr!15613 a!3235) (index!18510 lt!230062)) (select (arr!15613 a!3235) j!176)) (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15613 a!3235) (index!18510 lt!230062)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45710 res!306146) b!505047))

(assert (= (and b!505047 res!306154) b!505033))

(assert (= (and b!505033 res!306148) b!505040))

(assert (= (and b!505040 res!306155) b!505036))

(assert (= (and b!505036 res!306144) b!505045))

(assert (= (and b!505045 res!306149) b!505039))

(assert (= (and b!505039 res!306150) b!505037))

(assert (= (and b!505037 res!306145) b!505041))

(assert (= (and b!505041 res!306152) b!505046))

(assert (= (and b!505041 (not res!306147)) b!505042))

(assert (= (and b!505042 (not res!306153)) b!505049))

(assert (= (and b!505049 c!59723) b!505034))

(assert (= (and b!505049 (not c!59723)) b!505043))

(assert (= (and b!505034 res!306158) b!505038))

(assert (= (and b!505049 (not res!306151)) b!505048))

(assert (= (and b!505048 res!306156) b!505044))

(assert (= (and b!505048 (not res!306157)) b!505035))

(declare-fun m!485713 () Bool)

(assert (=> b!505044 m!485713))

(assert (=> b!505044 m!485713))

(declare-fun m!485715 () Bool)

(assert (=> b!505044 m!485715))

(declare-fun m!485717 () Bool)

(assert (=> b!505035 m!485717))

(assert (=> b!505046 m!485713))

(assert (=> b!505046 m!485713))

(declare-fun m!485719 () Bool)

(assert (=> b!505046 m!485719))

(declare-fun m!485721 () Bool)

(assert (=> b!505040 m!485721))

(declare-fun m!485723 () Bool)

(assert (=> b!505034 m!485723))

(assert (=> b!505034 m!485717))

(declare-fun m!485725 () Bool)

(assert (=> b!505037 m!485725))

(declare-fun m!485727 () Bool)

(assert (=> b!505045 m!485727))

(assert (=> b!505033 m!485713))

(assert (=> b!505033 m!485713))

(declare-fun m!485729 () Bool)

(assert (=> b!505033 m!485729))

(declare-fun m!485731 () Bool)

(assert (=> b!505049 m!485731))

(declare-fun m!485733 () Bool)

(assert (=> b!505049 m!485733))

(assert (=> b!505049 m!485713))

(assert (=> b!505041 m!485713))

(declare-fun m!485735 () Bool)

(assert (=> b!505041 m!485735))

(declare-fun m!485737 () Bool)

(assert (=> b!505041 m!485737))

(declare-fun m!485739 () Bool)

(assert (=> b!505041 m!485739))

(declare-fun m!485741 () Bool)

(assert (=> b!505041 m!485741))

(declare-fun m!485743 () Bool)

(assert (=> b!505041 m!485743))

(declare-fun m!485745 () Bool)

(assert (=> b!505041 m!485745))

(assert (=> b!505041 m!485713))

(declare-fun m!485747 () Bool)

(assert (=> b!505041 m!485747))

(assert (=> b!505041 m!485713))

(declare-fun m!485749 () Bool)

(assert (=> b!505041 m!485749))

(declare-fun m!485751 () Bool)

(assert (=> b!505039 m!485751))

(declare-fun m!485753 () Bool)

(assert (=> b!505036 m!485753))

(declare-fun m!485755 () Bool)

(assert (=> start!45710 m!485755))

(declare-fun m!485757 () Bool)

(assert (=> start!45710 m!485757))

(check-sat (not b!505039) (not b!505046) (not b!505049) (not b!505034) (not b!505033) (not b!505040) (not b!505045) (not b!505041) (not b!505036) (not b!505035) (not b!505037) (not b!505044) (not start!45710))
(check-sat)
