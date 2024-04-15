; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48816 () Bool)

(assert start!48816)

(declare-fun b!537355 () Bool)

(declare-fun e!311698 () Bool)

(declare-fun e!311696 () Bool)

(assert (=> b!537355 (= e!311698 e!311696)))

(declare-fun res!332705 () Bool)

(assert (=> b!537355 (=> (not res!332705) (not e!311696))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246229 () (_ BitVec 32))

(declare-datatypes ((array!34038 0))(
  ( (array!34039 (arr!16358 (Array (_ BitVec 32) (_ BitVec 64))) (size!16723 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34038)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537355 (= res!332705 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246229 #b00000000000000000000000000000000) (bvslt lt!246229 (size!16723 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537355 (= lt!246229 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537356 () Bool)

(declare-fun res!332714 () Bool)

(assert (=> b!537356 (=> (not res!332714) (not e!311698))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4813 0))(
  ( (MissingZero!4813 (index!21476 (_ BitVec 32))) (Found!4813 (index!21477 (_ BitVec 32))) (Intermediate!4813 (undefined!5625 Bool) (index!21478 (_ BitVec 32)) (x!50415 (_ BitVec 32))) (Undefined!4813) (MissingVacant!4813 (index!21479 (_ BitVec 32))) )
))
(declare-fun lt!246226 () SeekEntryResult!4813)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34038 (_ BitVec 32)) SeekEntryResult!4813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537356 (= res!332714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16358 a!3154) j!147) mask!3216) (select (arr!16358 a!3154) j!147) a!3154 mask!3216) lt!246226))))

(declare-fun res!332708 () Bool)

(declare-fun e!311697 () Bool)

