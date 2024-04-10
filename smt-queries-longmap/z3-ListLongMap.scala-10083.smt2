; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118634 () Bool)

(assert start!118634)

(declare-fun b!1386985 () Bool)

(declare-fun res!928064 () Bool)

(declare-fun e!785641 () Bool)

(assert (=> b!1386985 (=> (not res!928064) (not e!785641))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94910 0))(
  ( (array!94911 (arr!45831 (Array (_ BitVec 32) (_ BitVec 64))) (size!46381 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94910)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386985 (= res!928064 (and (= (size!46381 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46381 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46381 a!2938))))))

(declare-fun b!1386986 () Bool)

(declare-datatypes ((Unit!46364 0))(
  ( (Unit!46365) )
))
(declare-fun e!785640 () Unit!46364)

(declare-fun Unit!46366 () Unit!46364)

(assert (=> b!1386986 (= e!785640 Unit!46366)))

(declare-fun b!1386987 () Bool)

(declare-fun lt!609646 () Unit!46364)

(assert (=> b!1386987 (= e!785640 lt!609646)))

(declare-fun lt!609648 () Unit!46364)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46364)

(assert (=> b!1386987 (= lt!609648 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10174 0))(
  ( (MissingZero!10174 (index!43067 (_ BitVec 32))) (Found!10174 (index!43068 (_ BitVec 32))) (Intermediate!10174 (undefined!10986 Bool) (index!43069 (_ BitVec 32)) (x!124679 (_ BitVec 32))) (Undefined!10174) (MissingVacant!10174 (index!43070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94910 (_ BitVec 32)) SeekEntryResult!10174)

(assert (=> b!1386987 (= (seekEntryOrOpen!0 (select (arr!45831 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45831 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94911 (store (arr!45831 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46381 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46364)

(assert (=> b!1386987 (= lt!609646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94910 (_ BitVec 32)) Bool)

(assert (=> b!1386987 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928063 () Bool)

(assert (=> start!118634 (=> (not res!928063) (not e!785641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118634 (= res!928063 (validMask!0 mask!2987))))

(assert (=> start!118634 e!785641))

(assert (=> start!118634 true))

(declare-fun array_inv!34859 (array!94910) Bool)

(assert (=> start!118634 (array_inv!34859 a!2938)))

(declare-fun b!1386988 () Bool)

(assert (=> b!1386988 (= e!785641 (and (bvslt startIndex!16 (bvsub (size!46381 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000) (bvsge (bvsub (size!46381 a!2938) (bvadd #b00000000000000000000000000000001 startIndex!16)) (bvsub (size!46381 a!2938) startIndex!16))))))

(declare-fun lt!609647 () Unit!46364)

(assert (=> b!1386988 (= lt!609647 e!785640)))

(declare-fun c!128901 () Bool)

(declare-fun e!785642 () Bool)

(assert (=> b!1386988 (= c!128901 e!785642)))

(declare-fun res!928069 () Bool)

(assert (=> b!1386988 (=> (not res!928069) (not e!785642))))

(assert (=> b!1386988 (= res!928069 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386989 () Bool)

(declare-fun res!928066 () Bool)

(assert (=> b!1386989 (=> (not res!928066) (not e!785641))))

(declare-datatypes ((List!32359 0))(
  ( (Nil!32356) (Cons!32355 (h!33564 (_ BitVec 64)) (t!47053 List!32359)) )
))
(declare-fun arrayNoDuplicates!0 (array!94910 (_ BitVec 32) List!32359) Bool)

(assert (=> b!1386989 (= res!928066 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32356))))

(declare-fun b!1386990 () Bool)

(declare-fun res!928067 () Bool)

(assert (=> b!1386990 (=> (not res!928067) (not e!785641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386990 (= res!928067 (validKeyInArray!0 (select (arr!45831 a!2938) i!1065)))))

(declare-fun b!1386991 () Bool)

(declare-fun res!928068 () Bool)

(assert (=> b!1386991 (=> (not res!928068) (not e!785641))))

(assert (=> b!1386991 (= res!928068 (and (not (= (select (arr!45831 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45831 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386992 () Bool)

(declare-fun res!928065 () Bool)

(assert (=> b!1386992 (=> (not res!928065) (not e!785641))))

(assert (=> b!1386992 (= res!928065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386993 () Bool)

(assert (=> b!1386993 (= e!785642 (validKeyInArray!0 (select (arr!45831 a!2938) startIndex!16)))))

(assert (= (and start!118634 res!928063) b!1386985))

(assert (= (and b!1386985 res!928064) b!1386990))

(assert (= (and b!1386990 res!928067) b!1386989))

(assert (= (and b!1386989 res!928066) b!1386992))

(assert (= (and b!1386992 res!928065) b!1386991))

(assert (= (and b!1386991 res!928068) b!1386988))

(assert (= (and b!1386988 res!928069) b!1386993))

(assert (= (and b!1386988 c!128901) b!1386987))

(assert (= (and b!1386988 (not c!128901)) b!1386986))

(declare-fun m!1272411 () Bool)

(assert (=> b!1386993 m!1272411))

(assert (=> b!1386993 m!1272411))

(declare-fun m!1272413 () Bool)

(assert (=> b!1386993 m!1272413))

(declare-fun m!1272415 () Bool)

(assert (=> start!118634 m!1272415))

(declare-fun m!1272417 () Bool)

(assert (=> start!118634 m!1272417))

(declare-fun m!1272419 () Bool)

(assert (=> b!1386987 m!1272419))

(declare-fun m!1272421 () Bool)

(assert (=> b!1386987 m!1272421))

(assert (=> b!1386987 m!1272421))

(declare-fun m!1272423 () Bool)

(assert (=> b!1386987 m!1272423))

(declare-fun m!1272425 () Bool)

(assert (=> b!1386987 m!1272425))

(declare-fun m!1272427 () Bool)

(assert (=> b!1386987 m!1272427))

(assert (=> b!1386987 m!1272411))

(declare-fun m!1272429 () Bool)

(assert (=> b!1386987 m!1272429))

(assert (=> b!1386987 m!1272411))

(declare-fun m!1272431 () Bool)

(assert (=> b!1386987 m!1272431))

(declare-fun m!1272433 () Bool)

(assert (=> b!1386989 m!1272433))

(declare-fun m!1272435 () Bool)

(assert (=> b!1386992 m!1272435))

(declare-fun m!1272437 () Bool)

(assert (=> b!1386990 m!1272437))

(assert (=> b!1386990 m!1272437))

(declare-fun m!1272439 () Bool)

(assert (=> b!1386990 m!1272439))

(assert (=> b!1386991 m!1272437))

(check-sat (not b!1386992) (not start!118634) (not b!1386989) (not b!1386990) (not b!1386987) (not b!1386993))
(check-sat)
