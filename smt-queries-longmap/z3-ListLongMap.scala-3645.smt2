; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50234 () Bool)

(assert start!50234)

(declare-fun b!549767 () Bool)

(declare-fun res!343058 () Bool)

(declare-fun e!317381 () Bool)

(assert (=> b!549767 (=> (not res!343058) (not e!317381))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549767 (= res!343058 (validKeyInArray!0 k0!1914))))

(declare-fun b!549768 () Bool)

(declare-fun res!343053 () Bool)

(declare-fun e!317380 () Bool)

(assert (=> b!549768 (=> (not res!343053) (not e!317380))))

(declare-datatypes ((array!34696 0))(
  ( (array!34697 (arr!16664 (Array (_ BitVec 32) (_ BitVec 64))) (size!17029 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34696)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34696 (_ BitVec 32)) Bool)

(assert (=> b!549768 (= res!343053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343061 () Bool)

(assert (=> start!50234 (=> (not res!343061) (not e!317381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50234 (= res!343061 (validMask!0 mask!3119))))

(assert (=> start!50234 e!317381))

(assert (=> start!50234 true))

(declare-fun array_inv!12547 (array!34696) Bool)

(assert (=> start!50234 (array_inv!12547 a!3118)))

(declare-fun b!549769 () Bool)

(declare-fun res!343054 () Bool)

(assert (=> b!549769 (=> (not res!343054) (not e!317380))))

(declare-datatypes ((List!10783 0))(
  ( (Nil!10780) (Cons!10779 (h!11752 (_ BitVec 64)) (t!17002 List!10783)) )
))
(declare-fun arrayNoDuplicates!0 (array!34696 (_ BitVec 32) List!10783) Bool)

(assert (=> b!549769 (= res!343054 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10780))))

(declare-fun b!549770 () Bool)

(declare-fun res!343060 () Bool)

(assert (=> b!549770 (=> (not res!343060) (not e!317380))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5110 0))(
  ( (MissingZero!5110 (index!22667 (_ BitVec 32))) (Found!5110 (index!22668 (_ BitVec 32))) (Intermediate!5110 (undefined!5922 Bool) (index!22669 (_ BitVec 32)) (x!51603 (_ BitVec 32))) (Undefined!5110) (MissingVacant!5110 (index!22670 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34696 (_ BitVec 32)) SeekEntryResult!5110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549770 (= res!343060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16664 a!3118) j!142) mask!3119) (select (arr!16664 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16664 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16664 a!3118) i!1132 k0!1914) j!142) (array!34697 (store (arr!16664 a!3118) i!1132 k0!1914) (size!17029 a!3118)) mask!3119)))))

(declare-fun b!549771 () Bool)

(assert (=> b!549771 (= e!317380 (not true))))

(assert (=> b!549771 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16980 0))(
  ( (Unit!16981) )
))
(declare-fun lt!250165 () Unit!16980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16980)

(assert (=> b!549771 (= lt!250165 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549772 () Bool)

(declare-fun res!343059 () Bool)

(assert (=> b!549772 (=> (not res!343059) (not e!317381))))

(assert (=> b!549772 (= res!343059 (validKeyInArray!0 (select (arr!16664 a!3118) j!142)))))

(declare-fun b!549773 () Bool)

(assert (=> b!549773 (= e!317381 e!317380)))

(declare-fun res!343056 () Bool)

(assert (=> b!549773 (=> (not res!343056) (not e!317380))))

(declare-fun lt!250164 () SeekEntryResult!5110)

(assert (=> b!549773 (= res!343056 (or (= lt!250164 (MissingZero!5110 i!1132)) (= lt!250164 (MissingVacant!5110 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34696 (_ BitVec 32)) SeekEntryResult!5110)

(assert (=> b!549773 (= lt!250164 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549774 () Bool)

(declare-fun res!343055 () Bool)

(assert (=> b!549774 (=> (not res!343055) (not e!317381))))

(declare-fun arrayContainsKey!0 (array!34696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549774 (= res!343055 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549775 () Bool)

(declare-fun res!343057 () Bool)

(assert (=> b!549775 (=> (not res!343057) (not e!317381))))

(assert (=> b!549775 (= res!343057 (and (= (size!17029 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17029 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17029 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50234 res!343061) b!549775))

(assert (= (and b!549775 res!343057) b!549772))

(assert (= (and b!549772 res!343059) b!549767))

(assert (= (and b!549767 res!343058) b!549774))

(assert (= (and b!549774 res!343055) b!549773))

(assert (= (and b!549773 res!343056) b!549768))

(assert (= (and b!549768 res!343053) b!549769))

(assert (= (and b!549769 res!343054) b!549770))

(assert (= (and b!549770 res!343060) b!549771))

(declare-fun m!526265 () Bool)

(assert (=> b!549774 m!526265))

(declare-fun m!526267 () Bool)

(assert (=> b!549769 m!526267))

(declare-fun m!526269 () Bool)

(assert (=> b!549767 m!526269))

(declare-fun m!526271 () Bool)

(assert (=> b!549772 m!526271))

(assert (=> b!549772 m!526271))

(declare-fun m!526273 () Bool)

(assert (=> b!549772 m!526273))

(declare-fun m!526275 () Bool)

(assert (=> b!549771 m!526275))

(declare-fun m!526277 () Bool)

(assert (=> b!549771 m!526277))

(declare-fun m!526279 () Bool)

(assert (=> start!50234 m!526279))

(declare-fun m!526281 () Bool)

(assert (=> start!50234 m!526281))

(assert (=> b!549770 m!526271))

(declare-fun m!526283 () Bool)

(assert (=> b!549770 m!526283))

(assert (=> b!549770 m!526271))

(declare-fun m!526285 () Bool)

(assert (=> b!549770 m!526285))

(declare-fun m!526287 () Bool)

(assert (=> b!549770 m!526287))

(assert (=> b!549770 m!526285))

(declare-fun m!526289 () Bool)

(assert (=> b!549770 m!526289))

(assert (=> b!549770 m!526283))

(assert (=> b!549770 m!526271))

(declare-fun m!526291 () Bool)

(assert (=> b!549770 m!526291))

(declare-fun m!526293 () Bool)

(assert (=> b!549770 m!526293))

(assert (=> b!549770 m!526285))

(assert (=> b!549770 m!526287))

(declare-fun m!526295 () Bool)

(assert (=> b!549768 m!526295))

(declare-fun m!526297 () Bool)

(assert (=> b!549773 m!526297))

(check-sat (not b!549770) (not b!549769) (not b!549773) (not start!50234) (not b!549774) (not b!549767) (not b!549772) (not b!549768) (not b!549771))
(check-sat)
