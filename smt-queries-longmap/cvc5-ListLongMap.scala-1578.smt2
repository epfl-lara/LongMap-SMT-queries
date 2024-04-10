; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30018 () Bool)

(assert start!30018)

(declare-fun b!301201 () Bool)

(declare-fun res!158952 () Bool)

(declare-fun e!190134 () Bool)

(assert (=> b!301201 (=> (not res!158952) (not e!190134))))

(declare-datatypes ((array!15238 0))(
  ( (array!15239 (arr!7211 (Array (_ BitVec 32) (_ BitVec 64))) (size!7563 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15238)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2351 0))(
  ( (MissingZero!2351 (index!11580 (_ BitVec 32))) (Found!2351 (index!11581 (_ BitVec 32))) (Intermediate!2351 (undefined!3163 Bool) (index!11582 (_ BitVec 32)) (x!29863 (_ BitVec 32))) (Undefined!2351) (MissingVacant!2351 (index!11583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15238 (_ BitVec 32)) SeekEntryResult!2351)

(assert (=> b!301201 (= res!158952 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2351 i!1240)))))

(declare-fun b!301202 () Bool)

(assert (=> b!301202 (= e!190134 (bvsgt #b00000000000000000000000000000000 (size!7563 a!3293)))))

(declare-fun b!301203 () Bool)

(declare-fun res!158953 () Bool)

(assert (=> b!301203 (=> (not res!158953) (not e!190134))))

(assert (=> b!301203 (= res!158953 (and (= (size!7563 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7563 a!3293))))))

(declare-fun res!158955 () Bool)

(assert (=> start!30018 (=> (not res!158955) (not e!190134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30018 (= res!158955 (validMask!0 mask!3709))))

(assert (=> start!30018 e!190134))

(assert (=> start!30018 true))

(declare-fun array_inv!5174 (array!15238) Bool)

(assert (=> start!30018 (array_inv!5174 a!3293)))

(declare-fun b!301204 () Bool)

(declare-fun res!158954 () Bool)

(assert (=> b!301204 (=> (not res!158954) (not e!190134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301204 (= res!158954 (validKeyInArray!0 k!2441))))

(declare-fun b!301205 () Bool)

(declare-fun res!158951 () Bool)

(assert (=> b!301205 (=> (not res!158951) (not e!190134))))

(declare-fun arrayContainsKey!0 (array!15238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301205 (= res!158951 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30018 res!158955) b!301203))

(assert (= (and b!301203 res!158953) b!301204))

(assert (= (and b!301204 res!158954) b!301205))

(assert (= (and b!301205 res!158951) b!301201))

(assert (= (and b!301201 res!158952) b!301202))

(declare-fun m!313059 () Bool)

(assert (=> b!301201 m!313059))

(declare-fun m!313061 () Bool)

(assert (=> start!30018 m!313061))

(declare-fun m!313063 () Bool)

(assert (=> start!30018 m!313063))

(declare-fun m!313065 () Bool)

(assert (=> b!301204 m!313065))

(declare-fun m!313067 () Bool)

(assert (=> b!301205 m!313067))

(push 1)

(assert (not b!301201))

(assert (not start!30018))

(assert (not b!301205))

