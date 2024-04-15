; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49176 () Bool)

(assert start!49176)

(declare-fun b!541345 () Bool)

(declare-fun res!336221 () Bool)

(declare-fun e!313438 () Bool)

(assert (=> b!541345 (=> (not res!336221) (not e!313438))))

(declare-datatypes ((array!34245 0))(
  ( (array!34246 (arr!16457 (Array (_ BitVec 32) (_ BitVec 64))) (size!16822 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34245)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34245 (_ BitVec 32)) Bool)

(assert (=> b!541345 (= res!336221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!336219 () Bool)

(declare-fun e!313440 () Bool)

(assert (=> start!49176 (=> (not res!336219) (not e!313440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49176 (= res!336219 (validMask!0 mask!3216))))

(assert (=> start!49176 e!313440))

(assert (=> start!49176 true))

(declare-fun array_inv!12340 (array!34245) Bool)

(assert (=> start!49176 (array_inv!12340 a!3154)))

(declare-fun b!541346 () Bool)

(declare-fun res!336224 () Bool)

(assert (=> b!541346 (=> (not res!336224) (not e!313440))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541346 (= res!336224 (validKeyInArray!0 k0!1998))))

(declare-fun b!541347 () Bool)

(declare-fun res!336217 () Bool)

(assert (=> b!541347 (=> (not res!336217) (not e!313440))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541347 (= res!336217 (and (= (size!16822 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16822 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16822 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541348 () Bool)

(assert (=> b!541348 (= e!313438 false)))

(declare-datatypes ((SeekEntryResult!4912 0))(
  ( (MissingZero!4912 (index!21872 (_ BitVec 32))) (Found!4912 (index!21873 (_ BitVec 32))) (Intermediate!4912 (undefined!5724 Bool) (index!21874 (_ BitVec 32)) (x!50796 (_ BitVec 32))) (Undefined!4912) (MissingVacant!4912 (index!21875 (_ BitVec 32))) )
))
(declare-fun lt!247464 () SeekEntryResult!4912)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34245 (_ BitVec 32)) SeekEntryResult!4912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541348 (= lt!247464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16457 a!3154) j!147) mask!3216) (select (arr!16457 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541349 () Bool)

(declare-fun res!336220 () Bool)

(assert (=> b!541349 (=> (not res!336220) (not e!313438))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!541349 (= res!336220 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16457 a!3154) j!147) a!3154 mask!3216) (Intermediate!4912 false resIndex!32 resX!32)))))

(declare-fun b!541350 () Bool)

(declare-fun res!336222 () Bool)

(assert (=> b!541350 (=> (not res!336222) (not e!313438))))

(assert (=> b!541350 (= res!336222 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16822 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16822 a!3154)) (= (select (arr!16457 a!3154) resIndex!32) (select (arr!16457 a!3154) j!147))))))

(declare-fun b!541351 () Bool)

(declare-fun res!336215 () Bool)

(assert (=> b!541351 (=> (not res!336215) (not e!313438))))

(declare-datatypes ((List!10615 0))(
  ( (Nil!10612) (Cons!10611 (h!11563 (_ BitVec 64)) (t!16834 List!10615)) )
))
(declare-fun arrayNoDuplicates!0 (array!34245 (_ BitVec 32) List!10615) Bool)

(assert (=> b!541351 (= res!336215 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10612))))

(declare-fun b!541352 () Bool)

(declare-fun res!336218 () Bool)

(assert (=> b!541352 (=> (not res!336218) (not e!313440))))

(assert (=> b!541352 (= res!336218 (validKeyInArray!0 (select (arr!16457 a!3154) j!147)))))

(declare-fun b!541353 () Bool)

(declare-fun res!336216 () Bool)

(assert (=> b!541353 (=> (not res!336216) (not e!313440))))

(declare-fun arrayContainsKey!0 (array!34245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541353 (= res!336216 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541354 () Bool)

(assert (=> b!541354 (= e!313440 e!313438)))

(declare-fun res!336223 () Bool)

(assert (=> b!541354 (=> (not res!336223) (not e!313438))))

(declare-fun lt!247465 () SeekEntryResult!4912)

(assert (=> b!541354 (= res!336223 (or (= lt!247465 (MissingZero!4912 i!1153)) (= lt!247465 (MissingVacant!4912 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34245 (_ BitVec 32)) SeekEntryResult!4912)

(assert (=> b!541354 (= lt!247465 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49176 res!336219) b!541347))

(assert (= (and b!541347 res!336217) b!541352))

(assert (= (and b!541352 res!336218) b!541346))

(assert (= (and b!541346 res!336224) b!541353))

(assert (= (and b!541353 res!336216) b!541354))

(assert (= (and b!541354 res!336223) b!541345))

(assert (= (and b!541345 res!336221) b!541351))

(assert (= (and b!541351 res!336215) b!541350))

(assert (= (and b!541350 res!336222) b!541349))

(assert (= (and b!541349 res!336220) b!541348))

(declare-fun m!519325 () Bool)

(assert (=> b!541351 m!519325))

(declare-fun m!519327 () Bool)

(assert (=> b!541350 m!519327))

(declare-fun m!519329 () Bool)

(assert (=> b!541350 m!519329))

(assert (=> b!541348 m!519329))

(assert (=> b!541348 m!519329))

(declare-fun m!519331 () Bool)

(assert (=> b!541348 m!519331))

(assert (=> b!541348 m!519331))

(assert (=> b!541348 m!519329))

(declare-fun m!519333 () Bool)

(assert (=> b!541348 m!519333))

(declare-fun m!519335 () Bool)

(assert (=> b!541345 m!519335))

(assert (=> b!541352 m!519329))

(assert (=> b!541352 m!519329))

(declare-fun m!519337 () Bool)

(assert (=> b!541352 m!519337))

(declare-fun m!519339 () Bool)

(assert (=> b!541346 m!519339))

(assert (=> b!541349 m!519329))

(assert (=> b!541349 m!519329))

(declare-fun m!519341 () Bool)

(assert (=> b!541349 m!519341))

(declare-fun m!519343 () Bool)

(assert (=> start!49176 m!519343))

(declare-fun m!519345 () Bool)

(assert (=> start!49176 m!519345))

(declare-fun m!519347 () Bool)

(assert (=> b!541353 m!519347))

(declare-fun m!519349 () Bool)

(assert (=> b!541354 m!519349))

(check-sat (not b!541346) (not b!541349) (not b!541348) (not b!541345) (not b!541352) (not b!541351) (not start!49176) (not b!541353) (not b!541354))
(check-sat)
