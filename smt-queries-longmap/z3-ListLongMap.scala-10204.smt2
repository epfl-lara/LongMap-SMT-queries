; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120212 () Bool)

(assert start!120212)

(declare-fun res!938032 () Bool)

(declare-fun e!792179 () Bool)

(assert (=> start!120212 (=> (not res!938032) (not e!792179))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120212 (= res!938032 (validMask!0 mask!2840))))

(assert (=> start!120212 e!792179))

(assert (=> start!120212 true))

(declare-datatypes ((array!95684 0))(
  ( (array!95685 (arr!46194 (Array (_ BitVec 32) (_ BitVec 64))) (size!46744 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95684)

(declare-fun array_inv!35222 (array!95684) Bool)

(assert (=> start!120212 (array_inv!35222 a!2901)))

(declare-fun b!1399281 () Bool)

(declare-fun res!938036 () Bool)

(assert (=> b!1399281 (=> (not res!938036) (not e!792179))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399281 (= res!938036 (validKeyInArray!0 (select (arr!46194 a!2901) j!112)))))

(declare-fun b!1399282 () Bool)

(declare-fun res!938034 () Bool)

(assert (=> b!1399282 (=> (not res!938034) (not e!792179))))

(declare-datatypes ((List!32713 0))(
  ( (Nil!32710) (Cons!32709 (h!33954 (_ BitVec 64)) (t!47407 List!32713)) )
))
(declare-fun arrayNoDuplicates!0 (array!95684 (_ BitVec 32) List!32713) Bool)

(assert (=> b!1399282 (= res!938034 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32710))))

(declare-fun b!1399283 () Bool)

(declare-fun e!792182 () Bool)

(assert (=> b!1399283 (= e!792179 (not e!792182))))

(declare-fun res!938038 () Bool)

(assert (=> b!1399283 (=> res!938038 e!792182)))

(declare-datatypes ((SeekEntryResult!10511 0))(
  ( (MissingZero!10511 (index!44418 (_ BitVec 32))) (Found!10511 (index!44419 (_ BitVec 32))) (Intermediate!10511 (undefined!11323 Bool) (index!44420 (_ BitVec 32)) (x!126062 (_ BitVec 32))) (Undefined!10511) (MissingVacant!10511 (index!44421 (_ BitVec 32))) )
))
(declare-fun lt!615450 () SeekEntryResult!10511)

(get-info :version)

(assert (=> b!1399283 (= res!938038 (or (not ((_ is Intermediate!10511) lt!615450)) (undefined!11323 lt!615450)))))

(declare-fun e!792181 () Bool)

(assert (=> b!1399283 e!792181))

(declare-fun res!938031 () Bool)

(assert (=> b!1399283 (=> (not res!938031) (not e!792181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95684 (_ BitVec 32)) Bool)

(assert (=> b!1399283 (= res!938031 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47026 0))(
  ( (Unit!47027) )
))
(declare-fun lt!615451 () Unit!47026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47026)

(assert (=> b!1399283 (= lt!615451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615453 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95684 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1399283 (= lt!615450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615453 (select (arr!46194 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399283 (= lt!615453 (toIndex!0 (select (arr!46194 a!2901) j!112) mask!2840))))

(declare-fun b!1399284 () Bool)

(declare-fun res!938029 () Bool)

(assert (=> b!1399284 (=> (not res!938029) (not e!792179))))

(assert (=> b!1399284 (= res!938029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399285 () Bool)

(declare-fun res!938033 () Bool)

(assert (=> b!1399285 (=> (not res!938033) (not e!792179))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399285 (= res!938033 (and (= (size!46744 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46744 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46744 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399286 () Bool)

(declare-fun e!792178 () Bool)

(assert (=> b!1399286 (= e!792182 e!792178)))

(declare-fun res!938037 () Bool)

(assert (=> b!1399286 (=> res!938037 e!792178)))

(declare-fun lt!615447 () SeekEntryResult!10511)

(assert (=> b!1399286 (= res!938037 (or (= lt!615450 lt!615447) (not ((_ is Intermediate!10511) lt!615447))))))

(declare-fun lt!615449 () (_ BitVec 64))

(declare-fun lt!615448 () array!95684)

(assert (=> b!1399286 (= lt!615447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615449 mask!2840) lt!615449 lt!615448 mask!2840))))

(assert (=> b!1399286 (= lt!615449 (select (store (arr!46194 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399286 (= lt!615448 (array!95685 (store (arr!46194 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46744 a!2901)))))

(declare-fun b!1399287 () Bool)

(assert (=> b!1399287 (= e!792178 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun e!792180 () Bool)

(assert (=> b!1399287 e!792180))

(declare-fun res!938030 () Bool)

(assert (=> b!1399287 (=> (not res!938030) (not e!792180))))

(assert (=> b!1399287 (= res!938030 (and (not (undefined!11323 lt!615447)) (= (index!44420 lt!615447) i!1037) (bvslt (x!126062 lt!615447) (x!126062 lt!615450)) (= (select (store (arr!46194 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44420 lt!615447)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615452 () Unit!47026)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47026)

(assert (=> b!1399287 (= lt!615452 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615453 (x!126062 lt!615450) (index!44420 lt!615450) (x!126062 lt!615447) (index!44420 lt!615447) (undefined!11323 lt!615447) mask!2840))))

(declare-fun b!1399288 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95684 (_ BitVec 32)) SeekEntryResult!10511)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95684 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1399288 (= e!792180 (= (seekEntryOrOpen!0 lt!615449 lt!615448 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126062 lt!615447) (index!44420 lt!615447) (index!44420 lt!615447) (select (arr!46194 a!2901) j!112) lt!615448 mask!2840)))))

(declare-fun b!1399289 () Bool)

(declare-fun res!938035 () Bool)

(assert (=> b!1399289 (=> (not res!938035) (not e!792179))))

(assert (=> b!1399289 (= res!938035 (validKeyInArray!0 (select (arr!46194 a!2901) i!1037)))))

(declare-fun b!1399290 () Bool)

(assert (=> b!1399290 (= e!792181 (= (seekEntryOrOpen!0 (select (arr!46194 a!2901) j!112) a!2901 mask!2840) (Found!10511 j!112)))))

(assert (= (and start!120212 res!938032) b!1399285))

(assert (= (and b!1399285 res!938033) b!1399289))

(assert (= (and b!1399289 res!938035) b!1399281))

(assert (= (and b!1399281 res!938036) b!1399284))

(assert (= (and b!1399284 res!938029) b!1399282))

(assert (= (and b!1399282 res!938034) b!1399283))

(assert (= (and b!1399283 res!938031) b!1399290))

(assert (= (and b!1399283 (not res!938038)) b!1399286))

(assert (= (and b!1399286 (not res!938037)) b!1399287))

(assert (= (and b!1399287 res!938030) b!1399288))

(declare-fun m!1286553 () Bool)

(assert (=> b!1399290 m!1286553))

(assert (=> b!1399290 m!1286553))

(declare-fun m!1286555 () Bool)

(assert (=> b!1399290 m!1286555))

(declare-fun m!1286557 () Bool)

(assert (=> start!120212 m!1286557))

(declare-fun m!1286559 () Bool)

(assert (=> start!120212 m!1286559))

(declare-fun m!1286561 () Bool)

(assert (=> b!1399288 m!1286561))

(assert (=> b!1399288 m!1286553))

(assert (=> b!1399288 m!1286553))

(declare-fun m!1286563 () Bool)

(assert (=> b!1399288 m!1286563))

(declare-fun m!1286565 () Bool)

(assert (=> b!1399286 m!1286565))

(assert (=> b!1399286 m!1286565))

(declare-fun m!1286567 () Bool)

(assert (=> b!1399286 m!1286567))

(declare-fun m!1286569 () Bool)

(assert (=> b!1399286 m!1286569))

(declare-fun m!1286571 () Bool)

(assert (=> b!1399286 m!1286571))

(assert (=> b!1399287 m!1286569))

(declare-fun m!1286573 () Bool)

(assert (=> b!1399287 m!1286573))

(declare-fun m!1286575 () Bool)

(assert (=> b!1399287 m!1286575))

(declare-fun m!1286577 () Bool)

(assert (=> b!1399282 m!1286577))

(assert (=> b!1399281 m!1286553))

(assert (=> b!1399281 m!1286553))

(declare-fun m!1286579 () Bool)

(assert (=> b!1399281 m!1286579))

(assert (=> b!1399283 m!1286553))

(declare-fun m!1286581 () Bool)

(assert (=> b!1399283 m!1286581))

(declare-fun m!1286583 () Bool)

(assert (=> b!1399283 m!1286583))

(declare-fun m!1286585 () Bool)

(assert (=> b!1399283 m!1286585))

(assert (=> b!1399283 m!1286553))

(declare-fun m!1286587 () Bool)

(assert (=> b!1399283 m!1286587))

(assert (=> b!1399283 m!1286553))

(declare-fun m!1286589 () Bool)

(assert (=> b!1399284 m!1286589))

(declare-fun m!1286591 () Bool)

(assert (=> b!1399289 m!1286591))

(assert (=> b!1399289 m!1286591))

(declare-fun m!1286593 () Bool)

(assert (=> b!1399289 m!1286593))

(check-sat (not b!1399290) (not b!1399282) (not b!1399287) (not start!120212) (not b!1399283) (not b!1399281) (not b!1399284) (not b!1399288) (not b!1399286) (not b!1399289))
(check-sat)
