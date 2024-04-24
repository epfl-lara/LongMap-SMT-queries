; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50030 () Bool)

(assert start!50030)

(declare-fun res!341536 () Bool)

(declare-fun e!316785 () Bool)

(assert (=> start!50030 (=> (not res!341536) (not e!316785))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50030 (= res!341536 (validMask!0 mask!3119))))

(assert (=> start!50030 e!316785))

(assert (=> start!50030 true))

(declare-datatypes ((array!34558 0))(
  ( (array!34559 (arr!16597 (Array (_ BitVec 32) (_ BitVec 64))) (size!16961 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34558)

(declare-fun array_inv!12456 (array!34558) Bool)

(assert (=> start!50030 (array_inv!12456 a!3118)))

(declare-fun b!548229 () Bool)

(declare-fun res!341533 () Bool)

(declare-fun e!316784 () Bool)

(assert (=> b!548229 (=> (not res!341533) (not e!316784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34558 (_ BitVec 32)) Bool)

(assert (=> b!548229 (= res!341533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548230 () Bool)

(declare-fun res!341537 () Bool)

(assert (=> b!548230 (=> (not res!341537) (not e!316785))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548230 (= res!341537 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548231 () Bool)

(declare-fun res!341534 () Bool)

(assert (=> b!548231 (=> (not res!341534) (not e!316785))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548231 (= res!341534 (and (= (size!16961 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16961 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16961 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548232 () Bool)

(assert (=> b!548232 (= e!316784 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!249816 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548232 (= lt!249816 (toIndex!0 (select (arr!16597 a!3118) j!142) mask!3119))))

(declare-fun b!548233 () Bool)

(declare-fun res!341538 () Bool)

(assert (=> b!548233 (=> (not res!341538) (not e!316785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548233 (= res!341538 (validKeyInArray!0 (select (arr!16597 a!3118) j!142)))))

(declare-fun b!548234 () Bool)

(declare-fun res!341539 () Bool)

(assert (=> b!548234 (=> (not res!341539) (not e!316785))))

(assert (=> b!548234 (= res!341539 (validKeyInArray!0 k0!1914))))

(declare-fun b!548235 () Bool)

(assert (=> b!548235 (= e!316785 e!316784)))

(declare-fun res!341532 () Bool)

(assert (=> b!548235 (=> (not res!341532) (not e!316784))))

(declare-datatypes ((SeekEntryResult!5002 0))(
  ( (MissingZero!5002 (index!22235 (_ BitVec 32))) (Found!5002 (index!22236 (_ BitVec 32))) (Intermediate!5002 (undefined!5814 Bool) (index!22237 (_ BitVec 32)) (x!51329 (_ BitVec 32))) (Undefined!5002) (MissingVacant!5002 (index!22238 (_ BitVec 32))) )
))
(declare-fun lt!249817 () SeekEntryResult!5002)

(assert (=> b!548235 (= res!341532 (or (= lt!249817 (MissingZero!5002 i!1132)) (= lt!249817 (MissingVacant!5002 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34558 (_ BitVec 32)) SeekEntryResult!5002)

(assert (=> b!548235 (= lt!249817 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548236 () Bool)

(declare-fun res!341535 () Bool)

(assert (=> b!548236 (=> (not res!341535) (not e!316784))))

(declare-datatypes ((List!10584 0))(
  ( (Nil!10581) (Cons!10580 (h!11550 (_ BitVec 64)) (t!16804 List!10584)) )
))
(declare-fun arrayNoDuplicates!0 (array!34558 (_ BitVec 32) List!10584) Bool)

(assert (=> b!548236 (= res!341535 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10581))))

(assert (= (and start!50030 res!341536) b!548231))

(assert (= (and b!548231 res!341534) b!548233))

(assert (= (and b!548233 res!341538) b!548234))

(assert (= (and b!548234 res!341539) b!548230))

(assert (= (and b!548230 res!341537) b!548235))

(assert (= (and b!548235 res!341532) b!548229))

(assert (= (and b!548229 res!341533) b!548236))

(assert (= (and b!548236 res!341535) b!548232))

(declare-fun m!525499 () Bool)

(assert (=> b!548233 m!525499))

(assert (=> b!548233 m!525499))

(declare-fun m!525501 () Bool)

(assert (=> b!548233 m!525501))

(declare-fun m!525503 () Bool)

(assert (=> b!548230 m!525503))

(declare-fun m!525505 () Bool)

(assert (=> start!50030 m!525505))

(declare-fun m!525507 () Bool)

(assert (=> start!50030 m!525507))

(assert (=> b!548232 m!525499))

(assert (=> b!548232 m!525499))

(declare-fun m!525509 () Bool)

(assert (=> b!548232 m!525509))

(declare-fun m!525511 () Bool)

(assert (=> b!548234 m!525511))

(declare-fun m!525513 () Bool)

(assert (=> b!548236 m!525513))

(declare-fun m!525515 () Bool)

(assert (=> b!548229 m!525515))

(declare-fun m!525517 () Bool)

(assert (=> b!548235 m!525517))

(check-sat (not b!548235) (not b!548230) (not start!50030) (not b!548229) (not b!548234) (not b!548233) (not b!548236) (not b!548232))
(check-sat)
