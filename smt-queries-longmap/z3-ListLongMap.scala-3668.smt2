; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50626 () Bool)

(assert start!50626)

(declare-fun b!553304 () Bool)

(declare-fun e!319187 () Bool)

(declare-fun e!319186 () Bool)

(assert (=> b!553304 (= e!319187 e!319186)))

(declare-fun res!345717 () Bool)

(assert (=> b!553304 (=> (not res!345717) (not e!319186))))

(declare-datatypes ((SeekEntryResult!5184 0))(
  ( (MissingZero!5184 (index!22963 (_ BitVec 32))) (Found!5184 (index!22964 (_ BitVec 32))) (Intermediate!5184 (undefined!5996 Bool) (index!22965 (_ BitVec 32)) (x!51890 (_ BitVec 32))) (Undefined!5184) (MissingVacant!5184 (index!22966 (_ BitVec 32))) )
))
(declare-fun lt!251434 () SeekEntryResult!5184)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553304 (= res!345717 (or (= lt!251434 (MissingZero!5184 i!1132)) (= lt!251434 (MissingVacant!5184 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34851 0))(
  ( (array!34852 (arr!16735 (Array (_ BitVec 32) (_ BitVec 64))) (size!17099 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34851)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34851 (_ BitVec 32)) SeekEntryResult!5184)

(assert (=> b!553304 (= lt!251434 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553305 () Bool)

(declare-fun res!345722 () Bool)

(assert (=> b!553305 (=> (not res!345722) (not e!319187))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553305 (= res!345722 (validKeyInArray!0 (select (arr!16735 a!3118) j!142)))))

(declare-fun b!553306 () Bool)

(assert (=> b!553306 (= e!319186 (not true))))

(declare-fun e!319185 () Bool)

(assert (=> b!553306 e!319185))

(declare-fun res!345718 () Bool)

(assert (=> b!553306 (=> (not res!345718) (not e!319185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34851 (_ BitVec 32)) Bool)

(assert (=> b!553306 (= res!345718 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17142 0))(
  ( (Unit!17143) )
))
(declare-fun lt!251433 () Unit!17142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> b!553306 (= lt!251433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553307 () Bool)

(declare-fun res!345720 () Bool)

(assert (=> b!553307 (=> (not res!345720) (not e!319187))))

(declare-fun arrayContainsKey!0 (array!34851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553307 (= res!345720 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553308 () Bool)

(declare-fun res!345724 () Bool)

(assert (=> b!553308 (=> (not res!345724) (not e!319186))))

(assert (=> b!553308 (= res!345724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553309 () Bool)

(declare-fun res!345719 () Bool)

(assert (=> b!553309 (=> (not res!345719) (not e!319187))))

(assert (=> b!553309 (= res!345719 (and (= (size!17099 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17099 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17099 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553310 () Bool)

(assert (=> b!553310 (= e!319185 (= (seekEntryOrOpen!0 (select (arr!16735 a!3118) j!142) a!3118 mask!3119) (Found!5184 j!142)))))

(declare-fun b!553312 () Bool)

(declare-fun res!345716 () Bool)

(assert (=> b!553312 (=> (not res!345716) (not e!319187))))

(assert (=> b!553312 (= res!345716 (validKeyInArray!0 k0!1914))))

(declare-fun b!553313 () Bool)

(declare-fun res!345721 () Bool)

(assert (=> b!553313 (=> (not res!345721) (not e!319186))))

(declare-datatypes ((List!10815 0))(
  ( (Nil!10812) (Cons!10811 (h!11796 (_ BitVec 64)) (t!17043 List!10815)) )
))
(declare-fun arrayNoDuplicates!0 (array!34851 (_ BitVec 32) List!10815) Bool)

(assert (=> b!553313 (= res!345721 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10812))))

(declare-fun b!553311 () Bool)

(declare-fun res!345723 () Bool)

(assert (=> b!553311 (=> (not res!345723) (not e!319186))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34851 (_ BitVec 32)) SeekEntryResult!5184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553311 (= res!345723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16735 a!3118) j!142) mask!3119) (select (arr!16735 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16735 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16735 a!3118) i!1132 k0!1914) j!142) (array!34852 (store (arr!16735 a!3118) i!1132 k0!1914) (size!17099 a!3118)) mask!3119)))))

(declare-fun res!345725 () Bool)

(assert (=> start!50626 (=> (not res!345725) (not e!319187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50626 (= res!345725 (validMask!0 mask!3119))))

(assert (=> start!50626 e!319187))

(assert (=> start!50626 true))

(declare-fun array_inv!12531 (array!34851) Bool)

(assert (=> start!50626 (array_inv!12531 a!3118)))

(assert (= (and start!50626 res!345725) b!553309))

(assert (= (and b!553309 res!345719) b!553305))

(assert (= (and b!553305 res!345722) b!553312))

(assert (= (and b!553312 res!345716) b!553307))

(assert (= (and b!553307 res!345720) b!553304))

(assert (= (and b!553304 res!345717) b!553308))

(assert (= (and b!553308 res!345724) b!553313))

(assert (= (and b!553313 res!345721) b!553311))

(assert (= (and b!553311 res!345723) b!553306))

(assert (= (and b!553306 res!345718) b!553310))

(declare-fun m!530361 () Bool)

(assert (=> b!553304 m!530361))

(declare-fun m!530363 () Bool)

(assert (=> start!50626 m!530363))

(declare-fun m!530365 () Bool)

(assert (=> start!50626 m!530365))

(declare-fun m!530367 () Bool)

(assert (=> b!553307 m!530367))

(declare-fun m!530369 () Bool)

(assert (=> b!553308 m!530369))

(declare-fun m!530371 () Bool)

(assert (=> b!553311 m!530371))

(declare-fun m!530373 () Bool)

(assert (=> b!553311 m!530373))

(assert (=> b!553311 m!530371))

(declare-fun m!530375 () Bool)

(assert (=> b!553311 m!530375))

(declare-fun m!530377 () Bool)

(assert (=> b!553311 m!530377))

(assert (=> b!553311 m!530375))

(declare-fun m!530379 () Bool)

(assert (=> b!553311 m!530379))

(assert (=> b!553311 m!530373))

(assert (=> b!553311 m!530371))

(declare-fun m!530381 () Bool)

(assert (=> b!553311 m!530381))

(declare-fun m!530383 () Bool)

(assert (=> b!553311 m!530383))

(assert (=> b!553311 m!530375))

(assert (=> b!553311 m!530377))

(assert (=> b!553310 m!530371))

(assert (=> b!553310 m!530371))

(declare-fun m!530385 () Bool)

(assert (=> b!553310 m!530385))

(declare-fun m!530387 () Bool)

(assert (=> b!553312 m!530387))

(assert (=> b!553305 m!530371))

(assert (=> b!553305 m!530371))

(declare-fun m!530389 () Bool)

(assert (=> b!553305 m!530389))

(declare-fun m!530391 () Bool)

(assert (=> b!553306 m!530391))

(declare-fun m!530393 () Bool)

(assert (=> b!553306 m!530393))

(declare-fun m!530395 () Bool)

(assert (=> b!553313 m!530395))

(check-sat (not b!553305) (not b!553312) (not b!553310) (not b!553313) (not b!553306) (not b!553308) (not b!553307) (not b!553304) (not b!553311) (not start!50626))
(check-sat)
