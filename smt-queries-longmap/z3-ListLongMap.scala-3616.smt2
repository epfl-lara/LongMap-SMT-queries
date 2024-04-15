; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49754 () Bool)

(assert start!49754)

(declare-fun b!546666 () Bool)

(declare-fun res!340523 () Bool)

(declare-fun e!315878 () Bool)

(assert (=> b!546666 (=> (not res!340523) (not e!315878))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546666 (= res!340523 (validKeyInArray!0 k0!1914))))

(declare-fun b!546667 () Bool)

(declare-fun res!340526 () Bool)

(assert (=> b!546667 (=> (not res!340526) (not e!315878))))

(declare-datatypes ((array!34501 0))(
  ( (array!34502 (arr!16577 (Array (_ BitVec 32) (_ BitVec 64))) (size!16942 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34501)

(declare-fun arrayContainsKey!0 (array!34501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546667 (= res!340526 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340525 () Bool)

(assert (=> start!49754 (=> (not res!340525) (not e!315878))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49754 (= res!340525 (validMask!0 mask!3119))))

(assert (=> start!49754 e!315878))

(assert (=> start!49754 true))

(declare-fun array_inv!12460 (array!34501) Bool)

(assert (=> start!49754 (array_inv!12460 a!3118)))

(declare-fun b!546668 () Bool)

(declare-datatypes ((SeekEntryResult!5023 0))(
  ( (MissingZero!5023 (index!22319 (_ BitVec 32))) (Found!5023 (index!22320 (_ BitVec 32))) (Intermediate!5023 (undefined!5835 Bool) (index!22321 (_ BitVec 32)) (x!51278 (_ BitVec 32))) (Undefined!5023) (MissingVacant!5023 (index!22322 (_ BitVec 32))) )
))
(declare-fun lt!249160 () SeekEntryResult!5023)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546668 (= e!315878 (and (or (= lt!249160 (MissingZero!5023 i!1132)) (= lt!249160 (MissingVacant!5023 i!1132))) (bvsgt #b00000000000000000000000000000000 (size!16942 a!3118))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34501 (_ BitVec 32)) SeekEntryResult!5023)

(assert (=> b!546668 (= lt!249160 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!546669 () Bool)

(declare-fun res!340522 () Bool)

(assert (=> b!546669 (=> (not res!340522) (not e!315878))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546669 (= res!340522 (and (= (size!16942 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16942 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16942 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546670 () Bool)

(declare-fun res!340524 () Bool)

(assert (=> b!546670 (=> (not res!340524) (not e!315878))))

(assert (=> b!546670 (= res!340524 (validKeyInArray!0 (select (arr!16577 a!3118) j!142)))))

(assert (= (and start!49754 res!340525) b!546669))

(assert (= (and b!546669 res!340522) b!546670))

(assert (= (and b!546670 res!340524) b!546666))

(assert (= (and b!546666 res!340523) b!546667))

(assert (= (and b!546667 res!340526) b!546668))

(declare-fun m!523567 () Bool)

(assert (=> b!546666 m!523567))

(declare-fun m!523569 () Bool)

(assert (=> b!546668 m!523569))

(declare-fun m!523571 () Bool)

(assert (=> b!546667 m!523571))

(declare-fun m!523573 () Bool)

(assert (=> start!49754 m!523573))

(declare-fun m!523575 () Bool)

(assert (=> start!49754 m!523575))

(declare-fun m!523577 () Bool)

(assert (=> b!546670 m!523577))

(assert (=> b!546670 m!523577))

(declare-fun m!523579 () Bool)

(assert (=> b!546670 m!523579))

(check-sat (not b!546666) (not start!49754) (not b!546670) (not b!546668) (not b!546667))
(check-sat)
