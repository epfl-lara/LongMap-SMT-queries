; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49978 () Bool)

(assert start!49978)

(declare-fun b!547982 () Bool)

(declare-fun e!316637 () Bool)

(assert (=> b!547982 (= e!316637 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249694 () (_ BitVec 32))

(declare-datatypes ((array!34560 0))(
  ( (array!34561 (arr!16600 (Array (_ BitVec 32) (_ BitVec 64))) (size!16964 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547982 (= lt!249694 (toIndex!0 (select (arr!16600 a!3118) j!142) mask!3119))))

(declare-fun res!341390 () Bool)

(declare-fun e!316636 () Bool)

(assert (=> start!49978 (=> (not res!341390) (not e!316636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49978 (= res!341390 (validMask!0 mask!3119))))

(assert (=> start!49978 e!316636))

(assert (=> start!49978 true))

(declare-fun array_inv!12396 (array!34560) Bool)

(assert (=> start!49978 (array_inv!12396 a!3118)))

(declare-fun b!547981 () Bool)

(declare-fun res!341389 () Bool)

(assert (=> b!547981 (=> (not res!341389) (not e!316636))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547981 (= res!341389 (and (= (size!16964 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16964 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16964 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547983 () Bool)

(declare-fun res!341392 () Bool)

(assert (=> b!547983 (=> (not res!341392) (not e!316636))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547983 (= res!341392 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547984 () Bool)

(declare-fun res!341395 () Bool)

(assert (=> b!547984 (=> (not res!341395) (not e!316636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547984 (= res!341395 (validKeyInArray!0 k0!1914))))

(declare-fun b!547985 () Bool)

(assert (=> b!547985 (= e!316636 e!316637)))

(declare-fun res!341396 () Bool)

(assert (=> b!547985 (=> (not res!341396) (not e!316637))))

(declare-datatypes ((SeekEntryResult!5049 0))(
  ( (MissingZero!5049 (index!22423 (_ BitVec 32))) (Found!5049 (index!22424 (_ BitVec 32))) (Intermediate!5049 (undefined!5861 Bool) (index!22425 (_ BitVec 32)) (x!51365 (_ BitVec 32))) (Undefined!5049) (MissingVacant!5049 (index!22426 (_ BitVec 32))) )
))
(declare-fun lt!249693 () SeekEntryResult!5049)

(assert (=> b!547985 (= res!341396 (or (= lt!249693 (MissingZero!5049 i!1132)) (= lt!249693 (MissingVacant!5049 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34560 (_ BitVec 32)) SeekEntryResult!5049)

(assert (=> b!547985 (= lt!249693 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547986 () Bool)

(declare-fun res!341394 () Bool)

(assert (=> b!547986 (=> (not res!341394) (not e!316637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34560 (_ BitVec 32)) Bool)

(assert (=> b!547986 (= res!341394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547987 () Bool)

(declare-fun res!341391 () Bool)

(assert (=> b!547987 (=> (not res!341391) (not e!316637))))

(declare-datatypes ((List!10680 0))(
  ( (Nil!10677) (Cons!10676 (h!11643 (_ BitVec 64)) (t!16908 List!10680)) )
))
(declare-fun arrayNoDuplicates!0 (array!34560 (_ BitVec 32) List!10680) Bool)

(assert (=> b!547987 (= res!341391 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10677))))

(declare-fun b!547988 () Bool)

(declare-fun res!341393 () Bool)

(assert (=> b!547988 (=> (not res!341393) (not e!316636))))

(assert (=> b!547988 (= res!341393 (validKeyInArray!0 (select (arr!16600 a!3118) j!142)))))

(assert (= (and start!49978 res!341390) b!547981))

(assert (= (and b!547981 res!341389) b!547988))

(assert (= (and b!547988 res!341393) b!547984))

(assert (= (and b!547984 res!341395) b!547983))

(assert (= (and b!547983 res!341392) b!547985))

(assert (= (and b!547985 res!341396) b!547986))

(assert (= (and b!547986 res!341394) b!547987))

(assert (= (and b!547987 res!341391) b!547982))

(declare-fun m!525107 () Bool)

(assert (=> b!547988 m!525107))

(assert (=> b!547988 m!525107))

(declare-fun m!525109 () Bool)

(assert (=> b!547988 m!525109))

(declare-fun m!525111 () Bool)

(assert (=> b!547986 m!525111))

(assert (=> b!547982 m!525107))

(assert (=> b!547982 m!525107))

(declare-fun m!525113 () Bool)

(assert (=> b!547982 m!525113))

(declare-fun m!525115 () Bool)

(assert (=> start!49978 m!525115))

(declare-fun m!525117 () Bool)

(assert (=> start!49978 m!525117))

(declare-fun m!525119 () Bool)

(assert (=> b!547987 m!525119))

(declare-fun m!525121 () Bool)

(assert (=> b!547983 m!525121))

(declare-fun m!525123 () Bool)

(assert (=> b!547985 m!525123))

(declare-fun m!525125 () Bool)

(assert (=> b!547984 m!525125))

(check-sat (not b!547984) (not b!547987) (not b!547988) (not b!547982) (not b!547986) (not b!547985) (not b!547983) (not start!49978))
(check-sat)
