; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46070 () Bool)

(assert start!46070)

(declare-fun b!510243 () Bool)

(declare-fun e!298280 () Bool)

(assert (=> b!510243 (= e!298280 true)))

(declare-datatypes ((array!32781 0))(
  ( (array!32782 (arr!15769 (Array (_ BitVec 32) (_ BitVec 64))) (size!16133 (_ BitVec 32))) )
))
(declare-fun lt!233257 () array!32781)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233254 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4236 0))(
  ( (MissingZero!4236 (index!19132 (_ BitVec 32))) (Found!4236 (index!19133 (_ BitVec 32))) (Intermediate!4236 (undefined!5048 Bool) (index!19134 (_ BitVec 32)) (x!48093 (_ BitVec 32))) (Undefined!4236) (MissingVacant!4236 (index!19135 (_ BitVec 32))) )
))
(declare-fun lt!233256 () SeekEntryResult!4236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32781 (_ BitVec 32)) SeekEntryResult!4236)

(assert (=> b!510243 (= lt!233256 (seekEntryOrOpen!0 lt!233254 lt!233257 mask!3524))))

(declare-datatypes ((Unit!15730 0))(
  ( (Unit!15731) )
))
(declare-fun lt!233253 () Unit!15730)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32781)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32781 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15730)

(assert (=> b!510243 (= lt!233253 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510244 () Bool)

(declare-fun e!298278 () Bool)

(assert (=> b!510244 (= e!298278 (not e!298280))))

(declare-fun res!311092 () Bool)

(assert (=> b!510244 (=> res!311092 e!298280)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32781 (_ BitVec 32)) SeekEntryResult!4236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510244 (= res!311092 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15769 a!3235) j!176) mask!3524) (select (arr!15769 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233254 mask!3524) lt!233254 lt!233257 mask!3524))))))

(assert (=> b!510244 (= lt!233254 (select (store (arr!15769 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510244 (= lt!233257 (array!32782 (store (arr!15769 a!3235) i!1204 k0!2280) (size!16133 a!3235)))))

(assert (=> b!510244 (= lt!233256 (Found!4236 j!176))))

(assert (=> b!510244 (= lt!233256 (seekEntryOrOpen!0 (select (arr!15769 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32781 (_ BitVec 32)) Bool)

(assert (=> b!510244 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233255 () Unit!15730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15730)

(assert (=> b!510244 (= lt!233255 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510245 () Bool)

(declare-fun res!311088 () Bool)

(declare-fun e!298281 () Bool)

(assert (=> b!510245 (=> (not res!311088) (not e!298281))))

(assert (=> b!510245 (= res!311088 (and (= (size!16133 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16133 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16133 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311095 () Bool)

(assert (=> start!46070 (=> (not res!311095) (not e!298281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46070 (= res!311095 (validMask!0 mask!3524))))

(assert (=> start!46070 e!298281))

(assert (=> start!46070 true))

(declare-fun array_inv!11565 (array!32781) Bool)

(assert (=> start!46070 (array_inv!11565 a!3235)))

(declare-fun b!510246 () Bool)

(declare-fun res!311089 () Bool)

(assert (=> b!510246 (=> (not res!311089) (not e!298278))))

(declare-datatypes ((List!9927 0))(
  ( (Nil!9924) (Cons!9923 (h!10800 (_ BitVec 64)) (t!16155 List!9927)) )
))
(declare-fun arrayNoDuplicates!0 (array!32781 (_ BitVec 32) List!9927) Bool)

(assert (=> b!510246 (= res!311089 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9924))))

(declare-fun b!510247 () Bool)

(declare-fun res!311096 () Bool)

(assert (=> b!510247 (=> (not res!311096) (not e!298278))))

(assert (=> b!510247 (= res!311096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510248 () Bool)

(declare-fun res!311094 () Bool)

(assert (=> b!510248 (=> (not res!311094) (not e!298281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510248 (= res!311094 (validKeyInArray!0 k0!2280))))

(declare-fun b!510249 () Bool)

(assert (=> b!510249 (= e!298281 e!298278)))

(declare-fun res!311091 () Bool)

(assert (=> b!510249 (=> (not res!311091) (not e!298278))))

(declare-fun lt!233252 () SeekEntryResult!4236)

(assert (=> b!510249 (= res!311091 (or (= lt!233252 (MissingZero!4236 i!1204)) (= lt!233252 (MissingVacant!4236 i!1204))))))

(assert (=> b!510249 (= lt!233252 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510250 () Bool)

(declare-fun res!311090 () Bool)

(assert (=> b!510250 (=> (not res!311090) (not e!298281))))

(declare-fun arrayContainsKey!0 (array!32781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510250 (= res!311090 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510251 () Bool)

(declare-fun res!311093 () Bool)

(assert (=> b!510251 (=> (not res!311093) (not e!298281))))

(assert (=> b!510251 (= res!311093 (validKeyInArray!0 (select (arr!15769 a!3235) j!176)))))

(assert (= (and start!46070 res!311095) b!510245))

(assert (= (and b!510245 res!311088) b!510251))

(assert (= (and b!510251 res!311093) b!510248))

(assert (= (and b!510248 res!311094) b!510250))

(assert (= (and b!510250 res!311090) b!510249))

(assert (= (and b!510249 res!311091) b!510247))

(assert (= (and b!510247 res!311096) b!510246))

(assert (= (and b!510246 res!311089) b!510244))

(assert (= (and b!510244 (not res!311092)) b!510243))

(declare-fun m!491413 () Bool)

(assert (=> b!510247 m!491413))

(declare-fun m!491415 () Bool)

(assert (=> start!46070 m!491415))

(declare-fun m!491417 () Bool)

(assert (=> start!46070 m!491417))

(declare-fun m!491419 () Bool)

(assert (=> b!510250 m!491419))

(declare-fun m!491421 () Bool)

(assert (=> b!510248 m!491421))

(declare-fun m!491423 () Bool)

(assert (=> b!510246 m!491423))

(declare-fun m!491425 () Bool)

(assert (=> b!510249 m!491425))

(declare-fun m!491427 () Bool)

(assert (=> b!510251 m!491427))

(assert (=> b!510251 m!491427))

(declare-fun m!491429 () Bool)

(assert (=> b!510251 m!491429))

(declare-fun m!491431 () Bool)

(assert (=> b!510244 m!491431))

(declare-fun m!491433 () Bool)

(assert (=> b!510244 m!491433))

(declare-fun m!491435 () Bool)

(assert (=> b!510244 m!491435))

(declare-fun m!491437 () Bool)

(assert (=> b!510244 m!491437))

(declare-fun m!491439 () Bool)

(assert (=> b!510244 m!491439))

(assert (=> b!510244 m!491427))

(declare-fun m!491441 () Bool)

(assert (=> b!510244 m!491441))

(assert (=> b!510244 m!491427))

(assert (=> b!510244 m!491439))

(assert (=> b!510244 m!491427))

(declare-fun m!491443 () Bool)

(assert (=> b!510244 m!491443))

(assert (=> b!510244 m!491427))

(declare-fun m!491445 () Bool)

(assert (=> b!510244 m!491445))

(assert (=> b!510244 m!491431))

(declare-fun m!491447 () Bool)

(assert (=> b!510244 m!491447))

(declare-fun m!491449 () Bool)

(assert (=> b!510243 m!491449))

(declare-fun m!491451 () Bool)

(assert (=> b!510243 m!491451))

(check-sat (not start!46070) (not b!510244) (not b!510250) (not b!510248) (not b!510251) (not b!510249) (not b!510243) (not b!510247) (not b!510246))
(check-sat)
