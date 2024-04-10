; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49732 () Bool)

(assert start!49732)

(declare-fun b!546678 () Bool)

(declare-fun res!340397 () Bool)

(declare-fun e!315951 () Bool)

(assert (=> b!546678 (=> (not res!340397) (not e!315951))))

(declare-datatypes ((array!34470 0))(
  ( (array!34471 (arr!16561 (Array (_ BitVec 32) (_ BitVec 64))) (size!16925 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34470)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546678 (= res!340397 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546679 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546679 (= e!315951 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun res!340394 () Bool)

(assert (=> start!49732 (=> (not res!340394) (not e!315951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49732 (= res!340394 (validMask!0 mask!3119))))

(assert (=> start!49732 e!315951))

(assert (=> start!49732 true))

(declare-fun array_inv!12357 (array!34470) Bool)

(assert (=> start!49732 (array_inv!12357 a!3118)))

(declare-fun b!546680 () Bool)

(declare-fun res!340393 () Bool)

(assert (=> b!546680 (=> (not res!340393) (not e!315951))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5010 0))(
  ( (MissingZero!5010 (index!22267 (_ BitVec 32))) (Found!5010 (index!22268 (_ BitVec 32))) (Intermediate!5010 (undefined!5822 Bool) (index!22269 (_ BitVec 32)) (x!51222 (_ BitVec 32))) (Undefined!5010) (MissingVacant!5010 (index!22270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34470 (_ BitVec 32)) SeekEntryResult!5010)

(assert (=> b!546680 (= res!340393 (not (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) (MissingZero!5010 i!1132))))))

(declare-fun b!546681 () Bool)

(declare-fun res!340396 () Bool)

(assert (=> b!546681 (=> (not res!340396) (not e!315951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546681 (= res!340396 (validKeyInArray!0 k0!1914))))

(declare-fun b!546682 () Bool)

(declare-fun res!340395 () Bool)

(assert (=> b!546682 (=> (not res!340395) (not e!315951))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546682 (= res!340395 (and (= (size!16925 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16925 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16925 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546683 () Bool)

(declare-fun res!340392 () Bool)

(assert (=> b!546683 (=> (not res!340392) (not e!315951))))

(assert (=> b!546683 (= res!340392 (validKeyInArray!0 (select (arr!16561 a!3118) j!142)))))

(assert (= (and start!49732 res!340394) b!546682))

(assert (= (and b!546682 res!340395) b!546683))

(assert (= (and b!546683 res!340392) b!546681))

(assert (= (and b!546681 res!340396) b!546678))

(assert (= (and b!546678 res!340397) b!546680))

(assert (= (and b!546680 res!340393) b!546679))

(declare-fun m!524081 () Bool)

(assert (=> b!546680 m!524081))

(declare-fun m!524083 () Bool)

(assert (=> b!546678 m!524083))

(declare-fun m!524085 () Bool)

(assert (=> b!546681 m!524085))

(declare-fun m!524087 () Bool)

(assert (=> start!49732 m!524087))

(declare-fun m!524089 () Bool)

(assert (=> start!49732 m!524089))

(declare-fun m!524091 () Bool)

(assert (=> b!546683 m!524091))

(assert (=> b!546683 m!524091))

(declare-fun m!524093 () Bool)

(assert (=> b!546683 m!524093))

(check-sat (not b!546678) (not start!49732) (not b!546683) (not b!546681) (not b!546680))
(check-sat)
