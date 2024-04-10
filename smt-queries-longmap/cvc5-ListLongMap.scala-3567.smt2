; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49026 () Bool)

(assert start!49026)

(declare-fun b!540266 () Bool)

(declare-fun res!335318 () Bool)

(declare-fun e!313015 () Bool)

(assert (=> b!540266 (=> (not res!335318) (not e!313015))))

(declare-datatypes ((array!34187 0))(
  ( (array!34188 (arr!16431 (Array (_ BitVec 32) (_ BitVec 64))) (size!16795 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34187)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!540266 (= res!335318 (and (= (size!16795 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16795 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16795 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540267 () Bool)

(declare-fun e!313017 () Bool)

(assert (=> b!540267 (= e!313017 false)))

(declare-datatypes ((SeekEntryResult!4889 0))(
  ( (MissingZero!4889 (index!21780 (_ BitVec 32))) (Found!4889 (index!21781 (_ BitVec 32))) (Intermediate!4889 (undefined!5701 Bool) (index!21782 (_ BitVec 32)) (x!50694 (_ BitVec 32))) (Undefined!4889) (MissingVacant!4889 (index!21783 (_ BitVec 32))) )
))
(declare-fun lt!247344 () SeekEntryResult!4889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34187 (_ BitVec 32)) SeekEntryResult!4889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540267 (= lt!247344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16431 a!3154) j!147) mask!3216) (select (arr!16431 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540268 () Bool)

(declare-fun res!335316 () Bool)

(assert (=> b!540268 (=> (not res!335316) (not e!313017))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!540268 (= res!335316 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16431 a!3154) j!147) a!3154 mask!3216) (Intermediate!4889 false resIndex!32 resX!32)))))

(declare-fun b!540269 () Bool)

(declare-fun res!335319 () Bool)

(assert (=> b!540269 (=> (not res!335319) (not e!313017))))

(assert (=> b!540269 (= res!335319 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16795 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16795 a!3154)) (= (select (arr!16431 a!3154) resIndex!32) (select (arr!16431 a!3154) j!147))))))

(declare-fun b!540270 () Bool)

(declare-fun res!335312 () Bool)

(assert (=> b!540270 (=> (not res!335312) (not e!313017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34187 (_ BitVec 32)) Bool)

(assert (=> b!540270 (= res!335312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!335321 () Bool)

(assert (=> start!49026 (=> (not res!335321) (not e!313015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49026 (= res!335321 (validMask!0 mask!3216))))

(assert (=> start!49026 e!313015))

(assert (=> start!49026 true))

(declare-fun array_inv!12227 (array!34187) Bool)

(assert (=> start!49026 (array_inv!12227 a!3154)))

(declare-fun b!540271 () Bool)

(declare-fun res!335320 () Bool)

(assert (=> b!540271 (=> (not res!335320) (not e!313015))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540271 (= res!335320 (validKeyInArray!0 k!1998))))

(declare-fun b!540272 () Bool)

(declare-fun res!335317 () Bool)

(assert (=> b!540272 (=> (not res!335317) (not e!313015))))

(assert (=> b!540272 (= res!335317 (validKeyInArray!0 (select (arr!16431 a!3154) j!147)))))

(declare-fun b!540273 () Bool)

(declare-fun res!335314 () Bool)

(assert (=> b!540273 (=> (not res!335314) (not e!313017))))

(declare-datatypes ((List!10550 0))(
  ( (Nil!10547) (Cons!10546 (h!11492 (_ BitVec 64)) (t!16778 List!10550)) )
))
(declare-fun arrayNoDuplicates!0 (array!34187 (_ BitVec 32) List!10550) Bool)

(assert (=> b!540273 (= res!335314 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10547))))

(declare-fun b!540274 () Bool)

(assert (=> b!540274 (= e!313015 e!313017)))

(declare-fun res!335313 () Bool)

(assert (=> b!540274 (=> (not res!335313) (not e!313017))))

(declare-fun lt!247345 () SeekEntryResult!4889)

(assert (=> b!540274 (= res!335313 (or (= lt!247345 (MissingZero!4889 i!1153)) (= lt!247345 (MissingVacant!4889 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34187 (_ BitVec 32)) SeekEntryResult!4889)

(assert (=> b!540274 (= lt!247345 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540275 () Bool)

(declare-fun res!335315 () Bool)

(assert (=> b!540275 (=> (not res!335315) (not e!313015))))

(declare-fun arrayContainsKey!0 (array!34187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540275 (= res!335315 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49026 res!335321) b!540266))

(assert (= (and b!540266 res!335318) b!540272))

(assert (= (and b!540272 res!335317) b!540271))

(assert (= (and b!540271 res!335320) b!540275))

(assert (= (and b!540275 res!335315) b!540274))

(assert (= (and b!540274 res!335313) b!540270))

(assert (= (and b!540270 res!335312) b!540273))

(assert (= (and b!540273 res!335314) b!540269))

(assert (= (and b!540269 res!335319) b!540268))

(assert (= (and b!540268 res!335316) b!540267))

(declare-fun m!519087 () Bool)

(assert (=> b!540272 m!519087))

(assert (=> b!540272 m!519087))

(declare-fun m!519089 () Bool)

(assert (=> b!540272 m!519089))

(declare-fun m!519091 () Bool)

(assert (=> b!540269 m!519091))

(assert (=> b!540269 m!519087))

(assert (=> b!540268 m!519087))

(assert (=> b!540268 m!519087))

(declare-fun m!519093 () Bool)

(assert (=> b!540268 m!519093))

(assert (=> b!540267 m!519087))

(assert (=> b!540267 m!519087))

(declare-fun m!519095 () Bool)

(assert (=> b!540267 m!519095))

(assert (=> b!540267 m!519095))

(assert (=> b!540267 m!519087))

(declare-fun m!519097 () Bool)

(assert (=> b!540267 m!519097))

(declare-fun m!519099 () Bool)

(assert (=> b!540271 m!519099))

(declare-fun m!519101 () Bool)

(assert (=> b!540270 m!519101))

(declare-fun m!519103 () Bool)

(assert (=> b!540275 m!519103))

(declare-fun m!519105 () Bool)

(assert (=> start!49026 m!519105))

(declare-fun m!519107 () Bool)

(assert (=> start!49026 m!519107))

(declare-fun m!519109 () Bool)

(assert (=> b!540274 m!519109))

(declare-fun m!519111 () Bool)

(assert (=> b!540273 m!519111))

(push 1)

