; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48648 () Bool)

(assert start!48648)

(declare-fun b!534325 () Bool)

(declare-fun res!329679 () Bool)

(declare-fun e!310586 () Bool)

(assert (=> b!534325 (=> (not res!329679) (not e!310586))))

(declare-datatypes ((array!33870 0))(
  ( (array!33871 (arr!16274 (Array (_ BitVec 32) (_ BitVec 64))) (size!16639 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33870)

(declare-datatypes ((List!10432 0))(
  ( (Nil!10429) (Cons!10428 (h!11371 (_ BitVec 64)) (t!16651 List!10432)) )
))
(declare-fun arrayNoDuplicates!0 (array!33870 (_ BitVec 32) List!10432) Bool)

(assert (=> b!534325 (= res!329679 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10429))))

(declare-fun b!534326 () Bool)

(declare-fun res!329678 () Bool)

(assert (=> b!534326 (=> (not res!329678) (not e!310586))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4729 0))(
  ( (MissingZero!4729 (index!21140 (_ BitVec 32))) (Found!4729 (index!21141 (_ BitVec 32))) (Intermediate!4729 (undefined!5541 Bool) (index!21142 (_ BitVec 32)) (x!50107 (_ BitVec 32))) (Undefined!4729) (MissingVacant!4729 (index!21143 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33870 (_ BitVec 32)) SeekEntryResult!4729)

(assert (=> b!534326 (= res!329678 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16274 a!3154) j!147) a!3154 mask!3216) (Intermediate!4729 false resIndex!32 resX!32)))))

(declare-fun b!534327 () Bool)

(declare-fun res!329673 () Bool)

(declare-fun e!310585 () Bool)

(assert (=> b!534327 (=> (not res!329673) (not e!310585))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534327 (= res!329673 (and (= (size!16639 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16639 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16639 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534328 () Bool)

(declare-fun res!329672 () Bool)

(assert (=> b!534328 (=> (not res!329672) (not e!310585))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534328 (= res!329672 (validKeyInArray!0 k0!1998))))

(declare-fun b!534329 () Bool)

(declare-fun res!329681 () Bool)

(assert (=> b!534329 (=> (not res!329681) (not e!310586))))

(assert (=> b!534329 (= res!329681 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16639 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16639 a!3154)) (= (select (arr!16274 a!3154) resIndex!32) (select (arr!16274 a!3154) j!147))))))

(declare-fun b!534330 () Bool)

(declare-fun res!329674 () Bool)

(assert (=> b!534330 (=> (not res!329674) (not e!310586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33870 (_ BitVec 32)) Bool)

(assert (=> b!534330 (= res!329674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534331 () Bool)

(assert (=> b!534331 (= e!310586 false)))

(declare-fun lt!245430 () SeekEntryResult!4729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534331 (= lt!245430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16274 a!3154) j!147) mask!3216) (select (arr!16274 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!329680 () Bool)

(assert (=> start!48648 (=> (not res!329680) (not e!310585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48648 (= res!329680 (validMask!0 mask!3216))))

(assert (=> start!48648 e!310585))

(assert (=> start!48648 true))

(declare-fun array_inv!12157 (array!33870) Bool)

(assert (=> start!48648 (array_inv!12157 a!3154)))

(declare-fun b!534332 () Bool)

(declare-fun res!329677 () Bool)

(assert (=> b!534332 (=> (not res!329677) (not e!310585))))

(declare-fun arrayContainsKey!0 (array!33870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534332 (= res!329677 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534333 () Bool)

(declare-fun res!329675 () Bool)

(assert (=> b!534333 (=> (not res!329675) (not e!310585))))

(assert (=> b!534333 (= res!329675 (validKeyInArray!0 (select (arr!16274 a!3154) j!147)))))

(declare-fun b!534334 () Bool)

(assert (=> b!534334 (= e!310585 e!310586)))

(declare-fun res!329676 () Bool)

(assert (=> b!534334 (=> (not res!329676) (not e!310586))))

(declare-fun lt!245431 () SeekEntryResult!4729)

(assert (=> b!534334 (= res!329676 (or (= lt!245431 (MissingZero!4729 i!1153)) (= lt!245431 (MissingVacant!4729 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33870 (_ BitVec 32)) SeekEntryResult!4729)

(assert (=> b!534334 (= lt!245431 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48648 res!329680) b!534327))

(assert (= (and b!534327 res!329673) b!534333))

(assert (= (and b!534333 res!329675) b!534328))

(assert (= (and b!534328 res!329672) b!534332))

(assert (= (and b!534332 res!329677) b!534334))

(assert (= (and b!534334 res!329676) b!534330))

(assert (= (and b!534330 res!329674) b!534325))

(assert (= (and b!534325 res!329679) b!534329))

(assert (= (and b!534329 res!329681) b!534326))

(assert (= (and b!534326 res!329678) b!534331))

(declare-fun m!513541 () Bool)

(assert (=> b!534326 m!513541))

(assert (=> b!534326 m!513541))

(declare-fun m!513543 () Bool)

(assert (=> b!534326 m!513543))

(declare-fun m!513545 () Bool)

(assert (=> b!534332 m!513545))

(declare-fun m!513547 () Bool)

(assert (=> b!534329 m!513547))

(assert (=> b!534329 m!513541))

(declare-fun m!513549 () Bool)

(assert (=> b!534330 m!513549))

(assert (=> b!534331 m!513541))

(assert (=> b!534331 m!513541))

(declare-fun m!513551 () Bool)

(assert (=> b!534331 m!513551))

(assert (=> b!534331 m!513551))

(assert (=> b!534331 m!513541))

(declare-fun m!513553 () Bool)

(assert (=> b!534331 m!513553))

(assert (=> b!534333 m!513541))

(assert (=> b!534333 m!513541))

(declare-fun m!513555 () Bool)

(assert (=> b!534333 m!513555))

(declare-fun m!513557 () Bool)

(assert (=> b!534328 m!513557))

(declare-fun m!513559 () Bool)

(assert (=> start!48648 m!513559))

(declare-fun m!513561 () Bool)

(assert (=> start!48648 m!513561))

(declare-fun m!513563 () Bool)

(assert (=> b!534334 m!513563))

(declare-fun m!513565 () Bool)

(assert (=> b!534325 m!513565))

(check-sat (not b!534325) (not start!48648) (not b!534332) (not b!534333) (not b!534326) (not b!534334) (not b!534330) (not b!534328) (not b!534331))
(check-sat)
