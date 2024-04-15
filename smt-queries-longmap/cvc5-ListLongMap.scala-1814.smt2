; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32682 () Bool)

(assert start!32682)

(declare-fun b!326466 () Bool)

(declare-fun res!179645 () Bool)

(declare-fun e!200940 () Bool)

(assert (=> b!326466 (=> (not res!179645) (not e!200940))))

(declare-datatypes ((array!16723 0))(
  ( (array!16724 (arr!7916 (Array (_ BitVec 32) (_ BitVec 64))) (size!8269 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16723)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3046 0))(
  ( (MissingZero!3046 (index!14360 (_ BitVec 32))) (Found!3046 (index!14361 (_ BitVec 32))) (Intermediate!3046 (undefined!3858 Bool) (index!14362 (_ BitVec 32)) (x!32615 (_ BitVec 32))) (Undefined!3046) (MissingVacant!3046 (index!14363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16723 (_ BitVec 32)) SeekEntryResult!3046)

(assert (=> b!326466 (= res!179645 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3046 i!1250)))))

(declare-fun b!326467 () Bool)

(declare-fun res!179643 () Bool)

(assert (=> b!326467 (=> (not res!179643) (not e!200940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16723 (_ BitVec 32)) Bool)

(assert (=> b!326467 (= res!179643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326469 () Bool)

(declare-fun res!179650 () Bool)

(declare-fun e!200942 () Bool)

(assert (=> b!326469 (=> (not res!179650) (not e!200942))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326469 (= res!179650 (and (= (select (arr!7916 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8269 a!3305))))))

(declare-fun b!326470 () Bool)

(declare-fun res!179646 () Bool)

(assert (=> b!326470 (=> (not res!179646) (not e!200940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326470 (= res!179646 (validKeyInArray!0 k!2497))))

(declare-fun b!326471 () Bool)

(assert (=> b!326471 (= e!200942 false)))

(declare-datatypes ((Unit!10104 0))(
  ( (Unit!10105) )
))
(declare-fun lt!157151 () Unit!10104)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10104)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326471 (= lt!157151 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326472 () Bool)

(declare-fun res!179647 () Bool)

(assert (=> b!326472 (=> (not res!179647) (not e!200940))))

(assert (=> b!326472 (= res!179647 (and (= (size!8269 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8269 a!3305))))))

(declare-fun b!326473 () Bool)

(declare-fun res!179651 () Bool)

(assert (=> b!326473 (=> (not res!179651) (not e!200942))))

(declare-fun lt!157150 () SeekEntryResult!3046)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16723 (_ BitVec 32)) SeekEntryResult!3046)

(assert (=> b!326473 (= res!179651 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157150))))

(declare-fun res!179649 () Bool)

(assert (=> start!32682 (=> (not res!179649) (not e!200940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32682 (= res!179649 (validMask!0 mask!3777))))

(assert (=> start!32682 e!200940))

(declare-fun array_inv!5888 (array!16723) Bool)

(assert (=> start!32682 (array_inv!5888 a!3305)))

(assert (=> start!32682 true))

(declare-fun b!326468 () Bool)

(assert (=> b!326468 (= e!200940 e!200942)))

(declare-fun res!179644 () Bool)

(assert (=> b!326468 (=> (not res!179644) (not e!200942))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326468 (= res!179644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157150))))

(assert (=> b!326468 (= lt!157150 (Intermediate!3046 false resIndex!58 resX!58))))

(declare-fun b!326474 () Bool)

(declare-fun res!179652 () Bool)

(assert (=> b!326474 (=> (not res!179652) (not e!200942))))

(assert (=> b!326474 (= res!179652 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7916 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326475 () Bool)

(declare-fun res!179648 () Bool)

(assert (=> b!326475 (=> (not res!179648) (not e!200940))))

(declare-fun arrayContainsKey!0 (array!16723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326475 (= res!179648 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32682 res!179649) b!326472))

(assert (= (and b!326472 res!179647) b!326470))

(assert (= (and b!326470 res!179646) b!326475))

(assert (= (and b!326475 res!179648) b!326466))

(assert (= (and b!326466 res!179645) b!326467))

(assert (= (and b!326467 res!179643) b!326468))

(assert (= (and b!326468 res!179644) b!326469))

(assert (= (and b!326469 res!179650) b!326473))

(assert (= (and b!326473 res!179651) b!326474))

(assert (= (and b!326474 res!179652) b!326471))

(declare-fun m!332519 () Bool)

(assert (=> b!326474 m!332519))

(declare-fun m!332521 () Bool)

(assert (=> b!326468 m!332521))

(assert (=> b!326468 m!332521))

(declare-fun m!332523 () Bool)

(assert (=> b!326468 m!332523))

(declare-fun m!332525 () Bool)

(assert (=> b!326471 m!332525))

(assert (=> b!326471 m!332525))

(declare-fun m!332527 () Bool)

(assert (=> b!326471 m!332527))

(declare-fun m!332529 () Bool)

(assert (=> b!326473 m!332529))

(declare-fun m!332531 () Bool)

(assert (=> start!32682 m!332531))

(declare-fun m!332533 () Bool)

(assert (=> start!32682 m!332533))

(declare-fun m!332535 () Bool)

(assert (=> b!326466 m!332535))

(declare-fun m!332537 () Bool)

(assert (=> b!326475 m!332537))

(declare-fun m!332539 () Bool)

(assert (=> b!326467 m!332539))

(declare-fun m!332541 () Bool)

(assert (=> b!326469 m!332541))

(declare-fun m!332543 () Bool)

(assert (=> b!326470 m!332543))

(push 1)

(assert (not b!326467))

(assert (not b!326471))

(assert (not b!326470))

(assert (not b!326466))

(assert (not start!32682))

(assert (not b!326473))

(assert (not b!326475))

(assert (not b!326468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

