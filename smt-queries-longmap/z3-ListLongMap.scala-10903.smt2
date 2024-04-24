; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127982 () Bool)

(assert start!127982)

(declare-fun b!1501999 () Bool)

(declare-fun res!1021899 () Bool)

(declare-fun e!840650 () Bool)

(assert (=> b!1501999 (=> (not res!1021899) (not e!840650))))

(declare-datatypes ((array!100177 0))(
  ( (array!100178 (arr!48343 (Array (_ BitVec 32) (_ BitVec 64))) (size!48894 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100177)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501999 (= res!1021899 (not (= (select (arr!48343 a!2850) index!625) (select (arr!48343 a!2850) j!87))))))

(declare-fun b!1502000 () Bool)

(declare-fun res!1021900 () Bool)

(assert (=> b!1502000 (=> (not res!1021900) (not e!840650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502000 (= res!1021900 (validKeyInArray!0 (select (arr!48343 a!2850) j!87)))))

(declare-fun b!1502001 () Bool)

(declare-fun e!840651 () Bool)

(assert (=> b!1502001 (= e!840651 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12446 0))(
  ( (MissingZero!12446 (index!52176 (_ BitVec 32))) (Found!12446 (index!52177 (_ BitVec 32))) (Intermediate!12446 (undefined!13258 Bool) (index!52178 (_ BitVec 32)) (x!134053 (_ BitVec 32))) (Undefined!12446) (MissingVacant!12446 (index!52179 (_ BitVec 32))) )
))
(declare-fun lt!653546 () SeekEntryResult!12446)

(declare-fun lt!653547 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100177 (_ BitVec 32)) SeekEntryResult!12446)

(assert (=> b!1502001 (= lt!653546 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653547 vacantBefore!10 (select (arr!48343 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021898 () Bool)

(assert (=> start!127982 (=> (not res!1021898) (not e!840650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127982 (= res!1021898 (validMask!0 mask!2661))))

(assert (=> start!127982 e!840650))

(assert (=> start!127982 true))

(declare-fun array_inv!37624 (array!100177) Bool)

(assert (=> start!127982 (array_inv!37624 a!2850)))

(declare-fun b!1502002 () Bool)

(declare-fun res!1021893 () Bool)

(assert (=> b!1502002 (=> (not res!1021893) (not e!840650))))

(declare-datatypes ((List!34822 0))(
  ( (Nil!34819) (Cons!34818 (h!36230 (_ BitVec 64)) (t!49508 List!34822)) )
))
(declare-fun arrayNoDuplicates!0 (array!100177 (_ BitVec 32) List!34822) Bool)

(assert (=> b!1502002 (= res!1021893 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34819))))

(declare-fun b!1502003 () Bool)

(declare-fun res!1021896 () Bool)

(assert (=> b!1502003 (=> (not res!1021896) (not e!840650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100177 (_ BitVec 32)) Bool)

(assert (=> b!1502003 (= res!1021896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502004 () Bool)

(declare-fun res!1021895 () Bool)

(assert (=> b!1502004 (=> (not res!1021895) (not e!840650))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502004 (= res!1021895 (and (= (size!48894 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48894 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48894 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502005 () Bool)

(declare-fun res!1021892 () Bool)

(assert (=> b!1502005 (=> (not res!1021892) (not e!840650))))

(assert (=> b!1502005 (= res!1021892 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48343 a!2850) j!87) a!2850 mask!2661) (Found!12446 j!87)))))

(declare-fun b!1502006 () Bool)

(assert (=> b!1502006 (= e!840650 e!840651)))

(declare-fun res!1021901 () Bool)

(assert (=> b!1502006 (=> (not res!1021901) (not e!840651))))

(assert (=> b!1502006 (= res!1021901 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653547 #b00000000000000000000000000000000) (bvslt lt!653547 (size!48894 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502006 (= lt!653547 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502007 () Bool)

(declare-fun res!1021894 () Bool)

(assert (=> b!1502007 (=> (not res!1021894) (not e!840650))))

(assert (=> b!1502007 (= res!1021894 (validKeyInArray!0 (select (arr!48343 a!2850) i!996)))))

(declare-fun b!1502008 () Bool)

(declare-fun res!1021897 () Bool)

(assert (=> b!1502008 (=> (not res!1021897) (not e!840650))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502008 (= res!1021897 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48894 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48894 a!2850)) (= (select (arr!48343 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48343 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48894 a!2850))))))

(assert (= (and start!127982 res!1021898) b!1502004))

(assert (= (and b!1502004 res!1021895) b!1502007))

(assert (= (and b!1502007 res!1021894) b!1502000))

(assert (= (and b!1502000 res!1021900) b!1502003))

(assert (= (and b!1502003 res!1021896) b!1502002))

(assert (= (and b!1502002 res!1021893) b!1502008))

(assert (= (and b!1502008 res!1021897) b!1502005))

(assert (= (and b!1502005 res!1021892) b!1501999))

(assert (= (and b!1501999 res!1021899) b!1502006))

(assert (= (and b!1502006 res!1021901) b!1502001))

(declare-fun m!1385143 () Bool)

(assert (=> b!1502008 m!1385143))

(declare-fun m!1385145 () Bool)

(assert (=> b!1502008 m!1385145))

(declare-fun m!1385147 () Bool)

(assert (=> b!1502008 m!1385147))

(declare-fun m!1385149 () Bool)

(assert (=> b!1502001 m!1385149))

(assert (=> b!1502001 m!1385149))

(declare-fun m!1385151 () Bool)

(assert (=> b!1502001 m!1385151))

(declare-fun m!1385153 () Bool)

(assert (=> b!1502003 m!1385153))

(assert (=> b!1502000 m!1385149))

(assert (=> b!1502000 m!1385149))

(declare-fun m!1385155 () Bool)

(assert (=> b!1502000 m!1385155))

(declare-fun m!1385157 () Bool)

(assert (=> b!1501999 m!1385157))

(assert (=> b!1501999 m!1385149))

(declare-fun m!1385159 () Bool)

(assert (=> b!1502002 m!1385159))

(declare-fun m!1385161 () Bool)

(assert (=> start!127982 m!1385161))

(declare-fun m!1385163 () Bool)

(assert (=> start!127982 m!1385163))

(declare-fun m!1385165 () Bool)

(assert (=> b!1502007 m!1385165))

(assert (=> b!1502007 m!1385165))

(declare-fun m!1385167 () Bool)

(assert (=> b!1502007 m!1385167))

(declare-fun m!1385169 () Bool)

(assert (=> b!1502006 m!1385169))

(assert (=> b!1502005 m!1385149))

(assert (=> b!1502005 m!1385149))

(declare-fun m!1385171 () Bool)

(assert (=> b!1502005 m!1385171))

(check-sat (not b!1502005) (not start!127982) (not b!1502003) (not b!1502000) (not b!1502001) (not b!1502007) (not b!1502006) (not b!1502002))
(check-sat)
