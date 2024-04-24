; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128054 () Bool)

(assert start!128054)

(declare-fun b!1503108 () Bool)

(declare-fun res!1023010 () Bool)

(declare-fun e!841003 () Bool)

(assert (=> b!1503108 (=> (not res!1023010) (not e!841003))))

(declare-datatypes ((array!100249 0))(
  ( (array!100250 (arr!48379 (Array (_ BitVec 32) (_ BitVec 64))) (size!48930 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100249)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503108 (= res!1023010 (validKeyInArray!0 (select (arr!48379 a!2850) j!87)))))

(declare-fun b!1503109 () Bool)

(declare-fun res!1023009 () Bool)

(assert (=> b!1503109 (=> (not res!1023009) (not e!841003))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100249 (_ BitVec 32)) Bool)

(assert (=> b!1503109 (= res!1023009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503110 () Bool)

(declare-fun res!1023002 () Bool)

(assert (=> b!1503110 (=> (not res!1023002) (not e!841003))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503110 (= res!1023002 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48930 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48930 a!2850)) (= (select (arr!48379 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48379 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48930 a!2850))))))

(declare-fun b!1503111 () Bool)

(declare-fun e!841004 () Bool)

(assert (=> b!1503111 (= e!841003 e!841004)))

(declare-fun res!1023006 () Bool)

(assert (=> b!1503111 (=> (not res!1023006) (not e!841004))))

(declare-datatypes ((SeekEntryResult!12482 0))(
  ( (MissingZero!12482 (index!52320 (_ BitVec 32))) (Found!12482 (index!52321 (_ BitVec 32))) (Intermediate!12482 (undefined!13294 Bool) (index!52322 (_ BitVec 32)) (x!134185 (_ BitVec 32))) (Undefined!12482) (MissingVacant!12482 (index!52323 (_ BitVec 32))) )
))
(declare-fun lt!653793 () SeekEntryResult!12482)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100249 (_ BitVec 32)) SeekEntryResult!12482)

(assert (=> b!1503111 (= res!1023006 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48379 a!2850) j!87) a!2850 mask!2661) lt!653793))))

(assert (=> b!1503111 (= lt!653793 (Found!12482 j!87))))

(declare-fun b!1503112 () Bool)

(declare-fun res!1023007 () Bool)

(assert (=> b!1503112 (=> (not res!1023007) (not e!841003))))

