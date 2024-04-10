; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47416 () Bool)

(assert start!47416)

(declare-fun b!521704 () Bool)

(declare-fun res!319467 () Bool)

(declare-fun e!304349 () Bool)

(assert (=> b!521704 (=> (not res!319467) (not e!304349))))

(declare-datatypes ((array!33242 0))(
  ( (array!33243 (arr!15977 (Array (_ BitVec 32) (_ BitVec 64))) (size!16341 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33242)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521704 (= res!319467 (validKeyInArray!0 (select (arr!15977 a!3235) j!176)))))

(declare-fun b!521705 () Bool)

(declare-fun res!319465 () Bool)

(declare-fun e!304353 () Bool)

(assert (=> b!521705 (=> res!319465 e!304353)))

(declare-datatypes ((SeekEntryResult!4444 0))(
  ( (MissingZero!4444 (index!19979 (_ BitVec 32))) (Found!4444 (index!19980 (_ BitVec 32))) (Intermediate!4444 (undefined!5256 Bool) (index!19981 (_ BitVec 32)) (x!48958 (_ BitVec 32))) (Undefined!4444) (MissingVacant!4444 (index!19982 (_ BitVec 32))) )
))
(declare-fun lt!239132 () SeekEntryResult!4444)

(assert (=> b!521705 (= res!319465 (or (undefined!5256 lt!239132) (not (is-Intermediate!4444 lt!239132))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!304347 () Bool)

(declare-fun b!521706 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33242 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!521706 (= e!304347 (= (seekEntryOrOpen!0 (select (arr!15977 a!3235) j!176) a!3235 mask!3524) (Found!4444 j!176)))))

(declare-fun b!521707 () Bool)

(assert (=> b!521707 (= e!304353 true)))

(assert (=> b!521707 (and (or (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16228 0))(
  ( (Unit!16229) )
))
(declare-fun lt!239130 () Unit!16228)

(declare-fun e!304352 () Unit!16228)

(assert (=> b!521707 (= lt!239130 e!304352)))

(declare-fun c!61421 () Bool)

(assert (=> b!521707 (= c!61421 (= (select (arr!15977 a!3235) (index!19981 lt!239132)) (select (arr!15977 a!3235) j!176)))))

(assert (=> b!521707 (and (bvslt (x!48958 lt!239132) #b01111111111111111111111111111110) (or (= (select (arr!15977 a!3235) (index!19981 lt!239132)) (select (arr!15977 a!3235) j!176)) (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15977 a!3235) (index!19981 lt!239132)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521708 () Bool)

(declare-fun res!319464 () Bool)

(declare-fun e!304348 () Bool)

(assert (=> b!521708 (=> (not res!319464) (not e!304348))))

(declare-datatypes ((List!10135 0))(
  ( (Nil!10132) (Cons!10131 (h!11053 (_ BitVec 64)) (t!16363 List!10135)) )
))
(declare-fun arrayNoDuplicates!0 (array!33242 (_ BitVec 32) List!10135) Bool)

(assert (=> b!521708 (= res!319464 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10132))))

(declare-fun b!521709 () Bool)

(declare-fun Unit!16230 () Unit!16228)

(assert (=> b!521709 (= e!304352 Unit!16230)))

(declare-fun lt!239136 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!239137 () Unit!16228)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16228)

(assert (=> b!521709 (= lt!239137 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239136 #b00000000000000000000000000000000 (index!19981 lt!239132) (x!48958 lt!239132) mask!3524))))

(declare-fun res!319469 () Bool)

(declare-fun lt!239135 () array!33242)

(declare-fun lt!239134 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33242 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!521709 (= res!319469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239136 lt!239134 lt!239135 mask!3524) (Intermediate!4444 false (index!19981 lt!239132) (x!48958 lt!239132))))))

(declare-fun e!304350 () Bool)

(assert (=> b!521709 (=> (not res!319469) (not e!304350))))

(assert (=> b!521709 e!304350))

(declare-fun b!521710 () Bool)

(declare-fun res!319474 () Bool)

(assert (=> b!521710 (=> (not res!319474) (not e!304348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33242 (_ BitVec 32)) Bool)

(assert (=> b!521710 (= res!319474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521711 () Bool)

(assert (=> b!521711 (= e!304349 e!304348)))

(declare-fun res!319466 () Bool)

(assert (=> b!521711 (=> (not res!319466) (not e!304348))))

(declare-fun lt!239133 () SeekEntryResult!4444)

(assert (=> b!521711 (= res!319466 (or (= lt!239133 (MissingZero!4444 i!1204)) (= lt!239133 (MissingVacant!4444 i!1204))))))

(assert (=> b!521711 (= lt!239133 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521712 () Bool)

(assert (=> b!521712 (= e!304350 false)))

(declare-fun b!521713 () Bool)

(declare-fun res!319472 () Bool)

(assert (=> b!521713 (=> (not res!319472) (not e!304349))))

(assert (=> b!521713 (= res!319472 (validKeyInArray!0 k!2280))))

(declare-fun res!319473 () Bool)

(assert (=> start!47416 (=> (not res!319473) (not e!304349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47416 (= res!319473 (validMask!0 mask!3524))))

(assert (=> start!47416 e!304349))

(assert (=> start!47416 true))

(declare-fun array_inv!11773 (array!33242) Bool)

(assert (=> start!47416 (array_inv!11773 a!3235)))

(declare-fun b!521714 () Bool)

(declare-fun res!319468 () Bool)

(assert (=> b!521714 (=> (not res!319468) (not e!304349))))

(assert (=> b!521714 (= res!319468 (and (= (size!16341 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16341 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16341 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521715 () Bool)

(declare-fun Unit!16231 () Unit!16228)

(assert (=> b!521715 (= e!304352 Unit!16231)))

(declare-fun b!521716 () Bool)

(assert (=> b!521716 (= e!304348 (not e!304353))))

(declare-fun res!319471 () Bool)

(assert (=> b!521716 (=> res!319471 e!304353)))

(declare-fun lt!239131 () (_ BitVec 32))

(assert (=> b!521716 (= res!319471 (= lt!239132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239131 lt!239134 lt!239135 mask!3524)))))

(assert (=> b!521716 (= lt!239132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239136 (select (arr!15977 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521716 (= lt!239131 (toIndex!0 lt!239134 mask!3524))))

(assert (=> b!521716 (= lt!239134 (select (store (arr!15977 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521716 (= lt!239136 (toIndex!0 (select (arr!15977 a!3235) j!176) mask!3524))))

(assert (=> b!521716 (= lt!239135 (array!33243 (store (arr!15977 a!3235) i!1204 k!2280) (size!16341 a!3235)))))

(assert (=> b!521716 e!304347))

(declare-fun res!319475 () Bool)

(assert (=> b!521716 (=> (not res!319475) (not e!304347))))

(assert (=> b!521716 (= res!319475 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239129 () Unit!16228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16228)

(assert (=> b!521716 (= lt!239129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521717 () Bool)

(declare-fun res!319470 () Bool)

(assert (=> b!521717 (=> (not res!319470) (not e!304349))))

(declare-fun arrayContainsKey!0 (array!33242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521717 (= res!319470 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47416 res!319473) b!521714))

(assert (= (and b!521714 res!319468) b!521704))

(assert (= (and b!521704 res!319467) b!521713))

(assert (= (and b!521713 res!319472) b!521717))

(assert (= (and b!521717 res!319470) b!521711))

(assert (= (and b!521711 res!319466) b!521710))

(assert (= (and b!521710 res!319474) b!521708))

(assert (= (and b!521708 res!319464) b!521716))

(assert (= (and b!521716 res!319475) b!521706))

(assert (= (and b!521716 (not res!319471)) b!521705))

(assert (= (and b!521705 (not res!319465)) b!521707))

(assert (= (and b!521707 c!61421) b!521709))

(assert (= (and b!521707 (not c!61421)) b!521715))

(assert (= (and b!521709 res!319469) b!521712))

(declare-fun m!502617 () Bool)

(assert (=> b!521711 m!502617))

(declare-fun m!502619 () Bool)

(assert (=> b!521706 m!502619))

(assert (=> b!521706 m!502619))

(declare-fun m!502621 () Bool)

(assert (=> b!521706 m!502621))

(declare-fun m!502623 () Bool)

(assert (=> start!47416 m!502623))

(declare-fun m!502625 () Bool)

(assert (=> start!47416 m!502625))

(declare-fun m!502627 () Bool)

(assert (=> b!521710 m!502627))

(declare-fun m!502629 () Bool)

(assert (=> b!521717 m!502629))

(declare-fun m!502631 () Bool)

(assert (=> b!521716 m!502631))

(declare-fun m!502633 () Bool)

(assert (=> b!521716 m!502633))

(declare-fun m!502635 () Bool)

(assert (=> b!521716 m!502635))

(assert (=> b!521716 m!502619))

(declare-fun m!502637 () Bool)

(assert (=> b!521716 m!502637))

(assert (=> b!521716 m!502619))

(declare-fun m!502639 () Bool)

(assert (=> b!521716 m!502639))

(declare-fun m!502641 () Bool)

(assert (=> b!521716 m!502641))

(declare-fun m!502643 () Bool)

(assert (=> b!521716 m!502643))

(assert (=> b!521716 m!502619))

(declare-fun m!502645 () Bool)

(assert (=> b!521716 m!502645))

(declare-fun m!502647 () Bool)

(assert (=> b!521708 m!502647))

(declare-fun m!502649 () Bool)

(assert (=> b!521707 m!502649))

(assert (=> b!521707 m!502619))

(declare-fun m!502651 () Bool)

(assert (=> b!521713 m!502651))

(assert (=> b!521704 m!502619))

(assert (=> b!521704 m!502619))

(declare-fun m!502653 () Bool)

(assert (=> b!521704 m!502653))

(declare-fun m!502655 () Bool)

(assert (=> b!521709 m!502655))

(declare-fun m!502657 () Bool)

(assert (=> b!521709 m!502657))

(push 1)

