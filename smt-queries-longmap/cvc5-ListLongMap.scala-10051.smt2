; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118410 () Bool)

(assert start!118410)

(declare-fun b!1385080 () Bool)

(declare-datatypes ((Unit!46086 0))(
  ( (Unit!46087) )
))
(declare-fun e!784801 () Unit!46086)

(declare-fun lt!609004 () Unit!46086)

(assert (=> b!1385080 (= e!784801 lt!609004)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609003 () Unit!46086)

(declare-datatypes ((array!94666 0))(
  ( (array!94667 (arr!45711 (Array (_ BitVec 32) (_ BitVec 64))) (size!46263 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94666)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46086)

(assert (=> b!1385080 (= lt!609003 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10128 0))(
  ( (MissingZero!10128 (index!42883 (_ BitVec 32))) (Found!10128 (index!42884 (_ BitVec 32))) (Intermediate!10128 (undefined!10940 Bool) (index!42885 (_ BitVec 32)) (x!124374 (_ BitVec 32))) (Undefined!10128) (MissingVacant!10128 (index!42886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94666 (_ BitVec 32)) SeekEntryResult!10128)

(assert (=> b!1385080 (= (seekEntryOrOpen!0 (select (arr!45711 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45711 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94667 (store (arr!45711 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46263 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46086)

(assert (=> b!1385080 (= lt!609004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94666 (_ BitVec 32)) Bool)

(assert (=> b!1385080 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!926415 () Bool)

(declare-fun e!784804 () Bool)

(assert (=> start!118410 (=> (not res!926415) (not e!784804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118410 (= res!926415 (validMask!0 mask!2987))))

(assert (=> start!118410 e!784804))

(assert (=> start!118410 true))

(declare-fun array_inv!34944 (array!94666) Bool)

(assert (=> start!118410 (array_inv!34944 a!2938)))

(declare-fun b!1385081 () Bool)

(assert (=> b!1385081 (= e!784804 (and (bvsge startIndex!16 (bvsub (size!46263 a!2938) #b00000000000000000000000000000001)) (bvsgt startIndex!16 (size!46263 a!2938))))))

(declare-fun lt!609005 () Unit!46086)

(assert (=> b!1385081 (= lt!609005 e!784801)))

(declare-fun c!128777 () Bool)

(declare-fun e!784802 () Bool)

(assert (=> b!1385081 (= c!128777 e!784802)))

(declare-fun res!926416 () Bool)

(assert (=> b!1385081 (=> (not res!926416) (not e!784802))))

(assert (=> b!1385081 (= res!926416 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385082 () Bool)

(declare-fun res!926414 () Bool)

(assert (=> b!1385082 (=> (not res!926414) (not e!784804))))

(declare-datatypes ((List!32317 0))(
  ( (Nil!32314) (Cons!32313 (h!33522 (_ BitVec 64)) (t!47003 List!32317)) )
))
(declare-fun arrayNoDuplicates!0 (array!94666 (_ BitVec 32) List!32317) Bool)

(assert (=> b!1385082 (= res!926414 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32314))))

(declare-fun b!1385083 () Bool)

(declare-fun Unit!46088 () Unit!46086)

(assert (=> b!1385083 (= e!784801 Unit!46088)))

(declare-fun b!1385084 () Bool)

(declare-fun res!926413 () Bool)

(assert (=> b!1385084 (=> (not res!926413) (not e!784804))))

(assert (=> b!1385084 (= res!926413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385085 () Bool)

(declare-fun res!926411 () Bool)

(assert (=> b!1385085 (=> (not res!926411) (not e!784804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385085 (= res!926411 (validKeyInArray!0 (select (arr!45711 a!2938) i!1065)))))

(declare-fun b!1385086 () Bool)

(declare-fun res!926412 () Bool)

(assert (=> b!1385086 (=> (not res!926412) (not e!784804))))

(assert (=> b!1385086 (= res!926412 (and (not (= (select (arr!45711 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45711 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385087 () Bool)

(assert (=> b!1385087 (= e!784802 (validKeyInArray!0 (select (arr!45711 a!2938) startIndex!16)))))

(declare-fun b!1385088 () Bool)

(declare-fun res!926417 () Bool)

(assert (=> b!1385088 (=> (not res!926417) (not e!784804))))

(assert (=> b!1385088 (= res!926417 (and (= (size!46263 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46263 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46263 a!2938))))))

(assert (= (and start!118410 res!926415) b!1385088))

(assert (= (and b!1385088 res!926417) b!1385085))

(assert (= (and b!1385085 res!926411) b!1385082))

(assert (= (and b!1385082 res!926414) b!1385084))

(assert (= (and b!1385084 res!926413) b!1385086))

(assert (= (and b!1385086 res!926412) b!1385081))

(assert (= (and b!1385081 res!926416) b!1385087))

(assert (= (and b!1385081 c!128777) b!1385080))

(assert (= (and b!1385081 (not c!128777)) b!1385083))

(declare-fun m!1269975 () Bool)

(assert (=> b!1385082 m!1269975))

(declare-fun m!1269977 () Bool)

(assert (=> b!1385085 m!1269977))

(assert (=> b!1385085 m!1269977))

(declare-fun m!1269979 () Bool)

(assert (=> b!1385085 m!1269979))

(declare-fun m!1269981 () Bool)

(assert (=> b!1385087 m!1269981))

(assert (=> b!1385087 m!1269981))

(declare-fun m!1269983 () Bool)

(assert (=> b!1385087 m!1269983))

(declare-fun m!1269985 () Bool)

(assert (=> b!1385080 m!1269985))

(declare-fun m!1269987 () Bool)

(assert (=> b!1385080 m!1269987))

(assert (=> b!1385080 m!1269987))

(declare-fun m!1269989 () Bool)

(assert (=> b!1385080 m!1269989))

(declare-fun m!1269991 () Bool)

(assert (=> b!1385080 m!1269991))

(declare-fun m!1269993 () Bool)

(assert (=> b!1385080 m!1269993))

(assert (=> b!1385080 m!1269981))

(declare-fun m!1269995 () Bool)

(assert (=> b!1385080 m!1269995))

(assert (=> b!1385080 m!1269981))

(declare-fun m!1269997 () Bool)

(assert (=> b!1385080 m!1269997))

(assert (=> b!1385086 m!1269977))

(declare-fun m!1269999 () Bool)

(assert (=> b!1385084 m!1269999))

(declare-fun m!1270001 () Bool)

(assert (=> start!118410 m!1270001))

(declare-fun m!1270003 () Bool)

(assert (=> start!118410 m!1270003))

(push 1)

(assert (not start!118410))

(assert (not b!1385080))

(assert (not b!1385085))

(assert (not b!1385084))

(assert (not b!1385082))

(assert (not b!1385087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