(assert (=> start!48816 (=> (not res!332708) (not e!311697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48816 (= res!332708 (validMask!0 mask!3216))))

(assert (=> start!48816 e!311697))

(assert (=> start!48816 true))

(declare-fun array_inv!12241 (array!34038) Bool)

(assert (=> start!48816 (array_inv!12241 a!3154)))

(declare-fun b!537357 () Bool)

(assert (=> b!537357 (= e!311696 false)))

(declare-fun lt!246228 () SeekEntryResult!4813)

(assert (=> b!537357 (= lt!246228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246229 (select (arr!16358 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537358 () Bool)

(declare-fun res!332704 () Bool)

(assert (=> b!537358 (=> (not res!332704) (not e!311697))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537358 (= res!332704 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537359 () Bool)

(declare-fun res!332702 () Bool)

(assert (=> b!537359 (=> (not res!332702) (not e!311697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537359 (= res!332702 (validKeyInArray!0 (select (arr!16358 a!3154) j!147)))))

(declare-fun b!537360 () Bool)

(declare-fun res!332710 () Bool)

(declare-fun e!311699 () Bool)

(assert (=> b!537360 (=> (not res!332710) (not e!311699))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537360 (= res!332710 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16723 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16723 a!3154)) (= (select (arr!16358 a!3154) resIndex!32) (select (arr!16358 a!3154) j!147))))))

(declare-fun b!537361 () Bool)

(declare-fun res!332713 () Bool)

(assert (=> b!537361 (=> (not res!332713) (not e!311697))))

(assert (=> b!537361 (= res!332713 (validKeyInArray!0 k0!1998))))

(declare-fun b!537362 () Bool)

(declare-fun res!332709 () Bool)

(assert (=> b!537362 (=> (not res!332709) (not e!311697))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537362 (= res!332709 (and (= (size!16723 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16723 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16723 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537363 () Bool)

(assert (=> b!537363 (= e!311697 e!311699)))

(declare-fun res!332706 () Bool)

(assert (=> b!537363 (=> (not res!332706) (not e!311699))))

(declare-fun lt!246227 () SeekEntryResult!4813)

(assert (=> b!537363 (= res!332706 (or (= lt!246227 (MissingZero!4813 i!1153)) (= lt!246227 (MissingVacant!4813 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34038 (_ BitVec 32)) SeekEntryResult!4813)

(assert (=> b!537363 (= lt!246227 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537364 () Bool)

(declare-fun res!332711 () Bool)

(assert (=> b!537364 (=> (not res!332711) (not e!311699))))

(declare-datatypes ((List!10516 0))(
  ( (Nil!10513) (Cons!10512 (h!11455 (_ BitVec 64)) (t!16735 List!10516)) )
))
(declare-fun arrayNoDuplicates!0 (array!34038 (_ BitVec 32) List!10516) Bool)

(assert (=> b!537364 (= res!332711 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10513))))

(declare-fun b!537365 () Bool)

(assert (=> b!537365 (= e!311699 e!311698)))

(declare-fun res!332707 () Bool)

(assert (=> b!537365 (=> (not res!332707) (not e!311698))))

(assert (=> b!537365 (= res!332707 (= lt!246226 (Intermediate!4813 false resIndex!32 resX!32)))))

(assert (=> b!537365 (= lt!246226 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16358 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537366 () Bool)

(declare-fun res!332703 () Bool)

(assert (=> b!537366 (=> (not res!332703) (not e!311699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34038 (_ BitVec 32)) Bool)

(assert (=> b!537366 (= res!332703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537367 () Bool)

(declare-fun res!332712 () Bool)

(assert (=> b!537367 (=> (not res!332712) (not e!311698))))

(assert (=> b!537367 (= res!332712 (and (not (= (select (arr!16358 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16358 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16358 a!3154) index!1177) (select (arr!16358 a!3154) j!147)))))))

(assert (= (and start!48816 res!332708) b!537362))

(assert (= (and b!537362 res!332709) b!537359))

(assert (= (and b!537359 res!332702) b!537361))

(assert (= (and b!537361 res!332713) b!537358))

(assert (= (and b!537358 res!332704) b!537363))

(assert (= (and b!537363 res!332706) b!537366))

(assert (= (and b!537366 res!332703) b!537364))

(assert (= (and b!537364 res!332711) b!537360))

(assert (= (and b!537360 res!332710) b!537365))

(assert (= (and b!537365 res!332707) b!537356))

(assert (= (and b!537356 res!332714) b!537367))

(assert (= (and b!537367 res!332712) b!537355))

(assert (= (and b!537355 res!332705) b!537357))

(declare-fun m!516073 () Bool)

(assert (=> b!537357 m!516073))

(assert (=> b!537357 m!516073))

(declare-fun m!516075 () Bool)

(assert (=> b!537357 m!516075))

(declare-fun m!516077 () Bool)

(assert (=> b!537358 m!516077))

(declare-fun m!516079 () Bool)

(assert (=> b!537360 m!516079))

(assert (=> b!537360 m!516073))

(declare-fun m!516081 () Bool)

(assert (=> b!537355 m!516081))

(declare-fun m!516083 () Bool)

(assert (=> b!537363 m!516083))

(assert (=> b!537365 m!516073))

(assert (=> b!537365 m!516073))

(declare-fun m!516085 () Bool)

(assert (=> b!537365 m!516085))

(declare-fun m!516087 () Bool)

(assert (=> start!48816 m!516087))

(declare-fun m!516089 () Bool)

(assert (=> start!48816 m!516089))

(assert (=> b!537356 m!516073))

(assert (=> b!537356 m!516073))

(declare-fun m!516091 () Bool)

(assert (=> b!537356 m!516091))

(assert (=> b!537356 m!516091))

(assert (=> b!537356 m!516073))

(declare-fun m!516093 () Bool)

(assert (=> b!537356 m!516093))

(declare-fun m!516095 () Bool)

(assert (=> b!537364 m!516095))

(declare-fun m!516097 () Bool)

(assert (=> b!537367 m!516097))

(assert (=> b!537367 m!516073))

(assert (=> b!537359 m!516073))

(assert (=> b!537359 m!516073))

(declare-fun m!516099 () Bool)

(assert (=> b!537359 m!516099))

(declare-fun m!516101 () Bool)

(assert (=> b!537361 m!516101))

(declare-fun m!516103 () Bool)

(assert (=> b!537366 m!516103))

(check-sat (not b!537366) (not b!537363) (not b!537357) (not b!537355) (not b!537359) (not b!537365) (not b!537361) (not b!537356) (not b!537358) (not b!537364) (not start!48816))
(check-sat)
