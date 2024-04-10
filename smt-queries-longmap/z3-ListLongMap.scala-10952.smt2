; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128174 () Bool)

(assert start!128174)

(declare-fun b!1504876 () Bool)

(declare-fun res!1025470 () Bool)

(declare-fun e!841153 () Bool)

(assert (=> b!1504876 (=> (not res!1025470) (not e!841153))))

(declare-datatypes ((array!100372 0))(
  ( (array!100373 (arr!48438 (Array (_ BitVec 32) (_ BitVec 64))) (size!48988 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100372)

(declare-datatypes ((List!34930 0))(
  ( (Nil!34927) (Cons!34926 (h!36323 (_ BitVec 64)) (t!49624 List!34930)) )
))
(declare-fun arrayNoDuplicates!0 (array!100372 (_ BitVec 32) List!34930) Bool)

(assert (=> b!1504876 (= res!1025470 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34927))))

(declare-fun b!1504877 () Bool)

(declare-fun e!841156 () Bool)

(assert (=> b!1504877 (= e!841156 (not true))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653831 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12636 0))(
  ( (MissingZero!12636 (index!52936 (_ BitVec 32))) (Found!12636 (index!52937 (_ BitVec 32))) (Intermediate!12636 (undefined!13448 Bool) (index!52938 (_ BitVec 32)) (x!134622 (_ BitVec 32))) (Undefined!12636) (MissingVacant!12636 (index!52939 (_ BitVec 32))) )
))
(declare-fun lt!653832 () SeekEntryResult!12636)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100372 (_ BitVec 32)) SeekEntryResult!12636)

(assert (=> b!1504877 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653831 vacantAfter!10 (select (store (arr!48438 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100373 (store (arr!48438 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48988 a!2850)) mask!2661) lt!653832)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50278 0))(
  ( (Unit!50279) )
))
(declare-fun lt!653833 () Unit!50278)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50278)

