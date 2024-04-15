; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121580 () Bool)

(assert start!121580)

(declare-fun b!1412295 () Bool)

(declare-fun e!799225 () Bool)

(declare-fun e!799226 () Bool)

(assert (=> b!1412295 (= e!799225 e!799226)))

(declare-fun res!949343 () Bool)

(assert (=> b!1412295 (=> res!949343 e!799226)))

(declare-datatypes ((SeekEntryResult!10910 0))(
  ( (MissingZero!10910 (index!46020 (_ BitVec 32))) (Found!10910 (index!46021 (_ BitVec 32))) (Intermediate!10910 (undefined!11722 Bool) (index!46022 (_ BitVec 32)) (x!127610 (_ BitVec 32))) (Undefined!10910) (MissingVacant!10910 (index!46023 (_ BitVec 32))) )
))
(declare-fun lt!622101 () SeekEntryResult!10910)

(declare-fun lt!622102 () SeekEntryResult!10910)

(get-info :version)

(assert (=> b!1412295 (= res!949343 (or (= lt!622101 lt!622102) (not ((_ is Intermediate!10910) lt!622102))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96471 0))(
  ( (array!96472 (arr!46573 (Array (_ BitVec 32) (_ BitVec 64))) (size!47125 (_ BitVec 32))) )
))
(declare-fun lt!622103 () array!96471)

(declare-fun lt!622105 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96471 (_ BitVec 32)) SeekEntryResult!10910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412295 (= lt!622102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622105 mask!2840) lt!622105 lt!622103 mask!2840))))

(declare-fun a!2901 () array!96471)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412295 (= lt!622105 (select (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412295 (= lt!622103 (array!96472 (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47125 a!2901)))))

(declare-fun e!799228 () Bool)

(declare-fun b!1412296 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96471 (_ BitVec 32)) SeekEntryResult!10910)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96471 (_ BitVec 32)) SeekEntryResult!10910)

(assert (=> b!1412296 (= e!799228 (= (seekEntryOrOpen!0 lt!622105 lt!622103 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127610 lt!622102) (index!46022 lt!622102) (index!46022 lt!622102) (select (arr!46573 a!2901) j!112) lt!622103 mask!2840)))))

(declare-fun b!1412297 () Bool)

(declare-fun res!949340 () Bool)

(declare-fun e!799224 () Bool)

(assert (=> b!1412297 (=> (not res!949340) (not e!799224))))

(declare-datatypes ((List!33170 0))(
  ( (Nil!33167) (Cons!33166 (h!34441 (_ BitVec 64)) (t!47856 List!33170)) )
))
(declare-fun arrayNoDuplicates!0 (array!96471 (_ BitVec 32) List!33170) Bool)

(assert (=> b!1412297 (= res!949340 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33167))))

(declare-fun e!799229 () Bool)

(declare-fun b!1412299 () Bool)

(assert (=> b!1412299 (= e!799229 (= (seekEntryOrOpen!0 (select (arr!46573 a!2901) j!112) a!2901 mask!2840) (Found!10910 j!112)))))

(declare-fun b!1412300 () Bool)

(assert (=> b!1412300 (= e!799224 (not e!799225))))

(declare-fun res!949345 () Bool)

(assert (=> b!1412300 (=> res!949345 e!799225)))

(assert (=> b!1412300 (= res!949345 (or (not ((_ is Intermediate!10910) lt!622101)) (undefined!11722 lt!622101)))))

(assert (=> b!1412300 e!799229))

(declare-fun res!949342 () Bool)

