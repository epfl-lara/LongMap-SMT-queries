; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120194 () Bool)

(assert start!120194)

(declare-fun res!937782 () Bool)

(declare-fun e!792038 () Bool)

(assert (=> start!120194 (=> (not res!937782) (not e!792038))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120194 (= res!937782 (validMask!0 mask!2840))))

(assert (=> start!120194 e!792038))

(assert (=> start!120194 true))

(declare-datatypes ((array!95666 0))(
  ( (array!95667 (arr!46185 (Array (_ BitVec 32) (_ BitVec 64))) (size!46735 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95666)

(declare-fun array_inv!35213 (array!95666) Bool)

(assert (=> start!120194 (array_inv!35213 a!2901)))

(declare-fun b!1399033 () Bool)

(declare-fun res!937788 () Bool)

(assert (=> b!1399033 (=> (not res!937788) (not e!792038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95666 (_ BitVec 32)) Bool)

(assert (=> b!1399033 (= res!937788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399034 () Bool)

(declare-fun e!792040 () Bool)

(assert (=> b!1399034 (= e!792040 true)))

(declare-datatypes ((SeekEntryResult!10502 0))(
  ( (MissingZero!10502 (index!44382 (_ BitVec 32))) (Found!10502 (index!44383 (_ BitVec 32))) (Intermediate!10502 (undefined!11314 Bool) (index!44384 (_ BitVec 32)) (x!126029 (_ BitVec 32))) (Undefined!10502) (MissingVacant!10502 (index!44385 (_ BitVec 32))) )
))
(declare-fun lt!615282 () SeekEntryResult!10502)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615281 () SeekEntryResult!10502)

(assert (=> b!1399034 (and (not (undefined!11314 lt!615281)) (= (index!44384 lt!615281) i!1037) (bvslt (x!126029 lt!615281) (x!126029 lt!615282)) (= (select (store (arr!46185 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44384 lt!615281)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47008 0))(
  ( (Unit!47009) )
))
(declare-fun lt!615284 () Unit!47008)

(declare-fun lt!615285 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47008)

(assert (=> b!1399034 (= lt!615284 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615285 (x!126029 lt!615282) (index!44384 lt!615282) (x!126029 lt!615281) (index!44384 lt!615281) (undefined!11314 lt!615281) mask!2840))))

(declare-fun b!1399035 () Bool)

(declare-fun res!937785 () Bool)

(assert (=> b!1399035 (=> (not res!937785) (not e!792038))))

(declare-datatypes ((List!32704 0))(
  ( (Nil!32701) (Cons!32700 (h!33945 (_ BitVec 64)) (t!47398 List!32704)) )
))
(declare-fun arrayNoDuplicates!0 (array!95666 (_ BitVec 32) List!32704) Bool)

(assert (=> b!1399035 (= res!937785 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32701))))

(declare-fun b!1399036 () Bool)

(declare-fun res!937786 () Bool)

(assert (=> b!1399036 (=> (not res!937786) (not e!792038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399036 (= res!937786 (validKeyInArray!0 (select (arr!46185 a!2901) i!1037)))))

(declare-fun b!1399037 () Bool)

(declare-fun res!937789 () Bool)

(assert (=> b!1399037 (=> (not res!937789) (not e!792038))))

(assert (=> b!1399037 (= res!937789 (validKeyInArray!0 (select (arr!46185 a!2901) j!112)))))

(declare-fun e!792039 () Bool)

(declare-fun b!1399038 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95666 (_ BitVec 32)) SeekEntryResult!10502)

(assert (=> b!1399038 (= e!792039 (= (seekEntryOrOpen!0 (select (arr!46185 a!2901) j!112) a!2901 mask!2840) (Found!10502 j!112)))))

(declare-fun b!1399039 () Bool)

(declare-fun e!792041 () Bool)

(assert (=> b!1399039 (= e!792038 (not e!792041))))

(declare-fun res!937787 () Bool)

(assert (=> b!1399039 (=> res!937787 e!792041)))

(get-info :version)

(assert (=> b!1399039 (= res!937787 (or (not ((_ is Intermediate!10502) lt!615282)) (undefined!11314 lt!615282)))))

(assert (=> b!1399039 e!792039))

(declare-fun res!937781 () Bool)

(assert (=> b!1399039 (=> (not res!937781) (not e!792039))))

(assert (=> b!1399039 (= res!937781 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615283 () Unit!47008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47008)

(assert (=> b!1399039 (= lt!615283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95666 (_ BitVec 32)) SeekEntryResult!10502)

(assert (=> b!1399039 (= lt!615282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615285 (select (arr!46185 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399039 (= lt!615285 (toIndex!0 (select (arr!46185 a!2901) j!112) mask!2840))))

(declare-fun b!1399040 () Bool)

(declare-fun res!937784 () Bool)

(assert (=> b!1399040 (=> (not res!937784) (not e!792038))))

(assert (=> b!1399040 (= res!937784 (and (= (size!46735 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46735 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46735 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399041 () Bool)

(assert (=> b!1399041 (= e!792041 e!792040)))

(declare-fun res!937783 () Bool)

(assert (=> b!1399041 (=> res!937783 e!792040)))

(assert (=> b!1399041 (= res!937783 (or (= lt!615282 lt!615281) (not ((_ is Intermediate!10502) lt!615281))))))

(declare-fun lt!615280 () (_ BitVec 64))

(assert (=> b!1399041 (= lt!615281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615280 mask!2840) lt!615280 (array!95667 (store (arr!46185 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46735 a!2901)) mask!2840))))

(assert (=> b!1399041 (= lt!615280 (select (store (arr!46185 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120194 res!937782) b!1399040))

(assert (= (and b!1399040 res!937784) b!1399036))

(assert (= (and b!1399036 res!937786) b!1399037))

(assert (= (and b!1399037 res!937789) b!1399033))

(assert (= (and b!1399033 res!937788) b!1399035))

(assert (= (and b!1399035 res!937785) b!1399039))

(assert (= (and b!1399039 res!937781) b!1399038))

(assert (= (and b!1399039 (not res!937787)) b!1399041))

(assert (= (and b!1399041 (not res!937783)) b!1399034))

(declare-fun m!1286207 () Bool)

(assert (=> start!120194 m!1286207))

(declare-fun m!1286209 () Bool)

(assert (=> start!120194 m!1286209))

(declare-fun m!1286211 () Bool)

(assert (=> b!1399037 m!1286211))

(assert (=> b!1399037 m!1286211))

(declare-fun m!1286213 () Bool)

(assert (=> b!1399037 m!1286213))

(assert (=> b!1399038 m!1286211))

(assert (=> b!1399038 m!1286211))

(declare-fun m!1286215 () Bool)

(assert (=> b!1399038 m!1286215))

(declare-fun m!1286217 () Bool)

(assert (=> b!1399033 m!1286217))

(declare-fun m!1286219 () Bool)

(assert (=> b!1399041 m!1286219))

(declare-fun m!1286221 () Bool)

(assert (=> b!1399041 m!1286221))

(assert (=> b!1399041 m!1286219))

(declare-fun m!1286223 () Bool)

(assert (=> b!1399041 m!1286223))

(declare-fun m!1286225 () Bool)

(assert (=> b!1399041 m!1286225))

(declare-fun m!1286227 () Bool)

(assert (=> b!1399036 m!1286227))

(assert (=> b!1399036 m!1286227))

(declare-fun m!1286229 () Bool)

(assert (=> b!1399036 m!1286229))

(assert (=> b!1399034 m!1286221))

(declare-fun m!1286231 () Bool)

(assert (=> b!1399034 m!1286231))

(declare-fun m!1286233 () Bool)

(assert (=> b!1399034 m!1286233))

(declare-fun m!1286235 () Bool)

(assert (=> b!1399035 m!1286235))

(assert (=> b!1399039 m!1286211))

(declare-fun m!1286237 () Bool)

(assert (=> b!1399039 m!1286237))

(assert (=> b!1399039 m!1286211))

(declare-fun m!1286239 () Bool)

(assert (=> b!1399039 m!1286239))

(assert (=> b!1399039 m!1286211))

(declare-fun m!1286241 () Bool)

(assert (=> b!1399039 m!1286241))

(declare-fun m!1286243 () Bool)

(assert (=> b!1399039 m!1286243))

(check-sat (not b!1399041) (not b!1399034) (not b!1399038) (not b!1399036) (not b!1399039) (not start!120194) (not b!1399037) (not b!1399033) (not b!1399035))
(check-sat)
