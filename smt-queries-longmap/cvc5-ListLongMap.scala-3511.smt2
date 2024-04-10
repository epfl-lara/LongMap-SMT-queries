; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48636 () Bool)

(assert start!48636)

(declare-fun b!534236 () Bool)

(declare-fun res!329448 () Bool)

(declare-fun e!310651 () Bool)

(assert (=> b!534236 (=> (not res!329448) (not e!310651))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33848 0))(
  ( (array!33849 (arr!16263 (Array (_ BitVec 32) (_ BitVec 64))) (size!16627 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33848)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534236 (= res!329448 (and (= (size!16627 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16627 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16627 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534237 () Bool)

(declare-fun e!310653 () Bool)

(assert (=> b!534237 (= e!310651 e!310653)))

(declare-fun res!329446 () Bool)

(assert (=> b!534237 (=> (not res!329446) (not e!310653))))

(declare-datatypes ((SeekEntryResult!4721 0))(
  ( (MissingZero!4721 (index!21108 (_ BitVec 32))) (Found!4721 (index!21109 (_ BitVec 32))) (Intermediate!4721 (undefined!5533 Bool) (index!21110 (_ BitVec 32)) (x!50072 (_ BitVec 32))) (Undefined!4721) (MissingVacant!4721 (index!21111 (_ BitVec 32))) )
))
(declare-fun lt!245593 () SeekEntryResult!4721)

(assert (=> b!534237 (= res!329446 (or (= lt!245593 (MissingZero!4721 i!1153)) (= lt!245593 (MissingVacant!4721 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33848 (_ BitVec 32)) SeekEntryResult!4721)

(assert (=> b!534237 (= lt!245593 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534238 () Bool)

(assert (=> b!534238 (= e!310653 false)))

(declare-fun lt!245592 () SeekEntryResult!4721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33848 (_ BitVec 32)) SeekEntryResult!4721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534238 (= lt!245592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16263 a!3154) j!147) mask!3216) (select (arr!16263 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534239 () Bool)

(declare-fun res!329442 () Bool)

(assert (=> b!534239 (=> (not res!329442) (not e!310651))))

(declare-fun arrayContainsKey!0 (array!33848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534239 (= res!329442 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534240 () Bool)

(declare-fun res!329450 () Bool)

(assert (=> b!534240 (=> (not res!329450) (not e!310653))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!534240 (= res!329450 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16263 a!3154) j!147) a!3154 mask!3216) (Intermediate!4721 false resIndex!32 resX!32)))))

(declare-fun b!534241 () Bool)

(declare-fun res!329444 () Bool)

(assert (=> b!534241 (=> (not res!329444) (not e!310653))))

(declare-datatypes ((List!10382 0))(
  ( (Nil!10379) (Cons!10378 (h!11321 (_ BitVec 64)) (t!16610 List!10382)) )
))
(declare-fun arrayNoDuplicates!0 (array!33848 (_ BitVec 32) List!10382) Bool)

(assert (=> b!534241 (= res!329444 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10379))))

(declare-fun res!329441 () Bool)

(assert (=> start!48636 (=> (not res!329441) (not e!310651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48636 (= res!329441 (validMask!0 mask!3216))))

(assert (=> start!48636 e!310651))

(assert (=> start!48636 true))

(declare-fun array_inv!12059 (array!33848) Bool)

(assert (=> start!48636 (array_inv!12059 a!3154)))

(declare-fun b!534242 () Bool)

(declare-fun res!329443 () Bool)

(assert (=> b!534242 (=> (not res!329443) (not e!310651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534242 (= res!329443 (validKeyInArray!0 (select (arr!16263 a!3154) j!147)))))

(declare-fun b!534243 () Bool)

(declare-fun res!329449 () Bool)

(assert (=> b!534243 (=> (not res!329449) (not e!310651))))

(assert (=> b!534243 (= res!329449 (validKeyInArray!0 k!1998))))

(declare-fun b!534244 () Bool)

(declare-fun res!329445 () Bool)

(assert (=> b!534244 (=> (not res!329445) (not e!310653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33848 (_ BitVec 32)) Bool)

(assert (=> b!534244 (= res!329445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534245 () Bool)

(declare-fun res!329447 () Bool)

(assert (=> b!534245 (=> (not res!329447) (not e!310653))))

(assert (=> b!534245 (= res!329447 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16627 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16627 a!3154)) (= (select (arr!16263 a!3154) resIndex!32) (select (arr!16263 a!3154) j!147))))))

(assert (= (and start!48636 res!329441) b!534236))

(assert (= (and b!534236 res!329448) b!534242))

(assert (= (and b!534242 res!329443) b!534243))

(assert (= (and b!534243 res!329449) b!534239))

(assert (= (and b!534239 res!329442) b!534237))

(assert (= (and b!534237 res!329446) b!534244))

(assert (= (and b!534244 res!329445) b!534241))

(assert (= (and b!534241 res!329444) b!534245))

(assert (= (and b!534245 res!329447) b!534240))

(assert (= (and b!534240 res!329450) b!534238))

(declare-fun m!513981 () Bool)

(assert (=> b!534241 m!513981))

(declare-fun m!513983 () Bool)

(assert (=> b!534238 m!513983))

(assert (=> b!534238 m!513983))

(declare-fun m!513985 () Bool)

(assert (=> b!534238 m!513985))

(assert (=> b!534238 m!513985))

(assert (=> b!534238 m!513983))

(declare-fun m!513987 () Bool)

(assert (=> b!534238 m!513987))

(declare-fun m!513989 () Bool)

(assert (=> start!48636 m!513989))

(declare-fun m!513991 () Bool)

(assert (=> start!48636 m!513991))

(declare-fun m!513993 () Bool)

(assert (=> b!534243 m!513993))

(declare-fun m!513995 () Bool)

(assert (=> b!534244 m!513995))

(assert (=> b!534240 m!513983))

(assert (=> b!534240 m!513983))

(declare-fun m!513997 () Bool)

(assert (=> b!534240 m!513997))

(assert (=> b!534242 m!513983))

(assert (=> b!534242 m!513983))

(declare-fun m!513999 () Bool)

(assert (=> b!534242 m!513999))

(declare-fun m!514001 () Bool)

(assert (=> b!534239 m!514001))

(declare-fun m!514003 () Bool)

(assert (=> b!534245 m!514003))

(assert (=> b!534245 m!513983))

(declare-fun m!514005 () Bool)

(assert (=> b!534237 m!514005))

(push 1)

