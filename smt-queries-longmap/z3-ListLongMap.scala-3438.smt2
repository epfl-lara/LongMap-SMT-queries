; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47750 () Bool)

(assert start!47750)

(declare-fun b!525550 () Bool)

(declare-fun e!306419 () Bool)

(declare-fun e!306414 () Bool)

(assert (=> b!525550 (= e!306419 e!306414)))

(declare-fun res!322301 () Bool)

(assert (=> b!525550 (=> (not res!322301) (not e!306414))))

(declare-datatypes ((SeekEntryResult!4512 0))(
  ( (MissingZero!4512 (index!20260 (_ BitVec 32))) (Found!4512 (index!20261 (_ BitVec 32))) (Intermediate!4512 (undefined!5324 Bool) (index!20262 (_ BitVec 32)) (x!49237 (_ BitVec 32))) (Undefined!4512) (MissingVacant!4512 (index!20263 (_ BitVec 32))) )
))
(declare-fun lt!241477 () SeekEntryResult!4512)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525550 (= res!322301 (or (= lt!241477 (MissingZero!4512 i!1204)) (= lt!241477 (MissingVacant!4512 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33387 0))(
  ( (array!33388 (arr!16045 (Array (_ BitVec 32) (_ BitVec 64))) (size!16409 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33387)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33387 (_ BitVec 32)) SeekEntryResult!4512)

(assert (=> b!525550 (= lt!241477 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525551 () Bool)

(declare-fun res!322299 () Bool)

(declare-fun e!306415 () Bool)

(assert (=> b!525551 (=> res!322299 e!306415)))

(declare-fun lt!241476 () SeekEntryResult!4512)

(get-info :version)

(assert (=> b!525551 (= res!322299 (or (undefined!5324 lt!241476) (not ((_ is Intermediate!4512) lt!241476))))))

(declare-fun e!306417 () Bool)

(declare-fun b!525552 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525552 (= e!306417 (= (seekEntryOrOpen!0 (select (arr!16045 a!3235) j!176) a!3235 mask!3524) (Found!4512 j!176)))))

(declare-fun b!525553 () Bool)

(declare-fun res!322306 () Bool)

(assert (=> b!525553 (=> (not res!322306) (not e!306419))))

(declare-fun arrayContainsKey!0 (array!33387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525553 (= res!322306 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525554 () Bool)

(assert (=> b!525554 (= e!306414 (not e!306415))))

(declare-fun res!322305 () Bool)

(assert (=> b!525554 (=> res!322305 e!306415)))

(declare-fun lt!241481 () (_ BitVec 64))

(declare-fun lt!241480 () array!33387)

(declare-fun lt!241478 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33387 (_ BitVec 32)) SeekEntryResult!4512)

(assert (=> b!525554 (= res!322305 (= lt!241476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241478 lt!241481 lt!241480 mask!3524)))))

(declare-fun lt!241474 () (_ BitVec 32))

(assert (=> b!525554 (= lt!241476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241474 (select (arr!16045 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525554 (= lt!241478 (toIndex!0 lt!241481 mask!3524))))

(assert (=> b!525554 (= lt!241481 (select (store (arr!16045 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525554 (= lt!241474 (toIndex!0 (select (arr!16045 a!3235) j!176) mask!3524))))

(assert (=> b!525554 (= lt!241480 (array!33388 (store (arr!16045 a!3235) i!1204 k0!2280) (size!16409 a!3235)))))

(assert (=> b!525554 e!306417))

(declare-fun res!322309 () Bool)

(assert (=> b!525554 (=> (not res!322309) (not e!306417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33387 (_ BitVec 32)) Bool)

(assert (=> b!525554 (= res!322309 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16500 0))(
  ( (Unit!16501) )
))
(declare-fun lt!241482 () Unit!16500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16500)

(assert (=> b!525554 (= lt!241482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525555 () Bool)

(declare-fun e!306416 () Unit!16500)

(declare-fun Unit!16502 () Unit!16500)

(assert (=> b!525555 (= e!306416 Unit!16502)))

(declare-fun lt!241479 () Unit!16500)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16500)

(assert (=> b!525555 (= lt!241479 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241474 #b00000000000000000000000000000000 (index!20262 lt!241476) (x!49237 lt!241476) mask!3524))))

(declare-fun res!322308 () Bool)

(assert (=> b!525555 (= res!322308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241474 lt!241481 lt!241480 mask!3524) (Intermediate!4512 false (index!20262 lt!241476) (x!49237 lt!241476))))))

(declare-fun e!306418 () Bool)

(assert (=> b!525555 (=> (not res!322308) (not e!306418))))

(assert (=> b!525555 e!306418))

(declare-fun b!525556 () Bool)

(declare-fun res!322310 () Bool)

(assert (=> b!525556 (=> (not res!322310) (not e!306419))))

(assert (=> b!525556 (= res!322310 (and (= (size!16409 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16409 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16409 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525557 () Bool)

(declare-fun res!322303 () Bool)

(assert (=> b!525557 (=> (not res!322303) (not e!306414))))

(declare-datatypes ((List!10203 0))(
  ( (Nil!10200) (Cons!10199 (h!11130 (_ BitVec 64)) (t!16431 List!10203)) )
))
(declare-fun arrayNoDuplicates!0 (array!33387 (_ BitVec 32) List!10203) Bool)

(assert (=> b!525557 (= res!322303 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10200))))

(declare-fun b!525558 () Bool)

(declare-fun res!322302 () Bool)

(assert (=> b!525558 (=> (not res!322302) (not e!306419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525558 (= res!322302 (validKeyInArray!0 (select (arr!16045 a!3235) j!176)))))

(declare-fun res!322300 () Bool)

(assert (=> start!47750 (=> (not res!322300) (not e!306419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47750 (= res!322300 (validMask!0 mask!3524))))

(assert (=> start!47750 e!306419))

(assert (=> start!47750 true))

(declare-fun array_inv!11841 (array!33387) Bool)

(assert (=> start!47750 (array_inv!11841 a!3235)))

(declare-fun b!525559 () Bool)

(declare-fun res!322307 () Bool)

(assert (=> b!525559 (=> (not res!322307) (not e!306414))))

(assert (=> b!525559 (= res!322307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525560 () Bool)

(assert (=> b!525560 (= e!306418 false)))

(declare-fun b!525561 () Bool)

(assert (=> b!525561 (= e!306415 true)))

(assert (=> b!525561 (= (index!20262 lt!241476) i!1204)))

(declare-fun lt!241475 () Unit!16500)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16500)

(assert (=> b!525561 (= lt!241475 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241474 #b00000000000000000000000000000000 (index!20262 lt!241476) (x!49237 lt!241476) mask!3524))))

(assert (=> b!525561 (and (or (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241483 () Unit!16500)

(assert (=> b!525561 (= lt!241483 e!306416)))

(declare-fun c!61931 () Bool)

(assert (=> b!525561 (= c!61931 (= (select (arr!16045 a!3235) (index!20262 lt!241476)) (select (arr!16045 a!3235) j!176)))))

(assert (=> b!525561 (and (bvslt (x!49237 lt!241476) #b01111111111111111111111111111110) (or (= (select (arr!16045 a!3235) (index!20262 lt!241476)) (select (arr!16045 a!3235) j!176)) (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16045 a!3235) (index!20262 lt!241476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525562 () Bool)

(declare-fun Unit!16503 () Unit!16500)

(assert (=> b!525562 (= e!306416 Unit!16503)))

(declare-fun b!525563 () Bool)

(declare-fun res!322304 () Bool)

(assert (=> b!525563 (=> (not res!322304) (not e!306419))))

(assert (=> b!525563 (= res!322304 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47750 res!322300) b!525556))

(assert (= (and b!525556 res!322310) b!525558))

(assert (= (and b!525558 res!322302) b!525563))

(assert (= (and b!525563 res!322304) b!525553))

(assert (= (and b!525553 res!322306) b!525550))

(assert (= (and b!525550 res!322301) b!525559))

(assert (= (and b!525559 res!322307) b!525557))

(assert (= (and b!525557 res!322303) b!525554))

(assert (= (and b!525554 res!322309) b!525552))

(assert (= (and b!525554 (not res!322305)) b!525551))

(assert (= (and b!525551 (not res!322299)) b!525561))

(assert (= (and b!525561 c!61931) b!525555))

(assert (= (and b!525561 (not c!61931)) b!525562))

(assert (= (and b!525555 res!322308) b!525560))

(declare-fun m!506213 () Bool)

(assert (=> b!525557 m!506213))

(declare-fun m!506215 () Bool)

(assert (=> b!525559 m!506215))

(declare-fun m!506217 () Bool)

(assert (=> b!525555 m!506217))

(declare-fun m!506219 () Bool)

(assert (=> b!525555 m!506219))

(declare-fun m!506221 () Bool)

(assert (=> b!525563 m!506221))

(declare-fun m!506223 () Bool)

(assert (=> b!525554 m!506223))

(declare-fun m!506225 () Bool)

(assert (=> b!525554 m!506225))

(declare-fun m!506227 () Bool)

(assert (=> b!525554 m!506227))

(declare-fun m!506229 () Bool)

(assert (=> b!525554 m!506229))

(declare-fun m!506231 () Bool)

(assert (=> b!525554 m!506231))

(assert (=> b!525554 m!506223))

(declare-fun m!506233 () Bool)

(assert (=> b!525554 m!506233))

(assert (=> b!525554 m!506223))

(declare-fun m!506235 () Bool)

(assert (=> b!525554 m!506235))

(declare-fun m!506237 () Bool)

(assert (=> b!525554 m!506237))

(declare-fun m!506239 () Bool)

(assert (=> b!525554 m!506239))

(assert (=> b!525558 m!506223))

(assert (=> b!525558 m!506223))

(declare-fun m!506241 () Bool)

(assert (=> b!525558 m!506241))

(declare-fun m!506243 () Bool)

(assert (=> b!525553 m!506243))

(assert (=> b!525552 m!506223))

(assert (=> b!525552 m!506223))

(declare-fun m!506245 () Bool)

(assert (=> b!525552 m!506245))

(declare-fun m!506247 () Bool)

(assert (=> b!525550 m!506247))

(declare-fun m!506249 () Bool)

(assert (=> start!47750 m!506249))

(declare-fun m!506251 () Bool)

(assert (=> start!47750 m!506251))

(declare-fun m!506253 () Bool)

(assert (=> b!525561 m!506253))

(declare-fun m!506255 () Bool)

(assert (=> b!525561 m!506255))

(assert (=> b!525561 m!506223))

(check-sat (not b!525550) (not b!525555) (not start!47750) (not b!525563) (not b!525554) (not b!525561) (not b!525559) (not b!525558) (not b!525552) (not b!525553) (not b!525557))
(check-sat)
