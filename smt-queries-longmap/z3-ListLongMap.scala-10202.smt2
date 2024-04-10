; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120200 () Bool)

(assert start!120200)

(declare-fun b!1399114 () Bool)

(declare-fun e!792084 () Bool)

(declare-fun e!792082 () Bool)

(assert (=> b!1399114 (= e!792084 (not e!792082))))

(declare-fun res!937862 () Bool)

(assert (=> b!1399114 (=> res!937862 e!792082)))

(declare-datatypes ((SeekEntryResult!10505 0))(
  ( (MissingZero!10505 (index!44394 (_ BitVec 32))) (Found!10505 (index!44395 (_ BitVec 32))) (Intermediate!10505 (undefined!11317 Bool) (index!44396 (_ BitVec 32)) (x!126040 (_ BitVec 32))) (Undefined!10505) (MissingVacant!10505 (index!44397 (_ BitVec 32))) )
))
(declare-fun lt!615334 () SeekEntryResult!10505)

(get-info :version)

(assert (=> b!1399114 (= res!937862 (or (not ((_ is Intermediate!10505) lt!615334)) (undefined!11317 lt!615334)))))

(declare-fun e!792083 () Bool)

(assert (=> b!1399114 e!792083))

(declare-fun res!937869 () Bool)

(assert (=> b!1399114 (=> (not res!937869) (not e!792083))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95672 0))(
  ( (array!95673 (arr!46188 (Array (_ BitVec 32) (_ BitVec 64))) (size!46738 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95672)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95672 (_ BitVec 32)) Bool)

(assert (=> b!1399114 (= res!937869 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47014 0))(
  ( (Unit!47015) )
))
(declare-fun lt!615337 () Unit!47014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47014)

(assert (=> b!1399114 (= lt!615337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95672 (_ BitVec 32)) SeekEntryResult!10505)

(assert (=> b!1399114 (= lt!615334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615336 (select (arr!46188 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399114 (= lt!615336 (toIndex!0 (select (arr!46188 a!2901) j!112) mask!2840))))

(declare-fun b!1399115 () Bool)

(declare-fun res!937868 () Bool)

(assert (=> b!1399115 (=> (not res!937868) (not e!792084))))

(assert (=> b!1399115 (= res!937868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399116 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95672 (_ BitVec 32)) SeekEntryResult!10505)

(assert (=> b!1399116 (= e!792083 (= (seekEntryOrOpen!0 (select (arr!46188 a!2901) j!112) a!2901 mask!2840) (Found!10505 j!112)))))

(declare-fun b!1399117 () Bool)

(declare-fun res!937870 () Bool)

(assert (=> b!1399117 (=> (not res!937870) (not e!792084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399117 (= res!937870 (validKeyInArray!0 (select (arr!46188 a!2901) j!112)))))

(declare-fun res!937867 () Bool)

(assert (=> start!120200 (=> (not res!937867) (not e!792084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120200 (= res!937867 (validMask!0 mask!2840))))

(assert (=> start!120200 e!792084))

(assert (=> start!120200 true))

(declare-fun array_inv!35216 (array!95672) Bool)

(assert (=> start!120200 (array_inv!35216 a!2901)))

(declare-fun b!1399118 () Bool)

(declare-fun e!792086 () Bool)

(assert (=> b!1399118 (= e!792082 e!792086)))

(declare-fun res!937864 () Bool)

(assert (=> b!1399118 (=> res!937864 e!792086)))

(declare-fun lt!615335 () SeekEntryResult!10505)

(assert (=> b!1399118 (= res!937864 (or (= lt!615334 lt!615335) (not ((_ is Intermediate!10505) lt!615335))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615339 () (_ BitVec 64))

(assert (=> b!1399118 (= lt!615335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615339 mask!2840) lt!615339 (array!95673 (store (arr!46188 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46738 a!2901)) mask!2840))))

(assert (=> b!1399118 (= lt!615339 (select (store (arr!46188 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399119 () Bool)

(declare-fun res!937866 () Bool)

(assert (=> b!1399119 (=> (not res!937866) (not e!792084))))

(assert (=> b!1399119 (= res!937866 (validKeyInArray!0 (select (arr!46188 a!2901) i!1037)))))

(declare-fun b!1399120 () Bool)

(assert (=> b!1399120 (= e!792086 true)))

(assert (=> b!1399120 (and (not (undefined!11317 lt!615335)) (= (index!44396 lt!615335) i!1037) (bvslt (x!126040 lt!615335) (x!126040 lt!615334)) (= (select (store (arr!46188 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44396 lt!615335)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615338 () Unit!47014)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47014)

(assert (=> b!1399120 (= lt!615338 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615336 (x!126040 lt!615334) (index!44396 lt!615334) (x!126040 lt!615335) (index!44396 lt!615335) (undefined!11317 lt!615335) mask!2840))))

(declare-fun b!1399121 () Bool)

(declare-fun res!937865 () Bool)

(assert (=> b!1399121 (=> (not res!937865) (not e!792084))))

(declare-datatypes ((List!32707 0))(
  ( (Nil!32704) (Cons!32703 (h!33948 (_ BitVec 64)) (t!47401 List!32707)) )
))
(declare-fun arrayNoDuplicates!0 (array!95672 (_ BitVec 32) List!32707) Bool)

(assert (=> b!1399121 (= res!937865 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32704))))

(declare-fun b!1399122 () Bool)

(declare-fun res!937863 () Bool)

(assert (=> b!1399122 (=> (not res!937863) (not e!792084))))

(assert (=> b!1399122 (= res!937863 (and (= (size!46738 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46738 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46738 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120200 res!937867) b!1399122))

(assert (= (and b!1399122 res!937863) b!1399119))

(assert (= (and b!1399119 res!937866) b!1399117))

(assert (= (and b!1399117 res!937870) b!1399115))

(assert (= (and b!1399115 res!937868) b!1399121))

(assert (= (and b!1399121 res!937865) b!1399114))

(assert (= (and b!1399114 res!937869) b!1399116))

(assert (= (and b!1399114 (not res!937862)) b!1399118))

(assert (= (and b!1399118 (not res!937864)) b!1399120))

(declare-fun m!1286321 () Bool)

(assert (=> b!1399114 m!1286321))

(declare-fun m!1286323 () Bool)

(assert (=> b!1399114 m!1286323))

(assert (=> b!1399114 m!1286321))

(declare-fun m!1286325 () Bool)

(assert (=> b!1399114 m!1286325))

(assert (=> b!1399114 m!1286321))

(declare-fun m!1286327 () Bool)

(assert (=> b!1399114 m!1286327))

(declare-fun m!1286329 () Bool)

(assert (=> b!1399114 m!1286329))

(declare-fun m!1286331 () Bool)

(assert (=> b!1399115 m!1286331))

(assert (=> b!1399116 m!1286321))

(assert (=> b!1399116 m!1286321))

(declare-fun m!1286333 () Bool)

(assert (=> b!1399116 m!1286333))

(declare-fun m!1286335 () Bool)

(assert (=> b!1399118 m!1286335))

(declare-fun m!1286337 () Bool)

(assert (=> b!1399118 m!1286337))

(assert (=> b!1399118 m!1286335))

(declare-fun m!1286339 () Bool)

(assert (=> b!1399118 m!1286339))

(declare-fun m!1286341 () Bool)

(assert (=> b!1399118 m!1286341))

(declare-fun m!1286343 () Bool)

(assert (=> b!1399119 m!1286343))

(assert (=> b!1399119 m!1286343))

(declare-fun m!1286345 () Bool)

(assert (=> b!1399119 m!1286345))

(declare-fun m!1286347 () Bool)

(assert (=> start!120200 m!1286347))

(declare-fun m!1286349 () Bool)

(assert (=> start!120200 m!1286349))

(assert (=> b!1399120 m!1286337))

(declare-fun m!1286351 () Bool)

(assert (=> b!1399120 m!1286351))

(declare-fun m!1286353 () Bool)

(assert (=> b!1399120 m!1286353))

(assert (=> b!1399117 m!1286321))

(assert (=> b!1399117 m!1286321))

(declare-fun m!1286355 () Bool)

(assert (=> b!1399117 m!1286355))

(declare-fun m!1286357 () Bool)

(assert (=> b!1399121 m!1286357))

(check-sat (not b!1399115) (not b!1399120) (not b!1399119) (not b!1399117) (not start!120200) (not b!1399121) (not b!1399116) (not b!1399114) (not b!1399118))
(check-sat)
