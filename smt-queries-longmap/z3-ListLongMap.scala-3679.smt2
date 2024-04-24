; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50736 () Bool)

(assert start!50736)

(declare-fun b!554482 () Bool)

(declare-fun e!319754 () Bool)

(declare-fun e!319755 () Bool)

(assert (=> b!554482 (= e!319754 e!319755)))

(declare-fun res!346791 () Bool)

(assert (=> b!554482 (=> (not res!346791) (not e!319755))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5167 0))(
  ( (MissingZero!5167 (index!22895 (_ BitVec 32))) (Found!5167 (index!22896 (_ BitVec 32))) (Intermediate!5167 (undefined!5979 Bool) (index!22897 (_ BitVec 32)) (x!51964 (_ BitVec 32))) (Undefined!5167) (MissingVacant!5167 (index!22898 (_ BitVec 32))) )
))
(declare-fun lt!251854 () SeekEntryResult!5167)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!251852 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34908 0))(
  ( (array!34909 (arr!16762 (Array (_ BitVec 32) (_ BitVec 64))) (size!17126 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34908)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34908 (_ BitVec 32)) SeekEntryResult!5167)

(assert (=> b!554482 (= res!346791 (= lt!251854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251852 (select (store (arr!16762 a!3118) i!1132 k0!1914) j!142) (array!34909 (store (arr!16762 a!3118) i!1132 k0!1914) (size!17126 a!3118)) mask!3119)))))

(declare-fun lt!251853 () (_ BitVec 32))

