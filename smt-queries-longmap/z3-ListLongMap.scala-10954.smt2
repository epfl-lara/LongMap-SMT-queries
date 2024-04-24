; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128486 () Bool)

(assert start!128486)

(declare-fun res!1026296 () Bool)

(declare-fun e!842351 () Bool)

(assert (=> start!128486 (=> (not res!1026296) (not e!842351))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128486 (= res!1026296 (validMask!0 mask!2661))))

(assert (=> start!128486 e!842351))

(assert (=> start!128486 true))

(declare-datatypes ((array!100498 0))(
  ( (array!100499 (arr!48496 (Array (_ BitVec 32) (_ BitVec 64))) (size!49047 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100498)

(declare-fun array_inv!37777 (array!100498) Bool)

(assert (=> start!128486 (array_inv!37777 a!2850)))

(declare-fun b!1506873 () Bool)

(declare-fun res!1026287 () Bool)

(assert (=> b!1506873 (=> (not res!1026287) (not e!842351))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506873 (= res!1026287 (validKeyInArray!0 (select (arr!48496 a!2850) i!996)))))

(declare-fun b!1506874 () Bool)

(declare-fun e!842350 () Bool)

(assert (=> b!1506874 (= e!842351 e!842350)))

(declare-fun res!1026291 () Bool)

(assert (=> b!1506874 (=> (not res!1026291) (not e!842350))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12587 0))(
  ( (MissingZero!12587 (index!52740 (_ BitVec 32))) (Found!12587 (index!52741 (_ BitVec 32))) (Intermediate!12587 (undefined!13399 Bool) (index!52742 (_ BitVec 32)) (x!134626 (_ BitVec 32))) (Undefined!12587) (MissingVacant!12587 (index!52743 (_ BitVec 32))) )
))
(declare-fun lt!654540 () SeekEntryResult!12587)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100498 (_ BitVec 32)) SeekEntryResult!12587)

(assert (=> b!1506874 (= res!1026291 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48496 a!2850) j!87) a!2850 mask!2661) lt!654540))))

(assert (=> b!1506874 (= lt!654540 (Found!12587 j!87))))

(declare-fun b!1506875 () Bool)

(declare-fun res!1026293 () Bool)

