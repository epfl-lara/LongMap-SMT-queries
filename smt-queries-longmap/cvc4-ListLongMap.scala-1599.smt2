; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30254 () Bool)

(assert start!30254)

(declare-fun b!302648 () Bool)

(declare-fun res!160284 () Bool)

(declare-fun e!190630 () Bool)

(assert (=> b!302648 (=> (not res!160284) (not e!190630))))

(declare-datatypes ((array!15364 0))(
  ( (array!15365 (arr!7270 (Array (_ BitVec 32) (_ BitVec 64))) (size!7623 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15364)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302648 (= res!160284 (and (= (size!7623 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7623 a!3293))))))

(declare-fun res!160282 () Bool)

(assert (=> start!30254 (=> (not res!160282) (not e!190630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30254 (= res!160282 (validMask!0 mask!3709))))

(assert (=> start!30254 e!190630))

(declare-fun array_inv!5242 (array!15364) Bool)

(assert (=> start!30254 (array_inv!5242 a!3293)))

(assert (=> start!30254 true))

(declare-fun b!302649 () Bool)

(assert (=> b!302649 (= e!190630 false)))

(declare-datatypes ((SeekEntryResult!2409 0))(
  ( (MissingZero!2409 (index!11812 (_ BitVec 32))) (Found!2409 (index!11813 (_ BitVec 32))) (Intermediate!2409 (undefined!3221 Bool) (index!11814 (_ BitVec 32)) (x!30093 (_ BitVec 32))) (Undefined!2409) (MissingVacant!2409 (index!11815 (_ BitVec 32))) )
))
(declare-fun lt!149912 () SeekEntryResult!2409)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15364 (_ BitVec 32)) SeekEntryResult!2409)

(assert (=> b!302649 (= lt!149912 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302650 () Bool)

(declare-fun res!160283 () Bool)

(assert (=> b!302650 (=> (not res!160283) (not e!190630))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15364 (_ BitVec 32)) SeekEntryResult!2409)

(assert (=> b!302650 (= res!160283 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2409 i!1240)))))

(declare-fun b!302651 () Bool)

(declare-fun res!160280 () Bool)

(assert (=> b!302651 (=> (not res!160280) (not e!190630))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302651 (= res!160280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2409 false resIndex!52 resX!52)))))

(declare-fun b!302652 () Bool)

(declare-fun res!160286 () Bool)

(assert (=> b!302652 (=> (not res!160286) (not e!190630))))

(assert (=> b!302652 (= res!160286 (and (= (select (arr!7270 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7623 a!3293))))))

(declare-fun b!302653 () Bool)

(declare-fun res!160287 () Bool)

(assert (=> b!302653 (=> (not res!160287) (not e!190630))))

(declare-fun arrayContainsKey!0 (array!15364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302653 (= res!160287 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302654 () Bool)

(declare-fun res!160285 () Bool)

(assert (=> b!302654 (=> (not res!160285) (not e!190630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302654 (= res!160285 (validKeyInArray!0 k!2441))))

(declare-fun b!302655 () Bool)

(declare-fun res!160281 () Bool)

(assert (=> b!302655 (=> (not res!160281) (not e!190630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15364 (_ BitVec 32)) Bool)

(assert (=> b!302655 (= res!160281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30254 res!160282) b!302648))

(assert (= (and b!302648 res!160284) b!302654))

(assert (= (and b!302654 res!160285) b!302653))

(assert (= (and b!302653 res!160287) b!302650))

(assert (= (and b!302650 res!160283) b!302655))

(assert (= (and b!302655 res!160281) b!302651))

(assert (= (and b!302651 res!160280) b!302652))

(assert (= (and b!302652 res!160286) b!302649))

(declare-fun m!313635 () Bool)

(assert (=> b!302651 m!313635))

(assert (=> b!302651 m!313635))

(declare-fun m!313637 () Bool)

(assert (=> b!302651 m!313637))

(declare-fun m!313639 () Bool)

(assert (=> b!302653 m!313639))

(declare-fun m!313641 () Bool)

(assert (=> start!30254 m!313641))

(declare-fun m!313643 () Bool)

(assert (=> start!30254 m!313643))

(declare-fun m!313645 () Bool)

(assert (=> b!302652 m!313645))

(declare-fun m!313647 () Bool)

(assert (=> b!302650 m!313647))

(declare-fun m!313649 () Bool)

(assert (=> b!302655 m!313649))

(declare-fun m!313651 () Bool)

(assert (=> b!302649 m!313651))

(declare-fun m!313653 () Bool)

(assert (=> b!302654 m!313653))

(push 1)

(assert (not b!302651))

(assert (not b!302653))

(assert (not b!302650))

(assert (not b!302654))

(assert (not b!302655))

(assert (not start!30254))

(assert (not b!302649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

