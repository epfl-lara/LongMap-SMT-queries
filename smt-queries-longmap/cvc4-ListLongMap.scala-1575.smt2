; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30004 () Bool)

(assert start!30004)

(declare-fun b!301117 () Bool)

(declare-fun res!158865 () Bool)

(declare-fun e!190093 () Bool)

(assert (=> b!301117 (=> (not res!158865) (not e!190093))))

(declare-datatypes ((array!15224 0))(
  ( (array!15225 (arr!7204 (Array (_ BitVec 32) (_ BitVec 64))) (size!7556 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15224)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301117 (= res!158865 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!158866 () Bool)

(assert (=> start!30004 (=> (not res!158866) (not e!190093))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30004 (= res!158866 (validMask!0 mask!3709))))

(assert (=> start!30004 e!190093))

(assert (=> start!30004 true))

(declare-fun array_inv!5167 (array!15224) Bool)

(assert (=> start!30004 (array_inv!5167 a!3293)))

(declare-fun b!301115 () Bool)

(declare-fun res!158867 () Bool)

(assert (=> b!301115 (=> (not res!158867) (not e!190093))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301115 (= res!158867 (and (= (size!7556 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7556 a!3293))))))

(declare-fun b!301116 () Bool)

(declare-fun res!158868 () Bool)

(assert (=> b!301116 (=> (not res!158868) (not e!190093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301116 (= res!158868 (validKeyInArray!0 k!2441))))

(declare-fun b!301118 () Bool)

(assert (=> b!301118 (= e!190093 false)))

(declare-datatypes ((SeekEntryResult!2344 0))(
  ( (MissingZero!2344 (index!11552 (_ BitVec 32))) (Found!2344 (index!11553 (_ BitVec 32))) (Intermediate!2344 (undefined!3156 Bool) (index!11554 (_ BitVec 32)) (x!29832 (_ BitVec 32))) (Undefined!2344) (MissingVacant!2344 (index!11555 (_ BitVec 32))) )
))
(declare-fun lt!149772 () SeekEntryResult!2344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15224 (_ BitVec 32)) SeekEntryResult!2344)

(assert (=> b!301118 (= lt!149772 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(assert (= (and start!30004 res!158866) b!301115))

(assert (= (and b!301115 res!158867) b!301116))

(assert (= (and b!301116 res!158868) b!301117))

(assert (= (and b!301117 res!158865) b!301118))

(declare-fun m!312989 () Bool)

(assert (=> b!301117 m!312989))

(declare-fun m!312991 () Bool)

(assert (=> start!30004 m!312991))

(declare-fun m!312993 () Bool)

(assert (=> start!30004 m!312993))

(declare-fun m!312995 () Bool)

(assert (=> b!301116 m!312995))

(declare-fun m!312997 () Bool)

(assert (=> b!301118 m!312997))

(push 1)

(assert (not b!301118))

(assert (not b!301116))

(assert (not b!301117))

(assert (not start!30004))

(check-sat)

