; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49720 () Bool)

(assert start!49720)

(declare-fun b!546583 () Bool)

(declare-fun res!340298 () Bool)

(declare-fun e!315914 () Bool)

(assert (=> b!546583 (=> (not res!340298) (not e!315914))))

(declare-datatypes ((array!34458 0))(
  ( (array!34459 (arr!16555 (Array (_ BitVec 32) (_ BitVec 64))) (size!16919 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34458)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546583 (= res!340298 (validKeyInArray!0 (select (arr!16555 a!3118) j!142)))))

(declare-fun b!546584 () Bool)

(declare-fun res!340301 () Bool)

(assert (=> b!546584 (=> (not res!340301) (not e!315914))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546584 (= res!340301 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340299 () Bool)

(assert (=> start!49720 (=> (not res!340299) (not e!315914))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49720 (= res!340299 (validMask!0 mask!3119))))

(assert (=> start!49720 e!315914))

(assert (=> start!49720 true))

(declare-fun array_inv!12351 (array!34458) Bool)

(assert (=> start!49720 (array_inv!12351 a!3118)))

(declare-fun b!546585 () Bool)

(declare-fun res!340300 () Bool)

(assert (=> b!546585 (=> (not res!340300) (not e!315914))))

(assert (=> b!546585 (= res!340300 (validKeyInArray!0 k0!1914))))

(declare-fun b!546586 () Bool)

(assert (=> b!546586 (= e!315914 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546587 () Bool)

(declare-fun res!340297 () Bool)

(assert (=> b!546587 (=> (not res!340297) (not e!315914))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546587 (= res!340297 (and (= (size!16919 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16919 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16919 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49720 res!340299) b!546587))

(assert (= (and b!546587 res!340297) b!546583))

(assert (= (and b!546583 res!340298) b!546585))

(assert (= (and b!546585 res!340300) b!546584))

(assert (= (and b!546584 res!340301) b!546586))

(declare-fun m!524001 () Bool)

(assert (=> b!546583 m!524001))

(assert (=> b!546583 m!524001))

(declare-fun m!524003 () Bool)

(assert (=> b!546583 m!524003))

(declare-fun m!524005 () Bool)

(assert (=> b!546584 m!524005))

(declare-fun m!524007 () Bool)

(assert (=> start!49720 m!524007))

(declare-fun m!524009 () Bool)

(assert (=> start!49720 m!524009))

(declare-fun m!524011 () Bool)

(assert (=> b!546585 m!524011))

(check-sat (not start!49720) (not b!546583) (not b!546585) (not b!546584))
(check-sat)
