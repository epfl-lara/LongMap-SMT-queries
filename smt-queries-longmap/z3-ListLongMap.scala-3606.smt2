; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49680 () Bool)

(assert start!49680)

(declare-fun res!340081 () Bool)

(declare-fun e!315698 () Bool)

(assert (=> start!49680 (=> (not res!340081) (not e!315698))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49680 (= res!340081 (validMask!0 mask!3119))))

(assert (=> start!49680 e!315698))

(assert (=> start!49680 true))

(declare-datatypes ((array!34440 0))(
  ( (array!34441 (arr!16547 (Array (_ BitVec 32) (_ BitVec 64))) (size!16912 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34440)

(declare-fun array_inv!12430 (array!34440) Bool)

(assert (=> start!49680 (array_inv!12430 a!3118)))

(declare-fun b!546224 () Bool)

(declare-fun res!340080 () Bool)

(assert (=> b!546224 (=> (not res!340080) (not e!315698))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546224 (= res!340080 (validKeyInArray!0 (select (arr!16547 a!3118) j!142)))))

(declare-fun b!546223 () Bool)

(declare-fun res!340082 () Bool)

(assert (=> b!546223 (=> (not res!340082) (not e!315698))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546223 (= res!340082 (and (= (size!16912 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16912 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16912 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546226 () Bool)

(assert (=> b!546226 (= e!315698 (bvsge #b00000000000000000000000000000000 (size!16912 a!3118)))))

(declare-fun b!546225 () Bool)

(declare-fun res!340079 () Bool)

(assert (=> b!546225 (=> (not res!340079) (not e!315698))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!546225 (= res!340079 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49680 res!340081) b!546223))

(assert (= (and b!546223 res!340082) b!546224))

(assert (= (and b!546224 res!340080) b!546225))

(assert (= (and b!546225 res!340079) b!546226))

(declare-fun m!523177 () Bool)

(assert (=> start!49680 m!523177))

(declare-fun m!523179 () Bool)

(assert (=> start!49680 m!523179))

(declare-fun m!523181 () Bool)

(assert (=> b!546224 m!523181))

(assert (=> b!546224 m!523181))

(declare-fun m!523183 () Bool)

(assert (=> b!546224 m!523183))

(declare-fun m!523185 () Bool)

(assert (=> b!546225 m!523185))

(check-sat (not b!546225) (not b!546224) (not start!49680))
(check-sat)
