; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120196 () Bool)

(assert start!120196)

(declare-fun b!1399060 () Bool)

(declare-fun res!937809 () Bool)

(declare-fun e!792055 () Bool)

(assert (=> b!1399060 (=> (not res!937809) (not e!792055))))

(declare-datatypes ((array!95668 0))(
  ( (array!95669 (arr!46186 (Array (_ BitVec 32) (_ BitVec 64))) (size!46736 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95668)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399060 (= res!937809 (validKeyInArray!0 (select (arr!46186 a!2901) j!112)))))

(declare-fun b!1399061 () Bool)

(declare-fun e!792056 () Bool)

(assert (=> b!1399061 (= e!792056 true)))

(declare-datatypes ((SeekEntryResult!10503 0))(
  ( (MissingZero!10503 (index!44386 (_ BitVec 32))) (Found!10503 (index!44387 (_ BitVec 32))) (Intermediate!10503 (undefined!11315 Bool) (index!44388 (_ BitVec 32)) (x!126030 (_ BitVec 32))) (Undefined!10503) (MissingVacant!10503 (index!44389 (_ BitVec 32))) )
))
(declare-fun lt!615299 () SeekEntryResult!10503)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615302 () SeekEntryResult!10503)

(assert (=> b!1399061 (and (not (undefined!11315 lt!615299)) (= (index!44388 lt!615299) i!1037) (bvslt (x!126030 lt!615299) (x!126030 lt!615302)) (= (select (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44388 lt!615299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47010 0))(
  ( (Unit!47011) )
))
(declare-fun lt!615303 () Unit!47010)

(declare-fun lt!615298 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47010)

(assert (=> b!1399061 (= lt!615303 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615298 (x!126030 lt!615302) (index!44388 lt!615302) (x!126030 lt!615299) (index!44388 lt!615299) (undefined!11315 lt!615299) mask!2840))))

(declare-fun b!1399062 () Bool)

(declare-fun e!792054 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95668 (_ BitVec 32)) SeekEntryResult!10503)

(assert (=> b!1399062 (= e!792054 (= (seekEntryOrOpen!0 (select (arr!46186 a!2901) j!112) a!2901 mask!2840) (Found!10503 j!112)))))

(declare-fun b!1399063 () Bool)

(declare-fun res!937812 () Bool)

(assert (=> b!1399063 (=> (not res!937812) (not e!792055))))

(assert (=> b!1399063 (= res!937812 (validKeyInArray!0 (select (arr!46186 a!2901) i!1037)))))

(declare-fun res!937813 () Bool)

(assert (=> start!120196 (=> (not res!937813) (not e!792055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120196 (= res!937813 (validMask!0 mask!2840))))

(assert (=> start!120196 e!792055))

(assert (=> start!120196 true))

(declare-fun array_inv!35214 (array!95668) Bool)

(assert (=> start!120196 (array_inv!35214 a!2901)))

(declare-fun b!1399064 () Bool)

(declare-fun res!937808 () Bool)

(assert (=> b!1399064 (=> (not res!937808) (not e!792055))))

(declare-datatypes ((List!32705 0))(
  ( (Nil!32702) (Cons!32701 (h!33946 (_ BitVec 64)) (t!47399 List!32705)) )
))
(declare-fun arrayNoDuplicates!0 (array!95668 (_ BitVec 32) List!32705) Bool)

(assert (=> b!1399064 (= res!937808 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32702))))

(declare-fun b!1399065 () Bool)

(declare-fun res!937815 () Bool)

(assert (=> b!1399065 (=> (not res!937815) (not e!792055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95668 (_ BitVec 32)) Bool)

(assert (=> b!1399065 (= res!937815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399066 () Bool)

(declare-fun res!937811 () Bool)

(assert (=> b!1399066 (=> (not res!937811) (not e!792055))))

(assert (=> b!1399066 (= res!937811 (and (= (size!46736 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46736 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46736 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399067 () Bool)

(declare-fun e!792052 () Bool)

(assert (=> b!1399067 (= e!792055 (not e!792052))))

(declare-fun res!937814 () Bool)

(assert (=> b!1399067 (=> res!937814 e!792052)))

(assert (=> b!1399067 (= res!937814 (or (not (is-Intermediate!10503 lt!615302)) (undefined!11315 lt!615302)))))

(assert (=> b!1399067 e!792054))

(declare-fun res!937810 () Bool)

(assert (=> b!1399067 (=> (not res!937810) (not e!792054))))

(assert (=> b!1399067 (= res!937810 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615300 () Unit!47010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47010)

(assert (=> b!1399067 (= lt!615300 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95668 (_ BitVec 32)) SeekEntryResult!10503)

(assert (=> b!1399067 (= lt!615302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615298 (select (arr!46186 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399067 (= lt!615298 (toIndex!0 (select (arr!46186 a!2901) j!112) mask!2840))))

(declare-fun b!1399068 () Bool)

(assert (=> b!1399068 (= e!792052 e!792056)))

(declare-fun res!937816 () Bool)

(assert (=> b!1399068 (=> res!937816 e!792056)))

(assert (=> b!1399068 (= res!937816 (or (= lt!615302 lt!615299) (not (is-Intermediate!10503 lt!615299))))))

(declare-fun lt!615301 () (_ BitVec 64))

(assert (=> b!1399068 (= lt!615299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615301 mask!2840) lt!615301 (array!95669 (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46736 a!2901)) mask!2840))))

(assert (=> b!1399068 (= lt!615301 (select (store (arr!46186 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120196 res!937813) b!1399066))

(assert (= (and b!1399066 res!937811) b!1399063))

(assert (= (and b!1399063 res!937812) b!1399060))

(assert (= (and b!1399060 res!937809) b!1399065))

(assert (= (and b!1399065 res!937815) b!1399064))

(assert (= (and b!1399064 res!937808) b!1399067))

(assert (= (and b!1399067 res!937810) b!1399062))

(assert (= (and b!1399067 (not res!937814)) b!1399068))

(assert (= (and b!1399068 (not res!937816)) b!1399061))

(declare-fun m!1286245 () Bool)

(assert (=> b!1399065 m!1286245))

(declare-fun m!1286247 () Bool)

(assert (=> b!1399060 m!1286247))

(assert (=> b!1399060 m!1286247))

(declare-fun m!1286249 () Bool)

(assert (=> b!1399060 m!1286249))

(declare-fun m!1286251 () Bool)

(assert (=> b!1399061 m!1286251))

(declare-fun m!1286253 () Bool)

(assert (=> b!1399061 m!1286253))

(declare-fun m!1286255 () Bool)

(assert (=> b!1399061 m!1286255))

(declare-fun m!1286257 () Bool)

(assert (=> b!1399068 m!1286257))

(assert (=> b!1399068 m!1286251))

(assert (=> b!1399068 m!1286257))

(declare-fun m!1286259 () Bool)

(assert (=> b!1399068 m!1286259))

(declare-fun m!1286261 () Bool)

(assert (=> b!1399068 m!1286261))

(declare-fun m!1286263 () Bool)

(assert (=> start!120196 m!1286263))

(declare-fun m!1286265 () Bool)

(assert (=> start!120196 m!1286265))

(assert (=> b!1399062 m!1286247))

(assert (=> b!1399062 m!1286247))

(declare-fun m!1286267 () Bool)

(assert (=> b!1399062 m!1286267))

(assert (=> b!1399067 m!1286247))

(declare-fun m!1286269 () Bool)

(assert (=> b!1399067 m!1286269))

(assert (=> b!1399067 m!1286247))

(declare-fun m!1286271 () Bool)

(assert (=> b!1399067 m!1286271))

(assert (=> b!1399067 m!1286247))

(declare-fun m!1286273 () Bool)

(assert (=> b!1399067 m!1286273))

(declare-fun m!1286275 () Bool)

(assert (=> b!1399067 m!1286275))

(declare-fun m!1286277 () Bool)

(assert (=> b!1399064 m!1286277))

(declare-fun m!1286279 () Bool)

(assert (=> b!1399063 m!1286279))

(assert (=> b!1399063 m!1286279))

(declare-fun m!1286281 () Bool)

(assert (=> b!1399063 m!1286281))

(push 1)

