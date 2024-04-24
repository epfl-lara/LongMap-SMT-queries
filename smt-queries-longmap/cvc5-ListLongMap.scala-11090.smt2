; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129936 () Bool)

(assert start!129936)

(declare-fun b!1523224 () Bool)

(declare-fun res!1041025 () Bool)

(declare-fun e!849788 () Bool)

(assert (=> b!1523224 (=> (not res!1041025) (not e!849788))))

(declare-datatypes ((array!101360 0))(
  ( (array!101361 (arr!48906 (Array (_ BitVec 32) (_ BitVec 64))) (size!49457 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101360)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523224 (= res!1041025 (validKeyInArray!0 (select (arr!48906 a!2804) j!70)))))

(declare-fun b!1523225 () Bool)

(assert (=> b!1523225 (= e!849788 false)))

(declare-fun lt!660136 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523225 (= lt!660136 (toIndex!0 (select (arr!48906 a!2804) j!70) mask!2512))))

(declare-fun b!1523226 () Bool)

(declare-fun res!1041022 () Bool)

(assert (=> b!1523226 (=> (not res!1041022) (not e!849788))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523226 (= res!1041022 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49457 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49457 a!2804))))))

(declare-fun b!1523228 () Bool)

(declare-fun res!1041024 () Bool)

(assert (=> b!1523228 (=> (not res!1041024) (not e!849788))))

(declare-datatypes ((List!35376 0))(
  ( (Nil!35373) (Cons!35372 (h!36811 (_ BitVec 64)) (t!50062 List!35376)) )
))
(declare-fun arrayNoDuplicates!0 (array!101360 (_ BitVec 32) List!35376) Bool)

(assert (=> b!1523228 (= res!1041024 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35373))))

(declare-fun b!1523229 () Bool)

(declare-fun res!1041026 () Bool)

(assert (=> b!1523229 (=> (not res!1041026) (not e!849788))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523229 (= res!1041026 (and (= (size!49457 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49457 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49457 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523230 () Bool)

(declare-fun res!1041023 () Bool)

(assert (=> b!1523230 (=> (not res!1041023) (not e!849788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101360 (_ BitVec 32)) Bool)

(assert (=> b!1523230 (= res!1041023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041020 () Bool)

(assert (=> start!129936 (=> (not res!1041020) (not e!849788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129936 (= res!1041020 (validMask!0 mask!2512))))

(assert (=> start!129936 e!849788))

(assert (=> start!129936 true))

(declare-fun array_inv!38187 (array!101360) Bool)

(assert (=> start!129936 (array_inv!38187 a!2804)))

(declare-fun b!1523227 () Bool)

(declare-fun res!1041021 () Bool)

(assert (=> b!1523227 (=> (not res!1041021) (not e!849788))))

(assert (=> b!1523227 (= res!1041021 (validKeyInArray!0 (select (arr!48906 a!2804) i!961)))))

(assert (= (and start!129936 res!1041020) b!1523229))

(assert (= (and b!1523229 res!1041026) b!1523227))

(assert (= (and b!1523227 res!1041021) b!1523224))

(assert (= (and b!1523224 res!1041025) b!1523230))

(assert (= (and b!1523230 res!1041023) b!1523228))

(assert (= (and b!1523228 res!1041024) b!1523226))

(assert (= (and b!1523226 res!1041022) b!1523225))

(declare-fun m!1406211 () Bool)

(assert (=> start!129936 m!1406211))

(declare-fun m!1406213 () Bool)

(assert (=> start!129936 m!1406213))

(declare-fun m!1406215 () Bool)

(assert (=> b!1523228 m!1406215))

(declare-fun m!1406217 () Bool)

(assert (=> b!1523227 m!1406217))

(assert (=> b!1523227 m!1406217))

(declare-fun m!1406219 () Bool)

(assert (=> b!1523227 m!1406219))

(declare-fun m!1406221 () Bool)

(assert (=> b!1523225 m!1406221))

(assert (=> b!1523225 m!1406221))

(declare-fun m!1406223 () Bool)

(assert (=> b!1523225 m!1406223))

(declare-fun m!1406225 () Bool)

(assert (=> b!1523230 m!1406225))

(assert (=> b!1523224 m!1406221))

(assert (=> b!1523224 m!1406221))

(declare-fun m!1406227 () Bool)

(assert (=> b!1523224 m!1406227))

(push 1)

(assert (not start!129936))

(assert (not b!1523228))

(assert (not b!1523227))

(assert (not b!1523225))

(assert (not b!1523224))

(assert (not b!1523230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

