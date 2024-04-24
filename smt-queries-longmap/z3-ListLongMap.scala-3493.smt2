; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48466 () Bool)

(assert start!48466)

(declare-fun b!532348 () Bool)

(declare-fun res!327748 () Bool)

(declare-fun e!309974 () Bool)

(assert (=> b!532348 (=> (not res!327748) (not e!309974))))

(declare-datatypes ((array!33728 0))(
  ( (array!33729 (arr!16204 (Array (_ BitVec 32) (_ BitVec 64))) (size!16568 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33728)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532348 (= res!327748 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532349 () Bool)

(declare-fun e!309975 () Bool)

(assert (=> b!532349 (= e!309974 e!309975)))

(declare-fun res!327749 () Bool)

(assert (=> b!532349 (=> (not res!327749) (not e!309975))))

(declare-datatypes ((SeekEntryResult!4618 0))(
  ( (MissingZero!4618 (index!20696 (_ BitVec 32))) (Found!4618 (index!20697 (_ BitVec 32))) (Intermediate!4618 (undefined!5430 Bool) (index!20698 (_ BitVec 32)) (x!49816 (_ BitVec 32))) (Undefined!4618) (MissingVacant!4618 (index!20699 (_ BitVec 32))) )
))
(declare-fun lt!245217 () SeekEntryResult!4618)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532349 (= res!327749 (or (= lt!245217 (MissingZero!4618 i!1153)) (= lt!245217 (MissingVacant!4618 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33728 (_ BitVec 32)) SeekEntryResult!4618)

(assert (=> b!532349 (= lt!245217 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532350 () Bool)

(declare-fun res!327750 () Bool)

(assert (=> b!532350 (=> (not res!327750) (not e!309975))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33728 (_ BitVec 32)) SeekEntryResult!4618)

(assert (=> b!532350 (= res!327750 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16204 a!3154) j!147) a!3154 mask!3216) (Intermediate!4618 false resIndex!32 resX!32)))))

(declare-fun b!532351 () Bool)

(declare-fun res!327754 () Bool)

(assert (=> b!532351 (=> (not res!327754) (not e!309974))))

(assert (=> b!532351 (= res!327754 (and (= (size!16568 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16568 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16568 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532352 () Bool)

(assert (=> b!532352 (= e!309975 false)))

(declare-fun lt!245218 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532352 (= lt!245218 (toIndex!0 (select (arr!16204 a!3154) j!147) mask!3216))))

(declare-fun b!532353 () Bool)

(declare-fun res!327756 () Bool)

(assert (=> b!532353 (=> (not res!327756) (not e!309975))))

(assert (=> b!532353 (= res!327756 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16568 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16568 a!3154)) (= (select (arr!16204 a!3154) resIndex!32) (select (arr!16204 a!3154) j!147))))))

(declare-fun b!532354 () Bool)

(declare-fun res!327753 () Bool)

(assert (=> b!532354 (=> (not res!327753) (not e!309974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532354 (= res!327753 (validKeyInArray!0 k0!1998))))

(declare-fun b!532355 () Bool)

(declare-fun res!327757 () Bool)

(assert (=> b!532355 (=> (not res!327757) (not e!309975))))

(declare-datatypes ((List!10230 0))(
  ( (Nil!10227) (Cons!10226 (h!11166 (_ BitVec 64)) (t!16450 List!10230)) )
))
(declare-fun arrayNoDuplicates!0 (array!33728 (_ BitVec 32) List!10230) Bool)

(assert (=> b!532355 (= res!327757 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10227))))

(declare-fun res!327752 () Bool)

(assert (=> start!48466 (=> (not res!327752) (not e!309974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48466 (= res!327752 (validMask!0 mask!3216))))

(assert (=> start!48466 e!309974))

(assert (=> start!48466 true))

(declare-fun array_inv!12063 (array!33728) Bool)

(assert (=> start!48466 (array_inv!12063 a!3154)))

(declare-fun b!532356 () Bool)

(declare-fun res!327755 () Bool)

(assert (=> b!532356 (=> (not res!327755) (not e!309975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33728 (_ BitVec 32)) Bool)

(assert (=> b!532356 (= res!327755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532357 () Bool)

(declare-fun res!327751 () Bool)

(assert (=> b!532357 (=> (not res!327751) (not e!309974))))

(assert (=> b!532357 (= res!327751 (validKeyInArray!0 (select (arr!16204 a!3154) j!147)))))

(assert (= (and start!48466 res!327752) b!532351))

(assert (= (and b!532351 res!327754) b!532357))

(assert (= (and b!532357 res!327751) b!532354))

(assert (= (and b!532354 res!327753) b!532348))

(assert (= (and b!532348 res!327748) b!532349))

(assert (= (and b!532349 res!327749) b!532356))

(assert (= (and b!532356 res!327755) b!532355))

(assert (= (and b!532355 res!327757) b!532353))

(assert (= (and b!532353 res!327756) b!532350))

(assert (= (and b!532350 res!327750) b!532352))

(declare-fun m!512749 () Bool)

(assert (=> b!532354 m!512749))

(declare-fun m!512751 () Bool)

(assert (=> b!532357 m!512751))

(assert (=> b!532357 m!512751))

(declare-fun m!512753 () Bool)

(assert (=> b!532357 m!512753))

(assert (=> b!532350 m!512751))

(assert (=> b!532350 m!512751))

(declare-fun m!512755 () Bool)

(assert (=> b!532350 m!512755))

(declare-fun m!512757 () Bool)

(assert (=> start!48466 m!512757))

(declare-fun m!512759 () Bool)

(assert (=> start!48466 m!512759))

(declare-fun m!512761 () Bool)

(assert (=> b!532348 m!512761))

(declare-fun m!512763 () Bool)

(assert (=> b!532349 m!512763))

(declare-fun m!512765 () Bool)

(assert (=> b!532356 m!512765))

(declare-fun m!512767 () Bool)

(assert (=> b!532353 m!512767))

(assert (=> b!532353 m!512751))

(assert (=> b!532352 m!512751))

(assert (=> b!532352 m!512751))

(declare-fun m!512769 () Bool)

(assert (=> b!532352 m!512769))

(declare-fun m!512771 () Bool)

(assert (=> b!532355 m!512771))

(check-sat (not b!532349) (not b!532354) (not b!532355) (not start!48466) (not b!532357) (not b!532356) (not b!532350) (not b!532352) (not b!532348))
(check-sat)
