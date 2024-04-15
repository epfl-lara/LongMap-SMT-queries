; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128120 () Bool)

(assert start!128120)

(declare-fun b!1504503 () Bool)

(declare-fun e!840930 () Bool)

(assert (=> b!1504503 (= e!840930 (not true))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100318 0))(
  ( (array!100319 (arr!48412 (Array (_ BitVec 32) (_ BitVec 64))) (size!48964 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100318)

(declare-fun lt!653527 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12631 0))(
  ( (MissingZero!12631 (index!52916 (_ BitVec 32))) (Found!12631 (index!52917 (_ BitVec 32))) (Intermediate!12631 (undefined!13443 Bool) (index!52918 (_ BitVec 32)) (x!134611 (_ BitVec 32))) (Undefined!12631) (MissingVacant!12631 (index!52919 (_ BitVec 32))) )
))
(declare-fun lt!653529 () SeekEntryResult!12631)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100318 (_ BitVec 32)) SeekEntryResult!12631)

(assert (=> b!1504503 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653527 vacantAfter!10 (select (store (arr!48412 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100319 (store (arr!48412 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48964 a!2850)) mask!2661) lt!653529)))

(declare-datatypes ((Unit!50107 0))(
  ( (Unit!50108) )
))
(declare-fun lt!653528 () Unit!50107)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50107)

