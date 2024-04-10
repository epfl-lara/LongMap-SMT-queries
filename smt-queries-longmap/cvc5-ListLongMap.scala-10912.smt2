; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127734 () Bool)

(assert start!127734)

(declare-fun b!1500973 () Bool)

(declare-fun res!1022059 () Bool)

(declare-fun e!839755 () Bool)

(assert (=> b!1500973 (=> (not res!1022059) (not e!839755))))

(declare-datatypes ((array!100115 0))(
  ( (array!100116 (arr!48317 (Array (_ BitVec 32) (_ BitVec 64))) (size!48867 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100115)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500973 (= res!1022059 (not (= (select (arr!48317 a!2850) index!625) (select (arr!48317 a!2850) j!87))))))

(declare-fun b!1500974 () Bool)

(declare-fun res!1022052 () Bool)

(declare-fun e!839757 () Bool)

(assert (=> b!1500974 (=> (not res!1022052) (not e!839757))))

(declare-datatypes ((List!34809 0))(
  ( (Nil!34806) (Cons!34805 (h!36202 (_ BitVec 64)) (t!49503 List!34809)) )
))
(declare-fun arrayNoDuplicates!0 (array!100115 (_ BitVec 32) List!34809) Bool)

(assert (=> b!1500974 (= res!1022052 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34806))))

(declare-fun b!1500975 () Bool)

(declare-fun res!1022056 () Bool)

(assert (=> b!1500975 (=> (not res!1022056) (not e!839757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500975 (= res!1022056 (validKeyInArray!0 (select (arr!48317 a!2850) j!87)))))

(declare-fun b!1500976 () Bool)

(assert (=> b!1500976 (= e!839757 e!839755)))

(declare-fun res!1022051 () Bool)

(assert (=> b!1500976 (=> (not res!1022051) (not e!839755))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12527 0))(
  ( (MissingZero!12527 (index!52500 (_ BitVec 32))) (Found!12527 (index!52501 (_ BitVec 32))) (Intermediate!12527 (undefined!13339 Bool) (index!52502 (_ BitVec 32)) (x!134169 (_ BitVec 32))) (Undefined!12527) (MissingVacant!12527 (index!52503 (_ BitVec 32))) )
))
(declare-fun lt!653047 () SeekEntryResult!12527)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100115 (_ BitVec 32)) SeekEntryResult!12527)

(assert (=> b!1500976 (= res!1022051 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48317 a!2850) j!87) a!2850 mask!2661) lt!653047))))

(assert (=> b!1500976 (= lt!653047 (Found!12527 j!87))))

(declare-fun b!1500977 () Bool)

(declare-fun res!1022058 () Bool)

(assert (=> b!1500977 (=> (not res!1022058) (not e!839757))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500977 (= res!1022058 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48867 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48867 a!2850)) (= (select (arr!48317 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48317 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48867 a!2850))))))

(declare-fun b!1500978 () Bool)

(declare-fun res!1022057 () Bool)

(declare-fun e!839756 () Bool)

(assert (=> b!1500978 (=> (not res!1022057) (not e!839756))))

(declare-fun lt!653045 () (_ BitVec 32))

(assert (=> b!1500978 (= res!1022057 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653045 vacantBefore!10 (select (arr!48317 a!2850) j!87) a!2850 mask!2661) lt!653047))))

(declare-fun b!1500979 () Bool)

(declare-fun res!1022050 () Bool)

