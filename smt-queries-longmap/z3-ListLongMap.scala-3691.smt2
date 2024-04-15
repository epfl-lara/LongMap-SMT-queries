; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50750 () Bool)

(assert start!50750)

(declare-fun b!555008 () Bool)

(declare-fun res!347570 () Bool)

(declare-fun e!319893 () Bool)

(assert (=> b!555008 (=> (not res!347570) (not e!319893))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34984 0))(
  ( (array!34985 (arr!16802 (Array (_ BitVec 32) (_ BitVec 64))) (size!17167 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34984)

(assert (=> b!555008 (= res!347570 (and (= (size!17167 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17167 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17167 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555009 () Bool)

(declare-fun e!319892 () Bool)

(assert (=> b!555009 (= e!319893 e!319892)))

(declare-fun res!347562 () Bool)

(assert (=> b!555009 (=> (not res!347562) (not e!319892))))

(declare-datatypes ((SeekEntryResult!5248 0))(
  ( (MissingZero!5248 (index!23219 (_ BitVec 32))) (Found!5248 (index!23220 (_ BitVec 32))) (Intermediate!5248 (undefined!6060 Bool) (index!23221 (_ BitVec 32)) (x!52133 (_ BitVec 32))) (Undefined!5248) (MissingVacant!5248 (index!23222 (_ BitVec 32))) )
))
(declare-fun lt!252074 () SeekEntryResult!5248)

(assert (=> b!555009 (= res!347562 (or (= lt!252074 (MissingZero!5248 i!1132)) (= lt!252074 (MissingVacant!5248 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34984 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!555009 (= lt!252074 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555010 () Bool)

(declare-fun e!319890 () Bool)

(assert (=> b!555010 (= e!319892 e!319890)))

(declare-fun res!347565 () Bool)

(assert (=> b!555010 (=> (not res!347565) (not e!319890))))

(declare-fun lt!252075 () SeekEntryResult!5248)

(declare-fun lt!252079 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34984 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!555010 (= res!347565 (= lt!252075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252079 (select (store (arr!16802 a!3118) i!1132 k0!1914) j!142) (array!34985 (store (arr!16802 a!3118) i!1132 k0!1914) (size!17167 a!3118)) mask!3119)))))

(declare-fun lt!252077 () (_ BitVec 32))

(assert (=> b!555010 (= lt!252075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252077 (select (arr!16802 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555010 (= lt!252079 (toIndex!0 (select (store (arr!16802 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555010 (= lt!252077 (toIndex!0 (select (arr!16802 a!3118) j!142) mask!3119))))

(declare-fun b!555011 () Bool)

(declare-fun res!347563 () Bool)

(assert (=> b!555011 (=> (not res!347563) (not e!319892))))

(declare-datatypes ((List!10921 0))(
  ( (Nil!10918) (Cons!10917 (h!11902 (_ BitVec 64)) (t!17140 List!10921)) )
))
(declare-fun arrayNoDuplicates!0 (array!34984 (_ BitVec 32) List!10921) Bool)

(assert (=> b!555011 (= res!347563 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10918))))

(declare-fun b!555012 () Bool)

(assert (=> b!555012 (= e!319890 (not true))))

(declare-fun lt!252078 () SeekEntryResult!5248)

(get-info :version)

(assert (=> b!555012 (and (= lt!252078 (Found!5248 j!142)) (or (undefined!6060 lt!252075) (not ((_ is Intermediate!5248) lt!252075)) (= (select (arr!16802 a!3118) (index!23221 lt!252075)) (select (arr!16802 a!3118) j!142)) (not (= (select (arr!16802 a!3118) (index!23221 lt!252075)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252078 (MissingZero!5248 (index!23221 lt!252075)))))))

(assert (=> b!555012 (= lt!252078 (seekEntryOrOpen!0 (select (arr!16802 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34984 (_ BitVec 32)) Bool)

(assert (=> b!555012 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17256 0))(
  ( (Unit!17257) )
))
(declare-fun lt!252076 () Unit!17256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17256)

(assert (=> b!555012 (= lt!252076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555013 () Bool)

(declare-fun res!347567 () Bool)

(assert (=> b!555013 (=> (not res!347567) (not e!319892))))

(assert (=> b!555013 (= res!347567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347568 () Bool)

(assert (=> start!50750 (=> (not res!347568) (not e!319893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50750 (= res!347568 (validMask!0 mask!3119))))

(assert (=> start!50750 e!319893))

(assert (=> start!50750 true))

(declare-fun array_inv!12685 (array!34984) Bool)

(assert (=> start!50750 (array_inv!12685 a!3118)))

(declare-fun b!555014 () Bool)

(declare-fun res!347566 () Bool)

(assert (=> b!555014 (=> (not res!347566) (not e!319893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555014 (= res!347566 (validKeyInArray!0 (select (arr!16802 a!3118) j!142)))))

(declare-fun b!555015 () Bool)

(declare-fun res!347564 () Bool)

(assert (=> b!555015 (=> (not res!347564) (not e!319893))))

(assert (=> b!555015 (= res!347564 (validKeyInArray!0 k0!1914))))

(declare-fun b!555016 () Bool)

(declare-fun res!347569 () Bool)

(assert (=> b!555016 (=> (not res!347569) (not e!319893))))

(declare-fun arrayContainsKey!0 (array!34984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555016 (= res!347569 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50750 res!347568) b!555008))

(assert (= (and b!555008 res!347570) b!555014))

(assert (= (and b!555014 res!347566) b!555015))

(assert (= (and b!555015 res!347564) b!555016))

(assert (= (and b!555016 res!347569) b!555009))

(assert (= (and b!555009 res!347562) b!555013))

(assert (= (and b!555013 res!347567) b!555011))

(assert (= (and b!555011 res!347563) b!555010))

(assert (= (and b!555010 res!347565) b!555012))

(declare-fun m!532127 () Bool)

(assert (=> b!555015 m!532127))

(declare-fun m!532129 () Bool)

(assert (=> b!555012 m!532129))

(declare-fun m!532131 () Bool)

(assert (=> b!555012 m!532131))

(declare-fun m!532133 () Bool)

(assert (=> b!555012 m!532133))

(declare-fun m!532135 () Bool)

(assert (=> b!555012 m!532135))

(assert (=> b!555012 m!532131))

(declare-fun m!532137 () Bool)

(assert (=> b!555012 m!532137))

(declare-fun m!532139 () Bool)

(assert (=> b!555009 m!532139))

(assert (=> b!555010 m!532131))

(declare-fun m!532141 () Bool)

(assert (=> b!555010 m!532141))

(assert (=> b!555010 m!532131))

(declare-fun m!532143 () Bool)

(assert (=> b!555010 m!532143))

(declare-fun m!532145 () Bool)

(assert (=> b!555010 m!532145))

(assert (=> b!555010 m!532143))

(declare-fun m!532147 () Bool)

(assert (=> b!555010 m!532147))

(assert (=> b!555010 m!532143))

(declare-fun m!532149 () Bool)

(assert (=> b!555010 m!532149))

(assert (=> b!555010 m!532131))

(declare-fun m!532151 () Bool)

(assert (=> b!555010 m!532151))

(declare-fun m!532153 () Bool)

(assert (=> b!555016 m!532153))

(declare-fun m!532155 () Bool)

(assert (=> b!555013 m!532155))

(declare-fun m!532157 () Bool)

(assert (=> b!555011 m!532157))

(declare-fun m!532159 () Bool)

(assert (=> start!50750 m!532159))

(declare-fun m!532161 () Bool)

(assert (=> start!50750 m!532161))

(assert (=> b!555014 m!532131))

(assert (=> b!555014 m!532131))

(declare-fun m!532163 () Bool)

(assert (=> b!555014 m!532163))

(check-sat (not b!555013) (not b!555011) (not b!555012) (not b!555015) (not b!555016) (not b!555014) (not b!555010) (not start!50750) (not b!555009))
(check-sat)
