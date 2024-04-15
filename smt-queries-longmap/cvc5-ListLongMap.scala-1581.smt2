; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30058 () Bool)

(assert start!30058)

(declare-fun b!301225 () Bool)

(declare-fun res!159053 () Bool)

(declare-fun e!190096 () Bool)

(assert (=> b!301225 (=> (not res!159053) (not e!190096))))

(declare-datatypes ((array!15252 0))(
  ( (array!15253 (arr!7217 (Array (_ BitVec 32) (_ BitVec 64))) (size!7570 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15252)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!301225 (= res!159053 (and (= (size!7570 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7570 a!3293))))))

(declare-fun res!159054 () Bool)

(assert (=> start!30058 (=> (not res!159054) (not e!190096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30058 (= res!159054 (validMask!0 mask!3709))))

(assert (=> start!30058 e!190096))

(assert (=> start!30058 true))

(declare-fun array_inv!5189 (array!15252) Bool)

(assert (=> start!30058 (array_inv!5189 a!3293)))

(declare-fun b!301226 () Bool)

(declare-fun res!159050 () Bool)

(assert (=> b!301226 (=> (not res!159050) (not e!190096))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301226 (= res!159050 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301227 () Bool)

(declare-fun res!159049 () Bool)

(assert (=> b!301227 (=> (not res!159049) (not e!190096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301227 (= res!159049 (validKeyInArray!0 k!2441))))

(declare-fun b!301228 () Bool)

(declare-fun res!159051 () Bool)

(assert (=> b!301228 (=> (not res!159051) (not e!190096))))

(declare-datatypes ((SeekEntryResult!2356 0))(
  ( (MissingZero!2356 (index!11600 (_ BitVec 32))) (Found!2356 (index!11601 (_ BitVec 32))) (Intermediate!2356 (undefined!3168 Bool) (index!11602 (_ BitVec 32)) (x!29887 (_ BitVec 32))) (Undefined!2356) (MissingVacant!2356 (index!11603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15252 (_ BitVec 32)) SeekEntryResult!2356)

(assert (=> b!301228 (= res!159051 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2356 i!1240)))))

(declare-fun b!301229 () Bool)

(declare-fun res!159052 () Bool)

(assert (=> b!301229 (=> (not res!159052) (not e!190096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15252 (_ BitVec 32)) Bool)

(assert (=> b!301229 (= res!159052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301230 () Bool)

(assert (=> b!301230 (= e!190096 false)))

(declare-fun lt!149618 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301230 (= lt!149618 (toIndex!0 k!2441 mask!3709))))

(assert (= (and start!30058 res!159054) b!301225))

(assert (= (and b!301225 res!159053) b!301227))

(assert (= (and b!301227 res!159049) b!301226))

(assert (= (and b!301226 res!159050) b!301228))

(assert (= (and b!301228 res!159051) b!301229))

(assert (= (and b!301229 res!159052) b!301230))

(declare-fun m!312533 () Bool)

(assert (=> b!301228 m!312533))

(declare-fun m!312535 () Bool)

(assert (=> b!301229 m!312535))

(declare-fun m!312537 () Bool)

(assert (=> start!30058 m!312537))

(declare-fun m!312539 () Bool)

(assert (=> start!30058 m!312539))

(declare-fun m!312541 () Bool)

(assert (=> b!301230 m!312541))

(declare-fun m!312543 () Bool)

(assert (=> b!301227 m!312543))

(declare-fun m!312545 () Bool)

(assert (=> b!301226 m!312545))

(push 1)

(assert (not b!301229))

(assert (not b!301230))

(assert (not b!301228))

(assert (not b!301226))

(assert (not b!301227))

(assert (not start!30058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

