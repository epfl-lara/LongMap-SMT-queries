; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49760 () Bool)

(assert start!49760)

(declare-fun b!546892 () Bool)

(declare-fun res!340606 () Bool)

(declare-fun e!316034 () Bool)

(assert (=> b!546892 (=> (not res!340606) (not e!316034))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34498 0))(
  ( (array!34499 (arr!16575 (Array (_ BitVec 32) (_ BitVec 64))) (size!16939 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34498)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546892 (= res!340606 (and (= (size!16939 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16939 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16939 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340608 () Bool)

(assert (=> start!49760 (=> (not res!340608) (not e!316034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49760 (= res!340608 (validMask!0 mask!3119))))

(assert (=> start!49760 e!316034))

(assert (=> start!49760 true))

(declare-fun array_inv!12371 (array!34498) Bool)

(assert (=> start!49760 (array_inv!12371 a!3118)))

(declare-fun b!546893 () Bool)

(declare-fun res!340607 () Bool)

(assert (=> b!546893 (=> (not res!340607) (not e!316034))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546893 (= res!340607 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546894 () Bool)

(declare-fun res!340609 () Bool)

(assert (=> b!546894 (=> (not res!340609) (not e!316034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546894 (= res!340609 (validKeyInArray!0 k!1914))))

(declare-fun b!546895 () Bool)

(assert (=> b!546895 (= e!316034 false)))

(declare-datatypes ((SeekEntryResult!5024 0))(
  ( (MissingZero!5024 (index!22323 (_ BitVec 32))) (Found!5024 (index!22324 (_ BitVec 32))) (Intermediate!5024 (undefined!5836 Bool) (index!22325 (_ BitVec 32)) (x!51276 (_ BitVec 32))) (Undefined!5024) (MissingVacant!5024 (index!22326 (_ BitVec 32))) )
))
(declare-fun lt!249385 () SeekEntryResult!5024)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34498 (_ BitVec 32)) SeekEntryResult!5024)

(assert (=> b!546895 (= lt!249385 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546896 () Bool)

(declare-fun res!340610 () Bool)

(assert (=> b!546896 (=> (not res!340610) (not e!316034))))

(assert (=> b!546896 (= res!340610 (validKeyInArray!0 (select (arr!16575 a!3118) j!142)))))

(assert (= (and start!49760 res!340608) b!546892))

(assert (= (and b!546892 res!340606) b!546896))

(assert (= (and b!546896 res!340610) b!546894))

(assert (= (and b!546894 res!340609) b!546893))

(assert (= (and b!546893 res!340607) b!546895))

(declare-fun m!524277 () Bool)

(assert (=> b!546894 m!524277))

(declare-fun m!524279 () Bool)

(assert (=> b!546893 m!524279))

(declare-fun m!524281 () Bool)

(assert (=> b!546895 m!524281))

(declare-fun m!524283 () Bool)

(assert (=> start!49760 m!524283))

(declare-fun m!524285 () Bool)

(assert (=> start!49760 m!524285))

(declare-fun m!524287 () Bool)

(assert (=> b!546896 m!524287))

(assert (=> b!546896 m!524287))

(declare-fun m!524289 () Bool)

(assert (=> b!546896 m!524289))

(push 1)

(assert (not start!49760))

(assert (not b!546896))

(assert (not b!546894))

(assert (not b!546893))

(assert (not b!546895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

