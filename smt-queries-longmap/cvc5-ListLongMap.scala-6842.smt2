; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86144 () Bool)

(assert start!86144)

(declare-fun b!997641 () Bool)

(declare-fun res!667604 () Bool)

(declare-fun e!562681 () Bool)

(assert (=> b!997641 (=> (not res!667604) (not e!562681))))

(declare-datatypes ((array!63098 0))(
  ( (array!63099 (arr!30379 (Array (_ BitVec 32) (_ BitVec 64))) (size!30881 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63098)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997641 (= res!667604 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30881 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30881 a!3219))))))

(declare-fun b!997642 () Bool)

(declare-fun res!667599 () Bool)

(declare-fun e!562680 () Bool)

(assert (=> b!997642 (=> (not res!667599) (not e!562680))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997642 (= res!667599 (validKeyInArray!0 k!2224))))

(declare-fun b!997643 () Bool)

(assert (=> b!997643 (= e!562680 e!562681)))

(declare-fun res!667600 () Bool)

(assert (=> b!997643 (=> (not res!667600) (not e!562681))))

(declare-datatypes ((SeekEntryResult!9311 0))(
  ( (MissingZero!9311 (index!39615 (_ BitVec 32))) (Found!9311 (index!39616 (_ BitVec 32))) (Intermediate!9311 (undefined!10123 Bool) (index!39617 (_ BitVec 32)) (x!87049 (_ BitVec 32))) (Undefined!9311) (MissingVacant!9311 (index!39618 (_ BitVec 32))) )
))
(declare-fun lt!441493 () SeekEntryResult!9311)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997643 (= res!667600 (or (= lt!441493 (MissingVacant!9311 i!1194)) (= lt!441493 (MissingZero!9311 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63098 (_ BitVec 32)) SeekEntryResult!9311)

(assert (=> b!997643 (= lt!441493 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997644 () Bool)

(declare-fun res!667602 () Bool)

(assert (=> b!997644 (=> (not res!667602) (not e!562680))))

(declare-fun arrayContainsKey!0 (array!63098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997644 (= res!667602 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997645 () Bool)

(declare-fun res!667597 () Bool)

(assert (=> b!997645 (=> (not res!667597) (not e!562681))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63098 (_ BitVec 32)) SeekEntryResult!9311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997645 (= res!667597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30379 a!3219) j!170) mask!3464) (select (arr!30379 a!3219) j!170) a!3219 mask!3464) (Intermediate!9311 false resIndex!38 resX!38)))))

(declare-fun b!997646 () Bool)

(assert (=> b!997646 (= e!562681 false)))

(declare-fun lt!441494 () SeekEntryResult!9311)

(assert (=> b!997646 (= lt!441494 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30379 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997647 () Bool)

(declare-fun res!667598 () Bool)

(assert (=> b!997647 (=> (not res!667598) (not e!562680))))

(assert (=> b!997647 (= res!667598 (and (= (size!30881 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30881 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30881 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667605 () Bool)

(assert (=> start!86144 (=> (not res!667605) (not e!562680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86144 (= res!667605 (validMask!0 mask!3464))))

(assert (=> start!86144 e!562680))

(declare-fun array_inv!23503 (array!63098) Bool)

(assert (=> start!86144 (array_inv!23503 a!3219)))

(assert (=> start!86144 true))

(declare-fun b!997648 () Bool)

(declare-fun res!667596 () Bool)

(assert (=> b!997648 (=> (not res!667596) (not e!562681))))

(declare-datatypes ((List!21055 0))(
  ( (Nil!21052) (Cons!21051 (h!22219 (_ BitVec 64)) (t!30056 List!21055)) )
))
(declare-fun arrayNoDuplicates!0 (array!63098 (_ BitVec 32) List!21055) Bool)

(assert (=> b!997648 (= res!667596 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21052))))

(declare-fun b!997649 () Bool)

(declare-fun res!667601 () Bool)

(assert (=> b!997649 (=> (not res!667601) (not e!562681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63098 (_ BitVec 32)) Bool)

(assert (=> b!997649 (= res!667601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997650 () Bool)

(declare-fun res!667603 () Bool)

(assert (=> b!997650 (=> (not res!667603) (not e!562680))))

(assert (=> b!997650 (= res!667603 (validKeyInArray!0 (select (arr!30379 a!3219) j!170)))))

(assert (= (and start!86144 res!667605) b!997647))

(assert (= (and b!997647 res!667598) b!997650))

(assert (= (and b!997650 res!667603) b!997642))

(assert (= (and b!997642 res!667599) b!997644))

(assert (= (and b!997644 res!667602) b!997643))

(assert (= (and b!997643 res!667600) b!997649))

(assert (= (and b!997649 res!667601) b!997648))

(assert (= (and b!997648 res!667596) b!997641))

(assert (= (and b!997641 res!667604) b!997645))

(assert (= (and b!997645 res!667597) b!997646))

(declare-fun m!924413 () Bool)

(assert (=> b!997642 m!924413))

(declare-fun m!924415 () Bool)

(assert (=> b!997650 m!924415))

(assert (=> b!997650 m!924415))

(declare-fun m!924417 () Bool)

(assert (=> b!997650 m!924417))

(declare-fun m!924419 () Bool)

(assert (=> start!86144 m!924419))

(declare-fun m!924421 () Bool)

(assert (=> start!86144 m!924421))

(declare-fun m!924423 () Bool)

(assert (=> b!997649 m!924423))

(declare-fun m!924425 () Bool)

(assert (=> b!997648 m!924425))

(assert (=> b!997645 m!924415))

(assert (=> b!997645 m!924415))

(declare-fun m!924427 () Bool)

(assert (=> b!997645 m!924427))

(assert (=> b!997645 m!924427))

(assert (=> b!997645 m!924415))

(declare-fun m!924429 () Bool)

(assert (=> b!997645 m!924429))

(declare-fun m!924431 () Bool)

(assert (=> b!997644 m!924431))

(declare-fun m!924433 () Bool)

(assert (=> b!997643 m!924433))

(assert (=> b!997646 m!924415))

(assert (=> b!997646 m!924415))

(declare-fun m!924435 () Bool)

(assert (=> b!997646 m!924435))

(push 1)

