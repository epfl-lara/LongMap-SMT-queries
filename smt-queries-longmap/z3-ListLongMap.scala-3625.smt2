; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49976 () Bool)

(assert start!49976)

(declare-fun b!547830 () Bool)

(declare-fun res!341387 () Bool)

(declare-fun e!316509 () Bool)

(assert (=> b!547830 (=> (not res!341387) (not e!316509))))

(declare-datatypes ((array!34567 0))(
  ( (array!34568 (arr!16604 (Array (_ BitVec 32) (_ BitVec 64))) (size!16969 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34567)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547830 (= res!341387 (validKeyInArray!0 (select (arr!16604 a!3118) j!142)))))

(declare-fun b!547831 () Bool)

(declare-fun res!341382 () Bool)

(assert (=> b!547831 (=> (not res!341382) (not e!316509))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!547831 (= res!341382 (validKeyInArray!0 k0!1914))))

(declare-fun b!547832 () Bool)

(declare-fun e!316508 () Bool)

(assert (=> b!547832 (= e!316508 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!249489 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!547832 (= lt!249489 (toIndex!0 (select (arr!16604 a!3118) j!142) mask!3119))))

(declare-fun res!341386 () Bool)

(assert (=> start!49976 (=> (not res!341386) (not e!316509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49976 (= res!341386 (validMask!0 mask!3119))))

(assert (=> start!49976 e!316509))

(assert (=> start!49976 true))

(declare-fun array_inv!12487 (array!34567) Bool)

(assert (=> start!49976 (array_inv!12487 a!3118)))

(declare-fun b!547833 () Bool)

(declare-fun res!341385 () Bool)

(assert (=> b!547833 (=> (not res!341385) (not e!316508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34567 (_ BitVec 32)) Bool)

(assert (=> b!547833 (= res!341385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547834 () Bool)

(declare-fun res!341381 () Bool)

(assert (=> b!547834 (=> (not res!341381) (not e!316509))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547834 (= res!341381 (and (= (size!16969 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16969 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16969 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547835 () Bool)

(declare-fun res!341384 () Bool)

(assert (=> b!547835 (=> (not res!341384) (not e!316508))))

(declare-datatypes ((List!10723 0))(
  ( (Nil!10720) (Cons!10719 (h!11686 (_ BitVec 64)) (t!16942 List!10723)) )
))
(declare-fun arrayNoDuplicates!0 (array!34567 (_ BitVec 32) List!10723) Bool)

(assert (=> b!547835 (= res!341384 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10720))))

(declare-fun b!547836 () Bool)

(declare-fun res!341383 () Bool)

(assert (=> b!547836 (=> (not res!341383) (not e!316509))))

(declare-fun arrayContainsKey!0 (array!34567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547836 (= res!341383 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547837 () Bool)

(assert (=> b!547837 (= e!316509 e!316508)))

(declare-fun res!341380 () Bool)

(assert (=> b!547837 (=> (not res!341380) (not e!316508))))

(declare-datatypes ((SeekEntryResult!5050 0))(
  ( (MissingZero!5050 (index!22427 (_ BitVec 32))) (Found!5050 (index!22428 (_ BitVec 32))) (Intermediate!5050 (undefined!5862 Bool) (index!22429 (_ BitVec 32)) (x!51377 (_ BitVec 32))) (Undefined!5050) (MissingVacant!5050 (index!22430 (_ BitVec 32))) )
))
(declare-fun lt!249490 () SeekEntryResult!5050)

(assert (=> b!547837 (= res!341380 (or (= lt!249490 (MissingZero!5050 i!1132)) (= lt!249490 (MissingVacant!5050 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34567 (_ BitVec 32)) SeekEntryResult!5050)

(assert (=> b!547837 (= lt!249490 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!49976 res!341386) b!547834))

(assert (= (and b!547834 res!341381) b!547830))

(assert (= (and b!547830 res!341387) b!547831))

(assert (= (and b!547831 res!341382) b!547836))

(assert (= (and b!547836 res!341383) b!547837))

(assert (= (and b!547837 res!341380) b!547833))

(assert (= (and b!547833 res!341385) b!547835))

(assert (= (and b!547835 res!341384) b!547832))

(declare-fun m!524435 () Bool)

(assert (=> b!547837 m!524435))

(declare-fun m!524437 () Bool)

(assert (=> start!49976 m!524437))

(declare-fun m!524439 () Bool)

(assert (=> start!49976 m!524439))

(declare-fun m!524441 () Bool)

(assert (=> b!547836 m!524441))

(declare-fun m!524443 () Bool)

(assert (=> b!547830 m!524443))

(assert (=> b!547830 m!524443))

(declare-fun m!524445 () Bool)

(assert (=> b!547830 m!524445))

(declare-fun m!524447 () Bool)

(assert (=> b!547831 m!524447))

(declare-fun m!524449 () Bool)

(assert (=> b!547833 m!524449))

(assert (=> b!547832 m!524443))

(assert (=> b!547832 m!524443))

(declare-fun m!524451 () Bool)

(assert (=> b!547832 m!524451))

(declare-fun m!524453 () Bool)

(assert (=> b!547835 m!524453))

(check-sat (not b!547835) (not b!547830) (not b!547831) (not start!49976) (not b!547837) (not b!547832) (not b!547833) (not b!547836))
(check-sat)
