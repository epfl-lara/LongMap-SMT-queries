; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118350 () Bool)

(assert start!118350)

(declare-fun b!1384234 () Bool)

(declare-fun e!784405 () Bool)

(assert (=> b!1384234 (= e!784405 false)))

(declare-datatypes ((Unit!45996 0))(
  ( (Unit!45997) )
))
(declare-fun lt!608662 () Unit!45996)

(declare-fun e!784408 () Unit!45996)

(assert (=> b!1384234 (= lt!608662 e!784408)))

(declare-fun c!128687 () Bool)

(declare-fun e!784407 () Bool)

(assert (=> b!1384234 (= c!128687 e!784407)))

(declare-fun res!925747 () Bool)

(assert (=> b!1384234 (=> (not res!925747) (not e!784407))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384234 (= res!925747 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384235 () Bool)

(declare-fun Unit!45998 () Unit!45996)

(assert (=> b!1384235 (= e!784408 Unit!45998)))

(declare-fun b!1384236 () Bool)

(declare-fun res!925746 () Bool)

(assert (=> b!1384236 (=> (not res!925746) (not e!784405))))

(declare-datatypes ((array!94606 0))(
  ( (array!94607 (arr!45681 (Array (_ BitVec 32) (_ BitVec 64))) (size!46233 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94606)

(declare-datatypes ((List!32287 0))(
  ( (Nil!32284) (Cons!32283 (h!33492 (_ BitVec 64)) (t!46973 List!32287)) )
))
(declare-fun arrayNoDuplicates!0 (array!94606 (_ BitVec 32) List!32287) Bool)

(assert (=> b!1384236 (= res!925746 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32284))))

(declare-fun b!1384237 () Bool)

(declare-fun res!925749 () Bool)

(assert (=> b!1384237 (=> (not res!925749) (not e!784405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384237 (= res!925749 (validKeyInArray!0 (select (arr!45681 a!2938) i!1065)))))

(declare-fun b!1384238 () Bool)

(declare-fun lt!608661 () Unit!45996)

(assert (=> b!1384238 (= e!784408 lt!608661)))

(declare-fun lt!608663 () Unit!45996)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45996)

(assert (=> b!1384238 (= lt!608663 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10098 0))(
  ( (MissingZero!10098 (index!42763 (_ BitVec 32))) (Found!10098 (index!42764 (_ BitVec 32))) (Intermediate!10098 (undefined!10910 Bool) (index!42765 (_ BitVec 32)) (x!124264 (_ BitVec 32))) (Undefined!10098) (MissingVacant!10098 (index!42766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94606 (_ BitVec 32)) SeekEntryResult!10098)

(assert (=> b!1384238 (= (seekEntryOrOpen!0 (select (arr!45681 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45681 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94607 (store (arr!45681 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46233 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45996)

(assert (=> b!1384238 (= lt!608661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94606 (_ BitVec 32)) Bool)

(assert (=> b!1384238 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925745 () Bool)

(assert (=> start!118350 (=> (not res!925745) (not e!784405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118350 (= res!925745 (validMask!0 mask!2987))))

(assert (=> start!118350 e!784405))

(assert (=> start!118350 true))

(declare-fun array_inv!34914 (array!94606) Bool)

(assert (=> start!118350 (array_inv!34914 a!2938)))

(declare-fun b!1384239 () Bool)

(declare-fun res!925748 () Bool)

(assert (=> b!1384239 (=> (not res!925748) (not e!784405))))

(assert (=> b!1384239 (= res!925748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384240 () Bool)

(declare-fun res!925750 () Bool)

(assert (=> b!1384240 (=> (not res!925750) (not e!784405))))

(assert (=> b!1384240 (= res!925750 (and (= (size!46233 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46233 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46233 a!2938))))))

(declare-fun b!1384241 () Bool)

(assert (=> b!1384241 (= e!784407 (validKeyInArray!0 (select (arr!45681 a!2938) startIndex!16)))))

(declare-fun b!1384242 () Bool)

(declare-fun res!925751 () Bool)

(assert (=> b!1384242 (=> (not res!925751) (not e!784405))))

(assert (=> b!1384242 (= res!925751 (and (not (= (select (arr!45681 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45681 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118350 res!925745) b!1384240))

(assert (= (and b!1384240 res!925750) b!1384237))

(assert (= (and b!1384237 res!925749) b!1384236))

(assert (= (and b!1384236 res!925746) b!1384239))

(assert (= (and b!1384239 res!925748) b!1384242))

(assert (= (and b!1384242 res!925751) b!1384234))

(assert (= (and b!1384234 res!925747) b!1384241))

(assert (= (and b!1384234 c!128687) b!1384238))

(assert (= (and b!1384234 (not c!128687)) b!1384235))

(declare-fun m!1269027 () Bool)

(assert (=> b!1384238 m!1269027))

(declare-fun m!1269029 () Bool)

(assert (=> b!1384238 m!1269029))

(assert (=> b!1384238 m!1269029))

(declare-fun m!1269031 () Bool)

(assert (=> b!1384238 m!1269031))

(declare-fun m!1269033 () Bool)

(assert (=> b!1384238 m!1269033))

(declare-fun m!1269035 () Bool)

(assert (=> b!1384238 m!1269035))

(declare-fun m!1269037 () Bool)

(assert (=> b!1384238 m!1269037))

(declare-fun m!1269039 () Bool)

(assert (=> b!1384238 m!1269039))

(assert (=> b!1384238 m!1269037))

(declare-fun m!1269041 () Bool)

(assert (=> b!1384238 m!1269041))

(declare-fun m!1269043 () Bool)

(assert (=> b!1384237 m!1269043))

(assert (=> b!1384237 m!1269043))

(declare-fun m!1269045 () Bool)

(assert (=> b!1384237 m!1269045))

(declare-fun m!1269047 () Bool)

(assert (=> start!118350 m!1269047))

(declare-fun m!1269049 () Bool)

(assert (=> start!118350 m!1269049))

(assert (=> b!1384241 m!1269037))

(assert (=> b!1384241 m!1269037))

(declare-fun m!1269051 () Bool)

(assert (=> b!1384241 m!1269051))

(assert (=> b!1384242 m!1269043))

(declare-fun m!1269053 () Bool)

(assert (=> b!1384236 m!1269053))

(declare-fun m!1269055 () Bool)

(assert (=> b!1384239 m!1269055))

(push 1)

(assert (not b!1384237))

(assert (not b!1384238))

(assert (not start!118350))

(assert (not b!1384241))

(assert (not b!1384236))

(assert (not b!1384239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