(assert (=> b!1506875 (=> (not res!1026293) (not e!842351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100498 (_ BitVec 32)) Bool)

(assert (=> b!1506875 (= res!1026293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506876 () Bool)

(declare-fun res!1026290 () Bool)

(assert (=> b!1506876 (=> (not res!1026290) (not e!842351))))

(assert (=> b!1506876 (= res!1026290 (validKeyInArray!0 (select (arr!48496 a!2850) j!87)))))

(declare-fun b!1506877 () Bool)

(declare-fun res!1026295 () Bool)

(assert (=> b!1506877 (=> (not res!1026295) (not e!842351))))

(declare-datatypes ((List!34975 0))(
  ( (Nil!34972) (Cons!34971 (h!36383 (_ BitVec 64)) (t!49661 List!34975)) )
))
(declare-fun arrayNoDuplicates!0 (array!100498 (_ BitVec 32) List!34975) Bool)

(assert (=> b!1506877 (= res!1026295 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34972))))

(declare-fun b!1506878 () Bool)

(declare-fun e!842352 () Bool)

(assert (=> b!1506878 (= e!842350 e!842352)))

(declare-fun res!1026289 () Bool)

(assert (=> b!1506878 (=> (not res!1026289) (not e!842352))))

(declare-fun lt!654541 () (_ BitVec 32))

(assert (=> b!1506878 (= res!1026289 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654541 #b00000000000000000000000000000000) (bvslt lt!654541 (size!49047 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506878 (= lt!654541 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506879 () Bool)

(declare-fun res!1026286 () Bool)

(assert (=> b!1506879 (=> (not res!1026286) (not e!842350))))

(assert (=> b!1506879 (= res!1026286 (not (= (select (arr!48496 a!2850) index!625) (select (arr!48496 a!2850) j!87))))))

(declare-fun b!1506880 () Bool)

(assert (=> b!1506880 (= e!842352 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1506880 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654541 vacantAfter!10 (select (store (arr!48496 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100499 (store (arr!48496 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49047 a!2850)) mask!2661) lt!654540)))

(declare-datatypes ((Unit!50215 0))(
  ( (Unit!50216) )
))
(declare-fun lt!654539 () Unit!50215)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50215)

(assert (=> b!1506880 (= lt!654539 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654541 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1506881 () Bool)

(declare-fun res!1026288 () Bool)

(assert (=> b!1506881 (=> (not res!1026288) (not e!842351))))

(assert (=> b!1506881 (= res!1026288 (and (= (size!49047 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49047 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49047 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506882 () Bool)

(declare-fun res!1026292 () Bool)

(assert (=> b!1506882 (=> (not res!1026292) (not e!842351))))

(assert (=> b!1506882 (= res!1026292 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49047 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49047 a!2850)) (= (select (arr!48496 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48496 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49047 a!2850))))))

(declare-fun b!1506883 () Bool)

(declare-fun res!1026294 () Bool)

(assert (=> b!1506883 (=> (not res!1026294) (not e!842352))))

(assert (=> b!1506883 (= res!1026294 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654541 vacantBefore!10 (select (arr!48496 a!2850) j!87) a!2850 mask!2661) lt!654540))))

(assert (= (and start!128486 res!1026296) b!1506881))

(assert (= (and b!1506881 res!1026288) b!1506873))

(assert (= (and b!1506873 res!1026287) b!1506876))

(assert (= (and b!1506876 res!1026290) b!1506875))

(assert (= (and b!1506875 res!1026293) b!1506877))

(assert (= (and b!1506877 res!1026295) b!1506882))

(assert (= (and b!1506882 res!1026292) b!1506874))

(assert (= (and b!1506874 res!1026291) b!1506879))

(assert (= (and b!1506879 res!1026286) b!1506878))

(assert (= (and b!1506878 res!1026289) b!1506883))

(assert (= (and b!1506883 res!1026294) b!1506880))

(declare-fun m!1389939 () Bool)

(assert (=> b!1506874 m!1389939))

(assert (=> b!1506874 m!1389939))

(declare-fun m!1389941 () Bool)

(assert (=> b!1506874 m!1389941))

(declare-fun m!1389943 () Bool)

(assert (=> b!1506882 m!1389943))

(declare-fun m!1389945 () Bool)

(assert (=> b!1506882 m!1389945))

(declare-fun m!1389947 () Bool)

(assert (=> b!1506882 m!1389947))

(assert (=> b!1506880 m!1389945))

(declare-fun m!1389949 () Bool)

(assert (=> b!1506880 m!1389949))

(assert (=> b!1506880 m!1389949))

(declare-fun m!1389951 () Bool)

(assert (=> b!1506880 m!1389951))

(declare-fun m!1389953 () Bool)

(assert (=> b!1506880 m!1389953))

(declare-fun m!1389955 () Bool)

(assert (=> b!1506875 m!1389955))

(declare-fun m!1389957 () Bool)

(assert (=> start!128486 m!1389957))

(declare-fun m!1389959 () Bool)

(assert (=> start!128486 m!1389959))

(assert (=> b!1506883 m!1389939))

(assert (=> b!1506883 m!1389939))

(declare-fun m!1389961 () Bool)

(assert (=> b!1506883 m!1389961))

(declare-fun m!1389963 () Bool)

(assert (=> b!1506877 m!1389963))

(declare-fun m!1389965 () Bool)

(assert (=> b!1506878 m!1389965))

(assert (=> b!1506876 m!1389939))

(assert (=> b!1506876 m!1389939))

(declare-fun m!1389967 () Bool)

(assert (=> b!1506876 m!1389967))

(declare-fun m!1389969 () Bool)

(assert (=> b!1506873 m!1389969))

(assert (=> b!1506873 m!1389969))

(declare-fun m!1389971 () Bool)

(assert (=> b!1506873 m!1389971))

(declare-fun m!1389973 () Bool)

(assert (=> b!1506879 m!1389973))

(assert (=> b!1506879 m!1389939))

(check-sat (not b!1506878) (not b!1506877) (not b!1506875) (not b!1506874) (not b!1506876) (not b!1506883) (not b!1506873) (not b!1506880) (not start!128486))
(check-sat)
