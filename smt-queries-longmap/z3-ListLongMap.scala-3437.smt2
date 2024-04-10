; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47744 () Bool)

(assert start!47744)

(declare-fun b!525424 () Bool)

(declare-fun e!306357 () Bool)

(declare-fun e!306356 () Bool)

(assert (=> b!525424 (= e!306357 (not e!306356))))

(declare-fun res!322202 () Bool)

(assert (=> b!525424 (=> res!322202 e!306356)))

(declare-datatypes ((array!33381 0))(
  ( (array!33382 (arr!16042 (Array (_ BitVec 32) (_ BitVec 64))) (size!16406 (_ BitVec 32))) )
))
(declare-fun lt!241392 () array!33381)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!241391 () (_ BitVec 32))

(declare-fun lt!241386 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4509 0))(
  ( (MissingZero!4509 (index!20248 (_ BitVec 32))) (Found!4509 (index!20249 (_ BitVec 32))) (Intermediate!4509 (undefined!5321 Bool) (index!20250 (_ BitVec 32)) (x!49226 (_ BitVec 32))) (Undefined!4509) (MissingVacant!4509 (index!20251 (_ BitVec 32))) )
))
(declare-fun lt!241385 () SeekEntryResult!4509)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33381 (_ BitVec 32)) SeekEntryResult!4509)

(assert (=> b!525424 (= res!322202 (= lt!241385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241391 lt!241386 lt!241392 mask!3524)))))

(declare-fun lt!241384 () (_ BitVec 32))

