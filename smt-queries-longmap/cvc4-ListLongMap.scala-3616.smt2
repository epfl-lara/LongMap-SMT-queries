; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49770 () Bool)

(assert start!49770)

(declare-fun res!340684 () Bool)

(declare-fun e!316065 () Bool)

(assert (=> start!49770 (=> (not res!340684) (not e!316065))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49770 (= res!340684 (validMask!0 mask!3119))))

(assert (=> start!49770 e!316065))

(assert (=> start!49770 true))

(declare-datatypes ((array!34508 0))(
  ( (array!34509 (arr!16580 (Array (_ BitVec 32) (_ BitVec 64))) (size!16944 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34508)

(declare-fun array_inv!12376 (array!34508) Bool)

(assert (=> start!49770 (array_inv!12376 a!3118)))

(declare-fun b!546967 () Bool)

(declare-fun res!340685 () Bool)

(assert (=> b!546967 (=> (not res!340685) (not e!316065))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546967 (= res!340685 (validKeyInArray!0 (select (arr!16580 a!3118) j!142)))))

(declare-datatypes ((SeekEntryResult!5029 0))(
  ( (MissingZero!5029 (index!22343 (_ BitVec 32))) (Found!5029 (index!22344 (_ BitVec 32))) (Intermediate!5029 (undefined!5841 Bool) (index!22345 (_ BitVec 32)) (x!51289 (_ BitVec 32))) (Undefined!5029) (MissingVacant!5029 (index!22346 (_ BitVec 32))) )
))
(declare-fun lt!249400 () SeekEntryResult!5029)

(declare-fun b!546968 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546968 (= e!316065 (and (or (= lt!249400 (MissingZero!5029 i!1132)) (= lt!249400 (MissingVacant!5029 i!1132))) (bvsgt #b00000000000000000000000000000000 (size!16944 a!3118))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34508 (_ BitVec 32)) SeekEntryResult!5029)

(assert (=> b!546968 (= lt!249400 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546969 () Bool)

(declare-fun res!340682 () Bool)

(assert (=> b!546969 (=> (not res!340682) (not e!316065))))

(assert (=> b!546969 (= res!340682 (and (= (size!16944 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16944 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16944 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546970 () Bool)

(declare-fun res!340683 () Bool)

(assert (=> b!546970 (=> (not res!340683) (not e!316065))))

(declare-fun arrayContainsKey!0 (array!34508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546970 (= res!340683 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546971 () Bool)

(declare-fun res!340681 () Bool)

(assert (=> b!546971 (=> (not res!340681) (not e!316065))))

(assert (=> b!546971 (= res!340681 (validKeyInArray!0 k!1914))))

(assert (= (and start!49770 res!340684) b!546969))

(assert (= (and b!546969 res!340682) b!546967))

(assert (= (and b!546967 res!340685) b!546971))

(assert (= (and b!546971 res!340681) b!546970))

(assert (= (and b!546970 res!340683) b!546968))

(declare-fun m!524347 () Bool)

(assert (=> b!546968 m!524347))

(declare-fun m!524349 () Bool)

(assert (=> b!546970 m!524349))

(declare-fun m!524351 () Bool)

(assert (=> b!546971 m!524351))

(declare-fun m!524353 () Bool)

(assert (=> start!49770 m!524353))

(declare-fun m!524355 () Bool)

(assert (=> start!49770 m!524355))

(declare-fun m!524357 () Bool)

(assert (=> b!546967 m!524357))

(assert (=> b!546967 m!524357))

(declare-fun m!524359 () Bool)

(assert (=> b!546967 m!524359))

(push 1)

(assert (not b!546967))

(assert (not b!546968))

(assert (not b!546970))

(assert (not start!49770))

(assert (not b!546971))

(check-sat)

