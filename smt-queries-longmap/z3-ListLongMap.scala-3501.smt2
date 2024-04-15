; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48564 () Bool)

(assert start!48564)

(declare-fun b!533081 () Bool)

(declare-fun res!328430 () Bool)

(declare-fun e!310209 () Bool)

(assert (=> b!533081 (=> (not res!328430) (not e!310209))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533081 (= res!328430 (validKeyInArray!0 k0!1998))))

(declare-fun b!533082 () Bool)

(declare-fun e!310207 () Bool)

(assert (=> b!533082 (= e!310207 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4687 0))(
  ( (MissingZero!4687 (index!20972 (_ BitVec 32))) (Found!4687 (index!20973 (_ BitVec 32))) (Intermediate!4687 (undefined!5499 Bool) (index!20974 (_ BitVec 32)) (x!49953 (_ BitVec 32))) (Undefined!4687) (MissingVacant!4687 (index!20975 (_ BitVec 32))) )
))
(declare-fun lt!245196 () SeekEntryResult!4687)

(declare-datatypes ((array!33786 0))(
  ( (array!33787 (arr!16232 (Array (_ BitVec 32) (_ BitVec 64))) (size!16597 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33786)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33786 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!533082 (= lt!245196 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16232 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533083 () Bool)

(declare-fun res!328435 () Bool)

(assert (=> b!533083 (=> (not res!328435) (not e!310207))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533083 (= res!328435 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16597 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16597 a!3154)) (= (select (arr!16232 a!3154) resIndex!32) (select (arr!16232 a!3154) j!147))))))

(declare-fun b!533084 () Bool)

(declare-fun res!328428 () Bool)

(assert (=> b!533084 (=> (not res!328428) (not e!310209))))

(declare-fun arrayContainsKey!0 (array!33786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533084 (= res!328428 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!328429 () Bool)

(assert (=> start!48564 (=> (not res!328429) (not e!310209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48564 (= res!328429 (validMask!0 mask!3216))))

(assert (=> start!48564 e!310209))

(assert (=> start!48564 true))

(declare-fun array_inv!12115 (array!33786) Bool)

(assert (=> start!48564 (array_inv!12115 a!3154)))

(declare-fun b!533085 () Bool)

(declare-fun res!328436 () Bool)

(assert (=> b!533085 (=> (not res!328436) (not e!310207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33786 (_ BitVec 32)) Bool)

(assert (=> b!533085 (= res!328436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533086 () Bool)

(declare-fun res!328431 () Bool)

(assert (=> b!533086 (=> (not res!328431) (not e!310209))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533086 (= res!328431 (and (= (size!16597 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16597 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16597 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533087 () Bool)

(declare-fun res!328433 () Bool)

(assert (=> b!533087 (=> (not res!328433) (not e!310207))))

(declare-datatypes ((List!10390 0))(
  ( (Nil!10387) (Cons!10386 (h!11329 (_ BitVec 64)) (t!16609 List!10390)) )
))
(declare-fun arrayNoDuplicates!0 (array!33786 (_ BitVec 32) List!10390) Bool)

(assert (=> b!533087 (= res!328433 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10387))))

(declare-fun b!533088 () Bool)

(declare-fun res!328434 () Bool)

(assert (=> b!533088 (=> (not res!328434) (not e!310209))))

(assert (=> b!533088 (= res!328434 (validKeyInArray!0 (select (arr!16232 a!3154) j!147)))))

(declare-fun b!533089 () Bool)

(assert (=> b!533089 (= e!310209 e!310207)))

(declare-fun res!328432 () Bool)

(assert (=> b!533089 (=> (not res!328432) (not e!310207))))

(declare-fun lt!245197 () SeekEntryResult!4687)

(assert (=> b!533089 (= res!328432 (or (= lt!245197 (MissingZero!4687 i!1153)) (= lt!245197 (MissingVacant!4687 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33786 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!533089 (= lt!245197 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48564 res!328429) b!533086))

(assert (= (and b!533086 res!328431) b!533088))

(assert (= (and b!533088 res!328434) b!533081))

(assert (= (and b!533081 res!328430) b!533084))

(assert (= (and b!533084 res!328428) b!533089))

(assert (= (and b!533089 res!328432) b!533085))

(assert (= (and b!533085 res!328436) b!533087))

(assert (= (and b!533087 res!328433) b!533083))

(assert (= (and b!533083 res!328435) b!533082))

(declare-fun m!512497 () Bool)

(assert (=> b!533089 m!512497))

(declare-fun m!512499 () Bool)

(assert (=> b!533084 m!512499))

(declare-fun m!512501 () Bool)

(assert (=> b!533083 m!512501))

(declare-fun m!512503 () Bool)

(assert (=> b!533083 m!512503))

(declare-fun m!512505 () Bool)

(assert (=> b!533087 m!512505))

(declare-fun m!512507 () Bool)

(assert (=> b!533085 m!512507))

(declare-fun m!512509 () Bool)

(assert (=> b!533081 m!512509))

(declare-fun m!512511 () Bool)

(assert (=> start!48564 m!512511))

(declare-fun m!512513 () Bool)

(assert (=> start!48564 m!512513))

(assert (=> b!533082 m!512503))

(assert (=> b!533082 m!512503))

(declare-fun m!512515 () Bool)

(assert (=> b!533082 m!512515))

(assert (=> b!533088 m!512503))

(assert (=> b!533088 m!512503))

(declare-fun m!512517 () Bool)

(assert (=> b!533088 m!512517))

(check-sat (not b!533085) (not b!533084) (not b!533089) (not b!533087) (not b!533082) (not b!533081) (not start!48564) (not b!533088))
(check-sat)
