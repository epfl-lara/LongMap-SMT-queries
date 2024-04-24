; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45356 () Bool)

(assert start!45356)

(declare-fun b!498137 () Bool)

(declare-fun e!291973 () Bool)

(declare-fun e!291972 () Bool)

(assert (=> b!498137 (= e!291973 (not e!291972))))

(declare-fun res!300319 () Bool)

(assert (=> b!498137 (=> res!300319 e!291972)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225635 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3895 0))(
  ( (MissingZero!3895 (index!17762 (_ BitVec 32))) (Found!3895 (index!17763 (_ BitVec 32))) (Intermediate!3895 (undefined!4707 Bool) (index!17764 (_ BitVec 32)) (x!46961 (_ BitVec 32))) (Undefined!3895) (MissingVacant!3895 (index!17765 (_ BitVec 32))) )
))
(declare-fun lt!225632 () SeekEntryResult!3895)

(declare-fun lt!225634 () (_ BitVec 32))

(declare-datatypes ((array!32182 0))(
  ( (array!32183 (arr!15472 (Array (_ BitVec 32) (_ BitVec 64))) (size!15836 (_ BitVec 32))) )
))
(declare-fun lt!225631 () array!32182)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32182 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!498137 (= res!300319 (= lt!225632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225634 lt!225635 lt!225631 mask!3524)))))

(declare-fun a!3235 () array!32182)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225637 () (_ BitVec 32))

