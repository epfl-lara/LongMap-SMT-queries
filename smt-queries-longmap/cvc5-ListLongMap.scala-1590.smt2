; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30154 () Bool)

(assert start!30154)

(declare-fun res!159592 () Bool)

(declare-fun e!190331 () Bool)

(assert (=> start!30154 (=> (not res!159592) (not e!190331))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30154 (= res!159592 (validMask!0 mask!3709))))

(assert (=> start!30154 e!190331))

(declare-datatypes ((array!15309 0))(
  ( (array!15310 (arr!7244 (Array (_ BitVec 32) (_ BitVec 64))) (size!7597 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15309)

(declare-fun array_inv!5216 (array!15309) Bool)

(assert (=> start!30154 (array_inv!5216 a!3293)))

(assert (=> start!30154 true))

(declare-fun b!301836 () Bool)

(declare-fun res!159597 () Bool)

(assert (=> b!301836 (=> (not res!159597) (not e!190331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15309 (_ BitVec 32)) Bool)

(assert (=> b!301836 (= res!159597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301837 () Bool)

(declare-fun res!159593 () Bool)

(assert (=> b!301837 (=> (not res!159593) (not e!190331))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301837 (= res!159593 (and (= (size!7597 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7597 a!3293))))))

(declare-fun b!301838 () Bool)

(declare-fun res!159591 () Bool)

(assert (=> b!301838 (=> (not res!159591) (not e!190331))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2383 0))(
  ( (MissingZero!2383 (index!11708 (_ BitVec 32))) (Found!2383 (index!11709 (_ BitVec 32))) (Intermediate!2383 (undefined!3195 Bool) (index!11710 (_ BitVec 32)) (x!29989 (_ BitVec 32))) (Undefined!2383) (MissingVacant!2383 (index!11711 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15309 (_ BitVec 32)) SeekEntryResult!2383)

(assert (=> b!301838 (= res!159591 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2383 i!1240)))))

(declare-fun b!301839 () Bool)

(declare-fun res!159594 () Bool)

(assert (=> b!301839 (=> (not res!159594) (not e!190331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301839 (= res!159594 (validKeyInArray!0 k!2441))))

(declare-fun b!301840 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!301840 (= e!190331 (and (= (select (arr!7244 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7597 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!301841 () Bool)

(declare-fun res!159595 () Bool)

(assert (=> b!301841 (=> (not res!159595) (not e!190331))))

(declare-fun arrayContainsKey!0 (array!15309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301841 (= res!159595 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301842 () Bool)

(declare-fun res!159596 () Bool)

(assert (=> b!301842 (=> (not res!159596) (not e!190331))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15309 (_ BitVec 32)) SeekEntryResult!2383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301842 (= res!159596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2383 false resIndex!52 resX!52)))))

(assert (= (and start!30154 res!159592) b!301837))

(assert (= (and b!301837 res!159593) b!301839))

(assert (= (and b!301839 res!159594) b!301841))

(assert (= (and b!301841 res!159595) b!301838))

(assert (= (and b!301838 res!159591) b!301836))

(assert (= (and b!301836 res!159597) b!301842))

(assert (= (and b!301842 res!159596) b!301840))

(declare-fun m!313021 () Bool)

(assert (=> b!301836 m!313021))

(declare-fun m!313023 () Bool)

(assert (=> b!301841 m!313023))

(declare-fun m!313025 () Bool)

(assert (=> start!30154 m!313025))

(declare-fun m!313027 () Bool)

(assert (=> start!30154 m!313027))

(declare-fun m!313029 () Bool)

(assert (=> b!301840 m!313029))

(declare-fun m!313031 () Bool)

(assert (=> b!301838 m!313031))

(declare-fun m!313033 () Bool)

(assert (=> b!301842 m!313033))

(assert (=> b!301842 m!313033))

(declare-fun m!313035 () Bool)

(assert (=> b!301842 m!313035))

(declare-fun m!313037 () Bool)

(assert (=> b!301839 m!313037))

(push 1)

(assert (not b!301839))

(assert (not b!301838))

(assert (not b!301841))

(assert (not start!30154))

(assert (not b!301842))

(assert (not b!301836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

