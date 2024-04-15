; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48654 () Bool)

(assert start!48654)

(declare-fun b!534415 () Bool)

(declare-fun res!329766 () Bool)

(declare-fun e!310613 () Bool)

(assert (=> b!534415 (=> (not res!329766) (not e!310613))))

(declare-datatypes ((array!33876 0))(
  ( (array!33877 (arr!16277 (Array (_ BitVec 32) (_ BitVec 64))) (size!16642 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33876)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534415 (= res!329766 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534416 () Bool)

(declare-fun res!329762 () Bool)

(assert (=> b!534416 (=> (not res!329762) (not e!310613))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534416 (= res!329762 (validKeyInArray!0 (select (arr!16277 a!3154) j!147)))))

(declare-fun b!534417 () Bool)

(declare-fun res!329768 () Bool)

(declare-fun e!310614 () Bool)

(assert (=> b!534417 (=> (not res!329768) (not e!310614))))

(declare-datatypes ((List!10435 0))(
  ( (Nil!10432) (Cons!10431 (h!11374 (_ BitVec 64)) (t!16654 List!10435)) )
))
(declare-fun arrayNoDuplicates!0 (array!33876 (_ BitVec 32) List!10435) Bool)

(assert (=> b!534417 (= res!329768 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10432))))

(declare-fun b!534418 () Bool)

(declare-fun res!329763 () Bool)

(assert (=> b!534418 (=> (not res!329763) (not e!310613))))

(assert (=> b!534418 (= res!329763 (validKeyInArray!0 k0!1998))))

(declare-fun res!329770 () Bool)

(assert (=> start!48654 (=> (not res!329770) (not e!310613))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48654 (= res!329770 (validMask!0 mask!3216))))

(assert (=> start!48654 e!310613))

(assert (=> start!48654 true))

(declare-fun array_inv!12160 (array!33876) Bool)

(assert (=> start!48654 (array_inv!12160 a!3154)))

(declare-fun b!534419 () Bool)

(declare-fun res!329764 () Bool)

(assert (=> b!534419 (=> (not res!329764) (not e!310614))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534419 (= res!329764 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16642 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16642 a!3154)) (= (select (arr!16277 a!3154) resIndex!32) (select (arr!16277 a!3154) j!147))))))

(declare-fun b!534420 () Bool)

(declare-fun res!329767 () Bool)

(assert (=> b!534420 (=> (not res!329767) (not e!310613))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534420 (= res!329767 (and (= (size!16642 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16642 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16642 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534421 () Bool)

(declare-fun res!329769 () Bool)

(assert (=> b!534421 (=> (not res!329769) (not e!310614))))

(declare-datatypes ((SeekEntryResult!4732 0))(
  ( (MissingZero!4732 (index!21152 (_ BitVec 32))) (Found!4732 (index!21153 (_ BitVec 32))) (Intermediate!4732 (undefined!5544 Bool) (index!21154 (_ BitVec 32)) (x!50118 (_ BitVec 32))) (Undefined!4732) (MissingVacant!4732 (index!21155 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33876 (_ BitVec 32)) SeekEntryResult!4732)

(assert (=> b!534421 (= res!329769 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16277 a!3154) j!147) a!3154 mask!3216) (Intermediate!4732 false resIndex!32 resX!32)))))

(declare-fun b!534422 () Bool)

(assert (=> b!534422 (= e!310614 false)))

(declare-fun lt!245449 () SeekEntryResult!4732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534422 (= lt!245449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16277 a!3154) j!147) mask!3216) (select (arr!16277 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534423 () Bool)

(assert (=> b!534423 (= e!310613 e!310614)))

(declare-fun res!329771 () Bool)

(assert (=> b!534423 (=> (not res!329771) (not e!310614))))

(declare-fun lt!245448 () SeekEntryResult!4732)

(assert (=> b!534423 (= res!329771 (or (= lt!245448 (MissingZero!4732 i!1153)) (= lt!245448 (MissingVacant!4732 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33876 (_ BitVec 32)) SeekEntryResult!4732)

(assert (=> b!534423 (= lt!245448 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534424 () Bool)

(declare-fun res!329765 () Bool)

(assert (=> b!534424 (=> (not res!329765) (not e!310614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33876 (_ BitVec 32)) Bool)

(assert (=> b!534424 (= res!329765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48654 res!329770) b!534420))

(assert (= (and b!534420 res!329767) b!534416))

(assert (= (and b!534416 res!329762) b!534418))

(assert (= (and b!534418 res!329763) b!534415))

(assert (= (and b!534415 res!329766) b!534423))

(assert (= (and b!534423 res!329771) b!534424))

(assert (= (and b!534424 res!329765) b!534417))

(assert (= (and b!534417 res!329768) b!534419))

(assert (= (and b!534419 res!329764) b!534421))

(assert (= (and b!534421 res!329769) b!534422))

(declare-fun m!513619 () Bool)

(assert (=> start!48654 m!513619))

(declare-fun m!513621 () Bool)

(assert (=> start!48654 m!513621))

(declare-fun m!513623 () Bool)

(assert (=> b!534418 m!513623))

(declare-fun m!513625 () Bool)

(assert (=> b!534423 m!513625))

(declare-fun m!513627 () Bool)

(assert (=> b!534422 m!513627))

(assert (=> b!534422 m!513627))

(declare-fun m!513629 () Bool)

(assert (=> b!534422 m!513629))

(assert (=> b!534422 m!513629))

(assert (=> b!534422 m!513627))

(declare-fun m!513631 () Bool)

(assert (=> b!534422 m!513631))

(declare-fun m!513633 () Bool)

(assert (=> b!534415 m!513633))

(declare-fun m!513635 () Bool)

(assert (=> b!534419 m!513635))

(assert (=> b!534419 m!513627))

(assert (=> b!534416 m!513627))

(assert (=> b!534416 m!513627))

(declare-fun m!513637 () Bool)

(assert (=> b!534416 m!513637))

(declare-fun m!513639 () Bool)

(assert (=> b!534417 m!513639))

(declare-fun m!513641 () Bool)

(assert (=> b!534424 m!513641))

(assert (=> b!534421 m!513627))

(assert (=> b!534421 m!513627))

(declare-fun m!513643 () Bool)

(assert (=> b!534421 m!513643))

(check-sat (not b!534421) (not b!534417) (not b!534424) (not b!534423) (not b!534422) (not start!48654) (not b!534418) (not b!534416) (not b!534415))
(check-sat)
