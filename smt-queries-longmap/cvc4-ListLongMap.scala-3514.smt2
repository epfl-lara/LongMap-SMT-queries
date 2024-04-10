; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48658 () Bool)

(assert start!48658)

(declare-fun b!534566 () Bool)

(declare-fun res!329774 () Bool)

(declare-fun e!310751 () Bool)

(assert (=> b!534566 (=> (not res!329774) (not e!310751))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33870 0))(
  ( (array!33871 (arr!16274 (Array (_ BitVec 32) (_ BitVec 64))) (size!16638 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33870)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534566 (= res!329774 (and (= (size!16638 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16638 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16638 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534567 () Bool)

(declare-fun res!329772 () Bool)

(assert (=> b!534567 (=> (not res!329772) (not e!310751))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534567 (= res!329772 (validKeyInArray!0 k!1998))))

(declare-fun b!534568 () Bool)

(declare-fun e!310750 () Bool)

(assert (=> b!534568 (= e!310751 e!310750)))

(declare-fun res!329776 () Bool)

(assert (=> b!534568 (=> (not res!329776) (not e!310750))))

(declare-datatypes ((SeekEntryResult!4732 0))(
  ( (MissingZero!4732 (index!21152 (_ BitVec 32))) (Found!4732 (index!21153 (_ BitVec 32))) (Intermediate!4732 (undefined!5544 Bool) (index!21154 (_ BitVec 32)) (x!50107 (_ BitVec 32))) (Undefined!4732) (MissingVacant!4732 (index!21155 (_ BitVec 32))) )
))
(declare-fun lt!245658 () SeekEntryResult!4732)

(assert (=> b!534568 (= res!329776 (or (= lt!245658 (MissingZero!4732 i!1153)) (= lt!245658 (MissingVacant!4732 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33870 (_ BitVec 32)) SeekEntryResult!4732)

(assert (=> b!534568 (= lt!245658 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534569 () Bool)

(assert (=> b!534569 (= e!310750 false)))

(declare-fun lt!245659 () SeekEntryResult!4732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33870 (_ BitVec 32)) SeekEntryResult!4732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534569 (= lt!245659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16274 a!3154) j!147) mask!3216) (select (arr!16274 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534570 () Bool)

(declare-fun res!329778 () Bool)

(assert (=> b!534570 (=> (not res!329778) (not e!310751))))

(declare-fun arrayContainsKey!0 (array!33870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534570 (= res!329778 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534571 () Bool)

(declare-fun res!329773 () Bool)

(assert (=> b!534571 (=> (not res!329773) (not e!310750))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534571 (= res!329773 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16274 a!3154) j!147) a!3154 mask!3216) (Intermediate!4732 false resIndex!32 resX!32)))))

(declare-fun b!534572 () Bool)

(declare-fun res!329780 () Bool)

(assert (=> b!534572 (=> (not res!329780) (not e!310751))))

(assert (=> b!534572 (= res!329780 (validKeyInArray!0 (select (arr!16274 a!3154) j!147)))))

(declare-fun b!534573 () Bool)

(declare-fun res!329771 () Bool)

(assert (=> b!534573 (=> (not res!329771) (not e!310750))))

(assert (=> b!534573 (= res!329771 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16638 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16638 a!3154)) (= (select (arr!16274 a!3154) resIndex!32) (select (arr!16274 a!3154) j!147))))))

(declare-fun b!534574 () Bool)

(declare-fun res!329779 () Bool)

(assert (=> b!534574 (=> (not res!329779) (not e!310750))))

(declare-datatypes ((List!10393 0))(
  ( (Nil!10390) (Cons!10389 (h!11332 (_ BitVec 64)) (t!16621 List!10393)) )
))
(declare-fun arrayNoDuplicates!0 (array!33870 (_ BitVec 32) List!10393) Bool)

(assert (=> b!534574 (= res!329779 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10390))))

(declare-fun b!534575 () Bool)

(declare-fun res!329777 () Bool)

(assert (=> b!534575 (=> (not res!329777) (not e!310750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33870 (_ BitVec 32)) Bool)

(assert (=> b!534575 (= res!329777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329775 () Bool)

(assert (=> start!48658 (=> (not res!329775) (not e!310751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48658 (= res!329775 (validMask!0 mask!3216))))

(assert (=> start!48658 e!310751))

(assert (=> start!48658 true))

(declare-fun array_inv!12070 (array!33870) Bool)

(assert (=> start!48658 (array_inv!12070 a!3154)))

(assert (= (and start!48658 res!329775) b!534566))

(assert (= (and b!534566 res!329774) b!534572))

(assert (= (and b!534572 res!329780) b!534567))

(assert (= (and b!534567 res!329772) b!534570))

(assert (= (and b!534570 res!329778) b!534568))

(assert (= (and b!534568 res!329776) b!534575))

(assert (= (and b!534575 res!329777) b!534574))

(assert (= (and b!534574 res!329779) b!534573))

(assert (= (and b!534573 res!329771) b!534571))

(assert (= (and b!534571 res!329773) b!534569))

(declare-fun m!514267 () Bool)

(assert (=> b!534574 m!514267))

(declare-fun m!514269 () Bool)

(assert (=> b!534569 m!514269))

(assert (=> b!534569 m!514269))

(declare-fun m!514271 () Bool)

(assert (=> b!534569 m!514271))

(assert (=> b!534569 m!514271))

(assert (=> b!534569 m!514269))

(declare-fun m!514273 () Bool)

(assert (=> b!534569 m!514273))

(declare-fun m!514275 () Bool)

(assert (=> b!534568 m!514275))

(declare-fun m!514277 () Bool)

(assert (=> start!48658 m!514277))

(declare-fun m!514279 () Bool)

(assert (=> start!48658 m!514279))

(declare-fun m!514281 () Bool)

(assert (=> b!534570 m!514281))

(assert (=> b!534571 m!514269))

(assert (=> b!534571 m!514269))

(declare-fun m!514283 () Bool)

(assert (=> b!534571 m!514283))

(declare-fun m!514285 () Bool)

(assert (=> b!534567 m!514285))

(declare-fun m!514287 () Bool)

(assert (=> b!534575 m!514287))

(assert (=> b!534572 m!514269))

(assert (=> b!534572 m!514269))

(declare-fun m!514289 () Bool)

(assert (=> b!534572 m!514289))

(declare-fun m!514291 () Bool)

(assert (=> b!534573 m!514291))

(assert (=> b!534573 m!514269))

(push 1)

(assert (not b!534569))

(assert (not b!534574))

(assert (not b!534571))

(assert (not b!534567))

(assert (not b!534570))

(assert (not start!48658))

(assert (not b!534568))

(assert (not b!534572))

(assert (not 