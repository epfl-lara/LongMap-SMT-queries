; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49740 () Bool)

(assert start!49740)

(declare-fun b!546742 () Bool)

(declare-fun res!340460 () Bool)

(declare-fun e!315975 () Bool)

(assert (=> b!546742 (=> (not res!340460) (not e!315975))))

(declare-datatypes ((array!34478 0))(
  ( (array!34479 (arr!16565 (Array (_ BitVec 32) (_ BitVec 64))) (size!16929 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34478)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546742 (= res!340460 (validKeyInArray!0 (select (arr!16565 a!3118) j!142)))))

(declare-fun b!546743 () Bool)

(declare-fun res!340459 () Bool)

(assert (=> b!546743 (=> (not res!340459) (not e!315975))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!546743 (= res!340459 (validKeyInArray!0 k!1914))))

(declare-fun b!546744 () Bool)

(declare-fun res!340458 () Bool)

(assert (=> b!546744 (=> (not res!340458) (not e!315975))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546744 (= res!340458 (and (= (size!16929 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16929 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16929 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340457 () Bool)

(assert (=> start!49740 (=> (not res!340457) (not e!315975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49740 (= res!340457 (validMask!0 mask!3119))))

(assert (=> start!49740 e!315975))

(assert (=> start!49740 true))

(declare-fun array_inv!12361 (array!34478) Bool)

(assert (=> start!49740 (array_inv!12361 a!3118)))

(declare-fun b!546745 () Bool)

(declare-fun res!340456 () Bool)

(assert (=> b!546745 (=> (not res!340456) (not e!315975))))

(declare-fun arrayContainsKey!0 (array!34478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546745 (= res!340456 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546746 () Bool)

(assert (=> b!546746 (= e!315975 false)))

(declare-datatypes ((SeekEntryResult!5014 0))(
  ( (MissingZero!5014 (index!22283 (_ BitVec 32))) (Found!5014 (index!22284 (_ BitVec 32))) (Intermediate!5014 (undefined!5826 Bool) (index!22285 (_ BitVec 32)) (x!51234 (_ BitVec 32))) (Undefined!5014) (MissingVacant!5014 (index!22286 (_ BitVec 32))) )
))
(declare-fun lt!249355 () SeekEntryResult!5014)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34478 (_ BitVec 32)) SeekEntryResult!5014)

(assert (=> b!546746 (= lt!249355 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!49740 res!340457) b!546744))

(assert (= (and b!546744 res!340458) b!546742))

(assert (= (and b!546742 res!340460) b!546743))

(assert (= (and b!546743 res!340459) b!546745))

(assert (= (and b!546745 res!340456) b!546746))

(declare-fun m!524137 () Bool)

(assert (=> b!546742 m!524137))

(assert (=> b!546742 m!524137))

(declare-fun m!524139 () Bool)

(assert (=> b!546742 m!524139))

(declare-fun m!524141 () Bool)

(assert (=> b!546745 m!524141))

(declare-fun m!524143 () Bool)

(assert (=> start!49740 m!524143))

(declare-fun m!524145 () Bool)

(assert (=> start!49740 m!524145))

(declare-fun m!524147 () Bool)

(assert (=> b!546746 m!524147))

(declare-fun m!524149 () Bool)

(assert (=> b!546743 m!524149))

(push 1)

(assert (not b!546742))

(assert (not start!49740))

(assert (not b!546745))

(assert (not b!546746))

(assert (not b!546743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