(assert (=> b!1412300 (=> (not res!949342) (not e!799229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96471 (_ BitVec 32)) Bool)

(assert (=> b!1412300 (= res!949342 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47637 0))(
  ( (Unit!47638) )
))
(declare-fun lt!622100 () Unit!47637)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47637)

(assert (=> b!1412300 (= lt!622100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622106 () (_ BitVec 32))

(assert (=> b!1412300 (= lt!622101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622106 (select (arr!46573 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412300 (= lt!622106 (toIndex!0 (select (arr!46573 a!2901) j!112) mask!2840))))

(declare-fun b!1412301 () Bool)

(declare-fun res!949336 () Bool)

(assert (=> b!1412301 (=> (not res!949336) (not e!799224))))

(assert (=> b!1412301 (= res!949336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412302 () Bool)

(assert (=> b!1412302 (= e!799226 true)))

(assert (=> b!1412302 e!799228))

(declare-fun res!949341 () Bool)

(assert (=> b!1412302 (=> (not res!949341) (not e!799228))))

(assert (=> b!1412302 (= res!949341 (and (not (undefined!11722 lt!622102)) (= (index!46022 lt!622102) i!1037) (bvslt (x!127610 lt!622102) (x!127610 lt!622101)) (= (select (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46022 lt!622102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622104 () Unit!47637)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47637)

(assert (=> b!1412302 (= lt!622104 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622106 (x!127610 lt!622101) (index!46022 lt!622101) (x!127610 lt!622102) (index!46022 lt!622102) (undefined!11722 lt!622102) mask!2840))))

(declare-fun b!1412303 () Bool)

(declare-fun res!949337 () Bool)

(assert (=> b!1412303 (=> (not res!949337) (not e!799224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412303 (= res!949337 (validKeyInArray!0 (select (arr!46573 a!2901) i!1037)))))

(declare-fun b!1412304 () Bool)

(declare-fun res!949344 () Bool)

(assert (=> b!1412304 (=> (not res!949344) (not e!799224))))

(assert (=> b!1412304 (= res!949344 (validKeyInArray!0 (select (arr!46573 a!2901) j!112)))))

(declare-fun res!949338 () Bool)

(assert (=> start!121580 (=> (not res!949338) (not e!799224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121580 (= res!949338 (validMask!0 mask!2840))))

(assert (=> start!121580 e!799224))

(assert (=> start!121580 true))

(declare-fun array_inv!35806 (array!96471) Bool)

(assert (=> start!121580 (array_inv!35806 a!2901)))

(declare-fun b!1412298 () Bool)

(declare-fun res!949339 () Bool)

(assert (=> b!1412298 (=> (not res!949339) (not e!799224))))

(assert (=> b!1412298 (= res!949339 (and (= (size!47125 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47125 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47125 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121580 res!949338) b!1412298))

(assert (= (and b!1412298 res!949339) b!1412303))

(assert (= (and b!1412303 res!949337) b!1412304))

(assert (= (and b!1412304 res!949344) b!1412301))

(assert (= (and b!1412301 res!949336) b!1412297))

(assert (= (and b!1412297 res!949340) b!1412300))

(assert (= (and b!1412300 res!949342) b!1412299))

(assert (= (and b!1412300 (not res!949345)) b!1412295))

(assert (= (and b!1412295 (not res!949343)) b!1412302))

(assert (= (and b!1412302 res!949341) b!1412296))

(declare-fun m!1301839 () Bool)

(assert (=> b!1412299 m!1301839))

(assert (=> b!1412299 m!1301839))

(declare-fun m!1301841 () Bool)

(assert (=> b!1412299 m!1301841))

(assert (=> b!1412300 m!1301839))

(declare-fun m!1301843 () Bool)

(assert (=> b!1412300 m!1301843))

(assert (=> b!1412300 m!1301839))

(assert (=> b!1412300 m!1301839))

(declare-fun m!1301845 () Bool)

(assert (=> b!1412300 m!1301845))

(declare-fun m!1301847 () Bool)

(assert (=> b!1412300 m!1301847))

(declare-fun m!1301849 () Bool)

(assert (=> b!1412300 m!1301849))

(declare-fun m!1301851 () Bool)

(assert (=> b!1412302 m!1301851))

(declare-fun m!1301853 () Bool)

(assert (=> b!1412302 m!1301853))

(declare-fun m!1301855 () Bool)

(assert (=> b!1412302 m!1301855))

(declare-fun m!1301857 () Bool)

(assert (=> b!1412297 m!1301857))

(assert (=> b!1412304 m!1301839))

(assert (=> b!1412304 m!1301839))

(declare-fun m!1301859 () Bool)

(assert (=> b!1412304 m!1301859))

(declare-fun m!1301861 () Bool)

(assert (=> b!1412303 m!1301861))

(assert (=> b!1412303 m!1301861))

(declare-fun m!1301863 () Bool)

(assert (=> b!1412303 m!1301863))

(declare-fun m!1301865 () Bool)

(assert (=> b!1412295 m!1301865))

(assert (=> b!1412295 m!1301865))

(declare-fun m!1301867 () Bool)

(assert (=> b!1412295 m!1301867))

(assert (=> b!1412295 m!1301851))

(declare-fun m!1301869 () Bool)

(assert (=> b!1412295 m!1301869))

(declare-fun m!1301871 () Bool)

(assert (=> b!1412296 m!1301871))

(assert (=> b!1412296 m!1301839))

(assert (=> b!1412296 m!1301839))

(declare-fun m!1301873 () Bool)

(assert (=> b!1412296 m!1301873))

(declare-fun m!1301875 () Bool)

(assert (=> b!1412301 m!1301875))

(declare-fun m!1301877 () Bool)

(assert (=> start!121580 m!1301877))

(declare-fun m!1301879 () Bool)

(assert (=> start!121580 m!1301879))

(check-sat (not b!1412297) (not b!1412301) (not b!1412299) (not b!1412295) (not b!1412302) (not start!121580) (not b!1412300) (not b!1412303) (not b!1412296) (not b!1412304))
(check-sat)
