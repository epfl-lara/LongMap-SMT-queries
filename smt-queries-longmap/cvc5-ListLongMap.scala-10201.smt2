; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120192 () Bool)

(assert start!120192)

(declare-fun b!1399006 () Bool)

(declare-fun res!937762 () Bool)

(declare-fun e!792026 () Bool)

(assert (=> b!1399006 (=> (not res!937762) (not e!792026))))

(declare-datatypes ((array!95664 0))(
  ( (array!95665 (arr!46184 (Array (_ BitVec 32) (_ BitVec 64))) (size!46734 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95664)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399006 (= res!937762 (validKeyInArray!0 (select (arr!46184 a!2901) i!1037)))))

(declare-fun res!937754 () Bool)

(assert (=> start!120192 (=> (not res!937754) (not e!792026))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120192 (= res!937754 (validMask!0 mask!2840))))

(assert (=> start!120192 e!792026))

(assert (=> start!120192 true))

(declare-fun array_inv!35212 (array!95664) Bool)

(assert (=> start!120192 (array_inv!35212 a!2901)))

(declare-fun b!1399007 () Bool)

(declare-fun res!937758 () Bool)

(assert (=> b!1399007 (=> (not res!937758) (not e!792026))))

(declare-datatypes ((List!32703 0))(
  ( (Nil!32700) (Cons!32699 (h!33944 (_ BitVec 64)) (t!47397 List!32703)) )
))
(declare-fun arrayNoDuplicates!0 (array!95664 (_ BitVec 32) List!32703) Bool)

(assert (=> b!1399007 (= res!937758 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32700))))

(declare-fun b!1399008 () Bool)

(declare-fun res!937756 () Bool)

(assert (=> b!1399008 (=> (not res!937756) (not e!792026))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399008 (= res!937756 (validKeyInArray!0 (select (arr!46184 a!2901) j!112)))))

(declare-fun b!1399009 () Bool)

(declare-fun e!792022 () Bool)

(assert (=> b!1399009 (= e!792022 true)))

(declare-datatypes ((SeekEntryResult!10501 0))(
  ( (MissingZero!10501 (index!44378 (_ BitVec 32))) (Found!10501 (index!44379 (_ BitVec 32))) (Intermediate!10501 (undefined!11313 Bool) (index!44380 (_ BitVec 32)) (x!126028 (_ BitVec 32))) (Undefined!10501) (MissingVacant!10501 (index!44381 (_ BitVec 32))) )
))
(declare-fun lt!615263 () SeekEntryResult!10501)

(declare-fun lt!615267 () SeekEntryResult!10501)

(assert (=> b!1399009 (and (not (undefined!11313 lt!615267)) (= (index!44380 lt!615267) i!1037) (bvslt (x!126028 lt!615267) (x!126028 lt!615263)) (= (select (store (arr!46184 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44380 lt!615267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615266 () (_ BitVec 32))

(declare-datatypes ((Unit!47006 0))(
  ( (Unit!47007) )
))
(declare-fun lt!615265 () Unit!47006)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47006)

(assert (=> b!1399009 (= lt!615265 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615266 (x!126028 lt!615263) (index!44380 lt!615263) (x!126028 lt!615267) (index!44380 lt!615267) (undefined!11313 lt!615267) mask!2840))))

(declare-fun b!1399010 () Bool)

(declare-fun e!792023 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95664 (_ BitVec 32)) SeekEntryResult!10501)

(assert (=> b!1399010 (= e!792023 (= (seekEntryOrOpen!0 (select (arr!46184 a!2901) j!112) a!2901 mask!2840) (Found!10501 j!112)))))

(declare-fun b!1399011 () Bool)

(declare-fun res!937759 () Bool)

(assert (=> b!1399011 (=> (not res!937759) (not e!792026))))

(assert (=> b!1399011 (= res!937759 (and (= (size!46734 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46734 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46734 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399012 () Bool)

(declare-fun e!792025 () Bool)

(assert (=> b!1399012 (= e!792025 e!792022)))

(declare-fun res!937760 () Bool)

(assert (=> b!1399012 (=> res!937760 e!792022)))

(assert (=> b!1399012 (= res!937760 (or (= lt!615263 lt!615267) (not (is-Intermediate!10501 lt!615267))))))

(declare-fun lt!615264 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95664 (_ BitVec 32)) SeekEntryResult!10501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399012 (= lt!615267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615264 mask!2840) lt!615264 (array!95665 (store (arr!46184 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46734 a!2901)) mask!2840))))

(assert (=> b!1399012 (= lt!615264 (select (store (arr!46184 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399013 () Bool)

(assert (=> b!1399013 (= e!792026 (not e!792025))))

(declare-fun res!937757 () Bool)

(assert (=> b!1399013 (=> res!937757 e!792025)))

(assert (=> b!1399013 (= res!937757 (or (not (is-Intermediate!10501 lt!615263)) (undefined!11313 lt!615263)))))

(assert (=> b!1399013 e!792023))

(declare-fun res!937755 () Bool)

(assert (=> b!1399013 (=> (not res!937755) (not e!792023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95664 (_ BitVec 32)) Bool)

(assert (=> b!1399013 (= res!937755 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615262 () Unit!47006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47006)

(assert (=> b!1399013 (= lt!615262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399013 (= lt!615263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615266 (select (arr!46184 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399013 (= lt!615266 (toIndex!0 (select (arr!46184 a!2901) j!112) mask!2840))))

(declare-fun b!1399014 () Bool)

(declare-fun res!937761 () Bool)

(assert (=> b!1399014 (=> (not res!937761) (not e!792026))))

(assert (=> b!1399014 (= res!937761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120192 res!937754) b!1399011))

(assert (= (and b!1399011 res!937759) b!1399006))

(assert (= (and b!1399006 res!937762) b!1399008))

(assert (= (and b!1399008 res!937756) b!1399014))

(assert (= (and b!1399014 res!937761) b!1399007))

(assert (= (and b!1399007 res!937758) b!1399013))

(assert (= (and b!1399013 res!937755) b!1399010))

(assert (= (and b!1399013 (not res!937757)) b!1399012))

(assert (= (and b!1399012 (not res!937760)) b!1399009))

(declare-fun m!1286169 () Bool)

(assert (=> start!120192 m!1286169))

(declare-fun m!1286171 () Bool)

(assert (=> start!120192 m!1286171))

(declare-fun m!1286173 () Bool)

(assert (=> b!1399007 m!1286173))

(declare-fun m!1286175 () Bool)

(assert (=> b!1399008 m!1286175))

(assert (=> b!1399008 m!1286175))

(declare-fun m!1286177 () Bool)

(assert (=> b!1399008 m!1286177))

(declare-fun m!1286179 () Bool)

(assert (=> b!1399014 m!1286179))

(declare-fun m!1286181 () Bool)

(assert (=> b!1399012 m!1286181))

(declare-fun m!1286183 () Bool)

(assert (=> b!1399012 m!1286183))

(assert (=> b!1399012 m!1286181))

(declare-fun m!1286185 () Bool)

(assert (=> b!1399012 m!1286185))

(declare-fun m!1286187 () Bool)

(assert (=> b!1399012 m!1286187))

(assert (=> b!1399009 m!1286183))

(declare-fun m!1286189 () Bool)

(assert (=> b!1399009 m!1286189))

(declare-fun m!1286191 () Bool)

(assert (=> b!1399009 m!1286191))

(assert (=> b!1399013 m!1286175))

(declare-fun m!1286193 () Bool)

(assert (=> b!1399013 m!1286193))

(assert (=> b!1399013 m!1286175))

(declare-fun m!1286195 () Bool)

(assert (=> b!1399013 m!1286195))

(declare-fun m!1286197 () Bool)

(assert (=> b!1399013 m!1286197))

(assert (=> b!1399013 m!1286175))

(declare-fun m!1286199 () Bool)

(assert (=> b!1399013 m!1286199))

(declare-fun m!1286201 () Bool)

(assert (=> b!1399006 m!1286201))

(assert (=> b!1399006 m!1286201))

(declare-fun m!1286203 () Bool)

(assert (=> b!1399006 m!1286203))

(assert (=> b!1399010 m!1286175))

(assert (=> b!1399010 m!1286175))

(declare-fun m!1286205 () Bool)

(assert (=> b!1399010 m!1286205))

(push 1)

