; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49726 () Bool)

(assert start!49726)

(declare-fun res!340343 () Bool)

(declare-fun e!315933 () Bool)

(assert (=> start!49726 (=> (not res!340343) (not e!315933))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49726 (= res!340343 (validMask!0 mask!3119))))

(assert (=> start!49726 e!315933))

(assert (=> start!49726 true))

(declare-datatypes ((array!34464 0))(
  ( (array!34465 (arr!16558 (Array (_ BitVec 32) (_ BitVec 64))) (size!16922 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34464)

(declare-fun array_inv!12354 (array!34464) Bool)

(assert (=> start!49726 (array_inv!12354 a!3118)))

(declare-fun b!546628 () Bool)

(declare-fun res!340342 () Bool)

(assert (=> b!546628 (=> (not res!340342) (not e!315933))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546628 (= res!340342 (validKeyInArray!0 (select (arr!16558 a!3118) j!142)))))

(declare-fun b!546629 () Bool)

(assert (=> b!546629 (= e!315933 false)))

(declare-datatypes ((SeekEntryResult!5007 0))(
  ( (MissingZero!5007 (index!22255 (_ BitVec 32))) (Found!5007 (index!22256 (_ BitVec 32))) (Intermediate!5007 (undefined!5819 Bool) (index!22257 (_ BitVec 32)) (x!51211 (_ BitVec 32))) (Undefined!5007) (MissingVacant!5007 (index!22258 (_ BitVec 32))) )
))
(declare-fun lt!249343 () SeekEntryResult!5007)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34464 (_ BitVec 32)) SeekEntryResult!5007)

(assert (=> b!546629 (= lt!249343 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546630 () Bool)

(declare-fun res!340344 () Bool)

(assert (=> b!546630 (=> (not res!340344) (not e!315933))))

(declare-fun arrayContainsKey!0 (array!34464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546630 (= res!340344 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546631 () Bool)

(declare-fun res!340346 () Bool)

(assert (=> b!546631 (=> (not res!340346) (not e!315933))))

(assert (=> b!546631 (= res!340346 (validKeyInArray!0 k0!1914))))

(declare-fun b!546632 () Bool)

(declare-fun res!340345 () Bool)

(assert (=> b!546632 (=> (not res!340345) (not e!315933))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546632 (= res!340345 (and (= (size!16922 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16922 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16922 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49726 res!340343) b!546632))

(assert (= (and b!546632 res!340345) b!546628))

(assert (= (and b!546628 res!340342) b!546631))

(assert (= (and b!546631 res!340346) b!546630))

(assert (= (and b!546630 res!340344) b!546629))

(declare-fun m!524039 () Bool)

(assert (=> b!546629 m!524039))

(declare-fun m!524041 () Bool)

(assert (=> b!546631 m!524041))

(declare-fun m!524043 () Bool)

(assert (=> start!49726 m!524043))

(declare-fun m!524045 () Bool)

(assert (=> start!49726 m!524045))

(declare-fun m!524047 () Bool)

(assert (=> b!546628 m!524047))

(assert (=> b!546628 m!524047))

(declare-fun m!524049 () Bool)

(assert (=> b!546628 m!524049))

(declare-fun m!524051 () Bool)

(assert (=> b!546630 m!524051))

(check-sat (not b!546631) (not b!546630) (not start!49726) (not b!546628) (not b!546629))
