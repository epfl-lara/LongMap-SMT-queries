; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47808 () Bool)

(assert start!47808)

(declare-fun b!526768 () Bool)

(declare-fun res!323344 () Bool)

(declare-fun e!307029 () Bool)

(assert (=> b!526768 (=> (not res!323344) (not e!307029))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33445 0))(
  ( (array!33446 (arr!16074 (Array (_ BitVec 32) (_ BitVec 64))) (size!16438 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33445)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526768 (= res!323344 (and (= (size!16438 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16438 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16438 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!307026 () Bool)

(declare-fun b!526769 () Bool)

(declare-datatypes ((SeekEntryResult!4541 0))(
  ( (MissingZero!4541 (index!20376 (_ BitVec 32))) (Found!4541 (index!20377 (_ BitVec 32))) (Intermediate!4541 (undefined!5353 Bool) (index!20378 (_ BitVec 32)) (x!49346 (_ BitVec 32))) (Undefined!4541) (MissingVacant!4541 (index!20379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33445 (_ BitVec 32)) SeekEntryResult!4541)

(assert (=> b!526769 (= e!307026 (= (seekEntryOrOpen!0 (select (arr!16074 a!3235) j!176) a!3235 mask!3524) (Found!4541 j!176)))))

(declare-fun b!526770 () Bool)

(declare-datatypes ((Unit!16616 0))(
  ( (Unit!16617) )
))
(declare-fun e!307027 () Unit!16616)

(declare-fun Unit!16618 () Unit!16616)

(assert (=> b!526770 (= e!307027 Unit!16618)))

(declare-fun b!526771 () Bool)

(declare-fun e!307024 () Bool)

(assert (=> b!526771 (= e!307024 false)))

(declare-fun res!323343 () Bool)

(assert (=> start!47808 (=> (not res!323343) (not e!307029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47808 (= res!323343 (validMask!0 mask!3524))))

(assert (=> start!47808 e!307029))

(assert (=> start!47808 true))

(declare-fun array_inv!11870 (array!33445) Bool)

(assert (=> start!47808 (array_inv!11870 a!3235)))

(declare-fun b!526772 () Bool)

(declare-fun Unit!16619 () Unit!16616)

(assert (=> b!526772 (= e!307027 Unit!16619)))

(declare-fun lt!242344 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!242351 () Unit!16616)

(declare-fun lt!242347 () SeekEntryResult!4541)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16616)

(assert (=> b!526772 (= lt!242351 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242344 #b00000000000000000000000000000000 (index!20378 lt!242347) (x!49346 lt!242347) mask!3524))))

(declare-fun lt!242353 () array!33445)

(declare-fun res!323347 () Bool)

(declare-fun lt!242345 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33445 (_ BitVec 32)) SeekEntryResult!4541)

(assert (=> b!526772 (= res!323347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242344 lt!242345 lt!242353 mask!3524) (Intermediate!4541 false (index!20378 lt!242347) (x!49346 lt!242347))))))

(assert (=> b!526772 (=> (not res!323347) (not e!307024))))

(assert (=> b!526772 e!307024))

(declare-fun b!526773 () Bool)

(declare-fun e!307028 () Bool)

(assert (=> b!526773 (= e!307029 e!307028)))

(declare-fun res!323354 () Bool)

(assert (=> b!526773 (=> (not res!323354) (not e!307028))))

(declare-fun lt!242348 () SeekEntryResult!4541)

(assert (=> b!526773 (= res!323354 (or (= lt!242348 (MissingZero!4541 i!1204)) (= lt!242348 (MissingVacant!4541 i!1204))))))

(assert (=> b!526773 (= lt!242348 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526774 () Bool)

(declare-fun res!323353 () Bool)

(assert (=> b!526774 (=> (not res!323353) (not e!307028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33445 (_ BitVec 32)) Bool)

(assert (=> b!526774 (= res!323353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526775 () Bool)

(declare-fun res!323350 () Bool)

(assert (=> b!526775 (=> (not res!323350) (not e!307028))))

(declare-datatypes ((List!10232 0))(
  ( (Nil!10229) (Cons!10228 (h!11159 (_ BitVec 64)) (t!16460 List!10232)) )
))
(declare-fun arrayNoDuplicates!0 (array!33445 (_ BitVec 32) List!10232) Bool)

(assert (=> b!526775 (= res!323350 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10229))))

(declare-fun b!526776 () Bool)

(declare-fun res!323349 () Bool)

(assert (=> b!526776 (=> (not res!323349) (not e!307029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526776 (= res!323349 (validKeyInArray!0 k!2280))))

(declare-fun b!526777 () Bool)

(declare-fun e!307023 () Bool)

(assert (=> b!526777 (= e!307028 (not e!307023))))

(declare-fun res!323352 () Bool)

(assert (=> b!526777 (=> res!323352 e!307023)))

(declare-fun lt!242352 () (_ BitVec 32))

(assert (=> b!526777 (= res!323352 (= lt!242347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242352 lt!242345 lt!242353 mask!3524)))))

(assert (=> b!526777 (= lt!242347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242344 (select (arr!16074 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526777 (= lt!242352 (toIndex!0 lt!242345 mask!3524))))

(assert (=> b!526777 (= lt!242345 (select (store (arr!16074 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526777 (= lt!242344 (toIndex!0 (select (arr!16074 a!3235) j!176) mask!3524))))

(assert (=> b!526777 (= lt!242353 (array!33446 (store (arr!16074 a!3235) i!1204 k!2280) (size!16438 a!3235)))))

(assert (=> b!526777 e!307026))

(declare-fun res!323346 () Bool)

(assert (=> b!526777 (=> (not res!323346) (not e!307026))))

(assert (=> b!526777 (= res!323346 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242346 () Unit!16616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16616)

(assert (=> b!526777 (= lt!242346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526778 () Bool)

(assert (=> b!526778 (= e!307023 (bvsle (x!49346 lt!242347) #b01111111111111111111111111111110))))

(assert (=> b!526778 (= (index!20378 lt!242347) i!1204)))

(declare-fun lt!242350 () Unit!16616)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16616)

(assert (=> b!526778 (= lt!242350 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242344 #b00000000000000000000000000000000 (index!20378 lt!242347) (x!49346 lt!242347) mask!3524))))

(assert (=> b!526778 (and (or (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242349 () Unit!16616)

(assert (=> b!526778 (= lt!242349 e!307027)))

(declare-fun c!62018 () Bool)

(assert (=> b!526778 (= c!62018 (= (select (arr!16074 a!3235) (index!20378 lt!242347)) (select (arr!16074 a!3235) j!176)))))

(assert (=> b!526778 (and (bvslt (x!49346 lt!242347) #b01111111111111111111111111111110) (or (= (select (arr!16074 a!3235) (index!20378 lt!242347)) (select (arr!16074 a!3235) j!176)) (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16074 a!3235) (index!20378 lt!242347)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526779 () Bool)

(declare-fun res!323351 () Bool)

(assert (=> b!526779 (=> (not res!323351) (not e!307029))))

(declare-fun arrayContainsKey!0 (array!33445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526779 (= res!323351 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526780 () Bool)

(declare-fun res!323345 () Bool)

(assert (=> b!526780 (=> (not res!323345) (not e!307029))))

(assert (=> b!526780 (= res!323345 (validKeyInArray!0 (select (arr!16074 a!3235) j!176)))))

(declare-fun b!526781 () Bool)

(declare-fun res!323348 () Bool)

(assert (=> b!526781 (=> res!323348 e!307023)))

(assert (=> b!526781 (= res!323348 (or (undefined!5353 lt!242347) (not (is-Intermediate!4541 lt!242347))))))

(assert (= (and start!47808 res!323343) b!526768))

(assert (= (and b!526768 res!323344) b!526780))

(assert (= (and b!526780 res!323345) b!526776))

(assert (= (and b!526776 res!323349) b!526779))

(assert (= (and b!526779 res!323351) b!526773))

(assert (= (and b!526773 res!323354) b!526774))

(assert (= (and b!526774 res!323353) b!526775))

(assert (= (and b!526775 res!323350) b!526777))

(assert (= (and b!526777 res!323346) b!526769))

(assert (= (and b!526777 (not res!323352)) b!526781))

(assert (= (and b!526781 (not res!323348)) b!526778))

(assert (= (and b!526778 c!62018) b!526772))

(assert (= (and b!526778 (not c!62018)) b!526770))

(assert (= (and b!526772 res!323347) b!526771))

(declare-fun m!507489 () Bool)

(assert (=> b!526769 m!507489))

(assert (=> b!526769 m!507489))

(declare-fun m!507491 () Bool)

(assert (=> b!526769 m!507491))

(declare-fun m!507493 () Bool)

(assert (=> b!526779 m!507493))

(declare-fun m!507495 () Bool)

(assert (=> b!526773 m!507495))

(declare-fun m!507497 () Bool)

(assert (=> b!526772 m!507497))

(declare-fun m!507499 () Bool)

(assert (=> b!526772 m!507499))

(declare-fun m!507501 () Bool)

(assert (=> b!526775 m!507501))

(assert (=> b!526777 m!507489))

(declare-fun m!507503 () Bool)

(assert (=> b!526777 m!507503))

(declare-fun m!507505 () Bool)

(assert (=> b!526777 m!507505))

(declare-fun m!507507 () Bool)

(assert (=> b!526777 m!507507))

(declare-fun m!507509 () Bool)

(assert (=> b!526777 m!507509))

(assert (=> b!526777 m!507489))

(declare-fun m!507511 () Bool)

(assert (=> b!526777 m!507511))

(assert (=> b!526777 m!507489))

(declare-fun m!507513 () Bool)

(assert (=> b!526777 m!507513))

(declare-fun m!507515 () Bool)

(assert (=> b!526777 m!507515))

(declare-fun m!507517 () Bool)

(assert (=> b!526777 m!507517))

(declare-fun m!507519 () Bool)

(assert (=> b!526778 m!507519))

(declare-fun m!507521 () Bool)

(assert (=> b!526778 m!507521))

(assert (=> b!526778 m!507489))

(declare-fun m!507523 () Bool)

(assert (=> start!47808 m!507523))

(declare-fun m!507525 () Bool)

(assert (=> start!47808 m!507525))

(declare-fun m!507527 () Bool)

(assert (=> b!526774 m!507527))

(declare-fun m!507529 () Bool)

(assert (=> b!526776 m!507529))

(assert (=> b!526780 m!507489))

(assert (=> b!526780 m!507489))

(declare-fun m!507531 () Bool)

(assert (=> b!526780 m!507531))

(push 1)

