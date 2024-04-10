; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69216 () Bool)

(assert start!69216)

(declare-fun b!807404 () Bool)

(declare-fun res!551530 () Bool)

(declare-fun e!447034 () Bool)

(assert (=> b!807404 (=> (not res!551530) (not e!447034))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43916 0))(
  ( (array!43917 (arr!21035 (Array (_ BitVec 32) (_ BitVec 64))) (size!21456 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43916)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!807404 (= res!551530 (and (= (size!21456 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21456 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21456 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807405 () Bool)

(declare-fun e!447035 () Bool)

(assert (=> b!807405 (= e!447035 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361711 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807405 (= lt!361711 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!551536 () Bool)

(assert (=> start!69216 (=> (not res!551536) (not e!447034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69216 (= res!551536 (validMask!0 mask!3266))))

(assert (=> start!69216 e!447034))

(assert (=> start!69216 true))

(declare-fun array_inv!16831 (array!43916) Bool)

(assert (=> start!69216 (array_inv!16831 a!3170)))

(declare-fun b!807406 () Bool)

(declare-fun e!447037 () Bool)

(declare-fun e!447036 () Bool)

(assert (=> b!807406 (= e!447037 e!447036)))

(declare-fun res!551531 () Bool)

(assert (=> b!807406 (=> (not res!551531) (not e!447036))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361713 () array!43916)

(declare-fun lt!361714 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8626 0))(
  ( (MissingZero!8626 (index!36872 (_ BitVec 32))) (Found!8626 (index!36873 (_ BitVec 32))) (Intermediate!8626 (undefined!9438 Bool) (index!36874 (_ BitVec 32)) (x!67678 (_ BitVec 32))) (Undefined!8626) (MissingVacant!8626 (index!36875 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43916 (_ BitVec 32)) SeekEntryResult!8626)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43916 (_ BitVec 32)) SeekEntryResult!8626)

(assert (=> b!807406 (= res!551531 (= (seekEntryOrOpen!0 lt!361714 lt!361713 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361714 lt!361713 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!807406 (= lt!361714 (select (store (arr!21035 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807406 (= lt!361713 (array!43917 (store (arr!21035 a!3170) i!1163 k!2044) (size!21456 a!3170)))))

(declare-fun b!807407 () Bool)

(declare-fun res!551537 () Bool)

(assert (=> b!807407 (=> (not res!551537) (not e!447037))))

(declare-datatypes ((List!14998 0))(
  ( (Nil!14995) (Cons!14994 (h!16123 (_ BitVec 64)) (t!21313 List!14998)) )
))
(declare-fun arrayNoDuplicates!0 (array!43916 (_ BitVec 32) List!14998) Bool)

(assert (=> b!807407 (= res!551537 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14995))))

(declare-fun b!807408 () Bool)

(declare-fun res!551533 () Bool)

(assert (=> b!807408 (=> (not res!551533) (not e!447034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807408 (= res!551533 (validKeyInArray!0 (select (arr!21035 a!3170) j!153)))))

(declare-fun b!807409 () Bool)

(declare-fun res!551534 () Bool)

(assert (=> b!807409 (=> (not res!551534) (not e!447034))))

(declare-fun arrayContainsKey!0 (array!43916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807409 (= res!551534 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807410 () Bool)

(declare-fun res!551527 () Bool)

(assert (=> b!807410 (=> (not res!551527) (not e!447034))))

(assert (=> b!807410 (= res!551527 (validKeyInArray!0 k!2044))))

(declare-fun b!807411 () Bool)

(assert (=> b!807411 (= e!447036 e!447035)))

(declare-fun res!551529 () Bool)

(assert (=> b!807411 (=> (not res!551529) (not e!447035))))

(declare-fun lt!361712 () SeekEntryResult!8626)

(declare-fun lt!361710 () SeekEntryResult!8626)

(assert (=> b!807411 (= res!551529 (and (= lt!361710 lt!361712) (= lt!361712 (Found!8626 j!153)) (not (= (select (arr!21035 a!3170) index!1236) (select (arr!21035 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807411 (= lt!361712 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21035 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807411 (= lt!361710 (seekEntryOrOpen!0 (select (arr!21035 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807412 () Bool)

(declare-fun res!551532 () Bool)

(assert (=> b!807412 (=> (not res!551532) (not e!447037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43916 (_ BitVec 32)) Bool)

(assert (=> b!807412 (= res!551532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807413 () Bool)

(declare-fun res!551535 () Bool)

(assert (=> b!807413 (=> (not res!551535) (not e!447037))))

(assert (=> b!807413 (= res!551535 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21456 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21035 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21456 a!3170)) (= (select (arr!21035 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807414 () Bool)

(assert (=> b!807414 (= e!447034 e!447037)))

(declare-fun res!551528 () Bool)

(assert (=> b!807414 (=> (not res!551528) (not e!447037))))

(declare-fun lt!361715 () SeekEntryResult!8626)

(assert (=> b!807414 (= res!551528 (or (= lt!361715 (MissingZero!8626 i!1163)) (= lt!361715 (MissingVacant!8626 i!1163))))))

(assert (=> b!807414 (= lt!361715 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69216 res!551536) b!807404))

(assert (= (and b!807404 res!551530) b!807408))

(assert (= (and b!807408 res!551533) b!807410))

(assert (= (and b!807410 res!551527) b!807409))

(assert (= (and b!807409 res!551534) b!807414))

(assert (= (and b!807414 res!551528) b!807412))

(assert (= (and b!807412 res!551532) b!807407))

(assert (= (and b!807407 res!551537) b!807413))

(assert (= (and b!807413 res!551535) b!807406))

(assert (= (and b!807406 res!551531) b!807411))

(assert (= (and b!807411 res!551529) b!807405))

(declare-fun m!749433 () Bool)

(assert (=> b!807406 m!749433))

(declare-fun m!749435 () Bool)

(assert (=> b!807406 m!749435))

(declare-fun m!749437 () Bool)

(assert (=> b!807406 m!749437))

(declare-fun m!749439 () Bool)

(assert (=> b!807406 m!749439))

(declare-fun m!749441 () Bool)

(assert (=> b!807414 m!749441))

(declare-fun m!749443 () Bool)

(assert (=> b!807412 m!749443))

(declare-fun m!749445 () Bool)

(assert (=> start!69216 m!749445))

(declare-fun m!749447 () Bool)

(assert (=> start!69216 m!749447))

(declare-fun m!749449 () Bool)

(assert (=> b!807407 m!749449))

(declare-fun m!749451 () Bool)

(assert (=> b!807408 m!749451))

(assert (=> b!807408 m!749451))

(declare-fun m!749453 () Bool)

(assert (=> b!807408 m!749453))

(declare-fun m!749455 () Bool)

(assert (=> b!807410 m!749455))

(declare-fun m!749457 () Bool)

(assert (=> b!807405 m!749457))

(declare-fun m!749459 () Bool)

(assert (=> b!807409 m!749459))

(declare-fun m!749461 () Bool)

(assert (=> b!807413 m!749461))

(declare-fun m!749463 () Bool)

(assert (=> b!807413 m!749463))

(declare-fun m!749465 () Bool)

(assert (=> b!807411 m!749465))

(assert (=> b!807411 m!749451))

(assert (=> b!807411 m!749451))

(declare-fun m!749467 () Bool)

(assert (=> b!807411 m!749467))

(assert (=> b!807411 m!749451))

(declare-fun m!749469 () Bool)

(assert (=> b!807411 m!749469))

(push 1)

