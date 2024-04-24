; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49766 () Bool)

(assert start!49766)

(declare-fun b!546768 () Bool)

(declare-fun res!340380 () Bool)

(declare-fun e!316037 () Bool)

(assert (=> b!546768 (=> (not res!340380) (not e!316037))))

(declare-datatypes ((array!34450 0))(
  ( (array!34451 (arr!16549 (Array (_ BitVec 32) (_ BitVec 64))) (size!16913 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34450)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546768 (= res!340380 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546769 () Bool)

(declare-fun res!340378 () Bool)

(assert (=> b!546769 (=> (not res!340378) (not e!316037))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546769 (= res!340378 (validKeyInArray!0 (select (arr!16549 a!3118) j!142)))))

(declare-fun b!546770 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546770 (= e!316037 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546771 () Bool)

(declare-fun res!340377 () Bool)

(assert (=> b!546771 (=> (not res!340377) (not e!316037))))

(assert (=> b!546771 (= res!340377 (validKeyInArray!0 k0!1914))))

(declare-fun res!340381 () Bool)

(assert (=> start!49766 (=> (not res!340381) (not e!316037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49766 (= res!340381 (validMask!0 mask!3119))))

(assert (=> start!49766 e!316037))

(assert (=> start!49766 true))

(declare-fun array_inv!12408 (array!34450) Bool)

(assert (=> start!49766 (array_inv!12408 a!3118)))

(declare-fun b!546772 () Bool)

(declare-fun res!340379 () Bool)

(assert (=> b!546772 (=> (not res!340379) (not e!316037))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546772 (= res!340379 (and (= (size!16913 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16913 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16913 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49766 res!340381) b!546772))

(assert (= (and b!546772 res!340379) b!546769))

(assert (= (and b!546769 res!340378) b!546771))

(assert (= (and b!546771 res!340377) b!546768))

(assert (= (and b!546768 res!340380) b!546770))

(declare-fun m!524341 () Bool)

(assert (=> b!546768 m!524341))

(declare-fun m!524343 () Bool)

(assert (=> b!546769 m!524343))

(assert (=> b!546769 m!524343))

(declare-fun m!524345 () Bool)

(assert (=> b!546769 m!524345))

(declare-fun m!524347 () Bool)

(assert (=> b!546771 m!524347))

(declare-fun m!524349 () Bool)

(assert (=> start!49766 m!524349))

(declare-fun m!524351 () Bool)

(assert (=> start!49766 m!524351))

(check-sat (not b!546769) (not b!546771) (not b!546768) (not start!49766))
(check-sat)
