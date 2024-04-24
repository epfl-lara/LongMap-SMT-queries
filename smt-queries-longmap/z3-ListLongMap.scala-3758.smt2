; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51588 () Bool)

(assert start!51588)

(declare-fun res!355240 () Bool)

(declare-fun e!325064 () Bool)

(assert (=> start!51588 (=> (not res!355240) (not e!325064))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51588 (= res!355240 (validMask!0 mask!3119))))

(assert (=> start!51588 e!325064))

(assert (=> start!51588 true))

(declare-datatypes ((array!35400 0))(
  ( (array!35401 (arr!16999 (Array (_ BitVec 32) (_ BitVec 64))) (size!17363 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35400)

(declare-fun array_inv!12858 (array!35400) Bool)

(assert (=> start!51588 (array_inv!12858 a!3118)))

(declare-fun b!564184 () Bool)

(declare-fun res!355238 () Bool)

(assert (=> b!564184 (=> (not res!355238) (not e!325064))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564184 (= res!355238 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564185 () Bool)

(declare-fun res!355237 () Bool)

(declare-fun e!325062 () Bool)

(assert (=> b!564185 (=> (not res!355237) (not e!325062))))

(declare-datatypes ((List!10986 0))(
  ( (Nil!10983) (Cons!10982 (h!11988 (_ BitVec 64)) (t!17206 List!10986)) )
))
(declare-fun arrayNoDuplicates!0 (array!35400 (_ BitVec 32) List!10986) Bool)

(assert (=> b!564185 (= res!355237 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10983))))

(declare-fun b!564186 () Bool)

(assert (=> b!564186 (= e!325064 e!325062)))

(declare-fun res!355233 () Bool)

(assert (=> b!564186 (=> (not res!355233) (not e!325062))))

(declare-datatypes ((SeekEntryResult!5404 0))(
  ( (MissingZero!5404 (index!23843 (_ BitVec 32))) (Found!5404 (index!23844 (_ BitVec 32))) (Intermediate!5404 (undefined!6216 Bool) (index!23845 (_ BitVec 32)) (x!52878 (_ BitVec 32))) (Undefined!5404) (MissingVacant!5404 (index!23846 (_ BitVec 32))) )
))
(declare-fun lt!257523 () SeekEntryResult!5404)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564186 (= res!355233 (or (= lt!257523 (MissingZero!5404 i!1132)) (= lt!257523 (MissingVacant!5404 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35400 (_ BitVec 32)) SeekEntryResult!5404)

(assert (=> b!564186 (= lt!257523 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564187 () Bool)

(declare-fun res!355232 () Bool)

(assert (=> b!564187 (=> (not res!355232) (not e!325064))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564187 (= res!355232 (and (= (size!17363 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17363 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17363 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564188 () Bool)

(declare-fun res!355235 () Bool)

(assert (=> b!564188 (=> (not res!355235) (not e!325062))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35400 (_ BitVec 32)) SeekEntryResult!5404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564188 (= res!355235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16999 a!3118) j!142) mask!3119) (select (arr!16999 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16999 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16999 a!3118) i!1132 k0!1914) j!142) (array!35401 (store (arr!16999 a!3118) i!1132 k0!1914) (size!17363 a!3118)) mask!3119)))))

(declare-fun b!564189 () Bool)

(declare-fun res!355239 () Bool)

(assert (=> b!564189 (=> (not res!355239) (not e!325064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564189 (= res!355239 (validKeyInArray!0 (select (arr!16999 a!3118) j!142)))))

(declare-fun b!564190 () Bool)

(assert (=> b!564190 (= e!325062 (not true))))

(declare-fun e!325063 () Bool)

(assert (=> b!564190 e!325063))

(declare-fun res!355236 () Bool)

(assert (=> b!564190 (=> (not res!355236) (not e!325063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35400 (_ BitVec 32)) Bool)

(assert (=> b!564190 (= res!355236 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17653 0))(
  ( (Unit!17654) )
))
(declare-fun lt!257524 () Unit!17653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17653)

(assert (=> b!564190 (= lt!257524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564191 () Bool)

(declare-fun res!355231 () Bool)

(assert (=> b!564191 (=> (not res!355231) (not e!325062))))

(assert (=> b!564191 (= res!355231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564192 () Bool)

(declare-fun res!355234 () Bool)

(assert (=> b!564192 (=> (not res!355234) (not e!325064))))

(assert (=> b!564192 (= res!355234 (validKeyInArray!0 k0!1914))))

(declare-fun b!564193 () Bool)

(assert (=> b!564193 (= e!325063 (= (seekEntryOrOpen!0 (select (arr!16999 a!3118) j!142) a!3118 mask!3119) (Found!5404 j!142)))))

(assert (= (and start!51588 res!355240) b!564187))

(assert (= (and b!564187 res!355232) b!564189))

(assert (= (and b!564189 res!355239) b!564192))

(assert (= (and b!564192 res!355234) b!564184))

(assert (= (and b!564184 res!355238) b!564186))

(assert (= (and b!564186 res!355233) b!564191))

(assert (= (and b!564191 res!355231) b!564185))

(assert (= (and b!564185 res!355237) b!564188))

(assert (= (and b!564188 res!355235) b!564190))

(assert (= (and b!564190 res!355236) b!564193))

(declare-fun m!542771 () Bool)

(assert (=> start!51588 m!542771))

(declare-fun m!542773 () Bool)

(assert (=> start!51588 m!542773))

(declare-fun m!542775 () Bool)

(assert (=> b!564190 m!542775))

(declare-fun m!542777 () Bool)

(assert (=> b!564190 m!542777))

(declare-fun m!542779 () Bool)

(assert (=> b!564185 m!542779))

(declare-fun m!542781 () Bool)

(assert (=> b!564192 m!542781))

(declare-fun m!542783 () Bool)

(assert (=> b!564189 m!542783))

(assert (=> b!564189 m!542783))

(declare-fun m!542785 () Bool)

(assert (=> b!564189 m!542785))

(declare-fun m!542787 () Bool)

(assert (=> b!564191 m!542787))

(declare-fun m!542789 () Bool)

(assert (=> b!564186 m!542789))

(declare-fun m!542791 () Bool)

(assert (=> b!564184 m!542791))

(assert (=> b!564193 m!542783))

(assert (=> b!564193 m!542783))

(declare-fun m!542793 () Bool)

(assert (=> b!564193 m!542793))

(assert (=> b!564188 m!542783))

(declare-fun m!542795 () Bool)

(assert (=> b!564188 m!542795))

(assert (=> b!564188 m!542783))

(declare-fun m!542797 () Bool)

(assert (=> b!564188 m!542797))

(declare-fun m!542799 () Bool)

(assert (=> b!564188 m!542799))

(assert (=> b!564188 m!542797))

(declare-fun m!542801 () Bool)

(assert (=> b!564188 m!542801))

(assert (=> b!564188 m!542795))

(assert (=> b!564188 m!542783))

(declare-fun m!542803 () Bool)

(assert (=> b!564188 m!542803))

(declare-fun m!542805 () Bool)

(assert (=> b!564188 m!542805))

(assert (=> b!564188 m!542797))

(assert (=> b!564188 m!542799))

(check-sat (not b!564193) (not b!564190) (not b!564186) (not b!564192) (not b!564185) (not b!564191) (not b!564189) (not start!51588) (not b!564188) (not b!564184))
(check-sat)
