; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48418 () Bool)

(assert start!48418)

(declare-fun b!532055 () Bool)

(declare-fun res!327551 () Bool)

(declare-fun e!309825 () Bool)

(assert (=> b!532055 (=> (not res!327551) (not e!309825))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532055 (= res!327551 (validKeyInArray!0 k!1998))))

(declare-fun b!532056 () Bool)

(declare-fun e!309823 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532056 (= e!309823 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!532057 () Bool)

(declare-fun res!327546 () Bool)

(assert (=> b!532057 (=> (not res!327546) (not e!309823))))

(declare-datatypes ((array!33726 0))(
  ( (array!33727 (arr!16205 (Array (_ BitVec 32) (_ BitVec 64))) (size!16569 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33726)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33726 (_ BitVec 32)) Bool)

(assert (=> b!532057 (= res!327546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532058 () Bool)

(declare-fun res!327553 () Bool)

(assert (=> b!532058 (=> (not res!327553) (not e!309825))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!532058 (= res!327553 (validKeyInArray!0 (select (arr!16205 a!3154) j!147)))))

(declare-fun b!532059 () Bool)

(declare-fun res!327547 () Bool)

(assert (=> b!532059 (=> (not res!327547) (not e!309823))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!532059 (= res!327547 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16569 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16569 a!3154)) (= (select (arr!16205 a!3154) resIndex!32) (select (arr!16205 a!3154) j!147))))))

(declare-fun res!327549 () Bool)

(assert (=> start!48418 (=> (not res!327549) (not e!309825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48418 (= res!327549 (validMask!0 mask!3216))))

(assert (=> start!48418 e!309825))

(assert (=> start!48418 true))

(declare-fun array_inv!12001 (array!33726) Bool)

(assert (=> start!48418 (array_inv!12001 a!3154)))

(declare-fun b!532060 () Bool)

(declare-fun res!327550 () Bool)

(assert (=> b!532060 (=> (not res!327550) (not e!309825))))

(declare-fun arrayContainsKey!0 (array!33726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532060 (= res!327550 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532061 () Bool)

(assert (=> b!532061 (= e!309825 e!309823)))

(declare-fun res!327552 () Bool)

(assert (=> b!532061 (=> (not res!327552) (not e!309823))))

(declare-datatypes ((SeekEntryResult!4663 0))(
  ( (MissingZero!4663 (index!20876 (_ BitVec 32))) (Found!4663 (index!20877 (_ BitVec 32))) (Intermediate!4663 (undefined!5475 Bool) (index!20878 (_ BitVec 32)) (x!49845 (_ BitVec 32))) (Undefined!4663) (MissingVacant!4663 (index!20879 (_ BitVec 32))) )
))
(declare-fun lt!245119 () SeekEntryResult!4663)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532061 (= res!327552 (or (= lt!245119 (MissingZero!4663 i!1153)) (= lt!245119 (MissingVacant!4663 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33726 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!532061 (= lt!245119 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532062 () Bool)

(declare-fun res!327554 () Bool)

(assert (=> b!532062 (=> (not res!327554) (not e!309823))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33726 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!532062 (= res!327554 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16205 a!3154) j!147) a!3154 mask!3216) (Intermediate!4663 false resIndex!32 resX!32)))))

(declare-fun b!532063 () Bool)

(declare-fun res!327545 () Bool)

(assert (=> b!532063 (=> (not res!327545) (not e!309823))))

(declare-datatypes ((List!10324 0))(
  ( (Nil!10321) (Cons!10320 (h!11260 (_ BitVec 64)) (t!16552 List!10324)) )
))
(declare-fun arrayNoDuplicates!0 (array!33726 (_ BitVec 32) List!10324) Bool)

(assert (=> b!532063 (= res!327545 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10321))))

(declare-fun b!532064 () Bool)

(declare-fun res!327548 () Bool)

(assert (=> b!532064 (=> (not res!327548) (not e!309825))))

(assert (=> b!532064 (= res!327548 (and (= (size!16569 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16569 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16569 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48418 res!327549) b!532064))

(assert (= (and b!532064 res!327548) b!532058))

(assert (= (and b!532058 res!327553) b!532055))

(assert (= (and b!532055 res!327551) b!532060))

(assert (= (and b!532060 res!327550) b!532061))

(assert (= (and b!532061 res!327552) b!532057))

(assert (= (and b!532057 res!327546) b!532063))

(assert (= (and b!532063 res!327545) b!532059))

(assert (= (and b!532059 res!327547) b!532062))

(assert (= (and b!532062 res!327554) b!532056))

(declare-fun m!512357 () Bool)

(assert (=> b!532057 m!512357))

(declare-fun m!512359 () Bool)

(assert (=> b!532060 m!512359))

(declare-fun m!512361 () Bool)

(assert (=> b!532061 m!512361))

(declare-fun m!512363 () Bool)

(assert (=> start!48418 m!512363))

(declare-fun m!512365 () Bool)

(assert (=> start!48418 m!512365))

(declare-fun m!512367 () Bool)

(assert (=> b!532063 m!512367))

(declare-fun m!512369 () Bool)

(assert (=> b!532055 m!512369))

(declare-fun m!512371 () Bool)

(assert (=> b!532062 m!512371))

(assert (=> b!532062 m!512371))

(declare-fun m!512373 () Bool)

(assert (=> b!532062 m!512373))

(declare-fun m!512375 () Bool)

(assert (=> b!532059 m!512375))

(assert (=> b!532059 m!512371))

(assert (=> b!532058 m!512371))

(assert (=> b!532058 m!512371))

(declare-fun m!512377 () Bool)

(assert (=> b!532058 m!512377))

(push 1)

(assert (not start!48418))

(assert (not b!532058))

(assert (not b!532062))

(assert (not b!532063))

(assert (not b!532061))

(assert (not b!532060))

(assert (not b!532055))

(assert (not b!532057))

(check-sat)