(assert (=> b!554482 (= lt!251854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251853 (select (arr!16762 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554482 (= lt!251852 (toIndex!0 (select (store (arr!16762 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554482 (= lt!251853 (toIndex!0 (select (arr!16762 a!3118) j!142) mask!3119))))

(declare-fun b!554483 () Bool)

(declare-fun res!346790 () Bool)

(declare-fun e!319758 () Bool)

(assert (=> b!554483 (=> (not res!346790) (not e!319758))))

(assert (=> b!554483 (= res!346790 (and (= (size!17126 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17126 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17126 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554484 () Bool)

(declare-fun res!346795 () Bool)

(assert (=> b!554484 (=> (not res!346795) (not e!319754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34908 (_ BitVec 32)) Bool)

(assert (=> b!554484 (= res!346795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554485 () Bool)

(get-info :version)

(assert (=> b!554485 (= e!319755 (not (or (not ((_ is Intermediate!5167) lt!251854)) (undefined!5979 lt!251854) (= (select (arr!16762 a!3118) (index!22897 lt!251854)) (select (arr!16762 a!3118) j!142)) (not (= (select (arr!16762 a!3118) (index!22897 lt!251854)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319756 () Bool)

(assert (=> b!554485 e!319756))

(declare-fun res!346794 () Bool)

(assert (=> b!554485 (=> (not res!346794) (not e!319756))))

(assert (=> b!554485 (= res!346794 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17179 0))(
  ( (Unit!17180) )
))
(declare-fun lt!251851 () Unit!17179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17179)

(assert (=> b!554485 (= lt!251851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!346792 () Bool)

(assert (=> start!50736 (=> (not res!346792) (not e!319758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50736 (= res!346792 (validMask!0 mask!3119))))

(assert (=> start!50736 e!319758))

(assert (=> start!50736 true))

(declare-fun array_inv!12621 (array!34908) Bool)

(assert (=> start!50736 (array_inv!12621 a!3118)))

(declare-fun b!554486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34908 (_ BitVec 32)) SeekEntryResult!5167)

(assert (=> b!554486 (= e!319756 (= (seekEntryOrOpen!0 (select (arr!16762 a!3118) j!142) a!3118 mask!3119) (Found!5167 j!142)))))

(declare-fun b!554487 () Bool)

(assert (=> b!554487 (= e!319758 e!319754)))

(declare-fun res!346797 () Bool)

(assert (=> b!554487 (=> (not res!346797) (not e!319754))))

(declare-fun lt!251850 () SeekEntryResult!5167)

(assert (=> b!554487 (= res!346797 (or (= lt!251850 (MissingZero!5167 i!1132)) (= lt!251850 (MissingVacant!5167 i!1132))))))

(assert (=> b!554487 (= lt!251850 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554488 () Bool)

(declare-fun res!346796 () Bool)

(assert (=> b!554488 (=> (not res!346796) (not e!319758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554488 (= res!346796 (validKeyInArray!0 k0!1914))))

(declare-fun b!554489 () Bool)

(declare-fun res!346793 () Bool)

(assert (=> b!554489 (=> (not res!346793) (not e!319758))))

(assert (=> b!554489 (= res!346793 (validKeyInArray!0 (select (arr!16762 a!3118) j!142)))))

(declare-fun b!554490 () Bool)

(declare-fun res!346798 () Bool)

(assert (=> b!554490 (=> (not res!346798) (not e!319754))))

(declare-datatypes ((List!10749 0))(
  ( (Nil!10746) (Cons!10745 (h!11733 (_ BitVec 64)) (t!16969 List!10749)) )
))
(declare-fun arrayNoDuplicates!0 (array!34908 (_ BitVec 32) List!10749) Bool)

(assert (=> b!554490 (= res!346798 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10746))))

(declare-fun b!554491 () Bool)

(declare-fun res!346789 () Bool)

(assert (=> b!554491 (=> (not res!346789) (not e!319758))))

(declare-fun arrayContainsKey!0 (array!34908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554491 (= res!346789 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50736 res!346792) b!554483))

(assert (= (and b!554483 res!346790) b!554489))

(assert (= (and b!554489 res!346793) b!554488))

(assert (= (and b!554488 res!346796) b!554491))

(assert (= (and b!554491 res!346789) b!554487))

(assert (= (and b!554487 res!346797) b!554484))

(assert (= (and b!554484 res!346795) b!554490))

(assert (= (and b!554490 res!346798) b!554482))

(assert (= (and b!554482 res!346791) b!554485))

(assert (= (and b!554485 res!346794) b!554486))

(declare-fun m!531881 () Bool)

(assert (=> b!554482 m!531881))

(declare-fun m!531883 () Bool)

(assert (=> b!554482 m!531883))

(declare-fun m!531885 () Bool)

(assert (=> b!554482 m!531885))

(declare-fun m!531887 () Bool)

(assert (=> b!554482 m!531887))

(assert (=> b!554482 m!531881))

(assert (=> b!554482 m!531885))

(assert (=> b!554482 m!531881))

(declare-fun m!531889 () Bool)

(assert (=> b!554482 m!531889))

(declare-fun m!531891 () Bool)

(assert (=> b!554482 m!531891))

(assert (=> b!554482 m!531885))

(declare-fun m!531893 () Bool)

(assert (=> b!554482 m!531893))

(assert (=> b!554486 m!531881))

(assert (=> b!554486 m!531881))

(declare-fun m!531895 () Bool)

(assert (=> b!554486 m!531895))

(declare-fun m!531897 () Bool)

(assert (=> b!554485 m!531897))

(assert (=> b!554485 m!531881))

(declare-fun m!531899 () Bool)

(assert (=> b!554485 m!531899))

(declare-fun m!531901 () Bool)

(assert (=> b!554485 m!531901))

(declare-fun m!531903 () Bool)

(assert (=> b!554488 m!531903))

(declare-fun m!531905 () Bool)

(assert (=> b!554487 m!531905))

(declare-fun m!531907 () Bool)

(assert (=> b!554490 m!531907))

(assert (=> b!554489 m!531881))

(assert (=> b!554489 m!531881))

(declare-fun m!531909 () Bool)

(assert (=> b!554489 m!531909))

(declare-fun m!531911 () Bool)

(assert (=> b!554491 m!531911))

(declare-fun m!531913 () Bool)

(assert (=> start!50736 m!531913))

(declare-fun m!531915 () Bool)

(assert (=> start!50736 m!531915))

(declare-fun m!531917 () Bool)

(assert (=> b!554484 m!531917))

(check-sat (not b!554488) (not b!554486) (not b!554487) (not b!554482) (not b!554489) (not b!554484) (not b!554485) (not b!554491) (not start!50736) (not b!554490))
(check-sat)
