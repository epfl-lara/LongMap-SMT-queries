; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118344 () Bool)

(assert start!118344)

(declare-fun b!1384168 () Bool)

(declare-fun e!784378 () Bool)

(assert (=> b!1384168 (= e!784378 false)))

(declare-datatypes ((Unit!46140 0))(
  ( (Unit!46141) )
))
(declare-fun lt!608800 () Unit!46140)

(declare-fun e!784376 () Unit!46140)

(assert (=> b!1384168 (= lt!608800 e!784376)))

(declare-fun c!128691 () Bool)

(declare-fun e!784377 () Bool)

(assert (=> b!1384168 (= c!128691 e!784377)))

(declare-fun res!925669 () Bool)

(assert (=> b!1384168 (=> (not res!925669) (not e!784377))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384168 (= res!925669 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384169 () Bool)

(declare-fun lt!608801 () Unit!46140)

(assert (=> b!1384169 (= e!784376 lt!608801)))

(declare-fun lt!608802 () Unit!46140)

(declare-datatypes ((array!94647 0))(
  ( (array!94648 (arr!45701 (Array (_ BitVec 32) (_ BitVec 64))) (size!46251 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94647)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46140)

(assert (=> b!1384169 (= lt!608802 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10094 0))(
  ( (MissingZero!10094 (index!42747 (_ BitVec 32))) (Found!10094 (index!42748 (_ BitVec 32))) (Intermediate!10094 (undefined!10906 Bool) (index!42749 (_ BitVec 32)) (x!124255 (_ BitVec 32))) (Undefined!10094) (MissingVacant!10094 (index!42750 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94647 (_ BitVec 32)) SeekEntryResult!10094)

(assert (=> b!1384169 (= (seekEntryOrOpen!0 (select (arr!45701 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45701 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94648 (store (arr!45701 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46251 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46140)

(assert (=> b!1384169 (= lt!608801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94647 (_ BitVec 32)) Bool)

(assert (=> b!1384169 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384170 () Bool)

(declare-fun res!925667 () Bool)

(assert (=> b!1384170 (=> (not res!925667) (not e!784378))))

(assert (=> b!1384170 (= res!925667 (and (= (size!46251 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46251 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46251 a!2938))))))

(declare-fun b!1384171 () Bool)

(declare-fun Unit!46142 () Unit!46140)

(assert (=> b!1384171 (= e!784376 Unit!46142)))

(declare-fun b!1384172 () Bool)

(declare-fun res!925672 () Bool)

(assert (=> b!1384172 (=> (not res!925672) (not e!784378))))

(assert (=> b!1384172 (= res!925672 (and (not (= (select (arr!45701 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45701 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384173 () Bool)

(declare-fun res!925670 () Bool)

(assert (=> b!1384173 (=> (not res!925670) (not e!784378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384173 (= res!925670 (validKeyInArray!0 (select (arr!45701 a!2938) i!1065)))))

(declare-fun b!1384174 () Bool)

(declare-fun res!925666 () Bool)

(assert (=> b!1384174 (=> (not res!925666) (not e!784378))))

(assert (=> b!1384174 (= res!925666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384175 () Bool)

(declare-fun res!925668 () Bool)

(assert (=> b!1384175 (=> (not res!925668) (not e!784378))))

(declare-datatypes ((List!32229 0))(
  ( (Nil!32226) (Cons!32225 (h!33434 (_ BitVec 64)) (t!46923 List!32229)) )
))
(declare-fun arrayNoDuplicates!0 (array!94647 (_ BitVec 32) List!32229) Bool)

(assert (=> b!1384175 (= res!925668 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32226))))

(declare-fun b!1384176 () Bool)

(assert (=> b!1384176 (= e!784377 (validKeyInArray!0 (select (arr!45701 a!2938) startIndex!16)))))

(declare-fun res!925671 () Bool)

(assert (=> start!118344 (=> (not res!925671) (not e!784378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118344 (= res!925671 (validMask!0 mask!2987))))

(assert (=> start!118344 e!784378))

(assert (=> start!118344 true))

(declare-fun array_inv!34729 (array!94647) Bool)

(assert (=> start!118344 (array_inv!34729 a!2938)))

(assert (= (and start!118344 res!925671) b!1384170))

(assert (= (and b!1384170 res!925667) b!1384173))

(assert (= (and b!1384173 res!925670) b!1384175))

(assert (= (and b!1384175 res!925668) b!1384174))

(assert (= (and b!1384174 res!925666) b!1384172))

(assert (= (and b!1384172 res!925672) b!1384168))

(assert (= (and b!1384168 res!925669) b!1384176))

(assert (= (and b!1384168 c!128691) b!1384169))

(assert (= (and b!1384168 (not c!128691)) b!1384171))

(declare-fun m!1269381 () Bool)

(assert (=> b!1384173 m!1269381))

(assert (=> b!1384173 m!1269381))

(declare-fun m!1269383 () Bool)

(assert (=> b!1384173 m!1269383))

(declare-fun m!1269385 () Bool)

(assert (=> b!1384174 m!1269385))

(declare-fun m!1269387 () Bool)

(assert (=> b!1384169 m!1269387))

(declare-fun m!1269389 () Bool)

(assert (=> b!1384169 m!1269389))

(assert (=> b!1384169 m!1269389))

(declare-fun m!1269391 () Bool)

(assert (=> b!1384169 m!1269391))

(declare-fun m!1269393 () Bool)

(assert (=> b!1384169 m!1269393))

(declare-fun m!1269395 () Bool)

(assert (=> b!1384169 m!1269395))

(declare-fun m!1269397 () Bool)

(assert (=> b!1384169 m!1269397))

(declare-fun m!1269399 () Bool)

(assert (=> b!1384169 m!1269399))

(assert (=> b!1384169 m!1269397))

(declare-fun m!1269401 () Bool)

(assert (=> b!1384169 m!1269401))

(declare-fun m!1269403 () Bool)

(assert (=> b!1384175 m!1269403))

(assert (=> b!1384172 m!1269381))

(declare-fun m!1269405 () Bool)

(assert (=> start!118344 m!1269405))

(declare-fun m!1269407 () Bool)

(assert (=> start!118344 m!1269407))

(assert (=> b!1384176 m!1269397))

(assert (=> b!1384176 m!1269397))

(declare-fun m!1269409 () Bool)

(assert (=> b!1384176 m!1269409))

(push 1)

(assert (not b!1384174))

(assert (not b!1384173))

(assert (not b!1384176))

(assert (not b!1384175))

(assert (not start!118344))

(assert (not b!1384169))

(check-sat)

