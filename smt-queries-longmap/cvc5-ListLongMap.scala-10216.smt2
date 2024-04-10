; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120348 () Bool)

(assert start!120348)

(declare-fun res!939262 () Bool)

(declare-fun e!793099 () Bool)

(assert (=> start!120348 (=> (not res!939262) (not e!793099))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120348 (= res!939262 (validMask!0 mask!2840))))

(assert (=> start!120348 e!793099))

(assert (=> start!120348 true))

(declare-datatypes ((array!95757 0))(
  ( (array!95758 (arr!46229 (Array (_ BitVec 32) (_ BitVec 64))) (size!46779 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95757)

(declare-fun array_inv!35257 (array!95757) Bool)

(assert (=> start!120348 (array_inv!35257 a!2901)))

(declare-fun lt!616435 () (_ BitVec 64))

(declare-fun lt!616437 () array!95757)

(declare-fun e!793094 () Bool)

(declare-fun b!1400750 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10546 0))(
  ( (MissingZero!10546 (index!44561 (_ BitVec 32))) (Found!10546 (index!44562 (_ BitVec 32))) (Intermediate!10546 (undefined!11358 Bool) (index!44563 (_ BitVec 32)) (x!126205 (_ BitVec 32))) (Undefined!10546) (MissingVacant!10546 (index!44564 (_ BitVec 32))) )
))
(declare-fun lt!616433 () SeekEntryResult!10546)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95757 (_ BitVec 32)) SeekEntryResult!10546)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95757 (_ BitVec 32)) SeekEntryResult!10546)

(assert (=> b!1400750 (= e!793094 (= (seekEntryOrOpen!0 lt!616435 lt!616437 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126205 lt!616433) (index!44563 lt!616433) (index!44563 lt!616433) (select (arr!46229 a!2901) j!112) lt!616437 mask!2840)))))

(declare-fun b!1400751 () Bool)

(declare-fun res!939268 () Bool)

