; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48930 () Bool)

(assert start!48930)

(declare-fun b!539359 () Bool)

(declare-fun res!334570 () Bool)

(declare-fun e!312645 () Bool)

(assert (=> b!539359 (=> (not res!334570) (not e!312645))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539359 (= res!334570 (validKeyInArray!0 k!1998))))

(declare-fun b!539360 () Bool)

(declare-fun res!334573 () Bool)

(assert (=> b!539360 (=> (not res!334573) (not e!312645))))

(declare-datatypes ((array!34142 0))(
  ( (array!34143 (arr!16410 (Array (_ BitVec 32) (_ BitVec 64))) (size!16774 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34142)

(declare-fun arrayContainsKey!0 (array!34142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539360 (= res!334573 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539361 () Bool)

(declare-fun res!334574 () Bool)

(declare-fun e!312642 () Bool)

(assert (=> b!539361 (=> (not res!334574) (not e!312642))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4868 0))(
  ( (MissingZero!4868 (index!21696 (_ BitVec 32))) (Found!4868 (index!21697 (_ BitVec 32))) (Intermediate!4868 (undefined!5680 Bool) (index!21698 (_ BitVec 32)) (x!50611 (_ BitVec 32))) (Undefined!4868) (MissingVacant!4868 (index!21699 (_ BitVec 32))) )
))
(declare-fun lt!247123 () SeekEntryResult!4868)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34142 (_ BitVec 32)) SeekEntryResult!4868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539361 (= res!334574 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16410 a!3154) j!147) mask!3216) (select (arr!16410 a!3154) j!147) a!3154 mask!3216) lt!247123))))

(declare-fun res!334565 () Bool)

(assert (=> start!48930 (=> (not res!334565) (not e!312645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48930 (= res!334565 (validMask!0 mask!3216))))

(assert (=> start!48930 e!312645))

(assert (=> start!48930 true))

(declare-fun array_inv!12206 (array!34142) Bool)

(assert (=> start!48930 (array_inv!12206 a!3154)))

(declare-fun b!539362 () Bool)

(declare-fun res!334572 () Bool)

(assert (=> b!539362 (=> (not res!334572) (not e!312645))))

(assert (=> b!539362 (= res!334572 (validKeyInArray!0 (select (arr!16410 a!3154) j!147)))))

(declare-fun b!539363 () Bool)

(declare-fun e!312644 () Bool)

(assert (=> b!539363 (= e!312644 e!312642)))

(declare-fun res!334566 () Bool)

(assert (=> b!539363 (=> (not res!334566) (not e!312642))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539363 (= res!334566 (= lt!247123 (Intermediate!4868 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!539363 (= lt!247123 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16410 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539364 () Bool)

(declare-fun res!334571 () Bool)

(assert (=> b!539364 (=> (not res!334571) (not e!312644))))

(assert (=> b!539364 (= res!334571 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16774 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16774 a!3154)) (= (select (arr!16410 a!3154) resIndex!32) (select (arr!16410 a!3154) j!147))))))

(declare-fun b!539365 () Bool)

(declare-fun res!334567 () Bool)

(assert (=> b!539365 (=> (not res!334567) (not e!312644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34142 (_ BitVec 32)) Bool)

(assert (=> b!539365 (= res!334567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539366 () Bool)

(assert (=> b!539366 (= e!312645 e!312644)))

(declare-fun res!334564 () Bool)

(assert (=> b!539366 (=> (not res!334564) (not e!312644))))

(declare-fun lt!247122 () SeekEntryResult!4868)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539366 (= res!334564 (or (= lt!247122 (MissingZero!4868 i!1153)) (= lt!247122 (MissingVacant!4868 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34142 (_ BitVec 32)) SeekEntryResult!4868)

(assert (=> b!539366 (= lt!247122 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539367 () Bool)

(declare-fun res!334568 () Bool)

(assert (=> b!539367 (=> (not res!334568) (not e!312645))))

(assert (=> b!539367 (= res!334568 (and (= (size!16774 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16774 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16774 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539368 () Bool)

(assert (=> b!539368 (= e!312642 (bvslt (bvsub #b01111111111111111111111111111110 x!1030) #b00000000000000000000000000000000))))

(declare-fun b!539369 () Bool)

(declare-fun res!334569 () Bool)

(assert (=> b!539369 (=> (not res!334569) (not e!312644))))

(declare-datatypes ((List!10529 0))(
  ( (Nil!10526) (Cons!10525 (h!11468 (_ BitVec 64)) (t!16757 List!10529)) )
))
(declare-fun arrayNoDuplicates!0 (array!34142 (_ BitVec 32) List!10529) Bool)

(assert (=> b!539369 (= res!334569 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10526))))

(assert (= (and start!48930 res!334565) b!539367))

(assert (= (and b!539367 res!334568) b!539362))

(assert (= (and b!539362 res!334572) b!539359))

(assert (= (and b!539359 res!334570) b!539360))

(assert (= (and b!539360 res!334573) b!539366))

(assert (= (and b!539366 res!334564) b!539365))

(assert (= (and b!539365 res!334567) b!539369))

(assert (= (and b!539369 res!334569) b!539364))

(assert (= (and b!539364 res!334571) b!539363))

(assert (= (and b!539363 res!334566) b!539361))

(assert (= (and b!539361 res!334574) b!539368))

(declare-fun m!518397 () Bool)

(assert (=> b!539365 m!518397))

(declare-fun m!518399 () Bool)

(assert (=> b!539369 m!518399))

(declare-fun m!518401 () Bool)

(assert (=> start!48930 m!518401))

(declare-fun m!518403 () Bool)

(assert (=> start!48930 m!518403))

(declare-fun m!518405 () Bool)

(assert (=> b!539359 m!518405))

(declare-fun m!518407 () Bool)

(assert (=> b!539366 m!518407))

(declare-fun m!518409 () Bool)

(assert (=> b!539361 m!518409))

(assert (=> b!539361 m!518409))

(declare-fun m!518411 () Bool)

(assert (=> b!539361 m!518411))

(assert (=> b!539361 m!518411))

(assert (=> b!539361 m!518409))

(declare-fun m!518413 () Bool)

(assert (=> b!539361 m!518413))

(declare-fun m!518415 () Bool)

(assert (=> b!539360 m!518415))

(declare-fun m!518417 () Bool)

(assert (=> b!539364 m!518417))

(assert (=> b!539364 m!518409))

(assert (=> b!539363 m!518409))

(assert (=> b!539363 m!518409))

(declare-fun m!518419 () Bool)

(assert (=> b!539363 m!518419))

(assert (=> b!539362 m!518409))

(assert (=> b!539362 m!518409))

(declare-fun m!518421 () Bool)

(assert (=> b!539362 m!518421))

(push 1)

(assert (not b!539366))

(assert (not b!539369))

(assert (not b!539365))

(assert (not b!539359))

(assert (not b!539360))

(assert (not b!539363))

(assert (not b!539361))

(assert (not b!539362))

(assert (not start!48930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

