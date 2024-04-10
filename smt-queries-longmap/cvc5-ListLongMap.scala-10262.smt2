; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120624 () Bool)

(assert start!120624)

(declare-fun b!1404403 () Bool)

(declare-fun res!942914 () Bool)

(declare-fun e!795028 () Bool)

(assert (=> b!1404403 (=> (not res!942914) (not e!795028))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96033 0))(
  ( (array!96034 (arr!46367 (Array (_ BitVec 32) (_ BitVec 64))) (size!46917 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96033)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404403 (= res!942914 (and (= (size!46917 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46917 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46917 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942916 () Bool)

(assert (=> start!120624 (=> (not res!942916) (not e!795028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120624 (= res!942916 (validMask!0 mask!2840))))

(assert (=> start!120624 e!795028))

(assert (=> start!120624 true))

(declare-fun array_inv!35395 (array!96033) Bool)

(assert (=> start!120624 (array_inv!35395 a!2901)))

(declare-fun b!1404404 () Bool)

(declare-fun res!942919 () Bool)

(assert (=> b!1404404 (=> (not res!942919) (not e!795028))))

(declare-datatypes ((List!32886 0))(
  ( (Nil!32883) (Cons!32882 (h!34130 (_ BitVec 64)) (t!47580 List!32886)) )
))
(declare-fun arrayNoDuplicates!0 (array!96033 (_ BitVec 32) List!32886) Bool)

(assert (=> b!1404404 (= res!942919 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32883))))

(declare-fun b!1404405 () Bool)

(assert (=> b!1404405 (= e!795028 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96033 (_ BitVec 32)) Bool)

(assert (=> b!1404405 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47330 0))(
  ( (Unit!47331) )
))
(declare-fun lt!618641 () Unit!47330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47330)

(assert (=> b!1404405 (= lt!618641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10678 0))(
  ( (MissingZero!10678 (index!45089 (_ BitVec 32))) (Found!10678 (index!45090 (_ BitVec 32))) (Intermediate!10678 (undefined!11490 Bool) (index!45091 (_ BitVec 32)) (x!126705 (_ BitVec 32))) (Undefined!10678) (MissingVacant!10678 (index!45092 (_ BitVec 32))) )
))
(declare-fun lt!618642 () SeekEntryResult!10678)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96033 (_ BitVec 32)) SeekEntryResult!10678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404405 (= lt!618642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46367 a!2901) j!112) mask!2840) (select (arr!46367 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404406 () Bool)

(declare-fun res!942918 () Bool)

(assert (=> b!1404406 (=> (not res!942918) (not e!795028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404406 (= res!942918 (validKeyInArray!0 (select (arr!46367 a!2901) j!112)))))

(declare-fun b!1404407 () Bool)

(declare-fun res!942915 () Bool)

(assert (=> b!1404407 (=> (not res!942915) (not e!795028))))

(assert (=> b!1404407 (= res!942915 (validKeyInArray!0 (select (arr!46367 a!2901) i!1037)))))

(declare-fun b!1404408 () Bool)

(declare-fun res!942917 () Bool)

(assert (=> b!1404408 (=> (not res!942917) (not e!795028))))

(assert (=> b!1404408 (= res!942917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120624 res!942916) b!1404403))

(assert (= (and b!1404403 res!942914) b!1404407))

(assert (= (and b!1404407 res!942915) b!1404406))

(assert (= (and b!1404406 res!942918) b!1404408))

(assert (= (and b!1404408 res!942917) b!1404404))

(assert (= (and b!1404404 res!942919) b!1404405))

(declare-fun m!1293237 () Bool)

(assert (=> b!1404408 m!1293237))

(declare-fun m!1293239 () Bool)

(assert (=> b!1404405 m!1293239))

(declare-fun m!1293241 () Bool)

(assert (=> b!1404405 m!1293241))

(assert (=> b!1404405 m!1293239))

(declare-fun m!1293243 () Bool)

(assert (=> b!1404405 m!1293243))

(assert (=> b!1404405 m!1293241))

(assert (=> b!1404405 m!1293239))

(declare-fun m!1293245 () Bool)

(assert (=> b!1404405 m!1293245))

(declare-fun m!1293247 () Bool)

(assert (=> b!1404405 m!1293247))

(declare-fun m!1293249 () Bool)

(assert (=> start!120624 m!1293249))

(declare-fun m!1293251 () Bool)

(assert (=> start!120624 m!1293251))

(declare-fun m!1293253 () Bool)

(assert (=> b!1404407 m!1293253))

(assert (=> b!1404407 m!1293253))

(declare-fun m!1293255 () Bool)

(assert (=> b!1404407 m!1293255))

(assert (=> b!1404406 m!1293239))

(assert (=> b!1404406 m!1293239))

(declare-fun m!1293257 () Bool)

(assert (=> b!1404406 m!1293257))

(declare-fun m!1293259 () Bool)

(assert (=> b!1404404 m!1293259))

(push 1)

(assert (not b!1404407))

(assert (not b!1404406))

(assert (not b!1404405))

(assert (not b!1404408))

(assert (not start!120624))

(assert (not b!1404404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

