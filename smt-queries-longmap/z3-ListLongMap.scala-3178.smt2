; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44682 () Bool)

(assert start!44682)

(declare-fun b!490191 () Bool)

(declare-fun res!293274 () Bool)

(declare-fun e!288141 () Bool)

(assert (=> b!490191 (=> (not res!293274) (not e!288141))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490191 (= res!293274 (validKeyInArray!0 k0!2280))))

(declare-fun b!490192 () Bool)

(declare-fun e!288144 () Bool)

(declare-fun e!288142 () Bool)

(assert (=> b!490192 (= e!288144 (not e!288142))))

(declare-fun res!293269 () Bool)

(assert (=> b!490192 (=> res!293269 e!288142)))

(declare-fun lt!221278 () (_ BitVec 64))

(declare-datatypes ((array!31751 0))(
  ( (array!31752 (arr!15263 (Array (_ BitVec 32) (_ BitVec 64))) (size!15628 (_ BitVec 32))) )
))
(declare-fun lt!221275 () array!31751)

(declare-fun a!3235 () array!31751)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3727 0))(
  ( (MissingZero!3727 (index!17087 (_ BitVec 32))) (Found!3727 (index!17088 (_ BitVec 32))) (Intermediate!3727 (undefined!4539 Bool) (index!17089 (_ BitVec 32)) (x!46196 (_ BitVec 32))) (Undefined!3727) (MissingVacant!3727 (index!17090 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31751 (_ BitVec 32)) SeekEntryResult!3727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490192 (= res!293269 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15263 a!3235) j!176) mask!3524) (select (arr!15263 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221278 mask!3524) lt!221278 lt!221275 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490192 (= lt!221278 (select (store (arr!15263 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490192 (= lt!221275 (array!31752 (store (arr!15263 a!3235) i!1204 k0!2280) (size!15628 a!3235)))))

(declare-fun lt!221277 () SeekEntryResult!3727)

(assert (=> b!490192 (= lt!221277 (Found!3727 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31751 (_ BitVec 32)) SeekEntryResult!3727)

(assert (=> b!490192 (= lt!221277 (seekEntryOrOpen!0 (select (arr!15263 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31751 (_ BitVec 32)) Bool)

(assert (=> b!490192 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14386 0))(
  ( (Unit!14387) )
))
(declare-fun lt!221276 () Unit!14386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14386)

(assert (=> b!490192 (= lt!221276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490193 () Bool)

(declare-fun res!293273 () Bool)

(assert (=> b!490193 (=> (not res!293273) (not e!288141))))

(assert (=> b!490193 (= res!293273 (validKeyInArray!0 (select (arr!15263 a!3235) j!176)))))

(declare-fun b!490194 () Bool)

(assert (=> b!490194 (= e!288141 e!288144)))

(declare-fun res!293271 () Bool)

(assert (=> b!490194 (=> (not res!293271) (not e!288144))))

(declare-fun lt!221274 () SeekEntryResult!3727)

(assert (=> b!490194 (= res!293271 (or (= lt!221274 (MissingZero!3727 i!1204)) (= lt!221274 (MissingVacant!3727 i!1204))))))

(assert (=> b!490194 (= lt!221274 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490195 () Bool)

(declare-fun res!293276 () Bool)

(assert (=> b!490195 (=> (not res!293276) (not e!288144))))

(declare-datatypes ((List!9460 0))(
  ( (Nil!9457) (Cons!9456 (h!10318 (_ BitVec 64)) (t!15679 List!9460)) )
))
(declare-fun arrayNoDuplicates!0 (array!31751 (_ BitVec 32) List!9460) Bool)

(assert (=> b!490195 (= res!293276 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9457))))

(declare-fun b!490196 () Bool)

(declare-fun res!293272 () Bool)

(assert (=> b!490196 (=> (not res!293272) (not e!288144))))

(assert (=> b!490196 (= res!293272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490197 () Bool)

(declare-fun res!293270 () Bool)

(assert (=> b!490197 (=> (not res!293270) (not e!288141))))

(assert (=> b!490197 (= res!293270 (and (= (size!15628 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15628 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15628 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490198 () Bool)

(declare-fun res!293268 () Bool)

(assert (=> b!490198 (=> (not res!293268) (not e!288141))))

(declare-fun arrayContainsKey!0 (array!31751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490198 (= res!293268 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!293275 () Bool)

(assert (=> start!44682 (=> (not res!293275) (not e!288141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44682 (= res!293275 (validMask!0 mask!3524))))

(assert (=> start!44682 e!288141))

(assert (=> start!44682 true))

(declare-fun array_inv!11146 (array!31751) Bool)

(assert (=> start!44682 (array_inv!11146 a!3235)))

(declare-fun b!490190 () Bool)

(assert (=> b!490190 (= e!288142 true)))

(assert (=> b!490190 (= lt!221277 (seekEntryOrOpen!0 lt!221278 lt!221275 mask!3524))))

(declare-fun lt!221273 () Unit!14386)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31751 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14386)

(assert (=> b!490190 (= lt!221273 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44682 res!293275) b!490197))

(assert (= (and b!490197 res!293270) b!490193))

(assert (= (and b!490193 res!293273) b!490191))

(assert (= (and b!490191 res!293274) b!490198))

(assert (= (and b!490198 res!293268) b!490194))

(assert (= (and b!490194 res!293271) b!490196))

(assert (= (and b!490196 res!293272) b!490195))

(assert (= (and b!490195 res!293276) b!490192))

(assert (= (and b!490192 (not res!293269)) b!490190))

(declare-fun m!469825 () Bool)

(assert (=> b!490196 m!469825))

(declare-fun m!469827 () Bool)

(assert (=> b!490198 m!469827))

(declare-fun m!469829 () Bool)

(assert (=> b!490190 m!469829))

(declare-fun m!469831 () Bool)

(assert (=> b!490190 m!469831))

(declare-fun m!469833 () Bool)

(assert (=> b!490195 m!469833))

(declare-fun m!469835 () Bool)

(assert (=> start!44682 m!469835))

(declare-fun m!469837 () Bool)

(assert (=> start!44682 m!469837))

(declare-fun m!469839 () Bool)

(assert (=> b!490192 m!469839))

(declare-fun m!469841 () Bool)

(assert (=> b!490192 m!469841))

(declare-fun m!469843 () Bool)

(assert (=> b!490192 m!469843))

(declare-fun m!469845 () Bool)

(assert (=> b!490192 m!469845))

(declare-fun m!469847 () Bool)

(assert (=> b!490192 m!469847))

(declare-fun m!469849 () Bool)

(assert (=> b!490192 m!469849))

(assert (=> b!490192 m!469847))

(assert (=> b!490192 m!469845))

(declare-fun m!469851 () Bool)

(assert (=> b!490192 m!469851))

(declare-fun m!469853 () Bool)

(assert (=> b!490192 m!469853))

(declare-fun m!469855 () Bool)

(assert (=> b!490192 m!469855))

(assert (=> b!490192 m!469847))

(declare-fun m!469857 () Bool)

(assert (=> b!490192 m!469857))

(assert (=> b!490192 m!469851))

(assert (=> b!490192 m!469847))

(declare-fun m!469859 () Bool)

(assert (=> b!490194 m!469859))

(assert (=> b!490193 m!469847))

(assert (=> b!490193 m!469847))

(declare-fun m!469861 () Bool)

(assert (=> b!490193 m!469861))

(declare-fun m!469863 () Bool)

(assert (=> b!490191 m!469863))

(check-sat (not b!490192) (not b!490190) (not b!490191) (not b!490194) (not b!490198) (not b!490196) (not start!44682) (not b!490193) (not b!490195))
(check-sat)
