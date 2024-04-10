; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86142 () Bool)

(assert start!86142)

(declare-fun b!997610 () Bool)

(declare-fun res!667566 () Bool)

(declare-fun e!562669 () Bool)

(assert (=> b!997610 (=> (not res!667566) (not e!562669))))

(declare-datatypes ((array!63096 0))(
  ( (array!63097 (arr!30378 (Array (_ BitVec 32) (_ BitVec 64))) (size!30880 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63096)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!997610 (= res!667566 (and (= (size!30880 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30880 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30880 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667574 () Bool)

(assert (=> start!86142 (=> (not res!667574) (not e!562669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86142 (= res!667574 (validMask!0 mask!3464))))

(assert (=> start!86142 e!562669))

(declare-fun array_inv!23502 (array!63096) Bool)

(assert (=> start!86142 (array_inv!23502 a!3219)))

(assert (=> start!86142 true))

(declare-fun b!997611 () Bool)

(declare-fun e!562672 () Bool)

(declare-fun e!562671 () Bool)

(assert (=> b!997611 (= e!562672 e!562671)))

(declare-fun res!667572 () Bool)

(assert (=> b!997611 (=> (not res!667572) (not e!562671))))

(declare-datatypes ((SeekEntryResult!9310 0))(
  ( (MissingZero!9310 (index!39611 (_ BitVec 32))) (Found!9310 (index!39612 (_ BitVec 32))) (Intermediate!9310 (undefined!10122 Bool) (index!39613 (_ BitVec 32)) (x!87040 (_ BitVec 32))) (Undefined!9310) (MissingVacant!9310 (index!39614 (_ BitVec 32))) )
))
(declare-fun lt!441487 () SeekEntryResult!9310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63096 (_ BitVec 32)) SeekEntryResult!9310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997611 (= res!667572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30378 a!3219) j!170) mask!3464) (select (arr!30378 a!3219) j!170) a!3219 mask!3464) lt!441487))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997611 (= lt!441487 (Intermediate!9310 false resIndex!38 resX!38))))

(declare-fun b!997612 () Bool)

(assert (=> b!997612 (= e!562671 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!997613 () Bool)

(declare-fun res!667569 () Bool)

(assert (=> b!997613 (=> (not res!667569) (not e!562672))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!997613 (= res!667569 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30880 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30880 a!3219))))))

(declare-fun b!997614 () Bool)

(declare-fun res!667571 () Bool)

(assert (=> b!997614 (=> (not res!667571) (not e!562669))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997614 (= res!667571 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997615 () Bool)

(declare-fun res!667573 () Bool)

(assert (=> b!997615 (=> (not res!667573) (not e!562671))))

(assert (=> b!997615 (= res!667573 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30378 a!3219) j!170) a!3219 mask!3464) lt!441487))))

(declare-fun b!997616 () Bool)

(assert (=> b!997616 (= e!562669 e!562672)))

(declare-fun res!667567 () Bool)

(assert (=> b!997616 (=> (not res!667567) (not e!562672))))

(declare-fun lt!441488 () SeekEntryResult!9310)

(assert (=> b!997616 (= res!667567 (or (= lt!441488 (MissingVacant!9310 i!1194)) (= lt!441488 (MissingZero!9310 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63096 (_ BitVec 32)) SeekEntryResult!9310)

(assert (=> b!997616 (= lt!441488 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997617 () Bool)

(declare-fun res!667565 () Bool)

(assert (=> b!997617 (=> (not res!667565) (not e!562672))))

(declare-datatypes ((List!21054 0))(
  ( (Nil!21051) (Cons!21050 (h!22218 (_ BitVec 64)) (t!30055 List!21054)) )
))
(declare-fun arrayNoDuplicates!0 (array!63096 (_ BitVec 32) List!21054) Bool)

(assert (=> b!997617 (= res!667565 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21051))))

(declare-fun b!997618 () Bool)

(declare-fun res!667568 () Bool)

(assert (=> b!997618 (=> (not res!667568) (not e!562669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997618 (= res!667568 (validKeyInArray!0 k!2224))))

(declare-fun b!997619 () Bool)

(declare-fun res!667575 () Bool)

(assert (=> b!997619 (=> (not res!667575) (not e!562672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63096 (_ BitVec 32)) Bool)

(assert (=> b!997619 (= res!667575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997620 () Bool)

(declare-fun res!667570 () Bool)

(assert (=> b!997620 (=> (not res!667570) (not e!562669))))

(assert (=> b!997620 (= res!667570 (validKeyInArray!0 (select (arr!30378 a!3219) j!170)))))

(assert (= (and start!86142 res!667574) b!997610))

(assert (= (and b!997610 res!667566) b!997620))

(assert (= (and b!997620 res!667570) b!997618))

(assert (= (and b!997618 res!667568) b!997614))

(assert (= (and b!997614 res!667571) b!997616))

(assert (= (and b!997616 res!667567) b!997619))

(assert (= (and b!997619 res!667575) b!997617))

(assert (= (and b!997617 res!667565) b!997613))

(assert (= (and b!997613 res!667569) b!997611))

(assert (= (and b!997611 res!667572) b!997615))

(assert (= (and b!997615 res!667573) b!997612))

(declare-fun m!924389 () Bool)

(assert (=> b!997618 m!924389))

(declare-fun m!924391 () Bool)

(assert (=> b!997616 m!924391))

(declare-fun m!924393 () Bool)

(assert (=> b!997611 m!924393))

(assert (=> b!997611 m!924393))

(declare-fun m!924395 () Bool)

(assert (=> b!997611 m!924395))

(assert (=> b!997611 m!924395))

(assert (=> b!997611 m!924393))

(declare-fun m!924397 () Bool)

(assert (=> b!997611 m!924397))

(declare-fun m!924399 () Bool)

(assert (=> b!997617 m!924399))

(declare-fun m!924401 () Bool)

(assert (=> start!86142 m!924401))

(declare-fun m!924403 () Bool)

(assert (=> start!86142 m!924403))

(assert (=> b!997615 m!924393))

(assert (=> b!997615 m!924393))

(declare-fun m!924405 () Bool)

(assert (=> b!997615 m!924405))

(declare-fun m!924407 () Bool)

(assert (=> b!997614 m!924407))

(assert (=> b!997620 m!924393))

(assert (=> b!997620 m!924393))

(declare-fun m!924409 () Bool)

(assert (=> b!997620 m!924409))

(declare-fun m!924411 () Bool)

(assert (=> b!997619 m!924411))

(push 1)

(assert (not b!997618))

(assert (not b!997614))

(assert (not b!997611))

(assert (not b!997616))

(assert (not start!86142))

(assert (not b!997620))

(assert (not b!997615))

