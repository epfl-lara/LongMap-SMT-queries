; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46404 () Bool)

(assert start!46404)

(declare-fun b!513252 () Bool)

(declare-fun res!313690 () Bool)

(declare-fun e!299687 () Bool)

(assert (=> b!513252 (=> (not res!313690) (not e!299687))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513252 (= res!313690 (validKeyInArray!0 k0!2280))))

(declare-fun b!513253 () Bool)

(declare-fun res!313700 () Bool)

(declare-fun e!299688 () Bool)

(assert (=> b!513253 (=> (not res!313700) (not e!299688))))

(declare-datatypes ((array!32954 0))(
  ( (array!32955 (arr!15851 (Array (_ BitVec 32) (_ BitVec 64))) (size!16216 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32954)

(declare-datatypes ((List!10048 0))(
  ( (Nil!10045) (Cons!10044 (h!10930 (_ BitVec 64)) (t!16267 List!10048)) )
))
(declare-fun arrayNoDuplicates!0 (array!32954 (_ BitVec 32) List!10048) Bool)

(assert (=> b!513253 (= res!313700 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10045))))

(declare-datatypes ((SeekEntryResult!4315 0))(
  ( (MissingZero!4315 (index!19448 (_ BitVec 32))) (Found!4315 (index!19449 (_ BitVec 32))) (Intermediate!4315 (undefined!5127 Bool) (index!19450 (_ BitVec 32)) (x!48409 (_ BitVec 32))) (Undefined!4315) (MissingVacant!4315 (index!19451 (_ BitVec 32))) )
))
(declare-fun lt!234871 () SeekEntryResult!4315)

(declare-fun e!299690 () Bool)

(declare-fun b!513254 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513254 (= e!299690 (or (= (select (arr!15851 a!3235) (index!19450 lt!234871)) (select (arr!15851 a!3235) j!176)) (and (bvsge (index!19450 lt!234871) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234871) (size!16216 a!3235)))))))

(assert (=> b!513254 (bvslt (x!48409 lt!234871) #b01111111111111111111111111111110)))

(declare-fun b!513255 () Bool)

(declare-fun res!313694 () Bool)

(assert (=> b!513255 (=> (not res!313694) (not e!299687))))

(declare-fun arrayContainsKey!0 (array!32954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513255 (= res!313694 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!513256 () Bool)

(declare-fun e!299691 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32954 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513256 (= e!299691 (= (seekEntryOrOpen!0 (select (arr!15851 a!3235) j!176) a!3235 mask!3524) (Found!4315 j!176)))))

(declare-fun b!513257 () Bool)

(declare-fun res!313696 () Bool)

(assert (=> b!513257 (=> (not res!313696) (not e!299687))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513257 (= res!313696 (and (= (size!16216 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16216 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16216 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513258 () Bool)

(declare-fun res!313695 () Bool)

(assert (=> b!513258 (=> (not res!313695) (not e!299687))))

(assert (=> b!513258 (= res!313695 (validKeyInArray!0 (select (arr!15851 a!3235) j!176)))))

(declare-fun b!513259 () Bool)

(declare-fun res!313697 () Bool)

(assert (=> b!513259 (=> (not res!313697) (not e!299688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32954 (_ BitVec 32)) Bool)

(assert (=> b!513259 (= res!313697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513260 () Bool)

(assert (=> b!513260 (= e!299688 (not e!299690))))

(declare-fun res!313699 () Bool)

(assert (=> b!513260 (=> res!313699 e!299690)))

(declare-fun lt!234873 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32954 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513260 (= res!313699 (= lt!234871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234873 (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)) mask!3524)))))

(declare-fun lt!234872 () (_ BitVec 32))

(assert (=> b!513260 (= lt!234871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234872 (select (arr!15851 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513260 (= lt!234873 (toIndex!0 (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513260 (= lt!234872 (toIndex!0 (select (arr!15851 a!3235) j!176) mask!3524))))

(assert (=> b!513260 e!299691))

(declare-fun res!313691 () Bool)

(assert (=> b!513260 (=> (not res!313691) (not e!299691))))

(assert (=> b!513260 (= res!313691 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15874 0))(
  ( (Unit!15875) )
))
(declare-fun lt!234874 () Unit!15874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15874)

(assert (=> b!513260 (= lt!234874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513261 () Bool)

(assert (=> b!513261 (= e!299687 e!299688)))

(declare-fun res!313698 () Bool)

(assert (=> b!513261 (=> (not res!313698) (not e!299688))))

(declare-fun lt!234870 () SeekEntryResult!4315)

(assert (=> b!513261 (= res!313698 (or (= lt!234870 (MissingZero!4315 i!1204)) (= lt!234870 (MissingVacant!4315 i!1204))))))

(assert (=> b!513261 (= lt!234870 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!313693 () Bool)

(assert (=> start!46404 (=> (not res!313693) (not e!299687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46404 (= res!313693 (validMask!0 mask!3524))))

(assert (=> start!46404 e!299687))

(assert (=> start!46404 true))

(declare-fun array_inv!11734 (array!32954) Bool)

(assert (=> start!46404 (array_inv!11734 a!3235)))

(declare-fun b!513262 () Bool)

(declare-fun res!313692 () Bool)

(assert (=> b!513262 (=> res!313692 e!299690)))

(get-info :version)

(assert (=> b!513262 (= res!313692 (or (undefined!5127 lt!234871) (not ((_ is Intermediate!4315) lt!234871))))))

(assert (= (and start!46404 res!313693) b!513257))

(assert (= (and b!513257 res!313696) b!513258))

(assert (= (and b!513258 res!313695) b!513252))

(assert (= (and b!513252 res!313690) b!513255))

(assert (= (and b!513255 res!313694) b!513261))

(assert (= (and b!513261 res!313698) b!513259))

(assert (= (and b!513259 res!313697) b!513253))

(assert (= (and b!513253 res!313700) b!513260))

(assert (= (and b!513260 res!313691) b!513256))

(assert (= (and b!513260 (not res!313699)) b!513262))

(assert (= (and b!513262 (not res!313692)) b!513254))

(declare-fun m!494341 () Bool)

(assert (=> b!513255 m!494341))

(declare-fun m!494343 () Bool)

(assert (=> b!513260 m!494343))

(declare-fun m!494345 () Bool)

(assert (=> b!513260 m!494345))

(declare-fun m!494347 () Bool)

(assert (=> b!513260 m!494347))

(declare-fun m!494349 () Bool)

(assert (=> b!513260 m!494349))

(declare-fun m!494351 () Bool)

(assert (=> b!513260 m!494351))

(declare-fun m!494353 () Bool)

(assert (=> b!513260 m!494353))

(assert (=> b!513260 m!494349))

(assert (=> b!513260 m!494343))

(declare-fun m!494355 () Bool)

(assert (=> b!513260 m!494355))

(assert (=> b!513260 m!494343))

(declare-fun m!494357 () Bool)

(assert (=> b!513260 m!494357))

(assert (=> b!513260 m!494349))

(declare-fun m!494359 () Bool)

(assert (=> b!513260 m!494359))

(declare-fun m!494361 () Bool)

(assert (=> b!513253 m!494361))

(declare-fun m!494363 () Bool)

(assert (=> b!513261 m!494363))

(declare-fun m!494365 () Bool)

(assert (=> start!46404 m!494365))

(declare-fun m!494367 () Bool)

(assert (=> start!46404 m!494367))

(declare-fun m!494369 () Bool)

(assert (=> b!513254 m!494369))

(assert (=> b!513254 m!494343))

(assert (=> b!513258 m!494343))

(assert (=> b!513258 m!494343))

(declare-fun m!494371 () Bool)

(assert (=> b!513258 m!494371))

(declare-fun m!494373 () Bool)

(assert (=> b!513252 m!494373))

(assert (=> b!513256 m!494343))

(assert (=> b!513256 m!494343))

(declare-fun m!494375 () Bool)

(assert (=> b!513256 m!494375))

(declare-fun m!494377 () Bool)

(assert (=> b!513259 m!494377))

(check-sat (not b!513252) (not b!513258) (not b!513261) (not b!513255) (not b!513256) (not start!46404) (not b!513260) (not b!513259) (not b!513253))
(check-sat)
(get-model)

(declare-fun d!78971 () Bool)

(assert (=> d!78971 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46404 d!78971))

(declare-fun d!78973 () Bool)

(assert (=> d!78973 (= (array_inv!11734 a!3235) (bvsge (size!16216 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46404 d!78973))

(declare-fun b!513341 () Bool)

(declare-fun e!299730 () SeekEntryResult!4315)

(declare-fun e!299728 () SeekEntryResult!4315)

(assert (=> b!513341 (= e!299730 e!299728)))

(declare-fun lt!234912 () (_ BitVec 64))

(declare-fun lt!234911 () SeekEntryResult!4315)

(assert (=> b!513341 (= lt!234912 (select (arr!15851 a!3235) (index!19450 lt!234911)))))

(declare-fun c!60070 () Bool)

(assert (=> b!513341 (= c!60070 (= lt!234912 (select (arr!15851 a!3235) j!176)))))

(declare-fun e!299729 () SeekEntryResult!4315)

(declare-fun b!513342 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32954 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513342 (= e!299729 (seekKeyOrZeroReturnVacant!0 (x!48409 lt!234911) (index!19450 lt!234911) (index!19450 lt!234911) (select (arr!15851 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513343 () Bool)

(assert (=> b!513343 (= e!299729 (MissingZero!4315 (index!19450 lt!234911)))))

(declare-fun b!513344 () Bool)

(assert (=> b!513344 (= e!299728 (Found!4315 (index!19450 lt!234911)))))

(declare-fun b!513345 () Bool)

(assert (=> b!513345 (= e!299730 Undefined!4315)))

(declare-fun d!78975 () Bool)

(declare-fun lt!234913 () SeekEntryResult!4315)

(assert (=> d!78975 (and (or ((_ is Undefined!4315) lt!234913) (not ((_ is Found!4315) lt!234913)) (and (bvsge (index!19449 lt!234913) #b00000000000000000000000000000000) (bvslt (index!19449 lt!234913) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234913) ((_ is Found!4315) lt!234913) (not ((_ is MissingZero!4315) lt!234913)) (and (bvsge (index!19448 lt!234913) #b00000000000000000000000000000000) (bvslt (index!19448 lt!234913) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234913) ((_ is Found!4315) lt!234913) ((_ is MissingZero!4315) lt!234913) (not ((_ is MissingVacant!4315) lt!234913)) (and (bvsge (index!19451 lt!234913) #b00000000000000000000000000000000) (bvslt (index!19451 lt!234913) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234913) (ite ((_ is Found!4315) lt!234913) (= (select (arr!15851 a!3235) (index!19449 lt!234913)) (select (arr!15851 a!3235) j!176)) (ite ((_ is MissingZero!4315) lt!234913) (= (select (arr!15851 a!3235) (index!19448 lt!234913)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4315) lt!234913) (= (select (arr!15851 a!3235) (index!19451 lt!234913)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78975 (= lt!234913 e!299730)))

(declare-fun c!60072 () Bool)

(assert (=> d!78975 (= c!60072 (and ((_ is Intermediate!4315) lt!234911) (undefined!5127 lt!234911)))))

(assert (=> d!78975 (= lt!234911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15851 a!3235) j!176) mask!3524) (select (arr!15851 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78975 (validMask!0 mask!3524)))

(assert (=> d!78975 (= (seekEntryOrOpen!0 (select (arr!15851 a!3235) j!176) a!3235 mask!3524) lt!234913)))

(declare-fun b!513346 () Bool)

(declare-fun c!60071 () Bool)

(assert (=> b!513346 (= c!60071 (= lt!234912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513346 (= e!299728 e!299729)))

(assert (= (and d!78975 c!60072) b!513345))

(assert (= (and d!78975 (not c!60072)) b!513341))

(assert (= (and b!513341 c!60070) b!513344))

(assert (= (and b!513341 (not c!60070)) b!513346))

(assert (= (and b!513346 c!60071) b!513343))

(assert (= (and b!513346 (not c!60071)) b!513342))

(declare-fun m!494455 () Bool)

(assert (=> b!513341 m!494455))

(assert (=> b!513342 m!494343))

(declare-fun m!494457 () Bool)

(assert (=> b!513342 m!494457))

(declare-fun m!494459 () Bool)

(assert (=> d!78975 m!494459))

(declare-fun m!494461 () Bool)

(assert (=> d!78975 m!494461))

(assert (=> d!78975 m!494343))

(assert (=> d!78975 m!494355))

(declare-fun m!494463 () Bool)

(assert (=> d!78975 m!494463))

(assert (=> d!78975 m!494365))

(assert (=> d!78975 m!494355))

(assert (=> d!78975 m!494343))

(declare-fun m!494465 () Bool)

(assert (=> d!78975 m!494465))

(assert (=> b!513256 d!78975))

(declare-fun b!513347 () Bool)

(declare-fun e!299733 () SeekEntryResult!4315)

(declare-fun e!299731 () SeekEntryResult!4315)

(assert (=> b!513347 (= e!299733 e!299731)))

(declare-fun lt!234915 () (_ BitVec 64))

(declare-fun lt!234914 () SeekEntryResult!4315)

(assert (=> b!513347 (= lt!234915 (select (arr!15851 a!3235) (index!19450 lt!234914)))))

(declare-fun c!60073 () Bool)

(assert (=> b!513347 (= c!60073 (= lt!234915 k0!2280))))

(declare-fun e!299732 () SeekEntryResult!4315)

(declare-fun b!513348 () Bool)

(assert (=> b!513348 (= e!299732 (seekKeyOrZeroReturnVacant!0 (x!48409 lt!234914) (index!19450 lt!234914) (index!19450 lt!234914) k0!2280 a!3235 mask!3524))))

(declare-fun b!513349 () Bool)

(assert (=> b!513349 (= e!299732 (MissingZero!4315 (index!19450 lt!234914)))))

(declare-fun b!513350 () Bool)

(assert (=> b!513350 (= e!299731 (Found!4315 (index!19450 lt!234914)))))

(declare-fun b!513351 () Bool)

(assert (=> b!513351 (= e!299733 Undefined!4315)))

(declare-fun d!78981 () Bool)

(declare-fun lt!234916 () SeekEntryResult!4315)

(assert (=> d!78981 (and (or ((_ is Undefined!4315) lt!234916) (not ((_ is Found!4315) lt!234916)) (and (bvsge (index!19449 lt!234916) #b00000000000000000000000000000000) (bvslt (index!19449 lt!234916) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234916) ((_ is Found!4315) lt!234916) (not ((_ is MissingZero!4315) lt!234916)) (and (bvsge (index!19448 lt!234916) #b00000000000000000000000000000000) (bvslt (index!19448 lt!234916) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234916) ((_ is Found!4315) lt!234916) ((_ is MissingZero!4315) lt!234916) (not ((_ is MissingVacant!4315) lt!234916)) (and (bvsge (index!19451 lt!234916) #b00000000000000000000000000000000) (bvslt (index!19451 lt!234916) (size!16216 a!3235)))) (or ((_ is Undefined!4315) lt!234916) (ite ((_ is Found!4315) lt!234916) (= (select (arr!15851 a!3235) (index!19449 lt!234916)) k0!2280) (ite ((_ is MissingZero!4315) lt!234916) (= (select (arr!15851 a!3235) (index!19448 lt!234916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4315) lt!234916) (= (select (arr!15851 a!3235) (index!19451 lt!234916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78981 (= lt!234916 e!299733)))

(declare-fun c!60075 () Bool)

(assert (=> d!78981 (= c!60075 (and ((_ is Intermediate!4315) lt!234914) (undefined!5127 lt!234914)))))

(assert (=> d!78981 (= lt!234914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78981 (validMask!0 mask!3524)))

(assert (=> d!78981 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234916)))

(declare-fun b!513352 () Bool)

(declare-fun c!60074 () Bool)

(assert (=> b!513352 (= c!60074 (= lt!234915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513352 (= e!299731 e!299732)))

(assert (= (and d!78981 c!60075) b!513351))

(assert (= (and d!78981 (not c!60075)) b!513347))

(assert (= (and b!513347 c!60073) b!513350))

(assert (= (and b!513347 (not c!60073)) b!513352))

(assert (= (and b!513352 c!60074) b!513349))

(assert (= (and b!513352 (not c!60074)) b!513348))

(declare-fun m!494467 () Bool)

(assert (=> b!513347 m!494467))

(declare-fun m!494469 () Bool)

(assert (=> b!513348 m!494469))

(declare-fun m!494471 () Bool)

(assert (=> d!78981 m!494471))

(declare-fun m!494473 () Bool)

(assert (=> d!78981 m!494473))

(declare-fun m!494475 () Bool)

(assert (=> d!78981 m!494475))

(declare-fun m!494477 () Bool)

(assert (=> d!78981 m!494477))

(assert (=> d!78981 m!494365))

(assert (=> d!78981 m!494475))

(declare-fun m!494479 () Bool)

(assert (=> d!78981 m!494479))

(assert (=> b!513261 d!78981))

(declare-fun d!78983 () Bool)

(declare-fun lt!234922 () (_ BitVec 32))

(declare-fun lt!234921 () (_ BitVec 32))

(assert (=> d!78983 (= lt!234922 (bvmul (bvxor lt!234921 (bvlshr lt!234921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78983 (= lt!234921 ((_ extract 31 0) (bvand (bvxor (select (arr!15851 a!3235) j!176) (bvlshr (select (arr!15851 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78983 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313767 (let ((h!10933 ((_ extract 31 0) (bvand (bvxor (select (arr!15851 a!3235) j!176) (bvlshr (select (arr!15851 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48412 (bvmul (bvxor h!10933 (bvlshr h!10933 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48412 (bvlshr x!48412 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313767 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313767 #b00000000000000000000000000000000))))))

(assert (=> d!78983 (= (toIndex!0 (select (arr!15851 a!3235) j!176) mask!3524) (bvand (bvxor lt!234922 (bvlshr lt!234922 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513260 d!78983))

(declare-fun b!513361 () Bool)

(declare-fun e!299742 () Bool)

(declare-fun call!31534 () Bool)

(assert (=> b!513361 (= e!299742 call!31534)))

(declare-fun bm!31531 () Bool)

(assert (=> bm!31531 (= call!31534 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513362 () Bool)

(declare-fun e!299740 () Bool)

(assert (=> b!513362 (= e!299740 call!31534)))

(declare-fun d!78985 () Bool)

(declare-fun res!313774 () Bool)

(declare-fun e!299741 () Bool)

(assert (=> d!78985 (=> res!313774 e!299741)))

(assert (=> d!78985 (= res!313774 (bvsge j!176 (size!16216 a!3235)))))

(assert (=> d!78985 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299741)))

(declare-fun b!513363 () Bool)

(assert (=> b!513363 (= e!299742 e!299740)))

(declare-fun lt!234935 () (_ BitVec 64))

(assert (=> b!513363 (= lt!234935 (select (arr!15851 a!3235) j!176))))

(declare-fun lt!234933 () Unit!15874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32954 (_ BitVec 64) (_ BitVec 32)) Unit!15874)

(assert (=> b!513363 (= lt!234933 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234935 j!176))))

(assert (=> b!513363 (arrayContainsKey!0 a!3235 lt!234935 #b00000000000000000000000000000000)))

(declare-fun lt!234934 () Unit!15874)

(assert (=> b!513363 (= lt!234934 lt!234933)))

(declare-fun res!313773 () Bool)

(assert (=> b!513363 (= res!313773 (= (seekEntryOrOpen!0 (select (arr!15851 a!3235) j!176) a!3235 mask!3524) (Found!4315 j!176)))))

(assert (=> b!513363 (=> (not res!313773) (not e!299740))))

(declare-fun b!513364 () Bool)

(assert (=> b!513364 (= e!299741 e!299742)))

(declare-fun c!60078 () Bool)

(assert (=> b!513364 (= c!60078 (validKeyInArray!0 (select (arr!15851 a!3235) j!176)))))

(assert (= (and d!78985 (not res!313774)) b!513364))

(assert (= (and b!513364 c!60078) b!513363))

(assert (= (and b!513364 (not c!60078)) b!513361))

(assert (= (and b!513363 res!313773) b!513362))

(assert (= (or b!513362 b!513361) bm!31531))

(declare-fun m!494481 () Bool)

(assert (=> bm!31531 m!494481))

(assert (=> b!513363 m!494343))

(declare-fun m!494483 () Bool)

(assert (=> b!513363 m!494483))

(declare-fun m!494485 () Bool)

(assert (=> b!513363 m!494485))

(assert (=> b!513363 m!494343))

(assert (=> b!513363 m!494375))

(assert (=> b!513364 m!494343))

(assert (=> b!513364 m!494343))

(assert (=> b!513364 m!494371))

(assert (=> b!513260 d!78985))

(declare-fun d!78995 () Bool)

(assert (=> d!78995 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234940 () Unit!15874)

(declare-fun choose!38 (array!32954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15874)

(assert (=> d!78995 (= lt!234940 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78995 (validMask!0 mask!3524)))

(assert (=> d!78995 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234940)))

(declare-fun bs!16225 () Bool)

(assert (= bs!16225 d!78995))

(assert (=> bs!16225 m!494357))

(declare-fun m!494487 () Bool)

(assert (=> bs!16225 m!494487))

(assert (=> bs!16225 m!494365))

(assert (=> b!513260 d!78995))

(declare-fun d!79003 () Bool)

(declare-fun lt!234942 () (_ BitVec 32))

(declare-fun lt!234941 () (_ BitVec 32))

(assert (=> d!79003 (= lt!234942 (bvmul (bvxor lt!234941 (bvlshr lt!234941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79003 (= lt!234941 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79003 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313767 (let ((h!10933 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48412 (bvmul (bvxor h!10933 (bvlshr h!10933 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48412 (bvlshr x!48412 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313767 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313767 #b00000000000000000000000000000000))))))

(assert (=> d!79003 (= (toIndex!0 (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234942 (bvlshr lt!234942 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513260 d!79003))

(declare-fun b!513430 () Bool)

(declare-fun e!299781 () SeekEntryResult!4315)

(assert (=> b!513430 (= e!299781 (Intermediate!4315 true lt!234872 #b00000000000000000000000000000000))))

(declare-fun b!513431 () Bool)

(declare-fun e!299782 () SeekEntryResult!4315)

(assert (=> b!513431 (= e!299782 (Intermediate!4315 false lt!234872 #b00000000000000000000000000000000))))

(declare-fun b!513432 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513432 (= e!299782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234872 #b00000000000000000000000000000000 mask!3524) (select (arr!15851 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513433 () Bool)

(assert (=> b!513433 (= e!299781 e!299782)))

(declare-fun lt!234966 () (_ BitVec 64))

(declare-fun c!60104 () Bool)

(assert (=> b!513433 (= c!60104 (or (= lt!234966 (select (arr!15851 a!3235) j!176)) (= (bvadd lt!234966 lt!234966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79005 () Bool)

(declare-fun e!299784 () Bool)

(assert (=> d!79005 e!299784))

(declare-fun c!60102 () Bool)

(declare-fun lt!234969 () SeekEntryResult!4315)

(assert (=> d!79005 (= c!60102 (and ((_ is Intermediate!4315) lt!234969) (undefined!5127 lt!234969)))))

(assert (=> d!79005 (= lt!234969 e!299781)))

(declare-fun c!60101 () Bool)

(assert (=> d!79005 (= c!60101 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79005 (= lt!234966 (select (arr!15851 a!3235) lt!234872))))

(assert (=> d!79005 (validMask!0 mask!3524)))

(assert (=> d!79005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234872 (select (arr!15851 a!3235) j!176) a!3235 mask!3524) lt!234969)))

(declare-fun b!513434 () Bool)

(assert (=> b!513434 (and (bvsge (index!19450 lt!234969) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234969) (size!16216 a!3235)))))

(declare-fun res!313798 () Bool)

(assert (=> b!513434 (= res!313798 (= (select (arr!15851 a!3235) (index!19450 lt!234969)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299783 () Bool)

(assert (=> b!513434 (=> res!313798 e!299783)))

(declare-fun b!513435 () Bool)

(declare-fun e!299786 () Bool)

(assert (=> b!513435 (= e!299784 e!299786)))

(declare-fun res!313799 () Bool)

(assert (=> b!513435 (= res!313799 (and ((_ is Intermediate!4315) lt!234969) (not (undefined!5127 lt!234969)) (bvslt (x!48409 lt!234969) #b01111111111111111111111111111110) (bvsge (x!48409 lt!234969) #b00000000000000000000000000000000) (bvsge (x!48409 lt!234969) #b00000000000000000000000000000000)))))

(assert (=> b!513435 (=> (not res!313799) (not e!299786))))

(declare-fun b!513436 () Bool)

(assert (=> b!513436 (and (bvsge (index!19450 lt!234969) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234969) (size!16216 a!3235)))))

(declare-fun res!313796 () Bool)

(assert (=> b!513436 (= res!313796 (= (select (arr!15851 a!3235) (index!19450 lt!234969)) (select (arr!15851 a!3235) j!176)))))

(assert (=> b!513436 (=> res!313796 e!299783)))

(assert (=> b!513436 (= e!299786 e!299783)))

(declare-fun b!513438 () Bool)

(assert (=> b!513438 (and (bvsge (index!19450 lt!234969) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234969) (size!16216 a!3235)))))

(assert (=> b!513438 (= e!299783 (= (select (arr!15851 a!3235) (index!19450 lt!234969)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513440 () Bool)

(assert (=> b!513440 (= e!299784 (bvsge (x!48409 lt!234969) #b01111111111111111111111111111110))))

(assert (= (and d!79005 c!60101) b!513430))

(assert (= (and d!79005 (not c!60101)) b!513433))

(assert (= (and b!513433 c!60104) b!513431))

(assert (= (and b!513433 (not c!60104)) b!513432))

(assert (= (and d!79005 c!60102) b!513440))

(assert (= (and d!79005 (not c!60102)) b!513435))

(assert (= (and b!513435 res!313799) b!513436))

(assert (= (and b!513436 (not res!313796)) b!513434))

(assert (= (and b!513434 (not res!313798)) b!513438))

(declare-fun m!494505 () Bool)

(assert (=> b!513434 m!494505))

(declare-fun m!494507 () Bool)

(assert (=> b!513432 m!494507))

(assert (=> b!513432 m!494507))

(assert (=> b!513432 m!494343))

(declare-fun m!494513 () Bool)

(assert (=> b!513432 m!494513))

(assert (=> b!513438 m!494505))

(assert (=> b!513436 m!494505))

(declare-fun m!494517 () Bool)

(assert (=> d!79005 m!494517))

(assert (=> d!79005 m!494365))

(assert (=> b!513260 d!79005))

(declare-fun b!513458 () Bool)

(declare-fun e!299797 () SeekEntryResult!4315)

(assert (=> b!513458 (= e!299797 (Intermediate!4315 true lt!234873 #b00000000000000000000000000000000))))

(declare-fun b!513459 () Bool)

(declare-fun e!299798 () SeekEntryResult!4315)

(assert (=> b!513459 (= e!299798 (Intermediate!4315 false lt!234873 #b00000000000000000000000000000000))))

(declare-fun b!513460 () Bool)

(assert (=> b!513460 (= e!299798 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234873 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)) mask!3524))))

(declare-fun b!513461 () Bool)

(assert (=> b!513461 (= e!299797 e!299798)))

(declare-fun lt!234970 () (_ BitVec 64))

(declare-fun c!60111 () Bool)

(assert (=> b!513461 (= c!60111 (or (= lt!234970 (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234970 lt!234970) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79013 () Bool)

(declare-fun e!299800 () Bool)

(assert (=> d!79013 e!299800))

(declare-fun c!60110 () Bool)

(declare-fun lt!234971 () SeekEntryResult!4315)

(assert (=> d!79013 (= c!60110 (and ((_ is Intermediate!4315) lt!234971) (undefined!5127 lt!234971)))))

(assert (=> d!79013 (= lt!234971 e!299797)))

(declare-fun c!60109 () Bool)

(assert (=> d!79013 (= c!60109 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79013 (= lt!234970 (select (arr!15851 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235))) lt!234873))))

(assert (=> d!79013 (validMask!0 mask!3524)))

(assert (=> d!79013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234873 (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176) (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)) mask!3524) lt!234971)))

(declare-fun b!513462 () Bool)

(assert (=> b!513462 (and (bvsge (index!19450 lt!234971) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234971) (size!16216 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)))))))

(declare-fun res!313809 () Bool)

(assert (=> b!513462 (= res!313809 (= (select (arr!15851 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235))) (index!19450 lt!234971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299799 () Bool)

(assert (=> b!513462 (=> res!313809 e!299799)))

(declare-fun b!513463 () Bool)

(declare-fun e!299801 () Bool)

(assert (=> b!513463 (= e!299800 e!299801)))

(declare-fun res!313810 () Bool)

(assert (=> b!513463 (= res!313810 (and ((_ is Intermediate!4315) lt!234971) (not (undefined!5127 lt!234971)) (bvslt (x!48409 lt!234971) #b01111111111111111111111111111110) (bvsge (x!48409 lt!234971) #b00000000000000000000000000000000) (bvsge (x!48409 lt!234971) #b00000000000000000000000000000000)))))

(assert (=> b!513463 (=> (not res!313810) (not e!299801))))

(declare-fun b!513464 () Bool)

(assert (=> b!513464 (and (bvsge (index!19450 lt!234971) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234971) (size!16216 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)))))))

(declare-fun res!313808 () Bool)

(assert (=> b!513464 (= res!313808 (= (select (arr!15851 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235))) (index!19450 lt!234971)) (select (store (arr!15851 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!513464 (=> res!313808 e!299799)))

(assert (=> b!513464 (= e!299801 e!299799)))

(declare-fun b!513465 () Bool)

(assert (=> b!513465 (and (bvsge (index!19450 lt!234971) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234971) (size!16216 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235)))))))

(assert (=> b!513465 (= e!299799 (= (select (arr!15851 (array!32955 (store (arr!15851 a!3235) i!1204 k0!2280) (size!16216 a!3235))) (index!19450 lt!234971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513466 () Bool)

(assert (=> b!513466 (= e!299800 (bvsge (x!48409 lt!234971) #b01111111111111111111111111111110))))

(assert (= (and d!79013 c!60109) b!513458))

(assert (= (and d!79013 (not c!60109)) b!513461))

(assert (= (and b!513461 c!60111) b!513459))

(assert (= (and b!513461 (not c!60111)) b!513460))

(assert (= (and d!79013 c!60110) b!513466))

(assert (= (and d!79013 (not c!60110)) b!513463))

(assert (= (and b!513463 res!313810) b!513464))

(assert (= (and b!513464 (not res!313808)) b!513462))

(assert (= (and b!513462 (not res!313809)) b!513465))

(declare-fun m!494519 () Bool)

(assert (=> b!513462 m!494519))

(declare-fun m!494521 () Bool)

(assert (=> b!513460 m!494521))

(assert (=> b!513460 m!494521))

(assert (=> b!513460 m!494349))

(declare-fun m!494523 () Bool)

(assert (=> b!513460 m!494523))

(assert (=> b!513465 m!494519))

(assert (=> b!513464 m!494519))

(declare-fun m!494525 () Bool)

(assert (=> d!79013 m!494525))

(assert (=> d!79013 m!494365))

(assert (=> b!513260 d!79013))

(declare-fun d!79015 () Bool)

(declare-fun res!313819 () Bool)

(declare-fun e!299811 () Bool)

(assert (=> d!79015 (=> res!313819 e!299811)))

(assert (=> d!79015 (= res!313819 (= (select (arr!15851 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79015 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299811)))

(declare-fun b!513480 () Bool)

(declare-fun e!299812 () Bool)

(assert (=> b!513480 (= e!299811 e!299812)))

(declare-fun res!313820 () Bool)

(assert (=> b!513480 (=> (not res!313820) (not e!299812))))

(assert (=> b!513480 (= res!313820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16216 a!3235)))))

(declare-fun b!513481 () Bool)

(assert (=> b!513481 (= e!299812 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79015 (not res!313819)) b!513480))

(assert (= (and b!513480 res!313820) b!513481))

(declare-fun m!494527 () Bool)

(assert (=> d!79015 m!494527))

(declare-fun m!494529 () Bool)

(assert (=> b!513481 m!494529))

(assert (=> b!513255 d!79015))

(declare-fun b!513482 () Bool)

(declare-fun e!299815 () Bool)

(declare-fun call!31538 () Bool)

(assert (=> b!513482 (= e!299815 call!31538)))

(declare-fun bm!31535 () Bool)

(assert (=> bm!31535 (= call!31538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513483 () Bool)

(declare-fun e!299813 () Bool)

(assert (=> b!513483 (= e!299813 call!31538)))

(declare-fun d!79017 () Bool)

(declare-fun res!313822 () Bool)

(declare-fun e!299814 () Bool)

(assert (=> d!79017 (=> res!313822 e!299814)))

(assert (=> d!79017 (= res!313822 (bvsge #b00000000000000000000000000000000 (size!16216 a!3235)))))

(assert (=> d!79017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299814)))

(declare-fun b!513484 () Bool)

(assert (=> b!513484 (= e!299815 e!299813)))

(declare-fun lt!234980 () (_ BitVec 64))

(assert (=> b!513484 (= lt!234980 (select (arr!15851 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234978 () Unit!15874)

(assert (=> b!513484 (= lt!234978 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234980 #b00000000000000000000000000000000))))

(assert (=> b!513484 (arrayContainsKey!0 a!3235 lt!234980 #b00000000000000000000000000000000)))

(declare-fun lt!234979 () Unit!15874)

(assert (=> b!513484 (= lt!234979 lt!234978)))

(declare-fun res!313821 () Bool)

(assert (=> b!513484 (= res!313821 (= (seekEntryOrOpen!0 (select (arr!15851 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4315 #b00000000000000000000000000000000)))))

(assert (=> b!513484 (=> (not res!313821) (not e!299813))))

(declare-fun b!513485 () Bool)

(assert (=> b!513485 (= e!299814 e!299815)))

(declare-fun c!60115 () Bool)

(assert (=> b!513485 (= c!60115 (validKeyInArray!0 (select (arr!15851 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79017 (not res!313822)) b!513485))

(assert (= (and b!513485 c!60115) b!513484))

(assert (= (and b!513485 (not c!60115)) b!513482))

(assert (= (and b!513484 res!313821) b!513483))

(assert (= (or b!513483 b!513482) bm!31535))

(declare-fun m!494539 () Bool)

(assert (=> bm!31535 m!494539))

(assert (=> b!513484 m!494527))

(declare-fun m!494541 () Bool)

(assert (=> b!513484 m!494541))

(declare-fun m!494543 () Bool)

(assert (=> b!513484 m!494543))

(assert (=> b!513484 m!494527))

(declare-fun m!494545 () Bool)

(assert (=> b!513484 m!494545))

(assert (=> b!513485 m!494527))

(assert (=> b!513485 m!494527))

(declare-fun m!494547 () Bool)

(assert (=> b!513485 m!494547))

(assert (=> b!513259 d!79017))

(declare-fun d!79021 () Bool)

(assert (=> d!79021 (= (validKeyInArray!0 (select (arr!15851 a!3235) j!176)) (and (not (= (select (arr!15851 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15851 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513258 d!79021))

(declare-fun b!513515 () Bool)

(declare-fun e!299842 () Bool)

(declare-fun e!299840 () Bool)

(assert (=> b!513515 (= e!299842 e!299840)))

(declare-fun res!313842 () Bool)

(assert (=> b!513515 (=> (not res!313842) (not e!299840))))

(declare-fun e!299841 () Bool)

(assert (=> b!513515 (= res!313842 (not e!299841))))

(declare-fun res!313841 () Bool)

(assert (=> b!513515 (=> (not res!313841) (not e!299841))))

(assert (=> b!513515 (= res!313841 (validKeyInArray!0 (select (arr!15851 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79027 () Bool)

(declare-fun res!313840 () Bool)

(assert (=> d!79027 (=> res!313840 e!299842)))

(assert (=> d!79027 (= res!313840 (bvsge #b00000000000000000000000000000000 (size!16216 a!3235)))))

(assert (=> d!79027 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10045) e!299842)))

(declare-fun b!513516 () Bool)

(declare-fun e!299839 () Bool)

(assert (=> b!513516 (= e!299840 e!299839)))

(declare-fun c!60123 () Bool)

(assert (=> b!513516 (= c!60123 (validKeyInArray!0 (select (arr!15851 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31540 () Bool)

(declare-fun call!31543 () Bool)

(assert (=> bm!31540 (= call!31543 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60123 (Cons!10044 (select (arr!15851 a!3235) #b00000000000000000000000000000000) Nil!10045) Nil!10045)))))

(declare-fun b!513517 () Bool)

(assert (=> b!513517 (= e!299839 call!31543)))

(declare-fun b!513518 () Bool)

(assert (=> b!513518 (= e!299839 call!31543)))

(declare-fun b!513519 () Bool)

(declare-fun contains!2716 (List!10048 (_ BitVec 64)) Bool)

(assert (=> b!513519 (= e!299841 (contains!2716 Nil!10045 (select (arr!15851 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79027 (not res!313840)) b!513515))

(assert (= (and b!513515 res!313841) b!513519))

(assert (= (and b!513515 res!313842) b!513516))

(assert (= (and b!513516 c!60123) b!513518))

(assert (= (and b!513516 (not c!60123)) b!513517))

(assert (= (or b!513518 b!513517) bm!31540))

(assert (=> b!513515 m!494527))

(assert (=> b!513515 m!494527))

(assert (=> b!513515 m!494547))

(assert (=> b!513516 m!494527))

(assert (=> b!513516 m!494527))

(assert (=> b!513516 m!494547))

(assert (=> bm!31540 m!494527))

(declare-fun m!494559 () Bool)

(assert (=> bm!31540 m!494559))

(assert (=> b!513519 m!494527))

(assert (=> b!513519 m!494527))

(declare-fun m!494561 () Bool)

(assert (=> b!513519 m!494561))

(assert (=> b!513253 d!79027))

(declare-fun d!79033 () Bool)

(assert (=> d!79033 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513252 d!79033))

(check-sat (not d!79013) (not d!79005) (not b!513348) (not d!78981) (not d!78995) (not b!513485) (not b!513484) (not d!78975) (not b!513481) (not b!513519) (not b!513516) (not b!513432) (not b!513515) (not b!513460) (not bm!31531) (not bm!31535) (not b!513342) (not b!513364) (not bm!31540) (not b!513363))
(check-sat)
