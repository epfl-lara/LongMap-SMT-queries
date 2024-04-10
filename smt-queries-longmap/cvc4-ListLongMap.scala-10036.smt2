; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118324 () Bool)

(assert start!118324)

(declare-fun b!1383898 () Bool)

(declare-datatypes ((Unit!46110 0))(
  ( (Unit!46111) )
))
(declare-fun e!784258 () Unit!46110)

(declare-fun Unit!46112 () Unit!46110)

(assert (=> b!1383898 (= e!784258 Unit!46112)))

(declare-fun b!1383899 () Bool)

(declare-fun e!784257 () Bool)

(assert (=> b!1383899 (= e!784257 false)))

(declare-fun lt!608710 () Unit!46110)

(assert (=> b!1383899 (= lt!608710 e!784258)))

(declare-fun c!128661 () Bool)

(declare-fun e!784256 () Bool)

(assert (=> b!1383899 (= c!128661 e!784256)))

(declare-fun res!925457 () Bool)

(assert (=> b!1383899 (=> (not res!925457) (not e!784256))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383899 (= res!925457 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383900 () Bool)

(declare-fun res!925462 () Bool)

(assert (=> b!1383900 (=> (not res!925462) (not e!784257))))

(declare-datatypes ((array!94627 0))(
  ( (array!94628 (arr!45691 (Array (_ BitVec 32) (_ BitVec 64))) (size!46241 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94627)

(assert (=> b!1383900 (= res!925462 (and (not (= (select (arr!45691 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45691 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383901 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383901 (= e!784256 (validKeyInArray!0 (select (arr!45691 a!2938) startIndex!16)))))

(declare-fun b!1383902 () Bool)

(declare-fun res!925459 () Bool)

(assert (=> b!1383902 (=> (not res!925459) (not e!784257))))

(declare-datatypes ((List!32219 0))(
  ( (Nil!32216) (Cons!32215 (h!33424 (_ BitVec 64)) (t!46913 List!32219)) )
))
(declare-fun arrayNoDuplicates!0 (array!94627 (_ BitVec 32) List!32219) Bool)

(assert (=> b!1383902 (= res!925459 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32216))))

(declare-fun b!1383903 () Bool)

(declare-fun res!925461 () Bool)

(assert (=> b!1383903 (=> (not res!925461) (not e!784257))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383903 (= res!925461 (and (= (size!46241 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46241 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46241 a!2938))))))

(declare-fun b!1383904 () Bool)

(declare-fun lt!608712 () Unit!46110)

(assert (=> b!1383904 (= e!784258 lt!608712)))

(declare-fun lt!608711 () Unit!46110)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46110)

(assert (=> b!1383904 (= lt!608711 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10084 0))(
  ( (MissingZero!10084 (index!42707 (_ BitVec 32))) (Found!10084 (index!42708 (_ BitVec 32))) (Intermediate!10084 (undefined!10896 Bool) (index!42709 (_ BitVec 32)) (x!124213 (_ BitVec 32))) (Undefined!10084) (MissingVacant!10084 (index!42710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94627 (_ BitVec 32)) SeekEntryResult!10084)

(assert (=> b!1383904 (= (seekEntryOrOpen!0 (select (arr!45691 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45691 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94628 (store (arr!45691 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46241 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46110)

(assert (=> b!1383904 (= lt!608712 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94627 (_ BitVec 32)) Bool)

(assert (=> b!1383904 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383905 () Bool)

(declare-fun res!925458 () Bool)

(assert (=> b!1383905 (=> (not res!925458) (not e!784257))))

(assert (=> b!1383905 (= res!925458 (validKeyInArray!0 (select (arr!45691 a!2938) i!1065)))))

(declare-fun res!925460 () Bool)

(assert (=> start!118324 (=> (not res!925460) (not e!784257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118324 (= res!925460 (validMask!0 mask!2987))))

(assert (=> start!118324 e!784257))

(assert (=> start!118324 true))

(declare-fun array_inv!34719 (array!94627) Bool)

(assert (=> start!118324 (array_inv!34719 a!2938)))

(declare-fun b!1383906 () Bool)

(declare-fun res!925456 () Bool)

(assert (=> b!1383906 (=> (not res!925456) (not e!784257))))

(assert (=> b!1383906 (= res!925456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118324 res!925460) b!1383903))

(assert (= (and b!1383903 res!925461) b!1383905))

(assert (= (and b!1383905 res!925458) b!1383902))

(assert (= (and b!1383902 res!925459) b!1383906))

(assert (= (and b!1383906 res!925456) b!1383900))

(assert (= (and b!1383900 res!925462) b!1383899))

(assert (= (and b!1383899 res!925457) b!1383901))

(assert (= (and b!1383899 c!128661) b!1383904))

(assert (= (and b!1383899 (not c!128661)) b!1383898))

(declare-fun m!1269081 () Bool)

(assert (=> start!118324 m!1269081))

(declare-fun m!1269083 () Bool)

(assert (=> start!118324 m!1269083))

(declare-fun m!1269085 () Bool)

(assert (=> b!1383900 m!1269085))

(declare-fun m!1269087 () Bool)

(assert (=> b!1383904 m!1269087))

(declare-fun m!1269089 () Bool)

(assert (=> b!1383904 m!1269089))

(assert (=> b!1383904 m!1269089))

(declare-fun m!1269091 () Bool)

(assert (=> b!1383904 m!1269091))

(declare-fun m!1269093 () Bool)

(assert (=> b!1383904 m!1269093))

(declare-fun m!1269095 () Bool)

(assert (=> b!1383904 m!1269095))

(declare-fun m!1269097 () Bool)

(assert (=> b!1383904 m!1269097))

(declare-fun m!1269099 () Bool)

(assert (=> b!1383904 m!1269099))

(assert (=> b!1383904 m!1269097))

(declare-fun m!1269101 () Bool)

(assert (=> b!1383904 m!1269101))

(assert (=> b!1383905 m!1269085))

(assert (=> b!1383905 m!1269085))

(declare-fun m!1269103 () Bool)

(assert (=> b!1383905 m!1269103))

(assert (=> b!1383901 m!1269097))

(assert (=> b!1383901 m!1269097))

(declare-fun m!1269105 () Bool)

(assert (=> b!1383901 m!1269105))

(declare-fun m!1269107 () Bool)

(assert (=> b!1383906 m!1269107))

(declare-fun m!1269109 () Bool)

(assert (=> b!1383902 m!1269109))

(push 1)

(assert (not start!118324))

(assert (not b!1383901))

(assert (not b!1383905))

(assert (not b!1383904))

(assert (not b!1383902))

(assert (not b!1383906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

