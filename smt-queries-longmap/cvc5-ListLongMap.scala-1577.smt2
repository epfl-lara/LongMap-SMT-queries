; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30012 () Bool)

(assert start!30012)

(declare-fun b!301166 () Bool)

(declare-fun e!190116 () Bool)

(assert (=> b!301166 (= e!190116 false)))

(declare-datatypes ((array!15232 0))(
  ( (array!15233 (arr!7208 (Array (_ BitVec 32) (_ BitVec 64))) (size!7560 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15232)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2348 0))(
  ( (MissingZero!2348 (index!11568 (_ BitVec 32))) (Found!2348 (index!11569 (_ BitVec 32))) (Intermediate!2348 (undefined!3160 Bool) (index!11570 (_ BitVec 32)) (x!29852 (_ BitVec 32))) (Undefined!2348) (MissingVacant!2348 (index!11571 (_ BitVec 32))) )
))
(declare-fun lt!149784 () SeekEntryResult!2348)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15232 (_ BitVec 32)) SeekEntryResult!2348)

(assert (=> b!301166 (= lt!149784 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301164 () Bool)

(declare-fun res!158916 () Bool)

(assert (=> b!301164 (=> (not res!158916) (not e!190116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301164 (= res!158916 (validKeyInArray!0 k!2441))))

(declare-fun res!158915 () Bool)

(assert (=> start!30012 (=> (not res!158915) (not e!190116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30012 (= res!158915 (validMask!0 mask!3709))))

(assert (=> start!30012 e!190116))

(assert (=> start!30012 true))

(declare-fun array_inv!5171 (array!15232) Bool)

(assert (=> start!30012 (array_inv!5171 a!3293)))

(declare-fun b!301165 () Bool)

(declare-fun res!158913 () Bool)

(assert (=> b!301165 (=> (not res!158913) (not e!190116))))

(declare-fun arrayContainsKey!0 (array!15232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301165 (= res!158913 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301163 () Bool)

(declare-fun res!158914 () Bool)

(assert (=> b!301163 (=> (not res!158914) (not e!190116))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301163 (= res!158914 (and (= (size!7560 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7560 a!3293))))))

(assert (= (and start!30012 res!158915) b!301163))

(assert (= (and b!301163 res!158914) b!301164))

(assert (= (and b!301164 res!158916) b!301165))

(assert (= (and b!301165 res!158913) b!301166))

(declare-fun m!313029 () Bool)

(assert (=> b!301166 m!313029))

(declare-fun m!313031 () Bool)

(assert (=> b!301164 m!313031))

(declare-fun m!313033 () Bool)

(assert (=> start!30012 m!313033))

(declare-fun m!313035 () Bool)

(assert (=> start!30012 m!313035))

(declare-fun m!313037 () Bool)

(assert (=> b!301165 m!313037))

(push 1)

(assert (not b!301165))

(assert (not start!30012))

(assert (not b!301164))

(assert (not b!301166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

