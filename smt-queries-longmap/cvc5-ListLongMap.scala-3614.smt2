; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49754 () Bool)

(assert start!49754)

(declare-fun b!546847 () Bool)

(declare-fun e!316016 () Bool)

(assert (=> b!546847 (= e!316016 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5021 0))(
  ( (MissingZero!5021 (index!22311 (_ BitVec 32))) (Found!5021 (index!22312 (_ BitVec 32))) (Intermediate!5021 (undefined!5833 Bool) (index!22313 (_ BitVec 32)) (x!51265 (_ BitVec 32))) (Undefined!5021) (MissingVacant!5021 (index!22314 (_ BitVec 32))) )
))
(declare-fun lt!249376 () SeekEntryResult!5021)

(declare-datatypes ((array!34492 0))(
  ( (array!34493 (arr!16572 (Array (_ BitVec 32) (_ BitVec 64))) (size!16936 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34492)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34492 (_ BitVec 32)) SeekEntryResult!5021)

(assert (=> b!546847 (= lt!249376 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340564 () Bool)

(assert (=> start!49754 (=> (not res!340564) (not e!316016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49754 (= res!340564 (validMask!0 mask!3119))))

(assert (=> start!49754 e!316016))

(assert (=> start!49754 true))

(declare-fun array_inv!12368 (array!34492) Bool)

(assert (=> start!49754 (array_inv!12368 a!3118)))

(declare-fun b!546848 () Bool)

(declare-fun res!340563 () Bool)

(assert (=> b!546848 (=> (not res!340563) (not e!316016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546848 (= res!340563 (validKeyInArray!0 k!1914))))

(declare-fun b!546849 () Bool)

(declare-fun res!340562 () Bool)

(assert (=> b!546849 (=> (not res!340562) (not e!316016))))

(declare-fun arrayContainsKey!0 (array!34492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546849 (= res!340562 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546850 () Bool)

(declare-fun res!340561 () Bool)

(assert (=> b!546850 (=> (not res!340561) (not e!316016))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546850 (= res!340561 (and (= (size!16936 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16936 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16936 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546851 () Bool)

(declare-fun res!340565 () Bool)

(assert (=> b!546851 (=> (not res!340565) (not e!316016))))

(assert (=> b!546851 (= res!340565 (validKeyInArray!0 (select (arr!16572 a!3118) j!142)))))

(assert (= (and start!49754 res!340564) b!546850))

(assert (= (and b!546850 res!340561) b!546851))

(assert (= (and b!546851 res!340565) b!546848))

(assert (= (and b!546848 res!340563) b!546849))

(assert (= (and b!546849 res!340562) b!546847))

(declare-fun m!524235 () Bool)

(assert (=> b!546851 m!524235))

(assert (=> b!546851 m!524235))

(declare-fun m!524237 () Bool)

(assert (=> b!546851 m!524237))

(declare-fun m!524239 () Bool)

(assert (=> b!546847 m!524239))

(declare-fun m!524241 () Bool)

(assert (=> b!546848 m!524241))

(declare-fun m!524243 () Bool)

(assert (=> start!49754 m!524243))

(declare-fun m!524245 () Bool)

(assert (=> start!49754 m!524245))

(declare-fun m!524247 () Bool)

(assert (=> b!546849 m!524247))

(push 1)

(assert (not b!546848))

(assert (not b!546851))

(assert (not b!546849))

(assert (not b!546847))

(assert (not start!49754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

