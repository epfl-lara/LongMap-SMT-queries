; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49738 () Bool)

(assert start!49738)

(declare-fun b!546727 () Bool)

(declare-fun res!340442 () Bool)

(declare-fun e!315969 () Bool)

(assert (=> b!546727 (=> (not res!340442) (not e!315969))))

(declare-datatypes ((array!34476 0))(
  ( (array!34477 (arr!16564 (Array (_ BitVec 32) (_ BitVec 64))) (size!16928 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34476)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546727 (= res!340442 (validKeyInArray!0 (select (arr!16564 a!3118) j!142)))))

(declare-fun res!340445 () Bool)

(assert (=> start!49738 (=> (not res!340445) (not e!315969))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49738 (= res!340445 (validMask!0 mask!3119))))

(assert (=> start!49738 e!315969))

(assert (=> start!49738 true))

(declare-fun array_inv!12360 (array!34476) Bool)

(assert (=> start!49738 (array_inv!12360 a!3118)))

(declare-fun b!546728 () Bool)

(declare-fun res!340444 () Bool)

(assert (=> b!546728 (=> (not res!340444) (not e!315969))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546728 (= res!340444 (validKeyInArray!0 k0!1914))))

(declare-fun b!546729 () Bool)

(assert (=> b!546729 (= e!315969 false)))

(declare-datatypes ((SeekEntryResult!5013 0))(
  ( (MissingZero!5013 (index!22279 (_ BitVec 32))) (Found!5013 (index!22280 (_ BitVec 32))) (Intermediate!5013 (undefined!5825 Bool) (index!22281 (_ BitVec 32)) (x!51233 (_ BitVec 32))) (Undefined!5013) (MissingVacant!5013 (index!22282 (_ BitVec 32))) )
))
(declare-fun lt!249352 () SeekEntryResult!5013)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34476 (_ BitVec 32)) SeekEntryResult!5013)

(assert (=> b!546729 (= lt!249352 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546730 () Bool)

(declare-fun res!340441 () Bool)

(assert (=> b!546730 (=> (not res!340441) (not e!315969))))

(declare-fun arrayContainsKey!0 (array!34476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546730 (= res!340441 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546731 () Bool)

(declare-fun res!340443 () Bool)

(assert (=> b!546731 (=> (not res!340443) (not e!315969))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546731 (= res!340443 (and (= (size!16928 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16928 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16928 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49738 res!340445) b!546731))

(assert (= (and b!546731 res!340443) b!546727))

(assert (= (and b!546727 res!340442) b!546728))

(assert (= (and b!546728 res!340444) b!546730))

(assert (= (and b!546730 res!340441) b!546729))

(declare-fun m!524123 () Bool)

(assert (=> start!49738 m!524123))

(declare-fun m!524125 () Bool)

(assert (=> start!49738 m!524125))

(declare-fun m!524127 () Bool)

(assert (=> b!546727 m!524127))

(assert (=> b!546727 m!524127))

(declare-fun m!524129 () Bool)

(assert (=> b!546727 m!524129))

(declare-fun m!524131 () Bool)

(assert (=> b!546728 m!524131))

(declare-fun m!524133 () Bool)

(assert (=> b!546729 m!524133))

(declare-fun m!524135 () Bool)

(assert (=> b!546730 m!524135))

(check-sat (not b!546728) (not start!49738) (not b!546729) (not b!546727) (not b!546730))
