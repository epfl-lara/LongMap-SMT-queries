; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48646 () Bool)

(assert start!48646)

(declare-fun res!329710 () Bool)

(declare-fun e!310695 () Bool)

(assert (=> start!48646 (=> (not res!329710) (not e!310695))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48646 (= res!329710 (validMask!0 mask!3216))))

(assert (=> start!48646 e!310695))

(assert (=> start!48646 true))

(declare-datatypes ((array!33857 0))(
  ( (array!33858 (arr!16267 (Array (_ BitVec 32) (_ BitVec 64))) (size!16631 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33857)

(declare-fun array_inv!12126 (array!33857) Bool)

(assert (=> start!48646 (array_inv!12126 a!3154)))

(declare-fun b!534445 () Bool)

(declare-fun e!310694 () Bool)

(assert (=> b!534445 (= e!310695 e!310694)))

(declare-fun res!329713 () Bool)

(assert (=> b!534445 (=> (not res!329713) (not e!310694))))

(declare-datatypes ((SeekEntryResult!4681 0))(
  ( (MissingZero!4681 (index!20948 (_ BitVec 32))) (Found!4681 (index!20949 (_ BitVec 32))) (Intermediate!4681 (undefined!5493 Bool) (index!20950 (_ BitVec 32)) (x!50053 (_ BitVec 32))) (Undefined!4681) (MissingVacant!4681 (index!20951 (_ BitVec 32))) )
))
(declare-fun lt!245659 () SeekEntryResult!4681)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534445 (= res!329713 (or (= lt!245659 (MissingZero!4681 i!1153)) (= lt!245659 (MissingVacant!4681 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33857 (_ BitVec 32)) SeekEntryResult!4681)

(assert (=> b!534445 (= lt!245659 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534446 () Bool)

(declare-fun res!329709 () Bool)

(assert (=> b!534446 (=> (not res!329709) (not e!310695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534446 (= res!329709 (validKeyInArray!0 k0!1998))))

(declare-fun b!534447 () Bool)

(assert (=> b!534447 (= e!310694 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!245658 () SeekEntryResult!4681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33857 (_ BitVec 32)) SeekEntryResult!4681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534447 (= lt!245658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16267 a!3154) j!147) mask!3216) (select (arr!16267 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534448 () Bool)

(declare-fun res!329711 () Bool)

(assert (=> b!534448 (=> (not res!329711) (not e!310694))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534448 (= res!329711 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16631 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16631 a!3154)) (= (select (arr!16267 a!3154) resIndex!32) (select (arr!16267 a!3154) j!147))))))

(declare-fun b!534449 () Bool)

(declare-fun res!329708 () Bool)

(assert (=> b!534449 (=> (not res!329708) (not e!310695))))

(assert (=> b!534449 (= res!329708 (validKeyInArray!0 (select (arr!16267 a!3154) j!147)))))

(declare-fun b!534450 () Bool)

(declare-fun res!329707 () Bool)

(assert (=> b!534450 (=> (not res!329707) (not e!310694))))

(assert (=> b!534450 (= res!329707 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16267 a!3154) j!147) a!3154 mask!3216) (Intermediate!4681 false resIndex!32 resX!32)))))

(declare-fun b!534451 () Bool)

(declare-fun res!329712 () Bool)

(assert (=> b!534451 (=> (not res!329712) (not e!310695))))

(declare-fun arrayContainsKey!0 (array!33857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534451 (= res!329712 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534452 () Bool)

(declare-fun res!329706 () Bool)

(assert (=> b!534452 (=> (not res!329706) (not e!310694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33857 (_ BitVec 32)) Bool)

(assert (=> b!534452 (= res!329706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534453 () Bool)

(declare-fun res!329704 () Bool)

(assert (=> b!534453 (=> (not res!329704) (not e!310694))))

(declare-datatypes ((List!10293 0))(
  ( (Nil!10290) (Cons!10289 (h!11232 (_ BitVec 64)) (t!16513 List!10293)) )
))
(declare-fun arrayNoDuplicates!0 (array!33857 (_ BitVec 32) List!10293) Bool)

(assert (=> b!534453 (= res!329704 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10290))))

(declare-fun b!534454 () Bool)

(declare-fun res!329705 () Bool)

(assert (=> b!534454 (=> (not res!329705) (not e!310695))))

(assert (=> b!534454 (= res!329705 (and (= (size!16631 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16631 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16631 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48646 res!329710) b!534454))

(assert (= (and b!534454 res!329705) b!534449))

(assert (= (and b!534449 res!329708) b!534446))

(assert (= (and b!534446 res!329709) b!534451))

(assert (= (and b!534451 res!329712) b!534445))

(assert (= (and b!534445 res!329713) b!534452))

(assert (= (and b!534452 res!329706) b!534453))

(assert (= (and b!534453 res!329704) b!534448))

(assert (= (and b!534448 res!329711) b!534450))

(assert (= (and b!534450 res!329707) b!534447))

(declare-fun m!514399 () Bool)

(assert (=> b!534450 m!514399))

(assert (=> b!534450 m!514399))

(declare-fun m!514401 () Bool)

(assert (=> b!534450 m!514401))

(declare-fun m!514403 () Bool)

(assert (=> start!48646 m!514403))

(declare-fun m!514405 () Bool)

(assert (=> start!48646 m!514405))

(declare-fun m!514407 () Bool)

(assert (=> b!534451 m!514407))

(assert (=> b!534449 m!514399))

(assert (=> b!534449 m!514399))

(declare-fun m!514409 () Bool)

(assert (=> b!534449 m!514409))

(declare-fun m!514411 () Bool)

(assert (=> b!534445 m!514411))

(declare-fun m!514413 () Bool)

(assert (=> b!534452 m!514413))

(declare-fun m!514415 () Bool)

(assert (=> b!534453 m!514415))

(assert (=> b!534447 m!514399))

(assert (=> b!534447 m!514399))

(declare-fun m!514417 () Bool)

(assert (=> b!534447 m!514417))

(assert (=> b!534447 m!514417))

(assert (=> b!534447 m!514399))

(declare-fun m!514419 () Bool)

(assert (=> b!534447 m!514419))

(declare-fun m!514421 () Bool)

(assert (=> b!534446 m!514421))

(declare-fun m!514423 () Bool)

(assert (=> b!534448 m!514423))

(assert (=> b!534448 m!514399))

(check-sat (not b!534453) (not b!534450) (not b!534449) (not b!534451) (not b!534447) (not b!534452) (not b!534445) (not start!48646) (not b!534446))
(check-sat)
