; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30414 () Bool)

(assert start!30414)

(declare-fun b!304403 () Bool)

(declare-fun e!191321 () Bool)

(assert (=> b!304403 (= e!191321 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150443 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304403 (= lt!150443 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304404 () Bool)

(declare-fun res!161748 () Bool)

(assert (=> b!304404 (=> (not res!161748) (not e!191321))))

(declare-datatypes ((array!15469 0))(
  ( (array!15470 (arr!7321 (Array (_ BitVec 32) (_ BitVec 64))) (size!7673 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15469)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304404 (= res!161748 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7321 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7321 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7321 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304406 () Bool)

(declare-fun res!161751 () Bool)

(declare-fun e!191323 () Bool)

(assert (=> b!304406 (=> (not res!161751) (not e!191323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304406 (= res!161751 (validKeyInArray!0 k!2441))))

(declare-fun b!304407 () Bool)

(assert (=> b!304407 (= e!191323 e!191321)))

(declare-fun res!161750 () Bool)

(assert (=> b!304407 (=> (not res!161750) (not e!191321))))

(declare-datatypes ((SeekEntryResult!2461 0))(
  ( (MissingZero!2461 (index!12020 (_ BitVec 32))) (Found!2461 (index!12021 (_ BitVec 32))) (Intermediate!2461 (undefined!3273 Bool) (index!12022 (_ BitVec 32)) (x!30279 (_ BitVec 32))) (Undefined!2461) (MissingVacant!2461 (index!12023 (_ BitVec 32))) )
))
(declare-fun lt!150444 () SeekEntryResult!2461)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15469 (_ BitVec 32)) SeekEntryResult!2461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304407 (= res!161750 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150444))))

(assert (=> b!304407 (= lt!150444 (Intermediate!2461 false resIndex!52 resX!52))))

(declare-fun b!304408 () Bool)

(declare-fun res!161753 () Bool)

(assert (=> b!304408 (=> (not res!161753) (not e!191323))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15469 (_ BitVec 32)) SeekEntryResult!2461)

(assert (=> b!304408 (= res!161753 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2461 i!1240)))))

(declare-fun b!304409 () Bool)

(declare-fun res!161757 () Bool)

(assert (=> b!304409 (=> (not res!161757) (not e!191321))))

(assert (=> b!304409 (= res!161757 (and (= (select (arr!7321 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7673 a!3293))))))

(declare-fun b!304410 () Bool)

(declare-fun res!161754 () Bool)

(assert (=> b!304410 (=> (not res!161754) (not e!191323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15469 (_ BitVec 32)) Bool)

(assert (=> b!304410 (= res!161754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304411 () Bool)

(declare-fun res!161752 () Bool)

(assert (=> b!304411 (=> (not res!161752) (not e!191321))))

(assert (=> b!304411 (= res!161752 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150444))))

(declare-fun b!304412 () Bool)

(declare-fun res!161749 () Bool)

(assert (=> b!304412 (=> (not res!161749) (not e!191323))))

(assert (=> b!304412 (= res!161749 (and (= (size!7673 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7673 a!3293))))))

(declare-fun res!161756 () Bool)

(assert (=> start!30414 (=> (not res!161756) (not e!191323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30414 (= res!161756 (validMask!0 mask!3709))))

(assert (=> start!30414 e!191323))

(declare-fun array_inv!5284 (array!15469) Bool)

(assert (=> start!30414 (array_inv!5284 a!3293)))

(assert (=> start!30414 true))

(declare-fun b!304405 () Bool)

(declare-fun res!161755 () Bool)

(assert (=> b!304405 (=> (not res!161755) (not e!191323))))

(declare-fun arrayContainsKey!0 (array!15469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304405 (= res!161755 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30414 res!161756) b!304412))

(assert (= (and b!304412 res!161749) b!304406))

(assert (= (and b!304406 res!161751) b!304405))

(assert (= (and b!304405 res!161755) b!304408))

(assert (= (and b!304408 res!161753) b!304410))

(assert (= (and b!304410 res!161754) b!304407))

(assert (= (and b!304407 res!161750) b!304409))

(assert (= (and b!304409 res!161757) b!304411))

(assert (= (and b!304411 res!161752) b!304404))

(assert (= (and b!304404 res!161748) b!304403))

(declare-fun m!315503 () Bool)

(assert (=> start!30414 m!315503))

(declare-fun m!315505 () Bool)

(assert (=> start!30414 m!315505))

(declare-fun m!315507 () Bool)

(assert (=> b!304411 m!315507))

(declare-fun m!315509 () Bool)

(assert (=> b!304408 m!315509))

(declare-fun m!315511 () Bool)

(assert (=> b!304409 m!315511))

(declare-fun m!315513 () Bool)

(assert (=> b!304406 m!315513))

(declare-fun m!315515 () Bool)

(assert (=> b!304403 m!315515))

(declare-fun m!315517 () Bool)

(assert (=> b!304404 m!315517))

(declare-fun m!315519 () Bool)

(assert (=> b!304407 m!315519))

(assert (=> b!304407 m!315519))

(declare-fun m!315521 () Bool)

(assert (=> b!304407 m!315521))

(declare-fun m!315523 () Bool)

(assert (=> b!304410 m!315523))

(declare-fun m!315525 () Bool)

(assert (=> b!304405 m!315525))

(push 1)

(assert (not b!304407))

(assert (not b!304408))

(assert (not b!304403))

(assert (not b!304410))

