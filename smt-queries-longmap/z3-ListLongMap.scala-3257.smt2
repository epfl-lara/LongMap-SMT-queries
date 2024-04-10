; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45416 () Bool)

(assert start!45416)

(declare-fun b!499323 () Bool)

(declare-fun res!301304 () Bool)

(declare-fun e!292611 () Bool)

(assert (=> b!499323 (=> (not res!301304) (not e!292611))))

(declare-datatypes ((array!32241 0))(
  ( (array!32242 (arr!15502 (Array (_ BitVec 32) (_ BitVec 64))) (size!15866 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32241)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499323 (= res!301304 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499324 () Bool)

(declare-fun res!301306 () Bool)

(assert (=> b!499324 (=> (not res!301306) (not e!292611))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499324 (= res!301306 (validKeyInArray!0 (select (arr!15502 a!3235) j!176)))))

(declare-fun b!499325 () Bool)

(declare-fun e!292608 () Bool)

(assert (=> b!499325 (= e!292611 e!292608)))

(declare-fun res!301307 () Bool)

(assert (=> b!499325 (=> (not res!301307) (not e!292608))))

(declare-datatypes ((SeekEntryResult!3969 0))(
  ( (MissingZero!3969 (index!18058 (_ BitVec 32))) (Found!3969 (index!18059 (_ BitVec 32))) (Intermediate!3969 (undefined!4781 Bool) (index!18060 (_ BitVec 32)) (x!47102 (_ BitVec 32))) (Undefined!3969) (MissingVacant!3969 (index!18061 (_ BitVec 32))) )
))
(declare-fun lt!226376 () SeekEntryResult!3969)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499325 (= res!301307 (or (= lt!226376 (MissingZero!3969 i!1204)) (= lt!226376 (MissingVacant!3969 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32241 (_ BitVec 32)) SeekEntryResult!3969)

(assert (=> b!499325 (= lt!226376 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499326 () Bool)

(declare-fun e!292613 () Bool)

(assert (=> b!499326 (= e!292608 (not e!292613))))

(declare-fun res!301310 () Bool)

(assert (=> b!499326 (=> res!301310 e!292613)))

(declare-fun lt!226377 () SeekEntryResult!3969)

(declare-fun lt!226371 () (_ BitVec 32))

(declare-fun lt!226375 () array!32241)

(declare-fun lt!226370 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32241 (_ BitVec 32)) SeekEntryResult!3969)

(assert (=> b!499326 (= res!301310 (= lt!226377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226371 lt!226370 lt!226375 mask!3524)))))

(declare-fun lt!226372 () (_ BitVec 32))

(assert (=> b!499326 (= lt!226377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226372 (select (arr!15502 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499326 (= lt!226371 (toIndex!0 lt!226370 mask!3524))))

(assert (=> b!499326 (= lt!226370 (select (store (arr!15502 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499326 (= lt!226372 (toIndex!0 (select (arr!15502 a!3235) j!176) mask!3524))))

(assert (=> b!499326 (= lt!226375 (array!32242 (store (arr!15502 a!3235) i!1204 k0!2280) (size!15866 a!3235)))))

(declare-fun e!292607 () Bool)

(assert (=> b!499326 e!292607))

(declare-fun res!301305 () Bool)

(assert (=> b!499326 (=> (not res!301305) (not e!292607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32241 (_ BitVec 32)) Bool)

(assert (=> b!499326 (= res!301305 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14952 0))(
  ( (Unit!14953) )
))
(declare-fun lt!226378 () Unit!14952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14952)

(assert (=> b!499326 (= lt!226378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!301301 () Bool)

(assert (=> start!45416 (=> (not res!301301) (not e!292611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45416 (= res!301301 (validMask!0 mask!3524))))

(assert (=> start!45416 e!292611))

(assert (=> start!45416 true))

(declare-fun array_inv!11298 (array!32241) Bool)

(assert (=> start!45416 (array_inv!11298 a!3235)))

(declare-fun b!499327 () Bool)

(declare-fun e!292610 () Bool)

(assert (=> b!499327 (= e!292613 e!292610)))

(declare-fun res!301311 () Bool)

(assert (=> b!499327 (=> res!301311 e!292610)))

(assert (=> b!499327 (= res!301311 (or (bvsgt #b00000000000000000000000000000000 (x!47102 lt!226377)) (bvsgt (x!47102 lt!226377) #b01111111111111111111111111111110) (bvslt lt!226372 #b00000000000000000000000000000000) (bvsge lt!226372 (size!15866 a!3235)) (bvslt (index!18060 lt!226377) #b00000000000000000000000000000000) (bvsge (index!18060 lt!226377) (size!15866 a!3235)) (not (= lt!226377 (Intermediate!3969 false (index!18060 lt!226377) (x!47102 lt!226377))))))))

(assert (=> b!499327 (and (or (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226373 () Unit!14952)

(declare-fun e!292614 () Unit!14952)

(assert (=> b!499327 (= lt!226373 e!292614)))

(declare-fun c!59288 () Bool)

(assert (=> b!499327 (= c!59288 (= (select (arr!15502 a!3235) (index!18060 lt!226377)) (select (arr!15502 a!3235) j!176)))))

(assert (=> b!499327 (and (bvslt (x!47102 lt!226377) #b01111111111111111111111111111110) (or (= (select (arr!15502 a!3235) (index!18060 lt!226377)) (select (arr!15502 a!3235) j!176)) (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15502 a!3235) (index!18060 lt!226377)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499328 () Bool)

(declare-fun e!292609 () Bool)

(assert (=> b!499328 (= e!292609 false)))

(declare-fun b!499329 () Bool)

(declare-fun res!301302 () Bool)

(assert (=> b!499329 (=> (not res!301302) (not e!292608))))

(declare-datatypes ((List!9660 0))(
  ( (Nil!9657) (Cons!9656 (h!10530 (_ BitVec 64)) (t!15888 List!9660)) )
))
(declare-fun arrayNoDuplicates!0 (array!32241 (_ BitVec 32) List!9660) Bool)

(assert (=> b!499329 (= res!301302 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9657))))

(declare-fun b!499330 () Bool)

(assert (=> b!499330 (= e!292607 (= (seekEntryOrOpen!0 (select (arr!15502 a!3235) j!176) a!3235 mask!3524) (Found!3969 j!176)))))

(declare-fun b!499331 () Bool)

(declare-fun res!301312 () Bool)

(assert (=> b!499331 (=> (not res!301312) (not e!292611))))

(assert (=> b!499331 (= res!301312 (validKeyInArray!0 k0!2280))))

(declare-fun b!499332 () Bool)

(declare-fun Unit!14954 () Unit!14952)

(assert (=> b!499332 (= e!292614 Unit!14954)))

(declare-fun b!499333 () Bool)

(declare-fun res!301308 () Bool)

(assert (=> b!499333 (=> (not res!301308) (not e!292611))))

(assert (=> b!499333 (= res!301308 (and (= (size!15866 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15866 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15866 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499334 () Bool)

(declare-fun res!301313 () Bool)

(assert (=> b!499334 (=> (not res!301313) (not e!292608))))

(assert (=> b!499334 (= res!301313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499335 () Bool)

(declare-fun Unit!14955 () Unit!14952)

(assert (=> b!499335 (= e!292614 Unit!14955)))

(declare-fun lt!226374 () Unit!14952)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14952)

(assert (=> b!499335 (= lt!226374 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226372 #b00000000000000000000000000000000 (index!18060 lt!226377) (x!47102 lt!226377) mask!3524))))

(declare-fun res!301309 () Bool)

(assert (=> b!499335 (= res!301309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226372 lt!226370 lt!226375 mask!3524) (Intermediate!3969 false (index!18060 lt!226377) (x!47102 lt!226377))))))

(assert (=> b!499335 (=> (not res!301309) (not e!292609))))

(assert (=> b!499335 e!292609))

(declare-fun b!499336 () Bool)

(assert (=> b!499336 (= e!292610 true)))

(declare-fun lt!226369 () SeekEntryResult!3969)

(assert (=> b!499336 (= lt!226369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226372 lt!226370 lt!226375 mask!3524))))

(declare-fun b!499337 () Bool)

(declare-fun res!301303 () Bool)

(assert (=> b!499337 (=> res!301303 e!292613)))

(get-info :version)

(assert (=> b!499337 (= res!301303 (or (undefined!4781 lt!226377) (not ((_ is Intermediate!3969) lt!226377))))))

(assert (= (and start!45416 res!301301) b!499333))

(assert (= (and b!499333 res!301308) b!499324))

(assert (= (and b!499324 res!301306) b!499331))

(assert (= (and b!499331 res!301312) b!499323))

(assert (= (and b!499323 res!301304) b!499325))

(assert (= (and b!499325 res!301307) b!499334))

(assert (= (and b!499334 res!301313) b!499329))

(assert (= (and b!499329 res!301302) b!499326))

(assert (= (and b!499326 res!301305) b!499330))

(assert (= (and b!499326 (not res!301310)) b!499337))

(assert (= (and b!499337 (not res!301303)) b!499327))

(assert (= (and b!499327 c!59288) b!499335))

(assert (= (and b!499327 (not c!59288)) b!499332))

(assert (= (and b!499335 res!301309) b!499328))

(assert (= (and b!499327 (not res!301311)) b!499336))

(declare-fun m!480531 () Bool)

(assert (=> b!499323 m!480531))

(declare-fun m!480533 () Bool)

(assert (=> b!499331 m!480533))

(declare-fun m!480535 () Bool)

(assert (=> b!499329 m!480535))

(declare-fun m!480537 () Bool)

(assert (=> b!499330 m!480537))

(assert (=> b!499330 m!480537))

(declare-fun m!480539 () Bool)

(assert (=> b!499330 m!480539))

(declare-fun m!480541 () Bool)

(assert (=> start!45416 m!480541))

(declare-fun m!480543 () Bool)

(assert (=> start!45416 m!480543))

(declare-fun m!480545 () Bool)

(assert (=> b!499326 m!480545))

(declare-fun m!480547 () Bool)

(assert (=> b!499326 m!480547))

(declare-fun m!480549 () Bool)

(assert (=> b!499326 m!480549))

(assert (=> b!499326 m!480537))

(declare-fun m!480551 () Bool)

(assert (=> b!499326 m!480551))

(assert (=> b!499326 m!480537))

(declare-fun m!480553 () Bool)

(assert (=> b!499326 m!480553))

(declare-fun m!480555 () Bool)

(assert (=> b!499326 m!480555))

(declare-fun m!480557 () Bool)

(assert (=> b!499326 m!480557))

(declare-fun m!480559 () Bool)

(assert (=> b!499326 m!480559))

(assert (=> b!499326 m!480537))

(declare-fun m!480561 () Bool)

(assert (=> b!499327 m!480561))

(assert (=> b!499327 m!480537))

(assert (=> b!499324 m!480537))

(assert (=> b!499324 m!480537))

(declare-fun m!480563 () Bool)

(assert (=> b!499324 m!480563))

(declare-fun m!480565 () Bool)

(assert (=> b!499325 m!480565))

(declare-fun m!480567 () Bool)

(assert (=> b!499334 m!480567))

(declare-fun m!480569 () Bool)

(assert (=> b!499336 m!480569))

(declare-fun m!480571 () Bool)

(assert (=> b!499335 m!480571))

(assert (=> b!499335 m!480569))

(check-sat (not start!45416) (not b!499334) (not b!499323) (not b!499330) (not b!499335) (not b!499336) (not b!499324) (not b!499325) (not b!499326) (not b!499329) (not b!499331))
(check-sat)
