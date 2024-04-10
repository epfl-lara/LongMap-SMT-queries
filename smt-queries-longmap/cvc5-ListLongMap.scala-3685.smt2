; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50726 () Bool)

(assert start!50726)

(declare-fun b!554793 () Bool)

(declare-fun res!347206 () Bool)

(declare-fun e!319850 () Bool)

(assert (=> b!554793 (=> (not res!347206) (not e!319850))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34951 0))(
  ( (array!34952 (arr!16785 (Array (_ BitVec 32) (_ BitVec 64))) (size!17149 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34951)

(assert (=> b!554793 (= res!347206 (and (= (size!17149 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17149 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17149 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554794 () Bool)

(declare-fun res!347211 () Bool)

(assert (=> b!554794 (=> (not res!347211) (not e!319850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554794 (= res!347211 (validKeyInArray!0 (select (arr!16785 a!3118) j!142)))))

(declare-fun res!347212 () Bool)

(assert (=> start!50726 (=> (not res!347212) (not e!319850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50726 (= res!347212 (validMask!0 mask!3119))))

(assert (=> start!50726 e!319850))

(assert (=> start!50726 true))

(declare-fun array_inv!12581 (array!34951) Bool)

(assert (=> start!50726 (array_inv!12581 a!3118)))

(declare-fun b!554795 () Bool)

(declare-fun res!347207 () Bool)

(declare-fun e!319848 () Bool)

(assert (=> b!554795 (=> (not res!347207) (not e!319848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34951 (_ BitVec 32)) Bool)

(assert (=> b!554795 (= res!347207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554796 () Bool)

(declare-datatypes ((SeekEntryResult!5234 0))(
  ( (MissingZero!5234 (index!23163 (_ BitVec 32))) (Found!5234 (index!23164 (_ BitVec 32))) (Intermediate!5234 (undefined!6046 Bool) (index!23165 (_ BitVec 32)) (x!52076 (_ BitVec 32))) (Undefined!5234) (MissingVacant!5234 (index!23166 (_ BitVec 32))) )
))
(declare-fun lt!251989 () SeekEntryResult!5234)

(declare-fun e!319849 () Bool)

(assert (=> b!554796 (= e!319849 (not (or (undefined!6046 lt!251989) (not (is-Intermediate!5234 lt!251989)) (= (select (arr!16785 a!3118) (index!23165 lt!251989)) (select (arr!16785 a!3118) j!142)) (not (= (select (arr!16785 a!3118) (index!23165 lt!251989)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17149 a!3118)))))))

(declare-fun lt!251988 () SeekEntryResult!5234)

(assert (=> b!554796 (and (= lt!251988 (Found!5234 j!142)) (or (undefined!6046 lt!251989) (not (is-Intermediate!5234 lt!251989)) (= (select (arr!16785 a!3118) (index!23165 lt!251989)) (select (arr!16785 a!3118) j!142)) (not (= (select (arr!16785 a!3118) (index!23165 lt!251989)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251988 (MissingZero!5234 (index!23165 lt!251989)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34951 (_ BitVec 32)) SeekEntryResult!5234)

(assert (=> b!554796 (= lt!251988 (seekEntryOrOpen!0 (select (arr!16785 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554796 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17242 0))(
  ( (Unit!17243) )
))
(declare-fun lt!251986 () Unit!17242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17242)

(assert (=> b!554796 (= lt!251986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554797 () Bool)

(declare-fun res!347209 () Bool)

(assert (=> b!554797 (=> (not res!347209) (not e!319850))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554797 (= res!347209 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554798 () Bool)

(declare-fun res!347205 () Bool)

(assert (=> b!554798 (=> (not res!347205) (not e!319850))))

(assert (=> b!554798 (= res!347205 (validKeyInArray!0 k!1914))))

(declare-fun b!554799 () Bool)

(declare-fun res!347213 () Bool)

(assert (=> b!554799 (=> (not res!347213) (not e!319848))))

(declare-datatypes ((List!10865 0))(
  ( (Nil!10862) (Cons!10861 (h!11846 (_ BitVec 64)) (t!17093 List!10865)) )
))
(declare-fun arrayNoDuplicates!0 (array!34951 (_ BitVec 32) List!10865) Bool)

(assert (=> b!554799 (= res!347213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10862))))

(declare-fun b!554800 () Bool)

(assert (=> b!554800 (= e!319850 e!319848)))

(declare-fun res!347208 () Bool)

(assert (=> b!554800 (=> (not res!347208) (not e!319848))))

(declare-fun lt!251984 () SeekEntryResult!5234)

(assert (=> b!554800 (= res!347208 (or (= lt!251984 (MissingZero!5234 i!1132)) (= lt!251984 (MissingVacant!5234 i!1132))))))

(assert (=> b!554800 (= lt!251984 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554801 () Bool)

(assert (=> b!554801 (= e!319848 e!319849)))

(declare-fun res!347210 () Bool)

(assert (=> b!554801 (=> (not res!347210) (not e!319849))))

(declare-fun lt!251985 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34951 (_ BitVec 32)) SeekEntryResult!5234)

(assert (=> b!554801 (= res!347210 (= lt!251989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251985 (select (store (arr!16785 a!3118) i!1132 k!1914) j!142) (array!34952 (store (arr!16785 a!3118) i!1132 k!1914) (size!17149 a!3118)) mask!3119)))))

(declare-fun lt!251987 () (_ BitVec 32))

(assert (=> b!554801 (= lt!251989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251987 (select (arr!16785 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554801 (= lt!251985 (toIndex!0 (select (store (arr!16785 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554801 (= lt!251987 (toIndex!0 (select (arr!16785 a!3118) j!142) mask!3119))))

(assert (= (and start!50726 res!347212) b!554793))

(assert (= (and b!554793 res!347206) b!554794))

(assert (= (and b!554794 res!347211) b!554798))

(assert (= (and b!554798 res!347205) b!554797))

(assert (= (and b!554797 res!347209) b!554800))

(assert (= (and b!554800 res!347208) b!554795))

(assert (= (and b!554795 res!347207) b!554799))

(assert (= (and b!554799 res!347213) b!554801))

(assert (= (and b!554801 res!347210) b!554796))

(declare-fun m!532215 () Bool)

(assert (=> b!554797 m!532215))

(declare-fun m!532217 () Bool)

(assert (=> b!554795 m!532217))

(declare-fun m!532219 () Bool)

(assert (=> start!50726 m!532219))

(declare-fun m!532221 () Bool)

(assert (=> start!50726 m!532221))

(declare-fun m!532223 () Bool)

(assert (=> b!554796 m!532223))

(declare-fun m!532225 () Bool)

(assert (=> b!554796 m!532225))

(declare-fun m!532227 () Bool)

(assert (=> b!554796 m!532227))

(declare-fun m!532229 () Bool)

(assert (=> b!554796 m!532229))

(assert (=> b!554796 m!532223))

(declare-fun m!532231 () Bool)

(assert (=> b!554796 m!532231))

(declare-fun m!532233 () Bool)

(assert (=> b!554800 m!532233))

(assert (=> b!554801 m!532223))

(declare-fun m!532235 () Bool)

(assert (=> b!554801 m!532235))

(declare-fun m!532237 () Bool)

(assert (=> b!554801 m!532237))

(declare-fun m!532239 () Bool)

(assert (=> b!554801 m!532239))

(assert (=> b!554801 m!532223))

(assert (=> b!554801 m!532237))

(assert (=> b!554801 m!532223))

(declare-fun m!532241 () Bool)

(assert (=> b!554801 m!532241))

(declare-fun m!532243 () Bool)

(assert (=> b!554801 m!532243))

(assert (=> b!554801 m!532237))

(declare-fun m!532245 () Bool)

(assert (=> b!554801 m!532245))

(declare-fun m!532247 () Bool)

(assert (=> b!554799 m!532247))

(declare-fun m!532249 () Bool)

(assert (=> b!554798 m!532249))

(assert (=> b!554794 m!532223))

(assert (=> b!554794 m!532223))

(declare-fun m!532251 () Bool)

(assert (=> b!554794 m!532251))

(push 1)

