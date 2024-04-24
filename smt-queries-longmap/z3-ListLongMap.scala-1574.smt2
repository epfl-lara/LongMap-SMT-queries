; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29976 () Bool)

(assert start!29976)

(declare-fun b!301004 () Bool)

(declare-fun res!158805 () Bool)

(declare-fun e!190028 () Bool)

(assert (=> b!301004 (=> (not res!158805) (not e!190028))))

(declare-datatypes ((array!15212 0))(
  ( (array!15213 (arr!7198 (Array (_ BitVec 32) (_ BitVec 64))) (size!7550 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15212)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301004 (= res!158805 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301003 () Bool)

(declare-fun res!158802 () Bool)

(assert (=> b!301003 (=> (not res!158802) (not e!190028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301003 (= res!158802 (validKeyInArray!0 k0!2441))))

(declare-fun b!301002 () Bool)

(declare-fun res!158804 () Bool)

(assert (=> b!301002 (=> (not res!158804) (not e!190028))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301002 (= res!158804 (and (= (size!7550 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7550 a!3293))))))

(declare-fun b!301005 () Bool)

(assert (=> b!301005 (= e!190028 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun res!158803 () Bool)

(assert (=> start!29976 (=> (not res!158803) (not e!190028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29976 (= res!158803 (validMask!0 mask!3709))))

(assert (=> start!29976 e!190028))

(assert (=> start!29976 true))

(declare-fun array_inv!5148 (array!15212) Bool)

(assert (=> start!29976 (array_inv!5148 a!3293)))

(assert (= (and start!29976 res!158803) b!301002))

(assert (= (and b!301002 res!158804) b!301003))

(assert (= (and b!301003 res!158802) b!301004))

(assert (= (and b!301004 res!158805) b!301005))

(declare-fun m!313047 () Bool)

(assert (=> b!301004 m!313047))

(declare-fun m!313049 () Bool)

(assert (=> b!301003 m!313049))

(declare-fun m!313051 () Bool)

(assert (=> start!29976 m!313051))

(declare-fun m!313053 () Bool)

(assert (=> start!29976 m!313053))

(check-sat (not b!301003) (not start!29976) (not b!301004))
(check-sat)
