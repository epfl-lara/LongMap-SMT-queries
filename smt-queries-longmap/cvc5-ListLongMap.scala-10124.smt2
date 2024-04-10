; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119346 () Bool)

(assert start!119346)

(declare-fun b!1391331 () Bool)

(declare-fun e!787893 () Bool)

(assert (=> b!1391331 (= e!787893 (not true))))

(declare-fun e!787895 () Bool)

(assert (=> b!1391331 e!787895))

(declare-fun res!931200 () Bool)

(assert (=> b!1391331 (=> (not res!931200) (not e!787895))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95181 0))(
  ( (array!95182 (arr!45953 (Array (_ BitVec 32) (_ BitVec 64))) (size!46503 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95181)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95181 (_ BitVec 32)) Bool)

(assert (=> b!1391331 (= res!931200 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46544 0))(
  ( (Unit!46545) )
))
(declare-fun lt!611174 () Unit!46544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46544)

(assert (=> b!1391331 (= lt!611174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10270 0))(
  ( (MissingZero!10270 (index!43451 (_ BitVec 32))) (Found!10270 (index!43452 (_ BitVec 32))) (Intermediate!10270 (undefined!11082 Bool) (index!43453 (_ BitVec 32)) (x!125136 (_ BitVec 32))) (Undefined!10270) (MissingVacant!10270 (index!43454 (_ BitVec 32))) )
))
(declare-fun lt!611175 () SeekEntryResult!10270)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95181 (_ BitVec 32)) SeekEntryResult!10270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391331 (= lt!611175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45953 a!2901) j!112) mask!2840) (select (arr!45953 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391332 () Bool)

(declare-fun res!931204 () Bool)

(assert (=> b!1391332 (=> (not res!931204) (not e!787893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391332 (= res!931204 (validKeyInArray!0 (select (arr!45953 a!2901) j!112)))))

(declare-fun b!1391333 () Bool)

(declare-fun res!931202 () Bool)

(assert (=> b!1391333 (=> (not res!931202) (not e!787893))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391333 (= res!931202 (and (= (size!46503 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46503 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46503 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391334 () Bool)

(declare-fun res!931203 () Bool)

(assert (=> b!1391334 (=> (not res!931203) (not e!787893))))

(assert (=> b!1391334 (= res!931203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391335 () Bool)

(declare-fun res!931198 () Bool)

(assert (=> b!1391335 (=> (not res!931198) (not e!787893))))

(declare-datatypes ((List!32472 0))(
  ( (Nil!32469) (Cons!32468 (h!33692 (_ BitVec 64)) (t!47166 List!32472)) )
))
(declare-fun arrayNoDuplicates!0 (array!95181 (_ BitVec 32) List!32472) Bool)

(assert (=> b!1391335 (= res!931198 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32469))))

(declare-fun b!1391336 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95181 (_ BitVec 32)) SeekEntryResult!10270)

(assert (=> b!1391336 (= e!787895 (= (seekEntryOrOpen!0 (select (arr!45953 a!2901) j!112) a!2901 mask!2840) (Found!10270 j!112)))))

(declare-fun res!931199 () Bool)

(assert (=> start!119346 (=> (not res!931199) (not e!787893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119346 (= res!931199 (validMask!0 mask!2840))))

(assert (=> start!119346 e!787893))

(assert (=> start!119346 true))

(declare-fun array_inv!34981 (array!95181) Bool)

(assert (=> start!119346 (array_inv!34981 a!2901)))

(declare-fun b!1391337 () Bool)

(declare-fun res!931201 () Bool)

(assert (=> b!1391337 (=> (not res!931201) (not e!787893))))

(assert (=> b!1391337 (= res!931201 (validKeyInArray!0 (select (arr!45953 a!2901) i!1037)))))

(assert (= (and start!119346 res!931199) b!1391333))

(assert (= (and b!1391333 res!931202) b!1391337))

(assert (= (and b!1391337 res!931201) b!1391332))

(assert (= (and b!1391332 res!931204) b!1391334))

(assert (= (and b!1391334 res!931203) b!1391335))

(assert (= (and b!1391335 res!931198) b!1391331))

(assert (= (and b!1391331 res!931200) b!1391336))

(declare-fun m!1277085 () Bool)

(assert (=> b!1391332 m!1277085))

(assert (=> b!1391332 m!1277085))

(declare-fun m!1277087 () Bool)

(assert (=> b!1391332 m!1277087))

(assert (=> b!1391336 m!1277085))

(assert (=> b!1391336 m!1277085))

(declare-fun m!1277089 () Bool)

(assert (=> b!1391336 m!1277089))

(declare-fun m!1277091 () Bool)

(assert (=> b!1391335 m!1277091))

(declare-fun m!1277093 () Bool)

(assert (=> b!1391337 m!1277093))

(assert (=> b!1391337 m!1277093))

(declare-fun m!1277095 () Bool)

(assert (=> b!1391337 m!1277095))

(declare-fun m!1277097 () Bool)

(assert (=> b!1391334 m!1277097))

(assert (=> b!1391331 m!1277085))

(declare-fun m!1277099 () Bool)

(assert (=> b!1391331 m!1277099))

(assert (=> b!1391331 m!1277085))

(declare-fun m!1277101 () Bool)

(assert (=> b!1391331 m!1277101))

(assert (=> b!1391331 m!1277099))

(assert (=> b!1391331 m!1277085))

(declare-fun m!1277103 () Bool)

(assert (=> b!1391331 m!1277103))

(declare-fun m!1277105 () Bool)

(assert (=> b!1391331 m!1277105))

(declare-fun m!1277107 () Bool)

(assert (=> start!119346 m!1277107))

(declare-fun m!1277109 () Bool)

(assert (=> start!119346 m!1277109))

(push 1)

(assert (not start!119346))

(assert (not b!1391334))

(assert (not b!1391335))

(assert (not b!1391336))

(assert (not b!1391337))

(assert (not b!1391332))

(assert (not b!1391331))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

