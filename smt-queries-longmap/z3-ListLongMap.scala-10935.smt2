; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127946 () Bool)

(assert start!127946)

(declare-fun res!1023925 () Bool)

(declare-fun e!840523 () Bool)

(assert (=> start!127946 (=> (not res!1023925) (not e!840523))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127946 (= res!1023925 (validMask!0 mask!2661))))

(assert (=> start!127946 e!840523))

(assert (=> start!127946 true))

(declare-datatypes ((array!100261 0))(
  ( (array!100262 (arr!48387 (Array (_ BitVec 32) (_ BitVec 64))) (size!48937 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100261)

(declare-fun array_inv!37415 (array!100261) Bool)

(assert (=> start!127946 (array_inv!37415 a!2850)))

(declare-fun b!1503039 () Bool)

(declare-fun res!1023921 () Bool)

(assert (=> b!1503039 (=> (not res!1023921) (not e!840523))))

(declare-datatypes ((List!34879 0))(
  ( (Nil!34876) (Cons!34875 (h!36272 (_ BitVec 64)) (t!49573 List!34879)) )
))
(declare-fun arrayNoDuplicates!0 (array!100261 (_ BitVec 32) List!34879) Bool)

(assert (=> b!1503039 (= res!1023921 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34876))))

(declare-fun b!1503040 () Bool)

(declare-fun res!1023920 () Bool)

(assert (=> b!1503040 (=> (not res!1023920) (not e!840523))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503040 (= res!1023920 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48937 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48937 a!2850)) (= (select (arr!48387 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48387 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48937 a!2850))))))

(declare-fun b!1503041 () Bool)

(assert (=> b!1503041 (= e!840523 false)))

(declare-fun lt!653482 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503041 (= lt!653482 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503042 () Bool)

(declare-fun res!1023918 () Bool)

(assert (=> b!1503042 (=> (not res!1023918) (not e!840523))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503042 (= res!1023918 (validKeyInArray!0 (select (arr!48387 a!2850) j!87)))))

(declare-fun b!1503043 () Bool)

(declare-fun res!1023922 () Bool)

(assert (=> b!1503043 (=> (not res!1023922) (not e!840523))))

(declare-datatypes ((SeekEntryResult!12585 0))(
  ( (MissingZero!12585 (index!52732 (_ BitVec 32))) (Found!12585 (index!52733 (_ BitVec 32))) (Intermediate!12585 (undefined!13397 Bool) (index!52734 (_ BitVec 32)) (x!134417 (_ BitVec 32))) (Undefined!12585) (MissingVacant!12585 (index!52735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100261 (_ BitVec 32)) SeekEntryResult!12585)

(assert (=> b!1503043 (= res!1023922 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48387 a!2850) j!87) a!2850 mask!2661) (Found!12585 j!87)))))

(declare-fun b!1503044 () Bool)

(declare-fun res!1023919 () Bool)

(assert (=> b!1503044 (=> (not res!1023919) (not e!840523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100261 (_ BitVec 32)) Bool)

(assert (=> b!1503044 (= res!1023919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503045 () Bool)

(declare-fun res!1023917 () Bool)

(assert (=> b!1503045 (=> (not res!1023917) (not e!840523))))

(assert (=> b!1503045 (= res!1023917 (and (= (size!48937 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48937 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48937 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503046 () Bool)

(declare-fun res!1023923 () Bool)

(assert (=> b!1503046 (=> (not res!1023923) (not e!840523))))

(assert (=> b!1503046 (= res!1023923 (validKeyInArray!0 (select (arr!48387 a!2850) i!996)))))

(declare-fun b!1503047 () Bool)

(declare-fun res!1023924 () Bool)

(assert (=> b!1503047 (=> (not res!1023924) (not e!840523))))

(assert (=> b!1503047 (= res!1023924 (not (= (select (arr!48387 a!2850) index!625) (select (arr!48387 a!2850) j!87))))))

(assert (= (and start!127946 res!1023925) b!1503045))

(assert (= (and b!1503045 res!1023917) b!1503046))

(assert (= (and b!1503046 res!1023923) b!1503042))

(assert (= (and b!1503042 res!1023918) b!1503044))

(assert (= (and b!1503044 res!1023919) b!1503039))

(assert (= (and b!1503039 res!1023921) b!1503040))

(assert (= (and b!1503040 res!1023920) b!1503043))

(assert (= (and b!1503043 res!1023922) b!1503047))

(assert (= (and b!1503047 res!1023924) b!1503041))

(declare-fun m!1386275 () Bool)

(assert (=> b!1503047 m!1386275))

(declare-fun m!1386277 () Bool)

(assert (=> b!1503047 m!1386277))

(declare-fun m!1386279 () Bool)

(assert (=> b!1503039 m!1386279))

(declare-fun m!1386281 () Bool)

(assert (=> start!127946 m!1386281))

(declare-fun m!1386283 () Bool)

(assert (=> start!127946 m!1386283))

(declare-fun m!1386285 () Bool)

(assert (=> b!1503046 m!1386285))

(assert (=> b!1503046 m!1386285))

(declare-fun m!1386287 () Bool)

(assert (=> b!1503046 m!1386287))

(declare-fun m!1386289 () Bool)

(assert (=> b!1503041 m!1386289))

(assert (=> b!1503042 m!1386277))

(assert (=> b!1503042 m!1386277))

(declare-fun m!1386291 () Bool)

(assert (=> b!1503042 m!1386291))

(declare-fun m!1386293 () Bool)

(assert (=> b!1503044 m!1386293))

(assert (=> b!1503043 m!1386277))

(assert (=> b!1503043 m!1386277))

(declare-fun m!1386295 () Bool)

(assert (=> b!1503043 m!1386295))

(declare-fun m!1386297 () Bool)

(assert (=> b!1503040 m!1386297))

(declare-fun m!1386299 () Bool)

(assert (=> b!1503040 m!1386299))

(declare-fun m!1386301 () Bool)

(assert (=> b!1503040 m!1386301))

(check-sat (not b!1503041) (not b!1503044) (not b!1503043) (not start!127946) (not b!1503039) (not b!1503042) (not b!1503046))
