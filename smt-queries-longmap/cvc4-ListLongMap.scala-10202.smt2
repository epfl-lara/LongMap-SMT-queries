; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120202 () Bool)

(assert start!120202)

(declare-fun b!1399141 () Bool)

(declare-fun res!937889 () Bool)

(declare-fun e!792098 () Bool)

(assert (=> b!1399141 (=> (not res!937889) (not e!792098))))

(declare-datatypes ((array!95674 0))(
  ( (array!95675 (arr!46189 (Array (_ BitVec 32) (_ BitVec 64))) (size!46739 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95674)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95674 (_ BitVec 32)) Bool)

(assert (=> b!1399141 (= res!937889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399142 () Bool)

(declare-fun res!937893 () Bool)

(assert (=> b!1399142 (=> (not res!937893) (not e!792098))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399142 (= res!937893 (validKeyInArray!0 (select (arr!46189 a!2901) j!112)))))

(declare-fun b!1399143 () Bool)

(declare-fun e!792100 () Bool)

(assert (=> b!1399143 (= e!792098 (not e!792100))))

(declare-fun res!937891 () Bool)

(assert (=> b!1399143 (=> res!937891 e!792100)))

(declare-datatypes ((SeekEntryResult!10506 0))(
  ( (MissingZero!10506 (index!44398 (_ BitVec 32))) (Found!10506 (index!44399 (_ BitVec 32))) (Intermediate!10506 (undefined!11318 Bool) (index!44400 (_ BitVec 32)) (x!126041 (_ BitVec 32))) (Undefined!10506) (MissingVacant!10506 (index!44401 (_ BitVec 32))) )
))
(declare-fun lt!615355 () SeekEntryResult!10506)

(assert (=> b!1399143 (= res!937891 (or (not (is-Intermediate!10506 lt!615355)) (undefined!11318 lt!615355)))))

(declare-fun e!792097 () Bool)

(assert (=> b!1399143 e!792097))

(declare-fun res!937892 () Bool)

(assert (=> b!1399143 (=> (not res!937892) (not e!792097))))

(assert (=> b!1399143 (= res!937892 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47016 0))(
  ( (Unit!47017) )
))
(declare-fun lt!615353 () Unit!47016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47016)

(assert (=> b!1399143 (= lt!615353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95674 (_ BitVec 32)) SeekEntryResult!10506)

(assert (=> b!1399143 (= lt!615355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615356 (select (arr!46189 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399143 (= lt!615356 (toIndex!0 (select (arr!46189 a!2901) j!112) mask!2840))))

(declare-fun b!1399144 () Bool)

(declare-fun res!937895 () Bool)

(assert (=> b!1399144 (=> (not res!937895) (not e!792098))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399144 (= res!937895 (validKeyInArray!0 (select (arr!46189 a!2901) i!1037)))))

(declare-fun b!1399145 () Bool)

(declare-fun res!937894 () Bool)

(assert (=> b!1399145 (=> (not res!937894) (not e!792098))))

(assert (=> b!1399145 (= res!937894 (and (= (size!46739 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46739 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46739 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399146 () Bool)

(declare-fun e!792099 () Bool)

(assert (=> b!1399146 (= e!792100 e!792099)))

(declare-fun res!937896 () Bool)

(assert (=> b!1399146 (=> res!937896 e!792099)))

(declare-fun lt!615352 () SeekEntryResult!10506)

(assert (=> b!1399146 (= res!937896 (or (= lt!615355 lt!615352) (not (is-Intermediate!10506 lt!615352))))))

(declare-fun lt!615354 () (_ BitVec 64))

(assert (=> b!1399146 (= lt!615352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615354 mask!2840) lt!615354 (array!95675 (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46739 a!2901)) mask!2840))))

(assert (=> b!1399146 (= lt!615354 (select (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399147 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95674 (_ BitVec 32)) SeekEntryResult!10506)

(assert (=> b!1399147 (= e!792097 (= (seekEntryOrOpen!0 (select (arr!46189 a!2901) j!112) a!2901 mask!2840) (Found!10506 j!112)))))

(declare-fun b!1399149 () Bool)

(assert (=> b!1399149 (= e!792099 true)))

(assert (=> b!1399149 (and (not (undefined!11318 lt!615352)) (= (index!44400 lt!615352) i!1037) (bvslt (x!126041 lt!615352) (x!126041 lt!615355)) (= (select (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44400 lt!615352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615357 () Unit!47016)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47016)

(assert (=> b!1399149 (= lt!615357 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615356 (x!126041 lt!615355) (index!44400 lt!615355) (x!126041 lt!615352) (index!44400 lt!615352) (undefined!11318 lt!615352) mask!2840))))

(declare-fun b!1399148 () Bool)

(declare-fun res!937897 () Bool)

(assert (=> b!1399148 (=> (not res!937897) (not e!792098))))

(declare-datatypes ((List!32708 0))(
  ( (Nil!32705) (Cons!32704 (h!33949 (_ BitVec 64)) (t!47402 List!32708)) )
))
(declare-fun arrayNoDuplicates!0 (array!95674 (_ BitVec 32) List!32708) Bool)

(assert (=> b!1399148 (= res!937897 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32705))))

(declare-fun res!937890 () Bool)

(assert (=> start!120202 (=> (not res!937890) (not e!792098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120202 (= res!937890 (validMask!0 mask!2840))))

(assert (=> start!120202 e!792098))

(assert (=> start!120202 true))

(declare-fun array_inv!35217 (array!95674) Bool)

(assert (=> start!120202 (array_inv!35217 a!2901)))

(assert (= (and start!120202 res!937890) b!1399145))

(assert (= (and b!1399145 res!937894) b!1399144))

(assert (= (and b!1399144 res!937895) b!1399142))

(assert (= (and b!1399142 res!937893) b!1399141))

(assert (= (and b!1399141 res!937889) b!1399148))

(assert (= (and b!1399148 res!937897) b!1399143))

(assert (= (and b!1399143 res!937892) b!1399147))

(assert (= (and b!1399143 (not res!937891)) b!1399146))

(assert (= (and b!1399146 (not res!937896)) b!1399149))

(declare-fun m!1286359 () Bool)

(assert (=> b!1399148 m!1286359))

(declare-fun m!1286361 () Bool)

(assert (=> b!1399141 m!1286361))

(declare-fun m!1286363 () Bool)

(assert (=> b!1399149 m!1286363))

(declare-fun m!1286365 () Bool)

(assert (=> b!1399149 m!1286365))

(declare-fun m!1286367 () Bool)

(assert (=> b!1399149 m!1286367))

(declare-fun m!1286369 () Bool)

(assert (=> b!1399147 m!1286369))

(assert (=> b!1399147 m!1286369))

(declare-fun m!1286371 () Bool)

(assert (=> b!1399147 m!1286371))

(declare-fun m!1286373 () Bool)

(assert (=> b!1399146 m!1286373))

(assert (=> b!1399146 m!1286363))

(assert (=> b!1399146 m!1286373))

(declare-fun m!1286375 () Bool)

(assert (=> b!1399146 m!1286375))

(declare-fun m!1286377 () Bool)

(assert (=> b!1399146 m!1286377))

(declare-fun m!1286379 () Bool)

(assert (=> start!120202 m!1286379))

(declare-fun m!1286381 () Bool)

(assert (=> start!120202 m!1286381))

(assert (=> b!1399143 m!1286369))

(declare-fun m!1286383 () Bool)

(assert (=> b!1399143 m!1286383))

(declare-fun m!1286385 () Bool)

(assert (=> b!1399143 m!1286385))

(assert (=> b!1399143 m!1286369))

(declare-fun m!1286387 () Bool)

(assert (=> b!1399143 m!1286387))

(assert (=> b!1399143 m!1286369))

(declare-fun m!1286389 () Bool)

(assert (=> b!1399143 m!1286389))

(declare-fun m!1286391 () Bool)

(assert (=> b!1399144 m!1286391))

(assert (=> b!1399144 m!1286391))

(declare-fun m!1286393 () Bool)

(assert (=> b!1399144 m!1286393))

(assert (=> b!1399142 m!1286369))

(assert (=> b!1399142 m!1286369))

(declare-fun m!1286395 () Bool)

(assert (=> b!1399142 m!1286395))

(push 1)

