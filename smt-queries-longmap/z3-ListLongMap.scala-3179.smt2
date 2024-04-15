; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44688 () Bool)

(assert start!44688)

(declare-fun b!490271 () Bool)

(declare-fun res!293352 () Bool)

(declare-fun e!288178 () Bool)

(assert (=> b!490271 (=> (not res!293352) (not e!288178))))

(declare-datatypes ((array!31757 0))(
  ( (array!31758 (arr!15266 (Array (_ BitVec 32) (_ BitVec 64))) (size!15631 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31757)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490271 (= res!293352 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490272 () Bool)

(declare-fun e!288177 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!490272 (= e!288177 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!221330 () array!31757)

(declare-fun lt!221327 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3730 0))(
  ( (MissingZero!3730 (index!17099 (_ BitVec 32))) (Found!3730 (index!17100 (_ BitVec 32))) (Intermediate!3730 (undefined!4542 Bool) (index!17101 (_ BitVec 32)) (x!46207 (_ BitVec 32))) (Undefined!3730) (MissingVacant!3730 (index!17102 (_ BitVec 32))) )
))
(declare-fun lt!221332 () SeekEntryResult!3730)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31757 (_ BitVec 32)) SeekEntryResult!3730)

(assert (=> b!490272 (= lt!221332 (seekEntryOrOpen!0 lt!221327 lt!221330 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!14392 0))(
  ( (Unit!14393) )
))
(declare-fun lt!221328 () Unit!14392)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14392)

(assert (=> b!490272 (= lt!221328 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490273 () Bool)

(declare-fun res!293354 () Bool)

(assert (=> b!490273 (=> (not res!293354) (not e!288178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490273 (= res!293354 (validKeyInArray!0 k0!2280))))

(declare-fun b!490274 () Bool)

(declare-fun res!293350 () Bool)

(assert (=> b!490274 (=> (not res!293350) (not e!288178))))

(assert (=> b!490274 (= res!293350 (validKeyInArray!0 (select (arr!15266 a!3235) j!176)))))

(declare-fun b!490276 () Bool)

(declare-fun res!293355 () Bool)

(assert (=> b!490276 (=> (not res!293355) (not e!288178))))

(assert (=> b!490276 (= res!293355 (and (= (size!15631 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15631 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15631 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490277 () Bool)

(declare-fun e!288180 () Bool)

(assert (=> b!490277 (= e!288180 (not e!288177))))

(declare-fun res!293357 () Bool)

(assert (=> b!490277 (=> res!293357 e!288177)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31757 (_ BitVec 32)) SeekEntryResult!3730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490277 (= res!293357 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15266 a!3235) j!176) mask!3524) (select (arr!15266 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221327 mask!3524) lt!221327 lt!221330 mask!3524))))))

(assert (=> b!490277 (= lt!221327 (select (store (arr!15266 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490277 (= lt!221330 (array!31758 (store (arr!15266 a!3235) i!1204 k0!2280) (size!15631 a!3235)))))

(assert (=> b!490277 (= lt!221332 (Found!3730 j!176))))

(assert (=> b!490277 (= lt!221332 (seekEntryOrOpen!0 (select (arr!15266 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31757 (_ BitVec 32)) Bool)

(assert (=> b!490277 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221331 () Unit!14392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14392)

(assert (=> b!490277 (= lt!221331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490278 () Bool)

(assert (=> b!490278 (= e!288178 e!288180)))

(declare-fun res!293351 () Bool)

(assert (=> b!490278 (=> (not res!293351) (not e!288180))))

(declare-fun lt!221329 () SeekEntryResult!3730)

(assert (=> b!490278 (= res!293351 (or (= lt!221329 (MissingZero!3730 i!1204)) (= lt!221329 (MissingVacant!3730 i!1204))))))

(assert (=> b!490278 (= lt!221329 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490279 () Bool)

(declare-fun res!293349 () Bool)

(assert (=> b!490279 (=> (not res!293349) (not e!288180))))

(declare-datatypes ((List!9463 0))(
  ( (Nil!9460) (Cons!9459 (h!10321 (_ BitVec 64)) (t!15682 List!9463)) )
))
(declare-fun arrayNoDuplicates!0 (array!31757 (_ BitVec 32) List!9463) Bool)

(assert (=> b!490279 (= res!293349 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9460))))

(declare-fun b!490275 () Bool)

(declare-fun res!293353 () Bool)

(assert (=> b!490275 (=> (not res!293353) (not e!288180))))

(assert (=> b!490275 (= res!293353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!293356 () Bool)

(assert (=> start!44688 (=> (not res!293356) (not e!288178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44688 (= res!293356 (validMask!0 mask!3524))))

(assert (=> start!44688 e!288178))

(assert (=> start!44688 true))

(declare-fun array_inv!11149 (array!31757) Bool)

(assert (=> start!44688 (array_inv!11149 a!3235)))

(assert (= (and start!44688 res!293356) b!490276))

(assert (= (and b!490276 res!293355) b!490274))

(assert (= (and b!490274 res!293350) b!490273))

(assert (= (and b!490273 res!293354) b!490271))

(assert (= (and b!490271 res!293352) b!490278))

(assert (= (and b!490278 res!293351) b!490275))

(assert (= (and b!490275 res!293353) b!490279))

(assert (= (and b!490279 res!293349) b!490277))

(assert (= (and b!490277 (not res!293357)) b!490272))

(declare-fun m!469945 () Bool)

(assert (=> b!490278 m!469945))

(declare-fun m!469947 () Bool)

(assert (=> b!490273 m!469947))

(declare-fun m!469949 () Bool)

(assert (=> b!490271 m!469949))

(declare-fun m!469951 () Bool)

(assert (=> start!44688 m!469951))

(declare-fun m!469953 () Bool)

(assert (=> start!44688 m!469953))

(declare-fun m!469955 () Bool)

(assert (=> b!490277 m!469955))

(declare-fun m!469957 () Bool)

(assert (=> b!490277 m!469957))

(declare-fun m!469959 () Bool)

(assert (=> b!490277 m!469959))

(declare-fun m!469961 () Bool)

(assert (=> b!490277 m!469961))

(declare-fun m!469963 () Bool)

(assert (=> b!490277 m!469963))

(declare-fun m!469965 () Bool)

(assert (=> b!490277 m!469965))

(assert (=> b!490277 m!469963))

(assert (=> b!490277 m!469961))

(assert (=> b!490277 m!469963))

(declare-fun m!469967 () Bool)

(assert (=> b!490277 m!469967))

(assert (=> b!490277 m!469963))

(declare-fun m!469969 () Bool)

(assert (=> b!490277 m!469969))

(assert (=> b!490277 m!469955))

(declare-fun m!469971 () Bool)

(assert (=> b!490277 m!469971))

(declare-fun m!469973 () Bool)

(assert (=> b!490277 m!469973))

(declare-fun m!469975 () Bool)

(assert (=> b!490275 m!469975))

(declare-fun m!469977 () Bool)

(assert (=> b!490279 m!469977))

(declare-fun m!469979 () Bool)

(assert (=> b!490272 m!469979))

(declare-fun m!469981 () Bool)

(assert (=> b!490272 m!469981))

(assert (=> b!490274 m!469963))

(assert (=> b!490274 m!469963))

(declare-fun m!469983 () Bool)

(assert (=> b!490274 m!469983))

(check-sat (not b!490277) (not b!490271) (not start!44688) (not b!490278) (not b!490273) (not b!490272) (not b!490279) (not b!490275) (not b!490274))
(check-sat)
