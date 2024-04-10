; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48140 () Bool)

(assert start!48140)

(declare-fun b!530269 () Bool)

(declare-fun e!308969 () Bool)

(assert (=> b!530269 (= e!308969 true)))

(declare-datatypes ((SeekEntryResult!4602 0))(
  ( (MissingZero!4602 (index!20632 (_ BitVec 32))) (Found!4602 (index!20633 (_ BitVec 32))) (Intermediate!4602 (undefined!5414 Bool) (index!20634 (_ BitVec 32)) (x!49600 (_ BitVec 32))) (Undefined!4602) (MissingVacant!4602 (index!20635 (_ BitVec 32))) )
))
(declare-fun lt!244647 () SeekEntryResult!4602)

(declare-fun lt!244644 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33576 0))(
  ( (array!33577 (arr!16135 (Array (_ BitVec 32) (_ BitVec 64))) (size!16499 (_ BitVec 32))) )
))
(declare-fun lt!244641 () array!33576)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33576 (_ BitVec 32)) SeekEntryResult!4602)

(assert (=> b!530269 (= lt!244647 (seekEntryOrOpen!0 lt!244644 lt!244641 mask!3524))))

(assert (=> b!530269 false))

(declare-fun b!530270 () Bool)

(declare-fun res!325981 () Bool)

(declare-fun e!308970 () Bool)

(assert (=> b!530270 (=> (not res!325981) (not e!308970))))

(declare-fun a!3235 () array!33576)

(declare-datatypes ((List!10293 0))(
  ( (Nil!10290) (Cons!10289 (h!11229 (_ BitVec 64)) (t!16521 List!10293)) )
))
(declare-fun arrayNoDuplicates!0 (array!33576 (_ BitVec 32) List!10293) Bool)

(assert (=> b!530270 (= res!325981 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10290))))

(declare-fun b!530271 () Bool)

(declare-fun res!325983 () Bool)

