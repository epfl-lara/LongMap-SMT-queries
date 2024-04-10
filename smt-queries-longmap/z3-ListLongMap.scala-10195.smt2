; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120098 () Bool)

(assert start!120098)

(declare-fun b!1398288 () Bool)

(declare-fun res!937205 () Bool)

(declare-fun e!791606 () Bool)

(assert (=> b!1398288 (=> (not res!937205) (not e!791606))))

(declare-datatypes ((array!95627 0))(
  ( (array!95628 (arr!46167 (Array (_ BitVec 32) (_ BitVec 64))) (size!46717 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95627)

(declare-datatypes ((List!32686 0))(
  ( (Nil!32683) (Cons!32682 (h!33924 (_ BitVec 64)) (t!47380 List!32686)) )
))
(declare-fun arrayNoDuplicates!0 (array!95627 (_ BitVec 32) List!32686) Bool)

(assert (=> b!1398288 (= res!937205 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32683))))

(declare-fun b!1398289 () Bool)

(declare-fun res!937204 () Bool)

(assert (=> b!1398289 (=> (not res!937204) (not e!791606))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95627 (_ BitVec 32)) Bool)

(assert (=> b!1398289 (= res!937204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398290 () Bool)

(declare-fun e!791609 () Bool)

(declare-fun lt!614827 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398290 (= e!791609 (validKeyInArray!0 lt!614827))))

(declare-fun b!1398291 () Bool)

(declare-fun e!791608 () Bool)

(assert (=> b!1398291 (= e!791608 e!791609)))

(declare-fun res!937208 () Bool)

(assert (=> b!1398291 (=> res!937208 e!791609)))

(assert (=> b!1398291 (= res!937208 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10484 0))(
  ( (MissingZero!10484 (index!44307 (_ BitVec 32))) (Found!10484 (index!44308 (_ BitVec 32))) (Intermediate!10484 (undefined!11296 Bool) (index!44309 (_ BitVec 32)) (x!125954 (_ BitVec 32))) (Undefined!10484) (MissingVacant!10484 (index!44310 (_ BitVec 32))) )
))
(declare-fun lt!614831 () SeekEntryResult!10484)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614828 () SeekEntryResult!10484)

(assert (=> b!1398291 (and (not (undefined!11296 lt!614828)) (= (index!44309 lt!614828) i!1037) (bvslt (x!125954 lt!614828) (x!125954 lt!614831)) (= (select (store (arr!46167 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44309 lt!614828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614832 () (_ BitVec 32))

(declare-datatypes ((Unit!46972 0))(
  ( (Unit!46973) )
))
(declare-fun lt!614830 () Unit!46972)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46972)

(assert (=> b!1398291 (= lt!614830 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614832 (x!125954 lt!614831) (index!44309 lt!614831) (x!125954 lt!614828) (index!44309 lt!614828) (undefined!11296 lt!614828) mask!2840))))

(declare-fun e!791604 () Bool)

(declare-fun b!1398292 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95627 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1398292 (= e!791604 (= (seekEntryOrOpen!0 (select (arr!46167 a!2901) j!112) a!2901 mask!2840) (Found!10484 j!112)))))

(declare-fun b!1398293 () Bool)

(declare-fun res!937201 () Bool)

(assert (=> b!1398293 (=> (not res!937201) (not e!791606))))

(assert (=> b!1398293 (= res!937201 (and (= (size!46717 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46717 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46717 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398294 () Bool)

(declare-fun res!937202 () Bool)

(assert (=> b!1398294 (=> (not res!937202) (not e!791606))))

(assert (=> b!1398294 (= res!937202 (validKeyInArray!0 (select (arr!46167 a!2901) i!1037)))))

(declare-fun b!1398295 () Bool)

(declare-fun res!937209 () Bool)

(assert (=> b!1398295 (=> (not res!937209) (not e!791606))))

(assert (=> b!1398295 (= res!937209 (validKeyInArray!0 (select (arr!46167 a!2901) j!112)))))

(declare-fun b!1398296 () Bool)

(declare-fun e!791607 () Bool)

(assert (=> b!1398296 (= e!791606 (not e!791607))))

(declare-fun res!937210 () Bool)

(assert (=> b!1398296 (=> res!937210 e!791607)))

(get-info :version)

(assert (=> b!1398296 (= res!937210 (or (not ((_ is Intermediate!10484) lt!614831)) (undefined!11296 lt!614831)))))

(assert (=> b!1398296 e!791604))

(declare-fun res!937206 () Bool)

(assert (=> b!1398296 (=> (not res!937206) (not e!791604))))

(assert (=> b!1398296 (= res!937206 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614829 () Unit!46972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46972)

(assert (=> b!1398296 (= lt!614829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95627 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1398296 (= lt!614831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614832 (select (arr!46167 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398296 (= lt!614832 (toIndex!0 (select (arr!46167 a!2901) j!112) mask!2840))))

(declare-fun res!937203 () Bool)

(assert (=> start!120098 (=> (not res!937203) (not e!791606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120098 (= res!937203 (validMask!0 mask!2840))))

(assert (=> start!120098 e!791606))

(assert (=> start!120098 true))

(declare-fun array_inv!35195 (array!95627) Bool)

(assert (=> start!120098 (array_inv!35195 a!2901)))

(declare-fun b!1398297 () Bool)

(assert (=> b!1398297 (= e!791607 e!791608)))

(declare-fun res!937207 () Bool)

(assert (=> b!1398297 (=> res!937207 e!791608)))

(assert (=> b!1398297 (= res!937207 (or (= lt!614831 lt!614828) (not ((_ is Intermediate!10484) lt!614828))))))

(assert (=> b!1398297 (= lt!614828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614827 mask!2840) lt!614827 (array!95628 (store (arr!46167 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46717 a!2901)) mask!2840))))

(assert (=> b!1398297 (= lt!614827 (select (store (arr!46167 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120098 res!937203) b!1398293))

(assert (= (and b!1398293 res!937201) b!1398294))

(assert (= (and b!1398294 res!937202) b!1398295))

(assert (= (and b!1398295 res!937209) b!1398289))

(assert (= (and b!1398289 res!937204) b!1398288))

(assert (= (and b!1398288 res!937205) b!1398296))

(assert (= (and b!1398296 res!937206) b!1398292))

(assert (= (and b!1398296 (not res!937210)) b!1398297))

(assert (= (and b!1398297 (not res!937207)) b!1398291))

(assert (= (and b!1398291 (not res!937208)) b!1398290))

(declare-fun m!1285357 () Bool)

(assert (=> b!1398296 m!1285357))

(declare-fun m!1285359 () Bool)

(assert (=> b!1398296 m!1285359))

(assert (=> b!1398296 m!1285357))

(declare-fun m!1285361 () Bool)

(assert (=> b!1398296 m!1285361))

(declare-fun m!1285363 () Bool)

(assert (=> b!1398296 m!1285363))

(assert (=> b!1398296 m!1285357))

(declare-fun m!1285365 () Bool)

(assert (=> b!1398296 m!1285365))

(declare-fun m!1285367 () Bool)

(assert (=> b!1398291 m!1285367))

(declare-fun m!1285369 () Bool)

(assert (=> b!1398291 m!1285369))

(declare-fun m!1285371 () Bool)

(assert (=> b!1398291 m!1285371))

(declare-fun m!1285373 () Bool)

(assert (=> b!1398288 m!1285373))

(declare-fun m!1285375 () Bool)

(assert (=> b!1398294 m!1285375))

(assert (=> b!1398294 m!1285375))

(declare-fun m!1285377 () Bool)

(assert (=> b!1398294 m!1285377))

(declare-fun m!1285379 () Bool)

(assert (=> b!1398290 m!1285379))

(declare-fun m!1285381 () Bool)

(assert (=> b!1398289 m!1285381))

(assert (=> b!1398292 m!1285357))

(assert (=> b!1398292 m!1285357))

(declare-fun m!1285383 () Bool)

(assert (=> b!1398292 m!1285383))

(declare-fun m!1285385 () Bool)

(assert (=> start!120098 m!1285385))

(declare-fun m!1285387 () Bool)

(assert (=> start!120098 m!1285387))

(declare-fun m!1285389 () Bool)

(assert (=> b!1398297 m!1285389))

(assert (=> b!1398297 m!1285367))

(assert (=> b!1398297 m!1285389))

(declare-fun m!1285391 () Bool)

(assert (=> b!1398297 m!1285391))

(declare-fun m!1285393 () Bool)

(assert (=> b!1398297 m!1285393))

(assert (=> b!1398295 m!1285357))

(assert (=> b!1398295 m!1285357))

(declare-fun m!1285395 () Bool)

(assert (=> b!1398295 m!1285395))

(check-sat (not start!120098) (not b!1398294) (not b!1398292) (not b!1398288) (not b!1398289) (not b!1398295) (not b!1398296) (not b!1398290) (not b!1398297) (not b!1398291))
(check-sat)
