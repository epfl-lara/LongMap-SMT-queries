; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48006 () Bool)

(assert start!48006)

(declare-fun b!528517 () Bool)

(declare-fun res!324505 () Bool)

(declare-fun e!308006 () Bool)

(assert (=> b!528517 (=> (not res!324505) (not e!308006))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!33499 0))(
  ( (array!33500 (arr!16098 (Array (_ BitVec 32) (_ BitVec 64))) (size!16462 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33499)

(assert (=> b!528517 (= res!324505 (and (= (size!16462 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16462 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16462 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528518 () Bool)

(declare-fun e!308009 () Bool)

(declare-datatypes ((SeekEntryResult!4565 0))(
  ( (MissingZero!4565 (index!20484 (_ BitVec 32))) (Found!4565 (index!20485 (_ BitVec 32))) (Intermediate!4565 (undefined!5377 Bool) (index!20486 (_ BitVec 32)) (x!49461 (_ BitVec 32))) (Undefined!4565) (MissingVacant!4565 (index!20487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33499 (_ BitVec 32)) SeekEntryResult!4565)

(assert (=> b!528518 (= e!308009 (= (seekEntryOrOpen!0 (select (arr!16098 a!3235) j!176) a!3235 mask!3524) (Found!4565 j!176)))))

(declare-fun b!528519 () Bool)

(declare-fun e!308007 () Bool)

(assert (=> b!528519 (= e!308006 e!308007)))

(declare-fun res!324498 () Bool)

(assert (=> b!528519 (=> (not res!324498) (not e!308007))))

(declare-fun lt!243410 () SeekEntryResult!4565)

(assert (=> b!528519 (= res!324498 (or (= lt!243410 (MissingZero!4565 i!1204)) (= lt!243410 (MissingVacant!4565 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!528519 (= lt!243410 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun lt!243411 () SeekEntryResult!4565)

(declare-fun lt!243404 () SeekEntryResult!4565)

(declare-fun b!528520 () Bool)

(declare-fun lt!243403 () (_ BitVec 32))

(declare-fun e!308011 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33499 (_ BitVec 32)) SeekEntryResult!4565)

(assert (=> b!528520 (= e!308011 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243403 (index!20486 lt!243404) (select (arr!16098 a!3235) j!176) a!3235 mask!3524) lt!243411)))))

(declare-fun b!528521 () Bool)

(declare-fun e!308012 () Bool)

(assert (=> b!528521 (= e!308012 true)))

(declare-fun lt!243406 () (_ BitVec 64))

(declare-fun lt!243407 () array!33499)

(assert (=> b!528521 (= (seekEntryOrOpen!0 lt!243406 lt!243407 mask!3524) lt!243411)))

(declare-datatypes ((Unit!16712 0))(
  ( (Unit!16713) )
))
(declare-fun lt!243414 () Unit!16712)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16712)

(assert (=> b!528521 (= lt!243414 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243403 #b00000000000000000000000000000000 (index!20486 lt!243404) (x!49461 lt!243404) mask!3524))))

(declare-fun b!528522 () Bool)

(declare-fun res!324503 () Bool)

(assert (=> b!528522 (=> (not res!324503) (not e!308006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528522 (= res!324503 (validKeyInArray!0 k!2280))))

(declare-fun b!528523 () Bool)

(declare-fun e!308013 () Unit!16712)

(declare-fun Unit!16714 () Unit!16712)

(assert (=> b!528523 (= e!308013 Unit!16714)))

(declare-fun lt!243412 () Unit!16712)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16712)

(assert (=> b!528523 (= lt!243412 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243403 #b00000000000000000000000000000000 (index!20486 lt!243404) (x!49461 lt!243404) mask!3524))))

(declare-fun res!324500 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33499 (_ BitVec 32)) SeekEntryResult!4565)

(assert (=> b!528523 (= res!324500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243403 lt!243406 lt!243407 mask!3524) (Intermediate!4565 false (index!20486 lt!243404) (x!49461 lt!243404))))))

(declare-fun e!308005 () Bool)

(assert (=> b!528523 (=> (not res!324500) (not e!308005))))

(assert (=> b!528523 e!308005))

(declare-fun b!528524 () Bool)

(declare-fun res!324496 () Bool)

(assert (=> b!528524 (=> res!324496 e!308012)))

(declare-fun lt!243415 () SeekEntryResult!4565)

(assert (=> b!528524 (= res!324496 (not (= lt!243415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243403 lt!243406 lt!243407 mask!3524))))))

(declare-fun b!528525 () Bool)

(declare-fun e!308008 () Bool)

(assert (=> b!528525 (= e!308008 e!308012)))

(declare-fun res!324502 () Bool)

(assert (=> b!528525 (=> res!324502 e!308012)))

(assert (=> b!528525 (= res!324502 (or (bvsgt (x!49461 lt!243404) #b01111111111111111111111111111110) (bvslt lt!243403 #b00000000000000000000000000000000) (bvsge lt!243403 (size!16462 a!3235)) (bvslt (index!20486 lt!243404) #b00000000000000000000000000000000) (bvsge (index!20486 lt!243404) (size!16462 a!3235)) (not (= lt!243404 (Intermediate!4565 false (index!20486 lt!243404) (x!49461 lt!243404))))))))

(assert (=> b!528525 (= (index!20486 lt!243404) i!1204)))

(declare-fun lt!243409 () Unit!16712)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16712)

(assert (=> b!528525 (= lt!243409 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243403 #b00000000000000000000000000000000 (index!20486 lt!243404) (x!49461 lt!243404) mask!3524))))

(assert (=> b!528525 (and (or (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243405 () Unit!16712)

(assert (=> b!528525 (= lt!243405 e!308013)))

(declare-fun c!62321 () Bool)

(assert (=> b!528525 (= c!62321 (= (select (arr!16098 a!3235) (index!20486 lt!243404)) (select (arr!16098 a!3235) j!176)))))

(assert (=> b!528525 (and (bvslt (x!49461 lt!243404) #b01111111111111111111111111111110) (or (= (select (arr!16098 a!3235) (index!20486 lt!243404)) (select (arr!16098 a!3235) j!176)) (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16098 a!3235) (index!20486 lt!243404)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!324497 () Bool)

(assert (=> start!48006 (=> (not res!324497) (not e!308006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48006 (= res!324497 (validMask!0 mask!3524))))

(assert (=> start!48006 e!308006))

(assert (=> start!48006 true))

(declare-fun array_inv!11894 (array!33499) Bool)

(assert (=> start!48006 (array_inv!11894 a!3235)))

(declare-fun b!528526 () Bool)

(declare-fun res!324501 () Bool)

(assert (=> b!528526 (=> (not res!324501) (not e!308007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33499 (_ BitVec 32)) Bool)

(assert (=> b!528526 (= res!324501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528527 () Bool)

(declare-fun res!324495 () Bool)

(assert (=> b!528527 (=> res!324495 e!308012)))

(assert (=> b!528527 (= res!324495 e!308011)))

(declare-fun res!324504 () Bool)

(assert (=> b!528527 (=> (not res!324504) (not e!308011))))

(assert (=> b!528527 (= res!324504 (bvsgt #b00000000000000000000000000000000 (x!49461 lt!243404)))))

(declare-fun b!528528 () Bool)

(assert (=> b!528528 (= e!308007 (not e!308008))))

(declare-fun res!324499 () Bool)

(assert (=> b!528528 (=> res!324499 e!308008)))

(assert (=> b!528528 (= res!324499 (or (= lt!243404 lt!243415) (undefined!5377 lt!243404) (not (is-Intermediate!4565 lt!243404))))))

(declare-fun lt!243408 () (_ BitVec 32))

(assert (=> b!528528 (= lt!243415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243408 lt!243406 lt!243407 mask!3524))))

(assert (=> b!528528 (= lt!243404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243403 (select (arr!16098 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528528 (= lt!243408 (toIndex!0 lt!243406 mask!3524))))

(assert (=> b!528528 (= lt!243406 (select (store (arr!16098 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528528 (= lt!243403 (toIndex!0 (select (arr!16098 a!3235) j!176) mask!3524))))

(assert (=> b!528528 (= lt!243407 (array!33500 (store (arr!16098 a!3235) i!1204 k!2280) (size!16462 a!3235)))))

(assert (=> b!528528 (= lt!243411 (Found!4565 j!176))))

(assert (=> b!528528 e!308009))

(declare-fun res!324492 () Bool)

(assert (=> b!528528 (=> (not res!324492) (not e!308009))))

(assert (=> b!528528 (= res!324492 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243413 () Unit!16712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16712)

(assert (=> b!528528 (= lt!243413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528529 () Bool)

(declare-fun res!324493 () Bool)

(assert (=> b!528529 (=> (not res!324493) (not e!308007))))

(declare-datatypes ((List!10256 0))(
  ( (Nil!10253) (Cons!10252 (h!11189 (_ BitVec 64)) (t!16484 List!10256)) )
))
(declare-fun arrayNoDuplicates!0 (array!33499 (_ BitVec 32) List!10256) Bool)

(assert (=> b!528529 (= res!324493 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10253))))

(declare-fun b!528530 () Bool)

(declare-fun res!324494 () Bool)

(assert (=> b!528530 (=> (not res!324494) (not e!308006))))

(assert (=> b!528530 (= res!324494 (validKeyInArray!0 (select (arr!16098 a!3235) j!176)))))

(declare-fun b!528531 () Bool)

(assert (=> b!528531 (= e!308005 false)))

(declare-fun b!528532 () Bool)

(declare-fun res!324506 () Bool)

(assert (=> b!528532 (=> (not res!324506) (not e!308006))))

(declare-fun arrayContainsKey!0 (array!33499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528532 (= res!324506 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528533 () Bool)

(declare-fun Unit!16715 () Unit!16712)

(assert (=> b!528533 (= e!308013 Unit!16715)))

(assert (= (and start!48006 res!324497) b!528517))

(assert (= (and b!528517 res!324505) b!528530))

(assert (= (and b!528530 res!324494) b!528522))

(assert (= (and b!528522 res!324503) b!528532))

(assert (= (and b!528532 res!324506) b!528519))

(assert (= (and b!528519 res!324498) b!528526))

(assert (= (and b!528526 res!324501) b!528529))

(assert (= (and b!528529 res!324493) b!528528))

(assert (= (and b!528528 res!324492) b!528518))

(assert (= (and b!528528 (not res!324499)) b!528525))

(assert (= (and b!528525 c!62321) b!528523))

(assert (= (and b!528525 (not c!62321)) b!528533))

(assert (= (and b!528523 res!324500) b!528531))

(assert (= (and b!528525 (not res!324502)) b!528527))

(assert (= (and b!528527 res!324504) b!528520))

(assert (= (and b!528527 (not res!324495)) b!528524))

(assert (= (and b!528524 (not res!324496)) b!528521))

(declare-fun m!509055 () Bool)

(assert (=> b!528523 m!509055))

(declare-fun m!509057 () Bool)

(assert (=> b!528523 m!509057))

(declare-fun m!509059 () Bool)

(assert (=> start!48006 m!509059))

(declare-fun m!509061 () Bool)

(assert (=> start!48006 m!509061))

(declare-fun m!509063 () Bool)

(assert (=> b!528521 m!509063))

(declare-fun m!509065 () Bool)

(assert (=> b!528521 m!509065))

(declare-fun m!509067 () Bool)

(assert (=> b!528520 m!509067))

(assert (=> b!528520 m!509067))

(declare-fun m!509069 () Bool)

(assert (=> b!528520 m!509069))

(declare-fun m!509071 () Bool)

(assert (=> b!528528 m!509071))

(assert (=> b!528528 m!509067))

(declare-fun m!509073 () Bool)

(assert (=> b!528528 m!509073))

(declare-fun m!509075 () Bool)

(assert (=> b!528528 m!509075))

(declare-fun m!509077 () Bool)

(assert (=> b!528528 m!509077))

(declare-fun m!509079 () Bool)

(assert (=> b!528528 m!509079))

(declare-fun m!509081 () Bool)

(assert (=> b!528528 m!509081))

(assert (=> b!528528 m!509067))

(declare-fun m!509083 () Bool)

(assert (=> b!528528 m!509083))

(assert (=> b!528528 m!509067))

(declare-fun m!509085 () Bool)

(assert (=> b!528528 m!509085))

(declare-fun m!509087 () Bool)

(assert (=> b!528519 m!509087))

(declare-fun m!509089 () Bool)

(assert (=> b!528526 m!509089))

(assert (=> b!528518 m!509067))

(assert (=> b!528518 m!509067))

(declare-fun m!509091 () Bool)

(assert (=> b!528518 m!509091))

(declare-fun m!509093 () Bool)

(assert (=> b!528525 m!509093))

(declare-fun m!509095 () Bool)

(assert (=> b!528525 m!509095))

(assert (=> b!528525 m!509067))

(assert (=> b!528524 m!509057))

(declare-fun m!509097 () Bool)

(assert (=> b!528532 m!509097))

(declare-fun m!509099 () Bool)

(assert (=> b!528529 m!509099))

(assert (=> b!528530 m!509067))

(assert (=> b!528530 m!509067))

(declare-fun m!509101 () Bool)

(assert (=> b!528530 m!509101))

(declare-fun m!509103 () Bool)

(assert (=> b!528522 m!509103))

(push 1)

