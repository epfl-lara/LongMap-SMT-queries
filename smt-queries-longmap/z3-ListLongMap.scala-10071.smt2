; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118556 () Bool)

(assert start!118556)

(declare-fun b!1385967 () Bool)

(declare-fun res!927260 () Bool)

(declare-fun e!785215 () Bool)

(assert (=> b!1385967 (=> (not res!927260) (not e!785215))))

(declare-datatypes ((array!94785 0))(
  ( (array!94786 (arr!45769 (Array (_ BitVec 32) (_ BitVec 64))) (size!46321 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94785)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385967 (= res!927260 (validKeyInArray!0 (select (arr!45769 a!2938) i!1065)))))

(declare-fun b!1385968 () Bool)

(declare-fun res!927261 () Bool)

(assert (=> b!1385968 (=> (not res!927261) (not e!785215))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385968 (= res!927261 (and (not (= (select (arr!45769 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45769 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385969 () Bool)

(declare-fun res!927266 () Bool)

(assert (=> b!1385969 (=> (not res!927266) (not e!785215))))

(assert (=> b!1385969 (= res!927266 (validKeyInArray!0 (select (arr!45769 a!2938) startIndex!16)))))

(declare-fun b!1385970 () Bool)

(declare-fun res!927262 () Bool)

(assert (=> b!1385970 (=> (not res!927262) (not e!785215))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94785 (_ BitVec 32)) Bool)

(assert (=> b!1385970 (= res!927262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385971 () Bool)

(declare-fun res!927265 () Bool)

(assert (=> b!1385971 (=> (not res!927265) (not e!785215))))

(declare-datatypes ((List!32375 0))(
  ( (Nil!32372) (Cons!32371 (h!33580 (_ BitVec 64)) (t!47061 List!32375)) )
))
(declare-fun arrayNoDuplicates!0 (array!94785 (_ BitVec 32) List!32375) Bool)

(assert (=> b!1385971 (= res!927265 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32372))))

(declare-fun b!1385972 () Bool)

(declare-fun res!927264 () Bool)

(assert (=> b!1385972 (=> (not res!927264) (not e!785215))))

(assert (=> b!1385972 (= res!927264 (and (= (size!46321 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46321 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46321 a!2938))))))

(declare-fun res!927263 () Bool)

(assert (=> start!118556 (=> (not res!927263) (not e!785215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118556 (= res!927263 (validMask!0 mask!2987))))

(assert (=> start!118556 e!785215))

(assert (=> start!118556 true))

(declare-fun array_inv!35002 (array!94785) Bool)

(assert (=> start!118556 (array_inv!35002 a!2938)))

(declare-fun b!1385973 () Bool)

(assert (=> b!1385973 (= e!785215 (not (bvsle #b00000000000000000000000000000000 (size!46321 a!2938))))))

(declare-datatypes ((SeekEntryResult!10138 0))(
  ( (MissingZero!10138 (index!42923 (_ BitVec 32))) (Found!10138 (index!42924 (_ BitVec 32))) (Intermediate!10138 (undefined!10950 Bool) (index!42925 (_ BitVec 32)) (x!124544 (_ BitVec 32))) (Undefined!10138) (MissingVacant!10138 (index!42926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94785 (_ BitVec 32)) SeekEntryResult!10138)

(assert (=> b!1385973 (= (seekEntryOrOpen!0 (select (arr!45769 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45769 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94786 (store (arr!45769 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46321 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46107 0))(
  ( (Unit!46108) )
))
(declare-fun lt!609179 () Unit!46107)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46107)

(assert (=> b!1385973 (= lt!609179 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118556 res!927263) b!1385972))

(assert (= (and b!1385972 res!927264) b!1385967))

(assert (= (and b!1385967 res!927260) b!1385971))

(assert (= (and b!1385971 res!927265) b!1385970))

(assert (= (and b!1385970 res!927262) b!1385968))

(assert (= (and b!1385968 res!927261) b!1385969))

(assert (= (and b!1385969 res!927266) b!1385973))

(declare-fun m!1270833 () Bool)

(assert (=> b!1385967 m!1270833))

(assert (=> b!1385967 m!1270833))

(declare-fun m!1270835 () Bool)

(assert (=> b!1385967 m!1270835))

(declare-fun m!1270837 () Bool)

(assert (=> b!1385970 m!1270837))

(declare-fun m!1270839 () Bool)

(assert (=> start!118556 m!1270839))

(declare-fun m!1270841 () Bool)

(assert (=> start!118556 m!1270841))

(declare-fun m!1270843 () Bool)

(assert (=> b!1385969 m!1270843))

(assert (=> b!1385969 m!1270843))

(declare-fun m!1270845 () Bool)

(assert (=> b!1385969 m!1270845))

(assert (=> b!1385968 m!1270833))

(declare-fun m!1270847 () Bool)

(assert (=> b!1385973 m!1270847))

(assert (=> b!1385973 m!1270847))

(declare-fun m!1270849 () Bool)

(assert (=> b!1385973 m!1270849))

(declare-fun m!1270851 () Bool)

(assert (=> b!1385973 m!1270851))

(declare-fun m!1270853 () Bool)

(assert (=> b!1385973 m!1270853))

(assert (=> b!1385973 m!1270843))

(assert (=> b!1385973 m!1270843))

(declare-fun m!1270855 () Bool)

(assert (=> b!1385973 m!1270855))

(declare-fun m!1270857 () Bool)

(assert (=> b!1385971 m!1270857))

(check-sat (not b!1385970) (not b!1385969) (not b!1385971) (not b!1385967) (not b!1385973) (not start!118556))
(check-sat)
