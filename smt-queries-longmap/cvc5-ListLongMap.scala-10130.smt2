; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119628 () Bool)

(assert start!119628)

(declare-fun b!1393145 () Bool)

(declare-fun e!788981 () Bool)

(declare-fun e!788982 () Bool)

(assert (=> b!1393145 (= e!788981 (not e!788982))))

(declare-fun res!932185 () Bool)

(assert (=> b!1393145 (=> res!932185 e!788982)))

(declare-datatypes ((SeekEntryResult!10246 0))(
  ( (MissingZero!10246 (index!43355 (_ BitVec 32))) (Found!10246 (index!43356 (_ BitVec 32))) (Intermediate!10246 (undefined!11058 Bool) (index!43357 (_ BitVec 32)) (x!125185 (_ BitVec 32))) (Undefined!10246) (MissingVacant!10246 (index!43358 (_ BitVec 32))) )
))
(declare-fun lt!611828 () SeekEntryResult!10246)

(assert (=> b!1393145 (= res!932185 (or (not (is-Intermediate!10246 lt!611828)) (undefined!11058 lt!611828)))))

(declare-fun e!788983 () Bool)

(assert (=> b!1393145 e!788983))

(declare-fun res!932183 () Bool)

(assert (=> b!1393145 (=> (not res!932183) (not e!788983))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95334 0))(
  ( (array!95335 (arr!46026 (Array (_ BitVec 32) (_ BitVec 64))) (size!46577 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95334)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95334 (_ BitVec 32)) Bool)

(assert (=> b!1393145 (= res!932183 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46523 0))(
  ( (Unit!46524) )
))
(declare-fun lt!611827 () Unit!46523)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46523)

(assert (=> b!1393145 (= lt!611827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95334 (_ BitVec 32)) SeekEntryResult!10246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393145 (= lt!611828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46026 a!2901) j!112) mask!2840) (select (arr!46026 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393146 () Bool)

(declare-fun res!932181 () Bool)

(assert (=> b!1393146 (=> (not res!932181) (not e!788981))))

(declare-datatypes ((List!32532 0))(
  ( (Nil!32529) (Cons!32528 (h!33763 (_ BitVec 64)) (t!47218 List!32532)) )
))
(declare-fun arrayNoDuplicates!0 (array!95334 (_ BitVec 32) List!32532) Bool)

(assert (=> b!1393146 (= res!932181 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32529))))

(declare-fun b!1393147 () Bool)

(declare-fun res!932186 () Bool)

(assert (=> b!1393147 (=> (not res!932186) (not e!788981))))

(assert (=> b!1393147 (= res!932186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393149 () Bool)

(declare-fun res!932188 () Bool)

(assert (=> b!1393149 (=> (not res!932188) (not e!788981))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393149 (= res!932188 (validKeyInArray!0 (select (arr!46026 a!2901) i!1037)))))

(declare-fun b!1393150 () Bool)

(declare-fun res!932182 () Bool)

(assert (=> b!1393150 (=> (not res!932182) (not e!788981))))

(assert (=> b!1393150 (= res!932182 (validKeyInArray!0 (select (arr!46026 a!2901) j!112)))))

(declare-fun b!1393151 () Bool)

(declare-fun res!932187 () Bool)

(assert (=> b!1393151 (=> (not res!932187) (not e!788981))))

(assert (=> b!1393151 (= res!932187 (and (= (size!46577 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46577 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46577 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393152 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95334 (_ BitVec 32)) SeekEntryResult!10246)

(assert (=> b!1393152 (= e!788983 (= (seekEntryOrOpen!0 (select (arr!46026 a!2901) j!112) a!2901 mask!2840) (Found!10246 j!112)))))

(declare-fun res!932184 () Bool)

(assert (=> start!119628 (=> (not res!932184) (not e!788981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119628 (= res!932184 (validMask!0 mask!2840))))

(assert (=> start!119628 e!788981))

(assert (=> start!119628 true))

(declare-fun array_inv!35307 (array!95334) Bool)

(assert (=> start!119628 (array_inv!35307 a!2901)))

(declare-fun b!1393148 () Bool)

(assert (=> b!1393148 (= e!788982 true)))

(declare-fun lt!611826 () (_ BitVec 32))

(assert (=> b!1393148 (= lt!611826 (toIndex!0 (select (store (arr!46026 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119628 res!932184) b!1393151))

(assert (= (and b!1393151 res!932187) b!1393149))

(assert (= (and b!1393149 res!932188) b!1393150))

(assert (= (and b!1393150 res!932182) b!1393147))

(assert (= (and b!1393147 res!932186) b!1393146))

(assert (= (and b!1393146 res!932181) b!1393145))

(assert (= (and b!1393145 res!932183) b!1393152))

(assert (= (and b!1393145 (not res!932185)) b!1393148))

(declare-fun m!1279151 () Bool)

(assert (=> b!1393150 m!1279151))

(assert (=> b!1393150 m!1279151))

(declare-fun m!1279153 () Bool)

(assert (=> b!1393150 m!1279153))

(assert (=> b!1393145 m!1279151))

(declare-fun m!1279155 () Bool)

(assert (=> b!1393145 m!1279155))

(assert (=> b!1393145 m!1279151))

(declare-fun m!1279157 () Bool)

(assert (=> b!1393145 m!1279157))

(assert (=> b!1393145 m!1279155))

(assert (=> b!1393145 m!1279151))

(declare-fun m!1279159 () Bool)

(assert (=> b!1393145 m!1279159))

(declare-fun m!1279161 () Bool)

(assert (=> b!1393145 m!1279161))

(assert (=> b!1393152 m!1279151))

(assert (=> b!1393152 m!1279151))

(declare-fun m!1279163 () Bool)

(assert (=> b!1393152 m!1279163))

(declare-fun m!1279165 () Bool)

(assert (=> b!1393148 m!1279165))

(declare-fun m!1279167 () Bool)

(assert (=> b!1393148 m!1279167))

(assert (=> b!1393148 m!1279167))

(declare-fun m!1279169 () Bool)

(assert (=> b!1393148 m!1279169))

(declare-fun m!1279171 () Bool)

(assert (=> b!1393146 m!1279171))

(declare-fun m!1279173 () Bool)

(assert (=> b!1393149 m!1279173))

(assert (=> b!1393149 m!1279173))

(declare-fun m!1279175 () Bool)

(assert (=> b!1393149 m!1279175))

(declare-fun m!1279177 () Bool)

(assert (=> b!1393147 m!1279177))

(declare-fun m!1279179 () Bool)

(assert (=> start!119628 m!1279179))

(declare-fun m!1279181 () Bool)

(assert (=> start!119628 m!1279181))

(push 1)

(assert (not b!1393146))

(assert (not b!1393145))

(assert (not b!1393150))

(assert (not b!1393152))

(assert (not start!119628))

(assert (not b!1393147))

(assert (not b!1393149))

(assert (not b!1393148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