(assert (=> b!1504503 (= lt!653528 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653527 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504504 () Bool)

(declare-fun res!1025299 () Bool)

(declare-fun e!840927 () Bool)

(assert (=> b!1504504 (=> (not res!1025299) (not e!840927))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504504 (= res!1025299 (not (= (select (arr!48412 a!2850) index!625) (select (arr!48412 a!2850) j!87))))))

(declare-fun b!1504505 () Bool)

(declare-fun res!1025305 () Bool)

(declare-fun e!840928 () Bool)

(assert (=> b!1504505 (=> (not res!1025305) (not e!840928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504505 (= res!1025305 (validKeyInArray!0 (select (arr!48412 a!2850) j!87)))))

(declare-fun b!1504506 () Bool)

(declare-fun res!1025308 () Bool)

(assert (=> b!1504506 (=> (not res!1025308) (not e!840930))))

(assert (=> b!1504506 (= res!1025308 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653527 vacantBefore!10 (select (arr!48412 a!2850) j!87) a!2850 mask!2661) lt!653529))))

(declare-fun b!1504507 () Bool)

(declare-fun res!1025309 () Bool)

(assert (=> b!1504507 (=> (not res!1025309) (not e!840928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100318 (_ BitVec 32)) Bool)

(assert (=> b!1504507 (= res!1025309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504508 () Bool)

(assert (=> b!1504508 (= e!840928 e!840927)))

(declare-fun res!1025304 () Bool)

(assert (=> b!1504508 (=> (not res!1025304) (not e!840927))))

(assert (=> b!1504508 (= res!1025304 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48412 a!2850) j!87) a!2850 mask!2661) lt!653529))))

(assert (=> b!1504508 (= lt!653529 (Found!12631 j!87))))

(declare-fun b!1504509 () Bool)

(declare-fun res!1025307 () Bool)

(assert (=> b!1504509 (=> (not res!1025307) (not e!840928))))

(declare-datatypes ((List!34982 0))(
  ( (Nil!34979) (Cons!34978 (h!36376 (_ BitVec 64)) (t!49668 List!34982)) )
))
(declare-fun arrayNoDuplicates!0 (array!100318 (_ BitVec 32) List!34982) Bool)

(assert (=> b!1504509 (= res!1025307 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34979))))

(declare-fun b!1504510 () Bool)

(declare-fun res!1025306 () Bool)

(assert (=> b!1504510 (=> (not res!1025306) (not e!840928))))

(assert (=> b!1504510 (= res!1025306 (validKeyInArray!0 (select (arr!48412 a!2850) i!996)))))

(declare-fun res!1025300 () Bool)

(assert (=> start!128120 (=> (not res!1025300) (not e!840928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128120 (= res!1025300 (validMask!0 mask!2661))))

(assert (=> start!128120 e!840928))

(assert (=> start!128120 true))

(declare-fun array_inv!37645 (array!100318) Bool)

(assert (=> start!128120 (array_inv!37645 a!2850)))

(declare-fun b!1504511 () Bool)

(declare-fun res!1025302 () Bool)

(assert (=> b!1504511 (=> (not res!1025302) (not e!840928))))

(assert (=> b!1504511 (= res!1025302 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48964 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48964 a!2850)) (= (select (arr!48412 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48412 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48964 a!2850))))))

(declare-fun b!1504512 () Bool)

(declare-fun res!1025301 () Bool)

(assert (=> b!1504512 (=> (not res!1025301) (not e!840928))))

(assert (=> b!1504512 (= res!1025301 (and (= (size!48964 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48964 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48964 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504513 () Bool)

(assert (=> b!1504513 (= e!840927 e!840930)))

(declare-fun res!1025303 () Bool)

(assert (=> b!1504513 (=> (not res!1025303) (not e!840930))))

(assert (=> b!1504513 (= res!1025303 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653527 #b00000000000000000000000000000000) (bvslt lt!653527 (size!48964 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504513 (= lt!653527 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128120 res!1025300) b!1504512))

(assert (= (and b!1504512 res!1025301) b!1504510))

(assert (= (and b!1504510 res!1025306) b!1504505))

(assert (= (and b!1504505 res!1025305) b!1504507))

(assert (= (and b!1504507 res!1025309) b!1504509))

(assert (= (and b!1504509 res!1025307) b!1504511))

(assert (= (and b!1504511 res!1025302) b!1504508))

(assert (= (and b!1504508 res!1025304) b!1504504))

(assert (= (and b!1504504 res!1025299) b!1504513))

(assert (= (and b!1504513 res!1025303) b!1504506))

(assert (= (and b!1504506 res!1025308) b!1504503))

(declare-fun m!1387025 () Bool)

(assert (=> b!1504506 m!1387025))

(assert (=> b!1504506 m!1387025))

(declare-fun m!1387027 () Bool)

(assert (=> b!1504506 m!1387027))

(assert (=> b!1504508 m!1387025))

(assert (=> b!1504508 m!1387025))

(declare-fun m!1387029 () Bool)

(assert (=> b!1504508 m!1387029))

(declare-fun m!1387031 () Bool)

(assert (=> start!128120 m!1387031))

(declare-fun m!1387033 () Bool)

(assert (=> start!128120 m!1387033))

(declare-fun m!1387035 () Bool)

(assert (=> b!1504507 m!1387035))

(declare-fun m!1387037 () Bool)

(assert (=> b!1504503 m!1387037))

(declare-fun m!1387039 () Bool)

(assert (=> b!1504503 m!1387039))

(assert (=> b!1504503 m!1387039))

(declare-fun m!1387041 () Bool)

(assert (=> b!1504503 m!1387041))

(declare-fun m!1387043 () Bool)

(assert (=> b!1504503 m!1387043))

(declare-fun m!1387045 () Bool)

(assert (=> b!1504511 m!1387045))

(assert (=> b!1504511 m!1387037))

(declare-fun m!1387047 () Bool)

(assert (=> b!1504511 m!1387047))

(declare-fun m!1387049 () Bool)

(assert (=> b!1504509 m!1387049))

(declare-fun m!1387051 () Bool)

(assert (=> b!1504510 m!1387051))

(assert (=> b!1504510 m!1387051))

(declare-fun m!1387053 () Bool)

(assert (=> b!1504510 m!1387053))

(declare-fun m!1387055 () Bool)

(assert (=> b!1504513 m!1387055))

(assert (=> b!1504505 m!1387025))

(assert (=> b!1504505 m!1387025))

(declare-fun m!1387057 () Bool)

(assert (=> b!1504505 m!1387057))

(declare-fun m!1387059 () Bool)

(assert (=> b!1504504 m!1387059))

(assert (=> b!1504504 m!1387025))

(check-sat (not b!1504507) (not b!1504503) (not b!1504508) (not start!128120) (not b!1504513) (not b!1504506) (not b!1504505) (not b!1504509) (not b!1504510))
(check-sat)
