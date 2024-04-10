; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48570 () Bool)

(assert start!48570)

(declare-fun b!533264 () Bool)

(declare-fun res!328474 () Bool)

(declare-fun e!310356 () Bool)

(assert (=> b!533264 (=> (not res!328474) (not e!310356))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33782 0))(
  ( (array!33783 (arr!16230 (Array (_ BitVec 32) (_ BitVec 64))) (size!16594 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33782)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4688 0))(
  ( (MissingZero!4688 (index!20976 (_ BitVec 32))) (Found!4688 (index!20977 (_ BitVec 32))) (Intermediate!4688 (undefined!5500 Bool) (index!20978 (_ BitVec 32)) (x!49951 (_ BitVec 32))) (Undefined!4688) (MissingVacant!4688 (index!20979 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33782 (_ BitVec 32)) SeekEntryResult!4688)

(assert (=> b!533264 (= res!328474 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16230 a!3154) j!147) a!3154 mask!3216) (Intermediate!4688 false resIndex!32 resX!32)))))

(declare-fun b!533265 () Bool)

(declare-fun res!328477 () Bool)

(assert (=> b!533265 (=> (not res!328477) (not e!310356))))

(assert (=> b!533265 (= res!328477 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16594 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16594 a!3154)) (= (select (arr!16230 a!3154) resIndex!32) (select (arr!16230 a!3154) j!147))))))

(declare-fun res!328476 () Bool)

(declare-fun e!310355 () Bool)

(assert (=> start!48570 (=> (not res!328476) (not e!310355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48570 (= res!328476 (validMask!0 mask!3216))))

(assert (=> start!48570 e!310355))

(assert (=> start!48570 true))

(declare-fun array_inv!12026 (array!33782) Bool)

(assert (=> start!48570 (array_inv!12026 a!3154)))

(declare-fun b!533266 () Bool)

(declare-fun res!328475 () Bool)

(assert (=> b!533266 (=> (not res!328475) (not e!310355))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533266 (= res!328475 (and (= (size!16594 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16594 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16594 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533267 () Bool)

(assert (=> b!533267 (= e!310356 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!533268 () Bool)

(declare-fun res!328472 () Bool)

(assert (=> b!533268 (=> (not res!328472) (not e!310356))))

(declare-datatypes ((List!10349 0))(
  ( (Nil!10346) (Cons!10345 (h!11288 (_ BitVec 64)) (t!16577 List!10349)) )
))
(declare-fun arrayNoDuplicates!0 (array!33782 (_ BitVec 32) List!10349) Bool)

(assert (=> b!533268 (= res!328472 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10346))))

(declare-fun b!533269 () Bool)

(declare-fun res!328478 () Bool)

(assert (=> b!533269 (=> (not res!328478) (not e!310355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533269 (= res!328478 (validKeyInArray!0 (select (arr!16230 a!3154) j!147)))))

(declare-fun b!533270 () Bool)

(declare-fun res!328469 () Bool)

(assert (=> b!533270 (=> (not res!328469) (not e!310355))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!533270 (= res!328469 (validKeyInArray!0 k!1998))))

(declare-fun b!533271 () Bool)

(assert (=> b!533271 (= e!310355 e!310356)))

(declare-fun res!328471 () Bool)

(assert (=> b!533271 (=> (not res!328471) (not e!310356))))

(declare-fun lt!245419 () SeekEntryResult!4688)

(assert (=> b!533271 (= res!328471 (or (= lt!245419 (MissingZero!4688 i!1153)) (= lt!245419 (MissingVacant!4688 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33782 (_ BitVec 32)) SeekEntryResult!4688)

(assert (=> b!533271 (= lt!245419 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533272 () Bool)

(declare-fun res!328473 () Bool)

(assert (=> b!533272 (=> (not res!328473) (not e!310355))))

(declare-fun arrayContainsKey!0 (array!33782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533272 (= res!328473 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533273 () Bool)

(declare-fun res!328470 () Bool)

(assert (=> b!533273 (=> (not res!328470) (not e!310356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33782 (_ BitVec 32)) Bool)

(assert (=> b!533273 (= res!328470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48570 res!328476) b!533266))

(assert (= (and b!533266 res!328475) b!533269))

(assert (= (and b!533269 res!328478) b!533270))

(assert (= (and b!533270 res!328469) b!533272))

(assert (= (and b!533272 res!328473) b!533271))

(assert (= (and b!533271 res!328471) b!533273))

(assert (= (and b!533273 res!328470) b!533268))

(assert (= (and b!533268 res!328472) b!533265))

(assert (= (and b!533265 res!328477) b!533264))

(assert (= (and b!533264 res!328474) b!533267))

(declare-fun m!513183 () Bool)

(assert (=> b!533271 m!513183))

(declare-fun m!513185 () Bool)

(assert (=> b!533268 m!513185))

(declare-fun m!513187 () Bool)

(assert (=> b!533272 m!513187))

(declare-fun m!513189 () Bool)

(assert (=> b!533265 m!513189))

(declare-fun m!513191 () Bool)

(assert (=> b!533265 m!513191))

(declare-fun m!513193 () Bool)

(assert (=> b!533273 m!513193))

(declare-fun m!513195 () Bool)

(assert (=> start!48570 m!513195))

(declare-fun m!513197 () Bool)

(assert (=> start!48570 m!513197))

(assert (=> b!533264 m!513191))

(assert (=> b!533264 m!513191))

(declare-fun m!513199 () Bool)

(assert (=> b!533264 m!513199))

(declare-fun m!513201 () Bool)

(assert (=> b!533270 m!513201))

(assert (=> b!533269 m!513191))

(assert (=> b!533269 m!513191))

(declare-fun m!513203 () Bool)

(assert (=> b!533269 m!513203))

(push 1)

