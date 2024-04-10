; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50414 () Bool)

(assert start!50414)

(declare-fun b!551333 () Bool)

(declare-fun res!344117 () Bool)

(declare-fun e!318219 () Bool)

(assert (=> b!551333 (=> (not res!344117) (not e!318219))))

(declare-datatypes ((array!34753 0))(
  ( (array!34754 (arr!16689 (Array (_ BitVec 32) (_ BitVec 64))) (size!17053 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34753)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34753 (_ BitVec 32)) Bool)

(assert (=> b!551333 (= res!344117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!344115 () Bool)

(declare-fun e!318216 () Bool)

(assert (=> start!50414 (=> (not res!344115) (not e!318216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50414 (= res!344115 (validMask!0 mask!3119))))

(assert (=> start!50414 e!318216))

(assert (=> start!50414 true))

(declare-fun array_inv!12485 (array!34753) Bool)

(assert (=> start!50414 (array_inv!12485 a!3118)))

(declare-fun b!551334 () Bool)

(declare-fun res!344112 () Bool)

(assert (=> b!551334 (=> (not res!344112) (not e!318216))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551334 (= res!344112 (and (= (size!17053 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17053 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17053 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551335 () Bool)

(declare-fun res!344116 () Bool)

(assert (=> b!551335 (=> (not res!344116) (not e!318219))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5138 0))(
  ( (MissingZero!5138 (index!22779 (_ BitVec 32))) (Found!5138 (index!22780 (_ BitVec 32))) (Intermediate!5138 (undefined!5950 Bool) (index!22781 (_ BitVec 32)) (x!51712 (_ BitVec 32))) (Undefined!5138) (MissingVacant!5138 (index!22782 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34753 (_ BitVec 32)) SeekEntryResult!5138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551335 (= res!344116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16689 a!3118) j!142) mask!3119) (select (arr!16689 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16689 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16689 a!3118) i!1132 k!1914) j!142) (array!34754 (store (arr!16689 a!3118) i!1132 k!1914) (size!17053 a!3118)) mask!3119)))))

(declare-fun b!551336 () Bool)

(declare-fun res!344114 () Bool)

(assert (=> b!551336 (=> (not res!344114) (not e!318216))))

(declare-fun arrayContainsKey!0 (array!34753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551336 (= res!344114 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551337 () Bool)

(declare-fun res!344113 () Bool)

(assert (=> b!551337 (=> (not res!344113) (not e!318216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551337 (= res!344113 (validKeyInArray!0 (select (arr!16689 a!3118) j!142)))))

(declare-fun b!551338 () Bool)

(declare-fun res!344111 () Bool)

(assert (=> b!551338 (=> (not res!344111) (not e!318216))))

(assert (=> b!551338 (= res!344111 (validKeyInArray!0 k!1914))))

(declare-fun b!551339 () Bool)

(declare-fun res!344119 () Bool)

(assert (=> b!551339 (=> (not res!344119) (not e!318219))))

(declare-datatypes ((List!10769 0))(
  ( (Nil!10766) (Cons!10765 (h!11744 (_ BitVec 64)) (t!16997 List!10769)) )
))
(declare-fun arrayNoDuplicates!0 (array!34753 (_ BitVec 32) List!10769) Bool)

(assert (=> b!551339 (= res!344119 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10766))))

(declare-fun b!551340 () Bool)

(assert (=> b!551340 (= e!318219 (not true))))

(declare-fun e!318218 () Bool)

(assert (=> b!551340 e!318218))

(declare-fun res!344118 () Bool)

(assert (=> b!551340 (=> (not res!344118) (not e!318218))))

(assert (=> b!551340 (= res!344118 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17050 0))(
  ( (Unit!17051) )
))
(declare-fun lt!250810 () Unit!17050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17050)

(assert (=> b!551340 (= lt!250810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551341 () Bool)

(assert (=> b!551341 (= e!318216 e!318219)))

(declare-fun res!344120 () Bool)

(assert (=> b!551341 (=> (not res!344120) (not e!318219))))

(declare-fun lt!250809 () SeekEntryResult!5138)

(assert (=> b!551341 (= res!344120 (or (= lt!250809 (MissingZero!5138 i!1132)) (= lt!250809 (MissingVacant!5138 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34753 (_ BitVec 32)) SeekEntryResult!5138)

(assert (=> b!551341 (= lt!250809 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551342 () Bool)

(assert (=> b!551342 (= e!318218 (= (seekEntryOrOpen!0 (select (arr!16689 a!3118) j!142) a!3118 mask!3119) (Found!5138 j!142)))))

(assert (= (and start!50414 res!344115) b!551334))

(assert (= (and b!551334 res!344112) b!551337))

(assert (= (and b!551337 res!344113) b!551338))

(assert (= (and b!551338 res!344111) b!551336))

(assert (= (and b!551336 res!344114) b!551341))

(assert (= (and b!551341 res!344120) b!551333))

(assert (= (and b!551333 res!344117) b!551339))

(assert (= (and b!551339 res!344119) b!551335))

(assert (= (and b!551335 res!344116) b!551340))

(assert (= (and b!551340 res!344118) b!551342))

(declare-fun m!528297 () Bool)

(assert (=> b!551339 m!528297))

(declare-fun m!528299 () Bool)

(assert (=> b!551333 m!528299))

(declare-fun m!528301 () Bool)

(assert (=> b!551338 m!528301))

(declare-fun m!528303 () Bool)

(assert (=> b!551336 m!528303))

(declare-fun m!528305 () Bool)

(assert (=> b!551340 m!528305))

(declare-fun m!528307 () Bool)

(assert (=> b!551340 m!528307))

(declare-fun m!528309 () Bool)

(assert (=> b!551335 m!528309))

(declare-fun m!528311 () Bool)

(assert (=> b!551335 m!528311))

(assert (=> b!551335 m!528309))

(declare-fun m!528313 () Bool)

(assert (=> b!551335 m!528313))

(declare-fun m!528315 () Bool)

(assert (=> b!551335 m!528315))

(assert (=> b!551335 m!528313))

(declare-fun m!528317 () Bool)

(assert (=> b!551335 m!528317))

(assert (=> b!551335 m!528311))

(assert (=> b!551335 m!528309))

(declare-fun m!528319 () Bool)

(assert (=> b!551335 m!528319))

(declare-fun m!528321 () Bool)

(assert (=> b!551335 m!528321))

(assert (=> b!551335 m!528313))

(assert (=> b!551335 m!528315))

(assert (=> b!551337 m!528309))

(assert (=> b!551337 m!528309))

(declare-fun m!528323 () Bool)

(assert (=> b!551337 m!528323))

(assert (=> b!551342 m!528309))

(assert (=> b!551342 m!528309))

(declare-fun m!528325 () Bool)

(assert (=> b!551342 m!528325))

(declare-fun m!528327 () Bool)

(assert (=> start!50414 m!528327))

(declare-fun m!528329 () Bool)

(assert (=> start!50414 m!528329))

(declare-fun m!528331 () Bool)

(assert (=> b!551341 m!528331))

(push 1)

