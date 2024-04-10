; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85740 () Bool)

(assert start!85740)

(declare-fun b!994847 () Bool)

(declare-fun res!665357 () Bool)

(declare-fun e!561381 () Bool)

(assert (=> b!994847 (=> (not res!665357) (not e!561381))))

(declare-datatypes ((array!62946 0))(
  ( (array!62947 (arr!30312 (Array (_ BitVec 32) (_ BitVec 64))) (size!30814 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62946)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994847 (= res!665357 (and (= (size!30814 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30814 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30814 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665358 () Bool)

(assert (=> start!85740 (=> (not res!665358) (not e!561381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85740 (= res!665358 (validMask!0 mask!3464))))

(assert (=> start!85740 e!561381))

(declare-fun array_inv!23436 (array!62946) Bool)

(assert (=> start!85740 (array_inv!23436 a!3219)))

(assert (=> start!85740 true))

(declare-fun b!994848 () Bool)

(declare-fun res!665356 () Bool)

(assert (=> b!994848 (=> (not res!665356) (not e!561381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994848 (= res!665356 (validKeyInArray!0 (select (arr!30312 a!3219) j!170)))))

(declare-datatypes ((SeekEntryResult!9244 0))(
  ( (MissingZero!9244 (index!39347 (_ BitVec 32))) (Found!9244 (index!39348 (_ BitVec 32))) (Intermediate!9244 (undefined!10056 Bool) (index!39349 (_ BitVec 32)) (x!86789 (_ BitVec 32))) (Undefined!9244) (MissingVacant!9244 (index!39350 (_ BitVec 32))) )
))
(declare-fun lt!440777 () SeekEntryResult!9244)

(declare-fun b!994849 () Bool)

(assert (=> b!994849 (= e!561381 (and (or (= lt!440777 (MissingVacant!9244 i!1194)) (= lt!440777 (MissingZero!9244 i!1194))) (bvsgt #b00000000000000000000000000000000 (size!30814 a!3219))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62946 (_ BitVec 32)) SeekEntryResult!9244)

(assert (=> b!994849 (= lt!440777 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994850 () Bool)

(declare-fun res!665354 () Bool)

(assert (=> b!994850 (=> (not res!665354) (not e!561381))))

(declare-fun arrayContainsKey!0 (array!62946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994850 (= res!665354 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994851 () Bool)

(declare-fun res!665355 () Bool)

(assert (=> b!994851 (=> (not res!665355) (not e!561381))))

(assert (=> b!994851 (= res!665355 (validKeyInArray!0 k!2224))))

(assert (= (and start!85740 res!665358) b!994847))

(assert (= (and b!994847 res!665357) b!994848))

(assert (= (and b!994848 res!665356) b!994851))

(assert (= (and b!994851 res!665355) b!994850))

(assert (= (and b!994850 res!665354) b!994849))

(declare-fun m!922389 () Bool)

(assert (=> b!994851 m!922389))

(declare-fun m!922391 () Bool)

(assert (=> b!994850 m!922391))

(declare-fun m!922393 () Bool)

(assert (=> start!85740 m!922393))

(declare-fun m!922395 () Bool)

(assert (=> start!85740 m!922395))

(declare-fun m!922397 () Bool)

(assert (=> b!994849 m!922397))

(declare-fun m!922399 () Bool)

(assert (=> b!994848 m!922399))

(assert (=> b!994848 m!922399))

(declare-fun m!922401 () Bool)

(assert (=> b!994848 m!922401))

(push 1)

(assert (not b!994848))

(assert (not b!994851))

(assert (not start!85740))

(assert (not b!994849))

(assert (not b!994850))

(check-sat)

