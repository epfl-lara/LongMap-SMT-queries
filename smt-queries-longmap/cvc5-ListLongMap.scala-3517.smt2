; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48672 () Bool)

(assert start!48672)

(declare-fun res!329985 () Bool)

(declare-fun e!310813 () Bool)

(assert (=> start!48672 (=> (not res!329985) (not e!310813))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48672 (= res!329985 (validMask!0 mask!3216))))

(assert (=> start!48672 e!310813))

(assert (=> start!48672 true))

(declare-datatypes ((array!33884 0))(
  ( (array!33885 (arr!16281 (Array (_ BitVec 32) (_ BitVec 64))) (size!16645 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33884)

(declare-fun array_inv!12077 (array!33884) Bool)

(assert (=> start!48672 (array_inv!12077 a!3154)))

(declare-fun b!534776 () Bool)

(declare-fun res!329987 () Bool)

(declare-fun e!310814 () Bool)

(assert (=> b!534776 (=> (not res!329987) (not e!310814))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4739 0))(
  ( (MissingZero!4739 (index!21180 (_ BitVec 32))) (Found!4739 (index!21181 (_ BitVec 32))) (Intermediate!4739 (undefined!5551 Bool) (index!21182 (_ BitVec 32)) (x!50138 (_ BitVec 32))) (Undefined!4739) (MissingVacant!4739 (index!21183 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33884 (_ BitVec 32)) SeekEntryResult!4739)

(assert (=> b!534776 (= res!329987 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16281 a!3154) j!147) a!3154 mask!3216) (Intermediate!4739 false resIndex!32 resX!32)))))

(declare-fun b!534777 () Bool)

(declare-fun res!329988 () Bool)

(assert (=> b!534777 (=> (not res!329988) (not e!310813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534777 (= res!329988 (validKeyInArray!0 (select (arr!16281 a!3154) j!147)))))

(declare-fun b!534778 () Bool)

(declare-fun res!329989 () Bool)

(assert (=> b!534778 (=> (not res!329989) (not e!310814))))

(assert (=> b!534778 (= res!329989 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16645 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16645 a!3154)) (= (select (arr!16281 a!3154) resIndex!32) (select (arr!16281 a!3154) j!147))))))

(declare-fun b!534779 () Bool)

(declare-fun res!329981 () Bool)

(assert (=> b!534779 (=> (not res!329981) (not e!310813))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534779 (= res!329981 (and (= (size!16645 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16645 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16645 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534780 () Bool)

(declare-fun res!329983 () Bool)

(assert (=> b!534780 (=> (not res!329983) (not e!310813))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!534780 (= res!329983 (validKeyInArray!0 k!1998))))

(declare-fun b!534781 () Bool)

(assert (=> b!534781 (= e!310813 e!310814)))

(declare-fun res!329990 () Bool)

(assert (=> b!534781 (=> (not res!329990) (not e!310814))))

(declare-fun lt!245701 () SeekEntryResult!4739)

(assert (=> b!534781 (= res!329990 (or (= lt!245701 (MissingZero!4739 i!1153)) (= lt!245701 (MissingVacant!4739 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33884 (_ BitVec 32)) SeekEntryResult!4739)

(assert (=> b!534781 (= lt!245701 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534782 () Bool)

(declare-fun res!329982 () Bool)

(assert (=> b!534782 (=> (not res!329982) (not e!310814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33884 (_ BitVec 32)) Bool)

(assert (=> b!534782 (= res!329982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534783 () Bool)

(assert (=> b!534783 (= e!310814 false)))

(declare-fun lt!245700 () SeekEntryResult!4739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534783 (= lt!245700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16281 a!3154) j!147) mask!3216) (select (arr!16281 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534784 () Bool)

(declare-fun res!329986 () Bool)

(assert (=> b!534784 (=> (not res!329986) (not e!310814))))

(declare-datatypes ((List!10400 0))(
  ( (Nil!10397) (Cons!10396 (h!11339 (_ BitVec 64)) (t!16628 List!10400)) )
))
(declare-fun arrayNoDuplicates!0 (array!33884 (_ BitVec 32) List!10400) Bool)

(assert (=> b!534784 (= res!329986 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10397))))

(declare-fun b!534785 () Bool)

(declare-fun res!329984 () Bool)

(assert (=> b!534785 (=> (not res!329984) (not e!310813))))

(declare-fun arrayContainsKey!0 (array!33884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534785 (= res!329984 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48672 res!329985) b!534779))

(assert (= (and b!534779 res!329981) b!534777))

(assert (= (and b!534777 res!329988) b!534780))

(assert (= (and b!534780 res!329983) b!534785))

(assert (= (and b!534785 res!329984) b!534781))

(assert (= (and b!534781 res!329990) b!534782))

(assert (= (and b!534782 res!329982) b!534784))

(assert (= (and b!534784 res!329986) b!534778))

(assert (= (and b!534778 res!329989) b!534776))

(assert (= (and b!534776 res!329987) b!534783))

(declare-fun m!514449 () Bool)

(assert (=> b!534785 m!514449))

(declare-fun m!514451 () Bool)

(assert (=> b!534778 m!514451))

(declare-fun m!514453 () Bool)

(assert (=> b!534778 m!514453))

(assert (=> b!534776 m!514453))

(assert (=> b!534776 m!514453))

(declare-fun m!514455 () Bool)

(assert (=> b!534776 m!514455))

(declare-fun m!514457 () Bool)

(assert (=> b!534782 m!514457))

(declare-fun m!514459 () Bool)

(assert (=> start!48672 m!514459))

(declare-fun m!514461 () Bool)

(assert (=> start!48672 m!514461))

(declare-fun m!514463 () Bool)

(assert (=> b!534780 m!514463))

(assert (=> b!534783 m!514453))

(assert (=> b!534783 m!514453))

(declare-fun m!514465 () Bool)

(assert (=> b!534783 m!514465))

(assert (=> b!534783 m!514465))

(assert (=> b!534783 m!514453))

(declare-fun m!514467 () Bool)

(assert (=> b!534783 m!514467))

(declare-fun m!514469 () Bool)

(assert (=> b!534781 m!514469))

(declare-fun m!514471 () Bool)

(assert (=> b!534784 m!514471))

(assert (=> b!534777 m!514453))

(assert (=> b!534777 m!514453))

(declare-fun m!514473 () Bool)

(assert (=> b!534777 m!514473))

(push 1)

