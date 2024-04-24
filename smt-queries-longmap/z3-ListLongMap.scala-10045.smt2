; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118586 () Bool)

(assert start!118586)

(declare-fun b!1385892 () Bool)

(declare-fun res!926517 () Bool)

(declare-fun e!785417 () Bool)

(assert (=> b!1385892 (=> (not res!926517) (not e!785417))))

(declare-datatypes ((array!94787 0))(
  ( (array!94788 (arr!45769 (Array (_ BitVec 32) (_ BitVec 64))) (size!46320 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94787)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385892 (= res!926517 (and (not (= (select (arr!45769 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45769 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385893 () Bool)

(declare-fun res!926516 () Bool)

(assert (=> b!1385893 (=> (not res!926516) (not e!785417))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94787 (_ BitVec 32)) Bool)

(assert (=> b!1385893 (= res!926516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385894 () Bool)

(declare-fun e!785418 () Bool)

(assert (=> b!1385894 (= e!785418 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609437 () array!94787)

(assert (=> b!1385894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609437 mask!2987)))

(declare-datatypes ((Unit!46124 0))(
  ( (Unit!46125) )
))
(declare-fun lt!609441 () Unit!46124)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46124)

(assert (=> b!1385894 (= lt!609441 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1385895 () Bool)

(declare-fun res!926511 () Bool)

(assert (=> b!1385895 (=> (not res!926511) (not e!785417))))

(assert (=> b!1385895 (= res!926511 (and (= (size!46320 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46320 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46320 a!2938))))))

(declare-fun b!1385896 () Bool)

(declare-fun e!785415 () Unit!46124)

(declare-fun Unit!46126 () Unit!46124)

(assert (=> b!1385896 (= e!785415 Unit!46126)))

(declare-fun b!1385897 () Bool)

(declare-fun e!785416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385897 (= e!785416 (validKeyInArray!0 (select (arr!45769 a!2938) startIndex!16)))))

(declare-fun b!1385898 () Bool)

(declare-fun lt!609438 () Unit!46124)

(assert (=> b!1385898 (= e!785415 lt!609438)))

(declare-fun lt!609440 () Unit!46124)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46124)

(assert (=> b!1385898 (= lt!609440 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10065 0))(
  ( (MissingZero!10065 (index!42631 (_ BitVec 32))) (Found!10065 (index!42632 (_ BitVec 32))) (Intermediate!10065 (undefined!10877 Bool) (index!42633 (_ BitVec 32)) (x!124288 (_ BitVec 32))) (Undefined!10065) (MissingVacant!10065 (index!42634 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94787 (_ BitVec 32)) SeekEntryResult!10065)

(assert (=> b!1385898 (= (seekEntryOrOpen!0 (select (arr!45769 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45769 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609437 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46124)

(assert (=> b!1385898 (= lt!609438 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385898 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!926513 () Bool)

(assert (=> start!118586 (=> (not res!926513) (not e!785417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118586 (= res!926513 (validMask!0 mask!2987))))

(assert (=> start!118586 e!785417))

(assert (=> start!118586 true))

(declare-fun array_inv!35050 (array!94787) Bool)

(assert (=> start!118586 (array_inv!35050 a!2938)))

(declare-fun b!1385899 () Bool)

(declare-fun res!926515 () Bool)

(assert (=> b!1385899 (=> (not res!926515) (not e!785417))))

(declare-datatypes ((List!32284 0))(
  ( (Nil!32281) (Cons!32280 (h!33498 (_ BitVec 64)) (t!46970 List!32284)) )
))
(declare-fun arrayNoDuplicates!0 (array!94787 (_ BitVec 32) List!32284) Bool)

(assert (=> b!1385899 (= res!926515 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32281))))

(declare-fun b!1385900 () Bool)

(assert (=> b!1385900 (= e!785417 e!785418)))

(declare-fun res!926514 () Bool)

(assert (=> b!1385900 (=> (not res!926514) (not e!785418))))

(assert (=> b!1385900 (= res!926514 (and (bvslt startIndex!16 (bvsub (size!46320 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609439 () Unit!46124)

(assert (=> b!1385900 (= lt!609439 e!785415)))

(declare-fun c!129138 () Bool)

(assert (=> b!1385900 (= c!129138 e!785416)))

(declare-fun res!926518 () Bool)

(assert (=> b!1385900 (=> (not res!926518) (not e!785416))))

(assert (=> b!1385900 (= res!926518 (not (= startIndex!16 i!1065)))))

(assert (=> b!1385900 (= lt!609437 (array!94788 (store (arr!45769 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46320 a!2938)))))

(declare-fun b!1385901 () Bool)

(declare-fun res!926512 () Bool)

(assert (=> b!1385901 (=> (not res!926512) (not e!785417))))

(assert (=> b!1385901 (= res!926512 (validKeyInArray!0 (select (arr!45769 a!2938) i!1065)))))

(assert (= (and start!118586 res!926513) b!1385895))

(assert (= (and b!1385895 res!926511) b!1385901))

(assert (= (and b!1385901 res!926512) b!1385899))

(assert (= (and b!1385899 res!926515) b!1385893))

(assert (= (and b!1385893 res!926516) b!1385892))

(assert (= (and b!1385892 res!926517) b!1385900))

(assert (= (and b!1385900 res!926518) b!1385897))

(assert (= (and b!1385900 c!129138) b!1385898))

(assert (= (and b!1385900 (not c!129138)) b!1385896))

(assert (= (and b!1385900 res!926514) b!1385894))

(declare-fun m!1271475 () Bool)

(assert (=> b!1385893 m!1271475))

(declare-fun m!1271477 () Bool)

(assert (=> start!118586 m!1271477))

(declare-fun m!1271479 () Bool)

(assert (=> start!118586 m!1271479))

(declare-fun m!1271481 () Bool)

(assert (=> b!1385898 m!1271481))

(declare-fun m!1271483 () Bool)

(assert (=> b!1385898 m!1271483))

(declare-fun m!1271485 () Bool)

(assert (=> b!1385898 m!1271485))

(declare-fun m!1271487 () Bool)

(assert (=> b!1385898 m!1271487))

(declare-fun m!1271489 () Bool)

(assert (=> b!1385898 m!1271489))

(assert (=> b!1385898 m!1271481))

(declare-fun m!1271491 () Bool)

(assert (=> b!1385898 m!1271491))

(declare-fun m!1271493 () Bool)

(assert (=> b!1385898 m!1271493))

(assert (=> b!1385898 m!1271487))

(declare-fun m!1271495 () Bool)

(assert (=> b!1385898 m!1271495))

(declare-fun m!1271497 () Bool)

(assert (=> b!1385899 m!1271497))

(declare-fun m!1271499 () Bool)

(assert (=> b!1385892 m!1271499))

(assert (=> b!1385900 m!1271483))

(assert (=> b!1385901 m!1271499))

(assert (=> b!1385901 m!1271499))

(declare-fun m!1271501 () Bool)

(assert (=> b!1385901 m!1271501))

(declare-fun m!1271503 () Bool)

(assert (=> b!1385894 m!1271503))

(declare-fun m!1271505 () Bool)

(assert (=> b!1385894 m!1271505))

(assert (=> b!1385897 m!1271487))

(assert (=> b!1385897 m!1271487))

(declare-fun m!1271507 () Bool)

(assert (=> b!1385897 m!1271507))

(check-sat (not b!1385894) (not b!1385901) (not b!1385893) (not start!118586) (not b!1385899) (not b!1385898) (not b!1385897))
(check-sat)
