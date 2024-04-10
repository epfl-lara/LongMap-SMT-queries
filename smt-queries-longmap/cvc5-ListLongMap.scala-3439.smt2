; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47754 () Bool)

(assert start!47754)

(declare-fun b!525634 () Bool)

(declare-datatypes ((Unit!16508 0))(
  ( (Unit!16509) )
))
(declare-fun e!306461 () Unit!16508)

(declare-fun Unit!16510 () Unit!16508)

(assert (=> b!525634 (= e!306461 Unit!16510)))

(declare-fun b!525635 () Bool)

(declare-fun res!322381 () Bool)

(declare-fun e!306458 () Bool)

(assert (=> b!525635 (=> (not res!322381) (not e!306458))))

(declare-datatypes ((array!33391 0))(
  ( (array!33392 (arr!16047 (Array (_ BitVec 32) (_ BitVec 64))) (size!16411 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33391)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33391 (_ BitVec 32)) Bool)

(assert (=> b!525635 (= res!322381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525636 () Bool)

(declare-fun e!306456 () Bool)

(assert (=> b!525636 (= e!306456 e!306458)))

(declare-fun res!322372 () Bool)

(assert (=> b!525636 (=> (not res!322372) (not e!306458))))

(declare-datatypes ((SeekEntryResult!4514 0))(
  ( (MissingZero!4514 (index!20268 (_ BitVec 32))) (Found!4514 (index!20269 (_ BitVec 32))) (Intermediate!4514 (undefined!5326 Bool) (index!20270 (_ BitVec 32)) (x!49247 (_ BitVec 32))) (Undefined!4514) (MissingVacant!4514 (index!20271 (_ BitVec 32))) )
))
(declare-fun lt!241534 () SeekEntryResult!4514)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525636 (= res!322372 (or (= lt!241534 (MissingZero!4514 i!1204)) (= lt!241534 (MissingVacant!4514 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33391 (_ BitVec 32)) SeekEntryResult!4514)

(assert (=> b!525636 (= lt!241534 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525637 () Bool)

(declare-fun res!322379 () Bool)

(assert (=> b!525637 (=> (not res!322379) (not e!306456))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525637 (= res!322379 (and (= (size!16411 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16411 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16411 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!306460 () Bool)

(declare-fun b!525639 () Bool)

(assert (=> b!525639 (= e!306460 (= (seekEntryOrOpen!0 (select (arr!16047 a!3235) j!176) a!3235 mask!3524) (Found!4514 j!176)))))

(declare-fun b!525640 () Bool)

(declare-fun res!322375 () Bool)

(assert (=> b!525640 (=> (not res!322375) (not e!306456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525640 (= res!322375 (validKeyInArray!0 k!2280))))

(declare-fun b!525641 () Bool)

(declare-fun e!306457 () Bool)

(assert (=> b!525641 (= e!306457 true)))

(declare-fun lt!241543 () SeekEntryResult!4514)

(assert (=> b!525641 (= (index!20270 lt!241543) i!1204)))

(declare-fun lt!241537 () (_ BitVec 32))

(declare-fun lt!241539 () Unit!16508)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33391 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16508)

(assert (=> b!525641 (= lt!241539 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241537 #b00000000000000000000000000000000 (index!20270 lt!241543) (x!49247 lt!241543) mask!3524))))

(assert (=> b!525641 (and (or (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241541 () Unit!16508)

(assert (=> b!525641 (= lt!241541 e!306461)))

(declare-fun c!61937 () Bool)

(assert (=> b!525641 (= c!61937 (= (select (arr!16047 a!3235) (index!20270 lt!241543)) (select (arr!16047 a!3235) j!176)))))

(assert (=> b!525641 (and (bvslt (x!49247 lt!241543) #b01111111111111111111111111111110) (or (= (select (arr!16047 a!3235) (index!20270 lt!241543)) (select (arr!16047 a!3235) j!176)) (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16047 a!3235) (index!20270 lt!241543)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525642 () Bool)

(declare-fun Unit!16511 () Unit!16508)

(assert (=> b!525642 (= e!306461 Unit!16511)))

(declare-fun lt!241542 () Unit!16508)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33391 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16508)

(assert (=> b!525642 (= lt!241542 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241537 #b00000000000000000000000000000000 (index!20270 lt!241543) (x!49247 lt!241543) mask!3524))))

(declare-fun res!322376 () Bool)

(declare-fun lt!241538 () array!33391)

(declare-fun lt!241540 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33391 (_ BitVec 32)) SeekEntryResult!4514)

(assert (=> b!525642 (= res!322376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241537 lt!241540 lt!241538 mask!3524) (Intermediate!4514 false (index!20270 lt!241543) (x!49247 lt!241543))))))

(declare-fun e!306459 () Bool)

(assert (=> b!525642 (=> (not res!322376) (not e!306459))))

(assert (=> b!525642 e!306459))

(declare-fun b!525643 () Bool)

(assert (=> b!525643 (= e!306458 (not e!306457))))

(declare-fun res!322377 () Bool)

(assert (=> b!525643 (=> res!322377 e!306457)))

(declare-fun lt!241535 () (_ BitVec 32))

(assert (=> b!525643 (= res!322377 (= lt!241543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241535 lt!241540 lt!241538 mask!3524)))))

(assert (=> b!525643 (= lt!241543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241537 (select (arr!16047 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525643 (= lt!241535 (toIndex!0 lt!241540 mask!3524))))

(assert (=> b!525643 (= lt!241540 (select (store (arr!16047 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525643 (= lt!241537 (toIndex!0 (select (arr!16047 a!3235) j!176) mask!3524))))

(assert (=> b!525643 (= lt!241538 (array!33392 (store (arr!16047 a!3235) i!1204 k!2280) (size!16411 a!3235)))))

(assert (=> b!525643 e!306460))

(declare-fun res!322371 () Bool)

(assert (=> b!525643 (=> (not res!322371) (not e!306460))))

(assert (=> b!525643 (= res!322371 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241536 () Unit!16508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16508)

(assert (=> b!525643 (= lt!241536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525644 () Bool)

(declare-fun res!322378 () Bool)

(assert (=> b!525644 (=> (not res!322378) (not e!306456))))

(declare-fun arrayContainsKey!0 (array!33391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525644 (= res!322378 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525645 () Bool)

(declare-fun res!322382 () Bool)

(assert (=> b!525645 (=> (not res!322382) (not e!306456))))

(assert (=> b!525645 (= res!322382 (validKeyInArray!0 (select (arr!16047 a!3235) j!176)))))

(declare-fun b!525646 () Bool)

(declare-fun res!322380 () Bool)

(assert (=> b!525646 (=> (not res!322380) (not e!306458))))

(declare-datatypes ((List!10205 0))(
  ( (Nil!10202) (Cons!10201 (h!11132 (_ BitVec 64)) (t!16433 List!10205)) )
))
(declare-fun arrayNoDuplicates!0 (array!33391 (_ BitVec 32) List!10205) Bool)

(assert (=> b!525646 (= res!322380 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10202))))

(declare-fun b!525647 () Bool)

(declare-fun res!322374 () Bool)

(assert (=> b!525647 (=> res!322374 e!306457)))

(assert (=> b!525647 (= res!322374 (or (undefined!5326 lt!241543) (not (is-Intermediate!4514 lt!241543))))))

(declare-fun b!525638 () Bool)

(assert (=> b!525638 (= e!306459 false)))

(declare-fun res!322373 () Bool)

(assert (=> start!47754 (=> (not res!322373) (not e!306456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47754 (= res!322373 (validMask!0 mask!3524))))

(assert (=> start!47754 e!306456))

(assert (=> start!47754 true))

(declare-fun array_inv!11843 (array!33391) Bool)

(assert (=> start!47754 (array_inv!11843 a!3235)))

(assert (= (and start!47754 res!322373) b!525637))

(assert (= (and b!525637 res!322379) b!525645))

(assert (= (and b!525645 res!322382) b!525640))

(assert (= (and b!525640 res!322375) b!525644))

(assert (= (and b!525644 res!322378) b!525636))

(assert (= (and b!525636 res!322372) b!525635))

(assert (= (and b!525635 res!322381) b!525646))

(assert (= (and b!525646 res!322380) b!525643))

(assert (= (and b!525643 res!322371) b!525639))

(assert (= (and b!525643 (not res!322377)) b!525647))

(assert (= (and b!525647 (not res!322374)) b!525641))

(assert (= (and b!525641 c!61937) b!525642))

(assert (= (and b!525641 (not c!61937)) b!525634))

(assert (= (and b!525642 res!322376) b!525638))

(declare-fun m!506301 () Bool)

(assert (=> b!525641 m!506301))

(declare-fun m!506303 () Bool)

(assert (=> b!525641 m!506303))

(declare-fun m!506305 () Bool)

(assert (=> b!525641 m!506305))

(declare-fun m!506307 () Bool)

(assert (=> b!525636 m!506307))

(declare-fun m!506309 () Bool)

(assert (=> start!47754 m!506309))

(declare-fun m!506311 () Bool)

(assert (=> start!47754 m!506311))

(declare-fun m!506313 () Bool)

(assert (=> b!525644 m!506313))

(declare-fun m!506315 () Bool)

(assert (=> b!525640 m!506315))

(assert (=> b!525639 m!506305))

(assert (=> b!525639 m!506305))

(declare-fun m!506317 () Bool)

(assert (=> b!525639 m!506317))

(declare-fun m!506319 () Bool)

(assert (=> b!525635 m!506319))

(declare-fun m!506321 () Bool)

(assert (=> b!525642 m!506321))

(declare-fun m!506323 () Bool)

(assert (=> b!525642 m!506323))

(assert (=> b!525645 m!506305))

(assert (=> b!525645 m!506305))

(declare-fun m!506325 () Bool)

(assert (=> b!525645 m!506325))

(declare-fun m!506327 () Bool)

(assert (=> b!525646 m!506327))

(declare-fun m!506329 () Bool)

(assert (=> b!525643 m!506329))

(declare-fun m!506331 () Bool)

(assert (=> b!525643 m!506331))

(declare-fun m!506333 () Bool)

(assert (=> b!525643 m!506333))

(assert (=> b!525643 m!506305))

(declare-fun m!506335 () Bool)

(assert (=> b!525643 m!506335))

(declare-fun m!506337 () Bool)

(assert (=> b!525643 m!506337))

(declare-fun m!506339 () Bool)

(assert (=> b!525643 m!506339))

(declare-fun m!506341 () Bool)

(assert (=> b!525643 m!506341))

(assert (=> b!525643 m!506305))

(declare-fun m!506343 () Bool)

(assert (=> b!525643 m!506343))

(assert (=> b!525643 m!506305))

(push 1)

