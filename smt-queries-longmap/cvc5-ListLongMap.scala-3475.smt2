; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48192 () Bool)

(assert start!48192)

(declare-fun b!530638 () Bool)

(declare-fun res!326347 () Bool)

(declare-fun e!309141 () Bool)

(assert (=> b!530638 (=> (not res!326347) (not e!309141))))

(declare-datatypes ((array!33617 0))(
  ( (array!33618 (arr!16155 (Array (_ BitVec 32) (_ BitVec 64))) (size!16519 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33617)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530638 (= res!326347 (validKeyInArray!0 (select (arr!16155 a!3154) j!147)))))

(declare-fun b!530639 () Bool)

(declare-fun res!326344 () Bool)

(assert (=> b!530639 (=> (not res!326344) (not e!309141))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530639 (= res!326344 (validKeyInArray!0 k!1998))))

(declare-fun b!530640 () Bool)

(declare-fun res!326346 () Bool)

(assert (=> b!530640 (=> (not res!326346) (not e!309141))))

(declare-fun arrayContainsKey!0 (array!33617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530640 (= res!326346 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530641 () Bool)

(assert (=> b!530641 (= e!309141 false)))

(declare-datatypes ((SeekEntryResult!4613 0))(
  ( (MissingZero!4613 (index!20676 (_ BitVec 32))) (Found!4613 (index!20677 (_ BitVec 32))) (Intermediate!4613 (undefined!5425 Bool) (index!20678 (_ BitVec 32)) (x!49667 (_ BitVec 32))) (Undefined!4613) (MissingVacant!4613 (index!20679 (_ BitVec 32))) )
))
(declare-fun lt!244768 () SeekEntryResult!4613)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33617 (_ BitVec 32)) SeekEntryResult!4613)

(assert (=> b!530641 (= lt!244768 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530642 () Bool)

(declare-fun res!326348 () Bool)

(assert (=> b!530642 (=> (not res!326348) (not e!309141))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530642 (= res!326348 (and (= (size!16519 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16519 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16519 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326345 () Bool)

(assert (=> start!48192 (=> (not res!326345) (not e!309141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48192 (= res!326345 (validMask!0 mask!3216))))

(assert (=> start!48192 e!309141))

(assert (=> start!48192 true))

(declare-fun array_inv!11951 (array!33617) Bool)

(assert (=> start!48192 (array_inv!11951 a!3154)))

(assert (= (and start!48192 res!326345) b!530642))

(assert (= (and b!530642 res!326348) b!530638))

(assert (= (and b!530638 res!326347) b!530639))

(assert (= (and b!530639 res!326344) b!530640))

(assert (= (and b!530640 res!326346) b!530641))

(declare-fun m!511197 () Bool)

(assert (=> b!530640 m!511197))

(declare-fun m!511199 () Bool)

(assert (=> b!530638 m!511199))

(assert (=> b!530638 m!511199))

(declare-fun m!511201 () Bool)

(assert (=> b!530638 m!511201))

(declare-fun m!511203 () Bool)

(assert (=> b!530641 m!511203))

(declare-fun m!511205 () Bool)

(assert (=> b!530639 m!511205))

(declare-fun m!511207 () Bool)

(assert (=> start!48192 m!511207))

(declare-fun m!511209 () Bool)

(assert (=> start!48192 m!511209))

(push 1)

(assert (not b!530638))

(assert (not b!530641))

(assert (not start!48192))

(assert (not b!530640))

(assert (not b!530639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

