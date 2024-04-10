; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127604 () Bool)

(assert start!127604)

(declare-fun b!1499074 () Bool)

(declare-fun res!1020151 () Bool)

(declare-fun e!839191 () Bool)

(assert (=> b!1499074 (=> (not res!1020151) (not e!839191))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99985 0))(
  ( (array!99986 (arr!48252 (Array (_ BitVec 32) (_ BitVec 64))) (size!48802 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99985)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12462 0))(
  ( (MissingZero!12462 (index!52240 (_ BitVec 32))) (Found!12462 (index!52241 (_ BitVec 32))) (Intermediate!12462 (undefined!13274 Bool) (index!52242 (_ BitVec 32)) (x!133928 (_ BitVec 32))) (Undefined!12462) (MissingVacant!12462 (index!52243 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99985 (_ BitVec 32)) SeekEntryResult!12462)

(assert (=> b!1499074 (= res!1020151 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48252 a!2850) j!87) a!2850 mask!2661) (Found!12462 j!87)))))

(declare-fun b!1499075 () Bool)

(declare-fun res!1020150 () Bool)

(assert (=> b!1499075 (=> (not res!1020150) (not e!839191))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499075 (= res!1020150 (validKeyInArray!0 (select (arr!48252 a!2850) i!996)))))

(declare-fun b!1499076 () Bool)

(declare-fun res!1020154 () Bool)

(assert (=> b!1499076 (=> (not res!1020154) (not e!839191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99985 (_ BitVec 32)) Bool)

(assert (=> b!1499076 (= res!1020154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499077 () Bool)

(declare-fun res!1020153 () Bool)

(assert (=> b!1499077 (=> (not res!1020153) (not e!839191))))

(declare-datatypes ((List!34744 0))(
  ( (Nil!34741) (Cons!34740 (h!36137 (_ BitVec 64)) (t!49438 List!34744)) )
))
(declare-fun arrayNoDuplicates!0 (array!99985 (_ BitVec 32) List!34744) Bool)

(assert (=> b!1499077 (= res!1020153 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34741))))

(declare-fun b!1499078 () Bool)

(declare-fun res!1020152 () Bool)

(assert (=> b!1499078 (=> (not res!1020152) (not e!839191))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499078 (= res!1020152 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48802 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48802 a!2850)) (= (select (arr!48252 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48252 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48802 a!2850))))))

(declare-fun b!1499079 () Bool)

(assert (=> b!1499079 (= e!839191 (and (not (= (select (arr!48252 a!2850) index!625) (select (arr!48252 a!2850) j!87))) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1499080 () Bool)

(declare-fun res!1020156 () Bool)

(assert (=> b!1499080 (=> (not res!1020156) (not e!839191))))

(assert (=> b!1499080 (= res!1020156 (and (= (size!48802 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48802 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48802 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020155 () Bool)

(assert (=> start!127604 (=> (not res!1020155) (not e!839191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127604 (= res!1020155 (validMask!0 mask!2661))))

(assert (=> start!127604 e!839191))

(assert (=> start!127604 true))

(declare-fun array_inv!37280 (array!99985) Bool)

(assert (=> start!127604 (array_inv!37280 a!2850)))

(declare-fun b!1499081 () Bool)

(declare-fun res!1020157 () Bool)

(assert (=> b!1499081 (=> (not res!1020157) (not e!839191))))

(assert (=> b!1499081 (= res!1020157 (validKeyInArray!0 (select (arr!48252 a!2850) j!87)))))

(assert (= (and start!127604 res!1020155) b!1499080))

(assert (= (and b!1499080 res!1020156) b!1499075))

(assert (= (and b!1499075 res!1020150) b!1499081))

(assert (= (and b!1499081 res!1020157) b!1499076))

(assert (= (and b!1499076 res!1020154) b!1499077))

(assert (= (and b!1499077 res!1020153) b!1499078))

(assert (= (and b!1499078 res!1020152) b!1499074))

(assert (= (and b!1499074 res!1020151) b!1499079))

(declare-fun m!1382253 () Bool)

(assert (=> b!1499079 m!1382253))

(declare-fun m!1382255 () Bool)

(assert (=> b!1499079 m!1382255))

(declare-fun m!1382257 () Bool)

(assert (=> b!1499077 m!1382257))

(declare-fun m!1382259 () Bool)

(assert (=> b!1499076 m!1382259))

(assert (=> b!1499074 m!1382255))

(assert (=> b!1499074 m!1382255))

(declare-fun m!1382261 () Bool)

(assert (=> b!1499074 m!1382261))

(assert (=> b!1499081 m!1382255))

(assert (=> b!1499081 m!1382255))

(declare-fun m!1382263 () Bool)

(assert (=> b!1499081 m!1382263))

(declare-fun m!1382265 () Bool)

(assert (=> b!1499078 m!1382265))

(declare-fun m!1382267 () Bool)

(assert (=> b!1499078 m!1382267))

(declare-fun m!1382269 () Bool)

(assert (=> b!1499078 m!1382269))

(declare-fun m!1382271 () Bool)

(assert (=> start!127604 m!1382271))

(declare-fun m!1382273 () Bool)

(assert (=> start!127604 m!1382273))

(declare-fun m!1382275 () Bool)

(assert (=> b!1499075 m!1382275))

(assert (=> b!1499075 m!1382275))

(declare-fun m!1382277 () Bool)

(assert (=> b!1499075 m!1382277))

(check-sat (not b!1499074) (not b!1499081) (not b!1499075) (not b!1499076) (not b!1499077) (not start!127604))
(check-sat)
