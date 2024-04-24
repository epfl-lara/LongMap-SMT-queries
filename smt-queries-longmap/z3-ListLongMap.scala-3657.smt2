; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50544 () Bool)

(assert start!50544)

(declare-fun res!344682 () Bool)

(declare-fun e!318675 () Bool)

(assert (=> start!50544 (=> (not res!344682) (not e!318675))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50544 (= res!344682 (validMask!0 mask!3119))))

(assert (=> start!50544 e!318675))

(assert (=> start!50544 true))

(declare-datatypes ((array!34773 0))(
  ( (array!34774 (arr!16696 (Array (_ BitVec 32) (_ BitVec 64))) (size!17060 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34773)

(declare-fun array_inv!12555 (array!34773) Bool)

(assert (=> start!50544 (array_inv!12555 a!3118)))

(declare-fun b!552184 () Bool)

(declare-fun res!344677 () Bool)

(assert (=> b!552184 (=> (not res!344677) (not e!318675))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552184 (= res!344677 (and (= (size!17060 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17060 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17060 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552185 () Bool)

(declare-fun res!344675 () Bool)

(declare-fun e!318678 () Bool)

(assert (=> b!552185 (=> (not res!344675) (not e!318678))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5101 0))(
  ( (MissingZero!5101 (index!22631 (_ BitVec 32))) (Found!5101 (index!22632 (_ BitVec 32))) (Intermediate!5101 (undefined!5913 Bool) (index!22633 (_ BitVec 32)) (x!51716 (_ BitVec 32))) (Undefined!5101) (MissingVacant!5101 (index!22634 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34773 (_ BitVec 32)) SeekEntryResult!5101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552185 (= res!344675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (array!34774 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)) mask!3119)))))

(declare-fun b!552186 () Bool)

(declare-fun res!344680 () Bool)

(assert (=> b!552186 (=> (not res!344680) (not e!318675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552186 (= res!344680 (validKeyInArray!0 k0!1914))))

(declare-fun b!552187 () Bool)

(declare-fun res!344678 () Bool)

(assert (=> b!552187 (=> (not res!344678) (not e!318678))))

(declare-datatypes ((List!10683 0))(
  ( (Nil!10680) (Cons!10679 (h!11664 (_ BitVec 64)) (t!16903 List!10683)) )
))
(declare-fun arrayNoDuplicates!0 (array!34773 (_ BitVec 32) List!10683) Bool)

(assert (=> b!552187 (= res!344678 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10680))))

(declare-fun b!552188 () Bool)

(declare-fun res!344679 () Bool)

(assert (=> b!552188 (=> (not res!344679) (not e!318675))))

(declare-fun arrayContainsKey!0 (array!34773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552188 (= res!344679 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552189 () Bool)

(assert (=> b!552189 (= e!318678 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318676 () Bool)

(assert (=> b!552189 e!318676))

(declare-fun res!344681 () Bool)

(assert (=> b!552189 (=> (not res!344681) (not e!318676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34773 (_ BitVec 32)) Bool)

(assert (=> b!552189 (= res!344681 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17047 0))(
  ( (Unit!17048) )
))
(declare-fun lt!251122 () Unit!17047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17047)

(assert (=> b!552189 (= lt!251122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552190 () Bool)

(assert (=> b!552190 (= e!318675 e!318678)))

(declare-fun res!344683 () Bool)

(assert (=> b!552190 (=> (not res!344683) (not e!318678))))

(declare-fun lt!251121 () SeekEntryResult!5101)

(assert (=> b!552190 (= res!344683 (or (= lt!251121 (MissingZero!5101 i!1132)) (= lt!251121 (MissingVacant!5101 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34773 (_ BitVec 32)) SeekEntryResult!5101)

(assert (=> b!552190 (= lt!251121 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552191 () Bool)

(declare-fun res!344676 () Bool)

(assert (=> b!552191 (=> (not res!344676) (not e!318678))))

(assert (=> b!552191 (= res!344676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552192 () Bool)

(declare-fun res!344674 () Bool)

(assert (=> b!552192 (=> (not res!344674) (not e!318675))))

(assert (=> b!552192 (= res!344674 (validKeyInArray!0 (select (arr!16696 a!3118) j!142)))))

(declare-fun b!552193 () Bool)

(assert (=> b!552193 (= e!318676 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (Found!5101 j!142)))))

(assert (= (and start!50544 res!344682) b!552184))

(assert (= (and b!552184 res!344677) b!552192))

(assert (= (and b!552192 res!344674) b!552186))

(assert (= (and b!552186 res!344680) b!552188))

(assert (= (and b!552188 res!344679) b!552190))

(assert (= (and b!552190 res!344683) b!552191))

(assert (= (and b!552191 res!344676) b!552187))

(assert (= (and b!552187 res!344678) b!552185))

(assert (= (and b!552185 res!344675) b!552189))

(assert (= (and b!552189 res!344681) b!552193))

(declare-fun m!529265 () Bool)

(assert (=> b!552191 m!529265))

(declare-fun m!529267 () Bool)

(assert (=> b!552186 m!529267))

(declare-fun m!529269 () Bool)

(assert (=> b!552190 m!529269))

(declare-fun m!529271 () Bool)

(assert (=> b!552188 m!529271))

(declare-fun m!529273 () Bool)

(assert (=> b!552193 m!529273))

(assert (=> b!552193 m!529273))

(declare-fun m!529275 () Bool)

(assert (=> b!552193 m!529275))

(assert (=> b!552192 m!529273))

(assert (=> b!552192 m!529273))

(declare-fun m!529277 () Bool)

(assert (=> b!552192 m!529277))

(declare-fun m!529279 () Bool)

(assert (=> b!552189 m!529279))

(declare-fun m!529281 () Bool)

(assert (=> b!552189 m!529281))

(assert (=> b!552185 m!529273))

(declare-fun m!529283 () Bool)

(assert (=> b!552185 m!529283))

(assert (=> b!552185 m!529273))

(declare-fun m!529285 () Bool)

(assert (=> b!552185 m!529285))

(declare-fun m!529287 () Bool)

(assert (=> b!552185 m!529287))

(assert (=> b!552185 m!529285))

(declare-fun m!529289 () Bool)

(assert (=> b!552185 m!529289))

(assert (=> b!552185 m!529283))

(assert (=> b!552185 m!529273))

(declare-fun m!529291 () Bool)

(assert (=> b!552185 m!529291))

(declare-fun m!529293 () Bool)

(assert (=> b!552185 m!529293))

(assert (=> b!552185 m!529285))

(assert (=> b!552185 m!529287))

(declare-fun m!529295 () Bool)

(assert (=> start!50544 m!529295))

(declare-fun m!529297 () Bool)

(assert (=> start!50544 m!529297))

(declare-fun m!529299 () Bool)

(assert (=> b!552187 m!529299))

(check-sat (not b!552193) (not start!50544) (not b!552191) (not b!552185) (not b!552186) (not b!552192) (not b!552187) (not b!552190) (not b!552188) (not b!552189))
(check-sat)
