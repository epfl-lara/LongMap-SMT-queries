; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48226 () Bool)

(assert start!48226)

(declare-fun b!530893 () Bool)

(declare-fun res!326601 () Bool)

(declare-fun e!309242 () Bool)

(assert (=> b!530893 (=> (not res!326601) (not e!309242))))

(declare-datatypes ((array!33651 0))(
  ( (array!33652 (arr!16172 (Array (_ BitVec 32) (_ BitVec 64))) (size!16536 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33651)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530893 (= res!326601 (validKeyInArray!0 (select (arr!16172 a!3154) j!147)))))

(declare-fun b!530894 () Bool)

(declare-fun res!326600 () Bool)

(assert (=> b!530894 (=> (not res!326600) (not e!309242))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530894 (= res!326600 (validKeyInArray!0 k!1998))))

(declare-fun b!530895 () Bool)

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4630 0))(
  ( (MissingZero!4630 (index!20744 (_ BitVec 32))) (Found!4630 (index!20745 (_ BitVec 32))) (Intermediate!4630 (undefined!5442 Bool) (index!20746 (_ BitVec 32)) (x!49724 (_ BitVec 32))) (Undefined!4630) (MissingVacant!4630 (index!20747 (_ BitVec 32))) )
))
(declare-fun lt!244819 () SeekEntryResult!4630)

(assert (=> b!530895 (= e!309242 (and (or (= lt!244819 (MissingZero!4630 i!1153)) (= lt!244819 (MissingVacant!4630 i!1153))) (bvsgt #b00000000000000000000000000000000 (size!16536 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33651 (_ BitVec 32)) SeekEntryResult!4630)

(assert (=> b!530895 (= lt!244819 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530897 () Bool)

(declare-fun res!326603 () Bool)

(assert (=> b!530897 (=> (not res!326603) (not e!309242))))

(declare-fun arrayContainsKey!0 (array!33651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530897 (= res!326603 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530896 () Bool)

(declare-fun res!326599 () Bool)

(assert (=> b!530896 (=> (not res!326599) (not e!309242))))

(assert (=> b!530896 (= res!326599 (and (= (size!16536 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16536 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16536 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326602 () Bool)

(assert (=> start!48226 (=> (not res!326602) (not e!309242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48226 (= res!326602 (validMask!0 mask!3216))))

(assert (=> start!48226 e!309242))

(assert (=> start!48226 true))

(declare-fun array_inv!11968 (array!33651) Bool)

(assert (=> start!48226 (array_inv!11968 a!3154)))

(assert (= (and start!48226 res!326602) b!530896))

(assert (= (and b!530896 res!326599) b!530893))

(assert (= (and b!530893 res!326601) b!530894))

(assert (= (and b!530894 res!326600) b!530897))

(assert (= (and b!530897 res!326603) b!530895))

(declare-fun m!511435 () Bool)

(assert (=> b!530893 m!511435))

(assert (=> b!530893 m!511435))

(declare-fun m!511437 () Bool)

(assert (=> b!530893 m!511437))

(declare-fun m!511439 () Bool)

(assert (=> start!48226 m!511439))

(declare-fun m!511441 () Bool)

(assert (=> start!48226 m!511441))

(declare-fun m!511443 () Bool)

(assert (=> b!530895 m!511443))

(declare-fun m!511445 () Bool)

(assert (=> b!530897 m!511445))

(declare-fun m!511447 () Bool)

(assert (=> b!530894 m!511447))

(push 1)

(assert (not b!530895))

(assert (not b!530894))

(assert (not b!530893))

(assert (not start!48226))

(assert (not b!530897))

(check-sat)

(pop 1)

