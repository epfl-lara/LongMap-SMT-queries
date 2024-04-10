; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47540 () Bool)

(assert start!47540)

(declare-fun res!320642 () Bool)

(declare-fun e!305166 () Bool)

(assert (=> start!47540 (=> (not res!320642) (not e!305166))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47540 (= res!320642 (validMask!0 mask!3524))))

(assert (=> start!47540 e!305166))

(assert (=> start!47540 true))

(declare-datatypes ((array!33303 0))(
  ( (array!33304 (arr!16006 (Array (_ BitVec 32) (_ BitVec 64))) (size!16370 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33303)

(declare-fun array_inv!11802 (array!33303) Bool)

(assert (=> start!47540 (array_inv!11802 a!3235)))

(declare-fun b!523249 () Bool)

(declare-fun res!320644 () Bool)

(assert (=> b!523249 (=> (not res!320644) (not e!305166))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523249 (= res!320644 (validKeyInArray!0 (select (arr!16006 a!3235) j!176)))))

(declare-fun b!523250 () Bool)

(declare-datatypes ((Unit!16344 0))(
  ( (Unit!16345) )
))
(declare-fun e!305172 () Unit!16344)

(declare-fun Unit!16346 () Unit!16344)

(assert (=> b!523250 (= e!305172 Unit!16346)))

(declare-fun b!523251 () Bool)

(declare-fun res!320640 () Bool)

(declare-fun e!305168 () Bool)

(assert (=> b!523251 (=> res!320640 e!305168)))

(declare-datatypes ((SeekEntryResult!4473 0))(
  ( (MissingZero!4473 (index!20098 (_ BitVec 32))) (Found!4473 (index!20099 (_ BitVec 32))) (Intermediate!4473 (undefined!5285 Bool) (index!20100 (_ BitVec 32)) (x!49076 (_ BitVec 32))) (Undefined!4473) (MissingVacant!4473 (index!20101 (_ BitVec 32))) )
))
(declare-fun lt!240059 () SeekEntryResult!4473)

(get-info :version)

(assert (=> b!523251 (= res!320640 (or (undefined!5285 lt!240059) (not ((_ is Intermediate!4473) lt!240059))))))

(declare-fun b!523252 () Bool)

(declare-fun e!305171 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33303 (_ BitVec 32)) SeekEntryResult!4473)

(assert (=> b!523252 (= e!305171 (= (seekEntryOrOpen!0 (select (arr!16006 a!3235) j!176) a!3235 mask!3524) (Found!4473 j!176)))))

(declare-fun b!523253 () Bool)

(assert (=> b!523253 (= e!305168 (or (bvsgt #b00000000000000000000000000000000 (x!49076 lt!240059)) (bvsle (x!49076 lt!240059) #b01111111111111111111111111111110)))))

(assert (=> b!523253 (and (or (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240062 () Unit!16344)

(assert (=> b!523253 (= lt!240062 e!305172)))

(declare-fun c!61610 () Bool)

(assert (=> b!523253 (= c!61610 (= (select (arr!16006 a!3235) (index!20100 lt!240059)) (select (arr!16006 a!3235) j!176)))))

(assert (=> b!523253 (and (bvslt (x!49076 lt!240059) #b01111111111111111111111111111110) (or (= (select (arr!16006 a!3235) (index!20100 lt!240059)) (select (arr!16006 a!3235) j!176)) (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16006 a!3235) (index!20100 lt!240059)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523254 () Bool)

(declare-fun e!305169 () Bool)

(assert (=> b!523254 (= e!305169 false)))

(declare-fun b!523255 () Bool)

(declare-fun Unit!16347 () Unit!16344)

(assert (=> b!523255 (= e!305172 Unit!16347)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240060 () (_ BitVec 32))

(declare-fun lt!240061 () Unit!16344)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33303 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16344)

(assert (=> b!523255 (= lt!240061 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240060 #b00000000000000000000000000000000 (index!20100 lt!240059) (x!49076 lt!240059) mask!3524))))

(declare-fun lt!240056 () array!33303)

(declare-fun res!320635 () Bool)

(declare-fun lt!240057 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33303 (_ BitVec 32)) SeekEntryResult!4473)

(assert (=> b!523255 (= res!320635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240060 lt!240057 lt!240056 mask!3524) (Intermediate!4473 false (index!20100 lt!240059) (x!49076 lt!240059))))))

(assert (=> b!523255 (=> (not res!320635) (not e!305169))))

(assert (=> b!523255 e!305169))

(declare-fun b!523256 () Bool)

(declare-fun res!320638 () Bool)

(assert (=> b!523256 (=> (not res!320638) (not e!305166))))

(assert (=> b!523256 (= res!320638 (validKeyInArray!0 k0!2280))))

(declare-fun b!523257 () Bool)

(declare-fun e!305167 () Bool)

(assert (=> b!523257 (= e!305167 (not e!305168))))

(declare-fun res!320634 () Bool)

(assert (=> b!523257 (=> res!320634 e!305168)))

(declare-fun lt!240058 () (_ BitVec 32))

(assert (=> b!523257 (= res!320634 (= lt!240059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240058 lt!240057 lt!240056 mask!3524)))))

(assert (=> b!523257 (= lt!240059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240060 (select (arr!16006 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523257 (= lt!240058 (toIndex!0 lt!240057 mask!3524))))

(assert (=> b!523257 (= lt!240057 (select (store (arr!16006 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523257 (= lt!240060 (toIndex!0 (select (arr!16006 a!3235) j!176) mask!3524))))

(assert (=> b!523257 (= lt!240056 (array!33304 (store (arr!16006 a!3235) i!1204 k0!2280) (size!16370 a!3235)))))

(assert (=> b!523257 e!305171))

(declare-fun res!320641 () Bool)

(assert (=> b!523257 (=> (not res!320641) (not e!305171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33303 (_ BitVec 32)) Bool)

(assert (=> b!523257 (= res!320641 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240064 () Unit!16344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16344)

(assert (=> b!523257 (= lt!240064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523258 () Bool)

(assert (=> b!523258 (= e!305166 e!305167)))

(declare-fun res!320636 () Bool)

(assert (=> b!523258 (=> (not res!320636) (not e!305167))))

(declare-fun lt!240063 () SeekEntryResult!4473)

(assert (=> b!523258 (= res!320636 (or (= lt!240063 (MissingZero!4473 i!1204)) (= lt!240063 (MissingVacant!4473 i!1204))))))

(assert (=> b!523258 (= lt!240063 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523259 () Bool)

(declare-fun res!320637 () Bool)

(assert (=> b!523259 (=> (not res!320637) (not e!305166))))

(assert (=> b!523259 (= res!320637 (and (= (size!16370 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16370 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16370 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523260 () Bool)

(declare-fun res!320639 () Bool)

(assert (=> b!523260 (=> (not res!320639) (not e!305167))))

(declare-datatypes ((List!10164 0))(
  ( (Nil!10161) (Cons!10160 (h!11085 (_ BitVec 64)) (t!16392 List!10164)) )
))
(declare-fun arrayNoDuplicates!0 (array!33303 (_ BitVec 32) List!10164) Bool)

(assert (=> b!523260 (= res!320639 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10161))))

(declare-fun b!523261 () Bool)

(declare-fun res!320645 () Bool)

(assert (=> b!523261 (=> (not res!320645) (not e!305166))))

(declare-fun arrayContainsKey!0 (array!33303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523261 (= res!320645 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523262 () Bool)

(declare-fun res!320643 () Bool)

(assert (=> b!523262 (=> (not res!320643) (not e!305167))))

(assert (=> b!523262 (= res!320643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47540 res!320642) b!523259))

(assert (= (and b!523259 res!320637) b!523249))

(assert (= (and b!523249 res!320644) b!523256))

(assert (= (and b!523256 res!320638) b!523261))

(assert (= (and b!523261 res!320645) b!523258))

(assert (= (and b!523258 res!320636) b!523262))

(assert (= (and b!523262 res!320643) b!523260))

(assert (= (and b!523260 res!320639) b!523257))

(assert (= (and b!523257 res!320641) b!523252))

(assert (= (and b!523257 (not res!320634)) b!523251))

(assert (= (and b!523251 (not res!320640)) b!523253))

(assert (= (and b!523253 c!61610) b!523255))

(assert (= (and b!523253 (not c!61610)) b!523250))

(assert (= (and b!523255 res!320635) b!523254))

(declare-fun m!504069 () Bool)

(assert (=> b!523256 m!504069))

(declare-fun m!504071 () Bool)

(assert (=> start!47540 m!504071))

(declare-fun m!504073 () Bool)

(assert (=> start!47540 m!504073))

(declare-fun m!504075 () Bool)

(assert (=> b!523262 m!504075))

(declare-fun m!504077 () Bool)

(assert (=> b!523252 m!504077))

(assert (=> b!523252 m!504077))

(declare-fun m!504079 () Bool)

(assert (=> b!523252 m!504079))

(declare-fun m!504081 () Bool)

(assert (=> b!523258 m!504081))

(declare-fun m!504083 () Bool)

(assert (=> b!523260 m!504083))

(declare-fun m!504085 () Bool)

(assert (=> b!523257 m!504085))

(declare-fun m!504087 () Bool)

(assert (=> b!523257 m!504087))

(declare-fun m!504089 () Bool)

(assert (=> b!523257 m!504089))

(declare-fun m!504091 () Bool)

(assert (=> b!523257 m!504091))

(assert (=> b!523257 m!504077))

(declare-fun m!504093 () Bool)

(assert (=> b!523257 m!504093))

(assert (=> b!523257 m!504077))

(declare-fun m!504095 () Bool)

(assert (=> b!523257 m!504095))

(assert (=> b!523257 m!504077))

(declare-fun m!504097 () Bool)

(assert (=> b!523257 m!504097))

(declare-fun m!504099 () Bool)

(assert (=> b!523257 m!504099))

(declare-fun m!504101 () Bool)

(assert (=> b!523255 m!504101))

(declare-fun m!504103 () Bool)

(assert (=> b!523255 m!504103))

(assert (=> b!523249 m!504077))

(assert (=> b!523249 m!504077))

(declare-fun m!504105 () Bool)

(assert (=> b!523249 m!504105))

(declare-fun m!504107 () Bool)

(assert (=> b!523261 m!504107))

(declare-fun m!504109 () Bool)

(assert (=> b!523253 m!504109))

(assert (=> b!523253 m!504077))

(check-sat (not b!523257) (not b!523260) (not b!523249) (not b!523255) (not b!523262) (not b!523258) (not start!47540) (not b!523252) (not b!523256) (not b!523261))
(check-sat)
