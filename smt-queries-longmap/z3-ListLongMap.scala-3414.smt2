; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47408 () Bool)

(assert start!47408)

(declare-fun b!521536 () Bool)

(declare-fun res!319322 () Bool)

(declare-fun e!304269 () Bool)

(assert (=> b!521536 (=> res!319322 e!304269)))

(declare-datatypes ((SeekEntryResult!4440 0))(
  ( (MissingZero!4440 (index!19963 (_ BitVec 32))) (Found!4440 (index!19964 (_ BitVec 32))) (Intermediate!4440 (undefined!5252 Bool) (index!19965 (_ BitVec 32)) (x!48946 (_ BitVec 32))) (Undefined!4440) (MissingVacant!4440 (index!19966 (_ BitVec 32))) )
))
(declare-fun lt!239028 () SeekEntryResult!4440)

(get-info :version)

(assert (=> b!521536 (= res!319322 (or (undefined!5252 lt!239028) (not ((_ is Intermediate!4440) lt!239028))))))

(declare-fun b!521537 () Bool)

(assert (=> b!521537 (= e!304269 true)))

(declare-datatypes ((array!33234 0))(
  ( (array!33235 (arr!15973 (Array (_ BitVec 32) (_ BitVec 64))) (size!16337 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33234)

(assert (=> b!521537 (and (or (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16212 0))(
  ( (Unit!16213) )
))
(declare-fun lt!239027 () Unit!16212)

(declare-fun e!304264 () Unit!16212)

(assert (=> b!521537 (= lt!239027 e!304264)))

(declare-fun c!61409 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521537 (= c!61409 (= (select (arr!15973 a!3235) (index!19965 lt!239028)) (select (arr!15973 a!3235) j!176)))))

(assert (=> b!521537 (and (bvslt (x!48946 lt!239028) #b01111111111111111111111111111110) (or (= (select (arr!15973 a!3235) (index!19965 lt!239028)) (select (arr!15973 a!3235) j!176)) (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15973 a!3235) (index!19965 lt!239028)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521538 () Bool)

(declare-fun e!304266 () Bool)

(assert (=> b!521538 (= e!304266 (not e!304269))))

(declare-fun res!319331 () Bool)

(assert (=> b!521538 (=> res!319331 e!304269)))

(declare-fun lt!239023 () array!33234)

(declare-fun lt!239026 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!239025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33234 (_ BitVec 32)) SeekEntryResult!4440)

(assert (=> b!521538 (= res!319331 (= lt!239028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239025 lt!239026 lt!239023 mask!3524)))))

(declare-fun lt!239021 () (_ BitVec 32))

(assert (=> b!521538 (= lt!239028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239021 (select (arr!15973 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521538 (= lt!239025 (toIndex!0 lt!239026 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521538 (= lt!239026 (select (store (arr!15973 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521538 (= lt!239021 (toIndex!0 (select (arr!15973 a!3235) j!176) mask!3524))))

(assert (=> b!521538 (= lt!239023 (array!33235 (store (arr!15973 a!3235) i!1204 k0!2280) (size!16337 a!3235)))))

(declare-fun e!304267 () Bool)

(assert (=> b!521538 e!304267))

(declare-fun res!319326 () Bool)

(assert (=> b!521538 (=> (not res!319326) (not e!304267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33234 (_ BitVec 32)) Bool)

(assert (=> b!521538 (= res!319326 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239024 () Unit!16212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16212)

(assert (=> b!521538 (= lt!239024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521539 () Bool)

(declare-fun Unit!16214 () Unit!16212)

(assert (=> b!521539 (= e!304264 Unit!16214)))

(declare-fun lt!239029 () Unit!16212)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33234 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16212)

(assert (=> b!521539 (= lt!239029 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239021 #b00000000000000000000000000000000 (index!19965 lt!239028) (x!48946 lt!239028) mask!3524))))

(declare-fun res!319321 () Bool)

(assert (=> b!521539 (= res!319321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239021 lt!239026 lt!239023 mask!3524) (Intermediate!4440 false (index!19965 lt!239028) (x!48946 lt!239028))))))

(declare-fun e!304265 () Bool)

(assert (=> b!521539 (=> (not res!319321) (not e!304265))))

(assert (=> b!521539 e!304265))

(declare-fun b!521540 () Bool)

(declare-fun res!319329 () Bool)

(assert (=> b!521540 (=> (not res!319329) (not e!304266))))

(declare-datatypes ((List!10131 0))(
  ( (Nil!10128) (Cons!10127 (h!11049 (_ BitVec 64)) (t!16359 List!10131)) )
))
(declare-fun arrayNoDuplicates!0 (array!33234 (_ BitVec 32) List!10131) Bool)

(assert (=> b!521540 (= res!319329 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10128))))

(declare-fun b!521542 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33234 (_ BitVec 32)) SeekEntryResult!4440)

(assert (=> b!521542 (= e!304267 (= (seekEntryOrOpen!0 (select (arr!15973 a!3235) j!176) a!3235 mask!3524) (Found!4440 j!176)))))

(declare-fun b!521543 () Bool)

(declare-fun res!319323 () Bool)

(declare-fun e!304263 () Bool)

(assert (=> b!521543 (=> (not res!319323) (not e!304263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521543 (= res!319323 (validKeyInArray!0 (select (arr!15973 a!3235) j!176)))))

(declare-fun b!521544 () Bool)

(declare-fun res!319325 () Bool)

(assert (=> b!521544 (=> (not res!319325) (not e!304263))))

(assert (=> b!521544 (= res!319325 (validKeyInArray!0 k0!2280))))

(declare-fun b!521545 () Bool)

(declare-fun res!319330 () Bool)

(assert (=> b!521545 (=> (not res!319330) (not e!304266))))

(assert (=> b!521545 (= res!319330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!319320 () Bool)

(assert (=> start!47408 (=> (not res!319320) (not e!304263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47408 (= res!319320 (validMask!0 mask!3524))))

(assert (=> start!47408 e!304263))

(assert (=> start!47408 true))

(declare-fun array_inv!11769 (array!33234) Bool)

(assert (=> start!47408 (array_inv!11769 a!3235)))

(declare-fun b!521541 () Bool)

(declare-fun res!319327 () Bool)

(assert (=> b!521541 (=> (not res!319327) (not e!304263))))

(declare-fun arrayContainsKey!0 (array!33234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521541 (= res!319327 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521546 () Bool)

(declare-fun res!319328 () Bool)

(assert (=> b!521546 (=> (not res!319328) (not e!304263))))

(assert (=> b!521546 (= res!319328 (and (= (size!16337 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16337 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16337 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521547 () Bool)

(assert (=> b!521547 (= e!304265 false)))

(declare-fun b!521548 () Bool)

(assert (=> b!521548 (= e!304263 e!304266)))

(declare-fun res!319324 () Bool)

(assert (=> b!521548 (=> (not res!319324) (not e!304266))))

(declare-fun lt!239022 () SeekEntryResult!4440)

(assert (=> b!521548 (= res!319324 (or (= lt!239022 (MissingZero!4440 i!1204)) (= lt!239022 (MissingVacant!4440 i!1204))))))

(assert (=> b!521548 (= lt!239022 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521549 () Bool)

(declare-fun Unit!16215 () Unit!16212)

(assert (=> b!521549 (= e!304264 Unit!16215)))

(assert (= (and start!47408 res!319320) b!521546))

(assert (= (and b!521546 res!319328) b!521543))

(assert (= (and b!521543 res!319323) b!521544))

(assert (= (and b!521544 res!319325) b!521541))

(assert (= (and b!521541 res!319327) b!521548))

(assert (= (and b!521548 res!319324) b!521545))

(assert (= (and b!521545 res!319330) b!521540))

(assert (= (and b!521540 res!319329) b!521538))

(assert (= (and b!521538 res!319326) b!521542))

(assert (= (and b!521538 (not res!319331)) b!521536))

(assert (= (and b!521536 (not res!319322)) b!521537))

(assert (= (and b!521537 c!61409) b!521539))

(assert (= (and b!521537 (not c!61409)) b!521549))

(assert (= (and b!521539 res!319321) b!521547))

(declare-fun m!502449 () Bool)

(assert (=> b!521541 m!502449))

(declare-fun m!502451 () Bool)

(assert (=> b!521538 m!502451))

(declare-fun m!502453 () Bool)

(assert (=> b!521538 m!502453))

(declare-fun m!502455 () Bool)

(assert (=> b!521538 m!502455))

(declare-fun m!502457 () Bool)

(assert (=> b!521538 m!502457))

(declare-fun m!502459 () Bool)

(assert (=> b!521538 m!502459))

(assert (=> b!521538 m!502457))

(declare-fun m!502461 () Bool)

(assert (=> b!521538 m!502461))

(assert (=> b!521538 m!502457))

(declare-fun m!502463 () Bool)

(assert (=> b!521538 m!502463))

(declare-fun m!502465 () Bool)

(assert (=> b!521538 m!502465))

(declare-fun m!502467 () Bool)

(assert (=> b!521538 m!502467))

(declare-fun m!502469 () Bool)

(assert (=> b!521539 m!502469))

(declare-fun m!502471 () Bool)

(assert (=> b!521539 m!502471))

(declare-fun m!502473 () Bool)

(assert (=> b!521537 m!502473))

(assert (=> b!521537 m!502457))

(assert (=> b!521543 m!502457))

(assert (=> b!521543 m!502457))

(declare-fun m!502475 () Bool)

(assert (=> b!521543 m!502475))

(declare-fun m!502477 () Bool)

(assert (=> b!521548 m!502477))

(assert (=> b!521542 m!502457))

(assert (=> b!521542 m!502457))

(declare-fun m!502479 () Bool)

(assert (=> b!521542 m!502479))

(declare-fun m!502481 () Bool)

(assert (=> b!521545 m!502481))

(declare-fun m!502483 () Bool)

(assert (=> start!47408 m!502483))

(declare-fun m!502485 () Bool)

(assert (=> start!47408 m!502485))

(declare-fun m!502487 () Bool)

(assert (=> b!521540 m!502487))

(declare-fun m!502489 () Bool)

(assert (=> b!521544 m!502489))

(check-sat (not b!521542) (not b!521540) (not b!521544) (not b!521539) (not b!521538) (not b!521548) (not b!521541) (not start!47408) (not b!521543) (not b!521545))
(check-sat)
