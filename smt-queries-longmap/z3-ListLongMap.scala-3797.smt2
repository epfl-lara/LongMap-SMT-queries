; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52124 () Bool)

(assert start!52124)

(declare-fun b!568724 () Bool)

(declare-fun e!327208 () Bool)

(declare-fun e!327210 () Bool)

(assert (=> b!568724 (= e!327208 e!327210)))

(declare-fun res!358891 () Bool)

(assert (=> b!568724 (=> (not res!358891) (not e!327210))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259015 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5566 0))(
  ( (MissingZero!5566 (index!24491 (_ BitVec 32))) (Found!5566 (index!24492 (_ BitVec 32))) (Intermediate!5566 (undefined!6378 Bool) (index!24493 (_ BitVec 32)) (x!53380 (_ BitVec 32))) (Undefined!5566) (MissingVacant!5566 (index!24494 (_ BitVec 32))) )
))
(declare-fun lt!259017 () SeekEntryResult!5566)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35656 0))(
  ( (array!35657 (arr!17120 (Array (_ BitVec 32) (_ BitVec 64))) (size!17485 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35656)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35656 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!568724 (= res!358891 (= lt!259017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259015 (select (store (arr!17120 a!3118) i!1132 k0!1914) j!142) (array!35657 (store (arr!17120 a!3118) i!1132 k0!1914) (size!17485 a!3118)) mask!3119)))))

(declare-fun lt!259016 () (_ BitVec 32))

