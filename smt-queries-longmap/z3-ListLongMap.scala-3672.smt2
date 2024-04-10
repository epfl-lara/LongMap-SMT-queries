; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50650 () Bool)

(assert start!50650)

(declare-fun b!553673 () Bool)

(declare-fun e!319358 () Bool)

(assert (=> b!553673 (= e!319358 (not true))))

(declare-fun e!319357 () Bool)

(assert (=> b!553673 e!319357))

(declare-fun res!346091 () Bool)

(assert (=> b!553673 (=> (not res!346091) (not e!319357))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34875 0))(
  ( (array!34876 (arr!16747 (Array (_ BitVec 32) (_ BitVec 64))) (size!17111 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34875)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34875 (_ BitVec 32)) Bool)

(assert (=> b!553673 (= res!346091 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17166 0))(
  ( (Unit!17167) )
))
(declare-fun lt!251560 () Unit!17166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17166)

(assert (=> b!553673 (= lt!251560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553674 () Bool)

(declare-fun res!346085 () Bool)

(declare-fun e!319356 () Bool)

(assert (=> b!553674 (=> (not res!346085) (not e!319356))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553674 (= res!346085 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346088 () Bool)

(assert (=> start!50650 (=> (not res!346088) (not e!319356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50650 (= res!346088 (validMask!0 mask!3119))))

(assert (=> start!50650 e!319356))

(assert (=> start!50650 true))

(declare-fun array_inv!12543 (array!34875) Bool)

(assert (=> start!50650 (array_inv!12543 a!3118)))

(declare-fun b!553675 () Bool)

(declare-fun res!346092 () Bool)

(assert (=> b!553675 (=> (not res!346092) (not e!319356))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553675 (= res!346092 (and (= (size!17111 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17111 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17111 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553676 () Bool)

(declare-fun res!346094 () Bool)

(assert (=> b!553676 (=> (not res!346094) (not e!319356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553676 (= res!346094 (validKeyInArray!0 (select (arr!16747 a!3118) j!142)))))

(declare-fun b!553677 () Bool)

(assert (=> b!553677 (= e!319356 e!319358)))

(declare-fun res!346090 () Bool)

(assert (=> b!553677 (=> (not res!346090) (not e!319358))))

(declare-datatypes ((SeekEntryResult!5196 0))(
  ( (MissingZero!5196 (index!23011 (_ BitVec 32))) (Found!5196 (index!23012 (_ BitVec 32))) (Intermediate!5196 (undefined!6008 Bool) (index!23013 (_ BitVec 32)) (x!51934 (_ BitVec 32))) (Undefined!5196) (MissingVacant!5196 (index!23014 (_ BitVec 32))) )
))
(declare-fun lt!251559 () SeekEntryResult!5196)

(assert (=> b!553677 (= res!346090 (or (= lt!251559 (MissingZero!5196 i!1132)) (= lt!251559 (MissingVacant!5196 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34875 (_ BitVec 32)) SeekEntryResult!5196)

(assert (=> b!553677 (= lt!251559 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553678 () Bool)

(declare-fun res!346086 () Bool)

(assert (=> b!553678 (=> (not res!346086) (not e!319358))))

(assert (=> b!553678 (= res!346086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553679 () Bool)

(declare-fun res!346089 () Bool)

(assert (=> b!553679 (=> (not res!346089) (not e!319358))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34875 (_ BitVec 32)) SeekEntryResult!5196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553679 (= res!346089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16747 a!3118) j!142) mask!3119) (select (arr!16747 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16747 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16747 a!3118) i!1132 k0!1914) j!142) (array!34876 (store (arr!16747 a!3118) i!1132 k0!1914) (size!17111 a!3118)) mask!3119)))))

(declare-fun b!553680 () Bool)

(declare-fun res!346093 () Bool)

(assert (=> b!553680 (=> (not res!346093) (not e!319358))))

(declare-datatypes ((List!10827 0))(
  ( (Nil!10824) (Cons!10823 (h!11808 (_ BitVec 64)) (t!17055 List!10827)) )
))
(declare-fun arrayNoDuplicates!0 (array!34875 (_ BitVec 32) List!10827) Bool)

(assert (=> b!553680 (= res!346093 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10824))))

(declare-fun b!553681 () Bool)

(declare-fun res!346087 () Bool)

(assert (=> b!553681 (=> (not res!346087) (not e!319356))))

(assert (=> b!553681 (= res!346087 (validKeyInArray!0 k0!1914))))

(declare-fun b!553682 () Bool)

(assert (=> b!553682 (= e!319357 (= (seekEntryOrOpen!0 (select (arr!16747 a!3118) j!142) a!3118 mask!3119) (Found!5196 j!142)))))

(assert (= (and start!50650 res!346088) b!553675))

(assert (= (and b!553675 res!346092) b!553676))

(assert (= (and b!553676 res!346094) b!553681))

(assert (= (and b!553681 res!346087) b!553674))

(assert (= (and b!553674 res!346085) b!553677))

(assert (= (and b!553677 res!346090) b!553678))

(assert (= (and b!553678 res!346086) b!553680))

(assert (= (and b!553680 res!346093) b!553679))

(assert (= (and b!553679 res!346089) b!553673))

(assert (= (and b!553673 res!346091) b!553682))

(declare-fun m!530805 () Bool)

(assert (=> b!553680 m!530805))

(declare-fun m!530807 () Bool)

(assert (=> b!553678 m!530807))

(declare-fun m!530809 () Bool)

(assert (=> b!553676 m!530809))

(assert (=> b!553676 m!530809))

(declare-fun m!530811 () Bool)

(assert (=> b!553676 m!530811))

(declare-fun m!530813 () Bool)

(assert (=> b!553673 m!530813))

(declare-fun m!530815 () Bool)

(assert (=> b!553673 m!530815))

(assert (=> b!553679 m!530809))

(declare-fun m!530817 () Bool)

(assert (=> b!553679 m!530817))

(assert (=> b!553679 m!530809))

(declare-fun m!530819 () Bool)

(assert (=> b!553679 m!530819))

(declare-fun m!530821 () Bool)

(assert (=> b!553679 m!530821))

(assert (=> b!553679 m!530819))

(declare-fun m!530823 () Bool)

(assert (=> b!553679 m!530823))

(assert (=> b!553679 m!530817))

(assert (=> b!553679 m!530809))

(declare-fun m!530825 () Bool)

(assert (=> b!553679 m!530825))

(declare-fun m!530827 () Bool)

(assert (=> b!553679 m!530827))

(assert (=> b!553679 m!530819))

(assert (=> b!553679 m!530821))

(declare-fun m!530829 () Bool)

(assert (=> b!553677 m!530829))

(assert (=> b!553682 m!530809))

(assert (=> b!553682 m!530809))

(declare-fun m!530831 () Bool)

(assert (=> b!553682 m!530831))

(declare-fun m!530833 () Bool)

(assert (=> b!553681 m!530833))

(declare-fun m!530835 () Bool)

(assert (=> b!553674 m!530835))

(declare-fun m!530837 () Bool)

(assert (=> start!50650 m!530837))

(declare-fun m!530839 () Bool)

(assert (=> start!50650 m!530839))

(check-sat (not b!553680) (not b!553682) (not start!50650) (not b!553676) (not b!553677) (not b!553674) (not b!553673) (not b!553679) (not b!553678) (not b!553681))
(check-sat)