(assert (=> b!1500979 (=> (not res!1022050) (not e!839757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100115 (_ BitVec 32)) Bool)

(assert (=> b!1500979 (= res!1022050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500980 () Bool)

(declare-fun res!1022049 () Bool)

(assert (=> b!1500980 (=> (not res!1022049) (not e!839757))))

(assert (=> b!1500980 (= res!1022049 (validKeyInArray!0 (select (arr!48317 a!2850) i!996)))))

(declare-fun b!1500981 () Bool)

(declare-fun res!1022053 () Bool)

(assert (=> b!1500981 (=> (not res!1022053) (not e!839757))))

(assert (=> b!1500981 (= res!1022053 (and (= (size!48867 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48867 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48867 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022054 () Bool)

(assert (=> start!127734 (=> (not res!1022054) (not e!839757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127734 (= res!1022054 (validMask!0 mask!2661))))

(assert (=> start!127734 e!839757))

(assert (=> start!127734 true))

(declare-fun array_inv!37345 (array!100115) Bool)

(assert (=> start!127734 (array_inv!37345 a!2850)))

(declare-fun b!1500982 () Bool)

(assert (=> b!1500982 (= e!839755 e!839756)))

(declare-fun res!1022055 () Bool)

(assert (=> b!1500982 (=> (not res!1022055) (not e!839756))))

(assert (=> b!1500982 (= res!1022055 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653045 #b00000000000000000000000000000000) (bvslt lt!653045 (size!48867 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500982 (= lt!653045 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500983 () Bool)

(assert (=> b!1500983 (= e!839756 (not true))))

(assert (=> b!1500983 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653045 vacantAfter!10 (select (store (arr!48317 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100116 (store (arr!48317 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48867 a!2850)) mask!2661) lt!653047)))

(declare-datatypes ((Unit!50208 0))(
  ( (Unit!50209) )
))
(declare-fun lt!653046 () Unit!50208)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50208)

(assert (=> b!1500983 (= lt!653046 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653045 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!127734 res!1022054) b!1500981))

(assert (= (and b!1500981 res!1022053) b!1500980))

(assert (= (and b!1500980 res!1022049) b!1500975))

(assert (= (and b!1500975 res!1022056) b!1500979))

(assert (= (and b!1500979 res!1022050) b!1500974))

(assert (= (and b!1500974 res!1022052) b!1500977))

(assert (= (and b!1500977 res!1022058) b!1500976))

(assert (= (and b!1500976 res!1022051) b!1500973))

(assert (= (and b!1500973 res!1022059) b!1500982))

(assert (= (and b!1500982 res!1022055) b!1500978))

(assert (= (and b!1500978 res!1022057) b!1500983))

(declare-fun m!1384165 () Bool)

(assert (=> b!1500983 m!1384165))

(declare-fun m!1384167 () Bool)

(assert (=> b!1500983 m!1384167))

(assert (=> b!1500983 m!1384167))

(declare-fun m!1384169 () Bool)

(assert (=> b!1500983 m!1384169))

(declare-fun m!1384171 () Bool)

(assert (=> b!1500983 m!1384171))

(declare-fun m!1384173 () Bool)

(assert (=> b!1500973 m!1384173))

(declare-fun m!1384175 () Bool)

(assert (=> b!1500973 m!1384175))

(declare-fun m!1384177 () Bool)

(assert (=> b!1500979 m!1384177))

(declare-fun m!1384179 () Bool)

(assert (=> b!1500980 m!1384179))

(assert (=> b!1500980 m!1384179))

(declare-fun m!1384181 () Bool)

(assert (=> b!1500980 m!1384181))

(assert (=> b!1500975 m!1384175))

(assert (=> b!1500975 m!1384175))

(declare-fun m!1384183 () Bool)

(assert (=> b!1500975 m!1384183))

(declare-fun m!1384185 () Bool)

(assert (=> start!127734 m!1384185))

(declare-fun m!1384187 () Bool)

(assert (=> start!127734 m!1384187))

(declare-fun m!1384189 () Bool)

(assert (=> b!1500977 m!1384189))

(assert (=> b!1500977 m!1384165))

(declare-fun m!1384191 () Bool)

(assert (=> b!1500977 m!1384191))

(assert (=> b!1500978 m!1384175))

(assert (=> b!1500978 m!1384175))

(declare-fun m!1384193 () Bool)

(assert (=> b!1500978 m!1384193))

(declare-fun m!1384195 () Bool)

(assert (=> b!1500974 m!1384195))

(assert (=> b!1500976 m!1384175))

(assert (=> b!1500976 m!1384175))

(declare-fun m!1384197 () Bool)

(assert (=> b!1500976 m!1384197))

(declare-fun m!1384199 () Bool)

(assert (=> b!1500982 m!1384199))

(push 1)

