; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48652 () Bool)

(assert start!48652)

(declare-fun b!534476 () Bool)

(declare-fun res!329685 () Bool)

(declare-fun e!310725 () Bool)

(assert (=> b!534476 (=> (not res!329685) (not e!310725))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33864 0))(
  ( (array!33865 (arr!16271 (Array (_ BitVec 32) (_ BitVec 64))) (size!16635 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33864)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534476 (= res!329685 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16635 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16635 a!3154)) (= (select (arr!16271 a!3154) resIndex!32) (select (arr!16271 a!3154) j!147))))))

(declare-fun b!534477 () Bool)

(declare-fun e!310724 () Bool)

(assert (=> b!534477 (= e!310724 e!310725)))

(declare-fun res!329686 () Bool)

(assert (=> b!534477 (=> (not res!329686) (not e!310725))))

(declare-datatypes ((SeekEntryResult!4729 0))(
  ( (MissingZero!4729 (index!21140 (_ BitVec 32))) (Found!4729 (index!21141 (_ BitVec 32))) (Intermediate!4729 (undefined!5541 Bool) (index!21142 (_ BitVec 32)) (x!50096 (_ BitVec 32))) (Undefined!4729) (MissingVacant!4729 (index!21143 (_ BitVec 32))) )
))
(declare-fun lt!245640 () SeekEntryResult!4729)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534477 (= res!329686 (or (= lt!245640 (MissingZero!4729 i!1153)) (= lt!245640 (MissingVacant!4729 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33864 (_ BitVec 32)) SeekEntryResult!4729)

(assert (=> b!534477 (= lt!245640 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534478 () Bool)

(declare-fun res!329688 () Bool)

(assert (=> b!534478 (=> (not res!329688) (not e!310724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534478 (= res!329688 (validKeyInArray!0 k!1998))))

(declare-fun b!534479 () Bool)

(declare-fun res!329684 () Bool)

(assert (=> b!534479 (=> (not res!329684) (not e!310725))))

(declare-datatypes ((List!10390 0))(
  ( (Nil!10387) (Cons!10386 (h!11329 (_ BitVec 64)) (t!16618 List!10390)) )
))
(declare-fun arrayNoDuplicates!0 (array!33864 (_ BitVec 32) List!10390) Bool)

(assert (=> b!534479 (= res!329684 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10387))))

(declare-fun res!329687 () Bool)

(assert (=> start!48652 (=> (not res!329687) (not e!310724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48652 (= res!329687 (validMask!0 mask!3216))))

(assert (=> start!48652 e!310724))

(assert (=> start!48652 true))

(declare-fun array_inv!12067 (array!33864) Bool)

(assert (=> start!48652 (array_inv!12067 a!3154)))

(declare-fun b!534480 () Bool)

(declare-fun res!329682 () Bool)

(assert (=> b!534480 (=> (not res!329682) (not e!310724))))

(assert (=> b!534480 (= res!329682 (and (= (size!16635 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16635 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16635 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534481 () Bool)

(declare-fun res!329681 () Bool)

(assert (=> b!534481 (=> (not res!329681) (not e!310724))))

(declare-fun arrayContainsKey!0 (array!33864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534481 (= res!329681 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534482 () Bool)

(declare-fun res!329683 () Bool)

(assert (=> b!534482 (=> (not res!329683) (not e!310725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33864 (_ BitVec 32)) Bool)

(assert (=> b!534482 (= res!329683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534483 () Bool)

(assert (=> b!534483 (= e!310725 false)))

(declare-fun lt!245641 () SeekEntryResult!4729)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33864 (_ BitVec 32)) SeekEntryResult!4729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534483 (= lt!245641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16271 a!3154) j!147) mask!3216) (select (arr!16271 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534484 () Bool)

(declare-fun res!329689 () Bool)

(assert (=> b!534484 (=> (not res!329689) (not e!310725))))

(assert (=> b!534484 (= res!329689 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16271 a!3154) j!147) a!3154 mask!3216) (Intermediate!4729 false resIndex!32 resX!32)))))

(declare-fun b!534485 () Bool)

(declare-fun res!329690 () Bool)

(assert (=> b!534485 (=> (not res!329690) (not e!310724))))

(assert (=> b!534485 (= res!329690 (validKeyInArray!0 (select (arr!16271 a!3154) j!147)))))

(assert (= (and start!48652 res!329687) b!534480))

(assert (= (and b!534480 res!329682) b!534485))

(assert (= (and b!534485 res!329690) b!534478))

(assert (= (and b!534478 res!329688) b!534481))

(assert (= (and b!534481 res!329681) b!534477))

(assert (= (and b!534477 res!329686) b!534482))

(assert (= (and b!534482 res!329683) b!534479))

(assert (= (and b!534479 res!329684) b!534476))

(assert (= (and b!534476 res!329685) b!534484))

(assert (= (and b!534484 res!329689) b!534483))

(declare-fun m!514189 () Bool)

(assert (=> b!534483 m!514189))

(assert (=> b!534483 m!514189))

(declare-fun m!514191 () Bool)

(assert (=> b!534483 m!514191))

(assert (=> b!534483 m!514191))

(assert (=> b!534483 m!514189))

(declare-fun m!514193 () Bool)

(assert (=> b!534483 m!514193))

(declare-fun m!514195 () Bool)

(assert (=> b!534478 m!514195))

(declare-fun m!514197 () Bool)

(assert (=> b!534476 m!514197))

(assert (=> b!534476 m!514189))

(declare-fun m!514199 () Bool)

(assert (=> b!534481 m!514199))

(assert (=> b!534484 m!514189))

(assert (=> b!534484 m!514189))

(declare-fun m!514201 () Bool)

(assert (=> b!534484 m!514201))

(assert (=> b!534485 m!514189))

(assert (=> b!534485 m!514189))

(declare-fun m!514203 () Bool)

(assert (=> b!534485 m!514203))

(declare-fun m!514205 () Bool)

(assert (=> b!534482 m!514205))

(declare-fun m!514207 () Bool)

(assert (=> b!534479 m!514207))

(declare-fun m!514209 () Bool)

(assert (=> start!48652 m!514209))

(declare-fun m!514211 () Bool)

(assert (=> start!48652 m!514211))

(declare-fun m!514213 () Bool)

(assert (=> b!534477 m!514213))

(push 1)

(assert (not b!534484))

(assert (not b!534481))

(assert (not b!534477))

(assert (not b!534483))

(assert (not b!534485))

(assert (not b!534478))

(assert (not start!48652))

(assert (not b!534482))

