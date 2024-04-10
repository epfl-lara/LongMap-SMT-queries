; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48568 () Bool)

(assert start!48568)

(declare-fun b!533235 () Bool)

(declare-fun res!328444 () Bool)

(declare-fun e!310345 () Bool)

(assert (=> b!533235 (=> (not res!328444) (not e!310345))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33780 0))(
  ( (array!33781 (arr!16229 (Array (_ BitVec 32) (_ BitVec 64))) (size!16593 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33780)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533235 (= res!328444 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16593 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16593 a!3154)) (= (select (arr!16229 a!3154) resIndex!32) (select (arr!16229 a!3154) j!147))))))

(declare-fun b!533236 () Bool)

(declare-fun res!328441 () Bool)

(declare-fun e!310347 () Bool)

(assert (=> b!533236 (=> (not res!328441) (not e!310347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533236 (= res!328441 (validKeyInArray!0 (select (arr!16229 a!3154) j!147)))))

(declare-fun b!533237 () Bool)

(assert (=> b!533237 (= e!310347 e!310345)))

(declare-fun res!328448 () Bool)

(assert (=> b!533237 (=> (not res!328448) (not e!310345))))

(declare-datatypes ((SeekEntryResult!4687 0))(
  ( (MissingZero!4687 (index!20972 (_ BitVec 32))) (Found!4687 (index!20973 (_ BitVec 32))) (Intermediate!4687 (undefined!5499 Bool) (index!20974 (_ BitVec 32)) (x!49942 (_ BitVec 32))) (Undefined!4687) (MissingVacant!4687 (index!20975 (_ BitVec 32))) )
))
(declare-fun lt!245415 () SeekEntryResult!4687)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533237 (= res!328448 (or (= lt!245415 (MissingZero!4687 i!1153)) (= lt!245415 (MissingVacant!4687 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33780 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!533237 (= lt!245415 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533238 () Bool)

(declare-fun res!328443 () Bool)

(assert (=> b!533238 (=> (not res!328443) (not e!310345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33780 (_ BitVec 32)) Bool)

(assert (=> b!533238 (= res!328443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328440 () Bool)

(assert (=> start!48568 (=> (not res!328440) (not e!310347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48568 (= res!328440 (validMask!0 mask!3216))))

(assert (=> start!48568 e!310347))

(assert (=> start!48568 true))

(declare-fun array_inv!12025 (array!33780) Bool)

(assert (=> start!48568 (array_inv!12025 a!3154)))

(declare-fun b!533239 () Bool)

(declare-fun res!328442 () Bool)

(assert (=> b!533239 (=> (not res!328442) (not e!310347))))

(assert (=> b!533239 (= res!328442 (validKeyInArray!0 k!1998))))

(declare-fun b!533240 () Bool)

(declare-fun res!328445 () Bool)

(assert (=> b!533240 (=> (not res!328445) (not e!310347))))

(declare-fun arrayContainsKey!0 (array!33780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533240 (= res!328445 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533241 () Bool)

(declare-fun res!328447 () Bool)

(assert (=> b!533241 (=> (not res!328447) (not e!310347))))

(assert (=> b!533241 (= res!328447 (and (= (size!16593 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16593 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16593 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533242 () Bool)

(declare-fun res!328446 () Bool)

(assert (=> b!533242 (=> (not res!328446) (not e!310345))))

(declare-datatypes ((List!10348 0))(
  ( (Nil!10345) (Cons!10344 (h!11287 (_ BitVec 64)) (t!16576 List!10348)) )
))
(declare-fun arrayNoDuplicates!0 (array!33780 (_ BitVec 32) List!10348) Bool)

(assert (=> b!533242 (= res!328446 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10345))))

(declare-fun b!533243 () Bool)

(assert (=> b!533243 (= e!310345 false)))

(declare-fun lt!245416 () SeekEntryResult!4687)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33780 (_ BitVec 32)) SeekEntryResult!4687)

(assert (=> b!533243 (= lt!245416 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16229 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48568 res!328440) b!533241))

(assert (= (and b!533241 res!328447) b!533236))

(assert (= (and b!533236 res!328441) b!533239))

(assert (= (and b!533239 res!328442) b!533240))

(assert (= (and b!533240 res!328445) b!533237))

(assert (= (and b!533237 res!328448) b!533238))

(assert (= (and b!533238 res!328443) b!533242))

(assert (= (and b!533242 res!328446) b!533235))

(assert (= (and b!533235 res!328444) b!533243))

(declare-fun m!513161 () Bool)

(assert (=> b!533238 m!513161))

(declare-fun m!513163 () Bool)

(assert (=> b!533243 m!513163))

(assert (=> b!533243 m!513163))

(declare-fun m!513165 () Bool)

(assert (=> b!533243 m!513165))

(declare-fun m!513167 () Bool)

(assert (=> b!533242 m!513167))

(declare-fun m!513169 () Bool)

(assert (=> b!533239 m!513169))

(declare-fun m!513171 () Bool)

(assert (=> b!533237 m!513171))

(declare-fun m!513173 () Bool)

(assert (=> b!533240 m!513173))

(declare-fun m!513175 () Bool)

(assert (=> b!533235 m!513175))

(assert (=> b!533235 m!513163))

(assert (=> b!533236 m!513163))

(assert (=> b!533236 m!513163))

(declare-fun m!513177 () Bool)

(assert (=> b!533236 m!513177))

(declare-fun m!513179 () Bool)

(assert (=> start!48568 m!513179))

(declare-fun m!513181 () Bool)

(assert (=> start!48568 m!513181))

(push 1)

(assert (not b!533240))

(assert (not b!533242))

(assert (not b!533237))

(assert (not b!533236))

(assert (not start!48568))

(assert (not b!533239))

(assert (not b!533238))

(assert (not b!533243))

(check-sat)