(assert (=> b!1504877 (= lt!653833 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653831 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun res!1025474 () Bool)

(assert (=> start!128174 (=> (not res!1025474) (not e!841153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128174 (= res!1025474 (validMask!0 mask!2661))))

(assert (=> start!128174 e!841153))

(assert (=> start!128174 true))

(declare-fun array_inv!37466 (array!100372) Bool)

(assert (=> start!128174 (array_inv!37466 a!2850)))

(declare-fun b!1504878 () Bool)

(declare-fun e!841155 () Bool)

(assert (=> b!1504878 (= e!841155 e!841156)))

(declare-fun res!1025466 () Bool)

(assert (=> b!1504878 (=> (not res!1025466) (not e!841156))))

(assert (=> b!1504878 (= res!1025466 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653831 #b00000000000000000000000000000000) (bvslt lt!653831 (size!48988 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504878 (= lt!653831 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504879 () Bool)

(declare-fun res!1025467 () Bool)

(assert (=> b!1504879 (=> (not res!1025467) (not e!841155))))

(assert (=> b!1504879 (= res!1025467 (not (= (select (arr!48438 a!2850) index!625) (select (arr!48438 a!2850) j!87))))))

(declare-fun b!1504880 () Bool)

(declare-fun res!1025471 () Bool)

(assert (=> b!1504880 (=> (not res!1025471) (not e!841153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100372 (_ BitVec 32)) Bool)

(assert (=> b!1504880 (= res!1025471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504881 () Bool)

(declare-fun res!1025473 () Bool)

(assert (=> b!1504881 (=> (not res!1025473) (not e!841156))))

(assert (=> b!1504881 (= res!1025473 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653831 vacantBefore!10 (select (arr!48438 a!2850) j!87) a!2850 mask!2661) lt!653832))))

(declare-fun b!1504882 () Bool)

(declare-fun res!1025468 () Bool)

(assert (=> b!1504882 (=> (not res!1025468) (not e!841153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504882 (= res!1025468 (validKeyInArray!0 (select (arr!48438 a!2850) i!996)))))

(declare-fun b!1504883 () Bool)

(declare-fun res!1025469 () Bool)

(assert (=> b!1504883 (=> (not res!1025469) (not e!841153))))

(assert (=> b!1504883 (= res!1025469 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48988 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48988 a!2850)) (= (select (arr!48438 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48438 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48988 a!2850))))))

(declare-fun b!1504884 () Bool)

(declare-fun res!1025472 () Bool)

(assert (=> b!1504884 (=> (not res!1025472) (not e!841153))))

(assert (=> b!1504884 (= res!1025472 (and (= (size!48988 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48988 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48988 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504885 () Bool)

(assert (=> b!1504885 (= e!841153 e!841155)))

(declare-fun res!1025476 () Bool)

(assert (=> b!1504885 (=> (not res!1025476) (not e!841155))))

(assert (=> b!1504885 (= res!1025476 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48438 a!2850) j!87) a!2850 mask!2661) lt!653832))))

(assert (=> b!1504885 (= lt!653832 (Found!12636 j!87))))

(declare-fun b!1504886 () Bool)

(declare-fun res!1025475 () Bool)

(assert (=> b!1504886 (=> (not res!1025475) (not e!841153))))

(assert (=> b!1504886 (= res!1025475 (validKeyInArray!0 (select (arr!48438 a!2850) j!87)))))

(assert (= (and start!128174 res!1025474) b!1504884))

(assert (= (and b!1504884 res!1025472) b!1504882))

(assert (= (and b!1504882 res!1025468) b!1504886))

(assert (= (and b!1504886 res!1025475) b!1504880))

(assert (= (and b!1504880 res!1025471) b!1504876))

(assert (= (and b!1504876 res!1025470) b!1504883))

(assert (= (and b!1504883 res!1025469) b!1504885))

(assert (= (and b!1504885 res!1025476) b!1504879))

(assert (= (and b!1504879 res!1025467) b!1504878))

(assert (= (and b!1504878 res!1025466) b!1504881))

(assert (= (and b!1504881 res!1025473) b!1504877))

(declare-fun m!1387969 () Bool)

(assert (=> b!1504876 m!1387969))

(declare-fun m!1387971 () Bool)

(assert (=> b!1504879 m!1387971))

(declare-fun m!1387973 () Bool)

(assert (=> b!1504879 m!1387973))

(declare-fun m!1387975 () Bool)

(assert (=> b!1504877 m!1387975))

(declare-fun m!1387977 () Bool)

(assert (=> b!1504877 m!1387977))

(assert (=> b!1504877 m!1387977))

(declare-fun m!1387979 () Bool)

(assert (=> b!1504877 m!1387979))

(declare-fun m!1387981 () Bool)

(assert (=> b!1504877 m!1387981))

(assert (=> b!1504881 m!1387973))

(assert (=> b!1504881 m!1387973))

(declare-fun m!1387983 () Bool)

(assert (=> b!1504881 m!1387983))

(declare-fun m!1387985 () Bool)

(assert (=> b!1504880 m!1387985))

(declare-fun m!1387987 () Bool)

(assert (=> b!1504883 m!1387987))

(assert (=> b!1504883 m!1387975))

(declare-fun m!1387989 () Bool)

(assert (=> b!1504883 m!1387989))

(declare-fun m!1387991 () Bool)

(assert (=> start!128174 m!1387991))

(declare-fun m!1387993 () Bool)

(assert (=> start!128174 m!1387993))

(declare-fun m!1387995 () Bool)

(assert (=> b!1504882 m!1387995))

(assert (=> b!1504882 m!1387995))

(declare-fun m!1387997 () Bool)

(assert (=> b!1504882 m!1387997))

(declare-fun m!1387999 () Bool)

(assert (=> b!1504878 m!1387999))

(assert (=> b!1504886 m!1387973))

(assert (=> b!1504886 m!1387973))

(declare-fun m!1388001 () Bool)

(assert (=> b!1504886 m!1388001))

(assert (=> b!1504885 m!1387973))

(assert (=> b!1504885 m!1387973))

(declare-fun m!1388003 () Bool)

(assert (=> b!1504885 m!1388003))

(check-sat (not b!1504885) (not b!1504882) (not b!1504878) (not b!1504876) (not start!128174) (not b!1504886) (not b!1504880) (not b!1504881) (not b!1504877))
(check-sat)
