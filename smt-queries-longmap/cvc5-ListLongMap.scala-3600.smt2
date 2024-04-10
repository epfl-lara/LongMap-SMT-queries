; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49590 () Bool)

(assert start!49590)

(declare-fun res!339411 () Bool)

(declare-fun e!315303 () Bool)

(assert (=> start!49590 (=> (not res!339411) (not e!315303))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49590 (= res!339411 (validMask!0 mask!3216))))

(assert (=> start!49590 e!315303))

(assert (=> start!49590 true))

(declare-datatypes ((array!34403 0))(
  ( (array!34404 (arr!16530 (Array (_ BitVec 32) (_ BitVec 64))) (size!16894 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34403)

(declare-fun array_inv!12326 (array!34403) Bool)

(assert (=> start!49590 (array_inv!12326 a!3154)))

(declare-fun b!545475 () Bool)

(declare-fun res!339405 () Bool)

(declare-fun e!315299 () Bool)

(assert (=> b!545475 (=> (not res!339405) (not e!315299))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545475 (= res!339405 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16894 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16894 a!3154)) (= (select (arr!16530 a!3154) resIndex!32) (select (arr!16530 a!3154) j!147))))))

(declare-fun b!545476 () Bool)

(declare-fun res!339412 () Bool)

(assert (=> b!545476 (=> (not res!339412) (not e!315303))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545476 (= res!339412 (and (= (size!16894 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16894 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16894 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545477 () Bool)

(declare-fun res!339409 () Bool)

(assert (=> b!545477 (=> (not res!339409) (not e!315299))))

(declare-datatypes ((List!10649 0))(
  ( (Nil!10646) (Cons!10645 (h!11609 (_ BitVec 64)) (t!16877 List!10649)) )
))
(declare-fun arrayNoDuplicates!0 (array!34403 (_ BitVec 32) List!10649) Bool)

(assert (=> b!545477 (= res!339409 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10646))))

(declare-fun b!545478 () Bool)

(declare-fun res!339407 () Bool)

(assert (=> b!545478 (=> (not res!339407) (not e!315303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545478 (= res!339407 (validKeyInArray!0 (select (arr!16530 a!3154) j!147)))))

(declare-fun b!545479 () Bool)

(assert (=> b!545479 (= e!315303 e!315299)))

(declare-fun res!339404 () Bool)

(assert (=> b!545479 (=> (not res!339404) (not e!315299))))

(declare-datatypes ((SeekEntryResult!4988 0))(
  ( (MissingZero!4988 (index!22176 (_ BitVec 32))) (Found!4988 (index!22177 (_ BitVec 32))) (Intermediate!4988 (undefined!5800 Bool) (index!22178 (_ BitVec 32)) (x!51108 (_ BitVec 32))) (Undefined!4988) (MissingVacant!4988 (index!22179 (_ BitVec 32))) )
))
(declare-fun lt!248842 () SeekEntryResult!4988)

(assert (=> b!545479 (= res!339404 (or (= lt!248842 (MissingZero!4988 i!1153)) (= lt!248842 (MissingVacant!4988 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34403 (_ BitVec 32)) SeekEntryResult!4988)

(assert (=> b!545479 (= lt!248842 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545480 () Bool)

(declare-fun res!339406 () Bool)

(assert (=> b!545480 (=> (not res!339406) (not e!315303))))

(assert (=> b!545480 (= res!339406 (validKeyInArray!0 k!1998))))

(declare-fun b!545481 () Bool)

(declare-fun e!315298 () Bool)

(declare-fun e!315300 () Bool)

(assert (=> b!545481 (= e!315298 e!315300)))

(declare-fun res!339410 () Bool)

(assert (=> b!545481 (=> (not res!339410) (not e!315300))))

(declare-fun lt!248843 () (_ BitVec 32))

(assert (=> b!545481 (= res!339410 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248843 #b00000000000000000000000000000000) (bvslt lt!248843 (size!16894 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545481 (= lt!248843 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545482 () Bool)

(declare-fun res!339403 () Bool)

(assert (=> b!545482 (=> (not res!339403) (not e!315303))))

(declare-fun arrayContainsKey!0 (array!34403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545482 (= res!339403 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545483 () Bool)

(declare-fun e!315302 () Bool)

(assert (=> b!545483 (= e!315299 e!315302)))

(declare-fun res!339408 () Bool)

(assert (=> b!545483 (=> (not res!339408) (not e!315302))))

(declare-fun lt!248840 () SeekEntryResult!4988)

(declare-fun lt!248845 () SeekEntryResult!4988)

(assert (=> b!545483 (= res!339408 (= lt!248840 lt!248845))))

(assert (=> b!545483 (= lt!248845 (Intermediate!4988 false resIndex!32 resX!32))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34403 (_ BitVec 32)) SeekEntryResult!4988)

(assert (=> b!545483 (= lt!248840 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16530 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545484 () Bool)

(assert (=> b!545484 (= e!315302 e!315298)))

(declare-fun res!339413 () Bool)

(assert (=> b!545484 (=> (not res!339413) (not e!315298))))

(declare-fun lt!248841 () SeekEntryResult!4988)

(assert (=> b!545484 (= res!339413 (and (= lt!248841 lt!248840) (not (= (select (arr!16530 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16530 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16530 a!3154) index!1177) (select (arr!16530 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545484 (= lt!248841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16530 a!3154) j!147) mask!3216) (select (arr!16530 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545485 () Bool)

(declare-fun lt!248844 () SeekEntryResult!4988)

(assert (=> b!545485 (= e!315300 (and (= lt!248844 lt!248845) (not (= lt!248841 lt!248844))))))

(assert (=> b!545485 (= lt!248844 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248843 (select (arr!16530 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545486 () Bool)

(declare-fun res!339402 () Bool)

(assert (=> b!545486 (=> (not res!339402) (not e!315299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34403 (_ BitVec 32)) Bool)

(assert (=> b!545486 (= res!339402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49590 res!339411) b!545476))

(assert (= (and b!545476 res!339412) b!545478))

(assert (= (and b!545478 res!339407) b!545480))

(assert (= (and b!545480 res!339406) b!545482))

(assert (= (and b!545482 res!339403) b!545479))

(assert (= (and b!545479 res!339404) b!545486))

(assert (= (and b!545486 res!339402) b!545477))

(assert (= (and b!545477 res!339409) b!545475))

(assert (= (and b!545475 res!339405) b!545483))

(assert (= (and b!545483 res!339408) b!545484))

(assert (= (and b!545484 res!339413) b!545481))

(assert (= (and b!545481 res!339410) b!545485))

(declare-fun m!523041 () Bool)

(assert (=> b!545477 m!523041))

(declare-fun m!523043 () Bool)

(assert (=> b!545475 m!523043))

(declare-fun m!523045 () Bool)

(assert (=> b!545475 m!523045))

(assert (=> b!545478 m!523045))

(assert (=> b!545478 m!523045))

(declare-fun m!523047 () Bool)

(assert (=> b!545478 m!523047))

(assert (=> b!545483 m!523045))

(assert (=> b!545483 m!523045))

(declare-fun m!523049 () Bool)

(assert (=> b!545483 m!523049))

(declare-fun m!523051 () Bool)

(assert (=> b!545482 m!523051))

(declare-fun m!523053 () Bool)

(assert (=> b!545486 m!523053))

(declare-fun m!523055 () Bool)

(assert (=> b!545479 m!523055))

(declare-fun m!523057 () Bool)

(assert (=> start!49590 m!523057))

(declare-fun m!523059 () Bool)

(assert (=> start!49590 m!523059))

(declare-fun m!523061 () Bool)

(assert (=> b!545480 m!523061))

(declare-fun m!523063 () Bool)

(assert (=> b!545484 m!523063))

(assert (=> b!545484 m!523045))

(assert (=> b!545484 m!523045))

(declare-fun m!523065 () Bool)

(assert (=> b!545484 m!523065))

(assert (=> b!545484 m!523065))

(assert (=> b!545484 m!523045))

(declare-fun m!523067 () Bool)

(assert (=> b!545484 m!523067))

(assert (=> b!545485 m!523045))

(assert (=> b!545485 m!523045))

(declare-fun m!523069 () Bool)

(assert (=> b!545485 m!523069))

(declare-fun m!523071 () Bool)

(assert (=> b!545481 m!523071))

(push 1)

