; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30270 () Bool)

(assert start!30270)

(declare-datatypes ((array!15389 0))(
  ( (array!15390 (arr!7282 (Array (_ BitVec 32) (_ BitVec 64))) (size!7634 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15389)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!190831 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!303073 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!303073 (= e!190831 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7282 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7282 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7282 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303074 () Bool)

(declare-fun res!160611 () Bool)

(declare-fun e!190832 () Bool)

(assert (=> b!303074 (=> (not res!160611) (not e!190832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15389 (_ BitVec 32)) Bool)

(assert (=> b!303074 (= res!160611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303075 () Bool)

(declare-fun res!160617 () Bool)

(assert (=> b!303075 (=> (not res!160617) (not e!190832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303075 (= res!160617 (validKeyInArray!0 k0!2441))))

(declare-fun b!303076 () Bool)

(declare-fun res!160610 () Bool)

(assert (=> b!303076 (=> (not res!160610) (not e!190832))))

(declare-fun arrayContainsKey!0 (array!15389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303076 (= res!160610 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160612 () Bool)

(assert (=> start!30270 (=> (not res!160612) (not e!190832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30270 (= res!160612 (validMask!0 mask!3709))))

(assert (=> start!30270 e!190832))

(declare-fun array_inv!5232 (array!15389) Bool)

(assert (=> start!30270 (array_inv!5232 a!3293)))

(assert (=> start!30270 true))

(declare-fun b!303077 () Bool)

(declare-fun res!160615 () Bool)

(assert (=> b!303077 (=> (not res!160615) (not e!190832))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303077 (= res!160615 (and (= (size!7634 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7634 a!3293))))))

(declare-fun b!303078 () Bool)

(declare-fun res!160609 () Bool)

(assert (=> b!303078 (=> (not res!160609) (not e!190832))))

(declare-datatypes ((SeekEntryResult!2387 0))(
  ( (MissingZero!2387 (index!11724 (_ BitVec 32))) (Found!2387 (index!11725 (_ BitVec 32))) (Intermediate!2387 (undefined!3199 Bool) (index!11726 (_ BitVec 32)) (x!30097 (_ BitVec 32))) (Undefined!2387) (MissingVacant!2387 (index!11727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15389 (_ BitVec 32)) SeekEntryResult!2387)

(assert (=> b!303078 (= res!160609 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2387 i!1240)))))

(declare-fun b!303079 () Bool)

(declare-fun res!160614 () Bool)

(assert (=> b!303079 (=> (not res!160614) (not e!190831))))

(declare-fun lt!150189 () SeekEntryResult!2387)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15389 (_ BitVec 32)) SeekEntryResult!2387)

(assert (=> b!303079 (= res!160614 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150189))))

(declare-fun b!303080 () Bool)

(declare-fun res!160613 () Bool)

(assert (=> b!303080 (=> (not res!160613) (not e!190831))))

(assert (=> b!303080 (= res!160613 (and (= (select (arr!7282 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7634 a!3293))))))

(declare-fun b!303081 () Bool)

(assert (=> b!303081 (= e!190832 e!190831)))

(declare-fun res!160616 () Bool)

(assert (=> b!303081 (=> (not res!160616) (not e!190831))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303081 (= res!160616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150189))))

(assert (=> b!303081 (= lt!150189 (Intermediate!2387 false resIndex!52 resX!52))))

(assert (= (and start!30270 res!160612) b!303077))

(assert (= (and b!303077 res!160615) b!303075))

(assert (= (and b!303075 res!160617) b!303076))

(assert (= (and b!303076 res!160610) b!303078))

(assert (= (and b!303078 res!160609) b!303074))

(assert (= (and b!303074 res!160611) b!303081))

(assert (= (and b!303081 res!160616) b!303080))

(assert (= (and b!303080 res!160613) b!303079))

(assert (= (and b!303079 res!160614) b!303073))

(declare-fun m!314641 () Bool)

(assert (=> b!303079 m!314641))

(declare-fun m!314643 () Bool)

(assert (=> start!30270 m!314643))

(declare-fun m!314645 () Bool)

(assert (=> start!30270 m!314645))

(declare-fun m!314647 () Bool)

(assert (=> b!303081 m!314647))

(assert (=> b!303081 m!314647))

(declare-fun m!314649 () Bool)

(assert (=> b!303081 m!314649))

(declare-fun m!314651 () Bool)

(assert (=> b!303080 m!314651))

(declare-fun m!314653 () Bool)

(assert (=> b!303076 m!314653))

(declare-fun m!314655 () Bool)

(assert (=> b!303075 m!314655))

(declare-fun m!314657 () Bool)

(assert (=> b!303078 m!314657))

(declare-fun m!314659 () Bool)

(assert (=> b!303074 m!314659))

(declare-fun m!314661 () Bool)

(assert (=> b!303073 m!314661))

(check-sat (not b!303075) (not b!303079) (not b!303076) (not b!303081) (not b!303078) (not b!303074) (not start!30270))
(check-sat)
