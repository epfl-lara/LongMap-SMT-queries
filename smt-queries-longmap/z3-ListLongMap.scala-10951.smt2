; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128114 () Bool)

(assert start!128114)

(declare-fun b!1504404 () Bool)

(declare-fun res!1025210 () Bool)

(declare-fun e!840892 () Bool)

(assert (=> b!1504404 (=> (not res!1025210) (not e!840892))))

(declare-datatypes ((array!100312 0))(
  ( (array!100313 (arr!48409 (Array (_ BitVec 32) (_ BitVec 64))) (size!48961 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100312)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504404 (= res!1025210 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48961 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48961 a!2850)) (= (select (arr!48409 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48409 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48961 a!2850))))))

(declare-fun b!1504405 () Bool)

(declare-fun res!1025203 () Bool)

(assert (=> b!1504405 (=> (not res!1025203) (not e!840892))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100312 (_ BitVec 32)) Bool)

(assert (=> b!1504405 (= res!1025203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504406 () Bool)

(declare-fun res!1025205 () Bool)

(assert (=> b!1504406 (=> (not res!1025205) (not e!840892))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504406 (= res!1025205 (and (= (size!48961 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48961 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48961 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504407 () Bool)

(declare-fun res!1025209 () Bool)

(assert (=> b!1504407 (=> (not res!1025209) (not e!840892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504407 (= res!1025209 (validKeyInArray!0 (select (arr!48409 a!2850) j!87)))))

(declare-fun b!1504408 () Bool)

(declare-fun res!1025201 () Bool)

(declare-fun e!840894 () Bool)

(assert (=> b!1504408 (=> (not res!1025201) (not e!840894))))

(declare-datatypes ((SeekEntryResult!12628 0))(
  ( (MissingZero!12628 (index!52904 (_ BitVec 32))) (Found!12628 (index!52905 (_ BitVec 32))) (Intermediate!12628 (undefined!13440 Bool) (index!52906 (_ BitVec 32)) (x!134600 (_ BitVec 32))) (Undefined!12628) (MissingVacant!12628 (index!52907 (_ BitVec 32))) )
))
(declare-fun lt!653508 () SeekEntryResult!12628)

(declare-fun lt!653507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100312 (_ BitVec 32)) SeekEntryResult!12628)

(assert (=> b!1504408 (= res!1025201 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653507 vacantBefore!10 (select (arr!48409 a!2850) j!87) a!2850 mask!2661) lt!653508))))

(declare-fun b!1504409 () Bool)

(assert (=> b!1504409 (= e!840894 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!647)) (bvsub #b01111111111111111111111111111110 x!647)))))

(declare-fun b!1504410 () Bool)

(declare-fun res!1025202 () Bool)

(declare-fun e!840893 () Bool)

(assert (=> b!1504410 (=> (not res!1025202) (not e!840893))))

(assert (=> b!1504410 (= res!1025202 (not (= (select (arr!48409 a!2850) index!625) (select (arr!48409 a!2850) j!87))))))

(declare-fun b!1504411 () Bool)

(assert (=> b!1504411 (= e!840893 e!840894)))

(declare-fun res!1025206 () Bool)

(assert (=> b!1504411 (=> (not res!1025206) (not e!840894))))

(assert (=> b!1504411 (= res!1025206 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653507 #b00000000000000000000000000000000) (bvslt lt!653507 (size!48961 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504411 (= lt!653507 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504412 () Bool)

(declare-fun res!1025200 () Bool)

(assert (=> b!1504412 (=> (not res!1025200) (not e!840892))))

(assert (=> b!1504412 (= res!1025200 (validKeyInArray!0 (select (arr!48409 a!2850) i!996)))))

(declare-fun b!1504413 () Bool)

(assert (=> b!1504413 (= e!840892 e!840893)))

(declare-fun res!1025204 () Bool)

(assert (=> b!1504413 (=> (not res!1025204) (not e!840893))))

(assert (=> b!1504413 (= res!1025204 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48409 a!2850) j!87) a!2850 mask!2661) lt!653508))))

(assert (=> b!1504413 (= lt!653508 (Found!12628 j!87))))

(declare-fun res!1025208 () Bool)

(assert (=> start!128114 (=> (not res!1025208) (not e!840892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128114 (= res!1025208 (validMask!0 mask!2661))))

(assert (=> start!128114 e!840892))

(assert (=> start!128114 true))

(declare-fun array_inv!37642 (array!100312) Bool)

(assert (=> start!128114 (array_inv!37642 a!2850)))

(declare-fun b!1504414 () Bool)

(declare-fun res!1025207 () Bool)

(assert (=> b!1504414 (=> (not res!1025207) (not e!840892))))

(declare-datatypes ((List!34979 0))(
  ( (Nil!34976) (Cons!34975 (h!36373 (_ BitVec 64)) (t!49665 List!34979)) )
))
(declare-fun arrayNoDuplicates!0 (array!100312 (_ BitVec 32) List!34979) Bool)

(assert (=> b!1504414 (= res!1025207 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34976))))

(assert (= (and start!128114 res!1025208) b!1504406))

(assert (= (and b!1504406 res!1025205) b!1504412))

(assert (= (and b!1504412 res!1025200) b!1504407))

(assert (= (and b!1504407 res!1025209) b!1504405))

(assert (= (and b!1504405 res!1025203) b!1504414))

(assert (= (and b!1504414 res!1025207) b!1504404))

(assert (= (and b!1504404 res!1025210) b!1504413))

(assert (= (and b!1504413 res!1025204) b!1504410))

(assert (= (and b!1504410 res!1025202) b!1504411))

(assert (= (and b!1504411 res!1025206) b!1504408))

(assert (= (and b!1504408 res!1025201) b!1504409))

(declare-fun m!1386935 () Bool)

(assert (=> b!1504410 m!1386935))

(declare-fun m!1386937 () Bool)

(assert (=> b!1504410 m!1386937))

(declare-fun m!1386939 () Bool)

(assert (=> b!1504405 m!1386939))

(declare-fun m!1386941 () Bool)

(assert (=> b!1504411 m!1386941))

(declare-fun m!1386943 () Bool)

(assert (=> start!128114 m!1386943))

(declare-fun m!1386945 () Bool)

(assert (=> start!128114 m!1386945))

(declare-fun m!1386947 () Bool)

(assert (=> b!1504404 m!1386947))

(declare-fun m!1386949 () Bool)

(assert (=> b!1504404 m!1386949))

(declare-fun m!1386951 () Bool)

(assert (=> b!1504404 m!1386951))

(declare-fun m!1386953 () Bool)

(assert (=> b!1504414 m!1386953))

(assert (=> b!1504408 m!1386937))

(assert (=> b!1504408 m!1386937))

(declare-fun m!1386955 () Bool)

(assert (=> b!1504408 m!1386955))

(assert (=> b!1504407 m!1386937))

(assert (=> b!1504407 m!1386937))

(declare-fun m!1386957 () Bool)

(assert (=> b!1504407 m!1386957))

(declare-fun m!1386959 () Bool)

(assert (=> b!1504412 m!1386959))

(assert (=> b!1504412 m!1386959))

(declare-fun m!1386961 () Bool)

(assert (=> b!1504412 m!1386961))

(assert (=> b!1504413 m!1386937))

(assert (=> b!1504413 m!1386937))

(declare-fun m!1386963 () Bool)

(assert (=> b!1504413 m!1386963))

(check-sat (not b!1504414) (not b!1504411) (not start!128114) (not b!1504405) (not b!1504413) (not b!1504412) (not b!1504407) (not b!1504408))
(check-sat)
