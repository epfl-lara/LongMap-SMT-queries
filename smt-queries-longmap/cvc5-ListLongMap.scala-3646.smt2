; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50252 () Bool)

(assert start!50252)

(declare-fun b!550121 () Bool)

(declare-fun res!343273 () Bool)

(declare-fun e!317584 () Bool)

(assert (=> b!550121 (=> (not res!343273) (not e!317584))))

(declare-datatypes ((array!34705 0))(
  ( (array!34706 (arr!16668 (Array (_ BitVec 32) (_ BitVec 64))) (size!17032 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34705)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550121 (= res!343273 (validKeyInArray!0 (select (arr!16668 a!3118) j!142)))))

(declare-fun b!550122 () Bool)

(declare-fun res!343271 () Bool)

(declare-fun e!317583 () Bool)

(assert (=> b!550122 (=> (not res!343271) (not e!317583))))

(declare-datatypes ((List!10748 0))(
  ( (Nil!10745) (Cons!10744 (h!11717 (_ BitVec 64)) (t!16976 List!10748)) )
))
(declare-fun arrayNoDuplicates!0 (array!34705 (_ BitVec 32) List!10748) Bool)

(assert (=> b!550122 (= res!343271 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10745))))

(declare-fun b!550123 () Bool)

(declare-fun res!343269 () Bool)

(assert (=> b!550123 (=> (not res!343269) (not e!317583))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34705 (_ BitVec 32)) Bool)

(assert (=> b!550123 (= res!343269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun e!317585 () Bool)

(declare-fun b!550124 () Bool)

(declare-datatypes ((SeekEntryResult!5117 0))(
  ( (MissingZero!5117 (index!22695 (_ BitVec 32))) (Found!5117 (index!22696 (_ BitVec 32))) (Intermediate!5117 (undefined!5929 Bool) (index!22697 (_ BitVec 32)) (x!51623 (_ BitVec 32))) (Undefined!5117) (MissingVacant!5117 (index!22698 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34705 (_ BitVec 32)) SeekEntryResult!5117)

(assert (=> b!550124 (= e!317585 (= (seekEntryOrOpen!0 (select (arr!16668 a!3118) j!142) a!3118 mask!3119) (Found!5117 j!142)))))

(declare-fun b!550125 () Bool)

(assert (=> b!550125 (= e!317584 e!317583)))

(declare-fun res!343268 () Bool)

(assert (=> b!550125 (=> (not res!343268) (not e!317583))))

(declare-fun lt!250417 () SeekEntryResult!5117)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550125 (= res!343268 (or (= lt!250417 (MissingZero!5117 i!1132)) (= lt!250417 (MissingVacant!5117 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!550125 (= lt!250417 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!343272 () Bool)

(assert (=> start!50252 (=> (not res!343272) (not e!317584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50252 (= res!343272 (validMask!0 mask!3119))))

(assert (=> start!50252 e!317584))

(assert (=> start!50252 true))

(declare-fun array_inv!12464 (array!34705) Bool)

(assert (=> start!50252 (array_inv!12464 a!3118)))

(declare-fun b!550126 () Bool)

(declare-fun res!343266 () Bool)

(assert (=> b!550126 (=> (not res!343266) (not e!317584))))

(assert (=> b!550126 (= res!343266 (and (= (size!17032 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17032 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17032 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550127 () Bool)

(declare-fun res!343270 () Bool)

(assert (=> b!550127 (=> (not res!343270) (not e!317584))))

(assert (=> b!550127 (= res!343270 (validKeyInArray!0 k!1914))))

(declare-fun b!550128 () Bool)

(declare-fun res!343265 () Bool)

(assert (=> b!550128 (=> (not res!343265) (not e!317583))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34705 (_ BitVec 32)) SeekEntryResult!5117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550128 (= res!343265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16668 a!3118) j!142) mask!3119) (select (arr!16668 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16668 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16668 a!3118) i!1132 k!1914) j!142) (array!34706 (store (arr!16668 a!3118) i!1132 k!1914) (size!17032 a!3118)) mask!3119)))))

(declare-fun b!550129 () Bool)

(declare-fun res!343267 () Bool)

(assert (=> b!550129 (=> (not res!343267) (not e!317584))))

(declare-fun arrayContainsKey!0 (array!34705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550129 (= res!343267 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550130 () Bool)

(assert (=> b!550130 (= e!317583 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550130 e!317585))

(declare-fun res!343274 () Bool)

(assert (=> b!550130 (=> (not res!343274) (not e!317585))))

(assert (=> b!550130 (= res!343274 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17008 0))(
  ( (Unit!17009) )
))
(declare-fun lt!250416 () Unit!17008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17008)

(assert (=> b!550130 (= lt!250416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50252 res!343272) b!550126))

(assert (= (and b!550126 res!343266) b!550121))

(assert (= (and b!550121 res!343273) b!550127))

(assert (= (and b!550127 res!343270) b!550129))

(assert (= (and b!550129 res!343267) b!550125))

(assert (= (and b!550125 res!343268) b!550123))

(assert (= (and b!550123 res!343269) b!550122))

(assert (= (and b!550122 res!343271) b!550128))

(assert (= (and b!550128 res!343265) b!550130))

(assert (= (and b!550130 res!343274) b!550124))

(declare-fun m!527139 () Bool)

(assert (=> b!550124 m!527139))

(assert (=> b!550124 m!527139))

(declare-fun m!527141 () Bool)

(assert (=> b!550124 m!527141))

(declare-fun m!527143 () Bool)

(assert (=> b!550127 m!527143))

(declare-fun m!527145 () Bool)

(assert (=> b!550122 m!527145))

(declare-fun m!527147 () Bool)

(assert (=> b!550130 m!527147))

(declare-fun m!527149 () Bool)

(assert (=> b!550130 m!527149))

(declare-fun m!527151 () Bool)

(assert (=> b!550123 m!527151))

(assert (=> b!550128 m!527139))

(declare-fun m!527153 () Bool)

(assert (=> b!550128 m!527153))

(assert (=> b!550128 m!527139))

(declare-fun m!527155 () Bool)

(assert (=> b!550128 m!527155))

(declare-fun m!527157 () Bool)

(assert (=> b!550128 m!527157))

(assert (=> b!550128 m!527155))

(declare-fun m!527159 () Bool)

(assert (=> b!550128 m!527159))

(assert (=> b!550128 m!527153))

(assert (=> b!550128 m!527139))

(declare-fun m!527161 () Bool)

(assert (=> b!550128 m!527161))

(declare-fun m!527163 () Bool)

(assert (=> b!550128 m!527163))

(assert (=> b!550128 m!527155))

(assert (=> b!550128 m!527157))

(declare-fun m!527165 () Bool)

(assert (=> b!550129 m!527165))

(declare-fun m!527167 () Bool)

(assert (=> start!50252 m!527167))

(declare-fun m!527169 () Bool)

(assert (=> start!50252 m!527169))

(assert (=> b!550121 m!527139))

(assert (=> b!550121 m!527139))

(declare-fun m!527171 () Bool)

(assert (=> b!550121 m!527171))

(declare-fun m!527173 () Bool)

(assert (=> b!550125 m!527173))

(push 1)

