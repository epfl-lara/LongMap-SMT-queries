; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48622 () Bool)

(assert start!48622)

(declare-fun b!534085 () Bool)

(declare-fun res!329353 () Bool)

(declare-fun e!310587 () Bool)

(assert (=> b!534085 (=> (not res!329353) (not e!310587))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33833 0))(
  ( (array!33834 (arr!16255 (Array (_ BitVec 32) (_ BitVec 64))) (size!16619 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33833)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534085 (= res!329353 (and (= (size!16619 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16619 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16619 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534086 () Bool)

(declare-fun e!310585 () Bool)

(assert (=> b!534086 (= e!310585 false)))

(declare-datatypes ((SeekEntryResult!4669 0))(
  ( (MissingZero!4669 (index!20900 (_ BitVec 32))) (Found!4669 (index!20901 (_ BitVec 32))) (Intermediate!4669 (undefined!5481 Bool) (index!20902 (_ BitVec 32)) (x!50009 (_ BitVec 32))) (Undefined!4669) (MissingVacant!4669 (index!20903 (_ BitVec 32))) )
))
(declare-fun lt!245587 () SeekEntryResult!4669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33833 (_ BitVec 32)) SeekEntryResult!4669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534086 (= lt!245587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16255 a!3154) j!147) mask!3216) (select (arr!16255 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534087 () Bool)

(declare-fun res!329349 () Bool)

(assert (=> b!534087 (=> (not res!329349) (not e!310585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33833 (_ BitVec 32)) Bool)

(assert (=> b!534087 (= res!329349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534088 () Bool)

(declare-fun res!329345 () Bool)

(assert (=> b!534088 (=> (not res!329345) (not e!310585))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534088 (= res!329345 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16255 a!3154) j!147) a!3154 mask!3216) (Intermediate!4669 false resIndex!32 resX!32)))))

(declare-fun b!534089 () Bool)

(declare-fun res!329347 () Bool)

(assert (=> b!534089 (=> (not res!329347) (not e!310587))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534089 (= res!329347 (validKeyInArray!0 k0!1998))))

(declare-fun b!534090 () Bool)

(declare-fun res!329352 () Bool)

(assert (=> b!534090 (=> (not res!329352) (not e!310587))))

(declare-fun arrayContainsKey!0 (array!33833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534090 (= res!329352 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!329346 () Bool)

(assert (=> start!48622 (=> (not res!329346) (not e!310587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48622 (= res!329346 (validMask!0 mask!3216))))

(assert (=> start!48622 e!310587))

(assert (=> start!48622 true))

(declare-fun array_inv!12114 (array!33833) Bool)

(assert (=> start!48622 (array_inv!12114 a!3154)))

(declare-fun b!534091 () Bool)

(declare-fun res!329348 () Bool)

(assert (=> b!534091 (=> (not res!329348) (not e!310585))))

(assert (=> b!534091 (= res!329348 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16619 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16619 a!3154)) (= (select (arr!16255 a!3154) resIndex!32) (select (arr!16255 a!3154) j!147))))))

(declare-fun b!534092 () Bool)

(assert (=> b!534092 (= e!310587 e!310585)))

(declare-fun res!329350 () Bool)

(assert (=> b!534092 (=> (not res!329350) (not e!310585))))

(declare-fun lt!245586 () SeekEntryResult!4669)

(assert (=> b!534092 (= res!329350 (or (= lt!245586 (MissingZero!4669 i!1153)) (= lt!245586 (MissingVacant!4669 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33833 (_ BitVec 32)) SeekEntryResult!4669)

(assert (=> b!534092 (= lt!245586 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534093 () Bool)

(declare-fun res!329344 () Bool)

(assert (=> b!534093 (=> (not res!329344) (not e!310587))))

(assert (=> b!534093 (= res!329344 (validKeyInArray!0 (select (arr!16255 a!3154) j!147)))))

(declare-fun b!534094 () Bool)

(declare-fun res!329351 () Bool)

(assert (=> b!534094 (=> (not res!329351) (not e!310585))))

(declare-datatypes ((List!10281 0))(
  ( (Nil!10278) (Cons!10277 (h!11220 (_ BitVec 64)) (t!16501 List!10281)) )
))
(declare-fun arrayNoDuplicates!0 (array!33833 (_ BitVec 32) List!10281) Bool)

(assert (=> b!534094 (= res!329351 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10278))))

(assert (= (and start!48622 res!329346) b!534085))

(assert (= (and b!534085 res!329353) b!534093))

(assert (= (and b!534093 res!329344) b!534089))

(assert (= (and b!534089 res!329347) b!534090))

(assert (= (and b!534090 res!329352) b!534092))

(assert (= (and b!534092 res!329350) b!534087))

(assert (= (and b!534087 res!329349) b!534094))

(assert (= (and b!534094 res!329351) b!534091))

(assert (= (and b!534091 res!329348) b!534088))

(assert (= (and b!534088 res!329345) b!534086))

(declare-fun m!514087 () Bool)

(assert (=> b!534087 m!514087))

(declare-fun m!514089 () Bool)

(assert (=> b!534093 m!514089))

(assert (=> b!534093 m!514089))

(declare-fun m!514091 () Bool)

(assert (=> b!534093 m!514091))

(declare-fun m!514093 () Bool)

(assert (=> start!48622 m!514093))

(declare-fun m!514095 () Bool)

(assert (=> start!48622 m!514095))

(declare-fun m!514097 () Bool)

(assert (=> b!534094 m!514097))

(declare-fun m!514099 () Bool)

(assert (=> b!534089 m!514099))

(declare-fun m!514101 () Bool)

(assert (=> b!534092 m!514101))

(declare-fun m!514103 () Bool)

(assert (=> b!534090 m!514103))

(assert (=> b!534086 m!514089))

(assert (=> b!534086 m!514089))

(declare-fun m!514105 () Bool)

(assert (=> b!534086 m!514105))

(assert (=> b!534086 m!514105))

(assert (=> b!534086 m!514089))

(declare-fun m!514107 () Bool)

(assert (=> b!534086 m!514107))

(assert (=> b!534088 m!514089))

(assert (=> b!534088 m!514089))

(declare-fun m!514109 () Bool)

(assert (=> b!534088 m!514109))

(declare-fun m!514111 () Bool)

(assert (=> b!534091 m!514111))

(assert (=> b!534091 m!514089))

(check-sat (not b!534087) (not b!534094) (not b!534092) (not b!534088) (not b!534090) (not start!48622) (not b!534089) (not b!534086) (not b!534093))
(check-sat)
