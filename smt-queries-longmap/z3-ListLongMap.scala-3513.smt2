; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48650 () Bool)

(assert start!48650)

(declare-fun b!534446 () Bool)

(declare-fun res!329652 () Bool)

(declare-fun e!310716 () Bool)

(assert (=> b!534446 (=> (not res!329652) (not e!310716))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((array!33862 0))(
  ( (array!33863 (arr!16270 (Array (_ BitVec 32) (_ BitVec 64))) (size!16634 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33862)

(assert (=> b!534446 (= res!329652 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16634 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16634 a!3154)) (= (select (arr!16270 a!3154) resIndex!32) (select (arr!16270 a!3154) j!147))))))

(declare-fun b!534448 () Bool)

(declare-fun e!310715 () Bool)

(assert (=> b!534448 (= e!310715 e!310716)))

(declare-fun res!329656 () Bool)

(assert (=> b!534448 (=> (not res!329656) (not e!310716))))

(declare-datatypes ((SeekEntryResult!4728 0))(
  ( (MissingZero!4728 (index!21136 (_ BitVec 32))) (Found!4728 (index!21137 (_ BitVec 32))) (Intermediate!4728 (undefined!5540 Bool) (index!21138 (_ BitVec 32)) (x!50095 (_ BitVec 32))) (Undefined!4728) (MissingVacant!4728 (index!21139 (_ BitVec 32))) )
))
(declare-fun lt!245635 () SeekEntryResult!4728)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534448 (= res!329656 (or (= lt!245635 (MissingZero!4728 i!1153)) (= lt!245635 (MissingVacant!4728 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33862 (_ BitVec 32)) SeekEntryResult!4728)

(assert (=> b!534448 (= lt!245635 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534449 () Bool)

(declare-fun res!329658 () Bool)

(assert (=> b!534449 (=> (not res!329658) (not e!310716))))

(declare-datatypes ((List!10389 0))(
  ( (Nil!10386) (Cons!10385 (h!11328 (_ BitVec 64)) (t!16617 List!10389)) )
))
(declare-fun arrayNoDuplicates!0 (array!33862 (_ BitVec 32) List!10389) Bool)

(assert (=> b!534449 (= res!329658 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10386))))

(declare-fun b!534450 () Bool)

(assert (=> b!534450 (= e!310716 false)))

(declare-fun lt!245634 () SeekEntryResult!4728)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33862 (_ BitVec 32)) SeekEntryResult!4728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534450 (= lt!245634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16270 a!3154) j!147) mask!3216) (select (arr!16270 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534451 () Bool)

(declare-fun res!329653 () Bool)

(assert (=> b!534451 (=> (not res!329653) (not e!310715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534451 (= res!329653 (validKeyInArray!0 (select (arr!16270 a!3154) j!147)))))

(declare-fun b!534452 () Bool)

(declare-fun res!329651 () Bool)

(assert (=> b!534452 (=> (not res!329651) (not e!310716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33862 (_ BitVec 32)) Bool)

(assert (=> b!534452 (= res!329651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534453 () Bool)

(declare-fun res!329655 () Bool)

(assert (=> b!534453 (=> (not res!329655) (not e!310715))))

(declare-fun arrayContainsKey!0 (array!33862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534453 (= res!329655 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534454 () Bool)

(declare-fun res!329654 () Bool)

(assert (=> b!534454 (=> (not res!329654) (not e!310716))))

(assert (=> b!534454 (= res!329654 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16270 a!3154) j!147) a!3154 mask!3216) (Intermediate!4728 false resIndex!32 resX!32)))))

(declare-fun b!534455 () Bool)

(declare-fun res!329659 () Bool)

(assert (=> b!534455 (=> (not res!329659) (not e!310715))))

(assert (=> b!534455 (= res!329659 (validKeyInArray!0 k0!1998))))

(declare-fun b!534447 () Bool)

(declare-fun res!329657 () Bool)

(assert (=> b!534447 (=> (not res!329657) (not e!310715))))

(assert (=> b!534447 (= res!329657 (and (= (size!16634 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16634 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16634 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!329660 () Bool)

(assert (=> start!48650 (=> (not res!329660) (not e!310715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48650 (= res!329660 (validMask!0 mask!3216))))

(assert (=> start!48650 e!310715))

(assert (=> start!48650 true))

(declare-fun array_inv!12066 (array!33862) Bool)

(assert (=> start!48650 (array_inv!12066 a!3154)))

(assert (= (and start!48650 res!329660) b!534447))

(assert (= (and b!534447 res!329657) b!534451))

(assert (= (and b!534451 res!329653) b!534455))

(assert (= (and b!534455 res!329659) b!534453))

(assert (= (and b!534453 res!329655) b!534448))

(assert (= (and b!534448 res!329656) b!534452))

(assert (= (and b!534452 res!329651) b!534449))

(assert (= (and b!534449 res!329658) b!534446))

(assert (= (and b!534446 res!329652) b!534454))

(assert (= (and b!534454 res!329654) b!534450))

(declare-fun m!514163 () Bool)

(assert (=> b!534448 m!514163))

(declare-fun m!514165 () Bool)

(assert (=> b!534454 m!514165))

(assert (=> b!534454 m!514165))

(declare-fun m!514167 () Bool)

(assert (=> b!534454 m!514167))

(declare-fun m!514169 () Bool)

(assert (=> b!534449 m!514169))

(declare-fun m!514171 () Bool)

(assert (=> b!534446 m!514171))

(assert (=> b!534446 m!514165))

(assert (=> b!534451 m!514165))

(assert (=> b!534451 m!514165))

(declare-fun m!514173 () Bool)

(assert (=> b!534451 m!514173))

(declare-fun m!514175 () Bool)

(assert (=> start!48650 m!514175))

(declare-fun m!514177 () Bool)

(assert (=> start!48650 m!514177))

(declare-fun m!514179 () Bool)

(assert (=> b!534453 m!514179))

(assert (=> b!534450 m!514165))

(assert (=> b!534450 m!514165))

(declare-fun m!514181 () Bool)

(assert (=> b!534450 m!514181))

(assert (=> b!534450 m!514181))

(assert (=> b!534450 m!514165))

(declare-fun m!514183 () Bool)

(assert (=> b!534450 m!514183))

(declare-fun m!514185 () Bool)

(assert (=> b!534452 m!514185))

(declare-fun m!514187 () Bool)

(assert (=> b!534455 m!514187))

(check-sat (not b!534453) (not b!534454) (not b!534451) (not b!534449) (not b!534455) (not start!48650) (not b!534452) (not b!534448) (not b!534450))
(check-sat)
