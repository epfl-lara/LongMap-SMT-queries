; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86946 () Bool)

(assert start!86946)

(declare-fun b!1008641 () Bool)

(declare-fun res!677545 () Bool)

(declare-fun e!567500 () Bool)

(assert (=> b!1008641 (=> (not res!677545) (not e!567500))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008641 (= res!677545 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008642 () Bool)

(declare-fun res!677534 () Bool)

(declare-fun e!567501 () Bool)

(assert (=> b!1008642 (=> (not res!677534) (not e!567501))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008642 (= res!677534 (validKeyInArray!0 k!2224))))

(declare-fun b!1008643 () Bool)

(declare-fun res!677539 () Bool)

(assert (=> b!1008643 (=> (not res!677539) (not e!567501))))

(declare-datatypes ((array!63594 0))(
  ( (array!63595 (arr!30618 (Array (_ BitVec 32) (_ BitVec 64))) (size!31120 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63594)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008643 (= res!677539 (and (= (size!31120 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31120 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31120 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008644 () Bool)

(declare-fun res!677543 () Bool)

(declare-fun e!567502 () Bool)

(assert (=> b!1008644 (=> (not res!677543) (not e!567502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63594 (_ BitVec 32)) Bool)

(assert (=> b!1008644 (= res!677543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008645 () Bool)

(declare-fun res!677535 () Bool)

(assert (=> b!1008645 (=> (not res!677535) (not e!567501))))

(assert (=> b!1008645 (= res!677535 (validKeyInArray!0 (select (arr!30618 a!3219) j!170)))))

(declare-fun b!1008646 () Bool)

(declare-fun e!567505 () Bool)

(assert (=> b!1008646 (= e!567505 e!567500)))

(declare-fun res!677536 () Bool)

(assert (=> b!1008646 (=> (not res!677536) (not e!567500))))

(declare-fun lt!445801 () (_ BitVec 64))

(declare-fun lt!445802 () array!63594)

(declare-datatypes ((SeekEntryResult!9550 0))(
  ( (MissingZero!9550 (index!40571 (_ BitVec 32))) (Found!9550 (index!40572 (_ BitVec 32))) (Intermediate!9550 (undefined!10362 Bool) (index!40573 (_ BitVec 32)) (x!87956 (_ BitVec 32))) (Undefined!9550) (MissingVacant!9550 (index!40574 (_ BitVec 32))) )
))
(declare-fun lt!445799 () SeekEntryResult!9550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63594 (_ BitVec 32)) SeekEntryResult!9550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008646 (= res!677536 (not (= lt!445799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445801 mask!3464) lt!445801 lt!445802 mask!3464))))))

(assert (=> b!1008646 (= lt!445801 (select (store (arr!30618 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008646 (= lt!445802 (array!63595 (store (arr!30618 a!3219) i!1194 k!2224) (size!31120 a!3219)))))

(declare-fun b!1008647 () Bool)

(declare-fun e!567503 () Bool)

(assert (=> b!1008647 (= e!567502 e!567503)))

(declare-fun res!677542 () Bool)

(assert (=> b!1008647 (=> (not res!677542) (not e!567503))))

(declare-fun lt!445800 () SeekEntryResult!9550)

(assert (=> b!1008647 (= res!677542 (= lt!445799 lt!445800))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008647 (= lt!445800 (Intermediate!9550 false resIndex!38 resX!38))))

(assert (=> b!1008647 (= lt!445799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30618 a!3219) j!170) mask!3464) (select (arr!30618 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008648 () Bool)

(declare-fun res!677537 () Bool)

(assert (=> b!1008648 (=> (not res!677537) (not e!567502))))

(declare-datatypes ((List!21294 0))(
  ( (Nil!21291) (Cons!21290 (h!22476 (_ BitVec 64)) (t!30295 List!21294)) )
))
(declare-fun arrayNoDuplicates!0 (array!63594 (_ BitVec 32) List!21294) Bool)

(assert (=> b!1008648 (= res!677537 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21291))))

(declare-fun b!1008649 () Bool)

(assert (=> b!1008649 (= e!567501 e!567502)))

(declare-fun res!677546 () Bool)

(assert (=> b!1008649 (=> (not res!677546) (not e!567502))))

(declare-fun lt!445803 () SeekEntryResult!9550)

(assert (=> b!1008649 (= res!677546 (or (= lt!445803 (MissingVacant!9550 i!1194)) (= lt!445803 (MissingZero!9550 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63594 (_ BitVec 32)) SeekEntryResult!9550)

(assert (=> b!1008649 (= lt!445803 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008650 () Bool)

(declare-fun res!677538 () Bool)

(assert (=> b!1008650 (=> (not res!677538) (not e!567502))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1008650 (= res!677538 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31120 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31120 a!3219))))))

(declare-fun b!1008651 () Bool)

(declare-fun res!677544 () Bool)

(assert (=> b!1008651 (=> (not res!677544) (not e!567500))))

(declare-fun lt!445804 () SeekEntryResult!9550)

(assert (=> b!1008651 (= res!677544 (not (= lt!445804 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445801 lt!445802 mask!3464))))))

(declare-fun b!1008652 () Bool)

(assert (=> b!1008652 (= e!567500 false)))

(declare-fun lt!445805 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008652 (= lt!445805 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008653 () Bool)

(declare-fun res!677540 () Bool)

(assert (=> b!1008653 (=> (not res!677540) (not e!567501))))

(declare-fun arrayContainsKey!0 (array!63594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008653 (= res!677540 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!677547 () Bool)

(assert (=> start!86946 (=> (not res!677547) (not e!567501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86946 (= res!677547 (validMask!0 mask!3464))))

(assert (=> start!86946 e!567501))

(declare-fun array_inv!23742 (array!63594) Bool)

(assert (=> start!86946 (array_inv!23742 a!3219)))

(assert (=> start!86946 true))

(declare-fun b!1008654 () Bool)

(assert (=> b!1008654 (= e!567503 e!567505)))

(declare-fun res!677541 () Bool)

(assert (=> b!1008654 (=> (not res!677541) (not e!567505))))

(assert (=> b!1008654 (= res!677541 (= lt!445804 lt!445800))))

(assert (=> b!1008654 (= lt!445804 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30618 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86946 res!677547) b!1008643))

(assert (= (and b!1008643 res!677539) b!1008645))

(assert (= (and b!1008645 res!677535) b!1008642))

(assert (= (and b!1008642 res!677534) b!1008653))

(assert (= (and b!1008653 res!677540) b!1008649))

(assert (= (and b!1008649 res!677546) b!1008644))

(assert (= (and b!1008644 res!677543) b!1008648))

(assert (= (and b!1008648 res!677537) b!1008650))

(assert (= (and b!1008650 res!677538) b!1008647))

(assert (= (and b!1008647 res!677542) b!1008654))

(assert (= (and b!1008654 res!677541) b!1008646))

(assert (= (and b!1008646 res!677536) b!1008651))

(assert (= (and b!1008651 res!677544) b!1008641))

(assert (= (and b!1008641 res!677545) b!1008652))

(declare-fun m!933359 () Bool)

(assert (=> start!86946 m!933359))

(declare-fun m!933361 () Bool)

(assert (=> start!86946 m!933361))

(declare-fun m!933363 () Bool)

(assert (=> b!1008654 m!933363))

(assert (=> b!1008654 m!933363))

(declare-fun m!933365 () Bool)

(assert (=> b!1008654 m!933365))

(declare-fun m!933367 () Bool)

(assert (=> b!1008644 m!933367))

(declare-fun m!933369 () Bool)

(assert (=> b!1008652 m!933369))

(assert (=> b!1008645 m!933363))

(assert (=> b!1008645 m!933363))

(declare-fun m!933371 () Bool)

(assert (=> b!1008645 m!933371))

(declare-fun m!933373 () Bool)

(assert (=> b!1008642 m!933373))

(declare-fun m!933375 () Bool)

(assert (=> b!1008649 m!933375))

(declare-fun m!933377 () Bool)

(assert (=> b!1008646 m!933377))

(assert (=> b!1008646 m!933377))

(declare-fun m!933379 () Bool)

(assert (=> b!1008646 m!933379))

(declare-fun m!933381 () Bool)

(assert (=> b!1008646 m!933381))

(declare-fun m!933383 () Bool)

(assert (=> b!1008646 m!933383))

(assert (=> b!1008647 m!933363))

(assert (=> b!1008647 m!933363))

(declare-fun m!933385 () Bool)

(assert (=> b!1008647 m!933385))

(assert (=> b!1008647 m!933385))

(assert (=> b!1008647 m!933363))

(declare-fun m!933387 () Bool)

(assert (=> b!1008647 m!933387))

(declare-fun m!933389 () Bool)

(assert (=> b!1008653 m!933389))

(declare-fun m!933391 () Bool)

(assert (=> b!1008651 m!933391))

(declare-fun m!933393 () Bool)

(assert (=> b!1008648 m!933393))

(push 1)

