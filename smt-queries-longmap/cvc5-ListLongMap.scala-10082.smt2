; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118842 () Bool)

(assert start!118842)

(declare-fun res!928546 () Bool)

(declare-fun e!786463 () Bool)

(assert (=> start!118842 (=> (not res!928546) (not e!786463))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118842 (= res!928546 (validMask!0 mask!2987))))

(assert (=> start!118842 e!786463))

(assert (=> start!118842 true))

(declare-datatypes ((array!95016 0))(
  ( (array!95017 (arr!45882 (Array (_ BitVec 32) (_ BitVec 64))) (size!46433 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95016)

(declare-fun array_inv!35163 (array!95016) Bool)

(assert (=> start!118842 (array_inv!35163 a!2938)))

(declare-fun b!1388239 () Bool)

(declare-fun res!928540 () Bool)

(assert (=> b!1388239 (=> (not res!928540) (not e!786463))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1388239 (= res!928540 (and (= (size!46433 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46433 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46433 a!2938))))))

(declare-fun b!1388240 () Bool)

(declare-fun res!928545 () Bool)

(assert (=> b!1388240 (=> (not res!928545) (not e!786463))))

(assert (=> b!1388240 (= res!928545 (and (not (= (select (arr!45882 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45882 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388241 () Bool)

(declare-fun e!786466 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388241 (= e!786466 (validKeyInArray!0 (select (arr!45882 a!2938) startIndex!16)))))

(declare-fun b!1388242 () Bool)

(declare-fun res!928543 () Bool)

(assert (=> b!1388242 (=> (not res!928543) (not e!786463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95016 (_ BitVec 32)) Bool)

(assert (=> b!1388242 (= res!928543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388243 () Bool)

(declare-datatypes ((Unit!46299 0))(
  ( (Unit!46300) )
))
(declare-fun e!786464 () Unit!46299)

(declare-fun Unit!46301 () Unit!46299)

(assert (=> b!1388243 (= e!786464 Unit!46301)))

(declare-fun b!1388244 () Bool)

(assert (=> b!1388244 (= e!786463 false)))

(declare-fun lt!610109 () Unit!46299)

(assert (=> b!1388244 (= lt!610109 e!786464)))

(declare-fun c!129297 () Bool)

(assert (=> b!1388244 (= c!129297 e!786466)))

(declare-fun res!928544 () Bool)

(assert (=> b!1388244 (=> (not res!928544) (not e!786466))))

(assert (=> b!1388244 (= res!928544 (not (= startIndex!16 i!1065)))))

(declare-fun b!1388245 () Bool)

(declare-fun lt!610108 () Unit!46299)

(assert (=> b!1388245 (= e!786464 lt!610108)))

(declare-fun lt!610110 () Unit!46299)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46299)

(assert (=> b!1388245 (= lt!610110 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10129 0))(
  ( (MissingZero!10129 (index!42887 (_ BitVec 32))) (Found!10129 (index!42888 (_ BitVec 32))) (Intermediate!10129 (undefined!10941 Bool) (index!42889 (_ BitVec 32)) (x!124648 (_ BitVec 32))) (Undefined!10129) (MissingVacant!10129 (index!42890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95016 (_ BitVec 32)) SeekEntryResult!10129)

(assert (=> b!1388245 (= (seekEntryOrOpen!0 (select (arr!45882 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45882 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95017 (store (arr!45882 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46433 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46299)

(assert (=> b!1388245 (= lt!610108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1388245 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1388246 () Bool)

(declare-fun res!928541 () Bool)

(assert (=> b!1388246 (=> (not res!928541) (not e!786463))))

(assert (=> b!1388246 (= res!928541 (validKeyInArray!0 (select (arr!45882 a!2938) i!1065)))))

(declare-fun b!1388247 () Bool)

(declare-fun res!928542 () Bool)

(assert (=> b!1388247 (=> (not res!928542) (not e!786463))))

(declare-datatypes ((List!32397 0))(
  ( (Nil!32394) (Cons!32393 (h!33611 (_ BitVec 64)) (t!47083 List!32397)) )
))
(declare-fun arrayNoDuplicates!0 (array!95016 (_ BitVec 32) List!32397) Bool)

(assert (=> b!1388247 (= res!928542 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32394))))

(assert (= (and start!118842 res!928546) b!1388239))

(assert (= (and b!1388239 res!928540) b!1388246))

(assert (= (and b!1388246 res!928541) b!1388247))

(assert (= (and b!1388247 res!928542) b!1388242))

(assert (= (and b!1388242 res!928543) b!1388240))

(assert (= (and b!1388240 res!928545) b!1388244))

(assert (= (and b!1388244 res!928544) b!1388241))

(assert (= (and b!1388244 c!129297) b!1388245))

(assert (= (and b!1388244 (not c!129297)) b!1388243))

(declare-fun m!1273983 () Bool)

(assert (=> b!1388241 m!1273983))

(assert (=> b!1388241 m!1273983))

(declare-fun m!1273985 () Bool)

(assert (=> b!1388241 m!1273985))

(declare-fun m!1273987 () Bool)

(assert (=> b!1388247 m!1273987))

(declare-fun m!1273989 () Bool)

(assert (=> b!1388242 m!1273989))

(declare-fun m!1273991 () Bool)

(assert (=> b!1388246 m!1273991))

(assert (=> b!1388246 m!1273991))

(declare-fun m!1273993 () Bool)

(assert (=> b!1388246 m!1273993))

(declare-fun m!1273995 () Bool)

(assert (=> b!1388245 m!1273995))

(declare-fun m!1273997 () Bool)

(assert (=> b!1388245 m!1273997))

(assert (=> b!1388245 m!1273997))

(declare-fun m!1273999 () Bool)

(assert (=> b!1388245 m!1273999))

(declare-fun m!1274001 () Bool)

(assert (=> b!1388245 m!1274001))

(declare-fun m!1274003 () Bool)

(assert (=> b!1388245 m!1274003))

(assert (=> b!1388245 m!1273983))

(declare-fun m!1274005 () Bool)

(assert (=> b!1388245 m!1274005))

(assert (=> b!1388245 m!1273983))

(declare-fun m!1274007 () Bool)

(assert (=> b!1388245 m!1274007))

(assert (=> b!1388240 m!1273991))

(declare-fun m!1274009 () Bool)

(assert (=> start!118842 m!1274009))

(declare-fun m!1274011 () Bool)

(assert (=> start!118842 m!1274011))

(push 1)

(assert (not b!1388245))

(assert (not b!1388247))

(assert (not b!1388241))

(assert (not b!1388242))

(assert (not b!1388246))

(assert (not start!118842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