(assert (=> b!1503112 (= res!1023007 (and (= (size!48930 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48930 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48930 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503113 () Bool)

(declare-fun res!1023011 () Bool)

(declare-fun e!841002 () Bool)

(assert (=> b!1503113 (=> (not res!1023011) (not e!841002))))

(declare-fun lt!653791 () (_ BitVec 32))

(assert (=> b!1503113 (= res!1023011 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653791 vacantBefore!10 (select (arr!48379 a!2850) j!87) a!2850 mask!2661) lt!653793))))

(declare-fun b!1503114 () Bool)

(declare-fun res!1023001 () Bool)

(assert (=> b!1503114 (=> (not res!1023001) (not e!841003))))

(declare-datatypes ((List!34858 0))(
  ( (Nil!34855) (Cons!34854 (h!36266 (_ BitVec 64)) (t!49544 List!34858)) )
))
(declare-fun arrayNoDuplicates!0 (array!100249 (_ BitVec 32) List!34858) Bool)

(assert (=> b!1503114 (= res!1023001 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34855))))

(declare-fun b!1503115 () Bool)

(assert (=> b!1503115 (= e!841002 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(assert (=> b!1503115 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653791 vacantAfter!10 (select (store (arr!48379 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100250 (store (arr!48379 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48930 a!2850)) mask!2661) lt!653793)))

(declare-datatypes ((Unit!50155 0))(
  ( (Unit!50156) )
))
(declare-fun lt!653792 () Unit!50155)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50155)

(assert (=> b!1503115 (= lt!653792 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653791 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun res!1023008 () Bool)

(assert (=> start!128054 (=> (not res!1023008) (not e!841003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128054 (= res!1023008 (validMask!0 mask!2661))))

(assert (=> start!128054 e!841003))

(assert (=> start!128054 true))

(declare-fun array_inv!37660 (array!100249) Bool)

(assert (=> start!128054 (array_inv!37660 a!2850)))

(declare-fun b!1503116 () Bool)

(assert (=> b!1503116 (= e!841004 e!841002)))

(declare-fun res!1023005 () Bool)

(assert (=> b!1503116 (=> (not res!1023005) (not e!841002))))

(assert (=> b!1503116 (= res!1023005 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653791 #b00000000000000000000000000000000) (bvslt lt!653791 (size!48930 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503116 (= lt!653791 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503117 () Bool)

(declare-fun res!1023003 () Bool)

(assert (=> b!1503117 (=> (not res!1023003) (not e!841004))))

(assert (=> b!1503117 (= res!1023003 (not (= (select (arr!48379 a!2850) index!625) (select (arr!48379 a!2850) j!87))))))

(declare-fun b!1503118 () Bool)

(declare-fun res!1023004 () Bool)

(assert (=> b!1503118 (=> (not res!1023004) (not e!841003))))

(assert (=> b!1503118 (= res!1023004 (validKeyInArray!0 (select (arr!48379 a!2850) i!996)))))

(assert (= (and start!128054 res!1023008) b!1503112))

(assert (= (and b!1503112 res!1023007) b!1503118))

(assert (= (and b!1503118 res!1023004) b!1503108))

(assert (= (and b!1503108 res!1023010) b!1503109))

(assert (= (and b!1503109 res!1023009) b!1503114))

(assert (= (and b!1503114 res!1023001) b!1503110))

(assert (= (and b!1503110 res!1023002) b!1503111))

(assert (= (and b!1503111 res!1023006) b!1503117))

(assert (= (and b!1503117 res!1023003) b!1503116))

(assert (= (and b!1503116 res!1023005) b!1503113))

(assert (= (and b!1503113 res!1023011) b!1503115))

(declare-fun m!1386277 () Bool)

(assert (=> b!1503114 m!1386277))

(declare-fun m!1386279 () Bool)

(assert (=> start!128054 m!1386279))

(declare-fun m!1386281 () Bool)

(assert (=> start!128054 m!1386281))

(declare-fun m!1386283 () Bool)

(assert (=> b!1503115 m!1386283))

(declare-fun m!1386285 () Bool)

(assert (=> b!1503115 m!1386285))

(assert (=> b!1503115 m!1386285))

(declare-fun m!1386287 () Bool)

(assert (=> b!1503115 m!1386287))

(declare-fun m!1386289 () Bool)

(assert (=> b!1503115 m!1386289))

(declare-fun m!1386291 () Bool)

(assert (=> b!1503117 m!1386291))

(declare-fun m!1386293 () Bool)

(assert (=> b!1503117 m!1386293))

(declare-fun m!1386295 () Bool)

(assert (=> b!1503116 m!1386295))

(assert (=> b!1503111 m!1386293))

(assert (=> b!1503111 m!1386293))

(declare-fun m!1386297 () Bool)

(assert (=> b!1503111 m!1386297))

(declare-fun m!1386299 () Bool)

(assert (=> b!1503110 m!1386299))

(assert (=> b!1503110 m!1386283))

(declare-fun m!1386301 () Bool)

(assert (=> b!1503110 m!1386301))

(declare-fun m!1386303 () Bool)

(assert (=> b!1503118 m!1386303))

(assert (=> b!1503118 m!1386303))

(declare-fun m!1386305 () Bool)

(assert (=> b!1503118 m!1386305))

(assert (=> b!1503108 m!1386293))

(assert (=> b!1503108 m!1386293))

(declare-fun m!1386307 () Bool)

(assert (=> b!1503108 m!1386307))

(declare-fun m!1386309 () Bool)

(assert (=> b!1503109 m!1386309))

(assert (=> b!1503113 m!1386293))

(assert (=> b!1503113 m!1386293))

(declare-fun m!1386311 () Bool)

(assert (=> b!1503113 m!1386311))

(check-sat (not start!128054) (not b!1503114) (not b!1503115) (not b!1503108) (not b!1503113) (not b!1503109) (not b!1503116) (not b!1503118) (not b!1503111))
(check-sat)
