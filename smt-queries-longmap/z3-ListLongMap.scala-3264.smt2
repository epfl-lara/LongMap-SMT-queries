; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45458 () Bool)

(assert start!45458)

(declare-fun b!500268 () Bool)

(declare-fun e!293111 () Bool)

(declare-fun e!293113 () Bool)

(assert (=> b!500268 (= e!293111 (not e!293113))))

(declare-fun res!302131 () Bool)

(assert (=> b!500268 (=> res!302131 e!293113)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227003 () (_ BitVec 64))

(declare-fun lt!227000 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3990 0))(
  ( (MissingZero!3990 (index!18142 (_ BitVec 32))) (Found!3990 (index!18143 (_ BitVec 32))) (Intermediate!3990 (undefined!4802 Bool) (index!18144 (_ BitVec 32)) (x!47179 (_ BitVec 32))) (Undefined!3990) (MissingVacant!3990 (index!18145 (_ BitVec 32))) )
))
(declare-fun lt!227001 () SeekEntryResult!3990)

(declare-datatypes ((array!32283 0))(
  ( (array!32284 (arr!15523 (Array (_ BitVec 32) (_ BitVec 64))) (size!15887 (_ BitVec 32))) )
))
(declare-fun lt!227005 () array!32283)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32283 (_ BitVec 32)) SeekEntryResult!3990)

(assert (=> b!500268 (= res!302131 (= lt!227001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227000 lt!227003 lt!227005 mask!3524)))))

(declare-fun lt!227008 () (_ BitVec 32))

