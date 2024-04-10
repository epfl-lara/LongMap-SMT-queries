; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45372 () Bool)

(assert start!45372)

(declare-fun b!498333 () Bool)

(declare-fun res!300446 () Bool)

(declare-fun e!292082 () Bool)

(assert (=> b!498333 (=> (not res!300446) (not e!292082))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498333 (= res!300446 (validKeyInArray!0 k!2280))))

(declare-fun b!498334 () Bool)

(declare-fun e!292083 () Bool)

(assert (=> b!498334 (= e!292083 false)))

(declare-fun b!498335 () Bool)

(declare-fun e!292080 () Bool)

(assert (=> b!498335 (= e!292082 e!292080)))

(declare-fun res!300453 () Bool)

(assert (=> b!498335 (=> (not res!300453) (not e!292080))))

(declare-datatypes ((SeekEntryResult!3947 0))(
  ( (MissingZero!3947 (index!17970 (_ BitVec 32))) (Found!3947 (index!17971 (_ BitVec 32))) (Intermediate!3947 (undefined!4759 Bool) (index!17972 (_ BitVec 32)) (x!47024 (_ BitVec 32))) (Undefined!3947) (MissingVacant!3947 (index!17973 (_ BitVec 32))) )
))
(declare-fun lt!225715 () SeekEntryResult!3947)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498335 (= res!300453 (or (= lt!225715 (MissingZero!3947 i!1204)) (= lt!225715 (MissingVacant!3947 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32197 0))(
  ( (array!32198 (arr!15480 (Array (_ BitVec 32) (_ BitVec 64))) (size!15844 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32197)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32197 (_ BitVec 32)) SeekEntryResult!3947)

(assert (=> b!498335 (= lt!225715 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498336 () Bool)

(declare-fun res!300451 () Bool)

(assert (=> b!498336 (=> (not res!300451) (not e!292082))))

(declare-fun arrayContainsKey!0 (array!32197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498336 (= res!300451 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498337 () Bool)

(declare-datatypes ((Unit!14864 0))(
  ( (Unit!14865) )
))
(declare-fun e!292079 () Unit!14864)

(declare-fun Unit!14866 () Unit!14864)

(assert (=> b!498337 (= e!292079 Unit!14866)))

(declare-fun lt!225716 () Unit!14864)

(declare-fun lt!225718 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225714 () SeekEntryResult!3947)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14864)

(assert (=> b!498337 (= lt!225716 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225718 #b00000000000000000000000000000000 (index!17972 lt!225714) (x!47024 lt!225714) mask!3524))))

(declare-fun res!300443 () Bool)

(declare-fun lt!225717 () (_ BitVec 64))

(declare-fun lt!225712 () array!32197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32197 (_ BitVec 32)) SeekEntryResult!3947)

(assert (=> b!498337 (= res!300443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225718 lt!225717 lt!225712 mask!3524) (Intermediate!3947 false (index!17972 lt!225714) (x!47024 lt!225714))))))

(assert (=> b!498337 (=> (not res!300443) (not e!292083))))

(assert (=> b!498337 e!292083))

(declare-fun b!498338 () Bool)

(declare-fun e!292085 () Bool)

(assert (=> b!498338 (= e!292085 true)))

(declare-fun lt!225713 () SeekEntryResult!3947)

(assert (=> b!498338 (= lt!225713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225718 lt!225717 lt!225712 mask!3524))))

(declare-fun b!498340 () Bool)

(declare-fun e!292081 () Bool)

(assert (=> b!498340 (= e!292081 (= (seekEntryOrOpen!0 (select (arr!15480 a!3235) j!176) a!3235 mask!3524) (Found!3947 j!176)))))

(declare-fun b!498341 () Bool)

(declare-fun e!292086 () Bool)

(assert (=> b!498341 (= e!292086 e!292085)))

(declare-fun res!300449 () Bool)

(assert (=> b!498341 (=> res!300449 e!292085)))

(assert (=> b!498341 (= res!300449 (or (bvsgt #b00000000000000000000000000000000 (x!47024 lt!225714)) (bvsgt (x!47024 lt!225714) #b01111111111111111111111111111110) (bvslt lt!225718 #b00000000000000000000000000000000) (bvsge lt!225718 (size!15844 a!3235)) (bvslt (index!17972 lt!225714) #b00000000000000000000000000000000) (bvsge (index!17972 lt!225714) (size!15844 a!3235)) (not (= lt!225714 (Intermediate!3947 false (index!17972 lt!225714) (x!47024 lt!225714))))))))

(assert (=> b!498341 (and (or (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225709 () Unit!14864)

(assert (=> b!498341 (= lt!225709 e!292079)))

(declare-fun c!59222 () Bool)

(assert (=> b!498341 (= c!59222 (= (select (arr!15480 a!3235) (index!17972 lt!225714)) (select (arr!15480 a!3235) j!176)))))

(assert (=> b!498341 (and (bvslt (x!47024 lt!225714) #b01111111111111111111111111111110) (or (= (select (arr!15480 a!3235) (index!17972 lt!225714)) (select (arr!15480 a!3235) j!176)) (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15480 a!3235) (index!17972 lt!225714)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498342 () Bool)

(declare-fun res!300445 () Bool)

(assert (=> b!498342 (=> (not res!300445) (not e!292082))))

(assert (=> b!498342 (= res!300445 (and (= (size!15844 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15844 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15844 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498343 () Bool)

(assert (=> b!498343 (= e!292080 (not e!292086))))

(declare-fun res!300444 () Bool)

(assert (=> b!498343 (=> res!300444 e!292086)))

(declare-fun lt!225710 () (_ BitVec 32))

(assert (=> b!498343 (= res!300444 (= lt!225714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225710 lt!225717 lt!225712 mask!3524)))))

(assert (=> b!498343 (= lt!225714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225718 (select (arr!15480 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498343 (= lt!225710 (toIndex!0 lt!225717 mask!3524))))

(assert (=> b!498343 (= lt!225717 (select (store (arr!15480 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498343 (= lt!225718 (toIndex!0 (select (arr!15480 a!3235) j!176) mask!3524))))

(assert (=> b!498343 (= lt!225712 (array!32198 (store (arr!15480 a!3235) i!1204 k!2280) (size!15844 a!3235)))))

(assert (=> b!498343 e!292081))

(declare-fun res!300450 () Bool)

(assert (=> b!498343 (=> (not res!300450) (not e!292081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32197 (_ BitVec 32)) Bool)

(assert (=> b!498343 (= res!300450 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225711 () Unit!14864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14864)

(assert (=> b!498343 (= lt!225711 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498344 () Bool)

(declare-fun Unit!14867 () Unit!14864)

(assert (=> b!498344 (= e!292079 Unit!14867)))

(declare-fun b!498345 () Bool)

(declare-fun res!300452 () Bool)

(assert (=> b!498345 (=> (not res!300452) (not e!292082))))

(assert (=> b!498345 (= res!300452 (validKeyInArray!0 (select (arr!15480 a!3235) j!176)))))

(declare-fun b!498346 () Bool)

(declare-fun res!300447 () Bool)

(assert (=> b!498346 (=> res!300447 e!292086)))

(assert (=> b!498346 (= res!300447 (or (undefined!4759 lt!225714) (not (is-Intermediate!3947 lt!225714))))))

(declare-fun b!498347 () Bool)

(declare-fun res!300455 () Bool)

(assert (=> b!498347 (=> (not res!300455) (not e!292080))))

(assert (=> b!498347 (= res!300455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498339 () Bool)

(declare-fun res!300454 () Bool)

(assert (=> b!498339 (=> (not res!300454) (not e!292080))))

(declare-datatypes ((List!9638 0))(
  ( (Nil!9635) (Cons!9634 (h!10508 (_ BitVec 64)) (t!15866 List!9638)) )
))
(declare-fun arrayNoDuplicates!0 (array!32197 (_ BitVec 32) List!9638) Bool)

(assert (=> b!498339 (= res!300454 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9635))))

(declare-fun res!300448 () Bool)

(assert (=> start!45372 (=> (not res!300448) (not e!292082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45372 (= res!300448 (validMask!0 mask!3524))))

(assert (=> start!45372 e!292082))

(assert (=> start!45372 true))

(declare-fun array_inv!11276 (array!32197) Bool)

(assert (=> start!45372 (array_inv!11276 a!3235)))

(assert (= (and start!45372 res!300448) b!498342))

(assert (= (and b!498342 res!300445) b!498345))

(assert (= (and b!498345 res!300452) b!498333))

(assert (= (and b!498333 res!300446) b!498336))

(assert (= (and b!498336 res!300451) b!498335))

(assert (= (and b!498335 res!300453) b!498347))

(assert (= (and b!498347 res!300455) b!498339))

(assert (= (and b!498339 res!300454) b!498343))

(assert (= (and b!498343 res!300450) b!498340))

(assert (= (and b!498343 (not res!300444)) b!498346))

(assert (= (and b!498346 (not res!300447)) b!498341))

(assert (= (and b!498341 c!59222) b!498337))

(assert (= (and b!498341 (not c!59222)) b!498344))

(assert (= (and b!498337 res!300443) b!498334))

(assert (= (and b!498341 (not res!300449)) b!498338))

(declare-fun m!479607 () Bool)

(assert (=> b!498337 m!479607))

(declare-fun m!479609 () Bool)

(assert (=> b!498337 m!479609))

(declare-fun m!479611 () Bool)

(assert (=> b!498345 m!479611))

(assert (=> b!498345 m!479611))

(declare-fun m!479613 () Bool)

(assert (=> b!498345 m!479613))

(declare-fun m!479615 () Bool)

(assert (=> b!498335 m!479615))

(assert (=> b!498340 m!479611))

(assert (=> b!498340 m!479611))

(declare-fun m!479617 () Bool)

(assert (=> b!498340 m!479617))

(declare-fun m!479619 () Bool)

(assert (=> b!498347 m!479619))

(assert (=> b!498338 m!479609))

(declare-fun m!479621 () Bool)

(assert (=> b!498339 m!479621))

(declare-fun m!479623 () Bool)

(assert (=> b!498343 m!479623))

(declare-fun m!479625 () Bool)

(assert (=> b!498343 m!479625))

(declare-fun m!479627 () Bool)

(assert (=> b!498343 m!479627))

(assert (=> b!498343 m!479611))

(declare-fun m!479629 () Bool)

(assert (=> b!498343 m!479629))

(assert (=> b!498343 m!479611))

(declare-fun m!479631 () Bool)

(assert (=> b!498343 m!479631))

(declare-fun m!479633 () Bool)

(assert (=> b!498343 m!479633))

(assert (=> b!498343 m!479611))

(declare-fun m!479635 () Bool)

(assert (=> b!498343 m!479635))

(declare-fun m!479637 () Bool)

(assert (=> b!498343 m!479637))

(declare-fun m!479639 () Bool)

(assert (=> b!498333 m!479639))

(declare-fun m!479641 () Bool)

(assert (=> b!498341 m!479641))

(assert (=> b!498341 m!479611))

(declare-fun m!479643 () Bool)

(assert (=> b!498336 m!479643))

(declare-fun m!479645 () Bool)

(assert (=> start!45372 m!479645))

(declare-fun m!479647 () Bool)

(assert (=> start!45372 m!479647))

(push 1)

