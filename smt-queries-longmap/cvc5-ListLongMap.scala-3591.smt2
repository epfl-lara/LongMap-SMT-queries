; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49332 () Bool)

(assert start!49332)

(declare-fun b!543474 () Bool)

(declare-fun res!338035 () Bool)

(declare-fun e!314312 () Bool)

(assert (=> b!543474 (=> (not res!338035) (not e!314312))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34340 0))(
  ( (array!34341 (arr!16503 (Array (_ BitVec 32) (_ BitVec 64))) (size!16867 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34340)

(assert (=> b!543474 (= res!338035 (and (not (= (select (arr!16503 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16503 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16503 a!3154) index!1177) (select (arr!16503 a!3154) j!147)))))))

(declare-fun b!543475 () Bool)

(declare-fun res!338031 () Bool)

(declare-fun e!314310 () Bool)

(assert (=> b!543475 (=> (not res!338031) (not e!314310))))

(declare-datatypes ((List!10622 0))(
  ( (Nil!10619) (Cons!10618 (h!11573 (_ BitVec 64)) (t!16850 List!10622)) )
))
(declare-fun arrayNoDuplicates!0 (array!34340 (_ BitVec 32) List!10622) Bool)

(assert (=> b!543475 (= res!338031 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10619))))

(declare-fun b!543476 () Bool)

(assert (=> b!543476 (= e!314312 false)))

(declare-fun lt!248180 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543476 (= lt!248180 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543477 () Bool)

(declare-fun res!338033 () Bool)

(assert (=> b!543477 (=> (not res!338033) (not e!314312))))

(declare-datatypes ((SeekEntryResult!4961 0))(
  ( (MissingZero!4961 (index!22068 (_ BitVec 32))) (Found!4961 (index!22069 (_ BitVec 32))) (Intermediate!4961 (undefined!5773 Bool) (index!22070 (_ BitVec 32)) (x!50976 (_ BitVec 32))) (Undefined!4961) (MissingVacant!4961 (index!22071 (_ BitVec 32))) )
))
(declare-fun lt!248181 () SeekEntryResult!4961)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34340 (_ BitVec 32)) SeekEntryResult!4961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543477 (= res!338033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16503 a!3154) j!147) mask!3216) (select (arr!16503 a!3154) j!147) a!3154 mask!3216) lt!248181))))

(declare-fun b!543478 () Bool)

(declare-fun res!338028 () Bool)

(declare-fun e!314313 () Bool)

(assert (=> b!543478 (=> (not res!338028) (not e!314313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543478 (= res!338028 (validKeyInArray!0 (select (arr!16503 a!3154) j!147)))))

(declare-fun b!543479 () Bool)

(declare-fun res!338026 () Bool)

(assert (=> b!543479 (=> (not res!338026) (not e!314310))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543479 (= res!338026 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16867 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16867 a!3154)) (= (select (arr!16503 a!3154) resIndex!32) (select (arr!16503 a!3154) j!147))))))

(declare-fun b!543480 () Bool)

(declare-fun res!338025 () Bool)

(assert (=> b!543480 (=> (not res!338025) (not e!314313))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543480 (= res!338025 (and (= (size!16867 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16867 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16867 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543481 () Bool)

(declare-fun res!338036 () Bool)

(assert (=> b!543481 (=> (not res!338036) (not e!314310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34340 (_ BitVec 32)) Bool)

(assert (=> b!543481 (= res!338036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543482 () Bool)

(assert (=> b!543482 (= e!314313 e!314310)))

(declare-fun res!338029 () Bool)

(assert (=> b!543482 (=> (not res!338029) (not e!314310))))

(declare-fun lt!248182 () SeekEntryResult!4961)

(assert (=> b!543482 (= res!338029 (or (= lt!248182 (MissingZero!4961 i!1153)) (= lt!248182 (MissingVacant!4961 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34340 (_ BitVec 32)) SeekEntryResult!4961)

(assert (=> b!543482 (= lt!248182 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!338030 () Bool)

(assert (=> start!49332 (=> (not res!338030) (not e!314313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49332 (= res!338030 (validMask!0 mask!3216))))

(assert (=> start!49332 e!314313))

(assert (=> start!49332 true))

(declare-fun array_inv!12299 (array!34340) Bool)

(assert (=> start!49332 (array_inv!12299 a!3154)))

(declare-fun b!543483 () Bool)

(assert (=> b!543483 (= e!314310 e!314312)))

(declare-fun res!338034 () Bool)

(assert (=> b!543483 (=> (not res!338034) (not e!314312))))

(assert (=> b!543483 (= res!338034 (= lt!248181 (Intermediate!4961 false resIndex!32 resX!32)))))

(assert (=> b!543483 (= lt!248181 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16503 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543484 () Bool)

(declare-fun res!338027 () Bool)

(assert (=> b!543484 (=> (not res!338027) (not e!314313))))

(assert (=> b!543484 (= res!338027 (validKeyInArray!0 k!1998))))

(declare-fun b!543485 () Bool)

(declare-fun res!338032 () Bool)

(assert (=> b!543485 (=> (not res!338032) (not e!314313))))

(declare-fun arrayContainsKey!0 (array!34340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543485 (= res!338032 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49332 res!338030) b!543480))

(assert (= (and b!543480 res!338025) b!543478))

(assert (= (and b!543478 res!338028) b!543484))

(assert (= (and b!543484 res!338027) b!543485))

(assert (= (and b!543485 res!338032) b!543482))

(assert (= (and b!543482 res!338029) b!543481))

(assert (= (and b!543481 res!338036) b!543475))

(assert (= (and b!543475 res!338031) b!543479))

(assert (= (and b!543479 res!338026) b!543483))

(assert (= (and b!543483 res!338034) b!543477))

(assert (= (and b!543477 res!338033) b!543474))

(assert (= (and b!543474 res!338035) b!543476))

(declare-fun m!521559 () Bool)

(assert (=> b!543482 m!521559))

(declare-fun m!521561 () Bool)

(assert (=> b!543483 m!521561))

(assert (=> b!543483 m!521561))

(declare-fun m!521563 () Bool)

(assert (=> b!543483 m!521563))

(declare-fun m!521565 () Bool)

(assert (=> b!543485 m!521565))

(assert (=> b!543478 m!521561))

(assert (=> b!543478 m!521561))

(declare-fun m!521567 () Bool)

(assert (=> b!543478 m!521567))

(declare-fun m!521569 () Bool)

(assert (=> b!543475 m!521569))

(assert (=> b!543477 m!521561))

(assert (=> b!543477 m!521561))

(declare-fun m!521571 () Bool)

(assert (=> b!543477 m!521571))

(assert (=> b!543477 m!521571))

(assert (=> b!543477 m!521561))

(declare-fun m!521573 () Bool)

(assert (=> b!543477 m!521573))

(declare-fun m!521575 () Bool)

(assert (=> b!543481 m!521575))

(declare-fun m!521577 () Bool)

(assert (=> start!49332 m!521577))

(declare-fun m!521579 () Bool)

(assert (=> start!49332 m!521579))

(declare-fun m!521581 () Bool)

(assert (=> b!543476 m!521581))

(declare-fun m!521583 () Bool)

(assert (=> b!543474 m!521583))

(assert (=> b!543474 m!521561))

(declare-fun m!521585 () Bool)

(assert (=> b!543479 m!521585))

(assert (=> b!543479 m!521561))

(declare-fun m!521587 () Bool)

(assert (=> b!543484 m!521587))

(push 1)

