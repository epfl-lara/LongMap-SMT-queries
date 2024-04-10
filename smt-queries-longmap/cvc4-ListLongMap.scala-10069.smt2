; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118552 () Bool)

(assert start!118552)

(declare-fun b!1385952 () Bool)

(declare-fun res!927204 () Bool)

(declare-fun e!785222 () Bool)

(assert (=> b!1385952 (=> (not res!927204) (not e!785222))))

(declare-datatypes ((array!94828 0))(
  ( (array!94829 (arr!45790 (Array (_ BitVec 32) (_ BitVec 64))) (size!46340 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94828)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94828 (_ BitVec 32)) Bool)

(assert (=> b!1385952 (= res!927204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385953 () Bool)

(declare-fun res!927202 () Bool)

(assert (=> b!1385953 (=> (not res!927202) (not e!785222))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385953 (= res!927202 (and (not (= (select (arr!45790 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45790 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385954 () Bool)

(declare-fun res!927206 () Bool)

(assert (=> b!1385954 (=> (not res!927206) (not e!785222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385954 (= res!927206 (validKeyInArray!0 (select (arr!45790 a!2938) startIndex!16)))))

(declare-fun b!1385955 () Bool)

(declare-fun res!927203 () Bool)

(assert (=> b!1385955 (=> (not res!927203) (not e!785222))))

(assert (=> b!1385955 (= res!927203 (and (= (size!46340 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46340 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46340 a!2938))))))

(declare-fun b!1385956 () Bool)

(declare-fun res!927205 () Bool)

(assert (=> b!1385956 (=> (not res!927205) (not e!785222))))

(assert (=> b!1385956 (= res!927205 (validKeyInArray!0 (select (arr!45790 a!2938) i!1065)))))

(declare-fun b!1385958 () Bool)

(assert (=> b!1385958 (= e!785222 (not true))))

(declare-datatypes ((SeekEntryResult!10133 0))(
  ( (MissingZero!10133 (index!42903 (_ BitVec 32))) (Found!10133 (index!42904 (_ BitVec 32))) (Intermediate!10133 (undefined!10945 Bool) (index!42905 (_ BitVec 32)) (x!124526 (_ BitVec 32))) (Undefined!10133) (MissingVacant!10133 (index!42906 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94828 (_ BitVec 32)) SeekEntryResult!10133)

(assert (=> b!1385958 (= (seekEntryOrOpen!0 (select (arr!45790 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45790 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94829 (store (arr!45790 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46340 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46254 0))(
  ( (Unit!46255) )
))
(declare-fun lt!609351 () Unit!46254)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46254)

(assert (=> b!1385958 (= lt!609351 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1385957 () Bool)

(declare-fun res!927207 () Bool)

(assert (=> b!1385957 (=> (not res!927207) (not e!785222))))

(declare-datatypes ((List!32318 0))(
  ( (Nil!32315) (Cons!32314 (h!33523 (_ BitVec 64)) (t!47012 List!32318)) )
))
(declare-fun arrayNoDuplicates!0 (array!94828 (_ BitVec 32) List!32318) Bool)

(assert (=> b!1385957 (= res!927207 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32315))))

(declare-fun res!927208 () Bool)

(assert (=> start!118552 (=> (not res!927208) (not e!785222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118552 (= res!927208 (validMask!0 mask!2987))))

(assert (=> start!118552 e!785222))

(assert (=> start!118552 true))

(declare-fun array_inv!34818 (array!94828) Bool)

(assert (=> start!118552 (array_inv!34818 a!2938)))

(assert (= (and start!118552 res!927208) b!1385955))

(assert (= (and b!1385955 res!927203) b!1385956))

(assert (= (and b!1385956 res!927205) b!1385957))

(assert (= (and b!1385957 res!927207) b!1385952))

(assert (= (and b!1385952 res!927204) b!1385953))

(assert (= (and b!1385953 res!927202) b!1385954))

(assert (= (and b!1385954 res!927206) b!1385958))

(declare-fun m!1271233 () Bool)

(assert (=> b!1385953 m!1271233))

(assert (=> b!1385956 m!1271233))

(assert (=> b!1385956 m!1271233))

(declare-fun m!1271235 () Bool)

(assert (=> b!1385956 m!1271235))

(declare-fun m!1271237 () Bool)

(assert (=> b!1385954 m!1271237))

(assert (=> b!1385954 m!1271237))

(declare-fun m!1271239 () Bool)

(assert (=> b!1385954 m!1271239))

(declare-fun m!1271241 () Bool)

(assert (=> b!1385958 m!1271241))

(assert (=> b!1385958 m!1271241))

(declare-fun m!1271243 () Bool)

(assert (=> b!1385958 m!1271243))

(declare-fun m!1271245 () Bool)

(assert (=> b!1385958 m!1271245))

(declare-fun m!1271247 () Bool)

(assert (=> b!1385958 m!1271247))

(assert (=> b!1385958 m!1271237))

(assert (=> b!1385958 m!1271237))

(declare-fun m!1271249 () Bool)

(assert (=> b!1385958 m!1271249))

(declare-fun m!1271251 () Bool)

(assert (=> start!118552 m!1271251))

(declare-fun m!1271253 () Bool)

(assert (=> start!118552 m!1271253))

(declare-fun m!1271255 () Bool)

(assert (=> b!1385957 m!1271255))

(declare-fun m!1271257 () Bool)

(assert (=> b!1385952 m!1271257))

(push 1)

(assert (not b!1385958))

(assert (not b!1385954))

(assert (not b!1385952))

(assert (not start!118552))

(assert (not b!1385956))

(assert (not b!1385957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

