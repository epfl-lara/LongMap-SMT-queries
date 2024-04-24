; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118800 () Bool)

(assert start!118800)

(declare-fun b!1387672 () Bool)

(declare-fun res!928100 () Bool)

(declare-fun e!786213 () Bool)

(assert (=> b!1387672 (=> (not res!928100) (not e!786213))))

(declare-datatypes ((array!94974 0))(
  ( (array!94975 (arr!45861 (Array (_ BitVec 32) (_ BitVec 64))) (size!46412 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94974)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94974 (_ BitVec 32)) Bool)

(assert (=> b!1387672 (= res!928100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387673 () Bool)

(declare-datatypes ((Unit!46236 0))(
  ( (Unit!46237) )
))
(declare-fun e!786211 () Unit!46236)

(declare-fun Unit!46238 () Unit!46236)

(assert (=> b!1387673 (= e!786211 Unit!46238)))

(declare-fun b!1387674 () Bool)

(assert (=> b!1387674 (= e!786213 false)))

(declare-fun lt!609919 () Unit!46236)

(assert (=> b!1387674 (= lt!609919 e!786211)))

(declare-fun c!129234 () Bool)

(declare-fun e!786214 () Bool)

(assert (=> b!1387674 (= c!129234 e!786214)))

(declare-fun res!928099 () Bool)

(assert (=> b!1387674 (=> (not res!928099) (not e!786214))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387674 (= res!928099 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387676 () Bool)

(declare-fun lt!609921 () Unit!46236)

(assert (=> b!1387676 (= e!786211 lt!609921)))

(declare-fun lt!609920 () Unit!46236)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46236)

(assert (=> b!1387676 (= lt!609920 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10108 0))(
  ( (MissingZero!10108 (index!42803 (_ BitVec 32))) (Found!10108 (index!42804 (_ BitVec 32))) (Intermediate!10108 (undefined!10920 Bool) (index!42805 (_ BitVec 32)) (x!124571 (_ BitVec 32))) (Undefined!10108) (MissingVacant!10108 (index!42806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94974 (_ BitVec 32)) SeekEntryResult!10108)

(assert (=> b!1387676 (= (seekEntryOrOpen!0 (select (arr!45861 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45861 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94975 (store (arr!45861 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46412 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46236)

(assert (=> b!1387676 (= lt!609921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387676 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387677 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387677 (= e!786214 (validKeyInArray!0 (select (arr!45861 a!2938) startIndex!16)))))

(declare-fun b!1387678 () Bool)

(declare-fun res!928103 () Bool)

(assert (=> b!1387678 (=> (not res!928103) (not e!786213))))

(declare-datatypes ((List!32376 0))(
  ( (Nil!32373) (Cons!32372 (h!33590 (_ BitVec 64)) (t!47062 List!32376)) )
))
(declare-fun arrayNoDuplicates!0 (array!94974 (_ BitVec 32) List!32376) Bool)

(assert (=> b!1387678 (= res!928103 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32373))))

(declare-fun b!1387679 () Bool)

(declare-fun res!928105 () Bool)

(assert (=> b!1387679 (=> (not res!928105) (not e!786213))))

(assert (=> b!1387679 (= res!928105 (and (not (= (select (arr!45861 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45861 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387680 () Bool)

(declare-fun res!928104 () Bool)

(assert (=> b!1387680 (=> (not res!928104) (not e!786213))))

(assert (=> b!1387680 (= res!928104 (validKeyInArray!0 (select (arr!45861 a!2938) i!1065)))))

(declare-fun b!1387675 () Bool)

(declare-fun res!928102 () Bool)

(assert (=> b!1387675 (=> (not res!928102) (not e!786213))))

(assert (=> b!1387675 (= res!928102 (and (= (size!46412 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46412 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46412 a!2938))))))

(declare-fun res!928101 () Bool)

(assert (=> start!118800 (=> (not res!928101) (not e!786213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118800 (= res!928101 (validMask!0 mask!2987))))

(assert (=> start!118800 e!786213))

(assert (=> start!118800 true))

(declare-fun array_inv!35142 (array!94974) Bool)

(assert (=> start!118800 (array_inv!35142 a!2938)))

(assert (= (and start!118800 res!928101) b!1387675))

(assert (= (and b!1387675 res!928102) b!1387680))

(assert (= (and b!1387680 res!928104) b!1387678))

(assert (= (and b!1387678 res!928103) b!1387672))

(assert (= (and b!1387672 res!928100) b!1387679))

(assert (= (and b!1387679 res!928105) b!1387674))

(assert (= (and b!1387674 res!928099) b!1387677))

(assert (= (and b!1387674 c!129234) b!1387676))

(assert (= (and b!1387674 (not c!129234)) b!1387673))

(declare-fun m!1273353 () Bool)

(assert (=> b!1387679 m!1273353))

(assert (=> b!1387680 m!1273353))

(assert (=> b!1387680 m!1273353))

(declare-fun m!1273355 () Bool)

(assert (=> b!1387680 m!1273355))

(declare-fun m!1273357 () Bool)

(assert (=> b!1387677 m!1273357))

(assert (=> b!1387677 m!1273357))

(declare-fun m!1273359 () Bool)

(assert (=> b!1387677 m!1273359))

(declare-fun m!1273361 () Bool)

(assert (=> b!1387672 m!1273361))

(declare-fun m!1273363 () Bool)

(assert (=> start!118800 m!1273363))

(declare-fun m!1273365 () Bool)

(assert (=> start!118800 m!1273365))

(declare-fun m!1273367 () Bool)

(assert (=> b!1387676 m!1273367))

(declare-fun m!1273369 () Bool)

(assert (=> b!1387676 m!1273369))

(assert (=> b!1387676 m!1273369))

(declare-fun m!1273371 () Bool)

(assert (=> b!1387676 m!1273371))

(declare-fun m!1273373 () Bool)

(assert (=> b!1387676 m!1273373))

(declare-fun m!1273375 () Bool)

(assert (=> b!1387676 m!1273375))

(assert (=> b!1387676 m!1273357))

(declare-fun m!1273377 () Bool)

(assert (=> b!1387676 m!1273377))

(assert (=> b!1387676 m!1273357))

(declare-fun m!1273379 () Bool)

(assert (=> b!1387676 m!1273379))

(declare-fun m!1273381 () Bool)

(assert (=> b!1387678 m!1273381))

(push 1)

(assert (not start!118800))

(assert (not b!1387676))

(assert (not b!1387672))

(assert (not b!1387678))

(assert (not b!1387677))

(assert (not b!1387680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

