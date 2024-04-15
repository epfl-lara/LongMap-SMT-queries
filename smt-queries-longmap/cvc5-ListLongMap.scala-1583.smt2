; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30070 () Bool)

(assert start!30070)

(declare-fun b!301333 () Bool)

(declare-fun res!159162 () Bool)

(declare-fun e!190133 () Bool)

(assert (=> b!301333 (=> (not res!159162) (not e!190133))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301333 (= res!159162 (validKeyInArray!0 k!2441))))

(declare-fun res!159157 () Bool)

(assert (=> start!30070 (=> (not res!159157) (not e!190133))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30070 (= res!159157 (validMask!0 mask!3709))))

(assert (=> start!30070 e!190133))

(assert (=> start!30070 true))

(declare-datatypes ((array!15264 0))(
  ( (array!15265 (arr!7223 (Array (_ BitVec 32) (_ BitVec 64))) (size!7576 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15264)

(declare-fun array_inv!5195 (array!15264) Bool)

(assert (=> start!30070 (array_inv!5195 a!3293)))

(declare-fun b!301334 () Bool)

(declare-fun res!159158 () Bool)

(assert (=> b!301334 (=> (not res!159158) (not e!190133))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301334 (= res!159158 (and (= (size!7576 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7576 a!3293))))))

(declare-fun b!301335 () Bool)

(declare-fun res!159161 () Bool)

(assert (=> b!301335 (=> (not res!159161) (not e!190133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15264 (_ BitVec 32)) Bool)

(assert (=> b!301335 (= res!159161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301336 () Bool)

(declare-fun res!159160 () Bool)

(assert (=> b!301336 (=> (not res!159160) (not e!190133))))

(declare-datatypes ((SeekEntryResult!2362 0))(
  ( (MissingZero!2362 (index!11624 (_ BitVec 32))) (Found!2362 (index!11625 (_ BitVec 32))) (Intermediate!2362 (undefined!3174 Bool) (index!11626 (_ BitVec 32)) (x!29909 (_ BitVec 32))) (Undefined!2362) (MissingVacant!2362 (index!11627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15264 (_ BitVec 32)) SeekEntryResult!2362)

(assert (=> b!301336 (= res!159160 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2362 i!1240)))))

(declare-fun b!301337 () Bool)

(declare-fun res!159159 () Bool)

(assert (=> b!301337 (=> (not res!159159) (not e!190133))))

(declare-fun arrayContainsKey!0 (array!15264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301337 (= res!159159 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301338 () Bool)

(assert (=> b!301338 (= e!190133 false)))

(declare-fun lt!149636 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301338 (= lt!149636 (toIndex!0 k!2441 mask!3709))))

(assert (= (and start!30070 res!159157) b!301334))

(assert (= (and b!301334 res!159158) b!301333))

(assert (= (and b!301333 res!159162) b!301337))

(assert (= (and b!301337 res!159159) b!301336))

(assert (= (and b!301336 res!159160) b!301335))

(assert (= (and b!301335 res!159161) b!301338))

(declare-fun m!312617 () Bool)

(assert (=> b!301338 m!312617))

(declare-fun m!312619 () Bool)

(assert (=> start!30070 m!312619))

(declare-fun m!312621 () Bool)

(assert (=> start!30070 m!312621))

(declare-fun m!312623 () Bool)

(assert (=> b!301333 m!312623))

(declare-fun m!312625 () Bool)

(assert (=> b!301335 m!312625))

(declare-fun m!312627 () Bool)

(assert (=> b!301336 m!312627))

(declare-fun m!312629 () Bool)

(assert (=> b!301337 m!312629))

(push 1)

(assert (not b!301337))

(assert (not b!301333))

(assert (not b!301335))

(assert (not start!30070))

(assert (not b!301338))

(assert (not b!301336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

