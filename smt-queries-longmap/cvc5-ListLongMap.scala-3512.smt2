; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48642 () Bool)

(assert start!48642)

(declare-fun b!534326 () Bool)

(declare-fun res!329538 () Bool)

(declare-fun e!310679 () Bool)

(assert (=> b!534326 (=> (not res!329538) (not e!310679))))

(declare-datatypes ((array!33854 0))(
  ( (array!33855 (arr!16266 (Array (_ BitVec 32) (_ BitVec 64))) (size!16630 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33854)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33854 (_ BitVec 32)) Bool)

(assert (=> b!534326 (= res!329538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534327 () Bool)

(declare-fun res!329533 () Bool)

(declare-fun e!310680 () Bool)

(assert (=> b!534327 (=> (not res!329533) (not e!310680))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534327 (= res!329533 (validKeyInArray!0 (select (arr!16266 a!3154) j!147)))))

(declare-fun b!534328 () Bool)

(declare-fun res!329540 () Bool)

(assert (=> b!534328 (=> (not res!329540) (not e!310679))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4724 0))(
  ( (MissingZero!4724 (index!21120 (_ BitVec 32))) (Found!4724 (index!21121 (_ BitVec 32))) (Intermediate!4724 (undefined!5536 Bool) (index!21122 (_ BitVec 32)) (x!50083 (_ BitVec 32))) (Undefined!4724) (MissingVacant!4724 (index!21123 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33854 (_ BitVec 32)) SeekEntryResult!4724)

(assert (=> b!534328 (= res!329540 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16266 a!3154) j!147) a!3154 mask!3216) (Intermediate!4724 false resIndex!32 resX!32)))))

(declare-fun res!329535 () Bool)

(assert (=> start!48642 (=> (not res!329535) (not e!310680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48642 (= res!329535 (validMask!0 mask!3216))))

(assert (=> start!48642 e!310680))

(assert (=> start!48642 true))

(declare-fun array_inv!12062 (array!33854) Bool)

(assert (=> start!48642 (array_inv!12062 a!3154)))

(declare-fun b!534329 () Bool)

(declare-fun res!329536 () Bool)

(assert (=> b!534329 (=> (not res!329536) (not e!310679))))

(assert (=> b!534329 (= res!329536 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16630 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16630 a!3154)) (= (select (arr!16266 a!3154) resIndex!32) (select (arr!16266 a!3154) j!147))))))

(declare-fun b!534330 () Bool)

(declare-fun res!329531 () Bool)

(assert (=> b!534330 (=> (not res!329531) (not e!310679))))

(declare-datatypes ((List!10385 0))(
  ( (Nil!10382) (Cons!10381 (h!11324 (_ BitVec 64)) (t!16613 List!10385)) )
))
(declare-fun arrayNoDuplicates!0 (array!33854 (_ BitVec 32) List!10385) Bool)

(assert (=> b!534330 (= res!329531 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10382))))

(declare-fun b!534331 () Bool)

(declare-fun res!329539 () Bool)

(assert (=> b!534331 (=> (not res!329539) (not e!310680))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534331 (= res!329539 (and (= (size!16630 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16630 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16630 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534332 () Bool)

(declare-fun res!329532 () Bool)

(assert (=> b!534332 (=> (not res!329532) (not e!310680))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534332 (= res!329532 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534333 () Bool)

(assert (=> b!534333 (= e!310680 e!310679)))

(declare-fun res!329537 () Bool)

(assert (=> b!534333 (=> (not res!329537) (not e!310679))))

(declare-fun lt!245611 () SeekEntryResult!4724)

(assert (=> b!534333 (= res!329537 (or (= lt!245611 (MissingZero!4724 i!1153)) (= lt!245611 (MissingVacant!4724 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33854 (_ BitVec 32)) SeekEntryResult!4724)

(assert (=> b!534333 (= lt!245611 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534334 () Bool)

(assert (=> b!534334 (= e!310679 false)))

(declare-fun lt!245610 () SeekEntryResult!4724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534334 (= lt!245610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16266 a!3154) j!147) mask!3216) (select (arr!16266 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534335 () Bool)

(declare-fun res!329534 () Bool)

(assert (=> b!534335 (=> (not res!329534) (not e!310680))))

(assert (=> b!534335 (= res!329534 (validKeyInArray!0 k!1998))))

(assert (= (and start!48642 res!329535) b!534331))

(assert (= (and b!534331 res!329539) b!534327))

(assert (= (and b!534327 res!329533) b!534335))

(assert (= (and b!534335 res!329534) b!534332))

(assert (= (and b!534332 res!329532) b!534333))

(assert (= (and b!534333 res!329537) b!534326))

(assert (= (and b!534326 res!329538) b!534330))

(assert (= (and b!534330 res!329531) b!534329))

(assert (= (and b!534329 res!329536) b!534328))

(assert (= (and b!534328 res!329540) b!534334))

(declare-fun m!514059 () Bool)

(assert (=> b!534333 m!514059))

(declare-fun m!514061 () Bool)

(assert (=> b!534332 m!514061))

(declare-fun m!514063 () Bool)

(assert (=> b!534334 m!514063))

(assert (=> b!534334 m!514063))

(declare-fun m!514065 () Bool)

(assert (=> b!534334 m!514065))

(assert (=> b!534334 m!514065))

(assert (=> b!534334 m!514063))

(declare-fun m!514067 () Bool)

(assert (=> b!534334 m!514067))

(declare-fun m!514069 () Bool)

(assert (=> b!534330 m!514069))

(declare-fun m!514071 () Bool)

(assert (=> start!48642 m!514071))

(declare-fun m!514073 () Bool)

(assert (=> start!48642 m!514073))

(declare-fun m!514075 () Bool)

(assert (=> b!534329 m!514075))

(assert (=> b!534329 m!514063))

(assert (=> b!534328 m!514063))

(assert (=> b!534328 m!514063))

(declare-fun m!514077 () Bool)

(assert (=> b!534328 m!514077))

(assert (=> b!534327 m!514063))

(assert (=> b!534327 m!514063))

(declare-fun m!514079 () Bool)

(assert (=> b!534327 m!514079))

(declare-fun m!514081 () Bool)

(assert (=> b!534335 m!514081))

(declare-fun m!514083 () Bool)

(assert (=> b!534326 m!514083))

(push 1)

