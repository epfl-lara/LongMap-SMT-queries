; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119348 () Bool)

(assert start!119348)

(declare-datatypes ((array!95183 0))(
  ( (array!95184 (arr!45954 (Array (_ BitVec 32) (_ BitVec 64))) (size!46504 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95183)

(declare-fun e!787902 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1391352 () Bool)

(declare-datatypes ((SeekEntryResult!10271 0))(
  ( (MissingZero!10271 (index!43455 (_ BitVec 32))) (Found!10271 (index!43456 (_ BitVec 32))) (Intermediate!10271 (undefined!11083 Bool) (index!43457 (_ BitVec 32)) (x!125137 (_ BitVec 32))) (Undefined!10271) (MissingVacant!10271 (index!43458 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95183 (_ BitVec 32)) SeekEntryResult!10271)

(assert (=> b!1391352 (= e!787902 (= (seekEntryOrOpen!0 (select (arr!45954 a!2901) j!112) a!2901 mask!2840) (Found!10271 j!112)))))

(declare-fun b!1391353 () Bool)

(declare-fun res!931220 () Bool)

(declare-fun e!787904 () Bool)

(assert (=> b!1391353 (=> (not res!931220) (not e!787904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95183 (_ BitVec 32)) Bool)

(assert (=> b!1391353 (= res!931220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931222 () Bool)

(assert (=> start!119348 (=> (not res!931222) (not e!787904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119348 (= res!931222 (validMask!0 mask!2840))))

(assert (=> start!119348 e!787904))

(assert (=> start!119348 true))

(declare-fun array_inv!34982 (array!95183) Bool)

(assert (=> start!119348 (array_inv!34982 a!2901)))

(declare-fun b!1391354 () Bool)

(assert (=> b!1391354 (= e!787904 (not true))))

(assert (=> b!1391354 e!787902))

(declare-fun res!931225 () Bool)

(assert (=> b!1391354 (=> (not res!931225) (not e!787902))))

(assert (=> b!1391354 (= res!931225 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46546 0))(
  ( (Unit!46547) )
))
(declare-fun lt!611180 () Unit!46546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46546)

(assert (=> b!1391354 (= lt!611180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611181 () SeekEntryResult!10271)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95183 (_ BitVec 32)) SeekEntryResult!10271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391354 (= lt!611181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45954 a!2901) j!112) mask!2840) (select (arr!45954 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391355 () Bool)

(declare-fun res!931219 () Bool)

(assert (=> b!1391355 (=> (not res!931219) (not e!787904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391355 (= res!931219 (validKeyInArray!0 (select (arr!45954 a!2901) j!112)))))

(declare-fun b!1391356 () Bool)

(declare-fun res!931224 () Bool)

(assert (=> b!1391356 (=> (not res!931224) (not e!787904))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391356 (= res!931224 (and (= (size!46504 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46504 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46504 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391357 () Bool)

(declare-fun res!931221 () Bool)

(assert (=> b!1391357 (=> (not res!931221) (not e!787904))))

(declare-datatypes ((List!32473 0))(
  ( (Nil!32470) (Cons!32469 (h!33693 (_ BitVec 64)) (t!47167 List!32473)) )
))
(declare-fun arrayNoDuplicates!0 (array!95183 (_ BitVec 32) List!32473) Bool)

(assert (=> b!1391357 (= res!931221 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32470))))

(declare-fun b!1391358 () Bool)

(declare-fun res!931223 () Bool)

(assert (=> b!1391358 (=> (not res!931223) (not e!787904))))

(assert (=> b!1391358 (= res!931223 (validKeyInArray!0 (select (arr!45954 a!2901) i!1037)))))

(assert (= (and start!119348 res!931222) b!1391356))

(assert (= (and b!1391356 res!931224) b!1391358))

(assert (= (and b!1391358 res!931223) b!1391355))

(assert (= (and b!1391355 res!931219) b!1391353))

(assert (= (and b!1391353 res!931220) b!1391357))

(assert (= (and b!1391357 res!931221) b!1391354))

(assert (= (and b!1391354 res!931225) b!1391352))

(declare-fun m!1277111 () Bool)

(assert (=> b!1391352 m!1277111))

(assert (=> b!1391352 m!1277111))

(declare-fun m!1277113 () Bool)

(assert (=> b!1391352 m!1277113))

(declare-fun m!1277115 () Bool)

(assert (=> b!1391353 m!1277115))

(declare-fun m!1277117 () Bool)

(assert (=> start!119348 m!1277117))

(declare-fun m!1277119 () Bool)

(assert (=> start!119348 m!1277119))

(declare-fun m!1277121 () Bool)

(assert (=> b!1391357 m!1277121))

(assert (=> b!1391355 m!1277111))

(assert (=> b!1391355 m!1277111))

(declare-fun m!1277123 () Bool)

(assert (=> b!1391355 m!1277123))

(assert (=> b!1391354 m!1277111))

(declare-fun m!1277125 () Bool)

(assert (=> b!1391354 m!1277125))

(assert (=> b!1391354 m!1277111))

(declare-fun m!1277127 () Bool)

(assert (=> b!1391354 m!1277127))

(assert (=> b!1391354 m!1277125))

(assert (=> b!1391354 m!1277111))

(declare-fun m!1277129 () Bool)

(assert (=> b!1391354 m!1277129))

(declare-fun m!1277131 () Bool)

(assert (=> b!1391354 m!1277131))

(declare-fun m!1277133 () Bool)

(assert (=> b!1391358 m!1277133))

(assert (=> b!1391358 m!1277133))

(declare-fun m!1277135 () Bool)

(assert (=> b!1391358 m!1277135))

(check-sat (not b!1391355) (not b!1391357) (not b!1391352) (not b!1391354) (not b!1391353) (not start!119348) (not b!1391358))
(check-sat)
