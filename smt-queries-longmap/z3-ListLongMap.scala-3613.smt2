; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49750 () Bool)

(assert start!49750)

(declare-fun res!340533 () Bool)

(declare-fun e!316005 () Bool)

(assert (=> start!49750 (=> (not res!340533) (not e!316005))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49750 (= res!340533 (validMask!0 mask!3119))))

(assert (=> start!49750 e!316005))

(assert (=> start!49750 true))

(declare-datatypes ((array!34488 0))(
  ( (array!34489 (arr!16570 (Array (_ BitVec 32) (_ BitVec 64))) (size!16934 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34488)

(declare-fun array_inv!12366 (array!34488) Bool)

(assert (=> start!49750 (array_inv!12366 a!3118)))

(declare-fun b!546817 () Bool)

(declare-fun res!340534 () Bool)

(assert (=> b!546817 (=> (not res!340534) (not e!316005))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546817 (= res!340534 (validKeyInArray!0 (select (arr!16570 a!3118) j!142)))))

(declare-fun b!546818 () Bool)

(assert (=> b!546818 (= e!316005 false)))

(declare-datatypes ((SeekEntryResult!5019 0))(
  ( (MissingZero!5019 (index!22303 (_ BitVec 32))) (Found!5019 (index!22304 (_ BitVec 32))) (Intermediate!5019 (undefined!5831 Bool) (index!22305 (_ BitVec 32)) (x!51255 (_ BitVec 32))) (Undefined!5019) (MissingVacant!5019 (index!22306 (_ BitVec 32))) )
))
(declare-fun lt!249370 () SeekEntryResult!5019)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34488 (_ BitVec 32)) SeekEntryResult!5019)

(assert (=> b!546818 (= lt!249370 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546819 () Bool)

(declare-fun res!340532 () Bool)

(assert (=> b!546819 (=> (not res!340532) (not e!316005))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546819 (= res!340532 (and (= (size!16934 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16934 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16934 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546820 () Bool)

(declare-fun res!340531 () Bool)

(assert (=> b!546820 (=> (not res!340531) (not e!316005))))

(declare-fun arrayContainsKey!0 (array!34488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546820 (= res!340531 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546821 () Bool)

(declare-fun res!340535 () Bool)

(assert (=> b!546821 (=> (not res!340535) (not e!316005))))

(assert (=> b!546821 (= res!340535 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49750 res!340533) b!546819))

(assert (= (and b!546819 res!340532) b!546817))

(assert (= (and b!546817 res!340534) b!546821))

(assert (= (and b!546821 res!340535) b!546820))

(assert (= (and b!546820 res!340531) b!546818))

(declare-fun m!524207 () Bool)

(assert (=> b!546821 m!524207))

(declare-fun m!524209 () Bool)

(assert (=> b!546817 m!524209))

(assert (=> b!546817 m!524209))

(declare-fun m!524211 () Bool)

(assert (=> b!546817 m!524211))

(declare-fun m!524213 () Bool)

(assert (=> start!49750 m!524213))

(declare-fun m!524215 () Bool)

(assert (=> start!49750 m!524215))

(declare-fun m!524217 () Bool)

(assert (=> b!546820 m!524217))

(declare-fun m!524219 () Bool)

(assert (=> b!546818 m!524219))

(check-sat (not b!546818) (not b!546821) (not b!546820) (not b!546817) (not start!49750))
