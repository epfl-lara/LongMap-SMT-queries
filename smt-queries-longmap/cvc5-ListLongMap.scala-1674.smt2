; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30932 () Bool)

(assert start!30932)

(declare-fun b!310518 () Bool)

(declare-fun res!166976 () Bool)

(declare-fun e!193857 () Bool)

(assert (=> b!310518 (=> (not res!166976) (not e!193857))))

(declare-datatypes ((array!15834 0))(
  ( (array!15835 (arr!7499 (Array (_ BitVec 32) (_ BitVec 64))) (size!7851 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15834)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310518 (= res!166976 (and (= (size!7851 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7851 a!3293))))))

(declare-fun b!310519 () Bool)

(declare-fun res!166978 () Bool)

(declare-fun e!193859 () Bool)

(assert (=> b!310519 (=> (not res!166978) (not e!193859))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310519 (= res!166978 (and (= (select (arr!7499 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7851 a!3293))))))

(declare-fun b!310520 () Bool)

(declare-fun res!166972 () Bool)

(assert (=> b!310520 (=> (not res!166972) (not e!193857))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310520 (= res!166972 (validKeyInArray!0 k!2441))))

(declare-fun b!310521 () Bool)

(declare-fun res!166975 () Bool)

(assert (=> b!310521 (=> (not res!166975) (not e!193857))))

(declare-datatypes ((SeekEntryResult!2639 0))(
  ( (MissingZero!2639 (index!12732 (_ BitVec 32))) (Found!2639 (index!12733 (_ BitVec 32))) (Intermediate!2639 (undefined!3451 Bool) (index!12734 (_ BitVec 32)) (x!30964 (_ BitVec 32))) (Undefined!2639) (MissingVacant!2639 (index!12735 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15834 (_ BitVec 32)) SeekEntryResult!2639)

(assert (=> b!310521 (= res!166975 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2639 i!1240)))))

(declare-fun b!310522 () Bool)

(assert (=> b!310522 (= e!193857 e!193859)))

(declare-fun res!166974 () Bool)

(assert (=> b!310522 (=> (not res!166974) (not e!193859))))

(declare-fun lt!151988 () SeekEntryResult!2639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15834 (_ BitVec 32)) SeekEntryResult!2639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310522 (= res!166974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151988))))

(assert (=> b!310522 (= lt!151988 (Intermediate!2639 false resIndex!52 resX!52))))

(declare-fun b!310523 () Bool)

(declare-fun e!193861 () Bool)

(assert (=> b!310523 (= e!193859 e!193861)))

(declare-fun res!166979 () Bool)

(assert (=> b!310523 (=> (not res!166979) (not e!193861))))

(declare-fun lt!151986 () SeekEntryResult!2639)

(assert (=> b!310523 (= res!166979 (and (= lt!151986 lt!151988) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7499 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310523 (= lt!151986 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310524 () Bool)

(assert (=> b!310524 (= e!193861 (not true))))

(declare-fun e!193860 () Bool)

(assert (=> b!310524 e!193860))

(declare-fun res!166977 () Bool)

(assert (=> b!310524 (=> (not res!166977) (not e!193860))))

(declare-fun lt!151987 () (_ BitVec 32))

(assert (=> b!310524 (= res!166977 (= lt!151986 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151987 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310524 (= lt!151987 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310517 () Bool)

(declare-fun res!166980 () Bool)

(assert (=> b!310517 (=> (not res!166980) (not e!193857))))

(declare-fun arrayContainsKey!0 (array!15834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310517 (= res!166980 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166973 () Bool)

(assert (=> start!30932 (=> (not res!166973) (not e!193857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30932 (= res!166973 (validMask!0 mask!3709))))

(assert (=> start!30932 e!193857))

(declare-fun array_inv!5462 (array!15834) Bool)

(assert (=> start!30932 (array_inv!5462 a!3293)))

(assert (=> start!30932 true))

(declare-fun b!310525 () Bool)

(declare-fun res!166971 () Bool)

(assert (=> b!310525 (=> (not res!166971) (not e!193857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15834 (_ BitVec 32)) Bool)

(assert (=> b!310525 (= res!166971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310526 () Bool)

(declare-fun lt!151989 () array!15834)

(assert (=> b!310526 (= e!193860 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151989 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151987 k!2441 lt!151989 mask!3709)))))

(assert (=> b!310526 (= lt!151989 (array!15835 (store (arr!7499 a!3293) i!1240 k!2441) (size!7851 a!3293)))))

(assert (= (and start!30932 res!166973) b!310518))

(assert (= (and b!310518 res!166976) b!310520))

(assert (= (and b!310520 res!166972) b!310517))

(assert (= (and b!310517 res!166980) b!310521))

(assert (= (and b!310521 res!166975) b!310525))

(assert (= (and b!310525 res!166971) b!310522))

(assert (= (and b!310522 res!166974) b!310519))

(assert (= (and b!310519 res!166978) b!310523))

(assert (= (and b!310523 res!166979) b!310524))

(assert (= (and b!310524 res!166977) b!310526))

(declare-fun m!320429 () Bool)

(assert (=> b!310525 m!320429))

(declare-fun m!320431 () Bool)

(assert (=> b!310523 m!320431))

(declare-fun m!320433 () Bool)

(assert (=> b!310523 m!320433))

(declare-fun m!320435 () Bool)

(assert (=> b!310524 m!320435))

(declare-fun m!320437 () Bool)

(assert (=> b!310524 m!320437))

(declare-fun m!320439 () Bool)

(assert (=> b!310517 m!320439))

(declare-fun m!320441 () Bool)

(assert (=> b!310522 m!320441))

(assert (=> b!310522 m!320441))

(declare-fun m!320443 () Bool)

(assert (=> b!310522 m!320443))

(declare-fun m!320445 () Bool)

(assert (=> b!310519 m!320445))

(declare-fun m!320447 () Bool)

(assert (=> b!310526 m!320447))

(declare-fun m!320449 () Bool)

(assert (=> b!310526 m!320449))

(declare-fun m!320451 () Bool)

(assert (=> b!310526 m!320451))

(declare-fun m!320453 () Bool)

(assert (=> b!310520 m!320453))

(declare-fun m!320455 () Bool)

(assert (=> start!30932 m!320455))

(declare-fun m!320457 () Bool)

(assert (=> start!30932 m!320457))

(declare-fun m!320459 () Bool)

(assert (=> b!310521 m!320459))

(push 1)

