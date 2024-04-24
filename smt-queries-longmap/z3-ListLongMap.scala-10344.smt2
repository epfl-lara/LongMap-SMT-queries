; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121802 () Bool)

(assert start!121802)

(declare-fun b!1413966 () Bool)

(declare-fun res!950275 () Bool)

(declare-fun e!800276 () Bool)

(assert (=> b!1413966 (=> (not res!950275) (not e!800276))))

(declare-datatypes ((array!96662 0))(
  ( (array!96663 (arr!46666 (Array (_ BitVec 32) (_ BitVec 64))) (size!47217 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96662)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96662 (_ BitVec 32)) Bool)

(assert (=> b!1413966 (= res!950275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413967 () Bool)

(declare-fun res!950273 () Bool)

(assert (=> b!1413967 (=> (not res!950273) (not e!800276))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413967 (= res!950273 (validKeyInArray!0 (select (arr!46666 a!2901) i!1037)))))

(declare-fun b!1413968 () Bool)

(declare-fun e!800272 () Bool)

(declare-fun e!800271 () Bool)

(assert (=> b!1413968 (= e!800272 e!800271)))

(declare-fun res!950276 () Bool)

(assert (=> b!1413968 (=> res!950276 e!800271)))

(declare-datatypes ((SeekEntryResult!10880 0))(
  ( (MissingZero!10880 (index!45900 (_ BitVec 32))) (Found!10880 (index!45901 (_ BitVec 32))) (Intermediate!10880 (undefined!11692 Bool) (index!45902 (_ BitVec 32)) (x!127642 (_ BitVec 32))) (Undefined!10880) (MissingVacant!10880 (index!45903 (_ BitVec 32))) )
))
(declare-fun lt!623007 () SeekEntryResult!10880)

(declare-fun lt!623005 () SeekEntryResult!10880)

(get-info :version)

(assert (=> b!1413968 (= res!950276 (or (= lt!623007 lt!623005) (not ((_ is Intermediate!10880) lt!623005))))))

(declare-fun lt!623008 () (_ BitVec 64))

(declare-fun lt!623003 () array!96662)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413968 (= lt!623005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623008 mask!2840) lt!623008 lt!623003 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413968 (= lt!623008 (select (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413968 (= lt!623003 (array!96663 (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)))))

(declare-fun res!950278 () Bool)

(assert (=> start!121802 (=> (not res!950278) (not e!800276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121802 (= res!950278 (validMask!0 mask!2840))))

(assert (=> start!121802 e!800276))

(assert (=> start!121802 true))

(declare-fun array_inv!35947 (array!96662) Bool)

(assert (=> start!121802 (array_inv!35947 a!2901)))

(declare-fun b!1413969 () Bool)

(declare-fun res!950279 () Bool)

(assert (=> b!1413969 (=> (not res!950279) (not e!800276))))

(assert (=> b!1413969 (= res!950279 (validKeyInArray!0 (select (arr!46666 a!2901) j!112)))))

(declare-fun b!1413970 () Bool)

(assert (=> b!1413970 (= e!800271 true)))

(declare-fun e!800273 () Bool)

(assert (=> b!1413970 e!800273))

(declare-fun res!950281 () Bool)

(assert (=> b!1413970 (=> (not res!950281) (not e!800273))))

(assert (=> b!1413970 (= res!950281 (and (not (undefined!11692 lt!623005)) (= (index!45902 lt!623005) i!1037) (bvslt (x!127642 lt!623005) (x!127642 lt!623007)) (= (select (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45902 lt!623005)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47761 0))(
  ( (Unit!47762) )
))
(declare-fun lt!623009 () Unit!47761)

(declare-fun lt!623004 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47761)

(assert (=> b!1413970 (= lt!623009 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623004 (x!127642 lt!623007) (index!45902 lt!623007) (x!127642 lt!623005) (index!45902 lt!623005) (undefined!11692 lt!623005) mask!2840))))

(declare-fun b!1413971 () Bool)

(assert (=> b!1413971 (= e!800276 (not e!800272))))

(declare-fun res!950272 () Bool)

(assert (=> b!1413971 (=> res!950272 e!800272)))

(assert (=> b!1413971 (= res!950272 (or (not ((_ is Intermediate!10880) lt!623007)) (undefined!11692 lt!623007)))))

(declare-fun e!800275 () Bool)

(assert (=> b!1413971 e!800275))

(declare-fun res!950277 () Bool)

(assert (=> b!1413971 (=> (not res!950277) (not e!800275))))

(assert (=> b!1413971 (= res!950277 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623006 () Unit!47761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47761)

(assert (=> b!1413971 (= lt!623006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413971 (= lt!623007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623004 (select (arr!46666 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413971 (= lt!623004 (toIndex!0 (select (arr!46666 a!2901) j!112) mask!2840))))

(declare-fun b!1413972 () Bool)

(declare-fun res!950274 () Bool)

(assert (=> b!1413972 (=> (not res!950274) (not e!800276))))

(assert (=> b!1413972 (= res!950274 (and (= (size!47217 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47217 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47217 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413973 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10880)

(assert (=> b!1413973 (= e!800275 (= (seekEntryOrOpen!0 (select (arr!46666 a!2901) j!112) a!2901 mask!2840) (Found!10880 j!112)))))

(declare-fun b!1413974 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96662 (_ BitVec 32)) SeekEntryResult!10880)

(assert (=> b!1413974 (= e!800273 (= (seekEntryOrOpen!0 lt!623008 lt!623003 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127642 lt!623005) (index!45902 lt!623005) (index!45902 lt!623005) (select (arr!46666 a!2901) j!112) lt!623003 mask!2840)))))

(declare-fun b!1413975 () Bool)

(declare-fun res!950280 () Bool)

(assert (=> b!1413975 (=> (not res!950280) (not e!800276))))

(declare-datatypes ((List!33172 0))(
  ( (Nil!33169) (Cons!33168 (h!34451 (_ BitVec 64)) (t!47858 List!33172)) )
))
(declare-fun arrayNoDuplicates!0 (array!96662 (_ BitVec 32) List!33172) Bool)

(assert (=> b!1413975 (= res!950280 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33169))))

(assert (= (and start!121802 res!950278) b!1413972))

(assert (= (and b!1413972 res!950274) b!1413967))

(assert (= (and b!1413967 res!950273) b!1413969))

(assert (= (and b!1413969 res!950279) b!1413966))

(assert (= (and b!1413966 res!950275) b!1413975))

(assert (= (and b!1413975 res!950280) b!1413971))

(assert (= (and b!1413971 res!950277) b!1413973))

(assert (= (and b!1413971 (not res!950272)) b!1413968))

(assert (= (and b!1413968 (not res!950276)) b!1413970))

(assert (= (and b!1413970 res!950281) b!1413974))

(declare-fun m!1304377 () Bool)

(assert (=> b!1413974 m!1304377))

(declare-fun m!1304379 () Bool)

(assert (=> b!1413974 m!1304379))

(assert (=> b!1413974 m!1304379))

(declare-fun m!1304381 () Bool)

(assert (=> b!1413974 m!1304381))

(declare-fun m!1304383 () Bool)

(assert (=> b!1413967 m!1304383))

(assert (=> b!1413967 m!1304383))

(declare-fun m!1304385 () Bool)

(assert (=> b!1413967 m!1304385))

(declare-fun m!1304387 () Bool)

(assert (=> b!1413968 m!1304387))

(assert (=> b!1413968 m!1304387))

(declare-fun m!1304389 () Bool)

(assert (=> b!1413968 m!1304389))

(declare-fun m!1304391 () Bool)

(assert (=> b!1413968 m!1304391))

(declare-fun m!1304393 () Bool)

(assert (=> b!1413968 m!1304393))

(assert (=> b!1413971 m!1304379))

(declare-fun m!1304395 () Bool)

(assert (=> b!1413971 m!1304395))

(assert (=> b!1413971 m!1304379))

(assert (=> b!1413971 m!1304379))

(declare-fun m!1304397 () Bool)

(assert (=> b!1413971 m!1304397))

(declare-fun m!1304399 () Bool)

(assert (=> b!1413971 m!1304399))

(declare-fun m!1304401 () Bool)

(assert (=> b!1413971 m!1304401))

(assert (=> b!1413970 m!1304391))

(declare-fun m!1304403 () Bool)

(assert (=> b!1413970 m!1304403))

(declare-fun m!1304405 () Bool)

(assert (=> b!1413970 m!1304405))

(assert (=> b!1413973 m!1304379))

(assert (=> b!1413973 m!1304379))

(declare-fun m!1304407 () Bool)

(assert (=> b!1413973 m!1304407))

(declare-fun m!1304409 () Bool)

(assert (=> start!121802 m!1304409))

(declare-fun m!1304411 () Bool)

(assert (=> start!121802 m!1304411))

(declare-fun m!1304413 () Bool)

(assert (=> b!1413975 m!1304413))

(assert (=> b!1413969 m!1304379))

(assert (=> b!1413969 m!1304379))

(declare-fun m!1304415 () Bool)

(assert (=> b!1413969 m!1304415))

(declare-fun m!1304417 () Bool)

(assert (=> b!1413966 m!1304417))

(check-sat (not b!1413968) (not b!1413971) (not start!121802) (not b!1413967) (not b!1413966) (not b!1413969) (not b!1413975) (not b!1413974) (not b!1413970) (not b!1413973))
(check-sat)
