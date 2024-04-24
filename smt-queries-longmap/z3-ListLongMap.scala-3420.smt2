; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47432 () Bool)

(assert start!47432)

(declare-fun res!319925 () Bool)

(declare-fun e!304582 () Bool)

(assert (=> start!47432 (=> (not res!319925) (not e!304582))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47432 (= res!319925 (validMask!0 mask!3524))))

(assert (=> start!47432 e!304582))

(assert (=> start!47432 true))

(declare-datatypes ((array!33259 0))(
  ( (array!33260 (arr!15985 (Array (_ BitVec 32) (_ BitVec 64))) (size!16349 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33259)

(declare-fun array_inv!11844 (array!33259) Bool)

(assert (=> start!47432 (array_inv!11844 a!3235)))

(declare-fun b!522189 () Bool)

(declare-datatypes ((Unit!16243 0))(
  ( (Unit!16244) )
))
(declare-fun e!304585 () Unit!16243)

(declare-fun Unit!16245 () Unit!16243)

(assert (=> b!522189 (= e!304585 Unit!16245)))

(declare-datatypes ((SeekEntryResult!4408 0))(
  ( (MissingZero!4408 (index!19835 (_ BitVec 32))) (Found!4408 (index!19836 (_ BitVec 32))) (Intermediate!4408 (undefined!5220 Bool) (index!19837 (_ BitVec 32)) (x!48959 (_ BitVec 32))) (Undefined!4408) (MissingVacant!4408 (index!19838 (_ BitVec 32))) )
))
(declare-fun lt!239497 () SeekEntryResult!4408)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239492 () (_ BitVec 32))

(declare-fun lt!239494 () Unit!16243)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16243)

(assert (=> b!522189 (= lt!239494 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239492 #b00000000000000000000000000000000 (index!19837 lt!239497) (x!48959 lt!239497) mask!3524))))

(declare-fun res!319935 () Bool)

(declare-fun lt!239498 () array!33259)

(declare-fun lt!239499 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33259 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!522189 (= res!319935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239492 lt!239499 lt!239498 mask!3524) (Intermediate!4408 false (index!19837 lt!239497) (x!48959 lt!239497))))))

(declare-fun e!304587 () Bool)

(assert (=> b!522189 (=> (not res!319935) (not e!304587))))

(assert (=> b!522189 e!304587))

(declare-fun b!522190 () Bool)

(declare-fun Unit!16246 () Unit!16243)

(assert (=> b!522190 (= e!304585 Unit!16246)))

(declare-fun b!522191 () Bool)

(declare-fun res!319926 () Bool)

(declare-fun e!304584 () Bool)

(assert (=> b!522191 (=> (not res!319926) (not e!304584))))

(declare-datatypes ((List!10050 0))(
  ( (Nil!10047) (Cons!10046 (h!10968 (_ BitVec 64)) (t!16270 List!10050)) )
))
(declare-fun arrayNoDuplicates!0 (array!33259 (_ BitVec 32) List!10050) Bool)

(assert (=> b!522191 (= res!319926 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10047))))

(declare-fun b!522192 () Bool)

(declare-fun res!319930 () Bool)

(declare-fun e!304581 () Bool)

(assert (=> b!522192 (=> res!319930 e!304581)))

(get-info :version)

(assert (=> b!522192 (= res!319930 (or (undefined!5220 lt!239497) (not ((_ is Intermediate!4408) lt!239497))))))

(declare-fun b!522193 () Bool)

(assert (=> b!522193 (= e!304581 true)))

(assert (=> b!522193 (and (or (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239493 () Unit!16243)

(assert (=> b!522193 (= lt!239493 e!304585)))

(declare-fun c!61433 () Bool)

(assert (=> b!522193 (= c!61433 (= (select (arr!15985 a!3235) (index!19837 lt!239497)) (select (arr!15985 a!3235) j!176)))))

(assert (=> b!522193 (and (bvslt (x!48959 lt!239497) #b01111111111111111111111111111110) (or (= (select (arr!15985 a!3235) (index!19837 lt!239497)) (select (arr!15985 a!3235) j!176)) (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15985 a!3235) (index!19837 lt!239497)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522194 () Bool)

(declare-fun res!319927 () Bool)

(assert (=> b!522194 (=> (not res!319927) (not e!304582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522194 (= res!319927 (validKeyInArray!0 k0!2280))))

(declare-fun b!522195 () Bool)

(assert (=> b!522195 (= e!304587 false)))

(declare-fun b!522196 () Bool)

(declare-fun res!319928 () Bool)

(assert (=> b!522196 (=> (not res!319928) (not e!304582))))

(declare-fun arrayContainsKey!0 (array!33259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522196 (= res!319928 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522197 () Bool)

(assert (=> b!522197 (= e!304582 e!304584)))

(declare-fun res!319929 () Bool)

(assert (=> b!522197 (=> (not res!319929) (not e!304584))))

(declare-fun lt!239495 () SeekEntryResult!4408)

(assert (=> b!522197 (= res!319929 (or (= lt!239495 (MissingZero!4408 i!1204)) (= lt!239495 (MissingVacant!4408 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33259 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!522197 (= lt!239495 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522198 () Bool)

(declare-fun res!319934 () Bool)

(assert (=> b!522198 (=> (not res!319934) (not e!304582))))

(assert (=> b!522198 (= res!319934 (validKeyInArray!0 (select (arr!15985 a!3235) j!176)))))

(declare-fun b!522199 () Bool)

(declare-fun res!319931 () Bool)

(assert (=> b!522199 (=> (not res!319931) (not e!304584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33259 (_ BitVec 32)) Bool)

(assert (=> b!522199 (= res!319931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522200 () Bool)

(declare-fun e!304586 () Bool)

(assert (=> b!522200 (= e!304586 (= (seekEntryOrOpen!0 (select (arr!15985 a!3235) j!176) a!3235 mask!3524) (Found!4408 j!176)))))

(declare-fun b!522201 () Bool)

(assert (=> b!522201 (= e!304584 (not e!304581))))

(declare-fun res!319936 () Bool)

(assert (=> b!522201 (=> res!319936 e!304581)))

(declare-fun lt!239500 () (_ BitVec 32))

(assert (=> b!522201 (= res!319936 (= lt!239497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239500 lt!239499 lt!239498 mask!3524)))))

(assert (=> b!522201 (= lt!239497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239492 (select (arr!15985 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522201 (= lt!239500 (toIndex!0 lt!239499 mask!3524))))

(assert (=> b!522201 (= lt!239499 (select (store (arr!15985 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522201 (= lt!239492 (toIndex!0 (select (arr!15985 a!3235) j!176) mask!3524))))

(assert (=> b!522201 (= lt!239498 (array!33260 (store (arr!15985 a!3235) i!1204 k0!2280) (size!16349 a!3235)))))

(assert (=> b!522201 e!304586))

(declare-fun res!319933 () Bool)

(assert (=> b!522201 (=> (not res!319933) (not e!304586))))

(assert (=> b!522201 (= res!319933 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239496 () Unit!16243)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16243)

(assert (=> b!522201 (= lt!239496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522202 () Bool)

(declare-fun res!319932 () Bool)

(assert (=> b!522202 (=> (not res!319932) (not e!304582))))

(assert (=> b!522202 (= res!319932 (and (= (size!16349 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16349 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16349 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47432 res!319925) b!522202))

(assert (= (and b!522202 res!319932) b!522198))

(assert (= (and b!522198 res!319934) b!522194))

(assert (= (and b!522194 res!319927) b!522196))

(assert (= (and b!522196 res!319928) b!522197))

(assert (= (and b!522197 res!319929) b!522199))

(assert (= (and b!522199 res!319931) b!522191))

(assert (= (and b!522191 res!319926) b!522201))

(assert (= (and b!522201 res!319933) b!522200))

(assert (= (and b!522201 (not res!319936)) b!522192))

(assert (= (and b!522192 (not res!319930)) b!522193))

(assert (= (and b!522193 c!61433) b!522189))

(assert (= (and b!522193 (not c!61433)) b!522190))

(assert (= (and b!522189 res!319935) b!522195))

(declare-fun m!503347 () Bool)

(assert (=> b!522196 m!503347))

(declare-fun m!503349 () Bool)

(assert (=> b!522200 m!503349))

(assert (=> b!522200 m!503349))

(declare-fun m!503351 () Bool)

(assert (=> b!522200 m!503351))

(declare-fun m!503353 () Bool)

(assert (=> b!522189 m!503353))

(declare-fun m!503355 () Bool)

(assert (=> b!522189 m!503355))

(declare-fun m!503357 () Bool)

(assert (=> b!522201 m!503357))

(declare-fun m!503359 () Bool)

(assert (=> b!522201 m!503359))

(declare-fun m!503361 () Bool)

(assert (=> b!522201 m!503361))

(declare-fun m!503363 () Bool)

(assert (=> b!522201 m!503363))

(declare-fun m!503365 () Bool)

(assert (=> b!522201 m!503365))

(assert (=> b!522201 m!503349))

(declare-fun m!503367 () Bool)

(assert (=> b!522201 m!503367))

(assert (=> b!522201 m!503349))

(declare-fun m!503369 () Bool)

(assert (=> b!522201 m!503369))

(assert (=> b!522201 m!503349))

(declare-fun m!503371 () Bool)

(assert (=> b!522201 m!503371))

(declare-fun m!503373 () Bool)

(assert (=> b!522193 m!503373))

(assert (=> b!522193 m!503349))

(declare-fun m!503375 () Bool)

(assert (=> start!47432 m!503375))

(declare-fun m!503377 () Bool)

(assert (=> start!47432 m!503377))

(declare-fun m!503379 () Bool)

(assert (=> b!522194 m!503379))

(assert (=> b!522198 m!503349))

(assert (=> b!522198 m!503349))

(declare-fun m!503381 () Bool)

(assert (=> b!522198 m!503381))

(declare-fun m!503383 () Bool)

(assert (=> b!522199 m!503383))

(declare-fun m!503385 () Bool)

(assert (=> b!522191 m!503385))

(declare-fun m!503387 () Bool)

(assert (=> b!522197 m!503387))

(check-sat (not b!522200) (not b!522196) (not b!522197) (not b!522201) (not b!522194) (not b!522199) (not b!522189) (not start!47432) (not b!522191) (not b!522198))
(check-sat)
