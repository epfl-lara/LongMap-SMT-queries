; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49696 () Bool)

(assert start!49696)

(declare-fun res!340232 () Bool)

(declare-fun e!315884 () Bool)

(assert (=> start!49696 (=> (not res!340232) (not e!315884))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49696 (= res!340232 (validMask!0 mask!3119))))

(assert (=> start!49696 e!315884))

(assert (=> start!49696 true))

(declare-datatypes ((array!34446 0))(
  ( (array!34447 (arr!16550 (Array (_ BitVec 32) (_ BitVec 64))) (size!16914 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34446)

(declare-fun array_inv!12346 (array!34446) Bool)

(assert (=> start!49696 (array_inv!12346 a!3118)))

(declare-fun b!546519 () Bool)

(declare-fun res!340235 () Bool)

(assert (=> b!546519 (=> (not res!340235) (not e!315884))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546519 (= res!340235 (validKeyInArray!0 (select (arr!16550 a!3118) j!142)))))

(declare-fun b!546518 () Bool)

(declare-fun res!340234 () Bool)

(assert (=> b!546518 (=> (not res!340234) (not e!315884))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546518 (= res!340234 (and (= (size!16914 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16914 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16914 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546520 () Bool)

(declare-fun res!340233 () Bool)

(assert (=> b!546520 (=> (not res!340233) (not e!315884))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!546520 (= res!340233 (validKeyInArray!0 k!1914))))

(declare-fun b!546521 () Bool)

(assert (=> b!546521 (= e!315884 (bvsge #b00000000000000000000000000000000 (size!16914 a!3118)))))

(assert (= (and start!49696 res!340232) b!546518))

(assert (= (and b!546518 res!340234) b!546519))

(assert (= (and b!546519 res!340235) b!546520))

(assert (= (and b!546520 res!340233) b!546521))

(declare-fun m!523949 () Bool)

(assert (=> start!49696 m!523949))

(declare-fun m!523951 () Bool)

(assert (=> start!49696 m!523951))

(declare-fun m!523953 () Bool)

(assert (=> b!546519 m!523953))

(assert (=> b!546519 m!523953))

(declare-fun m!523955 () Bool)

(assert (=> b!546519 m!523955))

(declare-fun m!523957 () Bool)

(assert (=> b!546520 m!523957))

(push 1)

(assert (not b!546520))

(assert (not start!49696))

(assert (not b!546519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

