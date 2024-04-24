; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120482 () Bool)

(assert start!120482)

(declare-fun b!1400999 () Bool)

(declare-fun res!938827 () Bool)

(declare-fun e!793265 () Bool)

(assert (=> b!1400999 (=> (not res!938827) (not e!793265))))

(declare-datatypes ((array!95813 0))(
  ( (array!95814 (arr!46255 (Array (_ BitVec 32) (_ BitVec 64))) (size!46806 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95813)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400999 (= res!938827 (validKeyInArray!0 (select (arr!46255 a!2901) i!1037)))))

(declare-fun b!1401000 () Bool)

(declare-fun e!793269 () Bool)

(assert (=> b!1401000 (= e!793265 (not e!793269))))

(declare-fun res!938830 () Bool)

(assert (=> b!1401000 (=> res!938830 e!793269)))

(declare-datatypes ((SeekEntryResult!10475 0))(
  ( (MissingZero!10475 (index!44277 (_ BitVec 32))) (Found!10475 (index!44278 (_ BitVec 32))) (Intermediate!10475 (undefined!11287 Bool) (index!44279 (_ BitVec 32)) (x!126081 (_ BitVec 32))) (Undefined!10475) (MissingVacant!10475 (index!44280 (_ BitVec 32))) )
))
(declare-fun lt!616181 () SeekEntryResult!10475)

(get-info :version)

(assert (=> b!1401000 (= res!938830 (or (not ((_ is Intermediate!10475) lt!616181)) (undefined!11287 lt!616181)))))

(declare-fun e!793267 () Bool)

(assert (=> b!1401000 e!793267))

(declare-fun res!938832 () Bool)

(assert (=> b!1401000 (=> (not res!938832) (not e!793267))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95813 (_ BitVec 32)) Bool)

(assert (=> b!1401000 (= res!938832 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46981 0))(
  ( (Unit!46982) )
))
(declare-fun lt!616185 () Unit!46981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46981)

(assert (=> b!1401000 (= lt!616185 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616182 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10475)

(assert (=> b!1401000 (= lt!616181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616182 (select (arr!46255 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401000 (= lt!616182 (toIndex!0 (select (arr!46255 a!2901) j!112) mask!2840))))

(declare-fun b!1401001 () Bool)

(declare-fun e!793268 () Bool)

(assert (=> b!1401001 (= e!793269 e!793268)))

(declare-fun res!938835 () Bool)

(assert (=> b!1401001 (=> res!938835 e!793268)))

(declare-fun lt!616184 () SeekEntryResult!10475)

(assert (=> b!1401001 (= res!938835 (or (= lt!616181 lt!616184) (not ((_ is Intermediate!10475) lt!616184))))))

(declare-fun lt!616180 () (_ BitVec 64))

(declare-fun lt!616183 () array!95813)

(assert (=> b!1401001 (= lt!616184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616180 mask!2840) lt!616180 lt!616183 mask!2840))))

(assert (=> b!1401001 (= lt!616180 (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401001 (= lt!616183 (array!95814 (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46806 a!2901)))))

(declare-fun b!1401002 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10475)

(assert (=> b!1401002 (= e!793267 (= (seekEntryOrOpen!0 (select (arr!46255 a!2901) j!112) a!2901 mask!2840) (Found!10475 j!112)))))

(declare-fun b!1401003 () Bool)

(declare-fun e!793266 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95813 (_ BitVec 32)) SeekEntryResult!10475)

(assert (=> b!1401003 (= e!793266 (= (seekEntryOrOpen!0 lt!616180 lt!616183 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126081 lt!616184) (index!44279 lt!616184) (index!44279 lt!616184) (select (arr!46255 a!2901) j!112) lt!616183 mask!2840)))))

(declare-fun b!1401004 () Bool)

(declare-fun res!938836 () Bool)

(assert (=> b!1401004 (=> (not res!938836) (not e!793265))))

(assert (=> b!1401004 (= res!938836 (validKeyInArray!0 (select (arr!46255 a!2901) j!112)))))

(declare-fun b!1401005 () Bool)

(declare-fun e!793271 () Bool)

(assert (=> b!1401005 (= e!793271 true)))

(declare-fun lt!616186 () SeekEntryResult!10475)

(assert (=> b!1401005 (= lt!616186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616182 lt!616180 lt!616183 mask!2840))))

(declare-fun b!1401006 () Bool)

(declare-fun res!938828 () Bool)

(assert (=> b!1401006 (=> (not res!938828) (not e!793265))))

(declare-datatypes ((List!32761 0))(
  ( (Nil!32758) (Cons!32757 (h!34013 (_ BitVec 64)) (t!47447 List!32761)) )
))
(declare-fun arrayNoDuplicates!0 (array!95813 (_ BitVec 32) List!32761) Bool)

(assert (=> b!1401006 (= res!938828 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32758))))

(declare-fun b!1401008 () Bool)

(assert (=> b!1401008 (= e!793268 e!793271)))

(declare-fun res!938826 () Bool)

(assert (=> b!1401008 (=> res!938826 e!793271)))

(assert (=> b!1401008 (= res!938826 (or (bvslt (x!126081 lt!616181) #b00000000000000000000000000000000) (bvsgt (x!126081 lt!616181) #b01111111111111111111111111111110) (bvslt (x!126081 lt!616184) #b00000000000000000000000000000000) (bvsgt (x!126081 lt!616184) #b01111111111111111111111111111110) (bvslt lt!616182 #b00000000000000000000000000000000) (bvsge lt!616182 (size!46806 a!2901)) (bvslt (index!44279 lt!616181) #b00000000000000000000000000000000) (bvsge (index!44279 lt!616181) (size!46806 a!2901)) (bvslt (index!44279 lt!616184) #b00000000000000000000000000000000) (bvsge (index!44279 lt!616184) (size!46806 a!2901)) (not (= lt!616181 (Intermediate!10475 false (index!44279 lt!616181) (x!126081 lt!616181)))) (not (= lt!616184 (Intermediate!10475 false (index!44279 lt!616184) (x!126081 lt!616184))))))))

(assert (=> b!1401008 e!793266))

(declare-fun res!938829 () Bool)

(assert (=> b!1401008 (=> (not res!938829) (not e!793266))))

(assert (=> b!1401008 (= res!938829 (and (not (undefined!11287 lt!616184)) (= (index!44279 lt!616184) i!1037) (bvslt (x!126081 lt!616184) (x!126081 lt!616181)) (= (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44279 lt!616184)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616187 () Unit!46981)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46981)

(assert (=> b!1401008 (= lt!616187 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616182 (x!126081 lt!616181) (index!44279 lt!616181) (x!126081 lt!616184) (index!44279 lt!616184) (undefined!11287 lt!616184) mask!2840))))

(declare-fun b!1401009 () Bool)

(declare-fun res!938834 () Bool)

(assert (=> b!1401009 (=> (not res!938834) (not e!793265))))

(assert (=> b!1401009 (= res!938834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938831 () Bool)

(assert (=> start!120482 (=> (not res!938831) (not e!793265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120482 (= res!938831 (validMask!0 mask!2840))))

(assert (=> start!120482 e!793265))

(assert (=> start!120482 true))

(declare-fun array_inv!35536 (array!95813) Bool)

(assert (=> start!120482 (array_inv!35536 a!2901)))

(declare-fun b!1401007 () Bool)

(declare-fun res!938833 () Bool)

(assert (=> b!1401007 (=> (not res!938833) (not e!793265))))

(assert (=> b!1401007 (= res!938833 (and (= (size!46806 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46806 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46806 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120482 res!938831) b!1401007))

(assert (= (and b!1401007 res!938833) b!1400999))

(assert (= (and b!1400999 res!938827) b!1401004))

(assert (= (and b!1401004 res!938836) b!1401009))

(assert (= (and b!1401009 res!938834) b!1401006))

(assert (= (and b!1401006 res!938828) b!1401000))

(assert (= (and b!1401000 res!938832) b!1401002))

(assert (= (and b!1401000 (not res!938830)) b!1401001))

(assert (= (and b!1401001 (not res!938835)) b!1401008))

(assert (= (and b!1401008 res!938829) b!1401003))

(assert (= (and b!1401008 (not res!938826)) b!1401005))

(declare-fun m!1288489 () Bool)

(assert (=> b!1401000 m!1288489))

(declare-fun m!1288491 () Bool)

(assert (=> b!1401000 m!1288491))

(declare-fun m!1288493 () Bool)

(assert (=> b!1401000 m!1288493))

(assert (=> b!1401000 m!1288489))

(declare-fun m!1288495 () Bool)

(assert (=> b!1401000 m!1288495))

(assert (=> b!1401000 m!1288489))

(declare-fun m!1288497 () Bool)

(assert (=> b!1401000 m!1288497))

(declare-fun m!1288499 () Bool)

(assert (=> b!1401005 m!1288499))

(assert (=> b!1401002 m!1288489))

(assert (=> b!1401002 m!1288489))

(declare-fun m!1288501 () Bool)

(assert (=> b!1401002 m!1288501))

(declare-fun m!1288503 () Bool)

(assert (=> start!120482 m!1288503))

(declare-fun m!1288505 () Bool)

(assert (=> start!120482 m!1288505))

(declare-fun m!1288507 () Bool)

(assert (=> b!1401008 m!1288507))

(declare-fun m!1288509 () Bool)

(assert (=> b!1401008 m!1288509))

(declare-fun m!1288511 () Bool)

(assert (=> b!1401008 m!1288511))

(declare-fun m!1288513 () Bool)

(assert (=> b!1401003 m!1288513))

(assert (=> b!1401003 m!1288489))

(assert (=> b!1401003 m!1288489))

(declare-fun m!1288515 () Bool)

(assert (=> b!1401003 m!1288515))

(declare-fun m!1288517 () Bool)

(assert (=> b!1401006 m!1288517))

(assert (=> b!1401004 m!1288489))

(assert (=> b!1401004 m!1288489))

(declare-fun m!1288519 () Bool)

(assert (=> b!1401004 m!1288519))

(declare-fun m!1288521 () Bool)

(assert (=> b!1401009 m!1288521))

(declare-fun m!1288523 () Bool)

(assert (=> b!1400999 m!1288523))

(assert (=> b!1400999 m!1288523))

(declare-fun m!1288525 () Bool)

(assert (=> b!1400999 m!1288525))

(declare-fun m!1288527 () Bool)

(assert (=> b!1401001 m!1288527))

(assert (=> b!1401001 m!1288527))

(declare-fun m!1288529 () Bool)

(assert (=> b!1401001 m!1288529))

(assert (=> b!1401001 m!1288507))

(declare-fun m!1288531 () Bool)

(assert (=> b!1401001 m!1288531))

(check-sat (not b!1401003) (not start!120482) (not b!1401009) (not b!1401006) (not b!1401005) (not b!1401000) (not b!1401008) (not b!1401004) (not b!1400999) (not b!1401002) (not b!1401001))
(check-sat)
