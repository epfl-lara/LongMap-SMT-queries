; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50676 () Bool)

(assert start!50676)

(declare-fun b!553566 () Bool)

(declare-fun res!345879 () Bool)

(declare-fun e!319345 () Bool)

(assert (=> b!553566 (=> (not res!345879) (not e!319345))))

(declare-datatypes ((array!34848 0))(
  ( (array!34849 (arr!16732 (Array (_ BitVec 32) (_ BitVec 64))) (size!17096 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34848)

(declare-datatypes ((List!10719 0))(
  ( (Nil!10716) (Cons!10715 (h!11703 (_ BitVec 64)) (t!16939 List!10719)) )
))
(declare-fun arrayNoDuplicates!0 (array!34848 (_ BitVec 32) List!10719) Bool)

(assert (=> b!553566 (= res!345879 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10716))))

(declare-fun b!553567 () Bool)

(declare-fun res!345878 () Bool)

(declare-fun e!319346 () Bool)

(assert (=> b!553567 (=> (not res!345878) (not e!319346))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553567 (= res!345878 (validKeyInArray!0 (select (arr!16732 a!3118) j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319343 () Bool)

(declare-fun b!553568 () Bool)

(declare-datatypes ((SeekEntryResult!5137 0))(
  ( (MissingZero!5137 (index!22775 (_ BitVec 32))) (Found!5137 (index!22776 (_ BitVec 32))) (Intermediate!5137 (undefined!5949 Bool) (index!22777 (_ BitVec 32)) (x!51854 (_ BitVec 32))) (Undefined!5137) (MissingVacant!5137 (index!22778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34848 (_ BitVec 32)) SeekEntryResult!5137)

(assert (=> b!553568 (= e!319343 (= (seekEntryOrOpen!0 (select (arr!16732 a!3118) j!142) a!3118 mask!3119) (Found!5137 j!142)))))

(declare-fun res!345883 () Bool)

(assert (=> start!50676 (=> (not res!345883) (not e!319346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50676 (= res!345883 (validMask!0 mask!3119))))

(assert (=> start!50676 e!319346))

(assert (=> start!50676 true))

(declare-fun array_inv!12591 (array!34848) Bool)

(assert (=> start!50676 (array_inv!12591 a!3118)))

(declare-fun b!553569 () Bool)

(declare-fun res!345877 () Bool)

(assert (=> b!553569 (=> (not res!345877) (not e!319345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34848 (_ BitVec 32)) Bool)

(assert (=> b!553569 (= res!345877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553570 () Bool)

(declare-fun res!345880 () Bool)

(assert (=> b!553570 (=> (not res!345880) (not e!319346))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!553570 (= res!345880 (validKeyInArray!0 k0!1914))))

(declare-fun b!553571 () Bool)

(declare-fun e!319344 () Bool)

(declare-fun e!319347 () Bool)

(assert (=> b!553571 (= e!319344 (not e!319347))))

(declare-fun res!345876 () Bool)

(assert (=> b!553571 (=> res!345876 e!319347)))

(declare-fun lt!251562 () SeekEntryResult!5137)

(get-info :version)

(assert (=> b!553571 (= res!345876 (or (not ((_ is Intermediate!5137) lt!251562)) (not (undefined!5949 lt!251562)) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!553571 e!319343))

(declare-fun res!345881 () Bool)

(assert (=> b!553571 (=> (not res!345881) (not e!319343))))

(assert (=> b!553571 (= res!345881 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17119 0))(
  ( (Unit!17120) )
))
(declare-fun lt!251566 () Unit!17119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17119)

(assert (=> b!553571 (= lt!251566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553572 () Bool)

(assert (=> b!553572 (= e!319346 e!319345)))

(declare-fun res!345882 () Bool)

(assert (=> b!553572 (=> (not res!345882) (not e!319345))))

(declare-fun lt!251565 () SeekEntryResult!5137)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553572 (= res!345882 (or (= lt!251565 (MissingZero!5137 i!1132)) (= lt!251565 (MissingVacant!5137 i!1132))))))

(assert (=> b!553572 (= lt!251565 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553573 () Bool)

(assert (=> b!553573 (= e!319345 e!319344)))

(declare-fun res!345875 () Bool)

(assert (=> b!553573 (=> (not res!345875) (not e!319344))))

(declare-fun lt!251564 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34848 (_ BitVec 32)) SeekEntryResult!5137)

(assert (=> b!553573 (= res!345875 (= lt!251562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251564 (select (store (arr!16732 a!3118) i!1132 k0!1914) j!142) (array!34849 (store (arr!16732 a!3118) i!1132 k0!1914) (size!17096 a!3118)) mask!3119)))))

(declare-fun lt!251563 () (_ BitVec 32))

(assert (=> b!553573 (= lt!251562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251563 (select (arr!16732 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553573 (= lt!251564 (toIndex!0 (select (store (arr!16732 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553573 (= lt!251563 (toIndex!0 (select (arr!16732 a!3118) j!142) mask!3119))))

(declare-fun b!553574 () Bool)

(declare-fun res!345874 () Bool)

(assert (=> b!553574 (=> (not res!345874) (not e!319346))))

(assert (=> b!553574 (= res!345874 (and (= (size!17096 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17096 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17096 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553575 () Bool)

(declare-fun res!345873 () Bool)

(assert (=> b!553575 (=> (not res!345873) (not e!319346))))

(declare-fun arrayContainsKey!0 (array!34848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553575 (= res!345873 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553576 () Bool)

(assert (=> b!553576 (= e!319347 (validKeyInArray!0 (select (store (arr!16732 a!3118) i!1132 k0!1914) j!142)))))

(assert (= (and start!50676 res!345883) b!553574))

(assert (= (and b!553574 res!345874) b!553567))

(assert (= (and b!553567 res!345878) b!553570))

(assert (= (and b!553570 res!345880) b!553575))

(assert (= (and b!553575 res!345873) b!553572))

(assert (= (and b!553572 res!345882) b!553569))

(assert (= (and b!553569 res!345877) b!553566))

(assert (= (and b!553566 res!345879) b!553573))

(assert (= (and b!553573 res!345875) b!553571))

(assert (= (and b!553571 res!345881) b!553568))

(assert (= (and b!553571 (not res!345876)) b!553576))

(declare-fun m!530771 () Bool)

(assert (=> b!553566 m!530771))

(declare-fun m!530773 () Bool)

(assert (=> b!553567 m!530773))

(assert (=> b!553567 m!530773))

(declare-fun m!530775 () Bool)

(assert (=> b!553567 m!530775))

(declare-fun m!530777 () Bool)

(assert (=> b!553571 m!530777))

(declare-fun m!530779 () Bool)

(assert (=> b!553571 m!530779))

(assert (=> b!553568 m!530773))

(assert (=> b!553568 m!530773))

(declare-fun m!530781 () Bool)

(assert (=> b!553568 m!530781))

(declare-fun m!530783 () Bool)

(assert (=> start!50676 m!530783))

(declare-fun m!530785 () Bool)

(assert (=> start!50676 m!530785))

(declare-fun m!530787 () Bool)

(assert (=> b!553570 m!530787))

(declare-fun m!530789 () Bool)

(assert (=> b!553576 m!530789))

(declare-fun m!530791 () Bool)

(assert (=> b!553576 m!530791))

(assert (=> b!553576 m!530791))

(declare-fun m!530793 () Bool)

(assert (=> b!553576 m!530793))

(declare-fun m!530795 () Bool)

(assert (=> b!553575 m!530795))

(declare-fun m!530797 () Bool)

(assert (=> b!553572 m!530797))

(assert (=> b!553573 m!530773))

(declare-fun m!530799 () Bool)

(assert (=> b!553573 m!530799))

(assert (=> b!553573 m!530773))

(assert (=> b!553573 m!530791))

(assert (=> b!553573 m!530789))

(assert (=> b!553573 m!530773))

(declare-fun m!530801 () Bool)

(assert (=> b!553573 m!530801))

(assert (=> b!553573 m!530791))

(declare-fun m!530803 () Bool)

(assert (=> b!553573 m!530803))

(assert (=> b!553573 m!530791))

(declare-fun m!530805 () Bool)

(assert (=> b!553573 m!530805))

(declare-fun m!530807 () Bool)

(assert (=> b!553569 m!530807))

(check-sat (not b!553573) (not b!553571) (not b!553568) (not b!553575) (not b!553566) (not b!553576) (not start!50676) (not b!553572) (not b!553569) (not b!553567) (not b!553570))
(check-sat)
