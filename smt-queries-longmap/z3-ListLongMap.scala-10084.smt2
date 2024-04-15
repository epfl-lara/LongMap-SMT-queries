; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118634 () Bool)

(assert start!118634)

(declare-fun b!1386972 () Bool)

(declare-fun e!785636 () Bool)

(assert (=> b!1386972 (= e!785636 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94863 0))(
  ( (array!94864 (arr!45808 (Array (_ BitVec 32) (_ BitVec 64))) (size!46360 (_ BitVec 32))) )
))
(declare-fun lt!609486 () array!94863)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94863 (_ BitVec 32)) Bool)

(assert (=> b!1386972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609486 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun a!2938 () array!94863)

(declare-datatypes ((Unit!46215 0))(
  ( (Unit!46216) )
))
(declare-fun lt!609484 () Unit!46215)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46215)

(assert (=> b!1386972 (= lt!609484 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1386973 () Bool)

(declare-fun e!785634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386973 (= e!785634 (validKeyInArray!0 (select (arr!45808 a!2938) startIndex!16)))))

(declare-fun b!1386974 () Bool)

(declare-fun res!928083 () Bool)

(declare-fun e!785635 () Bool)

(assert (=> b!1386974 (=> (not res!928083) (not e!785635))))

(assert (=> b!1386974 (= res!928083 (validKeyInArray!0 (select (arr!45808 a!2938) i!1065)))))

(declare-fun b!1386975 () Bool)

(declare-fun e!785638 () Unit!46215)

(declare-fun Unit!46217 () Unit!46215)

(assert (=> b!1386975 (= e!785638 Unit!46217)))

(declare-fun b!1386976 () Bool)

(assert (=> b!1386976 (= e!785635 e!785636)))

(declare-fun res!928084 () Bool)

(assert (=> b!1386976 (=> (not res!928084) (not e!785636))))

(assert (=> b!1386976 (= res!928084 (and (bvslt startIndex!16 (bvsub (size!46360 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609485 () Unit!46215)

(assert (=> b!1386976 (= lt!609485 e!785638)))

(declare-fun c!128888 () Bool)

(assert (=> b!1386976 (= c!128888 e!785634)))

(declare-fun res!928082 () Bool)

(assert (=> b!1386976 (=> (not res!928082) (not e!785634))))

(assert (=> b!1386976 (= res!928082 (not (= startIndex!16 i!1065)))))

(assert (=> b!1386976 (= lt!609486 (array!94864 (store (arr!45808 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46360 a!2938)))))

(declare-fun res!928088 () Bool)

(assert (=> start!118634 (=> (not res!928088) (not e!785635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118634 (= res!928088 (validMask!0 mask!2987))))

(assert (=> start!118634 e!785635))

(assert (=> start!118634 true))

(declare-fun array_inv!35041 (array!94863) Bool)

(assert (=> start!118634 (array_inv!35041 a!2938)))

(declare-fun b!1386977 () Bool)

(declare-fun lt!609487 () Unit!46215)

(assert (=> b!1386977 (= e!785638 lt!609487)))

(declare-fun lt!609488 () Unit!46215)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46215)

(assert (=> b!1386977 (= lt!609488 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10177 0))(
  ( (MissingZero!10177 (index!43079 (_ BitVec 32))) (Found!10177 (index!43080 (_ BitVec 32))) (Intermediate!10177 (undefined!10989 Bool) (index!43081 (_ BitVec 32)) (x!124687 (_ BitVec 32))) (Undefined!10177) (MissingVacant!10177 (index!43082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94863 (_ BitVec 32)) SeekEntryResult!10177)

(assert (=> b!1386977 (= (seekEntryOrOpen!0 (select (arr!45808 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45808 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609486 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46215)

(assert (=> b!1386977 (= lt!609487 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386977 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386978 () Bool)

(declare-fun res!928081 () Bool)

(assert (=> b!1386978 (=> (not res!928081) (not e!785635))))

(assert (=> b!1386978 (= res!928081 (and (not (= (select (arr!45808 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45808 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386979 () Bool)

(declare-fun res!928085 () Bool)

(assert (=> b!1386979 (=> (not res!928085) (not e!785635))))

(assert (=> b!1386979 (= res!928085 (and (= (size!46360 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46360 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46360 a!2938))))))

(declare-fun b!1386980 () Bool)

(declare-fun res!928086 () Bool)

(assert (=> b!1386980 (=> (not res!928086) (not e!785635))))

(declare-datatypes ((List!32414 0))(
  ( (Nil!32411) (Cons!32410 (h!33619 (_ BitVec 64)) (t!47100 List!32414)) )
))
(declare-fun arrayNoDuplicates!0 (array!94863 (_ BitVec 32) List!32414) Bool)

(assert (=> b!1386980 (= res!928086 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32411))))

(declare-fun b!1386981 () Bool)

(declare-fun res!928087 () Bool)

(assert (=> b!1386981 (=> (not res!928087) (not e!785635))))

(assert (=> b!1386981 (= res!928087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118634 res!928088) b!1386979))

(assert (= (and b!1386979 res!928085) b!1386974))

(assert (= (and b!1386974 res!928083) b!1386980))

(assert (= (and b!1386980 res!928086) b!1386981))

(assert (= (and b!1386981 res!928087) b!1386978))

(assert (= (and b!1386978 res!928081) b!1386976))

(assert (= (and b!1386976 res!928082) b!1386973))

(assert (= (and b!1386976 c!128888) b!1386977))

(assert (= (and b!1386976 (not c!128888)) b!1386975))

(assert (= (and b!1386976 res!928084) b!1386972))

(declare-fun m!1271967 () Bool)

(assert (=> b!1386974 m!1271967))

(assert (=> b!1386974 m!1271967))

(declare-fun m!1271969 () Bool)

(assert (=> b!1386974 m!1271969))

(declare-fun m!1271971 () Bool)

(assert (=> start!118634 m!1271971))

(declare-fun m!1271973 () Bool)

(assert (=> start!118634 m!1271973))

(declare-fun m!1271975 () Bool)

(assert (=> b!1386973 m!1271975))

(assert (=> b!1386973 m!1271975))

(declare-fun m!1271977 () Bool)

(assert (=> b!1386973 m!1271977))

(declare-fun m!1271979 () Bool)

(assert (=> b!1386977 m!1271979))

(declare-fun m!1271981 () Bool)

(assert (=> b!1386977 m!1271981))

(declare-fun m!1271983 () Bool)

(assert (=> b!1386977 m!1271983))

(declare-fun m!1271985 () Bool)

(assert (=> b!1386977 m!1271985))

(assert (=> b!1386977 m!1271981))

(declare-fun m!1271987 () Bool)

(assert (=> b!1386977 m!1271987))

(assert (=> b!1386977 m!1271975))

(declare-fun m!1271989 () Bool)

(assert (=> b!1386977 m!1271989))

(assert (=> b!1386977 m!1271975))

(declare-fun m!1271991 () Bool)

(assert (=> b!1386977 m!1271991))

(assert (=> b!1386978 m!1271967))

(declare-fun m!1271993 () Bool)

(assert (=> b!1386972 m!1271993))

(declare-fun m!1271995 () Bool)

(assert (=> b!1386972 m!1271995))

(assert (=> b!1386976 m!1271983))

(declare-fun m!1271997 () Bool)

(assert (=> b!1386981 m!1271997))

(declare-fun m!1271999 () Bool)

(assert (=> b!1386980 m!1271999))

(check-sat (not b!1386977) (not start!118634) (not b!1386973) (not b!1386981) (not b!1386972) (not b!1386974) (not b!1386980))
(check-sat)
