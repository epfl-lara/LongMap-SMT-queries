; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48936 () Bool)

(assert start!48936)

(declare-fun res!334668 () Bool)

(declare-fun e!312678 () Bool)

(assert (=> start!48936 (=> (not res!334668) (not e!312678))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48936 (= res!334668 (validMask!0 mask!3216))))

(assert (=> start!48936 e!312678))

(assert (=> start!48936 true))

(declare-datatypes ((array!34148 0))(
  ( (array!34149 (arr!16413 (Array (_ BitVec 32) (_ BitVec 64))) (size!16777 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34148)

(declare-fun array_inv!12209 (array!34148) Bool)

(assert (=> start!48936 (array_inv!12209 a!3154)))

(declare-fun b!539456 () Bool)

(declare-fun e!312677 () Bool)

(assert (=> b!539456 (= e!312677 false)))

(declare-datatypes ((SeekEntryResult!4871 0))(
  ( (MissingZero!4871 (index!21708 (_ BitVec 32))) (Found!4871 (index!21709 (_ BitVec 32))) (Intermediate!4871 (undefined!5683 Bool) (index!21710 (_ BitVec 32)) (x!50622 (_ BitVec 32))) (Undefined!4871) (MissingVacant!4871 (index!21711 (_ BitVec 32))) )
))
(declare-fun lt!247140 () SeekEntryResult!4871)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34148 (_ BitVec 32)) SeekEntryResult!4871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539456 (= lt!247140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16413 a!3154) j!147) mask!3216) (select (arr!16413 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539457 () Bool)

(declare-fun res!334667 () Bool)

(assert (=> b!539457 (=> (not res!334667) (not e!312678))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539457 (= res!334667 (validKeyInArray!0 k!1998))))

(declare-fun b!539458 () Bool)

(declare-fun res!334663 () Bool)

(assert (=> b!539458 (=> (not res!334663) (not e!312677))))

(declare-datatypes ((List!10532 0))(
  ( (Nil!10529) (Cons!10528 (h!11471 (_ BitVec 64)) (t!16760 List!10532)) )
))
(declare-fun arrayNoDuplicates!0 (array!34148 (_ BitVec 32) List!10532) Bool)

(assert (=> b!539458 (= res!334663 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10529))))

(declare-fun b!539459 () Bool)

(declare-fun res!334665 () Bool)

(assert (=> b!539459 (=> (not res!334665) (not e!312678))))

(declare-fun arrayContainsKey!0 (array!34148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539459 (= res!334665 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539460 () Bool)

(declare-fun res!334661 () Bool)

(assert (=> b!539460 (=> (not res!334661) (not e!312678))))

(assert (=> b!539460 (= res!334661 (validKeyInArray!0 (select (arr!16413 a!3154) j!147)))))

(declare-fun b!539461 () Bool)

(declare-fun res!334664 () Bool)

(assert (=> b!539461 (=> (not res!334664) (not e!312677))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539461 (= res!334664 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16413 a!3154) j!147) a!3154 mask!3216) (Intermediate!4871 false resIndex!32 resX!32)))))

(declare-fun b!539462 () Bool)

(assert (=> b!539462 (= e!312678 e!312677)))

(declare-fun res!334662 () Bool)

(assert (=> b!539462 (=> (not res!334662) (not e!312677))))

(declare-fun lt!247141 () SeekEntryResult!4871)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539462 (= res!334662 (or (= lt!247141 (MissingZero!4871 i!1153)) (= lt!247141 (MissingVacant!4871 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34148 (_ BitVec 32)) SeekEntryResult!4871)

(assert (=> b!539462 (= lt!247141 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539463 () Bool)

(declare-fun res!334666 () Bool)

(assert (=> b!539463 (=> (not res!334666) (not e!312677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34148 (_ BitVec 32)) Bool)

(assert (=> b!539463 (= res!334666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539464 () Bool)

(declare-fun res!334669 () Bool)

(assert (=> b!539464 (=> (not res!334669) (not e!312678))))

(assert (=> b!539464 (= res!334669 (and (= (size!16777 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16777 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16777 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539465 () Bool)

(declare-fun res!334670 () Bool)

(assert (=> b!539465 (=> (not res!334670) (not e!312677))))

(assert (=> b!539465 (= res!334670 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16777 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16777 a!3154)) (= (select (arr!16413 a!3154) resIndex!32) (select (arr!16413 a!3154) j!147))))))

(assert (= (and start!48936 res!334668) b!539464))

(assert (= (and b!539464 res!334669) b!539460))

(assert (= (and b!539460 res!334661) b!539457))

(assert (= (and b!539457 res!334667) b!539459))

(assert (= (and b!539459 res!334665) b!539462))

(assert (= (and b!539462 res!334662) b!539463))

(assert (= (and b!539463 res!334666) b!539458))

(assert (= (and b!539458 res!334663) b!539465))

(assert (= (and b!539465 res!334670) b!539461))

(assert (= (and b!539461 res!334664) b!539456))

(declare-fun m!518475 () Bool)

(assert (=> b!539465 m!518475))

(declare-fun m!518477 () Bool)

(assert (=> b!539465 m!518477))

(declare-fun m!518479 () Bool)

(assert (=> start!48936 m!518479))

(declare-fun m!518481 () Bool)

(assert (=> start!48936 m!518481))

(declare-fun m!518483 () Bool)

(assert (=> b!539457 m!518483))

(declare-fun m!518485 () Bool)

(assert (=> b!539459 m!518485))

(assert (=> b!539456 m!518477))

(assert (=> b!539456 m!518477))

(declare-fun m!518487 () Bool)

(assert (=> b!539456 m!518487))

(assert (=> b!539456 m!518487))

(assert (=> b!539456 m!518477))

(declare-fun m!518489 () Bool)

(assert (=> b!539456 m!518489))

(declare-fun m!518491 () Bool)

(assert (=> b!539458 m!518491))

(declare-fun m!518493 () Bool)

(assert (=> b!539462 m!518493))

(assert (=> b!539461 m!518477))

(assert (=> b!539461 m!518477))

(declare-fun m!518495 () Bool)

(assert (=> b!539461 m!518495))

(declare-fun m!518497 () Bool)

(assert (=> b!539463 m!518497))

(assert (=> b!539460 m!518477))

(assert (=> b!539460 m!518477))

(declare-fun m!518499 () Bool)

(assert (=> b!539460 m!518499))

(push 1)

