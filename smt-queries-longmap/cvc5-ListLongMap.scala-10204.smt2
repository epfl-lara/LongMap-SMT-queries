; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120210 () Bool)

(assert start!120210)

(declare-fun b!1399251 () Bool)

(declare-fun res!938002 () Bool)

(declare-fun e!792164 () Bool)

(assert (=> b!1399251 (=> (not res!938002) (not e!792164))))

(declare-datatypes ((array!95682 0))(
  ( (array!95683 (arr!46193 (Array (_ BitVec 32) (_ BitVec 64))) (size!46743 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95682)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399251 (= res!938002 (validKeyInArray!0 (select (arr!46193 a!2901) i!1037)))))

(declare-fun res!938000 () Bool)

(assert (=> start!120210 (=> (not res!938000) (not e!792164))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120210 (= res!938000 (validMask!0 mask!2840))))

(assert (=> start!120210 e!792164))

(assert (=> start!120210 true))

(declare-fun array_inv!35221 (array!95682) Bool)

(assert (=> start!120210 (array_inv!35221 a!2901)))

(declare-fun lt!615426 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10510 0))(
  ( (MissingZero!10510 (index!44414 (_ BitVec 32))) (Found!10510 (index!44415 (_ BitVec 32))) (Intermediate!10510 (undefined!11322 Bool) (index!44416 (_ BitVec 32)) (x!126061 (_ BitVec 32))) (Undefined!10510) (MissingVacant!10510 (index!44417 (_ BitVec 32))) )
))
(declare-fun lt!615428 () SeekEntryResult!10510)

(declare-fun b!1399252 () Bool)

(declare-fun e!792163 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!615427 () array!95682)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10510)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10510)

(assert (=> b!1399252 (= e!792163 (= (seekEntryOrOpen!0 lt!615426 lt!615427 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126061 lt!615428) (index!44416 lt!615428) (index!44416 lt!615428) (select (arr!46193 a!2901) j!112) lt!615427 mask!2840)))))

(declare-fun b!1399253 () Bool)

(declare-fun e!792159 () Bool)

