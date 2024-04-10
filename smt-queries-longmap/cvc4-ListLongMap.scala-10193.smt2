; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120088 () Bool)

(assert start!120088)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95617 0))(
  ( (array!95618 (arr!46162 (Array (_ BitVec 32) (_ BitVec 64))) (size!46712 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95617)

(declare-fun e!791527 () Bool)

(declare-fun b!1398148 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10479 0))(
  ( (MissingZero!10479 (index!44287 (_ BitVec 32))) (Found!10479 (index!44288 (_ BitVec 32))) (Intermediate!10479 (undefined!11291 Bool) (index!44289 (_ BitVec 32)) (x!125933 (_ BitVec 32))) (Undefined!10479) (MissingVacant!10479 (index!44290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95617 (_ BitVec 32)) SeekEntryResult!10479)

(assert (=> b!1398148 (= e!791527 (= (seekEntryOrOpen!0 (select (arr!46162 a!2901) j!112) a!2901 mask!2840) (Found!10479 j!112)))))

(declare-fun b!1398149 () Bool)

(declare-fun e!791528 () Bool)

(declare-fun e!791524 () Bool)

(assert (=> b!1398149 (= e!791528 e!791524)))

(declare-fun res!937063 () Bool)

(assert (=> b!1398149 (=> res!937063 e!791524)))

(declare-fun lt!614738 () SeekEntryResult!10479)

(declare-fun lt!614739 () SeekEntryResult!10479)

(assert (=> b!1398149 (= res!937063 (or (= lt!614738 lt!614739) (not (is-Intermediate!10479 lt!614739))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614737 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95617 (_ BitVec 32)) SeekEntryResult!10479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398149 (= lt!614739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614737 mask!2840) lt!614737 (array!95618 (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46712 a!2901)) mask!2840))))

(assert (=> b!1398149 (= lt!614737 (select (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398150 () Bool)

(declare-fun res!937065 () Bool)

(declare-fun e!791525 () Bool)

(assert (=> b!1398150 (=> (not res!937065) (not e!791525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398150 (= res!937065 (validKeyInArray!0 (select (arr!46162 a!2901) i!1037)))))

(declare-fun b!1398151 () Bool)

(declare-fun res!937064 () Bool)

(assert (=> b!1398151 (=> (not res!937064) (not e!791525))))

(assert (=> b!1398151 (= res!937064 (and (= (size!46712 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46712 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46712 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398153 () Bool)

(declare-fun res!937069 () Bool)

(assert (=> b!1398153 (=> (not res!937069) (not e!791525))))

(assert (=> b!1398153 (= res!937069 (validKeyInArray!0 (select (arr!46162 a!2901) j!112)))))

(declare-fun b!1398154 () Bool)

(declare-fun res!937062 () Bool)

(assert (=> b!1398154 (=> (not res!937062) (not e!791525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95617 (_ BitVec 32)) Bool)

(assert (=> b!1398154 (= res!937062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398155 () Bool)

(assert (=> b!1398155 (= e!791524 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1398155 (and (not (undefined!11291 lt!614739)) (= (index!44289 lt!614739) i!1037) (bvslt (x!125933 lt!614739) (x!125933 lt!614738)) (= (select (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44289 lt!614739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614741 () (_ BitVec 32))

(declare-datatypes ((Unit!46962 0))(
  ( (Unit!46963) )
))
(declare-fun lt!614740 () Unit!46962)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46962)

(assert (=> b!1398155 (= lt!614740 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614741 (x!125933 lt!614738) (index!44289 lt!614738) (x!125933 lt!614739) (index!44289 lt!614739) (undefined!11291 lt!614739) mask!2840))))

(declare-fun b!1398156 () Bool)

(assert (=> b!1398156 (= e!791525 (not e!791528))))

(declare-fun res!937067 () Bool)

(assert (=> b!1398156 (=> res!937067 e!791528)))

(assert (=> b!1398156 (= res!937067 (or (not (is-Intermediate!10479 lt!614738)) (undefined!11291 lt!614738)))))

(assert (=> b!1398156 e!791527))

(declare-fun res!937068 () Bool)

(assert (=> b!1398156 (=> (not res!937068) (not e!791527))))

(assert (=> b!1398156 (= res!937068 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614742 () Unit!46962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46962)

(assert (=> b!1398156 (= lt!614742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398156 (= lt!614738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614741 (select (arr!46162 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398156 (= lt!614741 (toIndex!0 (select (arr!46162 a!2901) j!112) mask!2840))))

(declare-fun res!937061 () Bool)

(assert (=> start!120088 (=> (not res!937061) (not e!791525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120088 (= res!937061 (validMask!0 mask!2840))))

(assert (=> start!120088 e!791525))

(assert (=> start!120088 true))

(declare-fun array_inv!35190 (array!95617) Bool)

(assert (=> start!120088 (array_inv!35190 a!2901)))

(declare-fun b!1398152 () Bool)

(declare-fun res!937066 () Bool)

(assert (=> b!1398152 (=> (not res!937066) (not e!791525))))

(declare-datatypes ((List!32681 0))(
  ( (Nil!32678) (Cons!32677 (h!33919 (_ BitVec 64)) (t!47375 List!32681)) )
))
(declare-fun arrayNoDuplicates!0 (array!95617 (_ BitVec 32) List!32681) Bool)

(assert (=> b!1398152 (= res!937066 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32678))))

(assert (= (and start!120088 res!937061) b!1398151))

(assert (= (and b!1398151 res!937064) b!1398150))

(assert (= (and b!1398150 res!937065) b!1398153))

(assert (= (and b!1398153 res!937069) b!1398154))

(assert (= (and b!1398154 res!937062) b!1398152))

(assert (= (and b!1398152 res!937066) b!1398156))

(assert (= (and b!1398156 res!937068) b!1398148))

(assert (= (and b!1398156 (not res!937067)) b!1398149))

(assert (= (and b!1398149 (not res!937063)) b!1398155))

(declare-fun m!1285165 () Bool)

(assert (=> start!120088 m!1285165))

(declare-fun m!1285167 () Bool)

(assert (=> start!120088 m!1285167))

(declare-fun m!1285169 () Bool)

(assert (=> b!1398148 m!1285169))

(assert (=> b!1398148 m!1285169))

(declare-fun m!1285171 () Bool)

(assert (=> b!1398148 m!1285171))

(assert (=> b!1398156 m!1285169))

(declare-fun m!1285173 () Bool)

(assert (=> b!1398156 m!1285173))

(assert (=> b!1398156 m!1285169))

(assert (=> b!1398156 m!1285169))

(declare-fun m!1285175 () Bool)

(assert (=> b!1398156 m!1285175))

(declare-fun m!1285177 () Bool)

(assert (=> b!1398156 m!1285177))

(declare-fun m!1285179 () Bool)

(assert (=> b!1398156 m!1285179))

(declare-fun m!1285181 () Bool)

(assert (=> b!1398149 m!1285181))

(declare-fun m!1285183 () Bool)

(assert (=> b!1398149 m!1285183))

(assert (=> b!1398149 m!1285181))

(declare-fun m!1285185 () Bool)

(assert (=> b!1398149 m!1285185))

(declare-fun m!1285187 () Bool)

(assert (=> b!1398149 m!1285187))

(declare-fun m!1285189 () Bool)

(assert (=> b!1398154 m!1285189))

(declare-fun m!1285191 () Bool)

(assert (=> b!1398152 m!1285191))

(assert (=> b!1398155 m!1285183))

(declare-fun m!1285193 () Bool)

(assert (=> b!1398155 m!1285193))

(declare-fun m!1285195 () Bool)

(assert (=> b!1398155 m!1285195))

(declare-fun m!1285197 () Bool)

(assert (=> b!1398150 m!1285197))

(assert (=> b!1398150 m!1285197))

(declare-fun m!1285199 () Bool)

(assert (=> b!1398150 m!1285199))

(assert (=> b!1398153 m!1285169))

(assert (=> b!1398153 m!1285169))

(declare-fun m!1285201 () Bool)

(assert (=> b!1398153 m!1285201))

(push 1)

