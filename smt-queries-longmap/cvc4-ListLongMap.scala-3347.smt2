; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46078 () Bool)

(assert start!46078)

(declare-fun b!510351 () Bool)

(declare-fun e!298329 () Bool)

(declare-fun e!298328 () Bool)

(assert (=> b!510351 (= e!298329 e!298328)))

(declare-fun res!311200 () Bool)

(assert (=> b!510351 (=> (not res!311200) (not e!298328))))

(declare-datatypes ((SeekEntryResult!4240 0))(
  ( (MissingZero!4240 (index!19148 (_ BitVec 32))) (Found!4240 (index!19149 (_ BitVec 32))) (Intermediate!4240 (undefined!5052 Bool) (index!19150 (_ BitVec 32)) (x!48105 (_ BitVec 32))) (Undefined!4240) (MissingVacant!4240 (index!19151 (_ BitVec 32))) )
))
(declare-fun lt!233324 () SeekEntryResult!4240)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510351 (= res!311200 (or (= lt!233324 (MissingZero!4240 i!1204)) (= lt!233324 (MissingVacant!4240 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!32789 0))(
  ( (array!32790 (arr!15773 (Array (_ BitVec 32) (_ BitVec 64))) (size!16137 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32789)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32789 (_ BitVec 32)) SeekEntryResult!4240)

(assert (=> b!510351 (= lt!233324 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510352 () Bool)

(declare-fun e!298327 () Bool)

(assert (=> b!510352 (= e!298327 true)))

(declare-fun lt!233325 () array!32789)

(declare-fun lt!233326 () (_ BitVec 64))

(declare-fun lt!233328 () SeekEntryResult!4240)

(assert (=> b!510352 (= lt!233328 (seekEntryOrOpen!0 lt!233326 lt!233325 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15738 0))(
  ( (Unit!15739) )
))
(declare-fun lt!233327 () Unit!15738)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15738)

(assert (=> b!510352 (= lt!233327 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510353 () Bool)

(assert (=> b!510353 (= e!298328 (not e!298327))))

(declare-fun res!311198 () Bool)

(assert (=> b!510353 (=> res!311198 e!298327)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32789 (_ BitVec 32)) SeekEntryResult!4240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510353 (= res!311198 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15773 a!3235) j!176) mask!3524) (select (arr!15773 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233326 mask!3524) lt!233326 lt!233325 mask!3524))))))

(assert (=> b!510353 (= lt!233326 (select (store (arr!15773 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510353 (= lt!233325 (array!32790 (store (arr!15773 a!3235) i!1204 k!2280) (size!16137 a!3235)))))

(assert (=> b!510353 (= lt!233328 (Found!4240 j!176))))

(assert (=> b!510353 (= lt!233328 (seekEntryOrOpen!0 (select (arr!15773 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32789 (_ BitVec 32)) Bool)

(assert (=> b!510353 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233329 () Unit!15738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15738)

(assert (=> b!510353 (= lt!233329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510354 () Bool)

(declare-fun res!311202 () Bool)

(assert (=> b!510354 (=> (not res!311202) (not e!298329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510354 (= res!311202 (validKeyInArray!0 (select (arr!15773 a!3235) j!176)))))

(declare-fun b!510355 () Bool)

(declare-fun res!311204 () Bool)

(assert (=> b!510355 (=> (not res!311204) (not e!298329))))

(assert (=> b!510355 (= res!311204 (validKeyInArray!0 k!2280))))

(declare-fun res!311197 () Bool)

(assert (=> start!46078 (=> (not res!311197) (not e!298329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46078 (= res!311197 (validMask!0 mask!3524))))

(assert (=> start!46078 e!298329))

(assert (=> start!46078 true))

(declare-fun array_inv!11569 (array!32789) Bool)

(assert (=> start!46078 (array_inv!11569 a!3235)))

(declare-fun b!510356 () Bool)

(declare-fun res!311201 () Bool)

(assert (=> b!510356 (=> (not res!311201) (not e!298328))))

(declare-datatypes ((List!9931 0))(
  ( (Nil!9928) (Cons!9927 (h!10804 (_ BitVec 64)) (t!16159 List!9931)) )
))
(declare-fun arrayNoDuplicates!0 (array!32789 (_ BitVec 32) List!9931) Bool)

(assert (=> b!510356 (= res!311201 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9928))))

(declare-fun b!510357 () Bool)

(declare-fun res!311199 () Bool)

(assert (=> b!510357 (=> (not res!311199) (not e!298329))))

(assert (=> b!510357 (= res!311199 (and (= (size!16137 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16137 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16137 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510358 () Bool)

(declare-fun res!311203 () Bool)

(assert (=> b!510358 (=> (not res!311203) (not e!298328))))

(assert (=> b!510358 (= res!311203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510359 () Bool)

(declare-fun res!311196 () Bool)

(assert (=> b!510359 (=> (not res!311196) (not e!298329))))

(declare-fun arrayContainsKey!0 (array!32789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510359 (= res!311196 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46078 res!311197) b!510357))

(assert (= (and b!510357 res!311199) b!510354))

(assert (= (and b!510354 res!311202) b!510355))

(assert (= (and b!510355 res!311204) b!510359))

(assert (= (and b!510359 res!311196) b!510351))

(assert (= (and b!510351 res!311200) b!510358))

(assert (= (and b!510358 res!311203) b!510356))

(assert (= (and b!510356 res!311201) b!510353))

(assert (= (and b!510353 (not res!311198)) b!510352))

(declare-fun m!491573 () Bool)

(assert (=> b!510355 m!491573))

(declare-fun m!491575 () Bool)

(assert (=> b!510356 m!491575))

(declare-fun m!491577 () Bool)

(assert (=> b!510351 m!491577))

(declare-fun m!491579 () Bool)

(assert (=> start!46078 m!491579))

(declare-fun m!491581 () Bool)

(assert (=> start!46078 m!491581))

(declare-fun m!491583 () Bool)

(assert (=> b!510354 m!491583))

(assert (=> b!510354 m!491583))

(declare-fun m!491585 () Bool)

(assert (=> b!510354 m!491585))

(declare-fun m!491587 () Bool)

(assert (=> b!510352 m!491587))

(declare-fun m!491589 () Bool)

(assert (=> b!510352 m!491589))

(declare-fun m!491591 () Bool)

(assert (=> b!510353 m!491591))

(declare-fun m!491593 () Bool)

(assert (=> b!510353 m!491593))

(declare-fun m!491595 () Bool)

(assert (=> b!510353 m!491595))

(declare-fun m!491597 () Bool)

(assert (=> b!510353 m!491597))

(assert (=> b!510353 m!491583))

(declare-fun m!491599 () Bool)

(assert (=> b!510353 m!491599))

(assert (=> b!510353 m!491583))

(assert (=> b!510353 m!491597))

(assert (=> b!510353 m!491583))

(declare-fun m!491601 () Bool)

(assert (=> b!510353 m!491601))

(declare-fun m!491603 () Bool)

(assert (=> b!510353 m!491603))

(assert (=> b!510353 m!491583))

(declare-fun m!491605 () Bool)

(assert (=> b!510353 m!491605))

(assert (=> b!510353 m!491601))

(declare-fun m!491607 () Bool)

(assert (=> b!510353 m!491607))

(declare-fun m!491609 () Bool)

(assert (=> b!510358 m!491609))

(declare-fun m!491611 () Bool)

(assert (=> b!510359 m!491611))

(push 1)

