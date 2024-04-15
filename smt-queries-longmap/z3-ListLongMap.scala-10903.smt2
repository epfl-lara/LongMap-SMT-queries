; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127634 () Bool)

(assert start!127634)

(declare-fun b!1499845 () Bool)

(declare-fun res!1021115 () Bool)

(declare-fun e!839313 () Bool)

(assert (=> b!1499845 (=> (not res!1021115) (not e!839313))))

(declare-datatypes ((array!100009 0))(
  ( (array!100010 (arr!48265 (Array (_ BitVec 32) (_ BitVec 64))) (size!48817 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100009)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499845 (= res!1021115 (validKeyInArray!0 (select (arr!48265 a!2850) i!996)))))

(declare-fun b!1499846 () Bool)

(declare-fun res!1021110 () Bool)

(assert (=> b!1499846 (=> (not res!1021110) (not e!839313))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1499846 (= res!1021110 (and (= (size!48817 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48817 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48817 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499847 () Bool)

(declare-fun res!1021111 () Bool)

(assert (=> b!1499847 (=> (not res!1021111) (not e!839313))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12496 0))(
  ( (MissingZero!12496 (index!52376 (_ BitVec 32))) (Found!12496 (index!52377 (_ BitVec 32))) (Intermediate!12496 (undefined!13308 Bool) (index!52378 (_ BitVec 32)) (x!134061 (_ BitVec 32))) (Undefined!12496) (MissingVacant!12496 (index!52379 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100009 (_ BitVec 32)) SeekEntryResult!12496)

(assert (=> b!1499847 (= res!1021111 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48265 a!2850) j!87) a!2850 mask!2661) (Found!12496 j!87)))))

(declare-fun b!1499848 () Bool)

(declare-fun res!1021112 () Bool)

(assert (=> b!1499848 (=> (not res!1021112) (not e!839313))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499848 (= res!1021112 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48817 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48817 a!2850)) (= (select (arr!48265 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48265 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48817 a!2850))))))

(declare-fun b!1499849 () Bool)

(declare-fun e!839311 () Bool)

(assert (=> b!1499849 (= e!839311 false)))

(declare-fun lt!652603 () SeekEntryResult!12496)

(declare-fun lt!652602 () (_ BitVec 32))

(assert (=> b!1499849 (= lt!652603 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652602 vacantBefore!10 (select (arr!48265 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021118 () Bool)

(assert (=> start!127634 (=> (not res!1021118) (not e!839313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127634 (= res!1021118 (validMask!0 mask!2661))))

(assert (=> start!127634 e!839313))

(assert (=> start!127634 true))

(declare-fun array_inv!37498 (array!100009) Bool)

(assert (=> start!127634 (array_inv!37498 a!2850)))

(declare-fun b!1499850 () Bool)

(declare-fun res!1021116 () Bool)

(assert (=> b!1499850 (=> (not res!1021116) (not e!839313))))

(assert (=> b!1499850 (= res!1021116 (validKeyInArray!0 (select (arr!48265 a!2850) j!87)))))

(declare-fun b!1499851 () Bool)

(declare-fun res!1021109 () Bool)

(assert (=> b!1499851 (=> (not res!1021109) (not e!839313))))

(declare-datatypes ((List!34835 0))(
  ( (Nil!34832) (Cons!34831 (h!36229 (_ BitVec 64)) (t!49521 List!34835)) )
))
(declare-fun arrayNoDuplicates!0 (array!100009 (_ BitVec 32) List!34835) Bool)

(assert (=> b!1499851 (= res!1021109 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34832))))

(declare-fun b!1499852 () Bool)

(declare-fun res!1021117 () Bool)

(assert (=> b!1499852 (=> (not res!1021117) (not e!839313))))

(assert (=> b!1499852 (= res!1021117 (not (= (select (arr!48265 a!2850) index!625) (select (arr!48265 a!2850) j!87))))))

(declare-fun b!1499853 () Bool)

(assert (=> b!1499853 (= e!839313 e!839311)))

(declare-fun res!1021114 () Bool)

(assert (=> b!1499853 (=> (not res!1021114) (not e!839311))))

(assert (=> b!1499853 (= res!1021114 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652602 #b00000000000000000000000000000000) (bvslt lt!652602 (size!48817 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499853 (= lt!652602 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499854 () Bool)

(declare-fun res!1021113 () Bool)

(assert (=> b!1499854 (=> (not res!1021113) (not e!839313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100009 (_ BitVec 32)) Bool)

(assert (=> b!1499854 (= res!1021113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127634 res!1021118) b!1499846))

(assert (= (and b!1499846 res!1021110) b!1499845))

(assert (= (and b!1499845 res!1021115) b!1499850))

(assert (= (and b!1499850 res!1021116) b!1499854))

(assert (= (and b!1499854 res!1021113) b!1499851))

(assert (= (and b!1499851 res!1021109) b!1499848))

(assert (= (and b!1499848 res!1021112) b!1499847))

(assert (= (and b!1499847 res!1021111) b!1499852))

(assert (= (and b!1499852 res!1021117) b!1499853))

(assert (= (and b!1499853 res!1021114) b!1499849))

(declare-fun m!1382485 () Bool)

(assert (=> b!1499849 m!1382485))

(assert (=> b!1499849 m!1382485))

(declare-fun m!1382487 () Bool)

(assert (=> b!1499849 m!1382487))

(declare-fun m!1382489 () Bool)

(assert (=> start!127634 m!1382489))

(declare-fun m!1382491 () Bool)

(assert (=> start!127634 m!1382491))

(declare-fun m!1382493 () Bool)

(assert (=> b!1499854 m!1382493))

(declare-fun m!1382495 () Bool)

(assert (=> b!1499851 m!1382495))

(declare-fun m!1382497 () Bool)

(assert (=> b!1499852 m!1382497))

(assert (=> b!1499852 m!1382485))

(declare-fun m!1382499 () Bool)

(assert (=> b!1499853 m!1382499))

(assert (=> b!1499850 m!1382485))

(assert (=> b!1499850 m!1382485))

(declare-fun m!1382501 () Bool)

(assert (=> b!1499850 m!1382501))

(assert (=> b!1499847 m!1382485))

(assert (=> b!1499847 m!1382485))

(declare-fun m!1382503 () Bool)

(assert (=> b!1499847 m!1382503))

(declare-fun m!1382505 () Bool)

(assert (=> b!1499848 m!1382505))

(declare-fun m!1382507 () Bool)

(assert (=> b!1499848 m!1382507))

(declare-fun m!1382509 () Bool)

(assert (=> b!1499848 m!1382509))

(declare-fun m!1382511 () Bool)

(assert (=> b!1499845 m!1382511))

(assert (=> b!1499845 m!1382511))

(declare-fun m!1382513 () Bool)

(assert (=> b!1499845 m!1382513))

(check-sat (not b!1499853) (not b!1499851) (not b!1499850) (not start!127634) (not b!1499854) (not b!1499849) (not b!1499847) (not b!1499845))
(check-sat)
