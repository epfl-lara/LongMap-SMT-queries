; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30926 () Bool)

(assert start!30926)

(declare-fun b!310427 () Bool)

(declare-fun res!166888 () Bool)

(declare-fun e!193815 () Bool)

(assert (=> b!310427 (=> (not res!166888) (not e!193815))))

(declare-datatypes ((array!15828 0))(
  ( (array!15829 (arr!7496 (Array (_ BitVec 32) (_ BitVec 64))) (size!7848 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15828)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2636 0))(
  ( (MissingZero!2636 (index!12720 (_ BitVec 32))) (Found!2636 (index!12721 (_ BitVec 32))) (Intermediate!2636 (undefined!3448 Bool) (index!12722 (_ BitVec 32)) (x!30953 (_ BitVec 32))) (Undefined!2636) (MissingVacant!2636 (index!12723 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15828 (_ BitVec 32)) SeekEntryResult!2636)

(assert (=> b!310427 (= res!166888 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2636 i!1240)))))

(declare-fun b!310429 () Bool)

(declare-fun res!166885 () Bool)

(assert (=> b!310429 (=> (not res!166885) (not e!193815))))

(assert (=> b!310429 (= res!166885 (and (= (size!7848 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7848 a!3293))))))

(declare-fun b!310430 () Bool)

(declare-fun res!166883 () Bool)

(assert (=> b!310430 (=> (not res!166883) (not e!193815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15828 (_ BitVec 32)) Bool)

(assert (=> b!310430 (= res!166883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310431 () Bool)

(declare-fun e!193814 () Bool)

(assert (=> b!310431 (= e!193815 e!193814)))

(declare-fun res!166886 () Bool)

(assert (=> b!310431 (=> (not res!166886) (not e!193814))))

(declare-fun lt!151951 () SeekEntryResult!2636)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15828 (_ BitVec 32)) SeekEntryResult!2636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310431 (= res!166886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151951))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310431 (= lt!151951 (Intermediate!2636 false resIndex!52 resX!52))))

(declare-fun b!310432 () Bool)

(declare-fun res!166887 () Bool)

(assert (=> b!310432 (=> (not res!166887) (not e!193815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310432 (= res!166887 (validKeyInArray!0 k!2441))))

(declare-fun b!310433 () Bool)

(declare-fun e!193813 () Bool)

(assert (=> b!310433 (= e!193813 (not true))))

(declare-fun e!193812 () Bool)

(assert (=> b!310433 e!193812))

(declare-fun res!166884 () Bool)

(assert (=> b!310433 (=> (not res!166884) (not e!193812))))

(declare-fun lt!151953 () SeekEntryResult!2636)

(declare-fun lt!151950 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!310433 (= res!166884 (= lt!151953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151950 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310433 (= lt!151950 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310434 () Bool)

(declare-fun res!166882 () Bool)

(assert (=> b!310434 (=> (not res!166882) (not e!193815))))

(declare-fun arrayContainsKey!0 (array!15828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310434 (= res!166882 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310435 () Bool)

(declare-fun res!166881 () Bool)

(assert (=> b!310435 (=> (not res!166881) (not e!193814))))

(assert (=> b!310435 (= res!166881 (and (= (select (arr!7496 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7848 a!3293))))))

(declare-fun b!310436 () Bool)

(assert (=> b!310436 (= e!193814 e!193813)))

(declare-fun res!166890 () Bool)

(assert (=> b!310436 (=> (not res!166890) (not e!193813))))

(assert (=> b!310436 (= res!166890 (and (= lt!151953 lt!151951) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7496 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310436 (= lt!151953 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310428 () Bool)

(declare-fun lt!151952 () array!15828)

(assert (=> b!310428 (= e!193812 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151952 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151950 k!2441 lt!151952 mask!3709)))))

(assert (=> b!310428 (= lt!151952 (array!15829 (store (arr!7496 a!3293) i!1240 k!2441) (size!7848 a!3293)))))

(declare-fun res!166889 () Bool)

(assert (=> start!30926 (=> (not res!166889) (not e!193815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30926 (= res!166889 (validMask!0 mask!3709))))

(assert (=> start!30926 e!193815))

(declare-fun array_inv!5459 (array!15828) Bool)

(assert (=> start!30926 (array_inv!5459 a!3293)))

(assert (=> start!30926 true))

(assert (= (and start!30926 res!166889) b!310429))

(assert (= (and b!310429 res!166885) b!310432))

(assert (= (and b!310432 res!166887) b!310434))

(assert (= (and b!310434 res!166882) b!310427))

(assert (= (and b!310427 res!166888) b!310430))

(assert (= (and b!310430 res!166883) b!310431))

(assert (= (and b!310431 res!166886) b!310435))

(assert (= (and b!310435 res!166881) b!310436))

(assert (= (and b!310436 res!166890) b!310433))

(assert (= (and b!310433 res!166884) b!310428))

(declare-fun m!320333 () Bool)

(assert (=> b!310436 m!320333))

(declare-fun m!320335 () Bool)

(assert (=> b!310436 m!320335))

(declare-fun m!320337 () Bool)

(assert (=> b!310433 m!320337))

(declare-fun m!320339 () Bool)

(assert (=> b!310433 m!320339))

(declare-fun m!320341 () Bool)

(assert (=> b!310432 m!320341))

(declare-fun m!320343 () Bool)

(assert (=> b!310427 m!320343))

(declare-fun m!320345 () Bool)

(assert (=> b!310435 m!320345))

(declare-fun m!320347 () Bool)

(assert (=> b!310431 m!320347))

(assert (=> b!310431 m!320347))

(declare-fun m!320349 () Bool)

(assert (=> b!310431 m!320349))

(declare-fun m!320351 () Bool)

(assert (=> b!310430 m!320351))

(declare-fun m!320353 () Bool)

(assert (=> start!30926 m!320353))

(declare-fun m!320355 () Bool)

(assert (=> start!30926 m!320355))

(declare-fun m!320357 () Bool)

(assert (=> b!310434 m!320357))

(declare-fun m!320359 () Bool)

(assert (=> b!310428 m!320359))

(declare-fun m!320361 () Bool)

(assert (=> b!310428 m!320361))

(declare-fun m!320363 () Bool)

(assert (=> b!310428 m!320363))

(push 1)

