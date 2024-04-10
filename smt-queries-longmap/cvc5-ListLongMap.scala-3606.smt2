; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49692 () Bool)

(assert start!49692)

(declare-fun res!340211 () Bool)

(declare-fun e!315872 () Bool)

(assert (=> start!49692 (=> (not res!340211) (not e!315872))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49692 (= res!340211 (validMask!0 mask!3119))))

(assert (=> start!49692 e!315872))

(assert (=> start!49692 true))

(declare-datatypes ((array!34442 0))(
  ( (array!34443 (arr!16548 (Array (_ BitVec 32) (_ BitVec 64))) (size!16912 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34442)

(declare-fun array_inv!12344 (array!34442) Bool)

(assert (=> start!49692 (array_inv!12344 a!3118)))

(declare-fun b!546497 () Bool)

(assert (=> b!546497 (= e!315872 (bvsge #b00000000000000000000000000000000 (size!16912 a!3118)))))

(declare-fun b!546495 () Bool)

(declare-fun res!340208 () Bool)

(assert (=> b!546495 (=> (not res!340208) (not e!315872))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546495 (= res!340208 (validKeyInArray!0 (select (arr!16548 a!3118) j!142)))))

(declare-fun b!546496 () Bool)

(declare-fun res!340210 () Bool)

(assert (=> b!546496 (=> (not res!340210) (not e!315872))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!546496 (= res!340210 (validKeyInArray!0 k!1914))))

(declare-fun b!546494 () Bool)

(declare-fun res!340209 () Bool)

(assert (=> b!546494 (=> (not res!340209) (not e!315872))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546494 (= res!340209 (and (= (size!16912 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16912 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16912 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49692 res!340211) b!546494))

(assert (= (and b!546494 res!340209) b!546495))

(assert (= (and b!546495 res!340208) b!546496))

(assert (= (and b!546496 res!340210) b!546497))

(declare-fun m!523929 () Bool)

(assert (=> start!49692 m!523929))

(declare-fun m!523931 () Bool)

(assert (=> start!49692 m!523931))

(declare-fun m!523933 () Bool)

(assert (=> b!546495 m!523933))

(assert (=> b!546495 m!523933))

(declare-fun m!523935 () Bool)

(assert (=> b!546495 m!523935))

(declare-fun m!523937 () Bool)

(assert (=> b!546496 m!523937))

(push 1)

(assert (not start!49692))

(assert (not b!546495))

(assert (not b!546496))

(check-sat)

