; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49738 () Bool)

(assert start!49738)

(declare-fun b!546694 () Bool)

(declare-fun res!340304 () Bool)

(declare-fun e!316002 () Bool)

(assert (=> b!546694 (=> (not res!340304) (not e!316002))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34436 0))(
  ( (array!34437 (arr!16543 (Array (_ BitVec 32) (_ BitVec 64))) (size!16907 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34436)

(assert (=> b!546694 (= res!340304 (and (= (size!16907 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16907 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16907 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546695 () Bool)

(declare-fun res!340305 () Bool)

(assert (=> b!546695 (=> (not res!340305) (not e!316002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546695 (= res!340305 (validKeyInArray!0 (select (arr!16543 a!3118) j!142)))))

(declare-fun b!546697 () Bool)

(assert (=> b!546697 (= e!316002 (bvsge #b00000000000000000000000000000000 (size!16907 a!3118)))))

(declare-fun b!546696 () Bool)

(declare-fun res!340303 () Bool)

(assert (=> b!546696 (=> (not res!340303) (not e!316002))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546696 (= res!340303 (validKeyInArray!0 k0!1914))))

(declare-fun res!340306 () Bool)

(assert (=> start!49738 (=> (not res!340306) (not e!316002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49738 (= res!340306 (validMask!0 mask!3119))))

(assert (=> start!49738 e!316002))

(assert (=> start!49738 true))

(declare-fun array_inv!12402 (array!34436) Bool)

(assert (=> start!49738 (array_inv!12402 a!3118)))

(assert (= (and start!49738 res!340306) b!546694))

(assert (= (and b!546694 res!340304) b!546695))

(assert (= (and b!546695 res!340305) b!546696))

(assert (= (and b!546696 res!340303) b!546697))

(declare-fun m!524281 () Bool)

(assert (=> b!546695 m!524281))

(assert (=> b!546695 m!524281))

(declare-fun m!524283 () Bool)

(assert (=> b!546695 m!524283))

(declare-fun m!524285 () Bool)

(assert (=> b!546696 m!524285))

(declare-fun m!524287 () Bool)

(assert (=> start!49738 m!524287))

(declare-fun m!524289 () Bool)

(assert (=> start!49738 m!524289))

(check-sat (not b!546696) (not b!546695) (not start!49738))
(check-sat)
