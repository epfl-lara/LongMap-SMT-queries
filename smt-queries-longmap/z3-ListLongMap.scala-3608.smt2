; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49706 () Bool)

(assert start!49706)

(declare-fun b!546297 () Bool)

(declare-fun res!340157 () Bool)

(declare-fun e!315735 () Bool)

(assert (=> b!546297 (=> (not res!340157) (not e!315735))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546297 (= res!340157 (validKeyInArray!0 k0!1914))))

(declare-fun b!546299 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546299 (= e!315735 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546300 () Bool)

(declare-fun res!340153 () Bool)

(assert (=> b!546300 (=> (not res!340153) (not e!315735))))

(declare-datatypes ((array!34453 0))(
  ( (array!34454 (arr!16553 (Array (_ BitVec 32) (_ BitVec 64))) (size!16918 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34453)

(declare-fun arrayContainsKey!0 (array!34453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546300 (= res!340153 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546301 () Bool)

(declare-fun res!340156 () Bool)

(assert (=> b!546301 (=> (not res!340156) (not e!315735))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546301 (= res!340156 (validKeyInArray!0 (select (arr!16553 a!3118) j!142)))))

(declare-fun b!546298 () Bool)

(declare-fun res!340155 () Bool)

(assert (=> b!546298 (=> (not res!340155) (not e!315735))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546298 (= res!340155 (and (= (size!16918 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16918 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16918 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340154 () Bool)

(assert (=> start!49706 (=> (not res!340154) (not e!315735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49706 (= res!340154 (validMask!0 mask!3119))))

(assert (=> start!49706 e!315735))

(assert (=> start!49706 true))

(declare-fun array_inv!12436 (array!34453) Bool)

(assert (=> start!49706 (array_inv!12436 a!3118)))

(assert (= (and start!49706 res!340154) b!546298))

(assert (= (and b!546298 res!340155) b!546301))

(assert (= (and b!546301 res!340156) b!546297))

(assert (= (and b!546297 res!340157) b!546300))

(assert (= (and b!546300 res!340153) b!546299))

(declare-fun m!523237 () Bool)

(assert (=> b!546297 m!523237))

(declare-fun m!523239 () Bool)

(assert (=> b!546300 m!523239))

(declare-fun m!523241 () Bool)

(assert (=> b!546301 m!523241))

(assert (=> b!546301 m!523241))

(declare-fun m!523243 () Bool)

(assert (=> b!546301 m!523243))

(declare-fun m!523245 () Bool)

(assert (=> start!49706 m!523245))

(declare-fun m!523247 () Bool)

(assert (=> start!49706 m!523247))

(check-sat (not b!546300) (not b!546297) (not start!49706) (not b!546301))
(check-sat)
