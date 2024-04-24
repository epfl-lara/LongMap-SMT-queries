; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50730 () Bool)

(assert start!50730)

(declare-fun b!554392 () Bool)

(declare-fun res!346705 () Bool)

(declare-fun e!319718 () Bool)

(assert (=> b!554392 (=> (not res!346705) (not e!319718))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554392 (= res!346705 (validKeyInArray!0 k0!1914))))

(declare-fun b!554393 () Bool)

(declare-fun res!346704 () Bool)

(declare-fun e!319716 () Bool)

(assert (=> b!554393 (=> (not res!346704) (not e!319716))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34902 0))(
  ( (array!34903 (arr!16759 (Array (_ BitVec 32) (_ BitVec 64))) (size!17123 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34902)

(declare-datatypes ((SeekEntryResult!5164 0))(
  ( (MissingZero!5164 (index!22883 (_ BitVec 32))) (Found!5164 (index!22884 (_ BitVec 32))) (Intermediate!5164 (undefined!5976 Bool) (index!22885 (_ BitVec 32)) (x!51953 (_ BitVec 32))) (Undefined!5164) (MissingVacant!5164 (index!22886 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34902 (_ BitVec 32)) SeekEntryResult!5164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554393 (= res!346704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16759 a!3118) j!142) mask!3119) (select (arr!16759 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16759 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16759 a!3118) i!1132 k0!1914) j!142) (array!34903 (store (arr!16759 a!3118) i!1132 k0!1914) (size!17123 a!3118)) mask!3119)))))

(declare-fun b!554394 () Bool)

(declare-fun res!346708 () Bool)

(assert (=> b!554394 (=> (not res!346708) (not e!319718))))

(assert (=> b!554394 (= res!346708 (validKeyInArray!0 (select (arr!16759 a!3118) j!142)))))

(declare-fun e!319717 () Bool)

(declare-fun b!554395 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34902 (_ BitVec 32)) SeekEntryResult!5164)

(assert (=> b!554395 (= e!319717 (= (seekEntryOrOpen!0 (select (arr!16759 a!3118) j!142) a!3118 mask!3119) (Found!5164 j!142)))))

(declare-fun b!554396 () Bool)

(declare-fun res!346706 () Bool)

(assert (=> b!554396 (=> (not res!346706) (not e!319716))))

(declare-datatypes ((List!10746 0))(
  ( (Nil!10743) (Cons!10742 (h!11730 (_ BitVec 64)) (t!16966 List!10746)) )
))
(declare-fun arrayNoDuplicates!0 (array!34902 (_ BitVec 32) List!10746) Bool)

(assert (=> b!554396 (= res!346706 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10743))))

(declare-fun b!554397 () Bool)

(declare-fun res!346700 () Bool)

(assert (=> b!554397 (=> (not res!346700) (not e!319718))))

(assert (=> b!554397 (= res!346700 (and (= (size!17123 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17123 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17123 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554398 () Bool)

(declare-fun res!346699 () Bool)

(assert (=> b!554398 (=> (not res!346699) (not e!319716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34902 (_ BitVec 32)) Bool)

(assert (=> b!554398 (= res!346699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554399 () Bool)

(assert (=> b!554399 (= e!319718 e!319716)))

(declare-fun res!346702 () Bool)

(assert (=> b!554399 (=> (not res!346702) (not e!319716))))

(declare-fun lt!251826 () SeekEntryResult!5164)

(assert (=> b!554399 (= res!346702 (or (= lt!251826 (MissingZero!5164 i!1132)) (= lt!251826 (MissingVacant!5164 i!1132))))))

(assert (=> b!554399 (= lt!251826 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!346703 () Bool)

(assert (=> start!50730 (=> (not res!346703) (not e!319718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50730 (= res!346703 (validMask!0 mask!3119))))

(assert (=> start!50730 e!319718))

(assert (=> start!50730 true))

(declare-fun array_inv!12618 (array!34902) Bool)

(assert (=> start!50730 (array_inv!12618 a!3118)))

(declare-fun b!554400 () Bool)

(assert (=> b!554400 (= e!319716 (not true))))

(assert (=> b!554400 e!319717))

(declare-fun res!346707 () Bool)

(assert (=> b!554400 (=> (not res!346707) (not e!319717))))

(assert (=> b!554400 (= res!346707 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17173 0))(
  ( (Unit!17174) )
))
(declare-fun lt!251827 () Unit!17173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17173)

(assert (=> b!554400 (= lt!251827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554401 () Bool)

(declare-fun res!346701 () Bool)

(assert (=> b!554401 (=> (not res!346701) (not e!319718))))

(declare-fun arrayContainsKey!0 (array!34902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554401 (= res!346701 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50730 res!346703) b!554397))

(assert (= (and b!554397 res!346700) b!554394))

(assert (= (and b!554394 res!346708) b!554392))

(assert (= (and b!554392 res!346705) b!554401))

(assert (= (and b!554401 res!346701) b!554399))

(assert (= (and b!554399 res!346702) b!554398))

(assert (= (and b!554398 res!346699) b!554396))

(assert (= (and b!554396 res!346706) b!554393))

(assert (= (and b!554393 res!346704) b!554400))

(assert (= (and b!554400 res!346707) b!554395))

(declare-fun m!531773 () Bool)

(assert (=> b!554399 m!531773))

(declare-fun m!531775 () Bool)

(assert (=> b!554394 m!531775))

(assert (=> b!554394 m!531775))

(declare-fun m!531777 () Bool)

(assert (=> b!554394 m!531777))

(declare-fun m!531779 () Bool)

(assert (=> b!554400 m!531779))

(declare-fun m!531781 () Bool)

(assert (=> b!554400 m!531781))

(declare-fun m!531783 () Bool)

(assert (=> b!554401 m!531783))

(declare-fun m!531785 () Bool)

(assert (=> b!554392 m!531785))

(declare-fun m!531787 () Bool)

(assert (=> b!554396 m!531787))

(declare-fun m!531789 () Bool)

(assert (=> b!554398 m!531789))

(declare-fun m!531791 () Bool)

(assert (=> start!50730 m!531791))

(declare-fun m!531793 () Bool)

(assert (=> start!50730 m!531793))

(assert (=> b!554395 m!531775))

(assert (=> b!554395 m!531775))

(declare-fun m!531795 () Bool)

(assert (=> b!554395 m!531795))

(assert (=> b!554393 m!531775))

(declare-fun m!531797 () Bool)

(assert (=> b!554393 m!531797))

(assert (=> b!554393 m!531775))

(declare-fun m!531799 () Bool)

(assert (=> b!554393 m!531799))

(declare-fun m!531801 () Bool)

(assert (=> b!554393 m!531801))

(assert (=> b!554393 m!531799))

(declare-fun m!531803 () Bool)

(assert (=> b!554393 m!531803))

(assert (=> b!554393 m!531797))

(assert (=> b!554393 m!531775))

(declare-fun m!531805 () Bool)

(assert (=> b!554393 m!531805))

(declare-fun m!531807 () Bool)

(assert (=> b!554393 m!531807))

(assert (=> b!554393 m!531799))

(assert (=> b!554393 m!531801))

(check-sat (not b!554392) (not b!554396) (not b!554400) (not b!554394) (not b!554401) (not b!554395) (not b!554399) (not start!50730) (not b!554398) (not b!554393))
(check-sat)