(assert (=> b!1400751 (=> (not res!939268) (not e!793099))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400751 (= res!939268 (and (= (size!46779 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46779 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46779 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400752 () Bool)

(declare-fun e!793097 () Bool)

(declare-fun e!793096 () Bool)

(assert (=> b!1400752 (= e!793097 e!793096)))

(declare-fun res!939264 () Bool)

(assert (=> b!1400752 (=> res!939264 e!793096)))

(declare-fun lt!616436 () SeekEntryResult!10546)

(declare-fun lt!616432 () (_ BitVec 32))

(assert (=> b!1400752 (= res!939264 (or (bvslt (x!126205 lt!616436) #b00000000000000000000000000000000) (bvsgt (x!126205 lt!616436) #b01111111111111111111111111111110) (bvslt (x!126205 lt!616433) #b00000000000000000000000000000000) (bvsgt (x!126205 lt!616433) #b01111111111111111111111111111110) (bvslt lt!616432 #b00000000000000000000000000000000) (bvsge lt!616432 (size!46779 a!2901)) (bvslt (index!44563 lt!616436) #b00000000000000000000000000000000) (bvsge (index!44563 lt!616436) (size!46779 a!2901)) (bvslt (index!44563 lt!616433) #b00000000000000000000000000000000) (bvsge (index!44563 lt!616433) (size!46779 a!2901)) (not (= lt!616436 (Intermediate!10546 false (index!44563 lt!616436) (x!126205 lt!616436)))) (not (= lt!616433 (Intermediate!10546 false (index!44563 lt!616433) (x!126205 lt!616433))))))))

(assert (=> b!1400752 e!793094))

(declare-fun res!939261 () Bool)

(assert (=> b!1400752 (=> (not res!939261) (not e!793094))))

(assert (=> b!1400752 (= res!939261 (and (not (undefined!11358 lt!616433)) (= (index!44563 lt!616433) i!1037) (bvslt (x!126205 lt!616433) (x!126205 lt!616436)) (= (select (store (arr!46229 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44563 lt!616433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47096 0))(
  ( (Unit!47097) )
))
(declare-fun lt!616430 () Unit!47096)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47096)

(assert (=> b!1400752 (= lt!616430 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616432 (x!126205 lt!616436) (index!44563 lt!616436) (x!126205 lt!616433) (index!44563 lt!616433) (undefined!11358 lt!616433) mask!2840))))

(declare-fun b!1400753 () Bool)

(declare-fun e!793100 () Bool)

(assert (=> b!1400753 (= e!793100 e!793097)))

(declare-fun res!939270 () Bool)

(assert (=> b!1400753 (=> res!939270 e!793097)))

(assert (=> b!1400753 (= res!939270 (or (= lt!616436 lt!616433) (not (is-Intermediate!10546 lt!616433))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95757 (_ BitVec 32)) SeekEntryResult!10546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400753 (= lt!616433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616435 mask!2840) lt!616435 lt!616437 mask!2840))))

(assert (=> b!1400753 (= lt!616435 (select (store (arr!46229 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400753 (= lt!616437 (array!95758 (store (arr!46229 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46779 a!2901)))))

(declare-fun b!1400754 () Bool)

(declare-fun res!939266 () Bool)

(assert (=> b!1400754 (=> (not res!939266) (not e!793099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95757 (_ BitVec 32)) Bool)

(assert (=> b!1400754 (= res!939266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!793098 () Bool)

(declare-fun b!1400755 () Bool)

(assert (=> b!1400755 (= e!793098 (= (seekEntryOrOpen!0 (select (arr!46229 a!2901) j!112) a!2901 mask!2840) (Found!10546 j!112)))))

(declare-fun b!1400756 () Bool)

(assert (=> b!1400756 (= e!793099 (not e!793100))))

(declare-fun res!939269 () Bool)

(assert (=> b!1400756 (=> res!939269 e!793100)))

(assert (=> b!1400756 (= res!939269 (or (not (is-Intermediate!10546 lt!616436)) (undefined!11358 lt!616436)))))

(assert (=> b!1400756 e!793098))

(declare-fun res!939267 () Bool)

(assert (=> b!1400756 (=> (not res!939267) (not e!793098))))

(assert (=> b!1400756 (= res!939267 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616431 () Unit!47096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47096)

(assert (=> b!1400756 (= lt!616431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400756 (= lt!616436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616432 (select (arr!46229 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400756 (= lt!616432 (toIndex!0 (select (arr!46229 a!2901) j!112) mask!2840))))

(declare-fun b!1400757 () Bool)

(assert (=> b!1400757 (= e!793096 true)))

(declare-fun lt!616434 () SeekEntryResult!10546)

(assert (=> b!1400757 (= lt!616434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616432 lt!616435 lt!616437 mask!2840))))

(declare-fun b!1400758 () Bool)

(declare-fun res!939263 () Bool)

(assert (=> b!1400758 (=> (not res!939263) (not e!793099))))

(declare-datatypes ((List!32748 0))(
  ( (Nil!32745) (Cons!32744 (h!33992 (_ BitVec 64)) (t!47442 List!32748)) )
))
(declare-fun arrayNoDuplicates!0 (array!95757 (_ BitVec 32) List!32748) Bool)

(assert (=> b!1400758 (= res!939263 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32745))))

(declare-fun b!1400759 () Bool)

(declare-fun res!939271 () Bool)

(assert (=> b!1400759 (=> (not res!939271) (not e!793099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400759 (= res!939271 (validKeyInArray!0 (select (arr!46229 a!2901) i!1037)))))

(declare-fun b!1400760 () Bool)

(declare-fun res!939265 () Bool)

(assert (=> b!1400760 (=> (not res!939265) (not e!793099))))

(assert (=> b!1400760 (= res!939265 (validKeyInArray!0 (select (arr!46229 a!2901) j!112)))))

(assert (= (and start!120348 res!939262) b!1400751))

(assert (= (and b!1400751 res!939268) b!1400759))

(assert (= (and b!1400759 res!939271) b!1400760))

(assert (= (and b!1400760 res!939265) b!1400754))

(assert (= (and b!1400754 res!939266) b!1400758))

(assert (= (and b!1400758 res!939263) b!1400756))

(assert (= (and b!1400756 res!939267) b!1400755))

(assert (= (and b!1400756 (not res!939269)) b!1400753))

(assert (= (and b!1400753 (not res!939270)) b!1400752))

(assert (= (and b!1400752 res!939261) b!1400750))

(assert (= (and b!1400752 (not res!939264)) b!1400757))

(declare-fun m!1288305 () Bool)

(assert (=> b!1400754 m!1288305))

(declare-fun m!1288307 () Bool)

(assert (=> b!1400758 m!1288307))

(declare-fun m!1288309 () Bool)

(assert (=> b!1400750 m!1288309))

(declare-fun m!1288311 () Bool)

(assert (=> b!1400750 m!1288311))

(assert (=> b!1400750 m!1288311))

(declare-fun m!1288313 () Bool)

(assert (=> b!1400750 m!1288313))

(declare-fun m!1288315 () Bool)

(assert (=> b!1400752 m!1288315))

(declare-fun m!1288317 () Bool)

(assert (=> b!1400752 m!1288317))

(declare-fun m!1288319 () Bool)

(assert (=> b!1400752 m!1288319))

(assert (=> b!1400760 m!1288311))

(assert (=> b!1400760 m!1288311))

(declare-fun m!1288321 () Bool)

(assert (=> b!1400760 m!1288321))

(declare-fun m!1288323 () Bool)

(assert (=> b!1400759 m!1288323))

(assert (=> b!1400759 m!1288323))

(declare-fun m!1288325 () Bool)

(assert (=> b!1400759 m!1288325))

(declare-fun m!1288327 () Bool)

(assert (=> b!1400753 m!1288327))

(assert (=> b!1400753 m!1288327))

(declare-fun m!1288329 () Bool)

(assert (=> b!1400753 m!1288329))

(assert (=> b!1400753 m!1288315))

(declare-fun m!1288331 () Bool)

(assert (=> b!1400753 m!1288331))

(declare-fun m!1288333 () Bool)

(assert (=> b!1400757 m!1288333))

(assert (=> b!1400755 m!1288311))

(assert (=> b!1400755 m!1288311))

(declare-fun m!1288335 () Bool)

(assert (=> b!1400755 m!1288335))

(assert (=> b!1400756 m!1288311))

(declare-fun m!1288337 () Bool)

(assert (=> b!1400756 m!1288337))

(assert (=> b!1400756 m!1288311))

(declare-fun m!1288339 () Bool)

(assert (=> b!1400756 m!1288339))

(assert (=> b!1400756 m!1288311))

(declare-fun m!1288341 () Bool)

(assert (=> b!1400756 m!1288341))

(declare-fun m!1288343 () Bool)

(assert (=> b!1400756 m!1288343))

(declare-fun m!1288345 () Bool)

(assert (=> start!120348 m!1288345))

(declare-fun m!1288347 () Bool)

(assert (=> start!120348 m!1288347))

(push 1)

