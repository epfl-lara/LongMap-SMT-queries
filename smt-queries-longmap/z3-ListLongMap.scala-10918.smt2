; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127724 () Bool)

(assert start!127724)

(declare-fun b!1501251 () Bool)

(declare-fun res!1022524 () Bool)

(declare-fun e!839772 () Bool)

(assert (=> b!1501251 (=> (not res!1022524) (not e!839772))))

(declare-datatypes ((array!100099 0))(
  ( (array!100100 (arr!48310 (Array (_ BitVec 32) (_ BitVec 64))) (size!48862 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100099)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501251 (= res!1022524 (validKeyInArray!0 (select (arr!48310 a!2850) i!996)))))

(declare-fun b!1501252 () Bool)

(declare-fun res!1022519 () Bool)

(declare-fun e!839773 () Bool)

(assert (=> b!1501252 (=> (not res!1022519) (not e!839773))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501252 (= res!1022519 (not (= (select (arr!48310 a!2850) index!625) (select (arr!48310 a!2850) j!87))))))

(declare-fun b!1501253 () Bool)

(declare-fun e!839775 () Bool)

(assert (=> b!1501253 (= e!839775 (not true))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!652930 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12541 0))(
  ( (MissingZero!12541 (index!52556 (_ BitVec 32))) (Found!12541 (index!52557 (_ BitVec 32))) (Intermediate!12541 (undefined!13353 Bool) (index!52558 (_ BitVec 32)) (x!134226 (_ BitVec 32))) (Undefined!12541) (MissingVacant!12541 (index!52559 (_ BitVec 32))) )
))
(declare-fun lt!652928 () SeekEntryResult!12541)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100099 (_ BitVec 32)) SeekEntryResult!12541)

(assert (=> b!1501253 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652930 vacantAfter!10 (select (store (arr!48310 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100100 (store (arr!48310 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48862 a!2850)) mask!2661) lt!652928)))

(declare-datatypes ((Unit!50077 0))(
  ( (Unit!50078) )
))
(declare-fun lt!652929 () Unit!50077)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50077)

