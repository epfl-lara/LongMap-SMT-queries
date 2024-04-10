; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48594 () Bool)

(assert start!48594)

(declare-fun b!533613 () Bool)

(declare-fun res!328823 () Bool)

(declare-fun e!310463 () Bool)

(assert (=> b!533613 (=> (not res!328823) (not e!310463))))

(declare-datatypes ((array!33806 0))(
  ( (array!33807 (arr!16242 (Array (_ BitVec 32) (_ BitVec 64))) (size!16606 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33806)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33806 (_ BitVec 32)) Bool)

(assert (=> b!533613 (= res!328823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533614 () Bool)

(declare-fun res!328826 () Bool)

(declare-fun e!310464 () Bool)

(assert (=> b!533614 (=> (not res!328826) (not e!310464))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533614 (= res!328826 (validKeyInArray!0 (select (arr!16242 a!3154) j!147)))))

(declare-fun b!533615 () Bool)

(declare-fun res!328818 () Bool)

(assert (=> b!533615 (=> (not res!328818) (not e!310464))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533615 (= res!328818 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533616 () Bool)

(declare-fun res!328819 () Bool)

(assert (=> b!533616 (=> (not res!328819) (not e!310463))))

(declare-datatypes ((List!10361 0))(
  ( (Nil!10358) (Cons!10357 (h!11300 (_ BitVec 64)) (t!16589 List!10361)) )
))
(declare-fun arrayNoDuplicates!0 (array!33806 (_ BitVec 32) List!10361) Bool)

(assert (=> b!533616 (= res!328819 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10358))))

(declare-fun b!533618 () Bool)

(assert (=> b!533618 (= e!310463 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4700 0))(
  ( (MissingZero!4700 (index!21024 (_ BitVec 32))) (Found!4700 (index!21025 (_ BitVec 32))) (Intermediate!4700 (undefined!5512 Bool) (index!21026 (_ BitVec 32)) (x!49995 (_ BitVec 32))) (Undefined!4700) (MissingVacant!4700 (index!21027 (_ BitVec 32))) )
))
(declare-fun lt!245466 () SeekEntryResult!4700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33806 (_ BitVec 32)) SeekEntryResult!4700)

(assert (=> b!533618 (= lt!245466 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16242 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533619 () Bool)

(declare-fun res!328825 () Bool)

(assert (=> b!533619 (=> (not res!328825) (not e!310464))))

(assert (=> b!533619 (= res!328825 (validKeyInArray!0 k!1998))))

(declare-fun b!533620 () Bool)

(declare-fun res!328821 () Bool)

(assert (=> b!533620 (=> (not res!328821) (not e!310464))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533620 (= res!328821 (and (= (size!16606 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16606 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16606 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533621 () Bool)

(declare-fun res!328822 () Bool)

(assert (=> b!533621 (=> (not res!328822) (not e!310463))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533621 (= res!328822 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16606 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16606 a!3154)) (= (select (arr!16242 a!3154) resIndex!32) (select (arr!16242 a!3154) j!147))))))

(declare-fun b!533617 () Bool)

(assert (=> b!533617 (= e!310464 e!310463)))

(declare-fun res!328820 () Bool)

(assert (=> b!533617 (=> (not res!328820) (not e!310463))))

(declare-fun lt!245467 () SeekEntryResult!4700)

(assert (=> b!533617 (= res!328820 (or (= lt!245467 (MissingZero!4700 i!1153)) (= lt!245467 (MissingVacant!4700 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33806 (_ BitVec 32)) SeekEntryResult!4700)

(assert (=> b!533617 (= lt!245467 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!328824 () Bool)

(assert (=> start!48594 (=> (not res!328824) (not e!310464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48594 (= res!328824 (validMask!0 mask!3216))))

(assert (=> start!48594 e!310464))

(assert (=> start!48594 true))

(declare-fun array_inv!12038 (array!33806) Bool)

(assert (=> start!48594 (array_inv!12038 a!3154)))

(assert (= (and start!48594 res!328824) b!533620))

(assert (= (and b!533620 res!328821) b!533614))

(assert (= (and b!533614 res!328826) b!533619))

(assert (= (and b!533619 res!328825) b!533615))

(assert (= (and b!533615 res!328818) b!533617))

(assert (= (and b!533617 res!328820) b!533613))

(assert (= (and b!533613 res!328823) b!533616))

(assert (= (and b!533616 res!328819) b!533621))

(assert (= (and b!533621 res!328822) b!533618))

(declare-fun m!513447 () Bool)

(assert (=> b!533614 m!513447))

(assert (=> b!533614 m!513447))

(declare-fun m!513449 () Bool)

(assert (=> b!533614 m!513449))

(declare-fun m!513451 () Bool)

(assert (=> b!533616 m!513451))

(declare-fun m!513453 () Bool)

(assert (=> b!533621 m!513453))

(assert (=> b!533621 m!513447))

(declare-fun m!513455 () Bool)

(assert (=> start!48594 m!513455))

(declare-fun m!513457 () Bool)

(assert (=> start!48594 m!513457))

(declare-fun m!513459 () Bool)

(assert (=> b!533617 m!513459))

(assert (=> b!533618 m!513447))

(assert (=> b!533618 m!513447))

(declare-fun m!513461 () Bool)

(assert (=> b!533618 m!513461))

(declare-fun m!513463 () Bool)

(assert (=> b!533615 m!513463))

(declare-fun m!513465 () Bool)

(assert (=> b!533613 m!513465))

(declare-fun m!513467 () Bool)

(assert (=> b!533619 m!513467))

(push 1)

