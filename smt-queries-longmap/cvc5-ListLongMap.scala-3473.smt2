; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48180 () Bool)

(assert start!48180)

(declare-fun b!530539 () Bool)

(declare-fun res!326249 () Bool)

(declare-fun e!309104 () Bool)

(assert (=> b!530539 (=> (not res!326249) (not e!309104))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530539 (= res!326249 (validKeyInArray!0 k!1998))))

(declare-fun b!530540 () Bool)

(declare-fun res!326245 () Bool)

(assert (=> b!530540 (=> (not res!326245) (not e!309104))))

(declare-datatypes ((array!33605 0))(
  ( (array!33606 (arr!16149 (Array (_ BitVec 32) (_ BitVec 64))) (size!16513 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33605)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530540 (= res!326245 (validKeyInArray!0 (select (arr!16149 a!3154) j!147)))))

(declare-fun b!530541 () Bool)

(assert (=> b!530541 (= e!309104 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4607 0))(
  ( (MissingZero!4607 (index!20652 (_ BitVec 32))) (Found!4607 (index!20653 (_ BitVec 32))) (Intermediate!4607 (undefined!5419 Bool) (index!20654 (_ BitVec 32)) (x!49645 (_ BitVec 32))) (Undefined!4607) (MissingVacant!4607 (index!20655 (_ BitVec 32))) )
))
(declare-fun lt!244759 () SeekEntryResult!4607)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33605 (_ BitVec 32)) SeekEntryResult!4607)

(assert (=> b!530541 (= lt!244759 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530542 () Bool)

(declare-fun res!326246 () Bool)

(assert (=> b!530542 (=> (not res!326246) (not e!309104))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530542 (= res!326246 (and (= (size!16513 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16513 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16513 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326247 () Bool)

(assert (=> start!48180 (=> (not res!326247) (not e!309104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48180 (= res!326247 (validMask!0 mask!3216))))

(assert (=> start!48180 e!309104))

(assert (=> start!48180 true))

(declare-fun array_inv!11945 (array!33605) Bool)

(assert (=> start!48180 (array_inv!11945 a!3154)))

(declare-fun b!530543 () Bool)

(declare-fun res!326248 () Bool)

(assert (=> b!530543 (=> (not res!326248) (not e!309104))))

(declare-fun arrayContainsKey!0 (array!33605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530543 (= res!326248 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48180 res!326247) b!530542))

(assert (= (and b!530542 res!326246) b!530540))

(assert (= (and b!530540 res!326245) b!530539))

(assert (= (and b!530539 res!326249) b!530543))

(assert (= (and b!530543 res!326248) b!530541))

(declare-fun m!511113 () Bool)

(assert (=> b!530541 m!511113))

(declare-fun m!511115 () Bool)

(assert (=> b!530540 m!511115))

(assert (=> b!530540 m!511115))

(declare-fun m!511117 () Bool)

(assert (=> b!530540 m!511117))

(declare-fun m!511119 () Bool)

(assert (=> b!530539 m!511119))

(declare-fun m!511121 () Bool)

(assert (=> b!530543 m!511121))

(declare-fun m!511123 () Bool)

(assert (=> start!48180 m!511123))

(declare-fun m!511125 () Bool)

(assert (=> start!48180 m!511125))

(push 1)

(assert (not start!48180))

(assert (not b!530543))

(assert (not b!530539))

(assert (not b!530540))

(assert (not b!530541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

