; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49324 () Bool)

(assert start!49324)

(declare-fun b!543330 () Bool)

(declare-fun res!337883 () Bool)

(declare-fun e!314263 () Bool)

(assert (=> b!543330 (=> (not res!337883) (not e!314263))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543330 (= res!337883 (validKeyInArray!0 k!1998))))

(declare-fun b!543331 () Bool)

(declare-fun e!314265 () Bool)

(assert (=> b!543331 (= e!314265 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248145 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543331 (= lt!248145 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543332 () Bool)

(declare-fun res!337886 () Bool)

(assert (=> b!543332 (=> (not res!337886) (not e!314265))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4957 0))(
  ( (MissingZero!4957 (index!22052 (_ BitVec 32))) (Found!4957 (index!22053 (_ BitVec 32))) (Intermediate!4957 (undefined!5769 Bool) (index!22054 (_ BitVec 32)) (x!50956 (_ BitVec 32))) (Undefined!4957) (MissingVacant!4957 (index!22055 (_ BitVec 32))) )
))
(declare-fun lt!248144 () SeekEntryResult!4957)

(declare-datatypes ((array!34332 0))(
  ( (array!34333 (arr!16499 (Array (_ BitVec 32) (_ BitVec 64))) (size!16863 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34332)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34332 (_ BitVec 32)) SeekEntryResult!4957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543332 (= res!337886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16499 a!3154) j!147) mask!3216) (select (arr!16499 a!3154) j!147) a!3154 mask!3216) lt!248144))))

(declare-fun b!543333 () Bool)

(declare-fun res!337882 () Bool)

(declare-fun e!314264 () Bool)

(assert (=> b!543333 (=> (not res!337882) (not e!314264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34332 (_ BitVec 32)) Bool)

(assert (=> b!543333 (= res!337882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543334 () Bool)

(declare-fun res!337890 () Bool)

(assert (=> b!543334 (=> (not res!337890) (not e!314263))))

(assert (=> b!543334 (= res!337890 (validKeyInArray!0 (select (arr!16499 a!3154) j!147)))))

(declare-fun b!543335 () Bool)

(declare-fun res!337889 () Bool)

(assert (=> b!543335 (=> (not res!337889) (not e!314264))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543335 (= res!337889 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16863 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16863 a!3154)) (= (select (arr!16499 a!3154) resIndex!32) (select (arr!16499 a!3154) j!147))))))

(declare-fun res!337888 () Bool)

(assert (=> start!49324 (=> (not res!337888) (not e!314263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49324 (= res!337888 (validMask!0 mask!3216))))

(assert (=> start!49324 e!314263))

(assert (=> start!49324 true))

(declare-fun array_inv!12295 (array!34332) Bool)

(assert (=> start!49324 (array_inv!12295 a!3154)))

(declare-fun b!543336 () Bool)

(declare-fun res!337885 () Bool)

(assert (=> b!543336 (=> (not res!337885) (not e!314263))))

(declare-fun arrayContainsKey!0 (array!34332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543336 (= res!337885 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543337 () Bool)

(assert (=> b!543337 (= e!314264 e!314265)))

(declare-fun res!337884 () Bool)

(assert (=> b!543337 (=> (not res!337884) (not e!314265))))

(assert (=> b!543337 (= res!337884 (= lt!248144 (Intermediate!4957 false resIndex!32 resX!32)))))

(assert (=> b!543337 (= lt!248144 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16499 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543338 () Bool)

(declare-fun res!337891 () Bool)

(assert (=> b!543338 (=> (not res!337891) (not e!314265))))

(assert (=> b!543338 (= res!337891 (and (not (= (select (arr!16499 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16499 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16499 a!3154) index!1177) (select (arr!16499 a!3154) j!147)))))))

(declare-fun b!543339 () Bool)

(declare-fun res!337892 () Bool)

(assert (=> b!543339 (=> (not res!337892) (not e!314263))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543339 (= res!337892 (and (= (size!16863 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16863 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16863 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543340 () Bool)

(declare-fun res!337887 () Bool)

(assert (=> b!543340 (=> (not res!337887) (not e!314264))))

(declare-datatypes ((List!10618 0))(
  ( (Nil!10615) (Cons!10614 (h!11569 (_ BitVec 64)) (t!16846 List!10618)) )
))
(declare-fun arrayNoDuplicates!0 (array!34332 (_ BitVec 32) List!10618) Bool)

(assert (=> b!543340 (= res!337887 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10615))))

(declare-fun b!543341 () Bool)

(assert (=> b!543341 (= e!314263 e!314264)))

(declare-fun res!337881 () Bool)

(assert (=> b!543341 (=> (not res!337881) (not e!314264))))

(declare-fun lt!248146 () SeekEntryResult!4957)

(assert (=> b!543341 (= res!337881 (or (= lt!248146 (MissingZero!4957 i!1153)) (= lt!248146 (MissingVacant!4957 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34332 (_ BitVec 32)) SeekEntryResult!4957)

(assert (=> b!543341 (= lt!248146 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49324 res!337888) b!543339))

(assert (= (and b!543339 res!337892) b!543334))

(assert (= (and b!543334 res!337890) b!543330))

(assert (= (and b!543330 res!337883) b!543336))

(assert (= (and b!543336 res!337885) b!543341))

(assert (= (and b!543341 res!337881) b!543333))

(assert (= (and b!543333 res!337882) b!543340))

(assert (= (and b!543340 res!337887) b!543335))

(assert (= (and b!543335 res!337889) b!543337))

(assert (= (and b!543337 res!337884) b!543332))

(assert (= (and b!543332 res!337886) b!543338))

(assert (= (and b!543338 res!337891) b!543331))

(declare-fun m!521439 () Bool)

(assert (=> b!543336 m!521439))

(declare-fun m!521441 () Bool)

(assert (=> b!543340 m!521441))

(declare-fun m!521443 () Bool)

(assert (=> b!543333 m!521443))

(declare-fun m!521445 () Bool)

(assert (=> b!543331 m!521445))

(declare-fun m!521447 () Bool)

(assert (=> b!543330 m!521447))

(declare-fun m!521449 () Bool)

(assert (=> b!543341 m!521449))

(declare-fun m!521451 () Bool)

(assert (=> b!543332 m!521451))

(assert (=> b!543332 m!521451))

(declare-fun m!521453 () Bool)

(assert (=> b!543332 m!521453))

(assert (=> b!543332 m!521453))

(assert (=> b!543332 m!521451))

(declare-fun m!521455 () Bool)

(assert (=> b!543332 m!521455))

(declare-fun m!521457 () Bool)

(assert (=> start!49324 m!521457))

(declare-fun m!521459 () Bool)

(assert (=> start!49324 m!521459))

(assert (=> b!543334 m!521451))

(assert (=> b!543334 m!521451))

(declare-fun m!521461 () Bool)

(assert (=> b!543334 m!521461))

(declare-fun m!521463 () Bool)

(assert (=> b!543338 m!521463))

(assert (=> b!543338 m!521451))

(assert (=> b!543337 m!521451))

(assert (=> b!543337 m!521451))

(declare-fun m!521465 () Bool)

(assert (=> b!543337 m!521465))

(declare-fun m!521467 () Bool)

(assert (=> b!543335 m!521467))

(assert (=> b!543335 m!521451))

(push 1)

(assert (not b!543333))

(assert (not b!543330))

(assert (not b!543332))

(assert (not start!49324))

