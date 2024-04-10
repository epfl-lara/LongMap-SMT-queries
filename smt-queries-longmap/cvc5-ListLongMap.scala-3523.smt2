; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48708 () Bool)

(assert start!48708)

(declare-fun b!535361 () Bool)

(declare-fun res!330569 () Bool)

(declare-fun e!311013 () Bool)

(assert (=> b!535361 (=> (not res!330569) (not e!311013))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((array!33920 0))(
  ( (array!33921 (arr!16299 (Array (_ BitVec 32) (_ BitVec 64))) (size!16663 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33920)

(assert (=> b!535361 (= res!330569 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16663 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16663 a!3154)) (= (select (arr!16299 a!3154) resIndex!32) (select (arr!16299 a!3154) j!147))))))

(declare-fun b!535362 () Bool)

(declare-fun res!330570 () Bool)

(declare-fun e!311011 () Bool)

(assert (=> b!535362 (=> (not res!330570) (not e!311011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535362 (= res!330570 (validKeyInArray!0 (select (arr!16299 a!3154) j!147)))))

(declare-fun b!535363 () Bool)

(declare-fun res!330573 () Bool)

(assert (=> b!535363 (=> (not res!330573) (not e!311013))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4757 0))(
  ( (MissingZero!4757 (index!21252 (_ BitVec 32))) (Found!4757 (index!21253 (_ BitVec 32))) (Intermediate!4757 (undefined!5569 Bool) (index!21254 (_ BitVec 32)) (x!50204 (_ BitVec 32))) (Undefined!4757) (MissingVacant!4757 (index!21255 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33920 (_ BitVec 32)) SeekEntryResult!4757)

(assert (=> b!535363 (= res!330573 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16299 a!3154) j!147) a!3154 mask!3216) (Intermediate!4757 false resIndex!32 resX!32)))))

(declare-fun b!535364 () Bool)

(declare-fun res!330572 () Bool)

(assert (=> b!535364 (=> (not res!330572) (not e!311011))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535364 (= res!330572 (and (= (size!16663 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16663 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16663 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535365 () Bool)

(declare-fun res!330566 () Bool)

(assert (=> b!535365 (=> (not res!330566) (not e!311011))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535365 (= res!330566 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535366 () Bool)

(assert (=> b!535366 (= e!311013 false)))

(declare-fun lt!245808 () SeekEntryResult!4757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535366 (= lt!245808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16299 a!3154) j!147) mask!3216) (select (arr!16299 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535367 () Bool)

(declare-fun res!330567 () Bool)

(assert (=> b!535367 (=> (not res!330567) (not e!311011))))

(assert (=> b!535367 (= res!330567 (validKeyInArray!0 k!1998))))

(declare-fun b!535368 () Bool)

(declare-fun res!330575 () Bool)

(assert (=> b!535368 (=> (not res!330575) (not e!311013))))

(declare-datatypes ((List!10418 0))(
  ( (Nil!10415) (Cons!10414 (h!11357 (_ BitVec 64)) (t!16646 List!10418)) )
))
(declare-fun arrayNoDuplicates!0 (array!33920 (_ BitVec 32) List!10418) Bool)

(assert (=> b!535368 (= res!330575 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10415))))

(declare-fun res!330571 () Bool)

(assert (=> start!48708 (=> (not res!330571) (not e!311011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48708 (= res!330571 (validMask!0 mask!3216))))

(assert (=> start!48708 e!311011))

(assert (=> start!48708 true))

(declare-fun array_inv!12095 (array!33920) Bool)

(assert (=> start!48708 (array_inv!12095 a!3154)))

(declare-fun b!535369 () Bool)

(assert (=> b!535369 (= e!311011 e!311013)))

(declare-fun res!330574 () Bool)

(assert (=> b!535369 (=> (not res!330574) (not e!311013))))

(declare-fun lt!245809 () SeekEntryResult!4757)

(assert (=> b!535369 (= res!330574 (or (= lt!245809 (MissingZero!4757 i!1153)) (= lt!245809 (MissingVacant!4757 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33920 (_ BitVec 32)) SeekEntryResult!4757)

(assert (=> b!535369 (= lt!245809 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535370 () Bool)

(declare-fun res!330568 () Bool)

(assert (=> b!535370 (=> (not res!330568) (not e!311013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33920 (_ BitVec 32)) Bool)

(assert (=> b!535370 (= res!330568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48708 res!330571) b!535364))

(assert (= (and b!535364 res!330572) b!535362))

(assert (= (and b!535362 res!330570) b!535367))

(assert (= (and b!535367 res!330567) b!535365))

(assert (= (and b!535365 res!330566) b!535369))

(assert (= (and b!535369 res!330574) b!535370))

(assert (= (and b!535370 res!330568) b!535368))

(assert (= (and b!535368 res!330575) b!535361))

(assert (= (and b!535361 res!330569) b!535363))

(assert (= (and b!535363 res!330573) b!535366))

(declare-fun m!514959 () Bool)

(assert (=> b!535369 m!514959))

(declare-fun m!514961 () Bool)

(assert (=> b!535370 m!514961))

(declare-fun m!514963 () Bool)

(assert (=> b!535367 m!514963))

(declare-fun m!514965 () Bool)

(assert (=> b!535366 m!514965))

(assert (=> b!535366 m!514965))

(declare-fun m!514967 () Bool)

(assert (=> b!535366 m!514967))

(assert (=> b!535366 m!514967))

(assert (=> b!535366 m!514965))

(declare-fun m!514969 () Bool)

(assert (=> b!535366 m!514969))

(assert (=> b!535362 m!514965))

(assert (=> b!535362 m!514965))

(declare-fun m!514971 () Bool)

(assert (=> b!535362 m!514971))

(declare-fun m!514973 () Bool)

(assert (=> b!535368 m!514973))

(declare-fun m!514975 () Bool)

(assert (=> start!48708 m!514975))

(declare-fun m!514977 () Bool)

(assert (=> start!48708 m!514977))

(assert (=> b!535363 m!514965))

(assert (=> b!535363 m!514965))

(declare-fun m!514979 () Bool)

(assert (=> b!535363 m!514979))

(declare-fun m!514981 () Bool)

(assert (=> b!535361 m!514981))

(assert (=> b!535361 m!514965))

(declare-fun m!514983 () Bool)

(assert (=> b!535365 m!514983))

(push 1)

