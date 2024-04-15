; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50678 () Bool)

(assert start!50678)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319453 () Bool)

(declare-fun b!554011 () Bool)

(declare-datatypes ((array!34912 0))(
  ( (array!34913 (arr!16766 (Array (_ BitVec 32) (_ BitVec 64))) (size!17131 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34912)

(declare-datatypes ((SeekEntryResult!5212 0))(
  ( (MissingZero!5212 (index!23075 (_ BitVec 32))) (Found!5212 (index!23076 (_ BitVec 32))) (Intermediate!5212 (undefined!6024 Bool) (index!23077 (_ BitVec 32)) (x!52001 (_ BitVec 32))) (Undefined!5212) (MissingVacant!5212 (index!23078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34912 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!554011 (= e!319453 (= (seekEntryOrOpen!0 (select (arr!16766 a!3118) j!142) a!3118 mask!3119) (Found!5212 j!142)))))

(declare-fun b!554012 () Bool)

(declare-fun res!346566 () Bool)

(declare-fun e!319454 () Bool)

(assert (=> b!554012 (=> (not res!346566) (not e!319454))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554012 (= res!346566 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!319452 () Bool)

(declare-fun b!554013 () Bool)

(declare-fun lt!251506 () SeekEntryResult!5212)

(get-info :version)

(assert (=> b!554013 (= e!319452 (not (or (not ((_ is Intermediate!5212) lt!251506)) (undefined!6024 lt!251506) (= (select (arr!16766 a!3118) (index!23077 lt!251506)) (select (arr!16766 a!3118) j!142)) (not (= (select (arr!16766 a!3118) (index!23077 lt!251506)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!554013 e!319453))

(declare-fun res!346565 () Bool)

(assert (=> b!554013 (=> (not res!346565) (not e!319453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34912 (_ BitVec 32)) Bool)

(assert (=> b!554013 (= res!346565 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17184 0))(
  ( (Unit!17185) )
))
(declare-fun lt!251505 () Unit!17184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17184)

(assert (=> b!554013 (= lt!251505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554014 () Bool)

(declare-fun res!346567 () Bool)

(assert (=> b!554014 (=> (not res!346567) (not e!319454))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554014 (= res!346567 (and (= (size!17131 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17131 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17131 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554015 () Bool)

(declare-fun res!346568 () Bool)

(assert (=> b!554015 (=> (not res!346568) (not e!319454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554015 (= res!346568 (validKeyInArray!0 (select (arr!16766 a!3118) j!142)))))

(declare-fun b!554016 () Bool)

(declare-fun res!346571 () Bool)

(assert (=> b!554016 (=> (not res!346571) (not e!319454))))

(assert (=> b!554016 (= res!346571 (validKeyInArray!0 k0!1914))))

(declare-fun b!554017 () Bool)

(declare-fun e!319455 () Bool)

(assert (=> b!554017 (= e!319454 e!319455)))

(declare-fun res!346572 () Bool)

(assert (=> b!554017 (=> (not res!346572) (not e!319455))))

(declare-fun lt!251507 () SeekEntryResult!5212)

(assert (=> b!554017 (= res!346572 (or (= lt!251507 (MissingZero!5212 i!1132)) (= lt!251507 (MissingVacant!5212 i!1132))))))

(assert (=> b!554017 (= lt!251507 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554018 () Bool)

(declare-fun res!346569 () Bool)

(assert (=> b!554018 (=> (not res!346569) (not e!319455))))

(assert (=> b!554018 (= res!346569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346574 () Bool)

(assert (=> start!50678 (=> (not res!346574) (not e!319454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50678 (= res!346574 (validMask!0 mask!3119))))

(assert (=> start!50678 e!319454))

(assert (=> start!50678 true))

(declare-fun array_inv!12649 (array!34912) Bool)

(assert (=> start!50678 (array_inv!12649 a!3118)))

(declare-fun b!554019 () Bool)

(declare-fun res!346570 () Bool)

(assert (=> b!554019 (=> (not res!346570) (not e!319455))))

(declare-datatypes ((List!10885 0))(
  ( (Nil!10882) (Cons!10881 (h!11866 (_ BitVec 64)) (t!17104 List!10885)) )
))
(declare-fun arrayNoDuplicates!0 (array!34912 (_ BitVec 32) List!10885) Bool)

(assert (=> b!554019 (= res!346570 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10882))))

(declare-fun b!554020 () Bool)

(assert (=> b!554020 (= e!319455 e!319452)))

(declare-fun res!346573 () Bool)

(assert (=> b!554020 (=> (not res!346573) (not e!319452))))

(declare-fun lt!251508 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34912 (_ BitVec 32)) SeekEntryResult!5212)

(assert (=> b!554020 (= res!346573 (= lt!251506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251508 (select (store (arr!16766 a!3118) i!1132 k0!1914) j!142) (array!34913 (store (arr!16766 a!3118) i!1132 k0!1914) (size!17131 a!3118)) mask!3119)))))

(declare-fun lt!251509 () (_ BitVec 32))

(assert (=> b!554020 (= lt!251506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251509 (select (arr!16766 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554020 (= lt!251508 (toIndex!0 (select (store (arr!16766 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554020 (= lt!251509 (toIndex!0 (select (arr!16766 a!3118) j!142) mask!3119))))

(assert (= (and start!50678 res!346574) b!554014))

(assert (= (and b!554014 res!346567) b!554015))

(assert (= (and b!554015 res!346568) b!554016))

(assert (= (and b!554016 res!346571) b!554012))

(assert (= (and b!554012 res!346566) b!554017))

(assert (= (and b!554017 res!346572) b!554018))

(assert (= (and b!554018 res!346569) b!554019))

(assert (= (and b!554019 res!346570) b!554020))

(assert (= (and b!554020 res!346573) b!554013))

(assert (= (and b!554013 res!346565) b!554011))

(declare-fun m!530771 () Bool)

(assert (=> b!554015 m!530771))

(assert (=> b!554015 m!530771))

(declare-fun m!530773 () Bool)

(assert (=> b!554015 m!530773))

(assert (=> b!554020 m!530771))

(declare-fun m!530775 () Bool)

(assert (=> b!554020 m!530775))

(assert (=> b!554020 m!530771))

(declare-fun m!530777 () Bool)

(assert (=> b!554020 m!530777))

(assert (=> b!554020 m!530777))

(declare-fun m!530779 () Bool)

(assert (=> b!554020 m!530779))

(declare-fun m!530781 () Bool)

(assert (=> b!554020 m!530781))

(assert (=> b!554020 m!530771))

(declare-fun m!530783 () Bool)

(assert (=> b!554020 m!530783))

(assert (=> b!554020 m!530777))

(declare-fun m!530785 () Bool)

(assert (=> b!554020 m!530785))

(declare-fun m!530787 () Bool)

(assert (=> b!554012 m!530787))

(declare-fun m!530789 () Bool)

(assert (=> start!50678 m!530789))

(declare-fun m!530791 () Bool)

(assert (=> start!50678 m!530791))

(declare-fun m!530793 () Bool)

(assert (=> b!554018 m!530793))

(declare-fun m!530795 () Bool)

(assert (=> b!554013 m!530795))

(assert (=> b!554013 m!530771))

(declare-fun m!530797 () Bool)

(assert (=> b!554013 m!530797))

(declare-fun m!530799 () Bool)

(assert (=> b!554013 m!530799))

(declare-fun m!530801 () Bool)

(assert (=> b!554019 m!530801))

(assert (=> b!554011 m!530771))

(assert (=> b!554011 m!530771))

(declare-fun m!530803 () Bool)

(assert (=> b!554011 m!530803))

(declare-fun m!530805 () Bool)

(assert (=> b!554016 m!530805))

(declare-fun m!530807 () Bool)

(assert (=> b!554017 m!530807))

(check-sat (not b!554011) (not b!554019) (not b!554017) (not start!50678) (not b!554020) (not b!554016) (not b!554012) (not b!554013) (not b!554015) (not b!554018))
(check-sat)
