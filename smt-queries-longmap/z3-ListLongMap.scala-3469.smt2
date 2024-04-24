; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48134 () Bool)

(assert start!48134)

(declare-fun res!326044 () Bool)

(declare-fun e!308967 () Bool)

(assert (=> start!48134 (=> (not res!326044) (not e!308967))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48134 (= res!326044 (validMask!0 mask!3524))))

(assert (=> start!48134 e!308967))

(assert (=> start!48134 true))

(declare-datatypes ((array!33571 0))(
  ( (array!33572 (arr!16132 (Array (_ BitVec 32) (_ BitVec 64))) (size!16496 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33571)

(declare-fun array_inv!11991 (array!33571) Bool)

(assert (=> start!48134 (array_inv!11991 a!3235)))

(declare-fun b!530274 () Bool)

(declare-fun e!308970 () Bool)

(declare-fun e!308969 () Bool)

(assert (=> b!530274 (= e!308970 e!308969)))

(declare-fun res!326034 () Bool)

(assert (=> b!530274 (=> res!326034 e!308969)))

(declare-fun lt!244711 () Bool)

(declare-datatypes ((SeekEntryResult!4555 0))(
  ( (MissingZero!4555 (index!20444 (_ BitVec 32))) (Found!4555 (index!20445 (_ BitVec 32))) (Intermediate!4555 (undefined!5367 Bool) (index!20446 (_ BitVec 32)) (x!49558 (_ BitVec 32))) (Undefined!4555) (MissingVacant!4555 (index!20447 (_ BitVec 32))) )
))
(declare-fun lt!244714 () SeekEntryResult!4555)

(assert (=> b!530274 (= res!326034 (or (and (not lt!244711) (undefined!5367 lt!244714)) (and (not lt!244711) (not (undefined!5367 lt!244714)))))))

(get-info :version)

(assert (=> b!530274 (= lt!244711 (not ((_ is Intermediate!4555) lt!244714)))))

(declare-fun b!530275 () Bool)

(declare-fun res!326036 () Bool)

(assert (=> b!530275 (=> (not res!326036) (not e!308967))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530275 (= res!326036 (validKeyInArray!0 (select (arr!16132 a!3235) j!176)))))

(declare-fun b!530276 () Bool)

(declare-fun res!326037 () Bool)

(assert (=> b!530276 (=> (not res!326037) (not e!308967))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530276 (= res!326037 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530277 () Bool)

(declare-fun res!326043 () Bool)

(declare-fun e!308966 () Bool)

(assert (=> b!530277 (=> (not res!326043) (not e!308966))))

(declare-datatypes ((List!10197 0))(
  ( (Nil!10194) (Cons!10193 (h!11133 (_ BitVec 64)) (t!16417 List!10197)) )
))
(declare-fun arrayNoDuplicates!0 (array!33571 (_ BitVec 32) List!10197) Bool)

(assert (=> b!530277 (= res!326043 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10194))))

(declare-fun b!530278 () Bool)

(assert (=> b!530278 (= e!308967 e!308966)))

(declare-fun res!326042 () Bool)

(assert (=> b!530278 (=> (not res!326042) (not e!308966))))

(declare-fun lt!244712 () SeekEntryResult!4555)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530278 (= res!326042 (or (= lt!244712 (MissingZero!4555 i!1204)) (= lt!244712 (MissingVacant!4555 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33571 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!530278 (= lt!244712 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530279 () Bool)

(assert (=> b!530279 (= e!308966 (not e!308970))))

(declare-fun res!326041 () Bool)

(assert (=> b!530279 (=> res!326041 e!308970)))

(declare-fun lt!244707 () (_ BitVec 64))

(declare-fun lt!244709 () (_ BitVec 32))

(declare-fun lt!244708 () array!33571)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33571 (_ BitVec 32)) SeekEntryResult!4555)

(assert (=> b!530279 (= res!326041 (= lt!244714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244709 lt!244707 lt!244708 mask!3524)))))

(declare-fun lt!244713 () (_ BitVec 32))

(assert (=> b!530279 (= lt!244714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244713 (select (arr!16132 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530279 (= lt!244709 (toIndex!0 lt!244707 mask!3524))))

(assert (=> b!530279 (= lt!244707 (select (store (arr!16132 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530279 (= lt!244713 (toIndex!0 (select (arr!16132 a!3235) j!176) mask!3524))))

(assert (=> b!530279 (= lt!244708 (array!33572 (store (arr!16132 a!3235) i!1204 k0!2280) (size!16496 a!3235)))))

(declare-fun e!308968 () Bool)

(assert (=> b!530279 e!308968))

(declare-fun res!326035 () Bool)

(assert (=> b!530279 (=> (not res!326035) (not e!308968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33571 (_ BitVec 32)) Bool)

(assert (=> b!530279 (= res!326035 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16783 0))(
  ( (Unit!16784) )
))
(declare-fun lt!244710 () Unit!16783)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16783)

(assert (=> b!530279 (= lt!244710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530280 () Bool)

(declare-fun res!326038 () Bool)

(assert (=> b!530280 (=> (not res!326038) (not e!308967))))

(assert (=> b!530280 (= res!326038 (validKeyInArray!0 k0!2280))))

(declare-fun b!530281 () Bool)

(assert (=> b!530281 (= e!308968 (= (seekEntryOrOpen!0 (select (arr!16132 a!3235) j!176) a!3235 mask!3524) (Found!4555 j!176)))))

(declare-fun b!530282 () Bool)

(declare-fun res!326039 () Bool)

(assert (=> b!530282 (=> (not res!326039) (not e!308967))))

(assert (=> b!530282 (= res!326039 (and (= (size!16496 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16496 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16496 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530283 () Bool)

(declare-fun res!326040 () Bool)

(assert (=> b!530283 (=> (not res!326040) (not e!308966))))

(assert (=> b!530283 (= res!326040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530284 () Bool)

(assert (=> b!530284 (= e!308969 true)))

(declare-fun lt!244706 () SeekEntryResult!4555)

(assert (=> b!530284 (= lt!244706 (seekEntryOrOpen!0 lt!244707 lt!244708 mask!3524))))

(assert (=> b!530284 false))

(assert (= (and start!48134 res!326044) b!530282))

(assert (= (and b!530282 res!326039) b!530275))

(assert (= (and b!530275 res!326036) b!530280))

(assert (= (and b!530280 res!326038) b!530276))

(assert (= (and b!530276 res!326037) b!530278))

(assert (= (and b!530278 res!326042) b!530283))

(assert (= (and b!530283 res!326040) b!530277))

(assert (= (and b!530277 res!326043) b!530279))

(assert (= (and b!530279 res!326035) b!530281))

(assert (= (and b!530279 (not res!326041)) b!530274))

(assert (= (and b!530274 (not res!326034)) b!530284))

(declare-fun m!511087 () Bool)

(assert (=> b!530277 m!511087))

(declare-fun m!511089 () Bool)

(assert (=> b!530283 m!511089))

(declare-fun m!511091 () Bool)

(assert (=> b!530279 m!511091))

(declare-fun m!511093 () Bool)

(assert (=> b!530279 m!511093))

(declare-fun m!511095 () Bool)

(assert (=> b!530279 m!511095))

(declare-fun m!511097 () Bool)

(assert (=> b!530279 m!511097))

(declare-fun m!511099 () Bool)

(assert (=> b!530279 m!511099))

(declare-fun m!511101 () Bool)

(assert (=> b!530279 m!511101))

(assert (=> b!530279 m!511099))

(declare-fun m!511103 () Bool)

(assert (=> b!530279 m!511103))

(assert (=> b!530279 m!511099))

(declare-fun m!511105 () Bool)

(assert (=> b!530279 m!511105))

(declare-fun m!511107 () Bool)

(assert (=> b!530279 m!511107))

(assert (=> b!530275 m!511099))

(assert (=> b!530275 m!511099))

(declare-fun m!511109 () Bool)

(assert (=> b!530275 m!511109))

(assert (=> b!530281 m!511099))

(assert (=> b!530281 m!511099))

(declare-fun m!511111 () Bool)

(assert (=> b!530281 m!511111))

(declare-fun m!511113 () Bool)

(assert (=> b!530278 m!511113))

(declare-fun m!511115 () Bool)

(assert (=> b!530276 m!511115))

(declare-fun m!511117 () Bool)

(assert (=> b!530284 m!511117))

(declare-fun m!511119 () Bool)

(assert (=> start!48134 m!511119))

(declare-fun m!511121 () Bool)

(assert (=> start!48134 m!511121))

(declare-fun m!511123 () Bool)

(assert (=> b!530280 m!511123))

(check-sat (not b!530281) (not b!530284) (not b!530275) (not start!48134) (not b!530283) (not b!530276) (not b!530277) (not b!530279) (not b!530278) (not b!530280))
(check-sat)
