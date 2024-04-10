; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48604 () Bool)

(assert start!48604)

(declare-fun res!328969 () Bool)

(declare-fun e!310509 () Bool)

(assert (=> start!48604 (=> (not res!328969) (not e!310509))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48604 (= res!328969 (validMask!0 mask!3216))))

(assert (=> start!48604 e!310509))

(assert (=> start!48604 true))

(declare-datatypes ((array!33816 0))(
  ( (array!33817 (arr!16247 (Array (_ BitVec 32) (_ BitVec 64))) (size!16611 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33816)

(declare-fun array_inv!12043 (array!33816) Bool)

(assert (=> start!48604 (array_inv!12043 a!3154)))

(declare-fun b!533756 () Bool)

(declare-fun res!328968 () Bool)

(declare-fun e!310507 () Bool)

(assert (=> b!533756 (=> (not res!328968) (not e!310507))))

(declare-datatypes ((List!10366 0))(
  ( (Nil!10363) (Cons!10362 (h!11305 (_ BitVec 64)) (t!16594 List!10366)) )
))
(declare-fun arrayNoDuplicates!0 (array!33816 (_ BitVec 32) List!10366) Bool)

(assert (=> b!533756 (= res!328968 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10363))))

(declare-fun b!533757 () Bool)

(declare-fun res!328963 () Bool)

(assert (=> b!533757 (=> (not res!328963) (not e!310509))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533757 (= res!328963 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533758 () Bool)

(assert (=> b!533758 (= e!310507 false)))

(declare-datatypes ((SeekEntryResult!4705 0))(
  ( (MissingZero!4705 (index!21044 (_ BitVec 32))) (Found!4705 (index!21045 (_ BitVec 32))) (Intermediate!4705 (undefined!5517 Bool) (index!21046 (_ BitVec 32)) (x!50008 (_ BitVec 32))) (Undefined!4705) (MissingVacant!4705 (index!21047 (_ BitVec 32))) )
))
(declare-fun lt!245496 () SeekEntryResult!4705)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33816 (_ BitVec 32)) SeekEntryResult!4705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533758 (= lt!245496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16247 a!3154) j!147) mask!3216) (select (arr!16247 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533759 () Bool)

(assert (=> b!533759 (= e!310509 e!310507)))

(declare-fun res!328970 () Bool)

(assert (=> b!533759 (=> (not res!328970) (not e!310507))))

(declare-fun lt!245497 () SeekEntryResult!4705)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533759 (= res!328970 (or (= lt!245497 (MissingZero!4705 i!1153)) (= lt!245497 (MissingVacant!4705 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33816 (_ BitVec 32)) SeekEntryResult!4705)

(assert (=> b!533759 (= lt!245497 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533760 () Bool)

(declare-fun res!328967 () Bool)

(assert (=> b!533760 (=> (not res!328967) (not e!310509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533760 (= res!328967 (validKeyInArray!0 k!1998))))

(declare-fun b!533761 () Bool)

(declare-fun res!328965 () Bool)

(assert (=> b!533761 (=> (not res!328965) (not e!310507))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!533761 (= res!328965 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16611 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16611 a!3154)) (= (select (arr!16247 a!3154) resIndex!32) (select (arr!16247 a!3154) j!147))))))

(declare-fun b!533762 () Bool)

(declare-fun res!328964 () Bool)

(assert (=> b!533762 (=> (not res!328964) (not e!310509))))

(assert (=> b!533762 (= res!328964 (and (= (size!16611 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16611 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16611 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533763 () Bool)

(declare-fun res!328962 () Bool)

(assert (=> b!533763 (=> (not res!328962) (not e!310507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33816 (_ BitVec 32)) Bool)

(assert (=> b!533763 (= res!328962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533764 () Bool)

(declare-fun res!328961 () Bool)

(assert (=> b!533764 (=> (not res!328961) (not e!310507))))

(assert (=> b!533764 (= res!328961 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16247 a!3154) j!147) a!3154 mask!3216) (Intermediate!4705 false resIndex!32 resX!32)))))

(declare-fun b!533765 () Bool)

(declare-fun res!328966 () Bool)

(assert (=> b!533765 (=> (not res!328966) (not e!310509))))

(assert (=> b!533765 (= res!328966 (validKeyInArray!0 (select (arr!16247 a!3154) j!147)))))

(assert (= (and start!48604 res!328969) b!533762))

(assert (= (and b!533762 res!328964) b!533765))

(assert (= (and b!533765 res!328966) b!533760))

(assert (= (and b!533760 res!328967) b!533757))

(assert (= (and b!533757 res!328963) b!533759))

(assert (= (and b!533759 res!328970) b!533763))

(assert (= (and b!533763 res!328962) b!533756))

(assert (= (and b!533756 res!328968) b!533761))

(assert (= (and b!533761 res!328965) b!533764))

(assert (= (and b!533764 res!328961) b!533758))

(declare-fun m!513565 () Bool)

(assert (=> b!533765 m!513565))

(assert (=> b!533765 m!513565))

(declare-fun m!513567 () Bool)

(assert (=> b!533765 m!513567))

(declare-fun m!513569 () Bool)

(assert (=> b!533757 m!513569))

(declare-fun m!513571 () Bool)

(assert (=> b!533756 m!513571))

(declare-fun m!513573 () Bool)

(assert (=> b!533760 m!513573))

(assert (=> b!533758 m!513565))

(assert (=> b!533758 m!513565))

(declare-fun m!513575 () Bool)

(assert (=> b!533758 m!513575))

(assert (=> b!533758 m!513575))

(assert (=> b!533758 m!513565))

(declare-fun m!513577 () Bool)

(assert (=> b!533758 m!513577))

(declare-fun m!513579 () Bool)

(assert (=> start!48604 m!513579))

(declare-fun m!513581 () Bool)

(assert (=> start!48604 m!513581))

(declare-fun m!513583 () Bool)

(assert (=> b!533763 m!513583))

(declare-fun m!513585 () Bool)

(assert (=> b!533761 m!513585))

(assert (=> b!533761 m!513565))

(assert (=> b!533764 m!513565))

(assert (=> b!533764 m!513565))

(declare-fun m!513587 () Bool)

(assert (=> b!533764 m!513587))

(declare-fun m!513589 () Bool)

(assert (=> b!533759 m!513589))

(push 1)

(assert (not start!48604))

(assert (not b!533756))

(assert (not b!533760))

(assert (not b!533765))

(assert (not b!533763))

(assert (not b!533759))

(assert (not b!533764))

