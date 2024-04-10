; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45392 () Bool)

(assert start!45392)

(declare-fun e!292319 () Bool)

(declare-fun b!498783 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32217 0))(
  ( (array!32218 (arr!15490 (Array (_ BitVec 32) (_ BitVec 64))) (size!15854 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32217)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3957 0))(
  ( (MissingZero!3957 (index!18010 (_ BitVec 32))) (Found!3957 (index!18011 (_ BitVec 32))) (Intermediate!3957 (undefined!4769 Bool) (index!18012 (_ BitVec 32)) (x!47058 (_ BitVec 32))) (Undefined!3957) (MissingVacant!3957 (index!18013 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32217 (_ BitVec 32)) SeekEntryResult!3957)

(assert (=> b!498783 (= e!292319 (= (seekEntryOrOpen!0 (select (arr!15490 a!3235) j!176) a!3235 mask!3524) (Found!3957 j!176)))))

(declare-fun b!498784 () Bool)

(declare-datatypes ((Unit!14904 0))(
  ( (Unit!14905) )
))
(declare-fun e!292321 () Unit!14904)

(declare-fun Unit!14906 () Unit!14904)

(assert (=> b!498784 (= e!292321 Unit!14906)))

(declare-fun b!498786 () Bool)

(declare-fun e!292322 () Bool)

(assert (=> b!498786 (= e!292322 false)))

(declare-fun b!498787 () Bool)

(declare-fun res!300836 () Bool)

(declare-fun e!292320 () Bool)

(assert (=> b!498787 (=> (not res!300836) (not e!292320))))

(declare-datatypes ((List!9648 0))(
  ( (Nil!9645) (Cons!9644 (h!10518 (_ BitVec 64)) (t!15876 List!9648)) )
))
(declare-fun arrayNoDuplicates!0 (array!32217 (_ BitVec 32) List!9648) Bool)

(assert (=> b!498787 (= res!300836 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9645))))

(declare-fun b!498788 () Bool)

(declare-fun res!300840 () Bool)

(declare-fun e!292325 () Bool)

(assert (=> b!498788 (=> (not res!300840) (not e!292325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498788 (= res!300840 (validKeyInArray!0 (select (arr!15490 a!3235) j!176)))))

(declare-fun b!498789 () Bool)

(declare-fun res!300842 () Bool)

(assert (=> b!498789 (=> (not res!300842) (not e!292325))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498789 (= res!300842 (and (= (size!15854 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15854 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15854 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498790 () Bool)

(assert (=> b!498790 (= e!292325 e!292320)))

(declare-fun res!300845 () Bool)

(assert (=> b!498790 (=> (not res!300845) (not e!292320))))

(declare-fun lt!226014 () SeekEntryResult!3957)

(assert (=> b!498790 (= res!300845 (or (= lt!226014 (MissingZero!3957 i!1204)) (= lt!226014 (MissingVacant!3957 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!498790 (= lt!226014 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498791 () Bool)

(declare-fun res!300839 () Bool)

(assert (=> b!498791 (=> (not res!300839) (not e!292320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32217 (_ BitVec 32)) Bool)

(assert (=> b!498791 (= res!300839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498792 () Bool)

(declare-fun res!300833 () Bool)

(assert (=> b!498792 (=> (not res!300833) (not e!292325))))

(assert (=> b!498792 (= res!300833 (validKeyInArray!0 k0!2280))))

(declare-fun b!498793 () Bool)

(declare-fun res!300834 () Bool)

(declare-fun e!292323 () Bool)

(assert (=> b!498793 (=> res!300834 e!292323)))

(declare-fun lt!226015 () SeekEntryResult!3957)

(get-info :version)

(assert (=> b!498793 (= res!300834 (or (undefined!4769 lt!226015) (not ((_ is Intermediate!3957) lt!226015))))))

(declare-fun b!498794 () Bool)

(assert (=> b!498794 (= e!292320 (not e!292323))))

(declare-fun res!300837 () Bool)

(assert (=> b!498794 (=> res!300837 e!292323)))

(declare-fun lt!226013 () (_ BitVec 32))

(declare-fun lt!226011 () (_ BitVec 64))

(declare-fun lt!226009 () array!32217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32217 (_ BitVec 32)) SeekEntryResult!3957)

(assert (=> b!498794 (= res!300837 (= lt!226015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226013 lt!226011 lt!226009 mask!3524)))))

(declare-fun lt!226016 () (_ BitVec 32))

(assert (=> b!498794 (= lt!226015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226016 (select (arr!15490 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498794 (= lt!226013 (toIndex!0 lt!226011 mask!3524))))

(assert (=> b!498794 (= lt!226011 (select (store (arr!15490 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498794 (= lt!226016 (toIndex!0 (select (arr!15490 a!3235) j!176) mask!3524))))

(assert (=> b!498794 (= lt!226009 (array!32218 (store (arr!15490 a!3235) i!1204 k0!2280) (size!15854 a!3235)))))

(assert (=> b!498794 e!292319))

(declare-fun res!300844 () Bool)

(assert (=> b!498794 (=> (not res!300844) (not e!292319))))

(assert (=> b!498794 (= res!300844 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226018 () Unit!14904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14904)

(assert (=> b!498794 (= lt!226018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498795 () Bool)

(declare-fun e!292324 () Bool)

(assert (=> b!498795 (= e!292323 e!292324)))

(declare-fun res!300838 () Bool)

(assert (=> b!498795 (=> res!300838 e!292324)))

(assert (=> b!498795 (= res!300838 (or (bvsgt #b00000000000000000000000000000000 (x!47058 lt!226015)) (bvsgt (x!47058 lt!226015) #b01111111111111111111111111111110) (bvslt lt!226016 #b00000000000000000000000000000000) (bvsge lt!226016 (size!15854 a!3235)) (bvslt (index!18012 lt!226015) #b00000000000000000000000000000000) (bvsge (index!18012 lt!226015) (size!15854 a!3235)) (not (= lt!226015 (Intermediate!3957 false (index!18012 lt!226015) (x!47058 lt!226015))))))))

(assert (=> b!498795 (and (or (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226017 () Unit!14904)

(assert (=> b!498795 (= lt!226017 e!292321)))

(declare-fun c!59252 () Bool)

(assert (=> b!498795 (= c!59252 (= (select (arr!15490 a!3235) (index!18012 lt!226015)) (select (arr!15490 a!3235) j!176)))))

(assert (=> b!498795 (and (bvslt (x!47058 lt!226015) #b01111111111111111111111111111110) (or (= (select (arr!15490 a!3235) (index!18012 lt!226015)) (select (arr!15490 a!3235) j!176)) (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15490 a!3235) (index!18012 lt!226015)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498796 () Bool)

(declare-fun Unit!14907 () Unit!14904)

(assert (=> b!498796 (= e!292321 Unit!14907)))

(declare-fun lt!226012 () Unit!14904)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14904)

(assert (=> b!498796 (= lt!226012 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226016 #b00000000000000000000000000000000 (index!18012 lt!226015) (x!47058 lt!226015) mask!3524))))

(declare-fun res!300835 () Bool)

(assert (=> b!498796 (= res!300835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226016 lt!226011 lt!226009 mask!3524) (Intermediate!3957 false (index!18012 lt!226015) (x!47058 lt!226015))))))

(assert (=> b!498796 (=> (not res!300835) (not e!292322))))

(assert (=> b!498796 e!292322))

(declare-fun b!498797 () Bool)

(assert (=> b!498797 (= e!292324 true)))

(declare-fun lt!226010 () SeekEntryResult!3957)

(assert (=> b!498797 (= lt!226010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226016 lt!226011 lt!226009 mask!3524))))

(declare-fun res!300843 () Bool)

(assert (=> start!45392 (=> (not res!300843) (not e!292325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45392 (= res!300843 (validMask!0 mask!3524))))

(assert (=> start!45392 e!292325))

(assert (=> start!45392 true))

(declare-fun array_inv!11286 (array!32217) Bool)

(assert (=> start!45392 (array_inv!11286 a!3235)))

(declare-fun b!498785 () Bool)

(declare-fun res!300841 () Bool)

(assert (=> b!498785 (=> (not res!300841) (not e!292325))))

(declare-fun arrayContainsKey!0 (array!32217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498785 (= res!300841 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45392 res!300843) b!498789))

(assert (= (and b!498789 res!300842) b!498788))

(assert (= (and b!498788 res!300840) b!498792))

(assert (= (and b!498792 res!300833) b!498785))

(assert (= (and b!498785 res!300841) b!498790))

(assert (= (and b!498790 res!300845) b!498791))

(assert (= (and b!498791 res!300839) b!498787))

(assert (= (and b!498787 res!300836) b!498794))

(assert (= (and b!498794 res!300844) b!498783))

(assert (= (and b!498794 (not res!300837)) b!498793))

(assert (= (and b!498793 (not res!300834)) b!498795))

(assert (= (and b!498795 c!59252) b!498796))

(assert (= (and b!498795 (not c!59252)) b!498784))

(assert (= (and b!498796 res!300835) b!498786))

(assert (= (and b!498795 (not res!300838)) b!498797))

(declare-fun m!480027 () Bool)

(assert (=> b!498797 m!480027))

(declare-fun m!480029 () Bool)

(assert (=> b!498787 m!480029))

(declare-fun m!480031 () Bool)

(assert (=> b!498785 m!480031))

(declare-fun m!480033 () Bool)

(assert (=> b!498791 m!480033))

(declare-fun m!480035 () Bool)

(assert (=> b!498790 m!480035))

(declare-fun m!480037 () Bool)

(assert (=> b!498796 m!480037))

(assert (=> b!498796 m!480027))

(declare-fun m!480039 () Bool)

(assert (=> b!498794 m!480039))

(declare-fun m!480041 () Bool)

(assert (=> b!498794 m!480041))

(declare-fun m!480043 () Bool)

(assert (=> b!498794 m!480043))

(declare-fun m!480045 () Bool)

(assert (=> b!498794 m!480045))

(declare-fun m!480047 () Bool)

(assert (=> b!498794 m!480047))

(declare-fun m!480049 () Bool)

(assert (=> b!498794 m!480049))

(assert (=> b!498794 m!480047))

(declare-fun m!480051 () Bool)

(assert (=> b!498794 m!480051))

(declare-fun m!480053 () Bool)

(assert (=> b!498794 m!480053))

(declare-fun m!480055 () Bool)

(assert (=> b!498794 m!480055))

(assert (=> b!498794 m!480047))

(declare-fun m!480057 () Bool)

(assert (=> b!498795 m!480057))

(assert (=> b!498795 m!480047))

(assert (=> b!498783 m!480047))

(assert (=> b!498783 m!480047))

(declare-fun m!480059 () Bool)

(assert (=> b!498783 m!480059))

(declare-fun m!480061 () Bool)

(assert (=> b!498792 m!480061))

(assert (=> b!498788 m!480047))

(assert (=> b!498788 m!480047))

(declare-fun m!480063 () Bool)

(assert (=> b!498788 m!480063))

(declare-fun m!480065 () Bool)

(assert (=> start!45392 m!480065))

(declare-fun m!480067 () Bool)

(assert (=> start!45392 m!480067))

(check-sat (not b!498797) (not b!498787) (not b!498794) (not b!498783) (not b!498792) (not start!45392) (not b!498790) (not b!498785) (not b!498788) (not b!498796) (not b!498791))
(check-sat)