(assert (=> b!1399253 (= e!792159 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1399253 e!792163))

(declare-fun res!938008 () Bool)

(assert (=> b!1399253 (=> (not res!938008) (not e!792163))))

(declare-fun lt!615430 () SeekEntryResult!10510)

(assert (=> b!1399253 (= res!938008 (and (not (undefined!11322 lt!615428)) (= (index!44416 lt!615428) i!1037) (bvslt (x!126061 lt!615428) (x!126061 lt!615430)) (= (select (store (arr!46193 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44416 lt!615428)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615432 () (_ BitVec 32))

(declare-datatypes ((Unit!47024 0))(
  ( (Unit!47025) )
))
(declare-fun lt!615429 () Unit!47024)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47024)

(assert (=> b!1399253 (= lt!615429 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615432 (x!126061 lt!615430) (index!44416 lt!615430) (x!126061 lt!615428) (index!44416 lt!615428) (undefined!11322 lt!615428) mask!2840))))

(declare-fun e!792161 () Bool)

(declare-fun b!1399254 () Bool)

(assert (=> b!1399254 (= e!792161 (= (seekEntryOrOpen!0 (select (arr!46193 a!2901) j!112) a!2901 mask!2840) (Found!10510 j!112)))))

(declare-fun b!1399255 () Bool)

(declare-fun res!937999 () Bool)

(assert (=> b!1399255 (=> (not res!937999) (not e!792164))))

(assert (=> b!1399255 (= res!937999 (validKeyInArray!0 (select (arr!46193 a!2901) j!112)))))

(declare-fun b!1399256 () Bool)

(declare-fun e!792160 () Bool)

(assert (=> b!1399256 (= e!792160 e!792159)))

(declare-fun res!938005 () Bool)

(assert (=> b!1399256 (=> res!938005 e!792159)))

(assert (=> b!1399256 (= res!938005 (or (= lt!615430 lt!615428) (not (is-Intermediate!10510 lt!615428))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399256 (= lt!615428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615426 mask!2840) lt!615426 lt!615427 mask!2840))))

(assert (=> b!1399256 (= lt!615426 (select (store (arr!46193 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399256 (= lt!615427 (array!95683 (store (arr!46193 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46743 a!2901)))))

(declare-fun b!1399257 () Bool)

(declare-fun res!938006 () Bool)

(assert (=> b!1399257 (=> (not res!938006) (not e!792164))))

(assert (=> b!1399257 (= res!938006 (and (= (size!46743 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46743 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46743 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399258 () Bool)

(declare-fun res!938004 () Bool)

(assert (=> b!1399258 (=> (not res!938004) (not e!792164))))

(declare-datatypes ((List!32712 0))(
  ( (Nil!32709) (Cons!32708 (h!33953 (_ BitVec 64)) (t!47406 List!32712)) )
))
(declare-fun arrayNoDuplicates!0 (array!95682 (_ BitVec 32) List!32712) Bool)

(assert (=> b!1399258 (= res!938004 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32709))))

(declare-fun b!1399259 () Bool)

(assert (=> b!1399259 (= e!792164 (not e!792160))))

(declare-fun res!938003 () Bool)

(assert (=> b!1399259 (=> res!938003 e!792160)))

(assert (=> b!1399259 (= res!938003 (or (not (is-Intermediate!10510 lt!615430)) (undefined!11322 lt!615430)))))

(assert (=> b!1399259 e!792161))

(declare-fun res!938007 () Bool)

(assert (=> b!1399259 (=> (not res!938007) (not e!792161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95682 (_ BitVec 32)) Bool)

(assert (=> b!1399259 (= res!938007 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615431 () Unit!47024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47024)

(assert (=> b!1399259 (= lt!615431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399259 (= lt!615430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615432 (select (arr!46193 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399259 (= lt!615432 (toIndex!0 (select (arr!46193 a!2901) j!112) mask!2840))))

(declare-fun b!1399260 () Bool)

(declare-fun res!938001 () Bool)

(assert (=> b!1399260 (=> (not res!938001) (not e!792164))))

(assert (=> b!1399260 (= res!938001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120210 res!938000) b!1399257))

(assert (= (and b!1399257 res!938006) b!1399251))

(assert (= (and b!1399251 res!938002) b!1399255))

(assert (= (and b!1399255 res!937999) b!1399260))

(assert (= (and b!1399260 res!938001) b!1399258))

(assert (= (and b!1399258 res!938004) b!1399259))

(assert (= (and b!1399259 res!938007) b!1399254))

(assert (= (and b!1399259 (not res!938003)) b!1399256))

(assert (= (and b!1399256 (not res!938005)) b!1399253))

(assert (= (and b!1399253 res!938008) b!1399252))

(declare-fun m!1286511 () Bool)

(assert (=> b!1399253 m!1286511))

(declare-fun m!1286513 () Bool)

(assert (=> b!1399253 m!1286513))

(declare-fun m!1286515 () Bool)

(assert (=> b!1399253 m!1286515))

(declare-fun m!1286517 () Bool)

(assert (=> start!120210 m!1286517))

(declare-fun m!1286519 () Bool)

(assert (=> start!120210 m!1286519))

(declare-fun m!1286521 () Bool)

(assert (=> b!1399251 m!1286521))

(assert (=> b!1399251 m!1286521))

(declare-fun m!1286523 () Bool)

(assert (=> b!1399251 m!1286523))

(declare-fun m!1286525 () Bool)

(assert (=> b!1399254 m!1286525))

(assert (=> b!1399254 m!1286525))

(declare-fun m!1286527 () Bool)

(assert (=> b!1399254 m!1286527))

(assert (=> b!1399259 m!1286525))

(declare-fun m!1286529 () Bool)

(assert (=> b!1399259 m!1286529))

(assert (=> b!1399259 m!1286525))

(declare-fun m!1286531 () Bool)

(assert (=> b!1399259 m!1286531))

(declare-fun m!1286533 () Bool)

(assert (=> b!1399259 m!1286533))

(assert (=> b!1399259 m!1286525))

(declare-fun m!1286535 () Bool)

(assert (=> b!1399259 m!1286535))

(declare-fun m!1286537 () Bool)

(assert (=> b!1399256 m!1286537))

(assert (=> b!1399256 m!1286537))

(declare-fun m!1286539 () Bool)

(assert (=> b!1399256 m!1286539))

(assert (=> b!1399256 m!1286511))

(declare-fun m!1286541 () Bool)

(assert (=> b!1399256 m!1286541))

(declare-fun m!1286543 () Bool)

(assert (=> b!1399260 m!1286543))

(declare-fun m!1286545 () Bool)

(assert (=> b!1399258 m!1286545))

(assert (=> b!1399255 m!1286525))

(assert (=> b!1399255 m!1286525))

(declare-fun m!1286547 () Bool)

(assert (=> b!1399255 m!1286547))

(declare-fun m!1286549 () Bool)

(assert (=> b!1399252 m!1286549))

(assert (=> b!1399252 m!1286525))

(assert (=> b!1399252 m!1286525))

(declare-fun m!1286551 () Bool)

(assert (=> b!1399252 m!1286551))

(push 1)

