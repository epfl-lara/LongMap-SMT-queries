; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30008 () Bool)

(assert start!30008)

(declare-fun b!301141 () Bool)

(declare-fun res!158891 () Bool)

(declare-fun e!190104 () Bool)

(assert (=> b!301141 (=> (not res!158891) (not e!190104))))

(declare-datatypes ((array!15228 0))(
  ( (array!15229 (arr!7206 (Array (_ BitVec 32) (_ BitVec 64))) (size!7558 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15228)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301141 (= res!158891 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301142 () Bool)

(assert (=> b!301142 (= e!190104 false)))

(declare-datatypes ((SeekEntryResult!2346 0))(
  ( (MissingZero!2346 (index!11560 (_ BitVec 32))) (Found!2346 (index!11561 (_ BitVec 32))) (Intermediate!2346 (undefined!3158 Bool) (index!11562 (_ BitVec 32)) (x!29842 (_ BitVec 32))) (Undefined!2346) (MissingVacant!2346 (index!11563 (_ BitVec 32))) )
))
(declare-fun lt!149778 () SeekEntryResult!2346)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15228 (_ BitVec 32)) SeekEntryResult!2346)

(assert (=> b!301142 (= lt!149778 (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709))))

(declare-fun res!158890 () Bool)

(assert (=> start!30008 (=> (not res!158890) (not e!190104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30008 (= res!158890 (validMask!0 mask!3709))))

(assert (=> start!30008 e!190104))

(assert (=> start!30008 true))

(declare-fun array_inv!5169 (array!15228) Bool)

(assert (=> start!30008 (array_inv!5169 a!3293)))

(declare-fun b!301140 () Bool)

(declare-fun res!158892 () Bool)

(assert (=> b!301140 (=> (not res!158892) (not e!190104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301140 (= res!158892 (validKeyInArray!0 k0!2441))))

(declare-fun b!301139 () Bool)

(declare-fun res!158889 () Bool)

(assert (=> b!301139 (=> (not res!158889) (not e!190104))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301139 (= res!158889 (and (= (size!7558 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7558 a!3293))))))

(assert (= (and start!30008 res!158890) b!301139))

(assert (= (and b!301139 res!158889) b!301140))

(assert (= (and b!301140 res!158892) b!301141))

(assert (= (and b!301141 res!158891) b!301142))

(declare-fun m!313009 () Bool)

(assert (=> b!301141 m!313009))

(declare-fun m!313011 () Bool)

(assert (=> b!301142 m!313011))

(declare-fun m!313013 () Bool)

(assert (=> start!30008 m!313013))

(declare-fun m!313015 () Bool)

(assert (=> start!30008 m!313015))

(declare-fun m!313017 () Bool)

(assert (=> b!301140 m!313017))

(check-sat (not b!301141) (not start!30008) (not b!301142) (not b!301140))
(check-sat)
