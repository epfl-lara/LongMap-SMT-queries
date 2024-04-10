; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49766 () Bool)

(assert start!49766)

(declare-fun e!316053 () Bool)

(declare-datatypes ((SeekEntryResult!5027 0))(
  ( (MissingZero!5027 (index!22335 (_ BitVec 32))) (Found!5027 (index!22336 (_ BitVec 32))) (Intermediate!5027 (undefined!5839 Bool) (index!22337 (_ BitVec 32)) (x!51287 (_ BitVec 32))) (Undefined!5027) (MissingVacant!5027 (index!22338 (_ BitVec 32))) )
))
(declare-fun lt!249394 () SeekEntryResult!5027)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34504 0))(
  ( (array!34505 (arr!16578 (Array (_ BitVec 32) (_ BitVec 64))) (size!16942 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34504)

(declare-fun b!546937 () Bool)

(assert (=> b!546937 (= e!316053 (and (or (= lt!249394 (MissingZero!5027 i!1132)) (= lt!249394 (MissingVacant!5027 i!1132))) (bvsgt #b00000000000000000000000000000000 (size!16942 a!3118))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34504 (_ BitVec 32)) SeekEntryResult!5027)

(assert (=> b!546937 (= lt!249394 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546938 () Bool)

(declare-fun res!340651 () Bool)

(assert (=> b!546938 (=> (not res!340651) (not e!316053))))

(declare-fun arrayContainsKey!0 (array!34504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546938 (= res!340651 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!546939 () Bool)

(declare-fun res!340654 () Bool)

(assert (=> b!546939 (=> (not res!340654) (not e!316053))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546939 (= res!340654 (validKeyInArray!0 (select (arr!16578 a!3118) j!142)))))

(declare-fun b!546940 () Bool)

(declare-fun res!340653 () Bool)

(assert (=> b!546940 (=> (not res!340653) (not e!316053))))

(assert (=> b!546940 (= res!340653 (and (= (size!16942 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16942 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16942 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546941 () Bool)

(declare-fun res!340655 () Bool)

(assert (=> b!546941 (=> (not res!340655) (not e!316053))))

(assert (=> b!546941 (= res!340655 (validKeyInArray!0 k!1914))))

(declare-fun res!340652 () Bool)

(assert (=> start!49766 (=> (not res!340652) (not e!316053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49766 (= res!340652 (validMask!0 mask!3119))))

(assert (=> start!49766 e!316053))

(assert (=> start!49766 true))

(declare-fun array_inv!12374 (array!34504) Bool)

(assert (=> start!49766 (array_inv!12374 a!3118)))

(assert (= (and start!49766 res!340652) b!546940))

(assert (= (and b!546940 res!340653) b!546939))

(assert (= (and b!546939 res!340654) b!546941))

(assert (= (and b!546941 res!340655) b!546938))

(assert (= (and b!546938 res!340651) b!546937))

(declare-fun m!524319 () Bool)

(assert (=> b!546939 m!524319))

(assert (=> b!546939 m!524319))

(declare-fun m!524321 () Bool)

(assert (=> b!546939 m!524321))

(declare-fun m!524323 () Bool)

(assert (=> b!546937 m!524323))

(declare-fun m!524325 () Bool)

(assert (=> b!546938 m!524325))

(declare-fun m!524327 () Bool)

(assert (=> b!546941 m!524327))

(declare-fun m!524329 () Bool)

(assert (=> start!49766 m!524329))

(declare-fun m!524331 () Bool)

(assert (=> start!49766 m!524331))

(push 1)

