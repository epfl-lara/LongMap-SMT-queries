; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50652 () Bool)

(assert start!50652)

(declare-fun b!553204 () Bool)

(declare-fun res!345515 () Bool)

(declare-fun e!319188 () Bool)

(assert (=> b!553204 (=> (not res!345515) (not e!319188))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34824 0))(
  ( (array!34825 (arr!16720 (Array (_ BitVec 32) (_ BitVec 64))) (size!17084 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34824)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553204 (= res!345515 (and (= (size!17084 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17084 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17084 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553205 () Bool)

(declare-fun res!345513 () Bool)

(assert (=> b!553205 (=> (not res!345513) (not e!319188))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553205 (= res!345513 (validKeyInArray!0 k0!1914))))

(declare-fun b!553206 () Bool)

(declare-fun res!345517 () Bool)

(assert (=> b!553206 (=> (not res!345517) (not e!319188))))

(assert (=> b!553206 (= res!345517 (validKeyInArray!0 (select (arr!16720 a!3118) j!142)))))

(declare-fun b!553207 () Bool)

(declare-fun e!319185 () Bool)

(assert (=> b!553207 (= e!319188 e!319185)))

(declare-fun res!345520 () Bool)

(assert (=> b!553207 (=> (not res!345520) (not e!319185))))

(declare-datatypes ((SeekEntryResult!5125 0))(
  ( (MissingZero!5125 (index!22727 (_ BitVec 32))) (Found!5125 (index!22728 (_ BitVec 32))) (Intermediate!5125 (undefined!5937 Bool) (index!22729 (_ BitVec 32)) (x!51810 (_ BitVec 32))) (Undefined!5125) (MissingVacant!5125 (index!22730 (_ BitVec 32))) )
))
(declare-fun lt!251457 () SeekEntryResult!5125)

(assert (=> b!553207 (= res!345520 (or (= lt!251457 (MissingZero!5125 i!1132)) (= lt!251457 (MissingVacant!5125 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34824 (_ BitVec 32)) SeekEntryResult!5125)

(assert (=> b!553207 (= lt!251457 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553208 () Bool)

(declare-fun e!319186 () Bool)

(assert (=> b!553208 (= e!319186 (= (seekEntryOrOpen!0 (select (arr!16720 a!3118) j!142) a!3118 mask!3119) (Found!5125 j!142)))))

(declare-fun b!553209 () Bool)

(assert (=> b!553209 (= e!319185 (not true))))

(assert (=> b!553209 e!319186))

(declare-fun res!345518 () Bool)

(assert (=> b!553209 (=> (not res!345518) (not e!319186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34824 (_ BitVec 32)) Bool)

(assert (=> b!553209 (= res!345518 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17095 0))(
  ( (Unit!17096) )
))
(declare-fun lt!251458 () Unit!17095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17095)

(assert (=> b!553209 (= lt!251458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553210 () Bool)

(declare-fun res!345512 () Bool)

(assert (=> b!553210 (=> (not res!345512) (not e!319185))))

(declare-datatypes ((List!10707 0))(
  ( (Nil!10704) (Cons!10703 (h!11691 (_ BitVec 64)) (t!16927 List!10707)) )
))
(declare-fun arrayNoDuplicates!0 (array!34824 (_ BitVec 32) List!10707) Bool)

(assert (=> b!553210 (= res!345512 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10704))))

(declare-fun b!553211 () Bool)

(declare-fun res!345516 () Bool)

(assert (=> b!553211 (=> (not res!345516) (not e!319185))))

(assert (=> b!553211 (= res!345516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553213 () Bool)

(declare-fun res!345514 () Bool)

(assert (=> b!553213 (=> (not res!345514) (not e!319185))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34824 (_ BitVec 32)) SeekEntryResult!5125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553213 (= res!345514 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16720 a!3118) j!142) mask!3119) (select (arr!16720 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16720 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16720 a!3118) i!1132 k0!1914) j!142) (array!34825 (store (arr!16720 a!3118) i!1132 k0!1914) (size!17084 a!3118)) mask!3119)))))

(declare-fun b!553212 () Bool)

(declare-fun res!345519 () Bool)

(assert (=> b!553212 (=> (not res!345519) (not e!319188))))

(declare-fun arrayContainsKey!0 (array!34824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553212 (= res!345519 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!345511 () Bool)

(assert (=> start!50652 (=> (not res!345511) (not e!319188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50652 (= res!345511 (validMask!0 mask!3119))))

(assert (=> start!50652 e!319188))

(assert (=> start!50652 true))

(declare-fun array_inv!12579 (array!34824) Bool)

(assert (=> start!50652 (array_inv!12579 a!3118)))

(assert (= (and start!50652 res!345511) b!553204))

(assert (= (and b!553204 res!345515) b!553206))

(assert (= (and b!553206 res!345517) b!553205))

(assert (= (and b!553205 res!345513) b!553212))

(assert (= (and b!553212 res!345519) b!553207))

(assert (= (and b!553207 res!345520) b!553211))

(assert (= (and b!553211 res!345516) b!553210))

(assert (= (and b!553210 res!345512) b!553213))

(assert (= (and b!553213 res!345514) b!553209))

(assert (= (and b!553209 res!345518) b!553208))

(declare-fun m!530339 () Bool)

(assert (=> b!553207 m!530339))

(declare-fun m!530341 () Bool)

(assert (=> b!553211 m!530341))

(declare-fun m!530343 () Bool)

(assert (=> b!553206 m!530343))

(assert (=> b!553206 m!530343))

(declare-fun m!530345 () Bool)

(assert (=> b!553206 m!530345))

(declare-fun m!530347 () Bool)

(assert (=> b!553210 m!530347))

(declare-fun m!530349 () Bool)

(assert (=> start!50652 m!530349))

(declare-fun m!530351 () Bool)

(assert (=> start!50652 m!530351))

(declare-fun m!530353 () Bool)

(assert (=> b!553205 m!530353))

(declare-fun m!530355 () Bool)

(assert (=> b!553212 m!530355))

(assert (=> b!553208 m!530343))

(assert (=> b!553208 m!530343))

(declare-fun m!530357 () Bool)

(assert (=> b!553208 m!530357))

(declare-fun m!530359 () Bool)

(assert (=> b!553209 m!530359))

(declare-fun m!530361 () Bool)

(assert (=> b!553209 m!530361))

(assert (=> b!553213 m!530343))

(declare-fun m!530363 () Bool)

(assert (=> b!553213 m!530363))

(assert (=> b!553213 m!530343))

(declare-fun m!530365 () Bool)

(assert (=> b!553213 m!530365))

(declare-fun m!530367 () Bool)

(assert (=> b!553213 m!530367))

(assert (=> b!553213 m!530365))

(declare-fun m!530369 () Bool)

(assert (=> b!553213 m!530369))

(assert (=> b!553213 m!530363))

(assert (=> b!553213 m!530343))

(declare-fun m!530371 () Bool)

(assert (=> b!553213 m!530371))

(declare-fun m!530373 () Bool)

(assert (=> b!553213 m!530373))

(assert (=> b!553213 m!530365))

(assert (=> b!553213 m!530367))

(check-sat (not b!553213) (not b!553208) (not b!553207) (not b!553211) (not b!553209) (not b!553212) (not b!553210) (not b!553205) (not b!553206) (not start!50652))
(check-sat)
