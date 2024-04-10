; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129122 () Bool)

(assert start!129122)

(declare-fun b!1515198 () Bool)

(declare-fun res!1035109 () Bool)

(declare-fun e!845555 () Bool)

(assert (=> b!1515198 (=> (not res!1035109) (not e!845555))))

(declare-datatypes ((array!100978 0))(
  ( (array!100979 (arr!48726 (Array (_ BitVec 32) (_ BitVec 64))) (size!49276 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100978)

(declare-datatypes ((List!35209 0))(
  ( (Nil!35206) (Cons!35205 (h!36617 (_ BitVec 64)) (t!49903 List!35209)) )
))
(declare-fun arrayNoDuplicates!0 (array!100978 (_ BitVec 32) List!35209) Bool)

(assert (=> b!1515198 (= res!1035109 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35206))))

(declare-fun b!1515199 () Bool)

(declare-fun res!1035103 () Bool)

(assert (=> b!1515199 (=> (not res!1035103) (not e!845555))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100978 (_ BitVec 32)) Bool)

(assert (=> b!1515199 (= res!1035103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515200 () Bool)

(declare-fun res!1035100 () Bool)

(assert (=> b!1515200 (=> (not res!1035100) (not e!845555))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515200 (= res!1035100 (validKeyInArray!0 (select (arr!48726 a!2804) j!70)))))

(declare-fun b!1515201 () Bool)

(declare-fun e!845560 () Bool)

(declare-fun e!845557 () Bool)

(assert (=> b!1515201 (= e!845560 e!845557)))

(declare-fun res!1035105 () Bool)

(assert (=> b!1515201 (=> res!1035105 e!845557)))

(declare-datatypes ((SeekEntryResult!12897 0))(
  ( (MissingZero!12897 (index!53983 (_ BitVec 32))) (Found!12897 (index!53984 (_ BitVec 32))) (Intermediate!12897 (undefined!13709 Bool) (index!53985 (_ BitVec 32)) (x!135687 (_ BitVec 32))) (Undefined!12897) (MissingVacant!12897 (index!53986 (_ BitVec 32))) )
))
(declare-fun lt!656682 () SeekEntryResult!12897)

(assert (=> b!1515201 (= res!1035105 (not (= lt!656682 (Found!12897 j!70))))))

(declare-fun lt!656680 () SeekEntryResult!12897)

(declare-fun lt!656687 () SeekEntryResult!12897)

(assert (=> b!1515201 (= lt!656680 lt!656687)))

(declare-fun lt!656689 () (_ BitVec 64))

(declare-fun lt!656683 () array!100978)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1515201 (= lt!656687 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656689 lt!656683 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1515201 (= lt!656680 (seekEntryOrOpen!0 lt!656689 lt!656683 mask!2512))))

(declare-fun lt!656688 () SeekEntryResult!12897)

(assert (=> b!1515201 (= lt!656688 lt!656682)))

(assert (=> b!1515201 (= lt!656682 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48726 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515201 (= lt!656688 (seekEntryOrOpen!0 (select (arr!48726 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!845559 () Bool)

(declare-fun b!1515202 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12897)

(assert (=> b!1515202 (= e!845559 (= (seekEntry!0 (select (arr!48726 a!2804) j!70) a!2804 mask!2512) (Found!12897 j!70)))))

(declare-fun b!1515203 () Bool)

(declare-fun e!845556 () Bool)

(assert (=> b!1515203 (= e!845556 (not e!845560))))

(declare-fun res!1035110 () Bool)

(assert (=> b!1515203 (=> res!1035110 e!845560)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515203 (= res!1035110 (or (not (= (select (arr!48726 a!2804) j!70) lt!656689)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48726 a!2804) index!487) (select (arr!48726 a!2804) j!70)) (not (= (select (arr!48726 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515203 e!845559))

(declare-fun res!1035112 () Bool)

(assert (=> b!1515203 (=> (not res!1035112) (not e!845559))))

(assert (=> b!1515203 (= res!1035112 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50662 0))(
  ( (Unit!50663) )
))
(declare-fun lt!656681 () Unit!50662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50662)

(assert (=> b!1515203 (= lt!656681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515204 () Bool)

(declare-fun res!1035102 () Bool)

(assert (=> b!1515204 (=> (not res!1035102) (not e!845555))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515204 (= res!1035102 (validKeyInArray!0 (select (arr!48726 a!2804) i!961)))))

(declare-fun b!1515205 () Bool)

(declare-fun res!1035107 () Bool)

(assert (=> b!1515205 (=> (not res!1035107) (not e!845555))))

(assert (=> b!1515205 (= res!1035107 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49276 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49276 a!2804))))))

(declare-fun res!1035106 () Bool)

(assert (=> start!129122 (=> (not res!1035106) (not e!845555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129122 (= res!1035106 (validMask!0 mask!2512))))

(assert (=> start!129122 e!845555))

(assert (=> start!129122 true))

(declare-fun array_inv!37754 (array!100978) Bool)

(assert (=> start!129122 (array_inv!37754 a!2804)))

(declare-fun b!1515197 () Bool)

(assert (=> b!1515197 (= e!845557 (bvsge mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515197 (= lt!656687 lt!656682)))

(declare-fun lt!656685 () Unit!50662)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50662)

(assert (=> b!1515197 (= lt!656685 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515206 () Bool)

(declare-fun e!845558 () Bool)

(assert (=> b!1515206 (= e!845555 e!845558)))

(declare-fun res!1035101 () Bool)

(assert (=> b!1515206 (=> (not res!1035101) (not e!845558))))

(declare-fun lt!656684 () SeekEntryResult!12897)

(declare-fun lt!656686 () SeekEntryResult!12897)

(assert (=> b!1515206 (= res!1035101 (= lt!656684 lt!656686))))

(assert (=> b!1515206 (= lt!656686 (Intermediate!12897 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100978 (_ BitVec 32)) SeekEntryResult!12897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515206 (= lt!656684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48726 a!2804) j!70) mask!2512) (select (arr!48726 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515207 () Bool)

(assert (=> b!1515207 (= e!845558 e!845556)))

(declare-fun res!1035104 () Bool)

(assert (=> b!1515207 (=> (not res!1035104) (not e!845556))))

(assert (=> b!1515207 (= res!1035104 (= lt!656684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656689 mask!2512) lt!656689 lt!656683 mask!2512)))))

(assert (=> b!1515207 (= lt!656689 (select (store (arr!48726 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515207 (= lt!656683 (array!100979 (store (arr!48726 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49276 a!2804)))))

(declare-fun b!1515208 () Bool)

(declare-fun res!1035111 () Bool)

(assert (=> b!1515208 (=> (not res!1035111) (not e!845555))))

(assert (=> b!1515208 (= res!1035111 (and (= (size!49276 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49276 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49276 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515209 () Bool)

(declare-fun res!1035108 () Bool)

(assert (=> b!1515209 (=> (not res!1035108) (not e!845558))))

(assert (=> b!1515209 (= res!1035108 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48726 a!2804) j!70) a!2804 mask!2512) lt!656686))))

(assert (= (and start!129122 res!1035106) b!1515208))

(assert (= (and b!1515208 res!1035111) b!1515204))

(assert (= (and b!1515204 res!1035102) b!1515200))

(assert (= (and b!1515200 res!1035100) b!1515199))

(assert (= (and b!1515199 res!1035103) b!1515198))

(assert (= (and b!1515198 res!1035109) b!1515205))

(assert (= (and b!1515205 res!1035107) b!1515206))

(assert (= (and b!1515206 res!1035101) b!1515209))

(assert (= (and b!1515209 res!1035108) b!1515207))

(assert (= (and b!1515207 res!1035104) b!1515203))

(assert (= (and b!1515203 res!1035112) b!1515202))

(assert (= (and b!1515203 (not res!1035110)) b!1515201))

(assert (= (and b!1515201 (not res!1035105)) b!1515197))

(declare-fun m!1398247 () Bool)

(assert (=> b!1515199 m!1398247))

(declare-fun m!1398249 () Bool)

(assert (=> b!1515203 m!1398249))

(declare-fun m!1398251 () Bool)

(assert (=> b!1515203 m!1398251))

(declare-fun m!1398253 () Bool)

(assert (=> b!1515203 m!1398253))

(declare-fun m!1398255 () Bool)

(assert (=> b!1515203 m!1398255))

(declare-fun m!1398257 () Bool)

(assert (=> b!1515201 m!1398257))

(assert (=> b!1515201 m!1398249))

(declare-fun m!1398259 () Bool)

(assert (=> b!1515201 m!1398259))

(assert (=> b!1515201 m!1398249))

(declare-fun m!1398261 () Bool)

(assert (=> b!1515201 m!1398261))

(assert (=> b!1515201 m!1398249))

(declare-fun m!1398263 () Bool)

(assert (=> b!1515201 m!1398263))

(assert (=> b!1515206 m!1398249))

(assert (=> b!1515206 m!1398249))

(declare-fun m!1398265 () Bool)

(assert (=> b!1515206 m!1398265))

(assert (=> b!1515206 m!1398265))

(assert (=> b!1515206 m!1398249))

(declare-fun m!1398267 () Bool)

(assert (=> b!1515206 m!1398267))

(declare-fun m!1398269 () Bool)

(assert (=> b!1515207 m!1398269))

(assert (=> b!1515207 m!1398269))

(declare-fun m!1398271 () Bool)

(assert (=> b!1515207 m!1398271))

(declare-fun m!1398273 () Bool)

(assert (=> b!1515207 m!1398273))

(declare-fun m!1398275 () Bool)

(assert (=> b!1515207 m!1398275))

(assert (=> b!1515200 m!1398249))

(assert (=> b!1515200 m!1398249))

(declare-fun m!1398277 () Bool)

(assert (=> b!1515200 m!1398277))

(assert (=> b!1515209 m!1398249))

(assert (=> b!1515209 m!1398249))

(declare-fun m!1398279 () Bool)

(assert (=> b!1515209 m!1398279))

(declare-fun m!1398281 () Bool)

(assert (=> b!1515198 m!1398281))

(declare-fun m!1398283 () Bool)

(assert (=> b!1515197 m!1398283))

(assert (=> b!1515202 m!1398249))

(assert (=> b!1515202 m!1398249))

(declare-fun m!1398285 () Bool)

(assert (=> b!1515202 m!1398285))

(declare-fun m!1398287 () Bool)

(assert (=> start!129122 m!1398287))

(declare-fun m!1398289 () Bool)

(assert (=> start!129122 m!1398289))

(declare-fun m!1398291 () Bool)

(assert (=> b!1515204 m!1398291))

(assert (=> b!1515204 m!1398291))

(declare-fun m!1398293 () Bool)

(assert (=> b!1515204 m!1398293))

(check-sat (not b!1515206) (not b!1515200) (not b!1515209) (not b!1515204) (not start!129122) (not b!1515207) (not b!1515197) (not b!1515203) (not b!1515198) (not b!1515201) (not b!1515199) (not b!1515202))
(check-sat)
