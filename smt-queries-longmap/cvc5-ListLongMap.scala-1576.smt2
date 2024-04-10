; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30006 () Bool)

(assert start!30006)

(declare-fun b!301128 () Bool)

(declare-fun res!158879 () Bool)

(declare-fun e!190099 () Bool)

(assert (=> b!301128 (=> (not res!158879) (not e!190099))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301128 (= res!158879 (validKeyInArray!0 k!2441))))

(declare-fun b!301129 () Bool)

(declare-fun res!158877 () Bool)

(assert (=> b!301129 (=> (not res!158877) (not e!190099))))

(declare-datatypes ((array!15226 0))(
  ( (array!15227 (arr!7205 (Array (_ BitVec 32) (_ BitVec 64))) (size!7557 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15226)

(declare-fun arrayContainsKey!0 (array!15226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301129 (= res!158877 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!158878 () Bool)

(assert (=> start!30006 (=> (not res!158878) (not e!190099))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30006 (= res!158878 (validMask!0 mask!3709))))

(assert (=> start!30006 e!190099))

(assert (=> start!30006 true))

(declare-fun array_inv!5168 (array!15226) Bool)

(assert (=> start!30006 (array_inv!5168 a!3293)))

(declare-fun b!301130 () Bool)

(assert (=> b!301130 (= e!190099 false)))

(declare-datatypes ((SeekEntryResult!2345 0))(
  ( (MissingZero!2345 (index!11556 (_ BitVec 32))) (Found!2345 (index!11557 (_ BitVec 32))) (Intermediate!2345 (undefined!3157 Bool) (index!11558 (_ BitVec 32)) (x!29841 (_ BitVec 32))) (Undefined!2345) (MissingVacant!2345 (index!11559 (_ BitVec 32))) )
))
(declare-fun lt!149775 () SeekEntryResult!2345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15226 (_ BitVec 32)) SeekEntryResult!2345)

(assert (=> b!301130 (= lt!149775 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301127 () Bool)

(declare-fun res!158880 () Bool)

(assert (=> b!301127 (=> (not res!158880) (not e!190099))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301127 (= res!158880 (and (= (size!7557 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7557 a!3293))))))

(assert (= (and start!30006 res!158878) b!301127))

(assert (= (and b!301127 res!158880) b!301128))

(assert (= (and b!301128 res!158879) b!301129))

(assert (= (and b!301129 res!158877) b!301130))

(declare-fun m!312999 () Bool)

(assert (=> b!301128 m!312999))

(declare-fun m!313001 () Bool)

(assert (=> b!301129 m!313001))

(declare-fun m!313003 () Bool)

(assert (=> start!30006 m!313003))

(declare-fun m!313005 () Bool)

(assert (=> start!30006 m!313005))

(declare-fun m!313007 () Bool)

(assert (=> b!301130 m!313007))

(push 1)

(assert (not b!301128))

(assert (not b!301130))

(assert (not b!301129))

(assert (not start!30006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

