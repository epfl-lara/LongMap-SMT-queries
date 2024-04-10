; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119352 () Bool)

(assert start!119352)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95187 0))(
  ( (array!95188 (arr!45956 (Array (_ BitVec 32) (_ BitVec 64))) (size!46506 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95187)

(declare-fun e!787921 () Bool)

(declare-fun b!1391394 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10273 0))(
  ( (MissingZero!10273 (index!43463 (_ BitVec 32))) (Found!10273 (index!43464 (_ BitVec 32))) (Intermediate!10273 (undefined!11085 Bool) (index!43465 (_ BitVec 32)) (x!125147 (_ BitVec 32))) (Undefined!10273) (MissingVacant!10273 (index!43466 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95187 (_ BitVec 32)) SeekEntryResult!10273)

(assert (=> b!1391394 (= e!787921 (= (seekEntryOrOpen!0 (select (arr!45956 a!2901) j!112) a!2901 mask!2840) (Found!10273 j!112)))))

(declare-fun b!1391395 () Bool)

(declare-fun e!787920 () Bool)

(assert (=> b!1391395 (= e!787920 (not true))))

(assert (=> b!1391395 e!787921))

(declare-fun res!931263 () Bool)

(assert (=> b!1391395 (=> (not res!931263) (not e!787921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95187 (_ BitVec 32)) Bool)

(assert (=> b!1391395 (= res!931263 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46550 0))(
  ( (Unit!46551) )
))
(declare-fun lt!611192 () Unit!46550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46550)

(assert (=> b!1391395 (= lt!611192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611193 () SeekEntryResult!10273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95187 (_ BitVec 32)) SeekEntryResult!10273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391395 (= lt!611193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45956 a!2901) j!112) mask!2840) (select (arr!45956 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391396 () Bool)

(declare-fun res!931266 () Bool)

(assert (=> b!1391396 (=> (not res!931266) (not e!787920))))

(assert (=> b!1391396 (= res!931266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391397 () Bool)

(declare-fun res!931261 () Bool)

(assert (=> b!1391397 (=> (not res!931261) (not e!787920))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391397 (= res!931261 (validKeyInArray!0 (select (arr!45956 a!2901) i!1037)))))

(declare-fun b!1391398 () Bool)

(declare-fun res!931264 () Bool)

(assert (=> b!1391398 (=> (not res!931264) (not e!787920))))

(assert (=> b!1391398 (= res!931264 (and (= (size!46506 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46506 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46506 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931262 () Bool)

(assert (=> start!119352 (=> (not res!931262) (not e!787920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119352 (= res!931262 (validMask!0 mask!2840))))

(assert (=> start!119352 e!787920))

(assert (=> start!119352 true))

(declare-fun array_inv!34984 (array!95187) Bool)

(assert (=> start!119352 (array_inv!34984 a!2901)))

(declare-fun b!1391399 () Bool)

(declare-fun res!931267 () Bool)

(assert (=> b!1391399 (=> (not res!931267) (not e!787920))))

(assert (=> b!1391399 (= res!931267 (validKeyInArray!0 (select (arr!45956 a!2901) j!112)))))

(declare-fun b!1391400 () Bool)

(declare-fun res!931265 () Bool)

(assert (=> b!1391400 (=> (not res!931265) (not e!787920))))

(declare-datatypes ((List!32475 0))(
  ( (Nil!32472) (Cons!32471 (h!33695 (_ BitVec 64)) (t!47169 List!32475)) )
))
(declare-fun arrayNoDuplicates!0 (array!95187 (_ BitVec 32) List!32475) Bool)

(assert (=> b!1391400 (= res!931265 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32472))))

(assert (= (and start!119352 res!931262) b!1391398))

(assert (= (and b!1391398 res!931264) b!1391397))

(assert (= (and b!1391397 res!931261) b!1391399))

(assert (= (and b!1391399 res!931267) b!1391396))

(assert (= (and b!1391396 res!931266) b!1391400))

(assert (= (and b!1391400 res!931265) b!1391395))

(assert (= (and b!1391395 res!931263) b!1391394))

(declare-fun m!1277163 () Bool)

(assert (=> b!1391397 m!1277163))

(assert (=> b!1391397 m!1277163))

(declare-fun m!1277165 () Bool)

(assert (=> b!1391397 m!1277165))

(declare-fun m!1277167 () Bool)

(assert (=> start!119352 m!1277167))

(declare-fun m!1277169 () Bool)

(assert (=> start!119352 m!1277169))

(declare-fun m!1277171 () Bool)

(assert (=> b!1391400 m!1277171))

(declare-fun m!1277173 () Bool)

(assert (=> b!1391399 m!1277173))

(assert (=> b!1391399 m!1277173))

(declare-fun m!1277175 () Bool)

(assert (=> b!1391399 m!1277175))

(assert (=> b!1391394 m!1277173))

(assert (=> b!1391394 m!1277173))

(declare-fun m!1277177 () Bool)

(assert (=> b!1391394 m!1277177))

(declare-fun m!1277179 () Bool)

(assert (=> b!1391396 m!1277179))

(assert (=> b!1391395 m!1277173))

(declare-fun m!1277181 () Bool)

(assert (=> b!1391395 m!1277181))

(assert (=> b!1391395 m!1277173))

(declare-fun m!1277183 () Bool)

(assert (=> b!1391395 m!1277183))

(assert (=> b!1391395 m!1277181))

(assert (=> b!1391395 m!1277173))

(declare-fun m!1277185 () Bool)

(assert (=> b!1391395 m!1277185))

(declare-fun m!1277187 () Bool)

(assert (=> b!1391395 m!1277187))

(push 1)

(assert (not b!1391400))

(assert (not b!1391395))

(assert (not start!119352))

(assert (not b!1391399))

(assert (not b!1391396))

(assert (not b!1391397))

(assert (not b!1391394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

