; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86478 () Bool)

(assert start!86478)

(declare-fun b!1001421 () Bool)

(declare-fun res!670911 () Bool)

(declare-fun e!564289 () Bool)

(assert (=> b!1001421 (=> (not res!670911) (not e!564289))))

(declare-datatypes ((array!63279 0))(
  ( (array!63280 (arr!30465 (Array (_ BitVec 32) (_ BitVec 64))) (size!30967 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63279)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442672 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9397 0))(
  ( (MissingZero!9397 (index!39959 (_ BitVec 32))) (Found!9397 (index!39960 (_ BitVec 32))) (Intermediate!9397 (undefined!10209 Bool) (index!39961 (_ BitVec 32)) (x!87377 (_ BitVec 32))) (Undefined!9397) (MissingVacant!9397 (index!39962 (_ BitVec 32))) )
))
(declare-fun lt!442668 () SeekEntryResult!9397)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63279 (_ BitVec 32)) SeekEntryResult!9397)

(assert (=> b!1001421 (= res!670911 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442672 (select (arr!30465 a!3219) j!170) a!3219 mask!3464) lt!442668))))

(declare-fun b!1001422 () Bool)

(declare-fun e!564290 () Bool)

(assert (=> b!1001422 (= e!564290 e!564289)))

(declare-fun res!670905 () Bool)

