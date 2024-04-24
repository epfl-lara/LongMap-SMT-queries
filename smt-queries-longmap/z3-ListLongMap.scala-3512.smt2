; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48634 () Bool)

(assert start!48634)

(declare-fun b!534265 () Bool)

(declare-fun e!310639 () Bool)

(assert (=> b!534265 (= e!310639 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33845 0))(
  ( (array!33846 (arr!16261 (Array (_ BitVec 32) (_ BitVec 64))) (size!16625 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33845)

(declare-datatypes ((SeekEntryResult!4675 0))(
  ( (MissingZero!4675 (index!20924 (_ BitVec 32))) (Found!4675 (index!20925 (_ BitVec 32))) (Intermediate!4675 (undefined!5487 Bool) (index!20926 (_ BitVec 32)) (x!50031 (_ BitVec 32))) (Undefined!4675) (MissingVacant!4675 (index!20927 (_ BitVec 32))) )
))
(declare-fun lt!245622 () SeekEntryResult!4675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33845 (_ BitVec 32)) SeekEntryResult!4675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534265 (= lt!245622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16261 a!3154) j!147) mask!3216) (select (arr!16261 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534266 () Bool)

(declare-fun res!329532 () Bool)

(declare-fun e!310641 () Bool)

(assert (=> b!534266 (=> (not res!329532) (not e!310641))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534266 (= res!329532 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534267 () Bool)

(declare-fun res!329531 () Bool)

(assert (=> b!534267 (=> (not res!329531) (not e!310639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33845 (_ BitVec 32)) Bool)

(assert (=> b!534267 (= res!329531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534268 () Bool)

(declare-fun res!329525 () Bool)

(assert (=> b!534268 (=> (not res!329525) (not e!310639))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!534268 (= res!329525 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16625 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16625 a!3154)) (= (select (arr!16261 a!3154) resIndex!32) (select (arr!16261 a!3154) j!147))))))

(declare-fun b!534269 () Bool)

(declare-fun res!329526 () Bool)

(assert (=> b!534269 (=> (not res!329526) (not e!310641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534269 (= res!329526 (validKeyInArray!0 k0!1998))))

(declare-fun b!534270 () Bool)

(declare-fun res!329530 () Bool)

(assert (=> b!534270 (=> (not res!329530) (not e!310641))))

(assert (=> b!534270 (= res!329530 (validKeyInArray!0 (select (arr!16261 a!3154) j!147)))))

(declare-fun b!534271 () Bool)

(declare-fun res!329529 () Bool)

(assert (=> b!534271 (=> (not res!329529) (not e!310639))))

(assert (=> b!534271 (= res!329529 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16261 a!3154) j!147) a!3154 mask!3216) (Intermediate!4675 false resIndex!32 resX!32)))))

(declare-fun b!534272 () Bool)

(declare-fun res!329528 () Bool)

(assert (=> b!534272 (=> (not res!329528) (not e!310639))))

(declare-datatypes ((List!10287 0))(
  ( (Nil!10284) (Cons!10283 (h!11226 (_ BitVec 64)) (t!16507 List!10287)) )
))
(declare-fun arrayNoDuplicates!0 (array!33845 (_ BitVec 32) List!10287) Bool)

(assert (=> b!534272 (= res!329528 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10284))))

(declare-fun res!329524 () Bool)

(assert (=> start!48634 (=> (not res!329524) (not e!310641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48634 (= res!329524 (validMask!0 mask!3216))))

(assert (=> start!48634 e!310641))

(assert (=> start!48634 true))

(declare-fun array_inv!12120 (array!33845) Bool)

(assert (=> start!48634 (array_inv!12120 a!3154)))

(declare-fun b!534273 () Bool)

(assert (=> b!534273 (= e!310641 e!310639)))

(declare-fun res!329527 () Bool)

(assert (=> b!534273 (=> (not res!329527) (not e!310639))))

(declare-fun lt!245623 () SeekEntryResult!4675)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534273 (= res!329527 (or (= lt!245623 (MissingZero!4675 i!1153)) (= lt!245623 (MissingVacant!4675 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33845 (_ BitVec 32)) SeekEntryResult!4675)

(assert (=> b!534273 (= lt!245623 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534274 () Bool)

(declare-fun res!329533 () Bool)

(assert (=> b!534274 (=> (not res!329533) (not e!310641))))

(assert (=> b!534274 (= res!329533 (and (= (size!16625 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16625 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16625 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48634 res!329524) b!534274))

(assert (= (and b!534274 res!329533) b!534270))

(assert (= (and b!534270 res!329530) b!534269))

(assert (= (and b!534269 res!329526) b!534266))

(assert (= (and b!534266 res!329532) b!534273))

(assert (= (and b!534273 res!329527) b!534267))

(assert (= (and b!534267 res!329531) b!534272))

(assert (= (and b!534272 res!329528) b!534268))

(assert (= (and b!534268 res!329525) b!534271))

(assert (= (and b!534271 res!329529) b!534265))

(declare-fun m!514243 () Bool)

(assert (=> b!534272 m!514243))

(declare-fun m!514245 () Bool)

(assert (=> b!534270 m!514245))

(assert (=> b!534270 m!514245))

(declare-fun m!514247 () Bool)

(assert (=> b!534270 m!514247))

(declare-fun m!514249 () Bool)

(assert (=> b!534273 m!514249))

(assert (=> b!534271 m!514245))

(assert (=> b!534271 m!514245))

(declare-fun m!514251 () Bool)

(assert (=> b!534271 m!514251))

(declare-fun m!514253 () Bool)

(assert (=> b!534269 m!514253))

(declare-fun m!514255 () Bool)

(assert (=> b!534267 m!514255))

(declare-fun m!514257 () Bool)

(assert (=> start!48634 m!514257))

(declare-fun m!514259 () Bool)

(assert (=> start!48634 m!514259))

(assert (=> b!534265 m!514245))

(assert (=> b!534265 m!514245))

(declare-fun m!514261 () Bool)

(assert (=> b!534265 m!514261))

(assert (=> b!534265 m!514261))

(assert (=> b!534265 m!514245))

(declare-fun m!514263 () Bool)

(assert (=> b!534265 m!514263))

(declare-fun m!514265 () Bool)

(assert (=> b!534266 m!514265))

(declare-fun m!514267 () Bool)

(assert (=> b!534268 m!514267))

(assert (=> b!534268 m!514245))

(check-sat (not b!534265) (not b!534271) (not b!534273) (not b!534269) (not b!534266) (not b!534272) (not b!534267) (not b!534270) (not start!48634))
(check-sat)
