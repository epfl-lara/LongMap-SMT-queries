; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49730 () Bool)

(assert start!49730)

(declare-fun b!546660 () Bool)

(declare-fun e!315944 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!546660 (= e!315944 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun b!546661 () Bool)

(declare-fun res!340377 () Bool)

(assert (=> b!546661 (=> (not res!340377) (not e!315944))))

(declare-datatypes ((array!34468 0))(
  ( (array!34469 (arr!16560 (Array (_ BitVec 32) (_ BitVec 64))) (size!16924 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34468)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546661 (= res!340377 (validKeyInArray!0 (select (arr!16560 a!3118) j!142)))))

(declare-fun res!340378 () Bool)

(assert (=> start!49730 (=> (not res!340378) (not e!315944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49730 (= res!340378 (validMask!0 mask!3119))))

(assert (=> start!49730 e!315944))

(assert (=> start!49730 true))

(declare-fun array_inv!12356 (array!34468) Bool)

(assert (=> start!49730 (array_inv!12356 a!3118)))

(declare-fun b!546662 () Bool)

(declare-fun res!340376 () Bool)

(assert (=> b!546662 (=> (not res!340376) (not e!315944))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5009 0))(
  ( (MissingZero!5009 (index!22263 (_ BitVec 32))) (Found!5009 (index!22264 (_ BitVec 32))) (Intermediate!5009 (undefined!5821 Bool) (index!22265 (_ BitVec 32)) (x!51221 (_ BitVec 32))) (Undefined!5009) (MissingVacant!5009 (index!22266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34468 (_ BitVec 32)) SeekEntryResult!5009)

(assert (=> b!546662 (= res!340376 (not (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) (MissingZero!5009 i!1132))))))

(declare-fun b!546663 () Bool)

(declare-fun res!340374 () Bool)

(assert (=> b!546663 (=> (not res!340374) (not e!315944))))

(declare-fun arrayContainsKey!0 (array!34468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546663 (= res!340374 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546664 () Bool)

(declare-fun res!340375 () Bool)

(assert (=> b!546664 (=> (not res!340375) (not e!315944))))

(assert (=> b!546664 (= res!340375 (and (= (size!16924 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16924 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16924 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546665 () Bool)

(declare-fun res!340379 () Bool)

(assert (=> b!546665 (=> (not res!340379) (not e!315944))))

(assert (=> b!546665 (= res!340379 (validKeyInArray!0 k!1914))))

(assert (= (and start!49730 res!340378) b!546664))

(assert (= (and b!546664 res!340375) b!546661))

(assert (= (and b!546661 res!340377) b!546665))

(assert (= (and b!546665 res!340379) b!546663))

(assert (= (and b!546663 res!340374) b!546662))

(assert (= (and b!546662 res!340376) b!546660))

(declare-fun m!524067 () Bool)

(assert (=> b!546663 m!524067))

(declare-fun m!524069 () Bool)

(assert (=> b!546665 m!524069))

(declare-fun m!524071 () Bool)

(assert (=> start!49730 m!524071))

(declare-fun m!524073 () Bool)

(assert (=> start!49730 m!524073))

(declare-fun m!524075 () Bool)

(assert (=> b!546661 m!524075))

(assert (=> b!546661 m!524075))

(declare-fun m!524077 () Bool)

(assert (=> b!546661 m!524077))

(declare-fun m!524079 () Bool)

(assert (=> b!546662 m!524079))

(push 1)

(assert (not start!49730))

(assert (not b!546663))

(assert (not b!546665))

(assert (not b!546661))

