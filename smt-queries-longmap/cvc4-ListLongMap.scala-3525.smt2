; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48724 () Bool)

(assert start!48724)

(declare-fun b!535618 () Bool)

(declare-fun res!330832 () Bool)

(declare-fun e!311103 () Bool)

(assert (=> b!535618 (=> (not res!330832) (not e!311103))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535618 (= res!330832 (validKeyInArray!0 k!1998))))

(declare-fun b!535619 () Bool)

(declare-fun e!311102 () Bool)

(declare-fun e!311100 () Bool)

(assert (=> b!535619 (= e!311102 e!311100)))

(declare-fun res!330828 () Bool)

(assert (=> b!535619 (=> (not res!330828) (not e!311100))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4765 0))(
  ( (MissingZero!4765 (index!21284 (_ BitVec 32))) (Found!4765 (index!21285 (_ BitVec 32))) (Intermediate!4765 (undefined!5577 Bool) (index!21286 (_ BitVec 32)) (x!50228 (_ BitVec 32))) (Undefined!4765) (MissingVacant!4765 (index!21287 (_ BitVec 32))) )
))
(declare-fun lt!245857 () SeekEntryResult!4765)

(assert (=> b!535619 (= res!330828 (= lt!245857 (Intermediate!4765 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33936 0))(
  ( (array!33937 (arr!16307 (Array (_ BitVec 32) (_ BitVec 64))) (size!16671 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33936)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33936 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!535619 (= lt!245857 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16307 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535620 () Bool)

(declare-fun res!330833 () Bool)

(assert (=> b!535620 (=> (not res!330833) (not e!311103))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535620 (= res!330833 (and (= (size!16671 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16671 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16671 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535621 () Bool)

(declare-fun res!330825 () Bool)

(assert (=> b!535621 (=> (not res!330825) (not e!311100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535621 (= res!330825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16307 a!3154) j!147) mask!3216) (select (arr!16307 a!3154) j!147) a!3154 mask!3216) lt!245857))))

(declare-fun b!535622 () Bool)

(declare-fun res!330823 () Bool)

(assert (=> b!535622 (=> (not res!330823) (not e!311102))))

(assert (=> b!535622 (= res!330823 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16671 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16671 a!3154)) (= (select (arr!16307 a!3154) resIndex!32) (select (arr!16307 a!3154) j!147))))))

(declare-fun b!535623 () Bool)

(declare-fun res!330824 () Bool)

(assert (=> b!535623 (=> (not res!330824) (not e!311102))))

(declare-datatypes ((List!10426 0))(
  ( (Nil!10423) (Cons!10422 (h!11365 (_ BitVec 64)) (t!16654 List!10426)) )
))
(declare-fun arrayNoDuplicates!0 (array!33936 (_ BitVec 32) List!10426) Bool)

(assert (=> b!535623 (= res!330824 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10423))))

(declare-fun b!535624 () Bool)

(declare-fun res!330827 () Bool)

(assert (=> b!535624 (=> (not res!330827) (not e!311103))))

(assert (=> b!535624 (= res!330827 (validKeyInArray!0 (select (arr!16307 a!3154) j!147)))))

(declare-fun res!330830 () Bool)

(assert (=> start!48724 (=> (not res!330830) (not e!311103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48724 (= res!330830 (validMask!0 mask!3216))))

(assert (=> start!48724 e!311103))

(assert (=> start!48724 true))

(declare-fun array_inv!12103 (array!33936) Bool)

(assert (=> start!48724 (array_inv!12103 a!3154)))

(declare-fun b!535625 () Bool)

(declare-fun res!330831 () Bool)

(assert (=> b!535625 (=> (not res!330831) (not e!311103))))

(declare-fun arrayContainsKey!0 (array!33936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535625 (= res!330831 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535626 () Bool)

(declare-fun res!330826 () Bool)

(assert (=> b!535626 (=> (not res!330826) (not e!311102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33936 (_ BitVec 32)) Bool)

(assert (=> b!535626 (= res!330826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535627 () Bool)

(assert (=> b!535627 (= e!311103 e!311102)))

(declare-fun res!330829 () Bool)

(assert (=> b!535627 (=> (not res!330829) (not e!311102))))

(declare-fun lt!245856 () SeekEntryResult!4765)

(assert (=> b!535627 (= res!330829 (or (= lt!245856 (MissingZero!4765 i!1153)) (= lt!245856 (MissingVacant!4765 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33936 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!535627 (= lt!245856 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535628 () Bool)

(assert (=> b!535628 (= e!311100 (and (not (= (select (arr!16307 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16307 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16307 a!3154) index!1177) (select (arr!16307 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(assert (= (and start!48724 res!330830) b!535620))

(assert (= (and b!535620 res!330833) b!535624))

(assert (= (and b!535624 res!330827) b!535618))

(assert (= (and b!535618 res!330832) b!535625))

(assert (= (and b!535625 res!330831) b!535627))

(assert (= (and b!535627 res!330829) b!535626))

(assert (= (and b!535626 res!330826) b!535623))

(assert (= (and b!535623 res!330824) b!535622))

(assert (= (and b!535622 res!330823) b!535619))

(assert (= (and b!535619 res!330828) b!535621))

(assert (= (and b!535621 res!330825) b!535628))

(declare-fun m!515177 () Bool)

(assert (=> b!535627 m!515177))

(declare-fun m!515179 () Bool)

(assert (=> b!535624 m!515179))

(assert (=> b!535624 m!515179))

(declare-fun m!515181 () Bool)

(assert (=> b!535624 m!515181))

(declare-fun m!515183 () Bool)

(assert (=> b!535622 m!515183))

(assert (=> b!535622 m!515179))

(declare-fun m!515185 () Bool)

(assert (=> b!535618 m!515185))

(assert (=> b!535621 m!515179))

(assert (=> b!535621 m!515179))

(declare-fun m!515187 () Bool)

(assert (=> b!535621 m!515187))

(assert (=> b!535621 m!515187))

(assert (=> b!535621 m!515179))

(declare-fun m!515189 () Bool)

(assert (=> b!535621 m!515189))

(declare-fun m!515191 () Bool)

(assert (=> b!535625 m!515191))

(declare-fun m!515193 () Bool)

(assert (=> b!535626 m!515193))

(assert (=> b!535619 m!515179))

(assert (=> b!535619 m!515179))

(declare-fun m!515195 () Bool)

(assert (=> b!535619 m!515195))

(declare-fun m!515197 () Bool)

(assert (=> start!48724 m!515197))

(declare-fun m!515199 () Bool)

(assert (=> start!48724 m!515199))

(declare-fun m!515201 () Bool)

(assert (=> b!535623 m!515201))

(declare-fun m!515203 () Bool)

(assert (=> b!535628 m!515203))

(assert (=> b!535628 m!515179))

(push 1)

(assert (not b!535619))

(assert (not b!535618))

(assert (not b!535624))

(assert (not b!535625))

(assert (not b!535627))

(assert (not start!48724))

(assert (not b!535621))

(assert (not b!535626))

(assert (not b!535623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

