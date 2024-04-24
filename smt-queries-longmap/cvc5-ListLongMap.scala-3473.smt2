; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48176 () Bool)

(assert start!48176)

(declare-fun b!530508 () Bool)

(declare-fun e!309078 () Bool)

(assert (=> b!530508 (= e!309078 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33600 0))(
  ( (array!33601 (arr!16146 (Array (_ BitVec 32) (_ BitVec 64))) (size!16510 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33600)

(declare-datatypes ((SeekEntryResult!4560 0))(
  ( (MissingZero!4560 (index!20464 (_ BitVec 32))) (Found!4560 (index!20465 (_ BitVec 32))) (Intermediate!4560 (undefined!5372 Bool) (index!20466 (_ BitVec 32)) (x!49595 (_ BitVec 32))) (Undefined!4560) (MissingVacant!4560 (index!20467 (_ BitVec 32))) )
))
(declare-fun lt!244777 () SeekEntryResult!4560)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33600 (_ BitVec 32)) SeekEntryResult!4560)

(assert (=> b!530508 (= lt!244777 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530509 () Bool)

(declare-fun res!326271 () Bool)

(assert (=> b!530509 (=> (not res!326271) (not e!309078))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530509 (= res!326271 (validKeyInArray!0 (select (arr!16146 a!3154) j!147)))))

(declare-fun b!530510 () Bool)

(declare-fun res!326270 () Bool)

(assert (=> b!530510 (=> (not res!326270) (not e!309078))))

(assert (=> b!530510 (= res!326270 (validKeyInArray!0 k!1998))))

(declare-fun b!530511 () Bool)

(declare-fun res!326269 () Bool)

(assert (=> b!530511 (=> (not res!326269) (not e!309078))))

(declare-fun arrayContainsKey!0 (array!33600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530511 (= res!326269 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!326268 () Bool)

(assert (=> start!48176 (=> (not res!326268) (not e!309078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48176 (= res!326268 (validMask!0 mask!3216))))

(assert (=> start!48176 e!309078))

(assert (=> start!48176 true))

(declare-fun array_inv!12005 (array!33600) Bool)

(assert (=> start!48176 (array_inv!12005 a!3154)))

(declare-fun b!530512 () Bool)

(declare-fun res!326272 () Bool)

(assert (=> b!530512 (=> (not res!326272) (not e!309078))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530512 (= res!326272 (and (= (size!16510 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16510 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16510 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48176 res!326268) b!530512))

(assert (= (and b!530512 res!326272) b!530509))

(assert (= (and b!530509 res!326271) b!530510))

(assert (= (and b!530510 res!326270) b!530511))

(assert (= (and b!530511 res!326269) b!530508))

(declare-fun m!511325 () Bool)

(assert (=> b!530511 m!511325))

(declare-fun m!511327 () Bool)

(assert (=> start!48176 m!511327))

(declare-fun m!511329 () Bool)

(assert (=> start!48176 m!511329))

(declare-fun m!511331 () Bool)

(assert (=> b!530509 m!511331))

(assert (=> b!530509 m!511331))

(declare-fun m!511333 () Bool)

(assert (=> b!530509 m!511333))

(declare-fun m!511335 () Bool)

(assert (=> b!530508 m!511335))

(declare-fun m!511337 () Bool)

(assert (=> b!530510 m!511337))

(push 1)

(assert (not b!530509))

(assert (not b!530511))

(assert (not start!48176))

(assert (not b!530510))

(assert (not b!530508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

