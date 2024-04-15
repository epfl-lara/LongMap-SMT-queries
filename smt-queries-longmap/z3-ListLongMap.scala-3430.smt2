; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47688 () Bool)

(assert start!47688)

(declare-fun b!524220 () Bool)

(declare-datatypes ((Unit!16378 0))(
  ( (Unit!16379) )
))
(declare-fun e!305706 () Unit!16378)

(declare-fun Unit!16380 () Unit!16378)

(assert (=> b!524220 (= e!305706 Unit!16380)))

(declare-datatypes ((SeekEntryResult!4483 0))(
  ( (MissingZero!4483 (index!20144 (_ BitVec 32))) (Found!4483 (index!20145 (_ BitVec 32))) (Intermediate!4483 (undefined!5295 Bool) (index!20146 (_ BitVec 32)) (x!49139 (_ BitVec 32))) (Undefined!4483) (MissingVacant!4483 (index!20147 (_ BitVec 32))) )
))
(declare-fun lt!240494 () SeekEntryResult!4483)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240490 () (_ BitVec 32))

(declare-datatypes ((array!33335 0))(
  ( (array!33336 (arr!16019 (Array (_ BitVec 32) (_ BitVec 64))) (size!16384 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33335)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240493 () Unit!16378)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16378)

(assert (=> b!524220 (= lt!240493 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240490 #b00000000000000000000000000000000 (index!20146 lt!240494) (x!49139 lt!240494) mask!3524))))

(declare-fun lt!240491 () array!33335)

(declare-fun lt!240495 () (_ BitVec 64))

(declare-fun res!321271 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33335 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!524220 (= res!321271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240490 lt!240495 lt!240491 mask!3524) (Intermediate!4483 false (index!20146 lt!240494) (x!49139 lt!240494))))))

(declare-fun e!305708 () Bool)

(assert (=> b!524220 (=> (not res!321271) (not e!305708))))

(assert (=> b!524220 e!305708))

(declare-fun b!524221 () Bool)

(declare-fun res!321267 () Bool)

(declare-fun e!305712 () Bool)

(assert (=> b!524221 (=> (not res!321267) (not e!305712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524221 (= res!321267 (validKeyInArray!0 (select (arr!16019 a!3235) j!176)))))

(declare-fun b!524222 () Bool)

(declare-fun res!321269 () Bool)

(assert (=> b!524222 (=> (not res!321269) (not e!305712))))

(assert (=> b!524222 (= res!321269 (validKeyInArray!0 k0!2280))))

(declare-fun b!524223 () Bool)

(declare-fun e!305711 () Bool)

(declare-fun e!305710 () Bool)

(assert (=> b!524223 (= e!305711 (not e!305710))))

(declare-fun res!321264 () Bool)

(assert (=> b!524223 (=> res!321264 e!305710)))

(declare-fun lt!240496 () (_ BitVec 32))

(assert (=> b!524223 (= res!321264 (= lt!240494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240496 lt!240495 lt!240491 mask!3524)))))

(assert (=> b!524223 (= lt!240494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240490 (select (arr!16019 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524223 (= lt!240496 (toIndex!0 lt!240495 mask!3524))))

(assert (=> b!524223 (= lt!240495 (select (store (arr!16019 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524223 (= lt!240490 (toIndex!0 (select (arr!16019 a!3235) j!176) mask!3524))))

(assert (=> b!524223 (= lt!240491 (array!33336 (store (arr!16019 a!3235) i!1204 k0!2280) (size!16384 a!3235)))))

(declare-fun e!305707 () Bool)

(assert (=> b!524223 e!305707))

(declare-fun res!321262 () Bool)

(assert (=> b!524223 (=> (not res!321262) (not e!305707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33335 (_ BitVec 32)) Bool)

(assert (=> b!524223 (= res!321262 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240492 () Unit!16378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16378)

(assert (=> b!524223 (= lt!240492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524224 () Bool)

(assert (=> b!524224 (= e!305712 e!305711)))

(declare-fun res!321266 () Bool)

(assert (=> b!524224 (=> (not res!321266) (not e!305711))))

(declare-fun lt!240488 () SeekEntryResult!4483)

(assert (=> b!524224 (= res!321266 (or (= lt!240488 (MissingZero!4483 i!1204)) (= lt!240488 (MissingVacant!4483 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33335 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!524224 (= lt!240488 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524226 () Bool)

(declare-fun res!321265 () Bool)

(assert (=> b!524226 (=> (not res!321265) (not e!305711))))

(declare-datatypes ((List!10216 0))(
  ( (Nil!10213) (Cons!10212 (h!11143 (_ BitVec 64)) (t!16435 List!10216)) )
))
(declare-fun arrayNoDuplicates!0 (array!33335 (_ BitVec 32) List!10216) Bool)

(assert (=> b!524226 (= res!321265 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10213))))

(declare-fun b!524227 () Bool)

(assert (=> b!524227 (= e!305710 true)))

(assert (=> b!524227 (and (or (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240489 () Unit!16378)

(assert (=> b!524227 (= lt!240489 e!305706)))

(declare-fun c!61785 () Bool)

(assert (=> b!524227 (= c!61785 (= (select (arr!16019 a!3235) (index!20146 lt!240494)) (select (arr!16019 a!3235) j!176)))))

(assert (=> b!524227 (and (bvslt (x!49139 lt!240494) #b01111111111111111111111111111110) (or (= (select (arr!16019 a!3235) (index!20146 lt!240494)) (select (arr!16019 a!3235) j!176)) (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16019 a!3235) (index!20146 lt!240494)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524228 () Bool)

(assert (=> b!524228 (= e!305708 false)))

(declare-fun b!524229 () Bool)

(declare-fun res!321263 () Bool)

(assert (=> b!524229 (=> res!321263 e!305710)))

(get-info :version)

(assert (=> b!524229 (= res!321263 (or (undefined!5295 lt!240494) (not ((_ is Intermediate!4483) lt!240494))))))

(declare-fun res!321270 () Bool)

(assert (=> start!47688 (=> (not res!321270) (not e!305712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47688 (= res!321270 (validMask!0 mask!3524))))

(assert (=> start!47688 e!305712))

(assert (=> start!47688 true))

(declare-fun array_inv!11902 (array!33335) Bool)

(assert (=> start!47688 (array_inv!11902 a!3235)))

(declare-fun b!524225 () Bool)

(declare-fun res!321268 () Bool)

(assert (=> b!524225 (=> (not res!321268) (not e!305712))))

(assert (=> b!524225 (= res!321268 (and (= (size!16384 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16384 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16384 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524230 () Bool)

(declare-fun res!321261 () Bool)

(assert (=> b!524230 (=> (not res!321261) (not e!305712))))

(declare-fun arrayContainsKey!0 (array!33335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524230 (= res!321261 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524231 () Bool)

(assert (=> b!524231 (= e!305707 (= (seekEntryOrOpen!0 (select (arr!16019 a!3235) j!176) a!3235 mask!3524) (Found!4483 j!176)))))

(declare-fun b!524232 () Bool)

(declare-fun res!321272 () Bool)

(assert (=> b!524232 (=> (not res!321272) (not e!305711))))

(assert (=> b!524232 (= res!321272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524233 () Bool)

(declare-fun Unit!16381 () Unit!16378)

(assert (=> b!524233 (= e!305706 Unit!16381)))

(assert (= (and start!47688 res!321270) b!524225))

(assert (= (and b!524225 res!321268) b!524221))

(assert (= (and b!524221 res!321267) b!524222))

(assert (= (and b!524222 res!321269) b!524230))

(assert (= (and b!524230 res!321261) b!524224))

(assert (= (and b!524224 res!321266) b!524232))

(assert (= (and b!524232 res!321272) b!524226))

(assert (= (and b!524226 res!321265) b!524223))

(assert (= (and b!524223 res!321262) b!524231))

(assert (= (and b!524223 (not res!321264)) b!524229))

(assert (= (and b!524229 (not res!321263)) b!524227))

(assert (= (and b!524227 c!61785) b!524220))

(assert (= (and b!524227 (not c!61785)) b!524233))

(assert (= (and b!524220 res!321271) b!524228))

(declare-fun m!504373 () Bool)

(assert (=> b!524230 m!504373))

(declare-fun m!504375 () Bool)

(assert (=> b!524226 m!504375))

(declare-fun m!504377 () Bool)

(assert (=> b!524221 m!504377))

(assert (=> b!524221 m!504377))

(declare-fun m!504379 () Bool)

(assert (=> b!524221 m!504379))

(declare-fun m!504381 () Bool)

(assert (=> b!524224 m!504381))

(declare-fun m!504383 () Bool)

(assert (=> start!47688 m!504383))

(declare-fun m!504385 () Bool)

(assert (=> start!47688 m!504385))

(declare-fun m!504387 () Bool)

(assert (=> b!524227 m!504387))

(assert (=> b!524227 m!504377))

(declare-fun m!504389 () Bool)

(assert (=> b!524232 m!504389))

(assert (=> b!524231 m!504377))

(assert (=> b!524231 m!504377))

(declare-fun m!504391 () Bool)

(assert (=> b!524231 m!504391))

(declare-fun m!504393 () Bool)

(assert (=> b!524222 m!504393))

(declare-fun m!504395 () Bool)

(assert (=> b!524220 m!504395))

(declare-fun m!504397 () Bool)

(assert (=> b!524220 m!504397))

(declare-fun m!504399 () Bool)

(assert (=> b!524223 m!504399))

(assert (=> b!524223 m!504377))

(declare-fun m!504401 () Bool)

(assert (=> b!524223 m!504401))

(declare-fun m!504403 () Bool)

(assert (=> b!524223 m!504403))

(declare-fun m!504405 () Bool)

(assert (=> b!524223 m!504405))

(assert (=> b!524223 m!504377))

(declare-fun m!504407 () Bool)

(assert (=> b!524223 m!504407))

(assert (=> b!524223 m!504377))

(declare-fun m!504409 () Bool)

(assert (=> b!524223 m!504409))

(declare-fun m!504411 () Bool)

(assert (=> b!524223 m!504411))

(declare-fun m!504413 () Bool)

(assert (=> b!524223 m!504413))

(check-sat (not b!524223) (not b!524220) (not b!524221) (not b!524222) (not b!524224) (not start!47688) (not b!524232) (not b!524231) (not b!524230) (not b!524226))
(check-sat)
