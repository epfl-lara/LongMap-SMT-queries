; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50724 () Bool)

(assert start!50724)

(declare-fun b!554766 () Bool)

(declare-fun e!319836 () Bool)

(declare-fun e!319838 () Bool)

(assert (=> b!554766 (= e!319836 e!319838)))

(declare-fun res!347180 () Bool)

(assert (=> b!554766 (=> (not res!347180) (not e!319838))))

(declare-fun lt!251971 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5233 0))(
  ( (MissingZero!5233 (index!23159 (_ BitVec 32))) (Found!5233 (index!23160 (_ BitVec 32))) (Intermediate!5233 (undefined!6045 Bool) (index!23161 (_ BitVec 32)) (x!52067 (_ BitVec 32))) (Undefined!5233) (MissingVacant!5233 (index!23162 (_ BitVec 32))) )
))
(declare-fun lt!251967 () SeekEntryResult!5233)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34949 0))(
  ( (array!34950 (arr!16784 (Array (_ BitVec 32) (_ BitVec 64))) (size!17148 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34949 (_ BitVec 32)) SeekEntryResult!5233)

(assert (=> b!554766 (= res!347180 (= lt!251967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251971 (select (store (arr!16784 a!3118) i!1132 k!1914) j!142) (array!34950 (store (arr!16784 a!3118) i!1132 k!1914) (size!17148 a!3118)) mask!3119)))))

(declare-fun lt!251968 () (_ BitVec 32))

(assert (=> b!554766 (= lt!251967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251968 (select (arr!16784 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554766 (= lt!251971 (toIndex!0 (select (store (arr!16784 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554766 (= lt!251968 (toIndex!0 (select (arr!16784 a!3118) j!142) mask!3119))))

(declare-fun b!554767 () Bool)

(declare-fun e!319837 () Bool)

(assert (=> b!554767 (= e!319837 e!319836)))

(declare-fun res!347181 () Bool)

(assert (=> b!554767 (=> (not res!347181) (not e!319836))))

(declare-fun lt!251969 () SeekEntryResult!5233)

(assert (=> b!554767 (= res!347181 (or (= lt!251969 (MissingZero!5233 i!1132)) (= lt!251969 (MissingVacant!5233 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34949 (_ BitVec 32)) SeekEntryResult!5233)

(assert (=> b!554767 (= lt!251969 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554768 () Bool)

(declare-fun res!347179 () Bool)

(assert (=> b!554768 (=> (not res!347179) (not e!319837))))

(assert (=> b!554768 (= res!347179 (and (= (size!17148 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17148 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17148 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554769 () Bool)

(declare-fun res!347178 () Bool)

(assert (=> b!554769 (=> (not res!347178) (not e!319836))))

(declare-datatypes ((List!10864 0))(
  ( (Nil!10861) (Cons!10860 (h!11845 (_ BitVec 64)) (t!17092 List!10864)) )
))
(declare-fun arrayNoDuplicates!0 (array!34949 (_ BitVec 32) List!10864) Bool)

(assert (=> b!554769 (= res!347178 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10861))))

(declare-fun b!554770 () Bool)

(declare-fun res!347182 () Bool)

(assert (=> b!554770 (=> (not res!347182) (not e!319836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34949 (_ BitVec 32)) Bool)

(assert (=> b!554770 (= res!347182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554771 () Bool)

(declare-fun res!347185 () Bool)

(assert (=> b!554771 (=> (not res!347185) (not e!319837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554771 (= res!347185 (validKeyInArray!0 (select (arr!16784 a!3118) j!142)))))

(declare-fun b!554773 () Bool)

(assert (=> b!554773 (= e!319838 (not true))))

(declare-fun lt!251970 () SeekEntryResult!5233)

(assert (=> b!554773 (and (= lt!251970 (Found!5233 j!142)) (or (undefined!6045 lt!251967) (not (is-Intermediate!5233 lt!251967)) (= (select (arr!16784 a!3118) (index!23161 lt!251967)) (select (arr!16784 a!3118) j!142)) (not (= (select (arr!16784 a!3118) (index!23161 lt!251967)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251970 (MissingZero!5233 (index!23161 lt!251967)))))))

(assert (=> b!554773 (= lt!251970 (seekEntryOrOpen!0 (select (arr!16784 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554773 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17240 0))(
  ( (Unit!17241) )
))
(declare-fun lt!251966 () Unit!17240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17240)

(assert (=> b!554773 (= lt!251966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554774 () Bool)

(declare-fun res!347186 () Bool)

(assert (=> b!554774 (=> (not res!347186) (not e!319837))))

(assert (=> b!554774 (= res!347186 (validKeyInArray!0 k!1914))))

(declare-fun b!554772 () Bool)

(declare-fun res!347184 () Bool)

(assert (=> b!554772 (=> (not res!347184) (not e!319837))))

(declare-fun arrayContainsKey!0 (array!34949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554772 (= res!347184 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347183 () Bool)

(assert (=> start!50724 (=> (not res!347183) (not e!319837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50724 (= res!347183 (validMask!0 mask!3119))))

(assert (=> start!50724 e!319837))

(assert (=> start!50724 true))

(declare-fun array_inv!12580 (array!34949) Bool)

(assert (=> start!50724 (array_inv!12580 a!3118)))

(assert (= (and start!50724 res!347183) b!554768))

(assert (= (and b!554768 res!347179) b!554771))

(assert (= (and b!554771 res!347185) b!554774))

(assert (= (and b!554774 res!347186) b!554772))

(assert (= (and b!554772 res!347184) b!554767))

(assert (= (and b!554767 res!347181) b!554770))

(assert (= (and b!554770 res!347182) b!554769))

(assert (= (and b!554769 res!347178) b!554766))

(assert (= (and b!554766 res!347180) b!554773))

(declare-fun m!532177 () Bool)

(assert (=> b!554766 m!532177))

(declare-fun m!532179 () Bool)

(assert (=> b!554766 m!532179))

(assert (=> b!554766 m!532177))

(declare-fun m!532181 () Bool)

(assert (=> b!554766 m!532181))

(assert (=> b!554766 m!532177))

(declare-fun m!532183 () Bool)

(assert (=> b!554766 m!532183))

(assert (=> b!554766 m!532183))

(declare-fun m!532185 () Bool)

(assert (=> b!554766 m!532185))

(declare-fun m!532187 () Bool)

(assert (=> b!554766 m!532187))

(assert (=> b!554766 m!532183))

(declare-fun m!532189 () Bool)

(assert (=> b!554766 m!532189))

(declare-fun m!532191 () Bool)

(assert (=> b!554769 m!532191))

(declare-fun m!532193 () Bool)

(assert (=> b!554772 m!532193))

(declare-fun m!532195 () Bool)

(assert (=> b!554770 m!532195))

(declare-fun m!532197 () Bool)

(assert (=> b!554767 m!532197))

(declare-fun m!532199 () Bool)

(assert (=> start!50724 m!532199))

(declare-fun m!532201 () Bool)

(assert (=> start!50724 m!532201))

(assert (=> b!554773 m!532177))

(declare-fun m!532203 () Bool)

(assert (=> b!554773 m!532203))

(declare-fun m!532205 () Bool)

(assert (=> b!554773 m!532205))

(declare-fun m!532207 () Bool)

(assert (=> b!554773 m!532207))

(assert (=> b!554773 m!532177))

(declare-fun m!532209 () Bool)

(assert (=> b!554773 m!532209))

(declare-fun m!532211 () Bool)

(assert (=> b!554774 m!532211))

(assert (=> b!554771 m!532177))

(assert (=> b!554771 m!532177))

(declare-fun m!532213 () Bool)

(assert (=> b!554771 m!532213))

(push 1)

