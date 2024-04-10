; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48654 () Bool)

(assert start!48654)

(declare-fun b!534506 () Bool)

(declare-fun res!329719 () Bool)

(declare-fun e!310732 () Bool)

(assert (=> b!534506 (=> (not res!329719) (not e!310732))))

(declare-datatypes ((array!33866 0))(
  ( (array!33867 (arr!16272 (Array (_ BitVec 32) (_ BitVec 64))) (size!16636 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33866)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534506 (= res!329719 (validKeyInArray!0 (select (arr!16272 a!3154) j!147)))))

(declare-fun b!534507 () Bool)

(declare-fun res!329715 () Bool)

(assert (=> b!534507 (=> (not res!329715) (not e!310732))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534507 (= res!329715 (and (= (size!16636 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16636 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16636 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534509 () Bool)

(declare-fun res!329720 () Bool)

(assert (=> b!534509 (=> (not res!329720) (not e!310732))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534509 (= res!329720 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534510 () Bool)

(declare-fun res!329717 () Bool)

(declare-fun e!310733 () Bool)

(assert (=> b!534510 (=> (not res!329717) (not e!310733))))

(declare-datatypes ((List!10391 0))(
  ( (Nil!10388) (Cons!10387 (h!11330 (_ BitVec 64)) (t!16619 List!10391)) )
))
(declare-fun arrayNoDuplicates!0 (array!33866 (_ BitVec 32) List!10391) Bool)

(assert (=> b!534510 (= res!329717 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10388))))

(declare-fun b!534511 () Bool)

(declare-fun res!329712 () Bool)

(assert (=> b!534511 (=> (not res!329712) (not e!310733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33866 (_ BitVec 32)) Bool)

(assert (=> b!534511 (= res!329712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534512 () Bool)

(declare-fun res!329711 () Bool)

(assert (=> b!534512 (=> (not res!329711) (not e!310733))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534512 (= res!329711 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16636 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16636 a!3154)) (= (select (arr!16272 a!3154) resIndex!32) (select (arr!16272 a!3154) j!147))))))

(declare-fun b!534513 () Bool)

(assert (=> b!534513 (= e!310733 false)))

(declare-datatypes ((SeekEntryResult!4730 0))(
  ( (MissingZero!4730 (index!21144 (_ BitVec 32))) (Found!4730 (index!21145 (_ BitVec 32))) (Intermediate!4730 (undefined!5542 Bool) (index!21146 (_ BitVec 32)) (x!50105 (_ BitVec 32))) (Undefined!4730) (MissingVacant!4730 (index!21147 (_ BitVec 32))) )
))
(declare-fun lt!245646 () SeekEntryResult!4730)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33866 (_ BitVec 32)) SeekEntryResult!4730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534513 (= lt!245646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16272 a!3154) j!147) mask!3216) (select (arr!16272 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534508 () Bool)

(assert (=> b!534508 (= e!310732 e!310733)))

(declare-fun res!329713 () Bool)

(assert (=> b!534508 (=> (not res!329713) (not e!310733))))

(declare-fun lt!245647 () SeekEntryResult!4730)

(assert (=> b!534508 (= res!329713 (or (= lt!245647 (MissingZero!4730 i!1153)) (= lt!245647 (MissingVacant!4730 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33866 (_ BitVec 32)) SeekEntryResult!4730)

(assert (=> b!534508 (= lt!245647 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!329716 () Bool)

(assert (=> start!48654 (=> (not res!329716) (not e!310732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48654 (= res!329716 (validMask!0 mask!3216))))

(assert (=> start!48654 e!310732))

(assert (=> start!48654 true))

(declare-fun array_inv!12068 (array!33866) Bool)

(assert (=> start!48654 (array_inv!12068 a!3154)))

(declare-fun b!534514 () Bool)

(declare-fun res!329714 () Bool)

(assert (=> b!534514 (=> (not res!329714) (not e!310733))))

(assert (=> b!534514 (= res!329714 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16272 a!3154) j!147) a!3154 mask!3216) (Intermediate!4730 false resIndex!32 resX!32)))))

(declare-fun b!534515 () Bool)

(declare-fun res!329718 () Bool)

(assert (=> b!534515 (=> (not res!329718) (not e!310732))))

(assert (=> b!534515 (= res!329718 (validKeyInArray!0 k!1998))))

(assert (= (and start!48654 res!329716) b!534507))

(assert (= (and b!534507 res!329715) b!534506))

(assert (= (and b!534506 res!329719) b!534515))

(assert (= (and b!534515 res!329718) b!534509))

(assert (= (and b!534509 res!329720) b!534508))

(assert (= (and b!534508 res!329713) b!534511))

(assert (= (and b!534511 res!329712) b!534510))

(assert (= (and b!534510 res!329717) b!534512))

(assert (= (and b!534512 res!329711) b!534514))

(assert (= (and b!534514 res!329714) b!534513))

(declare-fun m!514215 () Bool)

(assert (=> b!534512 m!514215))

(declare-fun m!514217 () Bool)

(assert (=> b!534512 m!514217))

(assert (=> b!534506 m!514217))

(assert (=> b!534506 m!514217))

(declare-fun m!514219 () Bool)

(assert (=> b!534506 m!514219))

(declare-fun m!514221 () Bool)

(assert (=> start!48654 m!514221))

(declare-fun m!514223 () Bool)

(assert (=> start!48654 m!514223))

(assert (=> b!534513 m!514217))

(assert (=> b!534513 m!514217))

(declare-fun m!514225 () Bool)

(assert (=> b!534513 m!514225))

(assert (=> b!534513 m!514225))

(assert (=> b!534513 m!514217))

(declare-fun m!514227 () Bool)

(assert (=> b!534513 m!514227))

(declare-fun m!514229 () Bool)

(assert (=> b!534511 m!514229))

(declare-fun m!514231 () Bool)

(assert (=> b!534510 m!514231))

(declare-fun m!514233 () Bool)

(assert (=> b!534508 m!514233))

(declare-fun m!514235 () Bool)

(assert (=> b!534509 m!514235))

(declare-fun m!514237 () Bool)

(assert (=> b!534515 m!514237))

(assert (=> b!534514 m!514217))

(assert (=> b!534514 m!514217))

(declare-fun m!514239 () Bool)

(assert (=> b!534514 m!514239))

(push 1)

