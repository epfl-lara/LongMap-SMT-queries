; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50682 () Bool)

(assert start!50682)

(declare-fun res!345972 () Bool)

(declare-fun e!319393 () Bool)

(assert (=> start!50682 (=> (not res!345972) (not e!319393))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50682 (= res!345972 (validMask!0 mask!3119))))

(assert (=> start!50682 e!319393))

(assert (=> start!50682 true))

(declare-datatypes ((array!34854 0))(
  ( (array!34855 (arr!16735 (Array (_ BitVec 32) (_ BitVec 64))) (size!17099 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34854)

(declare-fun array_inv!12594 (array!34854) Bool)

(assert (=> start!50682 (array_inv!12594 a!3118)))

(declare-fun b!553663 () Bool)

(declare-fun e!319395 () Bool)

(assert (=> b!553663 (= e!319395 (not true))))

(declare-fun e!319394 () Bool)

(assert (=> b!553663 e!319394))

(declare-fun res!345974 () Bool)

(assert (=> b!553663 (=> (not res!345974) (not e!319394))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34854 (_ BitVec 32)) Bool)

(assert (=> b!553663 (= res!345974 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17125 0))(
  ( (Unit!17126) )
))
(declare-fun lt!251601 () Unit!17125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17125)

(assert (=> b!553663 (= lt!251601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553664 () Bool)

(declare-fun res!345979 () Bool)

(assert (=> b!553664 (=> (not res!345979) (not e!319393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553664 (= res!345979 (validKeyInArray!0 (select (arr!16735 a!3118) j!142)))))

(declare-fun b!553665 () Bool)

(declare-fun res!345976 () Bool)

(assert (=> b!553665 (=> (not res!345976) (not e!319393))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553665 (= res!345976 (and (= (size!17099 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17099 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17099 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553666 () Bool)

(declare-datatypes ((SeekEntryResult!5140 0))(
  ( (MissingZero!5140 (index!22787 (_ BitVec 32))) (Found!5140 (index!22788 (_ BitVec 32))) (Intermediate!5140 (undefined!5952 Bool) (index!22789 (_ BitVec 32)) (x!51865 (_ BitVec 32))) (Undefined!5140) (MissingVacant!5140 (index!22790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34854 (_ BitVec 32)) SeekEntryResult!5140)

(assert (=> b!553666 (= e!319394 (= (seekEntryOrOpen!0 (select (arr!16735 a!3118) j!142) a!3118 mask!3119) (Found!5140 j!142)))))

(declare-fun b!553667 () Bool)

(declare-fun res!345973 () Bool)

(assert (=> b!553667 (=> (not res!345973) (not e!319393))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!553667 (= res!345973 (validKeyInArray!0 k0!1914))))

(declare-fun b!553668 () Bool)

(declare-fun res!345978 () Bool)

(assert (=> b!553668 (=> (not res!345978) (not e!319395))))

(assert (=> b!553668 (= res!345978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553669 () Bool)

(declare-fun res!345977 () Bool)

(assert (=> b!553669 (=> (not res!345977) (not e!319393))))

(declare-fun arrayContainsKey!0 (array!34854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553669 (= res!345977 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553670 () Bool)

(declare-fun res!345975 () Bool)

(assert (=> b!553670 (=> (not res!345975) (not e!319395))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34854 (_ BitVec 32)) SeekEntryResult!5140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553670 (= res!345975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16735 a!3118) j!142) mask!3119) (select (arr!16735 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16735 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16735 a!3118) i!1132 k0!1914) j!142) (array!34855 (store (arr!16735 a!3118) i!1132 k0!1914) (size!17099 a!3118)) mask!3119)))))

(declare-fun b!553671 () Bool)

(assert (=> b!553671 (= e!319393 e!319395)))

(declare-fun res!345970 () Bool)

(assert (=> b!553671 (=> (not res!345970) (not e!319395))))

(declare-fun lt!251602 () SeekEntryResult!5140)

(assert (=> b!553671 (= res!345970 (or (= lt!251602 (MissingZero!5140 i!1132)) (= lt!251602 (MissingVacant!5140 i!1132))))))

(assert (=> b!553671 (= lt!251602 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553672 () Bool)

(declare-fun res!345971 () Bool)

(assert (=> b!553672 (=> (not res!345971) (not e!319395))))

(declare-datatypes ((List!10722 0))(
  ( (Nil!10719) (Cons!10718 (h!11706 (_ BitVec 64)) (t!16942 List!10722)) )
))
(declare-fun arrayNoDuplicates!0 (array!34854 (_ BitVec 32) List!10722) Bool)

(assert (=> b!553672 (= res!345971 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10719))))

(assert (= (and start!50682 res!345972) b!553665))

(assert (= (and b!553665 res!345976) b!553664))

(assert (= (and b!553664 res!345979) b!553667))

(assert (= (and b!553667 res!345973) b!553669))

(assert (= (and b!553669 res!345977) b!553671))

(assert (= (and b!553671 res!345970) b!553668))

(assert (= (and b!553668 res!345978) b!553672))

(assert (= (and b!553672 res!345971) b!553670))

(assert (= (and b!553670 res!345975) b!553663))

(assert (= (and b!553663 res!345974) b!553666))

(declare-fun m!530885 () Bool)

(assert (=> b!553666 m!530885))

(assert (=> b!553666 m!530885))

(declare-fun m!530887 () Bool)

(assert (=> b!553666 m!530887))

(assert (=> b!553670 m!530885))

(declare-fun m!530889 () Bool)

(assert (=> b!553670 m!530889))

(assert (=> b!553670 m!530885))

(declare-fun m!530891 () Bool)

(assert (=> b!553670 m!530891))

(declare-fun m!530893 () Bool)

(assert (=> b!553670 m!530893))

(assert (=> b!553670 m!530891))

(declare-fun m!530895 () Bool)

(assert (=> b!553670 m!530895))

(assert (=> b!553670 m!530889))

(assert (=> b!553670 m!530885))

(declare-fun m!530897 () Bool)

(assert (=> b!553670 m!530897))

(declare-fun m!530899 () Bool)

(assert (=> b!553670 m!530899))

(assert (=> b!553670 m!530891))

(assert (=> b!553670 m!530893))

(assert (=> b!553664 m!530885))

(assert (=> b!553664 m!530885))

(declare-fun m!530901 () Bool)

(assert (=> b!553664 m!530901))

(declare-fun m!530903 () Bool)

(assert (=> b!553663 m!530903))

(declare-fun m!530905 () Bool)

(assert (=> b!553663 m!530905))

(declare-fun m!530907 () Bool)

(assert (=> start!50682 m!530907))

(declare-fun m!530909 () Bool)

(assert (=> start!50682 m!530909))

(declare-fun m!530911 () Bool)

(assert (=> b!553672 m!530911))

(declare-fun m!530913 () Bool)

(assert (=> b!553667 m!530913))

(declare-fun m!530915 () Bool)

(assert (=> b!553669 m!530915))

(declare-fun m!530917 () Bool)

(assert (=> b!553668 m!530917))

(declare-fun m!530919 () Bool)

(assert (=> b!553671 m!530919))

(check-sat (not b!553669) (not b!553670) (not b!553663) (not b!553668) (not b!553671) (not b!553664) (not start!50682) (not b!553672) (not b!553667) (not b!553666))
(check-sat)
