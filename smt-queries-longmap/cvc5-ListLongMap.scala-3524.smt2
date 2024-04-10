; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48714 () Bool)

(assert start!48714)

(declare-fun b!535453 () Bool)

(declare-fun res!330662 () Bool)

(declare-fun e!311042 () Bool)

(assert (=> b!535453 (=> (not res!330662) (not e!311042))))

(declare-datatypes ((array!33926 0))(
  ( (array!33927 (arr!16302 (Array (_ BitVec 32) (_ BitVec 64))) (size!16666 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33926)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33926 (_ BitVec 32)) Bool)

(assert (=> b!535453 (= res!330662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535454 () Bool)

(declare-fun e!311040 () Bool)

(assert (=> b!535454 (= e!311040 e!311042)))

(declare-fun res!330659 () Bool)

(assert (=> b!535454 (=> (not res!330659) (not e!311042))))

(declare-datatypes ((SeekEntryResult!4760 0))(
  ( (MissingZero!4760 (index!21264 (_ BitVec 32))) (Found!4760 (index!21265 (_ BitVec 32))) (Intermediate!4760 (undefined!5572 Bool) (index!21266 (_ BitVec 32)) (x!50215 (_ BitVec 32))) (Undefined!4760) (MissingVacant!4760 (index!21267 (_ BitVec 32))) )
))
(declare-fun lt!245826 () SeekEntryResult!4760)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535454 (= res!330659 (or (= lt!245826 (MissingZero!4760 i!1153)) (= lt!245826 (MissingVacant!4760 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33926 (_ BitVec 32)) SeekEntryResult!4760)

(assert (=> b!535454 (= lt!245826 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535455 () Bool)

(declare-fun res!330661 () Bool)

(assert (=> b!535455 (=> (not res!330661) (not e!311042))))

(declare-datatypes ((List!10421 0))(
  ( (Nil!10418) (Cons!10417 (h!11360 (_ BitVec 64)) (t!16649 List!10421)) )
))
(declare-fun arrayNoDuplicates!0 (array!33926 (_ BitVec 32) List!10421) Bool)

(assert (=> b!535455 (= res!330661 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10418))))

(declare-fun b!535456 () Bool)

(declare-fun res!330658 () Bool)

(assert (=> b!535456 (=> (not res!330658) (not e!311040))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535456 (= res!330658 (validKeyInArray!0 (select (arr!16302 a!3154) j!147)))))

(declare-fun b!535457 () Bool)

(declare-fun res!330663 () Bool)

(assert (=> b!535457 (=> (not res!330663) (not e!311040))))

(declare-fun arrayContainsKey!0 (array!33926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535457 (= res!330663 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535458 () Bool)

(declare-fun res!330664 () Bool)

(assert (=> b!535458 (=> (not res!330664) (not e!311040))))

(assert (=> b!535458 (= res!330664 (validKeyInArray!0 k!1998))))

(declare-fun b!535460 () Bool)

(declare-fun res!330667 () Bool)

(declare-fun e!311043 () Bool)

(assert (=> b!535460 (=> (not res!330667) (not e!311043))))

(declare-fun lt!245827 () SeekEntryResult!4760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33926 (_ BitVec 32)) SeekEntryResult!4760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535460 (= res!330667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16302 a!3154) j!147) mask!3216) (select (arr!16302 a!3154) j!147) a!3154 mask!3216) lt!245827))))

(declare-fun b!535461 () Bool)

(declare-fun res!330666 () Bool)

(assert (=> b!535461 (=> (not res!330666) (not e!311042))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535461 (= res!330666 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16666 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16666 a!3154)) (= (select (arr!16302 a!3154) resIndex!32) (select (arr!16302 a!3154) j!147))))))

(declare-fun b!535462 () Bool)

(assert (=> b!535462 (= e!311042 e!311043)))

(declare-fun res!330668 () Bool)

(assert (=> b!535462 (=> (not res!330668) (not e!311043))))

(assert (=> b!535462 (= res!330668 (= lt!245827 (Intermediate!4760 false resIndex!32 resX!32)))))

(assert (=> b!535462 (= lt!245827 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16302 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535463 () Bool)

(declare-fun res!330660 () Bool)

(assert (=> b!535463 (=> (not res!330660) (not e!311040))))

(assert (=> b!535463 (= res!330660 (and (= (size!16666 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16666 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16666 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535459 () Bool)

(assert (=> b!535459 (= e!311043 (and (not (= (select (arr!16302 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16302 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16302 a!3154) index!1177) (select (arr!16302 a!3154) j!147))) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun res!330665 () Bool)

(assert (=> start!48714 (=> (not res!330665) (not e!311040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48714 (= res!330665 (validMask!0 mask!3216))))

(assert (=> start!48714 e!311040))

(assert (=> start!48714 true))

(declare-fun array_inv!12098 (array!33926) Bool)

(assert (=> start!48714 (array_inv!12098 a!3154)))

(assert (= (and start!48714 res!330665) b!535463))

(assert (= (and b!535463 res!330660) b!535456))

(assert (= (and b!535456 res!330658) b!535458))

(assert (= (and b!535458 res!330664) b!535457))

(assert (= (and b!535457 res!330663) b!535454))

(assert (= (and b!535454 res!330659) b!535453))

(assert (= (and b!535453 res!330662) b!535455))

(assert (= (and b!535455 res!330661) b!535461))

(assert (= (and b!535461 res!330666) b!535462))

(assert (= (and b!535462 res!330668) b!535460))

(assert (= (and b!535460 res!330667) b!535459))

(declare-fun m!515037 () Bool)

(assert (=> b!535461 m!515037))

(declare-fun m!515039 () Bool)

(assert (=> b!535461 m!515039))

(declare-fun m!515041 () Bool)

(assert (=> b!535454 m!515041))

(assert (=> b!535460 m!515039))

(assert (=> b!535460 m!515039))

(declare-fun m!515043 () Bool)

(assert (=> b!535460 m!515043))

(assert (=> b!535460 m!515043))

(assert (=> b!535460 m!515039))

(declare-fun m!515045 () Bool)

(assert (=> b!535460 m!515045))

(declare-fun m!515047 () Bool)

(assert (=> start!48714 m!515047))

(declare-fun m!515049 () Bool)

(assert (=> start!48714 m!515049))

(declare-fun m!515051 () Bool)

(assert (=> b!535455 m!515051))

(declare-fun m!515053 () Bool)

(assert (=> b!535458 m!515053))

(assert (=> b!535456 m!515039))

(assert (=> b!535456 m!515039))

(declare-fun m!515055 () Bool)

(assert (=> b!535456 m!515055))

(declare-fun m!515057 () Bool)

(assert (=> b!535459 m!515057))

(assert (=> b!535459 m!515039))

(assert (=> b!535462 m!515039))

(assert (=> b!535462 m!515039))

(declare-fun m!515059 () Bool)

(assert (=> b!535462 m!515059))

(declare-fun m!515061 () Bool)

(assert (=> b!535457 m!515061))

(declare-fun m!515063 () Bool)

(assert (=> b!535453 m!515063))

(push 1)