(assert (=> b!568724 (= lt!259017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259016 (select (arr!17120 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568724 (= lt!259015 (toIndex!0 (select (store (arr!17120 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568724 (= lt!259016 (toIndex!0 (select (arr!17120 a!3118) j!142) mask!3119))))

(declare-fun b!568725 () Bool)

(declare-fun e!327207 () Bool)

(assert (=> b!568725 (= e!327207 e!327208)))

(declare-fun res!358890 () Bool)

(assert (=> b!568725 (=> (not res!358890) (not e!327208))))

(declare-fun lt!259014 () SeekEntryResult!5566)

(assert (=> b!568725 (= res!358890 (or (= lt!259014 (MissingZero!5566 i!1132)) (= lt!259014 (MissingVacant!5566 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35656 (_ BitVec 32)) SeekEntryResult!5566)

(assert (=> b!568725 (= lt!259014 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568726 () Bool)

(declare-fun res!358886 () Bool)

(assert (=> b!568726 (=> (not res!358886) (not e!327207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568726 (= res!358886 (validKeyInArray!0 (select (arr!17120 a!3118) j!142)))))

(declare-fun b!568727 () Bool)

(declare-fun res!358892 () Bool)

(assert (=> b!568727 (=> (not res!358892) (not e!327207))))

(assert (=> b!568727 (= res!358892 (and (= (size!17485 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17485 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17485 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568728 () Bool)

(declare-fun res!358887 () Bool)

(assert (=> b!568728 (=> (not res!358887) (not e!327208))))

(declare-datatypes ((List!11239 0))(
  ( (Nil!11236) (Cons!11235 (h!12256 (_ BitVec 64)) (t!17458 List!11239)) )
))
(declare-fun arrayNoDuplicates!0 (array!35656 (_ BitVec 32) List!11239) Bool)

(assert (=> b!568728 (= res!358887 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11236))))

(declare-fun b!568729 () Bool)

(declare-fun res!358889 () Bool)

(assert (=> b!568729 (=> (not res!358889) (not e!327207))))

(declare-fun arrayContainsKey!0 (array!35656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568729 (= res!358889 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!358884 () Bool)

(assert (=> start!52124 (=> (not res!358884) (not e!327207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52124 (= res!358884 (validMask!0 mask!3119))))

(assert (=> start!52124 e!327207))

(assert (=> start!52124 true))

(declare-fun array_inv!13003 (array!35656) Bool)

(assert (=> start!52124 (array_inv!13003 a!3118)))

(declare-fun b!568730 () Bool)

(assert (=> b!568730 (= e!327210 (not true))))

(declare-fun lt!259013 () SeekEntryResult!5566)

(get-info :version)

(assert (=> b!568730 (and (= lt!259013 (Found!5566 j!142)) (or (undefined!6378 lt!259017) (not ((_ is Intermediate!5566) lt!259017)) (= (select (arr!17120 a!3118) (index!24493 lt!259017)) (select (arr!17120 a!3118) j!142)) (not (= (select (arr!17120 a!3118) (index!24493 lt!259017)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259013 (MissingZero!5566 (index!24493 lt!259017)))))))

(assert (=> b!568730 (= lt!259013 (seekEntryOrOpen!0 (select (arr!17120 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35656 (_ BitVec 32)) Bool)

(assert (=> b!568730 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17820 0))(
  ( (Unit!17821) )
))
(declare-fun lt!259018 () Unit!17820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17820)

(assert (=> b!568730 (= lt!259018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568731 () Bool)

(declare-fun res!358885 () Bool)

(assert (=> b!568731 (=> (not res!358885) (not e!327208))))

(assert (=> b!568731 (= res!358885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568732 () Bool)

(declare-fun res!358888 () Bool)

(assert (=> b!568732 (=> (not res!358888) (not e!327207))))

(assert (=> b!568732 (= res!358888 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52124 res!358884) b!568727))

(assert (= (and b!568727 res!358892) b!568726))

(assert (= (and b!568726 res!358886) b!568732))

(assert (= (and b!568732 res!358888) b!568729))

(assert (= (and b!568729 res!358889) b!568725))

(assert (= (and b!568725 res!358890) b!568731))

(assert (= (and b!568731 res!358885) b!568728))

(assert (= (and b!568728 res!358887) b!568724))

(assert (= (and b!568724 res!358891) b!568730))

(declare-fun m!546773 () Bool)

(assert (=> b!568729 m!546773))

(declare-fun m!546775 () Bool)

(assert (=> b!568732 m!546775))

(declare-fun m!546777 () Bool)

(assert (=> b!568725 m!546777))

(declare-fun m!546779 () Bool)

(assert (=> b!568724 m!546779))

(declare-fun m!546781 () Bool)

(assert (=> b!568724 m!546781))

(declare-fun m!546783 () Bool)

(assert (=> b!568724 m!546783))

(declare-fun m!546785 () Bool)

(assert (=> b!568724 m!546785))

(assert (=> b!568724 m!546783))

(declare-fun m!546787 () Bool)

(assert (=> b!568724 m!546787))

(assert (=> b!568724 m!546783))

(assert (=> b!568724 m!546779))

(declare-fun m!546789 () Bool)

(assert (=> b!568724 m!546789))

(assert (=> b!568724 m!546779))

(declare-fun m!546791 () Bool)

(assert (=> b!568724 m!546791))

(declare-fun m!546793 () Bool)

(assert (=> b!568731 m!546793))

(assert (=> b!568726 m!546783))

(assert (=> b!568726 m!546783))

(declare-fun m!546795 () Bool)

(assert (=> b!568726 m!546795))

(assert (=> b!568730 m!546783))

(declare-fun m!546797 () Bool)

(assert (=> b!568730 m!546797))

(declare-fun m!546799 () Bool)

(assert (=> b!568730 m!546799))

(declare-fun m!546801 () Bool)

(assert (=> b!568730 m!546801))

(assert (=> b!568730 m!546783))

(declare-fun m!546803 () Bool)

(assert (=> b!568730 m!546803))

(declare-fun m!546805 () Bool)

(assert (=> b!568728 m!546805))

(declare-fun m!546807 () Bool)

(assert (=> start!52124 m!546807))

(declare-fun m!546809 () Bool)

(assert (=> start!52124 m!546809))

(check-sat (not b!568732) (not b!568729) (not start!52124) (not b!568726) (not b!568728) (not b!568725) (not b!568730) (not b!568724) (not b!568731))
(check-sat)
