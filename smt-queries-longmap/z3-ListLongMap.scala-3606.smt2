; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49694 () Bool)

(assert start!49694)

(declare-fun b!546506 () Bool)

(declare-fun res!340222 () Bool)

(declare-fun e!315879 () Bool)

(assert (=> b!546506 (=> (not res!340222) (not e!315879))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34444 0))(
  ( (array!34445 (arr!16549 (Array (_ BitVec 32) (_ BitVec 64))) (size!16913 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34444)

(assert (=> b!546506 (= res!340222 (and (= (size!16913 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16913 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16913 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546508 () Bool)

(declare-fun res!340220 () Bool)

(assert (=> b!546508 (=> (not res!340220) (not e!315879))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546508 (= res!340220 (validKeyInArray!0 k0!1914))))

(declare-fun res!340221 () Bool)

(assert (=> start!49694 (=> (not res!340221) (not e!315879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49694 (= res!340221 (validMask!0 mask!3119))))

(assert (=> start!49694 e!315879))

(assert (=> start!49694 true))

(declare-fun array_inv!12345 (array!34444) Bool)

(assert (=> start!49694 (array_inv!12345 a!3118)))

(declare-fun b!546509 () Bool)

(assert (=> b!546509 (= e!315879 (bvsge #b00000000000000000000000000000000 (size!16913 a!3118)))))

(declare-fun b!546507 () Bool)

(declare-fun res!340223 () Bool)

(assert (=> b!546507 (=> (not res!340223) (not e!315879))))

(assert (=> b!546507 (= res!340223 (validKeyInArray!0 (select (arr!16549 a!3118) j!142)))))

(assert (= (and start!49694 res!340221) b!546506))

(assert (= (and b!546506 res!340222) b!546507))

(assert (= (and b!546507 res!340223) b!546508))

(assert (= (and b!546508 res!340220) b!546509))

(declare-fun m!523939 () Bool)

(assert (=> b!546508 m!523939))

(declare-fun m!523941 () Bool)

(assert (=> start!49694 m!523941))

(declare-fun m!523943 () Bool)

(assert (=> start!49694 m!523943))

(declare-fun m!523945 () Bool)

(assert (=> b!546507 m!523945))

(assert (=> b!546507 m!523945))

(declare-fun m!523947 () Bool)

(assert (=> b!546507 m!523947))

(check-sat (not b!546507) (not b!546508) (not start!49694))
(check-sat)