(assert (=> b!530271 (=> (not res!325983) (not e!308970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33576 (_ BitVec 32)) Bool)

(assert (=> b!530271 (= res!325983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530272 () Bool)

(declare-fun e!308968 () Bool)

(assert (=> b!530272 (= e!308968 e!308970)))

(declare-fun res!325984 () Bool)

(assert (=> b!530272 (=> (not res!325984) (not e!308970))))

(declare-fun lt!244648 () SeekEntryResult!4602)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530272 (= res!325984 (or (= lt!244648 (MissingZero!4602 i!1204)) (= lt!244648 (MissingVacant!4602 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!530272 (= lt!244648 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530273 () Bool)

(declare-fun res!325980 () Bool)

(assert (=> b!530273 (=> (not res!325980) (not e!308968))))

(declare-fun arrayContainsKey!0 (array!33576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530273 (= res!325980 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!325977 () Bool)

(assert (=> start!48140 (=> (not res!325977) (not e!308968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48140 (= res!325977 (validMask!0 mask!3524))))

(assert (=> start!48140 e!308968))

(assert (=> start!48140 true))

(declare-fun array_inv!11931 (array!33576) Bool)

(assert (=> start!48140 (array_inv!11931 a!3235)))

(declare-fun b!530274 () Bool)

(declare-fun e!308971 () Bool)

(assert (=> b!530274 (= e!308970 (not e!308971))))

(declare-fun res!325976 () Bool)

(assert (=> b!530274 (=> res!325976 e!308971)))

(declare-fun lt!244646 () SeekEntryResult!4602)

(declare-fun lt!244645 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33576 (_ BitVec 32)) SeekEntryResult!4602)

(assert (=> b!530274 (= res!325976 (= lt!244646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244645 lt!244644 lt!244641 mask!3524)))))

(declare-fun lt!244640 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530274 (= lt!244646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244640 (select (arr!16135 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530274 (= lt!244645 (toIndex!0 lt!244644 mask!3524))))

(assert (=> b!530274 (= lt!244644 (select (store (arr!16135 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530274 (= lt!244640 (toIndex!0 (select (arr!16135 a!3235) j!176) mask!3524))))

(assert (=> b!530274 (= lt!244641 (array!33577 (store (arr!16135 a!3235) i!1204 k0!2280) (size!16499 a!3235)))))

(declare-fun e!308973 () Bool)

(assert (=> b!530274 e!308973))

(declare-fun res!325975 () Bool)

(assert (=> b!530274 (=> (not res!325975) (not e!308973))))

(assert (=> b!530274 (= res!325975 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16816 0))(
  ( (Unit!16817) )
))
(declare-fun lt!244643 () Unit!16816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16816)

(assert (=> b!530274 (= lt!244643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530275 () Bool)

(assert (=> b!530275 (= e!308971 e!308969)))

(declare-fun res!325979 () Bool)

(assert (=> b!530275 (=> res!325979 e!308969)))

(declare-fun lt!244642 () Bool)

(assert (=> b!530275 (= res!325979 (or (and (not lt!244642) (undefined!5414 lt!244646)) (and (not lt!244642) (not (undefined!5414 lt!244646)))))))

(get-info :version)

(assert (=> b!530275 (= lt!244642 (not ((_ is Intermediate!4602) lt!244646)))))

(declare-fun b!530276 () Bool)

(declare-fun res!325982 () Bool)

(assert (=> b!530276 (=> (not res!325982) (not e!308968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530276 (= res!325982 (validKeyInArray!0 (select (arr!16135 a!3235) j!176)))))

(declare-fun b!530277 () Bool)

(assert (=> b!530277 (= e!308973 (= (seekEntryOrOpen!0 (select (arr!16135 a!3235) j!176) a!3235 mask!3524) (Found!4602 j!176)))))

(declare-fun b!530278 () Bool)

(declare-fun res!325985 () Bool)

(assert (=> b!530278 (=> (not res!325985) (not e!308968))))

(assert (=> b!530278 (= res!325985 (validKeyInArray!0 k0!2280))))

(declare-fun b!530279 () Bool)

(declare-fun res!325978 () Bool)

(assert (=> b!530279 (=> (not res!325978) (not e!308968))))

(assert (=> b!530279 (= res!325978 (and (= (size!16499 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16499 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16499 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48140 res!325977) b!530279))

(assert (= (and b!530279 res!325978) b!530276))

(assert (= (and b!530276 res!325982) b!530278))

(assert (= (and b!530278 res!325985) b!530273))

(assert (= (and b!530273 res!325980) b!530272))

(assert (= (and b!530272 res!325984) b!530271))

(assert (= (and b!530271 res!325983) b!530270))

(assert (= (and b!530270 res!325981) b!530274))

(assert (= (and b!530274 res!325975) b!530277))

(assert (= (and b!530274 (not res!325976)) b!530275))

(assert (= (and b!530275 (not res!325979)) b!530269))

(declare-fun m!510827 () Bool)

(assert (=> b!530271 m!510827))

(declare-fun m!510829 () Bool)

(assert (=> b!530269 m!510829))

(declare-fun m!510831 () Bool)

(assert (=> b!530278 m!510831))

(declare-fun m!510833 () Bool)

(assert (=> b!530270 m!510833))

(declare-fun m!510835 () Bool)

(assert (=> b!530274 m!510835))

(declare-fun m!510837 () Bool)

(assert (=> b!530274 m!510837))

(declare-fun m!510839 () Bool)

(assert (=> b!530274 m!510839))

(declare-fun m!510841 () Bool)

(assert (=> b!530274 m!510841))

(declare-fun m!510843 () Bool)

(assert (=> b!530274 m!510843))

(declare-fun m!510845 () Bool)

(assert (=> b!530274 m!510845))

(assert (=> b!530274 m!510843))

(declare-fun m!510847 () Bool)

(assert (=> b!530274 m!510847))

(declare-fun m!510849 () Bool)

(assert (=> b!530274 m!510849))

(assert (=> b!530274 m!510843))

(declare-fun m!510851 () Bool)

(assert (=> b!530274 m!510851))

(assert (=> b!530277 m!510843))

(assert (=> b!530277 m!510843))

(declare-fun m!510853 () Bool)

(assert (=> b!530277 m!510853))

(assert (=> b!530276 m!510843))

(assert (=> b!530276 m!510843))

(declare-fun m!510855 () Bool)

(assert (=> b!530276 m!510855))

(declare-fun m!510857 () Bool)

(assert (=> b!530273 m!510857))

(declare-fun m!510859 () Bool)

(assert (=> b!530272 m!510859))

(declare-fun m!510861 () Bool)

(assert (=> start!48140 m!510861))

(declare-fun m!510863 () Bool)

(assert (=> start!48140 m!510863))

(check-sat (not b!530276) (not b!530274) (not start!48140) (not b!530270) (not b!530269) (not b!530271) (not b!530277) (not b!530273) (not b!530272) (not b!530278))
(check-sat)
