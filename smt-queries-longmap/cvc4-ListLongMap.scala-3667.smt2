; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50622 () Bool)

(assert start!50622)

(declare-fun b!553244 () Bool)

(declare-fun res!345661 () Bool)

(declare-fun e!319160 () Bool)

(assert (=> b!553244 (=> (not res!345661) (not e!319160))))

(declare-datatypes ((array!34847 0))(
  ( (array!34848 (arr!16733 (Array (_ BitVec 32) (_ BitVec 64))) (size!17097 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34847)

(declare-datatypes ((List!10813 0))(
  ( (Nil!10810) (Cons!10809 (h!11794 (_ BitVec 64)) (t!17041 List!10813)) )
))
(declare-fun arrayNoDuplicates!0 (array!34847 (_ BitVec 32) List!10813) Bool)

(assert (=> b!553244 (= res!345661 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10810))))

(declare-fun b!553245 () Bool)

(declare-fun res!345657 () Bool)

(declare-fun e!319161 () Bool)

(assert (=> b!553245 (=> (not res!345657) (not e!319161))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553245 (= res!345657 (validKeyInArray!0 k!1914))))

(declare-fun b!553246 () Bool)

(declare-fun res!345665 () Bool)

(assert (=> b!553246 (=> (not res!345665) (not e!319160))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34847 (_ BitVec 32)) Bool)

(assert (=> b!553246 (= res!345665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553247 () Bool)

(declare-fun res!345662 () Bool)

(assert (=> b!553247 (=> (not res!345662) (not e!319161))))

(declare-fun arrayContainsKey!0 (array!34847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553247 (= res!345662 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553249 () Bool)

(declare-fun e!319164 () Bool)

(declare-datatypes ((SeekEntryResult!5182 0))(
  ( (MissingZero!5182 (index!22955 (_ BitVec 32))) (Found!5182 (index!22956 (_ BitVec 32))) (Intermediate!5182 (undefined!5994 Bool) (index!22957 (_ BitVec 32)) (x!51880 (_ BitVec 32))) (Undefined!5182) (MissingVacant!5182 (index!22958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34847 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!553249 (= e!319164 (= (seekEntryOrOpen!0 (select (arr!16733 a!3118) j!142) a!3118 mask!3119) (Found!5182 j!142)))))

(declare-fun b!553250 () Bool)

(declare-fun e!319163 () Bool)

(declare-fun lt!251422 () SeekEntryResult!5182)

(assert (=> b!553250 (= e!319163 (not (or (not (is-Intermediate!5182 lt!251422)) (not (undefined!5994 lt!251422)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553250 e!319164))

(declare-fun res!345658 () Bool)

(assert (=> b!553250 (=> (not res!345658) (not e!319164))))

(assert (=> b!553250 (= res!345658 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17138 0))(
  ( (Unit!17139) )
))
(declare-fun lt!251418 () Unit!17138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17138)

(assert (=> b!553250 (= lt!251418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553251 () Bool)

(assert (=> b!553251 (= e!319160 e!319163)))

(declare-fun res!345660 () Bool)

(assert (=> b!553251 (=> (not res!345660) (not e!319163))))

(declare-fun lt!251420 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34847 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!553251 (= res!345660 (= lt!251422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251420 (select (store (arr!16733 a!3118) i!1132 k!1914) j!142) (array!34848 (store (arr!16733 a!3118) i!1132 k!1914) (size!17097 a!3118)) mask!3119)))))

(declare-fun lt!251419 () (_ BitVec 32))

(assert (=> b!553251 (= lt!251422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251419 (select (arr!16733 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553251 (= lt!251420 (toIndex!0 (select (store (arr!16733 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553251 (= lt!251419 (toIndex!0 (select (arr!16733 a!3118) j!142) mask!3119))))

(declare-fun b!553252 () Bool)

(assert (=> b!553252 (= e!319161 e!319160)))

(declare-fun res!345664 () Bool)

(assert (=> b!553252 (=> (not res!345664) (not e!319160))))

(declare-fun lt!251421 () SeekEntryResult!5182)

(assert (=> b!553252 (= res!345664 (or (= lt!251421 (MissingZero!5182 i!1132)) (= lt!251421 (MissingVacant!5182 i!1132))))))

(assert (=> b!553252 (= lt!251421 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553253 () Bool)

(declare-fun res!345659 () Bool)

(assert (=> b!553253 (=> (not res!345659) (not e!319161))))

(assert (=> b!553253 (= res!345659 (validKeyInArray!0 (select (arr!16733 a!3118) j!142)))))

(declare-fun b!553248 () Bool)

(declare-fun res!345663 () Bool)

(assert (=> b!553248 (=> (not res!345663) (not e!319161))))

(assert (=> b!553248 (= res!345663 (and (= (size!17097 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17097 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17097 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345656 () Bool)

(assert (=> start!50622 (=> (not res!345656) (not e!319161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50622 (= res!345656 (validMask!0 mask!3119))))

(assert (=> start!50622 e!319161))

(assert (=> start!50622 true))

(declare-fun array_inv!12529 (array!34847) Bool)

(assert (=> start!50622 (array_inv!12529 a!3118)))

(assert (= (and start!50622 res!345656) b!553248))

(assert (= (and b!553248 res!345663) b!553253))

(assert (= (and b!553253 res!345659) b!553245))

(assert (= (and b!553245 res!345657) b!553247))

(assert (= (and b!553247 res!345662) b!553252))

(assert (= (and b!553252 res!345664) b!553246))

(assert (= (and b!553246 res!345665) b!553244))

(assert (= (and b!553244 res!345661) b!553251))

(assert (= (and b!553251 res!345660) b!553250))

(assert (= (and b!553250 res!345658) b!553249))

(declare-fun m!530289 () Bool)

(assert (=> b!553249 m!530289))

(assert (=> b!553249 m!530289))

(declare-fun m!530291 () Bool)

(assert (=> b!553249 m!530291))

(declare-fun m!530293 () Bool)

(assert (=> b!553252 m!530293))

(assert (=> b!553253 m!530289))

(assert (=> b!553253 m!530289))

(declare-fun m!530295 () Bool)

(assert (=> b!553253 m!530295))

(declare-fun m!530297 () Bool)

(assert (=> b!553246 m!530297))

(declare-fun m!530299 () Bool)

(assert (=> b!553251 m!530299))

(declare-fun m!530301 () Bool)

(assert (=> b!553251 m!530301))

(assert (=> b!553251 m!530289))

(declare-fun m!530303 () Bool)

(assert (=> b!553251 m!530303))

(assert (=> b!553251 m!530289))

(assert (=> b!553251 m!530289))

(declare-fun m!530305 () Bool)

(assert (=> b!553251 m!530305))

(assert (=> b!553251 m!530299))

(declare-fun m!530307 () Bool)

(assert (=> b!553251 m!530307))

(assert (=> b!553251 m!530299))

(declare-fun m!530309 () Bool)

(assert (=> b!553251 m!530309))

(declare-fun m!530311 () Bool)

(assert (=> b!553245 m!530311))

(declare-fun m!530313 () Bool)

(assert (=> start!50622 m!530313))

(declare-fun m!530315 () Bool)

(assert (=> start!50622 m!530315))

(declare-fun m!530317 () Bool)

(assert (=> b!553247 m!530317))

(declare-fun m!530319 () Bool)

(assert (=> b!553244 m!530319))

(declare-fun m!530321 () Bool)

(assert (=> b!553250 m!530321))

(declare-fun m!530323 () Bool)

(assert (=> b!553250 m!530323))

(push 1)

