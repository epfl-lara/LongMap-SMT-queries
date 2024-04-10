; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48630 () Bool)

(assert start!48630)

(declare-fun b!534146 () Bool)

(declare-fun e!310626 () Bool)

(assert (=> b!534146 (= e!310626 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33842 0))(
  ( (array!33843 (arr!16260 (Array (_ BitVec 32) (_ BitVec 64))) (size!16624 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33842)

(declare-datatypes ((SeekEntryResult!4718 0))(
  ( (MissingZero!4718 (index!21096 (_ BitVec 32))) (Found!4718 (index!21097 (_ BitVec 32))) (Intermediate!4718 (undefined!5530 Bool) (index!21098 (_ BitVec 32)) (x!50061 (_ BitVec 32))) (Undefined!4718) (MissingVacant!4718 (index!21099 (_ BitVec 32))) )
))
(declare-fun lt!245575 () SeekEntryResult!4718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33842 (_ BitVec 32)) SeekEntryResult!4718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534146 (= lt!245575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16260 a!3154) j!147) mask!3216) (select (arr!16260 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534147 () Bool)

(declare-fun e!310624 () Bool)

(assert (=> b!534147 (= e!310624 e!310626)))

(declare-fun res!329354 () Bool)

(assert (=> b!534147 (=> (not res!329354) (not e!310626))))

(declare-fun lt!245574 () SeekEntryResult!4718)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534147 (= res!329354 (or (= lt!245574 (MissingZero!4718 i!1153)) (= lt!245574 (MissingVacant!4718 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33842 (_ BitVec 32)) SeekEntryResult!4718)

(assert (=> b!534147 (= lt!245574 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534149 () Bool)

(declare-fun res!329353 () Bool)

(assert (=> b!534149 (=> (not res!329353) (not e!310624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534149 (= res!329353 (validKeyInArray!0 k!1998))))

(declare-fun b!534150 () Bool)

(declare-fun res!329352 () Bool)

(assert (=> b!534150 (=> (not res!329352) (not e!310626))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534150 (= res!329352 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16624 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16624 a!3154)) (= (select (arr!16260 a!3154) resIndex!32) (select (arr!16260 a!3154) j!147))))))

(declare-fun b!534151 () Bool)

(declare-fun res!329357 () Bool)

(assert (=> b!534151 (=> (not res!329357) (not e!310626))))

(declare-datatypes ((List!10379 0))(
  ( (Nil!10376) (Cons!10375 (h!11318 (_ BitVec 64)) (t!16607 List!10379)) )
))
(declare-fun arrayNoDuplicates!0 (array!33842 (_ BitVec 32) List!10379) Bool)

(assert (=> b!534151 (= res!329357 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10376))))

(declare-fun b!534152 () Bool)

(declare-fun res!329359 () Bool)

(assert (=> b!534152 (=> (not res!329359) (not e!310624))))

(declare-fun arrayContainsKey!0 (array!33842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534152 (= res!329359 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534153 () Bool)

(declare-fun res!329351 () Bool)

(assert (=> b!534153 (=> (not res!329351) (not e!310626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33842 (_ BitVec 32)) Bool)

(assert (=> b!534153 (= res!329351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534154 () Bool)

(declare-fun res!329355 () Bool)

(assert (=> b!534154 (=> (not res!329355) (not e!310624))))

(assert (=> b!534154 (= res!329355 (and (= (size!16624 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16624 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16624 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534155 () Bool)

(declare-fun res!329358 () Bool)

(assert (=> b!534155 (=> (not res!329358) (not e!310624))))

(assert (=> b!534155 (= res!329358 (validKeyInArray!0 (select (arr!16260 a!3154) j!147)))))

(declare-fun b!534148 () Bool)

(declare-fun res!329356 () Bool)

(assert (=> b!534148 (=> (not res!329356) (not e!310626))))

(assert (=> b!534148 (= res!329356 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16260 a!3154) j!147) a!3154 mask!3216) (Intermediate!4718 false resIndex!32 resX!32)))))

(declare-fun res!329360 () Bool)

(assert (=> start!48630 (=> (not res!329360) (not e!310624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48630 (= res!329360 (validMask!0 mask!3216))))

(assert (=> start!48630 e!310624))

(assert (=> start!48630 true))

(declare-fun array_inv!12056 (array!33842) Bool)

(assert (=> start!48630 (array_inv!12056 a!3154)))

(assert (= (and start!48630 res!329360) b!534154))

(assert (= (and b!534154 res!329355) b!534155))

(assert (= (and b!534155 res!329358) b!534149))

(assert (= (and b!534149 res!329353) b!534152))

(assert (= (and b!534152 res!329359) b!534147))

(assert (= (and b!534147 res!329354) b!534153))

(assert (= (and b!534153 res!329351) b!534151))

(assert (= (and b!534151 res!329357) b!534150))

(assert (= (and b!534150 res!329352) b!534148))

(assert (= (and b!534148 res!329356) b!534146))

(declare-fun m!513903 () Bool)

(assert (=> b!534147 m!513903))

(declare-fun m!513905 () Bool)

(assert (=> b!534150 m!513905))

(declare-fun m!513907 () Bool)

(assert (=> b!534150 m!513907))

(assert (=> b!534146 m!513907))

(assert (=> b!534146 m!513907))

(declare-fun m!513909 () Bool)

(assert (=> b!534146 m!513909))

(assert (=> b!534146 m!513909))

(assert (=> b!534146 m!513907))

(declare-fun m!513911 () Bool)

(assert (=> b!534146 m!513911))

(declare-fun m!513913 () Bool)

(assert (=> b!534151 m!513913))

(assert (=> b!534155 m!513907))

(assert (=> b!534155 m!513907))

(declare-fun m!513915 () Bool)

(assert (=> b!534155 m!513915))

(declare-fun m!513917 () Bool)

(assert (=> b!534153 m!513917))

(assert (=> b!534148 m!513907))

(assert (=> b!534148 m!513907))

(declare-fun m!513919 () Bool)

(assert (=> b!534148 m!513919))

(declare-fun m!513921 () Bool)

(assert (=> b!534152 m!513921))

(declare-fun m!513923 () Bool)

(assert (=> start!48630 m!513923))

(declare-fun m!513925 () Bool)

(assert (=> start!48630 m!513925))

(declare-fun m!513927 () Bool)

(assert (=> b!534149 m!513927))

(push 1)

