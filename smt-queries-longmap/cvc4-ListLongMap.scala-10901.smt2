; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127672 () Bool)

(assert start!127672)

(declare-fun res!1021120 () Bool)

(declare-fun e!839474 () Bool)

(assert (=> start!127672 (=> (not res!1021120) (not e!839474))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127672 (= res!1021120 (validMask!0 mask!2661))))

(assert (=> start!127672 e!839474))

(assert (=> start!127672 true))

(declare-datatypes ((array!100053 0))(
  ( (array!100054 (arr!48286 (Array (_ BitVec 32) (_ BitVec 64))) (size!48836 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100053)

(declare-fun array_inv!37314 (array!100053) Bool)

(assert (=> start!127672 (array_inv!37314 a!2850)))

(declare-fun b!1500041 () Bool)

(declare-fun res!1021124 () Bool)

(assert (=> b!1500041 (=> (not res!1021124) (not e!839474))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12496 0))(
  ( (MissingZero!12496 (index!52376 (_ BitVec 32))) (Found!12496 (index!52377 (_ BitVec 32))) (Intermediate!12496 (undefined!13308 Bool) (index!52378 (_ BitVec 32)) (x!134050 (_ BitVec 32))) (Undefined!12496) (MissingVacant!12496 (index!52379 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100053 (_ BitVec 32)) SeekEntryResult!12496)

(assert (=> b!1500041 (= res!1021124 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48286 a!2850) j!87) a!2850 mask!2661) (Found!12496 j!87)))))

(declare-fun b!1500042 () Bool)

(declare-fun res!1021125 () Bool)

(assert (=> b!1500042 (=> (not res!1021125) (not e!839474))))

(assert (=> b!1500042 (= res!1021125 (not (= (select (arr!48286 a!2850) index!625) (select (arr!48286 a!2850) j!87))))))

(declare-fun b!1500043 () Bool)

(declare-fun e!839476 () Bool)

(assert (=> b!1500043 (= e!839474 e!839476)))

(declare-fun res!1021123 () Bool)

(assert (=> b!1500043 (=> (not res!1021123) (not e!839476))))

(declare-fun lt!652858 () (_ BitVec 32))

(assert (=> b!1500043 (= res!1021123 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652858 #b00000000000000000000000000000000) (bvslt lt!652858 (size!48836 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500043 (= lt!652858 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500044 () Bool)

(declare-fun res!1021122 () Bool)

(assert (=> b!1500044 (=> (not res!1021122) (not e!839474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500044 (= res!1021122 (validKeyInArray!0 (select (arr!48286 a!2850) j!87)))))

(declare-fun b!1500045 () Bool)

(declare-fun res!1021117 () Bool)

(assert (=> b!1500045 (=> (not res!1021117) (not e!839474))))

(declare-datatypes ((List!34778 0))(
  ( (Nil!34775) (Cons!34774 (h!36171 (_ BitVec 64)) (t!49472 List!34778)) )
))
(declare-fun arrayNoDuplicates!0 (array!100053 (_ BitVec 32) List!34778) Bool)

(assert (=> b!1500045 (= res!1021117 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34775))))

(declare-fun b!1500046 () Bool)

(declare-fun res!1021119 () Bool)

(assert (=> b!1500046 (=> (not res!1021119) (not e!839474))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500046 (= res!1021119 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48836 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48836 a!2850)) (= (select (arr!48286 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48286 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48836 a!2850))))))

(declare-fun b!1500047 () Bool)

(declare-fun res!1021121 () Bool)

(assert (=> b!1500047 (=> (not res!1021121) (not e!839474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100053 (_ BitVec 32)) Bool)

(assert (=> b!1500047 (= res!1021121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500048 () Bool)

(declare-fun res!1021126 () Bool)

(assert (=> b!1500048 (=> (not res!1021126) (not e!839474))))

(assert (=> b!1500048 (= res!1021126 (and (= (size!48836 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48836 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48836 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500049 () Bool)

(declare-fun res!1021118 () Bool)

(assert (=> b!1500049 (=> (not res!1021118) (not e!839474))))

(assert (=> b!1500049 (= res!1021118 (validKeyInArray!0 (select (arr!48286 a!2850) i!996)))))

(declare-fun b!1500050 () Bool)

(assert (=> b!1500050 (= e!839476 false)))

(declare-fun lt!652857 () SeekEntryResult!12496)

(assert (=> b!1500050 (= lt!652857 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652858 vacantBefore!10 (select (arr!48286 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127672 res!1021120) b!1500048))

(assert (= (and b!1500048 res!1021126) b!1500049))

(assert (= (and b!1500049 res!1021118) b!1500044))

(assert (= (and b!1500044 res!1021122) b!1500047))

(assert (= (and b!1500047 res!1021121) b!1500045))

(assert (= (and b!1500045 res!1021117) b!1500046))

(assert (= (and b!1500046 res!1021119) b!1500041))

(assert (= (and b!1500041 res!1021124) b!1500042))

(assert (= (and b!1500042 res!1021125) b!1500043))

(assert (= (and b!1500043 res!1021123) b!1500050))

(declare-fun m!1383235 () Bool)

(assert (=> b!1500046 m!1383235))

(declare-fun m!1383237 () Bool)

(assert (=> b!1500046 m!1383237))

(declare-fun m!1383239 () Bool)

(assert (=> b!1500046 m!1383239))

(declare-fun m!1383241 () Bool)

(assert (=> b!1500043 m!1383241))

(declare-fun m!1383243 () Bool)

(assert (=> b!1500041 m!1383243))

(assert (=> b!1500041 m!1383243))

(declare-fun m!1383245 () Bool)

(assert (=> b!1500041 m!1383245))

(declare-fun m!1383247 () Bool)

(assert (=> b!1500049 m!1383247))

(assert (=> b!1500049 m!1383247))

(declare-fun m!1383249 () Bool)

(assert (=> b!1500049 m!1383249))

(declare-fun m!1383251 () Bool)

(assert (=> b!1500045 m!1383251))

(declare-fun m!1383253 () Bool)

(assert (=> b!1500047 m!1383253))

(assert (=> b!1500044 m!1383243))

(assert (=> b!1500044 m!1383243))

(declare-fun m!1383255 () Bool)

(assert (=> b!1500044 m!1383255))

(assert (=> b!1500050 m!1383243))

(assert (=> b!1500050 m!1383243))

(declare-fun m!1383257 () Bool)

(assert (=> b!1500050 m!1383257))

(declare-fun m!1383259 () Bool)

(assert (=> b!1500042 m!1383259))

(assert (=> b!1500042 m!1383243))

(declare-fun m!1383261 () Bool)

(assert (=> start!127672 m!1383261))

(declare-fun m!1383263 () Bool)

(assert (=> start!127672 m!1383263))

(push 1)

(assert (not b!1500043))

(assert (not b!1500047))

(assert (not b!1500049))

(assert (not b!1500045))

(assert (not b!1500041))

(assert (not b!1500044))

(assert (not start!127672))

(assert (not b!1500050))

(check-sat)

