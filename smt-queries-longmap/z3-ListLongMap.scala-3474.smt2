; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48178 () Bool)

(assert start!48178)

(declare-fun b!530525 () Bool)

(declare-fun res!326287 () Bool)

(declare-fun e!309083 () Bool)

(assert (=> b!530525 (=> (not res!326287) (not e!309083))))

(declare-datatypes ((array!33602 0))(
  ( (array!33603 (arr!16147 (Array (_ BitVec 32) (_ BitVec 64))) (size!16511 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33602)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530525 (= res!326287 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530526 () Bool)

(declare-fun res!326289 () Bool)

(assert (=> b!530526 (=> (not res!326289) (not e!309083))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530526 (= res!326289 (validKeyInArray!0 (select (arr!16147 a!3154) j!147)))))

(declare-fun b!530527 () Bool)

(declare-fun res!326286 () Bool)

(assert (=> b!530527 (=> (not res!326286) (not e!309083))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530527 (= res!326286 (and (= (size!16511 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16511 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16511 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530528 () Bool)

(assert (=> b!530528 (= e!309083 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530529 () Bool)

(declare-fun res!326288 () Bool)

(assert (=> b!530529 (=> (not res!326288) (not e!309083))))

(declare-datatypes ((SeekEntryResult!4561 0))(
  ( (MissingZero!4561 (index!20468 (_ BitVec 32))) (Found!4561 (index!20469 (_ BitVec 32))) (Intermediate!4561 (undefined!5373 Bool) (index!20470 (_ BitVec 32)) (x!49604 (_ BitVec 32))) (Undefined!4561) (MissingVacant!4561 (index!20471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33602 (_ BitVec 32)) SeekEntryResult!4561)

(assert (=> b!530529 (= res!326288 (not (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) (MissingZero!4561 i!1153))))))

(declare-fun b!530530 () Bool)

(declare-fun res!326290 () Bool)

(assert (=> b!530530 (=> (not res!326290) (not e!309083))))

(assert (=> b!530530 (= res!326290 (validKeyInArray!0 k0!1998))))

(declare-fun res!326285 () Bool)

(assert (=> start!48178 (=> (not res!326285) (not e!309083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48178 (= res!326285 (validMask!0 mask!3216))))

(assert (=> start!48178 e!309083))

(assert (=> start!48178 true))

(declare-fun array_inv!12006 (array!33602) Bool)

(assert (=> start!48178 (array_inv!12006 a!3154)))

(assert (= (and start!48178 res!326285) b!530527))

(assert (= (and b!530527 res!326286) b!530526))

(assert (= (and b!530526 res!326289) b!530530))

(assert (= (and b!530530 res!326290) b!530525))

(assert (= (and b!530525 res!326287) b!530529))

(assert (= (and b!530529 res!326288) b!530528))

(declare-fun m!511339 () Bool)

(assert (=> b!530526 m!511339))

(assert (=> b!530526 m!511339))

(declare-fun m!511341 () Bool)

(assert (=> b!530526 m!511341))

(declare-fun m!511343 () Bool)

(assert (=> b!530530 m!511343))

(declare-fun m!511345 () Bool)

(assert (=> b!530529 m!511345))

(declare-fun m!511347 () Bool)

(assert (=> b!530525 m!511347))

(declare-fun m!511349 () Bool)

(assert (=> start!48178 m!511349))

(declare-fun m!511351 () Bool)

(assert (=> start!48178 m!511351))

(check-sat (not b!530529) (not b!530530) (not b!530526) (not start!48178) (not b!530525))
(check-sat)