(declare-fun a!3235 () array!33381)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525424 (= lt!241385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241384 (select (arr!16042 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525424 (= lt!241391 (toIndex!0 lt!241386 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!525424 (= lt!241386 (select (store (arr!16042 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525424 (= lt!241384 (toIndex!0 (select (arr!16042 a!3235) j!176) mask!3524))))

(assert (=> b!525424 (= lt!241392 (array!33382 (store (arr!16042 a!3235) i!1204 k0!2280) (size!16406 a!3235)))))

(declare-fun e!306354 () Bool)

(assert (=> b!525424 e!306354))

(declare-fun res!322193 () Bool)

(assert (=> b!525424 (=> (not res!322193) (not e!306354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33381 (_ BitVec 32)) Bool)

(assert (=> b!525424 (= res!322193 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16488 0))(
  ( (Unit!16489) )
))
(declare-fun lt!241393 () Unit!16488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16488)

(assert (=> b!525424 (= lt!241393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525425 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33381 (_ BitVec 32)) SeekEntryResult!4509)

(assert (=> b!525425 (= e!306354 (= (seekEntryOrOpen!0 (select (arr!16042 a!3235) j!176) a!3235 mask!3524) (Found!4509 j!176)))))

(declare-fun b!525426 () Bool)

(declare-fun res!322197 () Bool)

(declare-fun e!306355 () Bool)

(assert (=> b!525426 (=> (not res!322197) (not e!306355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525426 (= res!322197 (validKeyInArray!0 k0!2280))))

(declare-fun b!525427 () Bool)

(declare-fun e!306351 () Unit!16488)

(declare-fun Unit!16490 () Unit!16488)

(assert (=> b!525427 (= e!306351 Unit!16490)))

(declare-fun lt!241388 () Unit!16488)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16488)

(assert (=> b!525427 (= lt!241388 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241384 #b00000000000000000000000000000000 (index!20250 lt!241385) (x!49226 lt!241385) mask!3524))))

(declare-fun res!322194 () Bool)

(assert (=> b!525427 (= res!322194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241384 lt!241386 lt!241392 mask!3524) (Intermediate!4509 false (index!20250 lt!241385) (x!49226 lt!241385))))))

(declare-fun e!306353 () Bool)

(assert (=> b!525427 (=> (not res!322194) (not e!306353))))

(assert (=> b!525427 e!306353))

(declare-fun b!525428 () Bool)

(declare-fun res!322195 () Bool)

(assert (=> b!525428 (=> res!322195 e!306356)))

(get-info :version)

(assert (=> b!525428 (= res!322195 (or (undefined!5321 lt!241385) (not ((_ is Intermediate!4509) lt!241385))))))

(declare-fun res!322200 () Bool)

(assert (=> start!47744 (=> (not res!322200) (not e!306355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47744 (= res!322200 (validMask!0 mask!3524))))

(assert (=> start!47744 e!306355))

(assert (=> start!47744 true))

(declare-fun array_inv!11838 (array!33381) Bool)

(assert (=> start!47744 (array_inv!11838 a!3235)))

(declare-fun b!525429 () Bool)

(assert (=> b!525429 (= e!306355 e!306357)))

(declare-fun res!322198 () Bool)

(assert (=> b!525429 (=> (not res!322198) (not e!306357))))

(declare-fun lt!241387 () SeekEntryResult!4509)

(assert (=> b!525429 (= res!322198 (or (= lt!241387 (MissingZero!4509 i!1204)) (= lt!241387 (MissingVacant!4509 i!1204))))))

(assert (=> b!525429 (= lt!241387 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525430 () Bool)

(declare-fun res!322192 () Bool)

(assert (=> b!525430 (=> (not res!322192) (not e!306355))))

(assert (=> b!525430 (= res!322192 (validKeyInArray!0 (select (arr!16042 a!3235) j!176)))))

(declare-fun b!525431 () Bool)

(assert (=> b!525431 (= e!306353 false)))

(declare-fun b!525432 () Bool)

(declare-fun res!322191 () Bool)

(assert (=> b!525432 (=> (not res!322191) (not e!306357))))

(assert (=> b!525432 (= res!322191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525433 () Bool)

(declare-fun Unit!16491 () Unit!16488)

(assert (=> b!525433 (= e!306351 Unit!16491)))

(declare-fun b!525434 () Bool)

(declare-fun res!322196 () Bool)

(assert (=> b!525434 (=> (not res!322196) (not e!306355))))

(assert (=> b!525434 (= res!322196 (and (= (size!16406 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16406 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16406 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525435 () Bool)

(declare-fun res!322201 () Bool)

(assert (=> b!525435 (=> (not res!322201) (not e!306357))))

(declare-datatypes ((List!10200 0))(
  ( (Nil!10197) (Cons!10196 (h!11127 (_ BitVec 64)) (t!16428 List!10200)) )
))
(declare-fun arrayNoDuplicates!0 (array!33381 (_ BitVec 32) List!10200) Bool)

(assert (=> b!525435 (= res!322201 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10197))))

(declare-fun b!525436 () Bool)

(declare-fun res!322199 () Bool)

(assert (=> b!525436 (=> (not res!322199) (not e!306355))))

(declare-fun arrayContainsKey!0 (array!33381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525436 (= res!322199 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525437 () Bool)

(assert (=> b!525437 (= e!306356 true)))

(assert (=> b!525437 (= (index!20250 lt!241385) i!1204)))

(declare-fun lt!241390 () Unit!16488)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16488)

(assert (=> b!525437 (= lt!241390 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241384 #b00000000000000000000000000000000 (index!20250 lt!241385) (x!49226 lt!241385) mask!3524))))

(assert (=> b!525437 (and (or (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241389 () Unit!16488)

(assert (=> b!525437 (= lt!241389 e!306351)))

(declare-fun c!61922 () Bool)

(assert (=> b!525437 (= c!61922 (= (select (arr!16042 a!3235) (index!20250 lt!241385)) (select (arr!16042 a!3235) j!176)))))

(assert (=> b!525437 (and (bvslt (x!49226 lt!241385) #b01111111111111111111111111111110) (or (= (select (arr!16042 a!3235) (index!20250 lt!241385)) (select (arr!16042 a!3235) j!176)) (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16042 a!3235) (index!20250 lt!241385)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47744 res!322200) b!525434))

(assert (= (and b!525434 res!322196) b!525430))

(assert (= (and b!525430 res!322192) b!525426))

(assert (= (and b!525426 res!322197) b!525436))

(assert (= (and b!525436 res!322199) b!525429))

(assert (= (and b!525429 res!322198) b!525432))

(assert (= (and b!525432 res!322191) b!525435))

(assert (= (and b!525435 res!322201) b!525424))

(assert (= (and b!525424 res!322193) b!525425))

(assert (= (and b!525424 (not res!322202)) b!525428))

(assert (= (and b!525428 (not res!322195)) b!525437))

(assert (= (and b!525437 c!61922) b!525427))

(assert (= (and b!525437 (not c!61922)) b!525433))

(assert (= (and b!525427 res!322194) b!525431))

(declare-fun m!506081 () Bool)

(assert (=> b!525436 m!506081))

(declare-fun m!506083 () Bool)

(assert (=> b!525424 m!506083))

(declare-fun m!506085 () Bool)

(assert (=> b!525424 m!506085))

(declare-fun m!506087 () Bool)

(assert (=> b!525424 m!506087))

(declare-fun m!506089 () Bool)

(assert (=> b!525424 m!506089))

(declare-fun m!506091 () Bool)

(assert (=> b!525424 m!506091))

(declare-fun m!506093 () Bool)

(assert (=> b!525424 m!506093))

(declare-fun m!506095 () Bool)

(assert (=> b!525424 m!506095))

(assert (=> b!525424 m!506093))

(assert (=> b!525424 m!506093))

(declare-fun m!506097 () Bool)

(assert (=> b!525424 m!506097))

(declare-fun m!506099 () Bool)

(assert (=> b!525424 m!506099))

(declare-fun m!506101 () Bool)

(assert (=> b!525426 m!506101))

(declare-fun m!506103 () Bool)

(assert (=> b!525429 m!506103))

(declare-fun m!506105 () Bool)

(assert (=> start!47744 m!506105))

(declare-fun m!506107 () Bool)

(assert (=> start!47744 m!506107))

(declare-fun m!506109 () Bool)

(assert (=> b!525435 m!506109))

(assert (=> b!525430 m!506093))

(assert (=> b!525430 m!506093))

(declare-fun m!506111 () Bool)

(assert (=> b!525430 m!506111))

(declare-fun m!506113 () Bool)

(assert (=> b!525427 m!506113))

(declare-fun m!506115 () Bool)

(assert (=> b!525427 m!506115))

(assert (=> b!525425 m!506093))

(assert (=> b!525425 m!506093))

(declare-fun m!506117 () Bool)

(assert (=> b!525425 m!506117))

(declare-fun m!506119 () Bool)

(assert (=> b!525432 m!506119))

(declare-fun m!506121 () Bool)

(assert (=> b!525437 m!506121))

(declare-fun m!506123 () Bool)

(assert (=> b!525437 m!506123))

(assert (=> b!525437 m!506093))

(check-sat (not b!525429) (not b!525425) (not start!47744) (not b!525432) (not b!525424) (not b!525427) (not b!525435) (not b!525426) (not b!525430) (not b!525437) (not b!525436))
(check-sat)
