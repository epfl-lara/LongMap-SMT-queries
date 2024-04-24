; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49794 () Bool)

(assert start!49794)

(declare-fun b!546987 () Bool)

(declare-fun res!340600 () Bool)

(declare-fun e!316122 () Bool)

(assert (=> b!546987 (=> (not res!340600) (not e!316122))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546987 (= res!340600 (validKeyInArray!0 k!1914))))

(declare-fun b!546988 () Bool)

(declare-fun res!340597 () Bool)

(assert (=> b!546988 (=> (not res!340597) (not e!316122))))

(declare-datatypes ((array!34478 0))(
  ( (array!34479 (arr!16563 (Array (_ BitVec 32) (_ BitVec 64))) (size!16927 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34478)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!546988 (= res!340597 (validKeyInArray!0 (select (arr!16563 a!3118) j!142)))))

(declare-fun b!546989 () Bool)

(declare-fun res!340598 () Bool)

(assert (=> b!546989 (=> (not res!340598) (not e!316122))))

(declare-fun arrayContainsKey!0 (array!34478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546989 (= res!340598 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546990 () Bool)

(assert (=> b!546990 (= e!316122 false)))

(declare-datatypes ((SeekEntryResult!4968 0))(
  ( (MissingZero!4968 (index!22099 (_ BitVec 32))) (Found!4968 (index!22100 (_ BitVec 32))) (Intermediate!4968 (undefined!5780 Bool) (index!22101 (_ BitVec 32)) (x!51199 (_ BitVec 32))) (Undefined!4968) (MissingVacant!4968 (index!22102 (_ BitVec 32))) )
))
(declare-fun lt!249475 () SeekEntryResult!4968)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34478 (_ BitVec 32)) SeekEntryResult!4968)

(assert (=> b!546990 (= lt!249475 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546991 () Bool)

(declare-fun res!340596 () Bool)

(assert (=> b!546991 (=> (not res!340596) (not e!316122))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!546991 (= res!340596 (and (= (size!16927 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16927 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16927 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!340599 () Bool)

(assert (=> start!49794 (=> (not res!340599) (not e!316122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49794 (= res!340599 (validMask!0 mask!3119))))

(assert (=> start!49794 e!316122))

(assert (=> start!49794 true))

(declare-fun array_inv!12422 (array!34478) Bool)

(assert (=> start!49794 (array_inv!12422 a!3118)))

(assert (= (and start!49794 res!340599) b!546991))

(assert (= (and b!546991 res!340596) b!546988))

(assert (= (and b!546988 res!340597) b!546987))

(assert (= (and b!546987 res!340600) b!546989))

(assert (= (and b!546989 res!340598) b!546990))

(declare-fun m!524531 () Bool)

(assert (=> b!546987 m!524531))

(declare-fun m!524533 () Bool)

(assert (=> start!49794 m!524533))

(declare-fun m!524535 () Bool)

(assert (=> start!49794 m!524535))

(declare-fun m!524537 () Bool)

(assert (=> b!546988 m!524537))

(assert (=> b!546988 m!524537))

(declare-fun m!524539 () Bool)

(assert (=> b!546988 m!524539))

(declare-fun m!524541 () Bool)

(assert (=> b!546989 m!524541))

(declare-fun m!524543 () Bool)

(assert (=> b!546990 m!524543))

(push 1)

(assert (not start!49794))

(assert (not b!546988))

(assert (not b!546987))

(assert (not b!546989))

(assert (not b!546990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

