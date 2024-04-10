; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49772 () Bool)

(assert start!49772)

(declare-fun b!546986 () Bool)

(declare-fun res!340701 () Bool)

(declare-fun e!316072 () Bool)

(assert (=> b!546986 (=> (not res!340701) (not e!316072))))

(declare-datatypes ((array!34510 0))(
  ( (array!34511 (arr!16581 (Array (_ BitVec 32) (_ BitVec 64))) (size!16945 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34510)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546986 (= res!340701 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546987 () Bool)

(declare-fun res!340706 () Bool)

(assert (=> b!546987 (=> (not res!340706) (not e!316072))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546987 (= res!340706 (validKeyInArray!0 (select (arr!16581 a!3118) j!142)))))

(declare-fun b!546988 () Bool)

(declare-fun res!340702 () Bool)

(declare-fun e!316073 () Bool)

(assert (=> b!546988 (=> (not res!340702) (not e!316073))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34510 (_ BitVec 32)) Bool)

(assert (=> b!546988 (= res!340702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!546989 () Bool)

(assert (=> b!546989 (= e!316073 (bvsgt #b00000000000000000000000000000000 (size!16945 a!3118)))))

(declare-fun b!546990 () Bool)

(declare-fun res!340700 () Bool)

(assert (=> b!546990 (=> (not res!340700) (not e!316072))))

(assert (=> b!546990 (= res!340700 (validKeyInArray!0 k!1914))))

(declare-fun b!546991 () Bool)

(assert (=> b!546991 (= e!316072 e!316073)))

(declare-fun res!340705 () Bool)

(assert (=> b!546991 (=> (not res!340705) (not e!316073))))

(declare-datatypes ((SeekEntryResult!5030 0))(
  ( (MissingZero!5030 (index!22347 (_ BitVec 32))) (Found!5030 (index!22348 (_ BitVec 32))) (Intermediate!5030 (undefined!5842 Bool) (index!22349 (_ BitVec 32)) (x!51298 (_ BitVec 32))) (Undefined!5030) (MissingVacant!5030 (index!22350 (_ BitVec 32))) )
))
(declare-fun lt!249403 () SeekEntryResult!5030)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546991 (= res!340705 (or (= lt!249403 (MissingZero!5030 i!1132)) (= lt!249403 (MissingVacant!5030 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34510 (_ BitVec 32)) SeekEntryResult!5030)

(assert (=> b!546991 (= lt!249403 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340704 () Bool)

(assert (=> start!49772 (=> (not res!340704) (not e!316072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49772 (= res!340704 (validMask!0 mask!3119))))

(assert (=> start!49772 e!316072))

(assert (=> start!49772 true))

(declare-fun array_inv!12377 (array!34510) Bool)

(assert (=> start!49772 (array_inv!12377 a!3118)))

(declare-fun b!546992 () Bool)

(declare-fun res!340703 () Bool)

(assert (=> b!546992 (=> (not res!340703) (not e!316072))))

(assert (=> b!546992 (= res!340703 (and (= (size!16945 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16945 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16945 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49772 res!340704) b!546992))

(assert (= (and b!546992 res!340703) b!546987))

(assert (= (and b!546987 res!340706) b!546990))

(assert (= (and b!546990 res!340700) b!546986))

(assert (= (and b!546986 res!340701) b!546991))

(assert (= (and b!546991 res!340705) b!546988))

(assert (= (and b!546988 res!340702) b!546989))

(declare-fun m!524361 () Bool)

(assert (=> b!546990 m!524361))

(declare-fun m!524363 () Bool)

(assert (=> start!49772 m!524363))

(declare-fun m!524365 () Bool)

(assert (=> start!49772 m!524365))

(declare-fun m!524367 () Bool)

(assert (=> b!546991 m!524367))

(declare-fun m!524369 () Bool)

(assert (=> b!546988 m!524369))

(declare-fun m!524371 () Bool)

(assert (=> b!546987 m!524371))

(assert (=> b!546987 m!524371))

(declare-fun m!524373 () Bool)

(assert (=> b!546987 m!524373))

(declare-fun m!524375 () Bool)

(assert (=> b!546986 m!524375))

(push 1)

