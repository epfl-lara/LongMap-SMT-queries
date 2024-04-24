; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118836 () Bool)

(assert start!118836)

(declare-fun b!1388158 () Bool)

(declare-datatypes ((Unit!46290 0))(
  ( (Unit!46291) )
))
(declare-fun e!786429 () Unit!46290)

(declare-fun Unit!46292 () Unit!46290)

(assert (=> b!1388158 (= e!786429 Unit!46292)))

(declare-fun b!1388159 () Bool)

(declare-fun res!928483 () Bool)

(declare-fun e!786428 () Bool)

(assert (=> b!1388159 (=> (not res!928483) (not e!786428))))

(declare-datatypes ((array!95010 0))(
  ( (array!95011 (arr!45879 (Array (_ BitVec 32) (_ BitVec 64))) (size!46430 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95010)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1388159 (= res!928483 (and (not (= (select (arr!45879 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45879 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388160 () Bool)

(declare-fun lt!610083 () Unit!46290)

(assert (=> b!1388160 (= e!786429 lt!610083)))

(declare-fun lt!610082 () Unit!46290)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46290)

(assert (=> b!1388160 (= lt!610082 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10126 0))(
  ( (MissingZero!10126 (index!42875 (_ BitVec 32))) (Found!10126 (index!42876 (_ BitVec 32))) (Intermediate!10126 (undefined!10938 Bool) (index!42877 (_ BitVec 32)) (x!124637 (_ BitVec 32))) (Undefined!10126) (MissingVacant!10126 (index!42878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95010 (_ BitVec 32)) SeekEntryResult!10126)

(assert (=> b!1388160 (= (seekEntryOrOpen!0 (select (arr!45879 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45879 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95011 (store (arr!45879 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46430 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46290)

(assert (=> b!1388160 (= lt!610083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95010 (_ BitVec 32)) Bool)

(assert (=> b!1388160 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928481 () Bool)

(assert (=> start!118836 (=> (not res!928481) (not e!786428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118836 (= res!928481 (validMask!0 mask!2987))))

(assert (=> start!118836 e!786428))

(assert (=> start!118836 true))

(declare-fun array_inv!35160 (array!95010) Bool)

(assert (=> start!118836 (array_inv!35160 a!2938)))

(declare-fun b!1388161 () Bool)

(declare-fun e!786427 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388161 (= e!786427 (validKeyInArray!0 (select (arr!45879 a!2938) startIndex!16)))))

(declare-fun b!1388162 () Bool)

(declare-fun res!928480 () Bool)

(assert (=> b!1388162 (=> (not res!928480) (not e!786428))))

(assert (=> b!1388162 (= res!928480 (validKeyInArray!0 (select (arr!45879 a!2938) i!1065)))))

(declare-fun b!1388163 () Bool)

(declare-fun res!928479 () Bool)

(assert (=> b!1388163 (=> (not res!928479) (not e!786428))))

(assert (=> b!1388163 (= res!928479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388164 () Bool)

(declare-fun res!928477 () Bool)

(assert (=> b!1388164 (=> (not res!928477) (not e!786428))))

(declare-datatypes ((List!32394 0))(
  ( (Nil!32391) (Cons!32390 (h!33608 (_ BitVec 64)) (t!47080 List!32394)) )
))
(declare-fun arrayNoDuplicates!0 (array!95010 (_ BitVec 32) List!32394) Bool)

(assert (=> b!1388164 (= res!928477 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32391))))

(declare-fun b!1388165 () Bool)

(declare-fun res!928482 () Bool)

(assert (=> b!1388165 (=> (not res!928482) (not e!786428))))

(assert (=> b!1388165 (= res!928482 (and (= (size!46430 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46430 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46430 a!2938))))))

(declare-fun b!1388166 () Bool)

(assert (=> b!1388166 (= e!786428 false)))

(declare-fun lt!610081 () Unit!46290)

(assert (=> b!1388166 (= lt!610081 e!786429)))

(declare-fun c!129288 () Bool)

(assert (=> b!1388166 (= c!129288 e!786427)))

(declare-fun res!928478 () Bool)

(assert (=> b!1388166 (=> (not res!928478) (not e!786427))))

(assert (=> b!1388166 (= res!928478 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118836 res!928481) b!1388165))

(assert (= (and b!1388165 res!928482) b!1388162))

(assert (= (and b!1388162 res!928480) b!1388164))

(assert (= (and b!1388164 res!928477) b!1388163))

(assert (= (and b!1388163 res!928479) b!1388159))

(assert (= (and b!1388159 res!928483) b!1388166))

(assert (= (and b!1388166 res!928478) b!1388161))

(assert (= (and b!1388166 c!129288) b!1388160))

(assert (= (and b!1388166 (not c!129288)) b!1388158))

(declare-fun m!1273893 () Bool)

(assert (=> b!1388163 m!1273893))

(declare-fun m!1273895 () Bool)

(assert (=> b!1388164 m!1273895))

(declare-fun m!1273897 () Bool)

(assert (=> b!1388160 m!1273897))

(declare-fun m!1273899 () Bool)

(assert (=> b!1388160 m!1273899))

(assert (=> b!1388160 m!1273899))

(declare-fun m!1273901 () Bool)

(assert (=> b!1388160 m!1273901))

(declare-fun m!1273903 () Bool)

(assert (=> b!1388160 m!1273903))

(declare-fun m!1273905 () Bool)

(assert (=> b!1388160 m!1273905))

(declare-fun m!1273907 () Bool)

(assert (=> b!1388160 m!1273907))

(declare-fun m!1273909 () Bool)

(assert (=> b!1388160 m!1273909))

(assert (=> b!1388160 m!1273907))

(declare-fun m!1273911 () Bool)

(assert (=> b!1388160 m!1273911))

(declare-fun m!1273913 () Bool)

(assert (=> b!1388159 m!1273913))

(assert (=> b!1388162 m!1273913))

(assert (=> b!1388162 m!1273913))

(declare-fun m!1273915 () Bool)

(assert (=> b!1388162 m!1273915))

(assert (=> b!1388161 m!1273907))

(assert (=> b!1388161 m!1273907))

(declare-fun m!1273917 () Bool)

(assert (=> b!1388161 m!1273917))

(declare-fun m!1273919 () Bool)

(assert (=> start!118836 m!1273919))

(declare-fun m!1273921 () Bool)

(assert (=> start!118836 m!1273921))

(push 1)

(assert (not b!1388164))

(assert (not b!1388163))

(assert (not b!1388161))

(assert (not start!118836))

(assert (not b!1388160))

(assert (not b!1388162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

