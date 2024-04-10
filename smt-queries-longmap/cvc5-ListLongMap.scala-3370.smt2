; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46272 () Bool)

(assert start!46272)

(declare-fun b!512568 () Bool)

(declare-fun res!313238 () Bool)

(declare-fun e!299316 () Bool)

(assert (=> b!512568 (=> (not res!313238) (not e!299316))))

(declare-datatypes ((array!32926 0))(
  ( (array!32927 (arr!15840 (Array (_ BitVec 32) (_ BitVec 64))) (size!16204 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32926)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512568 (= res!313238 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512569 () Bool)

(declare-fun res!313235 () Bool)

(assert (=> b!512569 (=> (not res!313235) (not e!299316))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512569 (= res!313235 (and (= (size!16204 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16204 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16204 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512570 () Bool)

(declare-fun res!313234 () Bool)

(declare-fun e!299318 () Bool)

(assert (=> b!512570 (=> (not res!313234) (not e!299318))))

(declare-datatypes ((List!9998 0))(
  ( (Nil!9995) (Cons!9994 (h!10874 (_ BitVec 64)) (t!16226 List!9998)) )
))
(declare-fun arrayNoDuplicates!0 (array!32926 (_ BitVec 32) List!9998) Bool)

(assert (=> b!512570 (= res!313234 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9995))))

(declare-fun b!512571 () Bool)

(declare-fun res!313237 () Bool)

(assert (=> b!512571 (=> (not res!313237) (not e!299316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512571 (= res!313237 (validKeyInArray!0 k!2280))))

(declare-fun res!313233 () Bool)

(assert (=> start!46272 (=> (not res!313233) (not e!299316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46272 (= res!313233 (validMask!0 mask!3524))))

(assert (=> start!46272 e!299316))

(assert (=> start!46272 true))

(declare-fun array_inv!11636 (array!32926) Bool)

(assert (=> start!46272 (array_inv!11636 a!3235)))

(declare-fun b!512572 () Bool)

(declare-fun res!313232 () Bool)

(assert (=> b!512572 (=> (not res!313232) (not e!299318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32926 (_ BitVec 32)) Bool)

(assert (=> b!512572 (= res!313232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512573 () Bool)

(assert (=> b!512573 (= e!299316 e!299318)))

(declare-fun res!313231 () Bool)

(assert (=> b!512573 (=> (not res!313231) (not e!299318))))

(declare-datatypes ((SeekEntryResult!4307 0))(
  ( (MissingZero!4307 (index!19416 (_ BitVec 32))) (Found!4307 (index!19417 (_ BitVec 32))) (Intermediate!4307 (undefined!5119 Bool) (index!19418 (_ BitVec 32)) (x!48362 (_ BitVec 32))) (Undefined!4307) (MissingVacant!4307 (index!19419 (_ BitVec 32))) )
))
(declare-fun lt!234659 () SeekEntryResult!4307)

(assert (=> b!512573 (= res!313231 (or (= lt!234659 (MissingZero!4307 i!1204)) (= lt!234659 (MissingVacant!4307 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32926 (_ BitVec 32)) SeekEntryResult!4307)

(assert (=> b!512573 (= lt!234659 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512574 () Bool)

(declare-fun res!313236 () Bool)

(assert (=> b!512574 (=> (not res!313236) (not e!299316))))

(assert (=> b!512574 (= res!313236 (validKeyInArray!0 (select (arr!15840 a!3235) j!176)))))

(declare-fun b!512575 () Bool)

(declare-fun e!299317 () Bool)

(assert (=> b!512575 (= e!299317 (= (seekEntryOrOpen!0 (select (arr!15840 a!3235) j!176) a!3235 mask!3524) (Found!4307 j!176)))))

(declare-fun b!512576 () Bool)

(assert (=> b!512576 (= e!299318 (not true))))

(declare-fun lt!234661 () (_ BitVec 32))

(declare-fun lt!234660 () SeekEntryResult!4307)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32926 (_ BitVec 32)) SeekEntryResult!4307)

(assert (=> b!512576 (= lt!234660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234661 (select (store (arr!15840 a!3235) i!1204 k!2280) j!176) (array!32927 (store (arr!15840 a!3235) i!1204 k!2280) (size!16204 a!3235)) mask!3524))))

(declare-fun lt!234664 () SeekEntryResult!4307)

(declare-fun lt!234662 () (_ BitVec 32))

(assert (=> b!512576 (= lt!234664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234662 (select (arr!15840 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512576 (= lt!234661 (toIndex!0 (select (store (arr!15840 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512576 (= lt!234662 (toIndex!0 (select (arr!15840 a!3235) j!176) mask!3524))))

(assert (=> b!512576 e!299317))

(declare-fun res!313230 () Bool)

(assert (=> b!512576 (=> (not res!313230) (not e!299317))))

(assert (=> b!512576 (= res!313230 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15872 0))(
  ( (Unit!15873) )
))
(declare-fun lt!234663 () Unit!15872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15872)

(assert (=> b!512576 (= lt!234663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46272 res!313233) b!512569))

(assert (= (and b!512569 res!313235) b!512574))

(assert (= (and b!512574 res!313236) b!512571))

(assert (= (and b!512571 res!313237) b!512568))

(assert (= (and b!512568 res!313238) b!512573))

(assert (= (and b!512573 res!313231) b!512572))

(assert (= (and b!512572 res!313232) b!512570))

(assert (= (and b!512570 res!313234) b!512576))

(assert (= (and b!512576 res!313230) b!512575))

(declare-fun m!494253 () Bool)

(assert (=> b!512571 m!494253))

(declare-fun m!494255 () Bool)

(assert (=> start!46272 m!494255))

(declare-fun m!494257 () Bool)

(assert (=> start!46272 m!494257))

(declare-fun m!494259 () Bool)

(assert (=> b!512570 m!494259))

(declare-fun m!494261 () Bool)

(assert (=> b!512568 m!494261))

(declare-fun m!494263 () Bool)

(assert (=> b!512575 m!494263))

(assert (=> b!512575 m!494263))

(declare-fun m!494265 () Bool)

(assert (=> b!512575 m!494265))

(assert (=> b!512574 m!494263))

(assert (=> b!512574 m!494263))

(declare-fun m!494267 () Bool)

(assert (=> b!512574 m!494267))

(declare-fun m!494269 () Bool)

(assert (=> b!512576 m!494269))

(declare-fun m!494271 () Bool)

(assert (=> b!512576 m!494271))

(declare-fun m!494273 () Bool)

(assert (=> b!512576 m!494273))

(assert (=> b!512576 m!494263))

(declare-fun m!494275 () Bool)

(assert (=> b!512576 m!494275))

(assert (=> b!512576 m!494263))

(declare-fun m!494277 () Bool)

(assert (=> b!512576 m!494277))

(assert (=> b!512576 m!494263))

(declare-fun m!494279 () Bool)

(assert (=> b!512576 m!494279))

(assert (=> b!512576 m!494273))

(declare-fun m!494281 () Bool)

(assert (=> b!512576 m!494281))

(assert (=> b!512576 m!494273))

(declare-fun m!494283 () Bool)

(assert (=> b!512576 m!494283))

(declare-fun m!494285 () Bool)

(assert (=> b!512572 m!494285))

(declare-fun m!494287 () Bool)

(assert (=> b!512573 m!494287))

(push 1)

