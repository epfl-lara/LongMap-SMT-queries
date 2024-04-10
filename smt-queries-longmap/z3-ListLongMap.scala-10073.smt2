; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118574 () Bool)

(assert start!118574)

(declare-fun b!1386183 () Bool)

(declare-fun e!785288 () Bool)

(assert (=> b!1386183 (= e!785288 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94850 0))(
  ( (array!94851 (arr!45801 (Array (_ BitVec 32) (_ BitVec 64))) (size!46351 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94850)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10144 0))(
  ( (MissingZero!10144 (index!42947 (_ BitVec 32))) (Found!10144 (index!42948 (_ BitVec 32))) (Intermediate!10144 (undefined!10956 Bool) (index!42949 (_ BitVec 32)) (x!124569 (_ BitVec 32))) (Undefined!10144) (MissingVacant!10144 (index!42950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94850 (_ BitVec 32)) SeekEntryResult!10144)

(assert (=> b!1386183 (= (seekEntryOrOpen!0 (select (arr!45801 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45801 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94851 (store (arr!45801 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46351 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46276 0))(
  ( (Unit!46277) )
))
(declare-fun lt!609384 () Unit!46276)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46276)

(assert (=> b!1386183 (= lt!609384 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386184 () Bool)

(declare-fun res!927439 () Bool)

(assert (=> b!1386184 (=> (not res!927439) (not e!785288))))

(declare-datatypes ((List!32329 0))(
  ( (Nil!32326) (Cons!32325 (h!33534 (_ BitVec 64)) (t!47023 List!32329)) )
))
(declare-fun arrayNoDuplicates!0 (array!94850 (_ BitVec 32) List!32329) Bool)

(assert (=> b!1386184 (= res!927439 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32326))))

(declare-fun b!1386185 () Bool)

(declare-fun res!927438 () Bool)

(assert (=> b!1386185 (=> (not res!927438) (not e!785288))))

(assert (=> b!1386185 (= res!927438 (and (not (= (select (arr!45801 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45801 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386186 () Bool)

(declare-fun res!927437 () Bool)

(assert (=> b!1386186 (=> (not res!927437) (not e!785288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94850 (_ BitVec 32)) Bool)

(assert (=> b!1386186 (= res!927437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386187 () Bool)

(declare-fun res!927433 () Bool)

(assert (=> b!1386187 (=> (not res!927433) (not e!785288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386187 (= res!927433 (validKeyInArray!0 (select (arr!45801 a!2938) startIndex!16)))))

(declare-fun b!1386188 () Bool)

(declare-fun res!927434 () Bool)

(assert (=> b!1386188 (=> (not res!927434) (not e!785288))))

(assert (=> b!1386188 (= res!927434 (and (= (size!46351 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46351 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46351 a!2938))))))

(declare-fun b!1386189 () Bool)

(declare-fun res!927436 () Bool)

(assert (=> b!1386189 (=> (not res!927436) (not e!785288))))

(assert (=> b!1386189 (= res!927436 (validKeyInArray!0 (select (arr!45801 a!2938) i!1065)))))

(declare-fun res!927435 () Bool)

(assert (=> start!118574 (=> (not res!927435) (not e!785288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118574 (= res!927435 (validMask!0 mask!2987))))

(assert (=> start!118574 e!785288))

(assert (=> start!118574 true))

(declare-fun array_inv!34829 (array!94850) Bool)

(assert (=> start!118574 (array_inv!34829 a!2938)))

(assert (= (and start!118574 res!927435) b!1386188))

(assert (= (and b!1386188 res!927434) b!1386189))

(assert (= (and b!1386189 res!927436) b!1386184))

(assert (= (and b!1386184 res!927439) b!1386186))

(assert (= (and b!1386186 res!927437) b!1386185))

(assert (= (and b!1386185 res!927438) b!1386187))

(assert (= (and b!1386187 res!927433) b!1386183))

(declare-fun m!1271519 () Bool)

(assert (=> b!1386187 m!1271519))

(assert (=> b!1386187 m!1271519))

(declare-fun m!1271521 () Bool)

(assert (=> b!1386187 m!1271521))

(declare-fun m!1271523 () Bool)

(assert (=> b!1386184 m!1271523))

(declare-fun m!1271525 () Bool)

(assert (=> b!1386185 m!1271525))

(declare-fun m!1271527 () Bool)

(assert (=> start!118574 m!1271527))

(declare-fun m!1271529 () Bool)

(assert (=> start!118574 m!1271529))

(declare-fun m!1271531 () Bool)

(assert (=> b!1386186 m!1271531))

(assert (=> b!1386189 m!1271525))

(assert (=> b!1386189 m!1271525))

(declare-fun m!1271533 () Bool)

(assert (=> b!1386189 m!1271533))

(declare-fun m!1271535 () Bool)

(assert (=> b!1386183 m!1271535))

(assert (=> b!1386183 m!1271535))

(declare-fun m!1271537 () Bool)

(assert (=> b!1386183 m!1271537))

(declare-fun m!1271539 () Bool)

(assert (=> b!1386183 m!1271539))

(declare-fun m!1271541 () Bool)

(assert (=> b!1386183 m!1271541))

(assert (=> b!1386183 m!1271519))

(assert (=> b!1386183 m!1271519))

(declare-fun m!1271543 () Bool)

(assert (=> b!1386183 m!1271543))

(check-sat (not b!1386189) (not b!1386184) (not start!118574) (not b!1386186) (not b!1386183) (not b!1386187))