(declare-fun a!3235 () array!32283)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500268 (= lt!227001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227008 (select (arr!15523 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500268 (= lt!227000 (toIndex!0 lt!227003 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500268 (= lt!227003 (select (store (arr!15523 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500268 (= lt!227008 (toIndex!0 (select (arr!15523 a!3235) j!176) mask!3524))))

(assert (=> b!500268 (= lt!227005 (array!32284 (store (arr!15523 a!3235) i!1204 k0!2280) (size!15887 a!3235)))))

(declare-fun e!293117 () Bool)

(assert (=> b!500268 e!293117))

(declare-fun res!302132 () Bool)

(assert (=> b!500268 (=> (not res!302132) (not e!293117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32283 (_ BitVec 32)) Bool)

(assert (=> b!500268 (= res!302132 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15036 0))(
  ( (Unit!15037) )
))
(declare-fun lt!227006 () Unit!15036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15036)

(assert (=> b!500268 (= lt!227006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500269 () Bool)

(declare-fun res!302123 () Bool)

(assert (=> b!500269 (=> (not res!302123) (not e!293111))))

(assert (=> b!500269 (= res!302123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500270 () Bool)

(declare-fun e!293112 () Unit!15036)

(declare-fun Unit!15038 () Unit!15036)

(assert (=> b!500270 (= e!293112 Unit!15038)))

(declare-fun lt!227004 () Unit!15036)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15036)

(assert (=> b!500270 (= lt!227004 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227008 #b00000000000000000000000000000000 (index!18144 lt!227001) (x!47179 lt!227001) mask!3524))))

(declare-fun res!302122 () Bool)

(assert (=> b!500270 (= res!302122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227008 lt!227003 lt!227005 mask!3524) (Intermediate!3990 false (index!18144 lt!227001) (x!47179 lt!227001))))))

(declare-fun e!293116 () Bool)

(assert (=> b!500270 (=> (not res!302122) (not e!293116))))

(assert (=> b!500270 e!293116))

(declare-fun b!500271 () Bool)

(declare-fun res!302120 () Bool)

(declare-fun e!293118 () Bool)

(assert (=> b!500271 (=> (not res!302120) (not e!293118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500271 (= res!302120 (validKeyInArray!0 k0!2280))))

(declare-fun b!500272 () Bool)

(assert (=> b!500272 (= e!293116 false)))

(declare-fun b!500273 () Bool)

(declare-fun Unit!15039 () Unit!15036)

(assert (=> b!500273 (= e!293112 Unit!15039)))

(declare-fun res!302129 () Bool)

(assert (=> start!45458 (=> (not res!302129) (not e!293118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45458 (= res!302129 (validMask!0 mask!3524))))

(assert (=> start!45458 e!293118))

(assert (=> start!45458 true))

(declare-fun array_inv!11319 (array!32283) Bool)

(assert (=> start!45458 (array_inv!11319 a!3235)))

(declare-fun b!500274 () Bool)

(assert (=> b!500274 (= e!293118 e!293111)))

(declare-fun res!302127 () Bool)

(assert (=> b!500274 (=> (not res!302127) (not e!293111))))

(declare-fun lt!227002 () SeekEntryResult!3990)

(assert (=> b!500274 (= res!302127 (or (= lt!227002 (MissingZero!3990 i!1204)) (= lt!227002 (MissingVacant!3990 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32283 (_ BitVec 32)) SeekEntryResult!3990)

(assert (=> b!500274 (= lt!227002 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500275 () Bool)

(declare-fun e!293114 () Bool)

(assert (=> b!500275 (= e!293113 e!293114)))

(declare-fun res!302128 () Bool)

(assert (=> b!500275 (=> res!302128 e!293114)))

(assert (=> b!500275 (= res!302128 (or (bvsgt #b00000000000000000000000000000000 (x!47179 lt!227001)) (bvsgt (x!47179 lt!227001) #b01111111111111111111111111111110) (bvslt lt!227008 #b00000000000000000000000000000000) (bvsge lt!227008 (size!15887 a!3235)) (bvslt (index!18144 lt!227001) #b00000000000000000000000000000000) (bvsge (index!18144 lt!227001) (size!15887 a!3235)) (not (= lt!227001 (Intermediate!3990 false (index!18144 lt!227001) (x!47179 lt!227001))))))))

(assert (=> b!500275 (and (or (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226999 () Unit!15036)

(assert (=> b!500275 (= lt!226999 e!293112)))

(declare-fun c!59351 () Bool)

(assert (=> b!500275 (= c!59351 (= (select (arr!15523 a!3235) (index!18144 lt!227001)) (select (arr!15523 a!3235) j!176)))))

(assert (=> b!500275 (and (bvslt (x!47179 lt!227001) #b01111111111111111111111111111110) (or (= (select (arr!15523 a!3235) (index!18144 lt!227001)) (select (arr!15523 a!3235) j!176)) (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15523 a!3235) (index!18144 lt!227001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500276 () Bool)

(assert (=> b!500276 (= e!293117 (= (seekEntryOrOpen!0 (select (arr!15523 a!3235) j!176) a!3235 mask!3524) (Found!3990 j!176)))))

(declare-fun b!500277 () Bool)

(declare-fun res!302126 () Bool)

(assert (=> b!500277 (=> res!302126 e!293113)))

(get-info :version)

(assert (=> b!500277 (= res!302126 (or (undefined!4802 lt!227001) (not ((_ is Intermediate!3990) lt!227001))))))

(declare-fun b!500278 () Bool)

(declare-fun res!302130 () Bool)

(assert (=> b!500278 (=> (not res!302130) (not e!293118))))

(assert (=> b!500278 (= res!302130 (validKeyInArray!0 (select (arr!15523 a!3235) j!176)))))

(declare-fun b!500279 () Bool)

(assert (=> b!500279 (= e!293114 true)))

(declare-fun lt!227007 () SeekEntryResult!3990)

(assert (=> b!500279 (= lt!227007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227008 lt!227003 lt!227005 mask!3524))))

(declare-fun b!500280 () Bool)

(declare-fun res!302121 () Bool)

(assert (=> b!500280 (=> (not res!302121) (not e!293118))))

(declare-fun arrayContainsKey!0 (array!32283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500280 (= res!302121 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500281 () Bool)

(declare-fun res!302124 () Bool)

(assert (=> b!500281 (=> (not res!302124) (not e!293118))))

(assert (=> b!500281 (= res!302124 (and (= (size!15887 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15887 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15887 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500282 () Bool)

(declare-fun res!302125 () Bool)

(assert (=> b!500282 (=> (not res!302125) (not e!293111))))

(declare-datatypes ((List!9681 0))(
  ( (Nil!9678) (Cons!9677 (h!10551 (_ BitVec 64)) (t!15909 List!9681)) )
))
(declare-fun arrayNoDuplicates!0 (array!32283 (_ BitVec 32) List!9681) Bool)

(assert (=> b!500282 (= res!302125 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9678))))

(assert (= (and start!45458 res!302129) b!500281))

(assert (= (and b!500281 res!302124) b!500278))

(assert (= (and b!500278 res!302130) b!500271))

(assert (= (and b!500271 res!302120) b!500280))

(assert (= (and b!500280 res!302121) b!500274))

(assert (= (and b!500274 res!302127) b!500269))

(assert (= (and b!500269 res!302123) b!500282))

(assert (= (and b!500282 res!302125) b!500268))

(assert (= (and b!500268 res!302132) b!500276))

(assert (= (and b!500268 (not res!302131)) b!500277))

(assert (= (and b!500277 (not res!302126)) b!500275))

(assert (= (and b!500275 c!59351) b!500270))

(assert (= (and b!500275 (not c!59351)) b!500273))

(assert (= (and b!500270 res!302122) b!500272))

(assert (= (and b!500275 (not res!302128)) b!500279))

(declare-fun m!481413 () Bool)

(assert (=> b!500275 m!481413))

(declare-fun m!481415 () Bool)

(assert (=> b!500275 m!481415))

(declare-fun m!481417 () Bool)

(assert (=> b!500268 m!481417))

(declare-fun m!481419 () Bool)

(assert (=> b!500268 m!481419))

(declare-fun m!481421 () Bool)

(assert (=> b!500268 m!481421))

(declare-fun m!481423 () Bool)

(assert (=> b!500268 m!481423))

(assert (=> b!500268 m!481415))

(declare-fun m!481425 () Bool)

(assert (=> b!500268 m!481425))

(assert (=> b!500268 m!481415))

(declare-fun m!481427 () Bool)

(assert (=> b!500268 m!481427))

(declare-fun m!481429 () Bool)

(assert (=> b!500268 m!481429))

(assert (=> b!500268 m!481415))

(declare-fun m!481431 () Bool)

(assert (=> b!500268 m!481431))

(declare-fun m!481433 () Bool)

(assert (=> b!500282 m!481433))

(assert (=> b!500276 m!481415))

(assert (=> b!500276 m!481415))

(declare-fun m!481435 () Bool)

(assert (=> b!500276 m!481435))

(declare-fun m!481437 () Bool)

(assert (=> start!45458 m!481437))

(declare-fun m!481439 () Bool)

(assert (=> start!45458 m!481439))

(assert (=> b!500278 m!481415))

(assert (=> b!500278 m!481415))

(declare-fun m!481441 () Bool)

(assert (=> b!500278 m!481441))

(declare-fun m!481443 () Bool)

(assert (=> b!500274 m!481443))

(declare-fun m!481445 () Bool)

(assert (=> b!500271 m!481445))

(declare-fun m!481447 () Bool)

(assert (=> b!500269 m!481447))

(declare-fun m!481449 () Bool)

(assert (=> b!500270 m!481449))

(declare-fun m!481451 () Bool)

(assert (=> b!500270 m!481451))

(assert (=> b!500279 m!481451))

(declare-fun m!481453 () Bool)

(assert (=> b!500280 m!481453))

(check-sat (not b!500271) (not b!500278) (not b!500268) (not start!45458) (not b!500279) (not b!500274) (not b!500282) (not b!500270) (not b!500269) (not b!500280) (not b!500276))
(check-sat)
