; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32138 () Bool)

(assert start!32138)

(declare-datatypes ((array!16373 0))(
  ( (array!16374 (arr!7747 (Array (_ BitVec 32) (_ BitVec 64))) (size!8099 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16373)

(declare-fun b!320300 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun e!198771 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!320300 (= e!198771 (and (= (select (arr!7747 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8099 a!3305)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320301 () Bool)

(declare-fun res!174548 () Bool)

(assert (=> b!320301 (=> (not res!174548) (not e!198771))))

(assert (=> b!320301 (= res!174548 (and (= (size!8099 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8099 a!3305))))))

(declare-fun b!320302 () Bool)

(declare-fun res!174549 () Bool)

(assert (=> b!320302 (=> (not res!174549) (not e!198771))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320302 (= res!174549 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320303 () Bool)

(declare-fun res!174543 () Bool)

(assert (=> b!320303 (=> (not res!174543) (not e!198771))))

(declare-datatypes ((SeekEntryResult!2878 0))(
  ( (MissingZero!2878 (index!13688 (_ BitVec 32))) (Found!2878 (index!13689 (_ BitVec 32))) (Intermediate!2878 (undefined!3690 Bool) (index!13690 (_ BitVec 32)) (x!31955 (_ BitVec 32))) (Undefined!2878) (MissingVacant!2878 (index!13691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16373 (_ BitVec 32)) SeekEntryResult!2878)

(assert (=> b!320303 (= res!174543 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2878 i!1250)))))

(declare-fun b!320304 () Bool)

(declare-fun res!174544 () Bool)

(assert (=> b!320304 (=> (not res!174544) (not e!198771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320304 (= res!174544 (validKeyInArray!0 k!2497))))

(declare-fun b!320305 () Bool)

(declare-fun res!174545 () Bool)

(assert (=> b!320305 (=> (not res!174545) (not e!198771))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16373 (_ BitVec 32)) SeekEntryResult!2878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320305 (= res!174545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2878 false resIndex!58 resX!58)))))

(declare-fun b!320306 () Bool)

(declare-fun res!174547 () Bool)

(assert (=> b!320306 (=> (not res!174547) (not e!198771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16373 (_ BitVec 32)) Bool)

(assert (=> b!320306 (= res!174547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!174546 () Bool)

(assert (=> start!32138 (=> (not res!174546) (not e!198771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32138 (= res!174546 (validMask!0 mask!3777))))

(assert (=> start!32138 e!198771))

(declare-fun array_inv!5710 (array!16373) Bool)

(assert (=> start!32138 (array_inv!5710 a!3305)))

(assert (=> start!32138 true))

(assert (= (and start!32138 res!174546) b!320301))

(assert (= (and b!320301 res!174548) b!320304))

(assert (= (and b!320304 res!174544) b!320302))

(assert (= (and b!320302 res!174549) b!320303))

(assert (= (and b!320303 res!174543) b!320306))

(assert (= (and b!320306 res!174547) b!320305))

(assert (= (and b!320305 res!174545) b!320300))

(declare-fun m!328697 () Bool)

(assert (=> start!32138 m!328697))

(declare-fun m!328699 () Bool)

(assert (=> start!32138 m!328699))

(declare-fun m!328701 () Bool)

(assert (=> b!320306 m!328701))

(declare-fun m!328703 () Bool)

(assert (=> b!320302 m!328703))

(declare-fun m!328705 () Bool)

(assert (=> b!320305 m!328705))

(assert (=> b!320305 m!328705))

(declare-fun m!328707 () Bool)

(assert (=> b!320305 m!328707))

(declare-fun m!328709 () Bool)

(assert (=> b!320303 m!328709))

(declare-fun m!328711 () Bool)

(assert (=> b!320304 m!328711))

(declare-fun m!328713 () Bool)

(assert (=> b!320300 m!328713))

(push 1)

(assert (not b!320304))

(assert (not b!320303))

(assert (not b!320306))

(assert (not b!320302))

(assert (not start!32138))

(assert (not b!320305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