(assert (=> b!498137 (= lt!225632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225637 (select (arr!15472 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498137 (= lt!225634 (toIndex!0 lt!225635 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498137 (= lt!225635 (select (store (arr!15472 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498137 (= lt!225637 (toIndex!0 (select (arr!15472 a!3235) j!176) mask!3524))))

(assert (=> b!498137 (= lt!225631 (array!32183 (store (arr!15472 a!3235) i!1204 k0!2280) (size!15836 a!3235)))))

(declare-fun e!291974 () Bool)

(assert (=> b!498137 e!291974))

(declare-fun res!300323 () Bool)

(assert (=> b!498137 (=> (not res!300323) (not e!291974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32182 (_ BitVec 32)) Bool)

(assert (=> b!498137 (= res!300323 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14815 0))(
  ( (Unit!14816) )
))
(declare-fun lt!225638 () Unit!14815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14815)

(assert (=> b!498137 (= lt!225638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498138 () Bool)

(declare-fun res!300322 () Bool)

(declare-fun e!291969 () Bool)

(assert (=> b!498138 (=> (not res!300322) (not e!291969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498138 (= res!300322 (validKeyInArray!0 (select (arr!15472 a!3235) j!176)))))

(declare-fun b!498139 () Bool)

(declare-fun e!291971 () Bool)

(assert (=> b!498139 (= e!291971 true)))

(declare-fun lt!225633 () SeekEntryResult!3895)

(assert (=> b!498139 (= lt!225633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225637 lt!225635 lt!225631 mask!3524))))

(declare-fun b!498140 () Bool)

(declare-fun res!300325 () Bool)

(assert (=> b!498140 (=> (not res!300325) (not e!291969))))

(assert (=> b!498140 (= res!300325 (and (= (size!15836 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15836 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15836 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498141 () Bool)

(declare-fun e!291970 () Unit!14815)

(declare-fun Unit!14817 () Unit!14815)

(assert (=> b!498141 (= e!291970 Unit!14817)))

(declare-fun b!498142 () Bool)

(declare-fun res!300330 () Bool)

(assert (=> b!498142 (=> res!300330 e!291972)))

(get-info :version)

(assert (=> b!498142 (= res!300330 (or (undefined!4707 lt!225632) (not ((_ is Intermediate!3895) lt!225632))))))

(declare-fun b!498143 () Bool)

(assert (=> b!498143 (= e!291972 e!291971)))

(declare-fun res!300329 () Bool)

(assert (=> b!498143 (=> res!300329 e!291971)))

(assert (=> b!498143 (= res!300329 (or (bvsgt #b00000000000000000000000000000000 (x!46961 lt!225632)) (bvsgt (x!46961 lt!225632) #b01111111111111111111111111111110) (bvslt lt!225637 #b00000000000000000000000000000000) (bvsge lt!225637 (size!15836 a!3235)) (bvslt (index!17764 lt!225632) #b00000000000000000000000000000000) (bvsge (index!17764 lt!225632) (size!15836 a!3235)) (not (= lt!225632 (Intermediate!3895 false (index!17764 lt!225632) (x!46961 lt!225632))))))))

(assert (=> b!498143 (and (or (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225640 () Unit!14815)

(assert (=> b!498143 (= lt!225640 e!291970)))

(declare-fun c!59186 () Bool)

(assert (=> b!498143 (= c!59186 (= (select (arr!15472 a!3235) (index!17764 lt!225632)) (select (arr!15472 a!3235) j!176)))))

(assert (=> b!498143 (and (bvslt (x!46961 lt!225632) #b01111111111111111111111111111110) (or (= (select (arr!15472 a!3235) (index!17764 lt!225632)) (select (arr!15472 a!3235) j!176)) (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15472 a!3235) (index!17764 lt!225632)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498144 () Bool)

(declare-fun res!300320 () Bool)

(assert (=> b!498144 (=> (not res!300320) (not e!291973))))

(assert (=> b!498144 (= res!300320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498145 () Bool)

(declare-fun res!300324 () Bool)

(assert (=> b!498145 (=> (not res!300324) (not e!291969))))

(assert (=> b!498145 (= res!300324 (validKeyInArray!0 k0!2280))))

(declare-fun b!498146 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32182 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!498146 (= e!291974 (= (seekEntryOrOpen!0 (select (arr!15472 a!3235) j!176) a!3235 mask!3524) (Found!3895 j!176)))))

(declare-fun b!498147 () Bool)

(declare-fun Unit!14818 () Unit!14815)

(assert (=> b!498147 (= e!291970 Unit!14818)))

(declare-fun lt!225636 () Unit!14815)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14815)

(assert (=> b!498147 (= lt!225636 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225637 #b00000000000000000000000000000000 (index!17764 lt!225632) (x!46961 lt!225632) mask!3524))))

(declare-fun res!300326 () Bool)

(assert (=> b!498147 (= res!300326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225637 lt!225635 lt!225631 mask!3524) (Intermediate!3895 false (index!17764 lt!225632) (x!46961 lt!225632))))))

(declare-fun e!291968 () Bool)

(assert (=> b!498147 (=> (not res!300326) (not e!291968))))

(assert (=> b!498147 e!291968))

(declare-fun b!498148 () Bool)

(declare-fun res!300327 () Bool)

(assert (=> b!498148 (=> (not res!300327) (not e!291969))))

(declare-fun arrayContainsKey!0 (array!32182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498148 (= res!300327 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498150 () Bool)

(assert (=> b!498150 (= e!291968 false)))

(declare-fun b!498151 () Bool)

(declare-fun res!300331 () Bool)

(assert (=> b!498151 (=> (not res!300331) (not e!291973))))

(declare-datatypes ((List!9537 0))(
  ( (Nil!9534) (Cons!9533 (h!10407 (_ BitVec 64)) (t!15757 List!9537)) )
))
(declare-fun arrayNoDuplicates!0 (array!32182 (_ BitVec 32) List!9537) Bool)

(assert (=> b!498151 (= res!300331 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9534))))

(declare-fun b!498149 () Bool)

(assert (=> b!498149 (= e!291969 e!291973)))

(declare-fun res!300321 () Bool)

(assert (=> b!498149 (=> (not res!300321) (not e!291973))))

(declare-fun lt!225639 () SeekEntryResult!3895)

(assert (=> b!498149 (= res!300321 (or (= lt!225639 (MissingZero!3895 i!1204)) (= lt!225639 (MissingVacant!3895 i!1204))))))

(assert (=> b!498149 (= lt!225639 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!300328 () Bool)

(assert (=> start!45356 (=> (not res!300328) (not e!291969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45356 (= res!300328 (validMask!0 mask!3524))))

(assert (=> start!45356 e!291969))

(assert (=> start!45356 true))

(declare-fun array_inv!11331 (array!32182) Bool)

(assert (=> start!45356 (array_inv!11331 a!3235)))

(assert (= (and start!45356 res!300328) b!498140))

(assert (= (and b!498140 res!300325) b!498138))

(assert (= (and b!498138 res!300322) b!498145))

(assert (= (and b!498145 res!300324) b!498148))

(assert (= (and b!498148 res!300327) b!498149))

(assert (= (and b!498149 res!300321) b!498144))

(assert (= (and b!498144 res!300320) b!498151))

(assert (= (and b!498151 res!300331) b!498137))

(assert (= (and b!498137 res!300323) b!498146))

(assert (= (and b!498137 (not res!300319)) b!498142))

(assert (= (and b!498142 (not res!300330)) b!498143))

(assert (= (and b!498143 c!59186) b!498147))

(assert (= (and b!498143 (not c!59186)) b!498141))

(assert (= (and b!498147 res!300326) b!498150))

(assert (= (and b!498143 (not res!300329)) b!498139))

(declare-fun m!479665 () Bool)

(assert (=> b!498147 m!479665))

(declare-fun m!479667 () Bool)

(assert (=> b!498147 m!479667))

(declare-fun m!479669 () Bool)

(assert (=> b!498144 m!479669))

(declare-fun m!479671 () Bool)

(assert (=> b!498145 m!479671))

(declare-fun m!479673 () Bool)

(assert (=> b!498146 m!479673))

(assert (=> b!498146 m!479673))

(declare-fun m!479675 () Bool)

(assert (=> b!498146 m!479675))

(assert (=> b!498139 m!479667))

(declare-fun m!479677 () Bool)

(assert (=> b!498137 m!479677))

(declare-fun m!479679 () Bool)

(assert (=> b!498137 m!479679))

(declare-fun m!479681 () Bool)

(assert (=> b!498137 m!479681))

(declare-fun m!479683 () Bool)

(assert (=> b!498137 m!479683))

(assert (=> b!498137 m!479673))

(declare-fun m!479685 () Bool)

(assert (=> b!498137 m!479685))

(assert (=> b!498137 m!479673))

(declare-fun m!479687 () Bool)

(assert (=> b!498137 m!479687))

(declare-fun m!479689 () Bool)

(assert (=> b!498137 m!479689))

(assert (=> b!498137 m!479673))

(declare-fun m!479691 () Bool)

(assert (=> b!498137 m!479691))

(declare-fun m!479693 () Bool)

(assert (=> b!498151 m!479693))

(declare-fun m!479695 () Bool)

(assert (=> start!45356 m!479695))

(declare-fun m!479697 () Bool)

(assert (=> start!45356 m!479697))

(declare-fun m!479699 () Bool)

(assert (=> b!498143 m!479699))

(assert (=> b!498143 m!479673))

(declare-fun m!479701 () Bool)

(assert (=> b!498148 m!479701))

(declare-fun m!479703 () Bool)

(assert (=> b!498149 m!479703))

(assert (=> b!498138 m!479673))

(assert (=> b!498138 m!479673))

(declare-fun m!479705 () Bool)

(assert (=> b!498138 m!479705))

(check-sat (not start!45356) (not b!498137) (not b!498144) (not b!498147) (not b!498146) (not b!498145) (not b!498149) (not b!498139) (not b!498151) (not b!498148) (not b!498138))
(check-sat)
