; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127786 () Bool)

(assert start!127786)

(declare-fun b!1499897 () Bool)

(declare-fun res!1019877 () Bool)

(declare-fun e!839990 () Bool)

(assert (=> b!1499897 (=> (not res!1019877) (not e!839990))))

(declare-datatypes ((array!100012 0))(
  ( (array!100013 (arr!48262 (Array (_ BitVec 32) (_ BitVec 64))) (size!48813 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100012)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499897 (= res!1019877 (validKeyInArray!0 (select (arr!48262 a!2850) j!87)))))

(declare-fun b!1499898 () Bool)

(declare-fun res!1019879 () Bool)

(assert (=> b!1499898 (=> (not res!1019879) (not e!839990))))

(declare-datatypes ((List!34741 0))(
  ( (Nil!34738) (Cons!34737 (h!36149 (_ BitVec 64)) (t!49427 List!34741)) )
))
(declare-fun arrayNoDuplicates!0 (array!100012 (_ BitVec 32) List!34741) Bool)

(assert (=> b!1499898 (= res!1019879 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34738))))

(declare-fun res!1019876 () Bool)

(assert (=> start!127786 (=> (not res!1019876) (not e!839990))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127786 (= res!1019876 (validMask!0 mask!2661))))

(assert (=> start!127786 e!839990))

(assert (=> start!127786 true))

(declare-fun array_inv!37543 (array!100012) Bool)

(assert (=> start!127786 (array_inv!37543 a!2850)))

(declare-fun b!1499899 () Bool)

(declare-fun res!1019874 () Bool)

(assert (=> b!1499899 (=> (not res!1019874) (not e!839990))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499899 (= res!1019874 (validKeyInArray!0 (select (arr!48262 a!2850) i!996)))))

(declare-fun b!1499900 () Bool)

(declare-fun res!1019875 () Bool)

(assert (=> b!1499900 (=> (not res!1019875) (not e!839990))))

(assert (=> b!1499900 (= res!1019875 (and (= (size!48813 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48813 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48813 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499901 () Bool)

(declare-fun res!1019878 () Bool)

(assert (=> b!1499901 (=> (not res!1019878) (not e!839990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100012 (_ BitVec 32)) Bool)

(assert (=> b!1499901 (= res!1019878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1499902 () Bool)

(assert (=> b!1499902 (= e!839990 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48813 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48813 a!2850)) (= (select (arr!48262 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48262 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48813 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127786 res!1019876) b!1499900))

(assert (= (and b!1499900 res!1019875) b!1499899))

(assert (= (and b!1499899 res!1019874) b!1499897))

(assert (= (and b!1499897 res!1019877) b!1499901))

(assert (= (and b!1499901 res!1019878) b!1499898))

(assert (= (and b!1499898 res!1019879) b!1499902))

(declare-fun m!1382993 () Bool)

(assert (=> start!127786 m!1382993))

(declare-fun m!1382995 () Bool)

(assert (=> start!127786 m!1382995))

(declare-fun m!1382997 () Bool)

(assert (=> b!1499898 m!1382997))

(declare-fun m!1382999 () Bool)

(assert (=> b!1499902 m!1382999))

(declare-fun m!1383001 () Bool)

(assert (=> b!1499902 m!1383001))

(declare-fun m!1383003 () Bool)

(assert (=> b!1499902 m!1383003))

(declare-fun m!1383005 () Bool)

(assert (=> b!1499897 m!1383005))

(assert (=> b!1499897 m!1383005))

(declare-fun m!1383007 () Bool)

(assert (=> b!1499897 m!1383007))

(declare-fun m!1383009 () Bool)

(assert (=> b!1499901 m!1383009))

(declare-fun m!1383011 () Bool)

(assert (=> b!1499899 m!1383011))

(assert (=> b!1499899 m!1383011))

(declare-fun m!1383013 () Bool)

(assert (=> b!1499899 m!1383013))

(check-sat (not b!1499897) (not start!127786) (not b!1499898) (not b!1499899) (not b!1499901))
(check-sat)
