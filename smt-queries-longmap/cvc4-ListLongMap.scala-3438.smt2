; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47752 () Bool)

(assert start!47752)

(declare-fun b!525592 () Bool)

(declare-fun e!306440 () Bool)

(assert (=> b!525592 (= e!306440 true)))

(declare-datatypes ((SeekEntryResult!4513 0))(
  ( (MissingZero!4513 (index!20264 (_ BitVec 32))) (Found!4513 (index!20265 (_ BitVec 32))) (Intermediate!4513 (undefined!5325 Bool) (index!20266 (_ BitVec 32)) (x!49238 (_ BitVec 32))) (Undefined!4513) (MissingVacant!4513 (index!20267 (_ BitVec 32))) )
))
(declare-fun lt!241507 () SeekEntryResult!4513)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525592 (= (index!20266 lt!241507) i!1204)))

(declare-fun lt!241513 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!16504 0))(
  ( (Unit!16505) )
))
(declare-fun lt!241512 () Unit!16504)

(declare-datatypes ((array!33389 0))(
  ( (array!33390 (arr!16046 (Array (_ BitVec 32) (_ BitVec 64))) (size!16410 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33389)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16504)

(assert (=> b!525592 (= lt!241512 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241513 #b00000000000000000000000000000000 (index!20266 lt!241507) (x!49238 lt!241507) mask!3524))))

(assert (=> b!525592 (and (or (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241506 () Unit!16504)

(declare-fun e!306437 () Unit!16504)

(assert (=> b!525592 (= lt!241506 e!306437)))

(declare-fun c!61934 () Bool)

(assert (=> b!525592 (= c!61934 (= (select (arr!16046 a!3235) (index!20266 lt!241507)) (select (arr!16046 a!3235) j!176)))))

(assert (=> b!525592 (and (bvslt (x!49238 lt!241507) #b01111111111111111111111111111110) (or (= (select (arr!16046 a!3235) (index!20266 lt!241507)) (select (arr!16046 a!3235) j!176)) (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16046 a!3235) (index!20266 lt!241507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525593 () Bool)

(declare-fun e!306436 () Bool)

(assert (=> b!525593 (= e!306436 (not e!306440))))

(declare-fun res!322336 () Bool)

(assert (=> b!525593 (=> res!322336 e!306440)))

(declare-fun lt!241504 () (_ BitVec 32))

(declare-fun lt!241509 () (_ BitVec 64))

(declare-fun lt!241505 () array!33389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33389 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!525593 (= res!322336 (= lt!241507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241504 lt!241509 lt!241505 mask!3524)))))

(assert (=> b!525593 (= lt!241507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241513 (select (arr!16046 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525593 (= lt!241504 (toIndex!0 lt!241509 mask!3524))))

(assert (=> b!525593 (= lt!241509 (select (store (arr!16046 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525593 (= lt!241513 (toIndex!0 (select (arr!16046 a!3235) j!176) mask!3524))))

(assert (=> b!525593 (= lt!241505 (array!33390 (store (arr!16046 a!3235) i!1204 k!2280) (size!16410 a!3235)))))

(declare-fun e!306438 () Bool)

(assert (=> b!525593 e!306438))

(declare-fun res!322340 () Bool)

(assert (=> b!525593 (=> (not res!322340) (not e!306438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33389 (_ BitVec 32)) Bool)

(assert (=> b!525593 (= res!322340 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241511 () Unit!16504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16504)

(assert (=> b!525593 (= lt!241511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525594 () Bool)

(declare-fun Unit!16506 () Unit!16504)

(assert (=> b!525594 (= e!306437 Unit!16506)))

(declare-fun b!525596 () Bool)

(declare-fun Unit!16507 () Unit!16504)

(assert (=> b!525596 (= e!306437 Unit!16507)))

(declare-fun lt!241510 () Unit!16504)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16504)

(assert (=> b!525596 (= lt!241510 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241513 #b00000000000000000000000000000000 (index!20266 lt!241507) (x!49238 lt!241507) mask!3524))))

(declare-fun res!322337 () Bool)

(assert (=> b!525596 (= res!322337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241513 lt!241509 lt!241505 mask!3524) (Intermediate!4513 false (index!20266 lt!241507) (x!49238 lt!241507))))))

(declare-fun e!306435 () Bool)

(assert (=> b!525596 (=> (not res!322337) (not e!306435))))

(assert (=> b!525596 e!306435))

(declare-fun b!525597 () Bool)

(declare-fun e!306441 () Bool)

(assert (=> b!525597 (= e!306441 e!306436)))

(declare-fun res!322344 () Bool)

(assert (=> b!525597 (=> (not res!322344) (not e!306436))))

(declare-fun lt!241508 () SeekEntryResult!4513)

(assert (=> b!525597 (= res!322344 (or (= lt!241508 (MissingZero!4513 i!1204)) (= lt!241508 (MissingVacant!4513 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33389 (_ BitVec 32)) SeekEntryResult!4513)

(assert (=> b!525597 (= lt!241508 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525598 () Bool)

(assert (=> b!525598 (= e!306435 false)))

(declare-fun b!525599 () Bool)

(declare-fun res!322341 () Bool)

(assert (=> b!525599 (=> res!322341 e!306440)))

(assert (=> b!525599 (= res!322341 (or (undefined!5325 lt!241507) (not (is-Intermediate!4513 lt!241507))))))

(declare-fun b!525600 () Bool)

(declare-fun res!322345 () Bool)

(assert (=> b!525600 (=> (not res!322345) (not e!306441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525600 (= res!322345 (validKeyInArray!0 (select (arr!16046 a!3235) j!176)))))

(declare-fun b!525601 () Bool)

(declare-fun res!322338 () Bool)

(assert (=> b!525601 (=> (not res!322338) (not e!306441))))

(assert (=> b!525601 (= res!322338 (and (= (size!16410 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16410 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16410 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525602 () Bool)

(declare-fun res!322339 () Bool)

(assert (=> b!525602 (=> (not res!322339) (not e!306441))))

(declare-fun arrayContainsKey!0 (array!33389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525602 (= res!322339 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525603 () Bool)

(assert (=> b!525603 (= e!306438 (= (seekEntryOrOpen!0 (select (arr!16046 a!3235) j!176) a!3235 mask!3524) (Found!4513 j!176)))))

(declare-fun b!525604 () Bool)

(declare-fun res!322346 () Bool)

(assert (=> b!525604 (=> (not res!322346) (not e!306436))))

(declare-datatypes ((List!10204 0))(
  ( (Nil!10201) (Cons!10200 (h!11131 (_ BitVec 64)) (t!16432 List!10204)) )
))
(declare-fun arrayNoDuplicates!0 (array!33389 (_ BitVec 32) List!10204) Bool)

(assert (=> b!525604 (= res!322346 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10201))))

(declare-fun b!525605 () Bool)

(declare-fun res!322343 () Bool)

(assert (=> b!525605 (=> (not res!322343) (not e!306436))))

(assert (=> b!525605 (= res!322343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!322335 () Bool)

(assert (=> start!47752 (=> (not res!322335) (not e!306441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47752 (= res!322335 (validMask!0 mask!3524))))

(assert (=> start!47752 e!306441))

(assert (=> start!47752 true))

(declare-fun array_inv!11842 (array!33389) Bool)

(assert (=> start!47752 (array_inv!11842 a!3235)))

(declare-fun b!525595 () Bool)

(declare-fun res!322342 () Bool)

(assert (=> b!525595 (=> (not res!322342) (not e!306441))))

(assert (=> b!525595 (= res!322342 (validKeyInArray!0 k!2280))))

(assert (= (and start!47752 res!322335) b!525601))

(assert (= (and b!525601 res!322338) b!525600))

(assert (= (and b!525600 res!322345) b!525595))

(assert (= (and b!525595 res!322342) b!525602))

(assert (= (and b!525602 res!322339) b!525597))

(assert (= (and b!525597 res!322344) b!525605))

(assert (= (and b!525605 res!322343) b!525604))

(assert (= (and b!525604 res!322346) b!525593))

(assert (= (and b!525593 res!322340) b!525603))

(assert (= (and b!525593 (not res!322336)) b!525599))

(assert (= (and b!525599 (not res!322341)) b!525592))

(assert (= (and b!525592 c!61934) b!525596))

(assert (= (and b!525592 (not c!61934)) b!525594))

(assert (= (and b!525596 res!322337) b!525598))

(declare-fun m!506257 () Bool)

(assert (=> start!47752 m!506257))

(declare-fun m!506259 () Bool)

(assert (=> start!47752 m!506259))

(declare-fun m!506261 () Bool)

(assert (=> b!525605 m!506261))

(declare-fun m!506263 () Bool)

(assert (=> b!525603 m!506263))

(assert (=> b!525603 m!506263))

(declare-fun m!506265 () Bool)

(assert (=> b!525603 m!506265))

(assert (=> b!525600 m!506263))

(assert (=> b!525600 m!506263))

(declare-fun m!506267 () Bool)

(assert (=> b!525600 m!506267))

(declare-fun m!506269 () Bool)

(assert (=> b!525597 m!506269))

(declare-fun m!506271 () Bool)

(assert (=> b!525596 m!506271))

(declare-fun m!506273 () Bool)

(assert (=> b!525596 m!506273))

(declare-fun m!506275 () Bool)

(assert (=> b!525602 m!506275))

(declare-fun m!506277 () Bool)

(assert (=> b!525595 m!506277))

(declare-fun m!506279 () Bool)

(assert (=> b!525604 m!506279))

(declare-fun m!506281 () Bool)

(assert (=> b!525593 m!506281))

(declare-fun m!506283 () Bool)

(assert (=> b!525593 m!506283))

(declare-fun m!506285 () Bool)

(assert (=> b!525593 m!506285))

(declare-fun m!506287 () Bool)

(assert (=> b!525593 m!506287))

(assert (=> b!525593 m!506263))

(declare-fun m!506289 () Bool)

(assert (=> b!525593 m!506289))

(assert (=> b!525593 m!506263))

(declare-fun m!506291 () Bool)

(assert (=> b!525593 m!506291))

(assert (=> b!525593 m!506263))

(declare-fun m!506293 () Bool)

(assert (=> b!525593 m!506293))

(declare-fun m!506295 () Bool)

(assert (=> b!525593 m!506295))

(declare-fun m!506297 () Bool)

(assert (=> b!525592 m!506297))

(declare-fun m!506299 () Bool)

(assert (=> b!525592 m!506299))

(assert (=> b!525592 m!506263))

(push 1)

