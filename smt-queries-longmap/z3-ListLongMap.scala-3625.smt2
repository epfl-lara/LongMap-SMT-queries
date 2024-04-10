; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49990 () Bool)

(assert start!49990)

(declare-fun b!548125 () Bool)

(declare-fun res!341538 () Bool)

(declare-fun e!316692 () Bool)

(assert (=> b!548125 (=> (not res!341538) (not e!316692))))

(declare-datatypes ((array!34572 0))(
  ( (array!34573 (arr!16606 (Array (_ BitVec 32) (_ BitVec 64))) (size!16970 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34572)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548125 (= res!341538 (validKeyInArray!0 (select (arr!16606 a!3118) j!142)))))

(declare-fun res!341537 () Bool)

(assert (=> start!49990 (=> (not res!341537) (not e!316692))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49990 (= res!341537 (validMask!0 mask!3119))))

(assert (=> start!49990 e!316692))

(assert (=> start!49990 true))

(declare-fun array_inv!12402 (array!34572) Bool)

(assert (=> start!49990 (array_inv!12402 a!3118)))

(declare-fun b!548126 () Bool)

(declare-fun res!341536 () Bool)

(declare-fun e!316690 () Bool)

(assert (=> b!548126 (=> (not res!341536) (not e!316690))))

(declare-datatypes ((List!10686 0))(
  ( (Nil!10683) (Cons!10682 (h!11649 (_ BitVec 64)) (t!16914 List!10686)) )
))
(declare-fun arrayNoDuplicates!0 (array!34572 (_ BitVec 32) List!10686) Bool)

(assert (=> b!548126 (= res!341536 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10683))))

(declare-fun b!548127 () Bool)

(assert (=> b!548127 (= e!316690 false)))

(declare-fun lt!249730 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548127 (= lt!249730 (toIndex!0 (select (arr!16606 a!3118) j!142) mask!3119))))

(declare-fun b!548128 () Bool)

(declare-fun res!341540 () Bool)

(assert (=> b!548128 (=> (not res!341540) (not e!316692))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!548128 (= res!341540 (validKeyInArray!0 k0!1914))))

(declare-fun b!548129 () Bool)

(assert (=> b!548129 (= e!316692 e!316690)))

(declare-fun res!341534 () Bool)

(assert (=> b!548129 (=> (not res!341534) (not e!316690))))

(declare-datatypes ((SeekEntryResult!5055 0))(
  ( (MissingZero!5055 (index!22447 (_ BitVec 32))) (Found!5055 (index!22448 (_ BitVec 32))) (Intermediate!5055 (undefined!5867 Bool) (index!22449 (_ BitVec 32)) (x!51387 (_ BitVec 32))) (Undefined!5055) (MissingVacant!5055 (index!22450 (_ BitVec 32))) )
))
(declare-fun lt!249729 () SeekEntryResult!5055)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548129 (= res!341534 (or (= lt!249729 (MissingZero!5055 i!1132)) (= lt!249729 (MissingVacant!5055 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34572 (_ BitVec 32)) SeekEntryResult!5055)

(assert (=> b!548129 (= lt!249729 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548130 () Bool)

(declare-fun res!341539 () Bool)

(assert (=> b!548130 (=> (not res!341539) (not e!316692))))

(assert (=> b!548130 (= res!341539 (and (= (size!16970 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16970 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16970 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548131 () Bool)

(declare-fun res!341535 () Bool)

(assert (=> b!548131 (=> (not res!341535) (not e!316690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34572 (_ BitVec 32)) Bool)

(assert (=> b!548131 (= res!341535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548132 () Bool)

(declare-fun res!341533 () Bool)

(assert (=> b!548132 (=> (not res!341533) (not e!316692))))

(declare-fun arrayContainsKey!0 (array!34572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548132 (= res!341533 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49990 res!341537) b!548130))

(assert (= (and b!548130 res!341539) b!548125))

(assert (= (and b!548125 res!341538) b!548128))

(assert (= (and b!548128 res!341540) b!548132))

(assert (= (and b!548132 res!341533) b!548129))

(assert (= (and b!548129 res!341534) b!548131))

(assert (= (and b!548131 res!341535) b!548126))

(assert (= (and b!548126 res!341536) b!548127))

(declare-fun m!525227 () Bool)

(assert (=> b!548128 m!525227))

(declare-fun m!525229 () Bool)

(assert (=> b!548125 m!525229))

(assert (=> b!548125 m!525229))

(declare-fun m!525231 () Bool)

(assert (=> b!548125 m!525231))

(declare-fun m!525233 () Bool)

(assert (=> start!49990 m!525233))

(declare-fun m!525235 () Bool)

(assert (=> start!49990 m!525235))

(declare-fun m!525237 () Bool)

(assert (=> b!548131 m!525237))

(assert (=> b!548127 m!525229))

(assert (=> b!548127 m!525229))

(declare-fun m!525239 () Bool)

(assert (=> b!548127 m!525239))

(declare-fun m!525241 () Bool)

(assert (=> b!548129 m!525241))

(declare-fun m!525243 () Bool)

(assert (=> b!548132 m!525243))

(declare-fun m!525245 () Bool)

(assert (=> b!548126 m!525245))

(check-sat (not b!548128) (not b!548126) (not b!548127) (not start!49990) (not b!548132) (not b!548131) (not b!548129) (not b!548125))
(check-sat)