(assert (=> b!1001422 (=> (not res!670905) (not e!564289))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001422 (= res!670905 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442672 #b00000000000000000000000000000000) (bvslt lt!442672 (size!30967 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001422 (= lt!442672 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001423 () Bool)

(declare-fun res!670901 () Bool)

(assert (=> b!1001423 (=> (not res!670901) (not e!564290))))

(declare-fun lt!442667 () (_ BitVec 64))

(declare-fun lt!442671 () SeekEntryResult!9397)

(declare-fun lt!442670 () array!63279)

(assert (=> b!1001423 (= res!670901 (not (= lt!442671 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442667 lt!442670 mask!3464))))))

(declare-fun b!1001424 () Bool)

(declare-fun e!564288 () Bool)

(declare-fun e!564287 () Bool)

(assert (=> b!1001424 (= e!564288 e!564287)))

(declare-fun res!670902 () Bool)

(assert (=> b!1001424 (=> (not res!670902) (not e!564287))))

(declare-fun lt!442673 () SeekEntryResult!9397)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001424 (= res!670902 (or (= lt!442673 (MissingVacant!9397 i!1194)) (= lt!442673 (MissingZero!9397 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63279 (_ BitVec 32)) SeekEntryResult!9397)

(assert (=> b!1001424 (= lt!442673 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!670909 () Bool)

(assert (=> start!86478 (=> (not res!670909) (not e!564288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86478 (= res!670909 (validMask!0 mask!3464))))

(assert (=> start!86478 e!564288))

(declare-fun array_inv!23589 (array!63279) Bool)

(assert (=> start!86478 (array_inv!23589 a!3219)))

(assert (=> start!86478 true))

(declare-fun b!1001425 () Bool)

(declare-fun res!670914 () Bool)

(assert (=> b!1001425 (=> (not res!670914) (not e!564288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001425 (= res!670914 (validKeyInArray!0 k!2224))))

(declare-fun b!1001426 () Bool)

(declare-fun e!564291 () Bool)

(assert (=> b!1001426 (= e!564287 e!564291)))

(declare-fun res!670904 () Bool)

(assert (=> b!1001426 (=> (not res!670904) (not e!564291))))

(declare-fun lt!442666 () SeekEntryResult!9397)

(assert (=> b!1001426 (= res!670904 (= lt!442666 lt!442668))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001426 (= lt!442668 (Intermediate!9397 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001426 (= lt!442666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30465 a!3219) j!170) mask!3464) (select (arr!30465 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001427 () Bool)

(declare-fun res!670900 () Bool)

(assert (=> b!1001427 (=> (not res!670900) (not e!564288))))

(assert (=> b!1001427 (= res!670900 (and (= (size!30967 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30967 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30967 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001428 () Bool)

(declare-fun res!670903 () Bool)

(assert (=> b!1001428 (=> (not res!670903) (not e!564288))))

(assert (=> b!1001428 (= res!670903 (validKeyInArray!0 (select (arr!30465 a!3219) j!170)))))

(declare-fun b!1001429 () Bool)

(declare-fun e!564286 () Bool)

(assert (=> b!1001429 (= e!564291 e!564286)))

(declare-fun res!670910 () Bool)

(assert (=> b!1001429 (=> (not res!670910) (not e!564286))))

(assert (=> b!1001429 (= res!670910 (= lt!442671 lt!442668))))

(assert (=> b!1001429 (= lt!442671 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30465 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001430 () Bool)

(declare-fun res!670907 () Bool)

(assert (=> b!1001430 (=> (not res!670907) (not e!564287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63279 (_ BitVec 32)) Bool)

(assert (=> b!1001430 (= res!670907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001431 () Bool)

(declare-fun res!670912 () Bool)

(assert (=> b!1001431 (=> (not res!670912) (not e!564288))))

(declare-fun arrayContainsKey!0 (array!63279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001431 (= res!670912 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001432 () Bool)

(declare-fun res!670908 () Bool)

(assert (=> b!1001432 (=> (not res!670908) (not e!564287))))

(assert (=> b!1001432 (= res!670908 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30967 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30967 a!3219))))))

(declare-fun b!1001433 () Bool)

(assert (=> b!1001433 (= e!564289 false)))

(declare-fun lt!442669 () SeekEntryResult!9397)

(assert (=> b!1001433 (= lt!442669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442672 lt!442667 lt!442670 mask!3464))))

(declare-fun b!1001434 () Bool)

(declare-fun res!670906 () Bool)

(assert (=> b!1001434 (=> (not res!670906) (not e!564290))))

(assert (=> b!1001434 (= res!670906 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001435 () Bool)

(assert (=> b!1001435 (= e!564286 e!564290)))

(declare-fun res!670913 () Bool)

(assert (=> b!1001435 (=> (not res!670913) (not e!564290))))

(assert (=> b!1001435 (= res!670913 (not (= lt!442666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442667 mask!3464) lt!442667 lt!442670 mask!3464))))))

(assert (=> b!1001435 (= lt!442667 (select (store (arr!30465 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001435 (= lt!442670 (array!63280 (store (arr!30465 a!3219) i!1194 k!2224) (size!30967 a!3219)))))

(declare-fun b!1001436 () Bool)

(declare-fun res!670899 () Bool)

(assert (=> b!1001436 (=> (not res!670899) (not e!564287))))

(declare-datatypes ((List!21141 0))(
  ( (Nil!21138) (Cons!21137 (h!22314 (_ BitVec 64)) (t!30142 List!21141)) )
))
(declare-fun arrayNoDuplicates!0 (array!63279 (_ BitVec 32) List!21141) Bool)

(assert (=> b!1001436 (= res!670899 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21138))))

(assert (= (and start!86478 res!670909) b!1001427))

(assert (= (and b!1001427 res!670900) b!1001428))

(assert (= (and b!1001428 res!670903) b!1001425))

(assert (= (and b!1001425 res!670914) b!1001431))

(assert (= (and b!1001431 res!670912) b!1001424))

(assert (= (and b!1001424 res!670902) b!1001430))

(assert (= (and b!1001430 res!670907) b!1001436))

(assert (= (and b!1001436 res!670899) b!1001432))

(assert (= (and b!1001432 res!670908) b!1001426))

(assert (= (and b!1001426 res!670904) b!1001429))

(assert (= (and b!1001429 res!670910) b!1001435))

(assert (= (and b!1001435 res!670913) b!1001423))

(assert (= (and b!1001423 res!670901) b!1001434))

(assert (= (and b!1001434 res!670906) b!1001422))

(assert (= (and b!1001422 res!670905) b!1001421))

(assert (= (and b!1001421 res!670911) b!1001433))

(declare-fun m!927469 () Bool)

(assert (=> b!1001428 m!927469))

(assert (=> b!1001428 m!927469))

(declare-fun m!927471 () Bool)

(assert (=> b!1001428 m!927471))

(assert (=> b!1001429 m!927469))

(assert (=> b!1001429 m!927469))

(declare-fun m!927473 () Bool)

(assert (=> b!1001429 m!927473))

(declare-fun m!927475 () Bool)

(assert (=> b!1001431 m!927475))

(declare-fun m!927477 () Bool)

(assert (=> start!86478 m!927477))

(declare-fun m!927479 () Bool)

(assert (=> start!86478 m!927479))

(declare-fun m!927481 () Bool)

(assert (=> b!1001422 m!927481))

(declare-fun m!927483 () Bool)

(assert (=> b!1001436 m!927483))

(declare-fun m!927485 () Bool)

(assert (=> b!1001425 m!927485))

(assert (=> b!1001426 m!927469))

(assert (=> b!1001426 m!927469))

(declare-fun m!927487 () Bool)

(assert (=> b!1001426 m!927487))

(assert (=> b!1001426 m!927487))

(assert (=> b!1001426 m!927469))

(declare-fun m!927489 () Bool)

(assert (=> b!1001426 m!927489))

(declare-fun m!927491 () Bool)

(assert (=> b!1001423 m!927491))

(assert (=> b!1001421 m!927469))

(assert (=> b!1001421 m!927469))

(declare-fun m!927493 () Bool)

(assert (=> b!1001421 m!927493))

(declare-fun m!927495 () Bool)

(assert (=> b!1001424 m!927495))

(declare-fun m!927497 () Bool)

(assert (=> b!1001433 m!927497))

(declare-fun m!927499 () Bool)

(assert (=> b!1001435 m!927499))

(assert (=> b!1001435 m!927499))

(declare-fun m!927501 () Bool)

(assert (=> b!1001435 m!927501))

(declare-fun m!927503 () Bool)

(assert (=> b!1001435 m!927503))

(declare-fun m!927505 () Bool)

(assert (=> b!1001435 m!927505))

(declare-fun m!927507 () Bool)

(assert (=> b!1001430 m!927507))

(push 1)

(assert (not b!1001428))

(assert (not b!1001435))

