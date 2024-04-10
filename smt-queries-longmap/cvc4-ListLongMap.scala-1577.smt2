; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30016 () Bool)

(assert start!30016)

(declare-fun b!301189 () Bool)

(declare-fun res!158937 () Bool)

(declare-fun e!190128 () Bool)

(assert (=> b!301189 (=> (not res!158937) (not e!190128))))

(declare-datatypes ((array!15236 0))(
  ( (array!15237 (arr!7210 (Array (_ BitVec 32) (_ BitVec 64))) (size!7562 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15236)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301189 (= res!158937 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301190 () Bool)

(assert (=> b!301190 (= e!190128 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2350 0))(
  ( (MissingZero!2350 (index!11576 (_ BitVec 32))) (Found!2350 (index!11577 (_ BitVec 32))) (Intermediate!2350 (undefined!3162 Bool) (index!11578 (_ BitVec 32)) (x!29854 (_ BitVec 32))) (Undefined!2350) (MissingVacant!2350 (index!11579 (_ BitVec 32))) )
))
(declare-fun lt!149790 () SeekEntryResult!2350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15236 (_ BitVec 32)) SeekEntryResult!2350)

(assert (=> b!301190 (= lt!149790 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!301187 () Bool)

(declare-fun res!158939 () Bool)

(assert (=> b!301187 (=> (not res!158939) (not e!190128))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301187 (= res!158939 (and (= (size!7562 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7562 a!3293))))))

(declare-fun res!158938 () Bool)

(assert (=> start!30016 (=> (not res!158938) (not e!190128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30016 (= res!158938 (validMask!0 mask!3709))))

(assert (=> start!30016 e!190128))

(assert (=> start!30016 true))

(declare-fun array_inv!5173 (array!15236) Bool)

(assert (=> start!30016 (array_inv!5173 a!3293)))

(declare-fun b!301188 () Bool)

(declare-fun res!158940 () Bool)

(assert (=> b!301188 (=> (not res!158940) (not e!190128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301188 (= res!158940 (validKeyInArray!0 k!2441))))

(assert (= (and start!30016 res!158938) b!301187))

(assert (= (and b!301187 res!158939) b!301188))

(assert (= (and b!301188 res!158940) b!301189))

(assert (= (and b!301189 res!158937) b!301190))

(declare-fun m!313049 () Bool)

(assert (=> b!301189 m!313049))

(declare-fun m!313051 () Bool)

(assert (=> b!301190 m!313051))

(declare-fun m!313053 () Bool)

(assert (=> start!30016 m!313053))

(declare-fun m!313055 () Bool)

(assert (=> start!30016 m!313055))

(declare-fun m!313057 () Bool)

(assert (=> b!301188 m!313057))

(push 1)

(assert (not b!301189))

(assert (not start!30016))

(assert (not b!301188))

(assert (not b!301190))

(check-sat)

(pop 1)

