; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49066 () Bool)

(assert start!49066)

(declare-fun b!540376 () Bool)

(declare-fun res!335317 () Bool)

(declare-fun e!313118 () Bool)

(assert (=> b!540376 (=> (not res!335317) (not e!313118))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34175 0))(
  ( (array!34176 (arr!16423 (Array (_ BitVec 32) (_ BitVec 64))) (size!16787 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34175)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540376 (= res!335317 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16787 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16787 a!3154)) (= (select (arr!16423 a!3154) resIndex!32) (select (arr!16423 a!3154) j!147))))))

(declare-fun b!540377 () Bool)

(declare-fun res!335325 () Bool)

(declare-fun e!313117 () Bool)

(assert (=> b!540377 (=> (not res!335325) (not e!313117))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540377 (= res!335325 (and (= (size!16787 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16787 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16787 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335319 () Bool)

(assert (=> start!49066 (=> (not res!335319) (not e!313117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49066 (= res!335319 (validMask!0 mask!3216))))

(assert (=> start!49066 e!313117))

(assert (=> start!49066 true))

(declare-fun array_inv!12282 (array!34175) Bool)

(assert (=> start!49066 (array_inv!12282 a!3154)))

(declare-fun b!540378 () Bool)

(assert (=> b!540378 (= e!313117 e!313118)))

(declare-fun res!335326 () Bool)

(assert (=> b!540378 (=> (not res!335326) (not e!313118))))

(declare-datatypes ((SeekEntryResult!4837 0))(
  ( (MissingZero!4837 (index!21572 (_ BitVec 32))) (Found!4837 (index!21573 (_ BitVec 32))) (Intermediate!4837 (undefined!5649 Bool) (index!21574 (_ BitVec 32)) (x!50637 (_ BitVec 32))) (Undefined!4837) (MissingVacant!4837 (index!21575 (_ BitVec 32))) )
))
(declare-fun lt!247434 () SeekEntryResult!4837)

(assert (=> b!540378 (= res!335326 (or (= lt!247434 (MissingZero!4837 i!1153)) (= lt!247434 (MissingVacant!4837 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34175 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!540378 (= lt!247434 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540379 () Bool)

(declare-fun res!335323 () Bool)

(assert (=> b!540379 (=> (not res!335323) (not e!313118))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34175 (_ BitVec 32)) SeekEntryResult!4837)

(assert (=> b!540379 (= res!335323 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16423 a!3154) j!147) a!3154 mask!3216) (Intermediate!4837 false resIndex!32 resX!32)))))

(declare-fun b!540380 () Bool)

(declare-fun res!335324 () Bool)

(assert (=> b!540380 (=> (not res!335324) (not e!313117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540380 (= res!335324 (validKeyInArray!0 (select (arr!16423 a!3154) j!147)))))

(declare-fun b!540381 () Bool)

(declare-fun res!335320 () Bool)

(assert (=> b!540381 (=> (not res!335320) (not e!313117))))

(assert (=> b!540381 (= res!335320 (validKeyInArray!0 k0!1998))))

(declare-fun b!540382 () Bool)

(assert (=> b!540382 (= e!313118 false)))

(declare-fun lt!247435 () SeekEntryResult!4837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540382 (= lt!247435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16423 a!3154) j!147) mask!3216) (select (arr!16423 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540383 () Bool)

(declare-fun res!335321 () Bool)

(assert (=> b!540383 (=> (not res!335321) (not e!313117))))

(declare-fun arrayContainsKey!0 (array!34175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540383 (= res!335321 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540384 () Bool)

(declare-fun res!335318 () Bool)

(assert (=> b!540384 (=> (not res!335318) (not e!313118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34175 (_ BitVec 32)) Bool)

(assert (=> b!540384 (= res!335318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540385 () Bool)

(declare-fun res!335322 () Bool)

(assert (=> b!540385 (=> (not res!335322) (not e!313118))))

(declare-datatypes ((List!10449 0))(
  ( (Nil!10446) (Cons!10445 (h!11394 (_ BitVec 64)) (t!16669 List!10449)) )
))
(declare-fun arrayNoDuplicates!0 (array!34175 (_ BitVec 32) List!10449) Bool)

(assert (=> b!540385 (= res!335322 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10446))))

(assert (= (and start!49066 res!335319) b!540377))

(assert (= (and b!540377 res!335325) b!540380))

(assert (= (and b!540380 res!335324) b!540381))

(assert (= (and b!540381 res!335320) b!540383))

(assert (= (and b!540383 res!335321) b!540378))

(assert (= (and b!540378 res!335326) b!540384))

(assert (= (and b!540384 res!335318) b!540385))

(assert (= (and b!540385 res!335322) b!540376))

(assert (= (and b!540376 res!335317) b!540379))

(assert (= (and b!540379 res!335323) b!540382))

(declare-fun m!519331 () Bool)

(assert (=> b!540382 m!519331))

(assert (=> b!540382 m!519331))

(declare-fun m!519333 () Bool)

(assert (=> b!540382 m!519333))

(assert (=> b!540382 m!519333))

(assert (=> b!540382 m!519331))

(declare-fun m!519335 () Bool)

(assert (=> b!540382 m!519335))

(assert (=> b!540379 m!519331))

(assert (=> b!540379 m!519331))

(declare-fun m!519337 () Bool)

(assert (=> b!540379 m!519337))

(declare-fun m!519339 () Bool)

(assert (=> b!540385 m!519339))

(declare-fun m!519341 () Bool)

(assert (=> b!540378 m!519341))

(declare-fun m!519343 () Bool)

(assert (=> b!540383 m!519343))

(declare-fun m!519345 () Bool)

(assert (=> start!49066 m!519345))

(declare-fun m!519347 () Bool)

(assert (=> start!49066 m!519347))

(assert (=> b!540380 m!519331))

(assert (=> b!540380 m!519331))

(declare-fun m!519349 () Bool)

(assert (=> b!540380 m!519349))

(declare-fun m!519351 () Bool)

(assert (=> b!540376 m!519351))

(assert (=> b!540376 m!519331))

(declare-fun m!519353 () Bool)

(assert (=> b!540381 m!519353))

(declare-fun m!519355 () Bool)

(assert (=> b!540384 m!519355))

(check-sat (not b!540381) (not b!540379) (not start!49066) (not b!540380) (not b!540382) (not b!540384) (not b!540385) (not b!540383) (not b!540378))
(check-sat)