(assert (=> b!1501253 (= lt!652929 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652930 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501254 () Bool)

(declare-fun res!1022516 () Bool)

(assert (=> b!1501254 (=> (not res!1022516) (not e!839772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100099 (_ BitVec 32)) Bool)

(assert (=> b!1501254 (= res!1022516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501255 () Bool)

(assert (=> b!1501255 (= e!839772 e!839773)))

(declare-fun res!1022520 () Bool)

(assert (=> b!1501255 (=> (not res!1022520) (not e!839773))))

(assert (=> b!1501255 (= res!1022520 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661) lt!652928))))

(assert (=> b!1501255 (= lt!652928 (Found!12541 j!87))))

(declare-fun b!1501256 () Bool)

(declare-fun res!1022523 () Bool)

(assert (=> b!1501256 (=> (not res!1022523) (not e!839772))))

(assert (=> b!1501256 (= res!1022523 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48862 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48862 a!2850)) (= (select (arr!48310 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48310 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48862 a!2850))))))

(declare-fun b!1501257 () Bool)

(declare-fun res!1022515 () Bool)

(assert (=> b!1501257 (=> (not res!1022515) (not e!839772))))

(assert (=> b!1501257 (= res!1022515 (validKeyInArray!0 (select (arr!48310 a!2850) j!87)))))

(declare-fun b!1501258 () Bool)

(declare-fun res!1022517 () Bool)

(assert (=> b!1501258 (=> (not res!1022517) (not e!839772))))

(declare-datatypes ((List!34880 0))(
  ( (Nil!34877) (Cons!34876 (h!36274 (_ BitVec 64)) (t!49566 List!34880)) )
))
(declare-fun arrayNoDuplicates!0 (array!100099 (_ BitVec 32) List!34880) Bool)

(assert (=> b!1501258 (= res!1022517 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34877))))

(declare-fun b!1501259 () Bool)

(assert (=> b!1501259 (= e!839773 e!839775)))

(declare-fun res!1022522 () Bool)

(assert (=> b!1501259 (=> (not res!1022522) (not e!839775))))

(assert (=> b!1501259 (= res!1022522 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652930 #b00000000000000000000000000000000) (bvslt lt!652930 (size!48862 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501259 (= lt!652930 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501260 () Bool)

(declare-fun res!1022525 () Bool)

(assert (=> b!1501260 (=> (not res!1022525) (not e!839772))))

(assert (=> b!1501260 (= res!1022525 (and (= (size!48862 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48862 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48862 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501261 () Bool)

(declare-fun res!1022521 () Bool)

(assert (=> b!1501261 (=> (not res!1022521) (not e!839775))))

(assert (=> b!1501261 (= res!1022521 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652930 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661) lt!652928))))

(declare-fun res!1022518 () Bool)

(assert (=> start!127724 (=> (not res!1022518) (not e!839772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127724 (= res!1022518 (validMask!0 mask!2661))))

(assert (=> start!127724 e!839772))

(assert (=> start!127724 true))

(declare-fun array_inv!37543 (array!100099) Bool)

(assert (=> start!127724 (array_inv!37543 a!2850)))

(assert (= (and start!127724 res!1022518) b!1501260))

(assert (= (and b!1501260 res!1022525) b!1501251))

(assert (= (and b!1501251 res!1022524) b!1501257))

(assert (= (and b!1501257 res!1022515) b!1501254))

(assert (= (and b!1501254 res!1022516) b!1501258))

(assert (= (and b!1501258 res!1022517) b!1501256))

(assert (= (and b!1501256 res!1022523) b!1501255))

(assert (= (and b!1501255 res!1022520) b!1501252))

(assert (= (and b!1501252 res!1022519) b!1501259))

(assert (= (and b!1501259 res!1022522) b!1501261))

(assert (= (and b!1501261 res!1022521) b!1501253))

(declare-fun m!1383943 () Bool)

(assert (=> b!1501256 m!1383943))

(declare-fun m!1383945 () Bool)

(assert (=> b!1501256 m!1383945))

(declare-fun m!1383947 () Bool)

(assert (=> b!1501256 m!1383947))

(declare-fun m!1383949 () Bool)

(assert (=> b!1501261 m!1383949))

(assert (=> b!1501261 m!1383949))

(declare-fun m!1383951 () Bool)

(assert (=> b!1501261 m!1383951))

(declare-fun m!1383953 () Bool)

(assert (=> b!1501252 m!1383953))

(assert (=> b!1501252 m!1383949))

(assert (=> b!1501257 m!1383949))

(assert (=> b!1501257 m!1383949))

(declare-fun m!1383955 () Bool)

(assert (=> b!1501257 m!1383955))

(assert (=> b!1501255 m!1383949))

(assert (=> b!1501255 m!1383949))

(declare-fun m!1383957 () Bool)

(assert (=> b!1501255 m!1383957))

(declare-fun m!1383959 () Bool)

(assert (=> b!1501251 m!1383959))

(assert (=> b!1501251 m!1383959))

(declare-fun m!1383961 () Bool)

(assert (=> b!1501251 m!1383961))

(assert (=> b!1501253 m!1383945))

(declare-fun m!1383963 () Bool)

(assert (=> b!1501253 m!1383963))

(assert (=> b!1501253 m!1383963))

(declare-fun m!1383965 () Bool)

(assert (=> b!1501253 m!1383965))

(declare-fun m!1383967 () Bool)

(assert (=> b!1501253 m!1383967))

(declare-fun m!1383969 () Bool)

(assert (=> b!1501258 m!1383969))

(declare-fun m!1383971 () Bool)

(assert (=> b!1501259 m!1383971))

(declare-fun m!1383973 () Bool)

(assert (=> b!1501254 m!1383973))

(declare-fun m!1383975 () Bool)

(assert (=> start!127724 m!1383975))

(declare-fun m!1383977 () Bool)

(assert (=> start!127724 m!1383977))

(check-sat (not b!1501259) (not b!1501258) (not start!127724) (not b!1501253) (not b!1501251) (not b!1501255) (not b!1501254) (not b!1501261) (not b!1501257))
(check-sat)
