; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50686 () Bool)

(assert start!50686)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!554222 () Bool)

(declare-datatypes ((array!34911 0))(
  ( (array!34912 (arr!16765 (Array (_ BitVec 32) (_ BitVec 64))) (size!17129 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34911)

(declare-fun e!319602 () Bool)

(declare-datatypes ((SeekEntryResult!5214 0))(
  ( (MissingZero!5214 (index!23083 (_ BitVec 32))) (Found!5214 (index!23084 (_ BitVec 32))) (Intermediate!5214 (undefined!6026 Bool) (index!23085 (_ BitVec 32)) (x!52000 (_ BitVec 32))) (Undefined!5214) (MissingVacant!5214 (index!23086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34911 (_ BitVec 32)) SeekEntryResult!5214)

(assert (=> b!554222 (= e!319602 (= (seekEntryOrOpen!0 (select (arr!16765 a!3118) j!142) a!3118 mask!3119) (Found!5214 j!142)))))

(declare-fun b!554223 () Bool)

(declare-fun res!346640 () Bool)

(declare-fun e!319601 () Bool)

(assert (=> b!554223 (=> (not res!346640) (not e!319601))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554223 (= res!346640 (and (= (size!17129 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17129 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17129 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554224 () Bool)

(declare-fun e!319600 () Bool)

(assert (=> b!554224 (= e!319600 (not true))))

(assert (=> b!554224 e!319602))

(declare-fun res!346642 () Bool)

(assert (=> b!554224 (=> (not res!346642) (not e!319602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34911 (_ BitVec 32)) Bool)

(assert (=> b!554224 (= res!346642 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17202 0))(
  ( (Unit!17203) )
))
(declare-fun lt!251721 () Unit!17202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17202)

(assert (=> b!554224 (= lt!251721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554225 () Bool)

(declare-fun res!346638 () Bool)

(assert (=> b!554225 (=> (not res!346638) (not e!319601))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554225 (= res!346638 (validKeyInArray!0 k0!1914))))

(declare-fun b!554226 () Bool)

(assert (=> b!554226 (= e!319601 e!319600)))

(declare-fun res!346636 () Bool)

(assert (=> b!554226 (=> (not res!346636) (not e!319600))))

(declare-fun lt!251722 () SeekEntryResult!5214)

(assert (=> b!554226 (= res!346636 (or (= lt!251722 (MissingZero!5214 i!1132)) (= lt!251722 (MissingVacant!5214 i!1132))))))

(assert (=> b!554226 (= lt!251722 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554227 () Bool)

(declare-fun res!346643 () Bool)

(assert (=> b!554227 (=> (not res!346643) (not e!319600))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34911 (_ BitVec 32)) SeekEntryResult!5214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554227 (= res!346643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16765 a!3118) j!142) mask!3119) (select (arr!16765 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16765 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16765 a!3118) i!1132 k0!1914) j!142) (array!34912 (store (arr!16765 a!3118) i!1132 k0!1914) (size!17129 a!3118)) mask!3119)))))

(declare-fun b!554229 () Bool)

(declare-fun res!346635 () Bool)

(assert (=> b!554229 (=> (not res!346635) (not e!319601))))

(declare-fun arrayContainsKey!0 (array!34911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554229 (= res!346635 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554230 () Bool)

(declare-fun res!346639 () Bool)

(assert (=> b!554230 (=> (not res!346639) (not e!319600))))

(assert (=> b!554230 (= res!346639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554231 () Bool)

(declare-fun res!346634 () Bool)

(assert (=> b!554231 (=> (not res!346634) (not e!319601))))

(assert (=> b!554231 (= res!346634 (validKeyInArray!0 (select (arr!16765 a!3118) j!142)))))

(declare-fun b!554228 () Bool)

(declare-fun res!346637 () Bool)

(assert (=> b!554228 (=> (not res!346637) (not e!319600))))

(declare-datatypes ((List!10845 0))(
  ( (Nil!10842) (Cons!10841 (h!11826 (_ BitVec 64)) (t!17073 List!10845)) )
))
(declare-fun arrayNoDuplicates!0 (array!34911 (_ BitVec 32) List!10845) Bool)

(assert (=> b!554228 (= res!346637 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10842))))

(declare-fun res!346641 () Bool)

(assert (=> start!50686 (=> (not res!346641) (not e!319601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50686 (= res!346641 (validMask!0 mask!3119))))

(assert (=> start!50686 e!319601))

(assert (=> start!50686 true))

(declare-fun array_inv!12561 (array!34911) Bool)

(assert (=> start!50686 (array_inv!12561 a!3118)))

(assert (= (and start!50686 res!346641) b!554223))

(assert (= (and b!554223 res!346640) b!554231))

(assert (= (and b!554231 res!346634) b!554225))

(assert (= (and b!554225 res!346638) b!554229))

(assert (= (and b!554229 res!346635) b!554226))

(assert (= (and b!554226 res!346636) b!554230))

(assert (= (and b!554230 res!346639) b!554228))

(assert (= (and b!554228 res!346637) b!554227))

(assert (= (and b!554227 res!346643) b!554224))

(assert (= (and b!554224 res!346642) b!554222))

(declare-fun m!531471 () Bool)

(assert (=> b!554229 m!531471))

(declare-fun m!531473 () Bool)

(assert (=> b!554222 m!531473))

(assert (=> b!554222 m!531473))

(declare-fun m!531475 () Bool)

(assert (=> b!554222 m!531475))

(declare-fun m!531477 () Bool)

(assert (=> b!554226 m!531477))

(assert (=> b!554227 m!531473))

(declare-fun m!531479 () Bool)

(assert (=> b!554227 m!531479))

(assert (=> b!554227 m!531473))

(declare-fun m!531481 () Bool)

(assert (=> b!554227 m!531481))

(declare-fun m!531483 () Bool)

(assert (=> b!554227 m!531483))

(assert (=> b!554227 m!531481))

(declare-fun m!531485 () Bool)

(assert (=> b!554227 m!531485))

(assert (=> b!554227 m!531479))

(assert (=> b!554227 m!531473))

(declare-fun m!531487 () Bool)

(assert (=> b!554227 m!531487))

(declare-fun m!531489 () Bool)

(assert (=> b!554227 m!531489))

(assert (=> b!554227 m!531481))

(assert (=> b!554227 m!531483))

(declare-fun m!531491 () Bool)

(assert (=> b!554230 m!531491))

(declare-fun m!531493 () Bool)

(assert (=> b!554224 m!531493))

(declare-fun m!531495 () Bool)

(assert (=> b!554224 m!531495))

(declare-fun m!531497 () Bool)

(assert (=> start!50686 m!531497))

(declare-fun m!531499 () Bool)

(assert (=> start!50686 m!531499))

(declare-fun m!531501 () Bool)

(assert (=> b!554228 m!531501))

(declare-fun m!531503 () Bool)

(assert (=> b!554225 m!531503))

(assert (=> b!554231 m!531473))

(assert (=> b!554231 m!531473))

(declare-fun m!531505 () Bool)

(assert (=> b!554231 m!531505))

(check-sat (not b!554229) (not b!554224) (not start!50686) (not b!554222) (not b!554231) (not b!554227) (not b!554228) (not b!554230) (not b!554226) (not b!554225))
(check-sat)
