; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50242 () Bool)

(assert start!50242)

(declare-fun b!549984 () Bool)

(declare-fun e!317537 () Bool)

(declare-fun e!317536 () Bool)

(assert (=> b!549984 (= e!317537 e!317536)))

(declare-fun res!343136 () Bool)

(assert (=> b!549984 (=> (not res!343136) (not e!317536))))

(declare-datatypes ((SeekEntryResult!5112 0))(
  ( (MissingZero!5112 (index!22675 (_ BitVec 32))) (Found!5112 (index!22676 (_ BitVec 32))) (Intermediate!5112 (undefined!5924 Bool) (index!22677 (_ BitVec 32)) (x!51602 (_ BitVec 32))) (Undefined!5112) (MissingVacant!5112 (index!22678 (_ BitVec 32))) )
))
(declare-fun lt!250386 () SeekEntryResult!5112)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549984 (= res!343136 (or (= lt!250386 (MissingZero!5112 i!1132)) (= lt!250386 (MissingVacant!5112 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34695 0))(
  ( (array!34696 (arr!16663 (Array (_ BitVec 32) (_ BitVec 64))) (size!17027 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34695)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34695 (_ BitVec 32)) SeekEntryResult!5112)

(assert (=> b!549984 (= lt!250386 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549985 () Bool)

(declare-fun res!343129 () Bool)

(assert (=> b!549985 (=> (not res!343129) (not e!317537))))

(declare-fun arrayContainsKey!0 (array!34695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549985 (= res!343129 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549986 () Bool)

(declare-fun res!343135 () Bool)

(assert (=> b!549986 (=> (not res!343135) (not e!317537))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549986 (= res!343135 (validKeyInArray!0 (select (arr!16663 a!3118) j!142)))))

(declare-fun b!549988 () Bool)

(declare-fun res!343134 () Bool)

(assert (=> b!549988 (=> (not res!343134) (not e!317536))))

(declare-datatypes ((List!10743 0))(
  ( (Nil!10740) (Cons!10739 (h!11712 (_ BitVec 64)) (t!16971 List!10743)) )
))
(declare-fun arrayNoDuplicates!0 (array!34695 (_ BitVec 32) List!10743) Bool)

(assert (=> b!549988 (= res!343134 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10740))))

(declare-fun b!549989 () Bool)

(declare-fun res!343128 () Bool)

(assert (=> b!549989 (=> (not res!343128) (not e!317536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34695 (_ BitVec 32)) Bool)

(assert (=> b!549989 (= res!343128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549990 () Bool)

(declare-fun res!343130 () Bool)

(assert (=> b!549990 (=> (not res!343130) (not e!317537))))

(assert (=> b!549990 (= res!343130 (validKeyInArray!0 k0!1914))))

(declare-fun res!343132 () Bool)

(assert (=> start!50242 (=> (not res!343132) (not e!317537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50242 (= res!343132 (validMask!0 mask!3119))))

(assert (=> start!50242 e!317537))

(assert (=> start!50242 true))

(declare-fun array_inv!12459 (array!34695) Bool)

(assert (=> start!50242 (array_inv!12459 a!3118)))

(declare-fun b!549987 () Bool)

(declare-fun res!343131 () Bool)

(assert (=> b!549987 (=> (not res!343131) (not e!317536))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34695 (_ BitVec 32)) SeekEntryResult!5112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549987 (= res!343131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16663 a!3118) j!142) mask!3119) (select (arr!16663 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16663 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16663 a!3118) i!1132 k0!1914) j!142) (array!34696 (store (arr!16663 a!3118) i!1132 k0!1914) (size!17027 a!3118)) mask!3119)))))

(declare-fun b!549991 () Bool)

(assert (=> b!549991 (= e!317536 (not true))))

(assert (=> b!549991 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16998 0))(
  ( (Unit!16999) )
))
(declare-fun lt!250387 () Unit!16998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16998)

(assert (=> b!549991 (= lt!250387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549992 () Bool)

(declare-fun res!343133 () Bool)

(assert (=> b!549992 (=> (not res!343133) (not e!317537))))

(assert (=> b!549992 (= res!343133 (and (= (size!17027 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17027 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17027 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50242 res!343132) b!549992))

(assert (= (and b!549992 res!343133) b!549986))

(assert (= (and b!549986 res!343135) b!549990))

(assert (= (and b!549990 res!343130) b!549985))

(assert (= (and b!549985 res!343129) b!549984))

(assert (= (and b!549984 res!343136) b!549989))

(assert (= (and b!549989 res!343128) b!549988))

(assert (= (and b!549988 res!343134) b!549987))

(assert (= (and b!549987 res!343131) b!549991))

(declare-fun m!526969 () Bool)

(assert (=> b!549986 m!526969))

(assert (=> b!549986 m!526969))

(declare-fun m!526971 () Bool)

(assert (=> b!549986 m!526971))

(declare-fun m!526973 () Bool)

(assert (=> b!549991 m!526973))

(declare-fun m!526975 () Bool)

(assert (=> b!549991 m!526975))

(declare-fun m!526977 () Bool)

(assert (=> b!549985 m!526977))

(declare-fun m!526979 () Bool)

(assert (=> start!50242 m!526979))

(declare-fun m!526981 () Bool)

(assert (=> start!50242 m!526981))

(declare-fun m!526983 () Bool)

(assert (=> b!549989 m!526983))

(declare-fun m!526985 () Bool)

(assert (=> b!549984 m!526985))

(assert (=> b!549987 m!526969))

(declare-fun m!526987 () Bool)

(assert (=> b!549987 m!526987))

(assert (=> b!549987 m!526969))

(declare-fun m!526989 () Bool)

(assert (=> b!549987 m!526989))

(declare-fun m!526991 () Bool)

(assert (=> b!549987 m!526991))

(assert (=> b!549987 m!526989))

(declare-fun m!526993 () Bool)

(assert (=> b!549987 m!526993))

(assert (=> b!549987 m!526987))

(assert (=> b!549987 m!526969))

(declare-fun m!526995 () Bool)

(assert (=> b!549987 m!526995))

(declare-fun m!526997 () Bool)

(assert (=> b!549987 m!526997))

(assert (=> b!549987 m!526989))

(assert (=> b!549987 m!526991))

(declare-fun m!526999 () Bool)

(assert (=> b!549988 m!526999))

(declare-fun m!527001 () Bool)

(assert (=> b!549990 m!527001))

(check-sat (not b!549991) (not b!549989) (not b!549987) (not b!549984) (not b!549985) (not b!549988) (not b!549990) (not b!549986) (not start!50242))
(check-sat)
