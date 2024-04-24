; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47402 () Bool)

(assert start!47402)

(declare-fun b!521559 () Bool)

(declare-fun res!319389 () Bool)

(declare-fun e!304266 () Bool)

(assert (=> b!521559 (=> res!319389 e!304266)))

(declare-datatypes ((SeekEntryResult!4393 0))(
  ( (MissingZero!4393 (index!19775 (_ BitVec 32))) (Found!4393 (index!19776 (_ BitVec 32))) (Intermediate!4393 (undefined!5205 Bool) (index!19777 (_ BitVec 32)) (x!48904 (_ BitVec 32))) (Undefined!4393) (MissingVacant!4393 (index!19778 (_ BitVec 32))) )
))
(declare-fun lt!239095 () SeekEntryResult!4393)

(get-info :version)

(assert (=> b!521559 (= res!319389 (or (undefined!5205 lt!239095) (not ((_ is Intermediate!4393) lt!239095))))))

(declare-fun b!521560 () Bool)

(declare-fun e!304268 () Bool)

(declare-fun e!304267 () Bool)

(assert (=> b!521560 (= e!304268 e!304267)))

(declare-fun res!319391 () Bool)

(assert (=> b!521560 (=> (not res!319391) (not e!304267))))

(declare-fun lt!239090 () SeekEntryResult!4393)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521560 (= res!319391 (or (= lt!239090 (MissingZero!4393 i!1204)) (= lt!239090 (MissingVacant!4393 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33229 0))(
  ( (array!33230 (arr!15970 (Array (_ BitVec 32) (_ BitVec 64))) (size!16334 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33229)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33229 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!521560 (= lt!239090 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!319390 () Bool)

(assert (=> start!47402 (=> (not res!319390) (not e!304268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47402 (= res!319390 (validMask!0 mask!3524))))

(assert (=> start!47402 e!304268))

(assert (=> start!47402 true))

(declare-fun array_inv!11829 (array!33229) Bool)

(assert (=> start!47402 (array_inv!11829 a!3235)))

(declare-fun b!521561 () Bool)

(declare-fun e!304270 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521561 (= e!304270 (= (seekEntryOrOpen!0 (select (arr!15970 a!3235) j!176) a!3235 mask!3524) (Found!4393 j!176)))))

(declare-fun b!521562 () Bool)

(declare-fun e!304271 () Bool)

(assert (=> b!521562 (= e!304271 false)))

(declare-fun b!521563 () Bool)

(declare-fun res!319386 () Bool)

(assert (=> b!521563 (=> (not res!319386) (not e!304267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33229 (_ BitVec 32)) Bool)

(assert (=> b!521563 (= res!319386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521564 () Bool)

(declare-datatypes ((Unit!16183 0))(
  ( (Unit!16184) )
))
(declare-fun e!304269 () Unit!16183)

(declare-fun Unit!16185 () Unit!16183)

(assert (=> b!521564 (= e!304269 Unit!16185)))

(declare-fun lt!239089 () (_ BitVec 32))

(declare-fun lt!239094 () Unit!16183)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16183)

(assert (=> b!521564 (= lt!239094 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239089 #b00000000000000000000000000000000 (index!19777 lt!239095) (x!48904 lt!239095) mask!3524))))

(declare-fun lt!239091 () array!33229)

(declare-fun res!319394 () Bool)

(declare-fun lt!239093 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33229 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!521564 (= res!319394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239089 lt!239093 lt!239091 mask!3524) (Intermediate!4393 false (index!19777 lt!239095) (x!48904 lt!239095))))))

(assert (=> b!521564 (=> (not res!319394) (not e!304271))))

(assert (=> b!521564 e!304271))

(declare-fun b!521565 () Bool)

(declare-fun res!319396 () Bool)

(assert (=> b!521565 (=> (not res!319396) (not e!304268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521565 (= res!319396 (validKeyInArray!0 (select (arr!15970 a!3235) j!176)))))

(declare-fun b!521566 () Bool)

(declare-fun Unit!16186 () Unit!16183)

(assert (=> b!521566 (= e!304269 Unit!16186)))

(declare-fun b!521567 () Bool)

(assert (=> b!521567 (= e!304267 (not e!304266))))

(declare-fun res!319387 () Bool)

(assert (=> b!521567 (=> res!319387 e!304266)))

(declare-fun lt!239088 () (_ BitVec 32))

(assert (=> b!521567 (= res!319387 (= lt!239095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239088 lt!239093 lt!239091 mask!3524)))))

(assert (=> b!521567 (= lt!239095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239089 (select (arr!15970 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521567 (= lt!239088 (toIndex!0 lt!239093 mask!3524))))

(assert (=> b!521567 (= lt!239093 (select (store (arr!15970 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521567 (= lt!239089 (toIndex!0 (select (arr!15970 a!3235) j!176) mask!3524))))

(assert (=> b!521567 (= lt!239091 (array!33230 (store (arr!15970 a!3235) i!1204 k0!2280) (size!16334 a!3235)))))

(assert (=> b!521567 e!304270))

(declare-fun res!319395 () Bool)

(assert (=> b!521567 (=> (not res!319395) (not e!304270))))

(assert (=> b!521567 (= res!319395 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239092 () Unit!16183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16183)

(assert (=> b!521567 (= lt!239092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521568 () Bool)

(declare-fun res!319392 () Bool)

(assert (=> b!521568 (=> (not res!319392) (not e!304268))))

(assert (=> b!521568 (= res!319392 (and (= (size!16334 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16334 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16334 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521569 () Bool)

(declare-fun res!319388 () Bool)

(assert (=> b!521569 (=> (not res!319388) (not e!304268))))

(declare-fun arrayContainsKey!0 (array!33229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521569 (= res!319388 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521570 () Bool)

(assert (=> b!521570 (= e!304266 true)))

(assert (=> b!521570 (and (or (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239087 () Unit!16183)

(assert (=> b!521570 (= lt!239087 e!304269)))

(declare-fun c!61388 () Bool)

(assert (=> b!521570 (= c!61388 (= (select (arr!15970 a!3235) (index!19777 lt!239095)) (select (arr!15970 a!3235) j!176)))))

(assert (=> b!521570 (and (bvslt (x!48904 lt!239095) #b01111111111111111111111111111110) (or (= (select (arr!15970 a!3235) (index!19777 lt!239095)) (select (arr!15970 a!3235) j!176)) (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15970 a!3235) (index!19777 lt!239095)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521571 () Bool)

(declare-fun res!319393 () Bool)

(assert (=> b!521571 (=> (not res!319393) (not e!304268))))

(assert (=> b!521571 (= res!319393 (validKeyInArray!0 k0!2280))))

(declare-fun b!521572 () Bool)

(declare-fun res!319385 () Bool)

(assert (=> b!521572 (=> (not res!319385) (not e!304267))))

(declare-datatypes ((List!10035 0))(
  ( (Nil!10032) (Cons!10031 (h!10953 (_ BitVec 64)) (t!16255 List!10035)) )
))
(declare-fun arrayNoDuplicates!0 (array!33229 (_ BitVec 32) List!10035) Bool)

(assert (=> b!521572 (= res!319385 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10032))))

(assert (= (and start!47402 res!319390) b!521568))

(assert (= (and b!521568 res!319392) b!521565))

(assert (= (and b!521565 res!319396) b!521571))

(assert (= (and b!521571 res!319393) b!521569))

(assert (= (and b!521569 res!319388) b!521560))

(assert (= (and b!521560 res!319391) b!521563))

(assert (= (and b!521563 res!319386) b!521572))

(assert (= (and b!521572 res!319385) b!521567))

(assert (= (and b!521567 res!319395) b!521561))

(assert (= (and b!521567 (not res!319387)) b!521559))

(assert (= (and b!521559 (not res!319389)) b!521570))

(assert (= (and b!521570 c!61388) b!521564))

(assert (= (and b!521570 (not c!61388)) b!521566))

(assert (= (and b!521564 res!319394) b!521562))

(declare-fun m!502717 () Bool)

(assert (=> b!521572 m!502717))

(declare-fun m!502719 () Bool)

(assert (=> b!521564 m!502719))

(declare-fun m!502721 () Bool)

(assert (=> b!521564 m!502721))

(declare-fun m!502723 () Bool)

(assert (=> b!521565 m!502723))

(assert (=> b!521565 m!502723))

(declare-fun m!502725 () Bool)

(assert (=> b!521565 m!502725))

(declare-fun m!502727 () Bool)

(assert (=> b!521569 m!502727))

(declare-fun m!502729 () Bool)

(assert (=> b!521570 m!502729))

(assert (=> b!521570 m!502723))

(assert (=> b!521561 m!502723))

(assert (=> b!521561 m!502723))

(declare-fun m!502731 () Bool)

(assert (=> b!521561 m!502731))

(declare-fun m!502733 () Bool)

(assert (=> b!521563 m!502733))

(declare-fun m!502735 () Bool)

(assert (=> b!521560 m!502735))

(declare-fun m!502737 () Bool)

(assert (=> b!521567 m!502737))

(declare-fun m!502739 () Bool)

(assert (=> b!521567 m!502739))

(declare-fun m!502741 () Bool)

(assert (=> b!521567 m!502741))

(declare-fun m!502743 () Bool)

(assert (=> b!521567 m!502743))

(assert (=> b!521567 m!502723))

(declare-fun m!502745 () Bool)

(assert (=> b!521567 m!502745))

(assert (=> b!521567 m!502723))

(declare-fun m!502747 () Bool)

(assert (=> b!521567 m!502747))

(assert (=> b!521567 m!502723))

(declare-fun m!502749 () Bool)

(assert (=> b!521567 m!502749))

(declare-fun m!502751 () Bool)

(assert (=> b!521567 m!502751))

(declare-fun m!502753 () Bool)

(assert (=> start!47402 m!502753))

(declare-fun m!502755 () Bool)

(assert (=> start!47402 m!502755))

(declare-fun m!502757 () Bool)

(assert (=> b!521571 m!502757))

(check-sat (not b!521572) (not b!521561) (not b!521560) (not start!47402) (not b!521563) (not b!521571) (not b!521569) (not b!521565) (not b!521564) (not b!521567))
(check-sat)
