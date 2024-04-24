; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118566 () Bool)

(assert start!118566)

(declare-fun b!1385611 () Bool)

(declare-datatypes ((Unit!46094 0))(
  ( (Unit!46095) )
))
(declare-fun e!785286 () Unit!46094)

(declare-fun lt!609325 () Unit!46094)

(assert (=> b!1385611 (= e!785286 lt!609325)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609326 () Unit!46094)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((array!94767 0))(
  ( (array!94768 (arr!45759 (Array (_ BitVec 32) (_ BitVec 64))) (size!46310 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94767)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46094)

(assert (=> b!1385611 (= lt!609326 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10055 0))(
  ( (MissingZero!10055 (index!42591 (_ BitVec 32))) (Found!10055 (index!42592 (_ BitVec 32))) (Intermediate!10055 (undefined!10867 Bool) (index!42593 (_ BitVec 32)) (x!124246 (_ BitVec 32))) (Undefined!10055) (MissingVacant!10055 (index!42594 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94767 (_ BitVec 32)) SeekEntryResult!10055)

(assert (=> b!1385611 (= (seekEntryOrOpen!0 (select (arr!45759 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45759 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94768 (store (arr!45759 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46310 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46094)

(assert (=> b!1385611 (= lt!609325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94767 (_ BitVec 32)) Bool)

(assert (=> b!1385611 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385612 () Bool)

(declare-fun res!926292 () Bool)

(declare-fun e!785284 () Bool)

(assert (=> b!1385612 (=> (not res!926292) (not e!785284))))

(assert (=> b!1385612 (= res!926292 (and (not (= (select (arr!45759 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45759 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385613 () Bool)

(declare-fun res!926295 () Bool)

(assert (=> b!1385613 (=> (not res!926295) (not e!785284))))

(assert (=> b!1385613 (= res!926295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!926290 () Bool)

(assert (=> start!118566 (=> (not res!926290) (not e!785284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118566 (= res!926290 (validMask!0 mask!2987))))

(assert (=> start!118566 e!785284))

(assert (=> start!118566 true))

(declare-fun array_inv!35040 (array!94767) Bool)

(assert (=> start!118566 (array_inv!35040 a!2938)))

(declare-fun b!1385614 () Bool)

(declare-fun Unit!46096 () Unit!46094)

(assert (=> b!1385614 (= e!785286 Unit!46096)))

(declare-fun b!1385615 () Bool)

(declare-fun e!785285 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385615 (= e!785285 (validKeyInArray!0 (select (arr!45759 a!2938) startIndex!16)))))

(declare-fun b!1385616 () Bool)

(declare-fun res!926291 () Bool)

(assert (=> b!1385616 (=> (not res!926291) (not e!785284))))

(declare-datatypes ((List!32274 0))(
  ( (Nil!32271) (Cons!32270 (h!33488 (_ BitVec 64)) (t!46960 List!32274)) )
))
(declare-fun arrayNoDuplicates!0 (array!94767 (_ BitVec 32) List!32274) Bool)

(assert (=> b!1385616 (= res!926291 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32271))))

(declare-fun b!1385617 () Bool)

(declare-fun res!926293 () Bool)

(assert (=> b!1385617 (=> (not res!926293) (not e!785284))))

(assert (=> b!1385617 (= res!926293 (and (= (size!46310 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46310 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46310 a!2938))))))

(declare-fun b!1385618 () Bool)

(declare-fun res!926294 () Bool)

(assert (=> b!1385618 (=> (not res!926294) (not e!785284))))

(assert (=> b!1385618 (= res!926294 (validKeyInArray!0 (select (arr!45759 a!2938) i!1065)))))

(declare-fun b!1385619 () Bool)

(assert (=> b!1385619 (= e!785284 false)))

(declare-fun lt!609327 () Unit!46094)

(assert (=> b!1385619 (= lt!609327 e!785286)))

(declare-fun c!129108 () Bool)

(assert (=> b!1385619 (= c!129108 e!785285)))

(declare-fun res!926296 () Bool)

(assert (=> b!1385619 (=> (not res!926296) (not e!785285))))

(assert (=> b!1385619 (= res!926296 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118566 res!926290) b!1385617))

(assert (= (and b!1385617 res!926293) b!1385618))

(assert (= (and b!1385618 res!926294) b!1385616))

(assert (= (and b!1385616 res!926291) b!1385613))

(assert (= (and b!1385613 res!926295) b!1385612))

(assert (= (and b!1385612 res!926292) b!1385619))

(assert (= (and b!1385619 res!926296) b!1385615))

(assert (= (and b!1385619 c!129108) b!1385611))

(assert (= (and b!1385619 (not c!129108)) b!1385614))

(declare-fun m!1271163 () Bool)

(assert (=> b!1385613 m!1271163))

(declare-fun m!1271165 () Bool)

(assert (=> start!118566 m!1271165))

(declare-fun m!1271167 () Bool)

(assert (=> start!118566 m!1271167))

(declare-fun m!1271169 () Bool)

(assert (=> b!1385616 m!1271169))

(declare-fun m!1271171 () Bool)

(assert (=> b!1385618 m!1271171))

(assert (=> b!1385618 m!1271171))

(declare-fun m!1271173 () Bool)

(assert (=> b!1385618 m!1271173))

(declare-fun m!1271175 () Bool)

(assert (=> b!1385615 m!1271175))

(assert (=> b!1385615 m!1271175))

(declare-fun m!1271177 () Bool)

(assert (=> b!1385615 m!1271177))

(declare-fun m!1271179 () Bool)

(assert (=> b!1385611 m!1271179))

(declare-fun m!1271181 () Bool)

(assert (=> b!1385611 m!1271181))

(assert (=> b!1385611 m!1271181))

(declare-fun m!1271183 () Bool)

(assert (=> b!1385611 m!1271183))

(declare-fun m!1271185 () Bool)

(assert (=> b!1385611 m!1271185))

(declare-fun m!1271187 () Bool)

(assert (=> b!1385611 m!1271187))

(assert (=> b!1385611 m!1271175))

(declare-fun m!1271189 () Bool)

(assert (=> b!1385611 m!1271189))

(assert (=> b!1385611 m!1271175))

(declare-fun m!1271191 () Bool)

(assert (=> b!1385611 m!1271191))

(assert (=> b!1385612 m!1271171))

(push 1)

(assert (not start!118566))

(assert (not b!1385616))

(assert (not b!1385613))

(assert (not b!1385615))

(assert (not b!1385618))

(assert (not b!1385611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

