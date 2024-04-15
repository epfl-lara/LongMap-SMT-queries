; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46080 () Bool)

(assert start!46080)

(declare-fun b!510269 () Bool)

(declare-fun res!311260 () Bool)

(declare-fun e!298238 () Bool)

(assert (=> b!510269 (=> (not res!311260) (not e!298238))))

(declare-datatypes ((array!32801 0))(
  ( (array!32802 (arr!15779 (Array (_ BitVec 32) (_ BitVec 64))) (size!16144 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32801)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510269 (= res!311260 (validKeyInArray!0 (select (arr!15779 a!3235) j!176)))))

(declare-fun b!510270 () Bool)

(declare-fun res!311262 () Bool)

(assert (=> b!510270 (=> (not res!311262) (not e!298238))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510270 (= res!311262 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311263 () Bool)

(assert (=> start!46080 (=> (not res!311263) (not e!298238))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46080 (= res!311263 (validMask!0 mask!3524))))

(assert (=> start!46080 e!298238))

(assert (=> start!46080 true))

(declare-fun array_inv!11662 (array!32801) Bool)

(assert (=> start!46080 (array_inv!11662 a!3235)))

(declare-fun b!510271 () Bool)

(declare-fun res!311264 () Bool)

(declare-fun e!298237 () Bool)

(assert (=> b!510271 (=> (not res!311264) (not e!298237))))

(declare-datatypes ((List!9976 0))(
  ( (Nil!9973) (Cons!9972 (h!10849 (_ BitVec 64)) (t!16195 List!9976)) )
))
(declare-fun arrayNoDuplicates!0 (array!32801 (_ BitVec 32) List!9976) Bool)

(assert (=> b!510271 (= res!311264 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9973))))

(declare-fun b!510272 () Bool)

(declare-fun res!311256 () Bool)

(assert (=> b!510272 (=> (not res!311256) (not e!298238))))

(assert (=> b!510272 (= res!311256 (validKeyInArray!0 k0!2280))))

(declare-fun b!510273 () Bool)

(assert (=> b!510273 (= e!298238 e!298237)))

(declare-fun res!311261 () Bool)

(assert (=> b!510273 (=> (not res!311261) (not e!298237))))

(declare-datatypes ((SeekEntryResult!4243 0))(
  ( (MissingZero!4243 (index!19160 (_ BitVec 32))) (Found!4243 (index!19161 (_ BitVec 32))) (Intermediate!4243 (undefined!5055 Bool) (index!19162 (_ BitVec 32)) (x!48127 (_ BitVec 32))) (Undefined!4243) (MissingVacant!4243 (index!19163 (_ BitVec 32))) )
))
(declare-fun lt!233219 () SeekEntryResult!4243)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510273 (= res!311261 (or (= lt!233219 (MissingZero!4243 i!1204)) (= lt!233219 (MissingVacant!4243 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32801 (_ BitVec 32)) SeekEntryResult!4243)

(assert (=> b!510273 (= lt!233219 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510274 () Bool)

(declare-fun e!298239 () Bool)

(assert (=> b!510274 (= e!298239 true)))

(declare-fun lt!233221 () array!32801)

(declare-fun lt!233218 () (_ BitVec 64))

(declare-fun lt!233220 () SeekEntryResult!4243)

(assert (=> b!510274 (= lt!233220 (seekEntryOrOpen!0 lt!233218 lt!233221 mask!3524))))

(declare-datatypes ((Unit!15730 0))(
  ( (Unit!15731) )
))
(declare-fun lt!233217 () Unit!15730)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15730)

(assert (=> b!510274 (= lt!233217 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510275 () Bool)

(declare-fun res!311257 () Bool)

(assert (=> b!510275 (=> (not res!311257) (not e!298237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32801 (_ BitVec 32)) Bool)

(assert (=> b!510275 (= res!311257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510276 () Bool)

(declare-fun res!311258 () Bool)

(assert (=> b!510276 (=> (not res!311258) (not e!298238))))

(assert (=> b!510276 (= res!311258 (and (= (size!16144 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16144 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16144 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510277 () Bool)

(assert (=> b!510277 (= e!298237 (not e!298239))))

(declare-fun res!311259 () Bool)

(assert (=> b!510277 (=> res!311259 e!298239)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32801 (_ BitVec 32)) SeekEntryResult!4243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510277 (= res!311259 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15779 a!3235) j!176) mask!3524) (select (arr!15779 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233218 mask!3524) lt!233218 lt!233221 mask!3524))))))

(assert (=> b!510277 (= lt!233218 (select (store (arr!15779 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510277 (= lt!233221 (array!32802 (store (arr!15779 a!3235) i!1204 k0!2280) (size!16144 a!3235)))))

(assert (=> b!510277 (= lt!233220 (Found!4243 j!176))))

(assert (=> b!510277 (= lt!233220 (seekEntryOrOpen!0 (select (arr!15779 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510277 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233216 () Unit!15730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15730)

(assert (=> b!510277 (= lt!233216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46080 res!311263) b!510276))

(assert (= (and b!510276 res!311258) b!510269))

(assert (= (and b!510269 res!311260) b!510272))

(assert (= (and b!510272 res!311256) b!510270))

(assert (= (and b!510270 res!311262) b!510273))

(assert (= (and b!510273 res!311261) b!510275))

(assert (= (and b!510275 res!311257) b!510271))

(assert (= (and b!510271 res!311264) b!510277))

(assert (= (and b!510277 (not res!311259)) b!510274))

(declare-fun m!491101 () Bool)

(assert (=> start!46080 m!491101))

(declare-fun m!491103 () Bool)

(assert (=> start!46080 m!491103))

(declare-fun m!491105 () Bool)

(assert (=> b!510275 m!491105))

(declare-fun m!491107 () Bool)

(assert (=> b!510273 m!491107))

(declare-fun m!491109 () Bool)

(assert (=> b!510269 m!491109))

(assert (=> b!510269 m!491109))

(declare-fun m!491111 () Bool)

(assert (=> b!510269 m!491111))

(declare-fun m!491113 () Bool)

(assert (=> b!510277 m!491113))

(declare-fun m!491115 () Bool)

(assert (=> b!510277 m!491115))

(declare-fun m!491117 () Bool)

(assert (=> b!510277 m!491117))

(assert (=> b!510277 m!491109))

(declare-fun m!491119 () Bool)

(assert (=> b!510277 m!491119))

(assert (=> b!510277 m!491109))

(assert (=> b!510277 m!491117))

(assert (=> b!510277 m!491109))

(declare-fun m!491121 () Bool)

(assert (=> b!510277 m!491121))

(assert (=> b!510277 m!491109))

(declare-fun m!491123 () Bool)

(assert (=> b!510277 m!491123))

(declare-fun m!491125 () Bool)

(assert (=> b!510277 m!491125))

(assert (=> b!510277 m!491125))

(declare-fun m!491127 () Bool)

(assert (=> b!510277 m!491127))

(declare-fun m!491129 () Bool)

(assert (=> b!510277 m!491129))

(declare-fun m!491131 () Bool)

(assert (=> b!510270 m!491131))

(declare-fun m!491133 () Bool)

(assert (=> b!510274 m!491133))

(declare-fun m!491135 () Bool)

(assert (=> b!510274 m!491135))

(declare-fun m!491137 () Bool)

(assert (=> b!510272 m!491137))

(declare-fun m!491139 () Bool)

(assert (=> b!510271 m!491139))

(check-sat (not b!510269) (not b!510270) (not b!510274) (not start!46080) (not b!510275) (not b!510273) (not b!510277) (not b!510272) (not b!510271))
(check-sat)
