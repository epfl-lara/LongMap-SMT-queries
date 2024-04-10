; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120096 () Bool)

(assert start!120096)

(declare-fun res!937172 () Bool)

(declare-fun e!791589 () Bool)

(assert (=> start!120096 (=> (not res!937172) (not e!791589))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120096 (= res!937172 (validMask!0 mask!2840))))

(assert (=> start!120096 e!791589))

(assert (=> start!120096 true))

(declare-datatypes ((array!95625 0))(
  ( (array!95626 (arr!46166 (Array (_ BitVec 32) (_ BitVec 64))) (size!46716 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95625)

(declare-fun array_inv!35194 (array!95625) Bool)

(assert (=> start!120096 (array_inv!35194 a!2901)))

(declare-fun b!1398258 () Bool)

(declare-fun res!937173 () Bool)

(assert (=> b!1398258 (=> (not res!937173) (not e!791589))))

(declare-datatypes ((List!32685 0))(
  ( (Nil!32682) (Cons!32681 (h!33923 (_ BitVec 64)) (t!47379 List!32685)) )
))
(declare-fun arrayNoDuplicates!0 (array!95625 (_ BitVec 32) List!32685) Bool)

(assert (=> b!1398258 (= res!937173 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32682))))

(declare-fun b!1398259 () Bool)

(declare-fun e!791587 () Bool)

(declare-fun e!791588 () Bool)

(assert (=> b!1398259 (= e!791587 e!791588)))

(declare-fun res!937174 () Bool)

(assert (=> b!1398259 (=> res!937174 e!791588)))

(assert (=> b!1398259 (= res!937174 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10483 0))(
  ( (MissingZero!10483 (index!44303 (_ BitVec 32))) (Found!10483 (index!44304 (_ BitVec 32))) (Intermediate!10483 (undefined!11295 Bool) (index!44305 (_ BitVec 32)) (x!125953 (_ BitVec 32))) (Undefined!10483) (MissingVacant!10483 (index!44306 (_ BitVec 32))) )
))
(declare-fun lt!614811 () SeekEntryResult!10483)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614813 () SeekEntryResult!10483)

(assert (=> b!1398259 (and (not (undefined!11295 lt!614811)) (= (index!44305 lt!614811) i!1037) (bvslt (x!125953 lt!614811) (x!125953 lt!614813)) (= (select (store (arr!46166 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44305 lt!614811)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614812 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!46970 0))(
  ( (Unit!46971) )
))
(declare-fun lt!614810 () Unit!46970)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46970)

(assert (=> b!1398259 (= lt!614810 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614812 (x!125953 lt!614813) (index!44305 lt!614813) (x!125953 lt!614811) (index!44305 lt!614811) (undefined!11295 lt!614811) mask!2840))))

(declare-fun b!1398260 () Bool)

(declare-fun res!937171 () Bool)

(assert (=> b!1398260 (=> (not res!937171) (not e!791589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398260 (= res!937171 (validKeyInArray!0 (select (arr!46166 a!2901) j!112)))))

(declare-fun b!1398261 () Bool)

(declare-fun e!791590 () Bool)

(assert (=> b!1398261 (= e!791590 e!791587)))

(declare-fun res!937179 () Bool)

(assert (=> b!1398261 (=> res!937179 e!791587)))

(assert (=> b!1398261 (= res!937179 (or (= lt!614813 lt!614811) (not (is-Intermediate!10483 lt!614811))))))

(declare-fun lt!614809 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95625 (_ BitVec 32)) SeekEntryResult!10483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398261 (= lt!614811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614809 mask!2840) lt!614809 (array!95626 (store (arr!46166 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46716 a!2901)) mask!2840))))

(assert (=> b!1398261 (= lt!614809 (select (store (arr!46166 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398262 () Bool)

(declare-fun res!937175 () Bool)

(assert (=> b!1398262 (=> (not res!937175) (not e!791589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95625 (_ BitVec 32)) Bool)

(assert (=> b!1398262 (= res!937175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398263 () Bool)

(assert (=> b!1398263 (= e!791588 (validKeyInArray!0 lt!614809))))

(declare-fun b!1398264 () Bool)

(declare-fun e!791591 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95625 (_ BitVec 32)) SeekEntryResult!10483)

(assert (=> b!1398264 (= e!791591 (= (seekEntryOrOpen!0 (select (arr!46166 a!2901) j!112) a!2901 mask!2840) (Found!10483 j!112)))))

(declare-fun b!1398265 () Bool)

(declare-fun res!937178 () Bool)

(assert (=> b!1398265 (=> (not res!937178) (not e!791589))))

(assert (=> b!1398265 (= res!937178 (validKeyInArray!0 (select (arr!46166 a!2901) i!1037)))))

(declare-fun b!1398266 () Bool)

(declare-fun res!937177 () Bool)

(assert (=> b!1398266 (=> (not res!937177) (not e!791589))))

(assert (=> b!1398266 (= res!937177 (and (= (size!46716 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46716 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46716 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398267 () Bool)

(assert (=> b!1398267 (= e!791589 (not e!791590))))

(declare-fun res!937180 () Bool)

(assert (=> b!1398267 (=> res!937180 e!791590)))

(assert (=> b!1398267 (= res!937180 (or (not (is-Intermediate!10483 lt!614813)) (undefined!11295 lt!614813)))))

(assert (=> b!1398267 e!791591))

(declare-fun res!937176 () Bool)

(assert (=> b!1398267 (=> (not res!937176) (not e!791591))))

(assert (=> b!1398267 (= res!937176 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614814 () Unit!46970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46970)

(assert (=> b!1398267 (= lt!614814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398267 (= lt!614813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614812 (select (arr!46166 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398267 (= lt!614812 (toIndex!0 (select (arr!46166 a!2901) j!112) mask!2840))))

(assert (= (and start!120096 res!937172) b!1398266))

(assert (= (and b!1398266 res!937177) b!1398265))

(assert (= (and b!1398265 res!937178) b!1398260))

(assert (= (and b!1398260 res!937171) b!1398262))

(assert (= (and b!1398262 res!937175) b!1398258))

(assert (= (and b!1398258 res!937173) b!1398267))

(assert (= (and b!1398267 res!937176) b!1398264))

(assert (= (and b!1398267 (not res!937180)) b!1398261))

(assert (= (and b!1398261 (not res!937179)) b!1398259))

(assert (= (and b!1398259 (not res!937174)) b!1398263))

(declare-fun m!1285317 () Bool)

(assert (=> b!1398259 m!1285317))

(declare-fun m!1285319 () Bool)

(assert (=> b!1398259 m!1285319))

(declare-fun m!1285321 () Bool)

(assert (=> b!1398259 m!1285321))

(declare-fun m!1285323 () Bool)

(assert (=> b!1398258 m!1285323))

(declare-fun m!1285325 () Bool)

(assert (=> b!1398267 m!1285325))

(declare-fun m!1285327 () Bool)

(assert (=> b!1398267 m!1285327))

(assert (=> b!1398267 m!1285325))

(declare-fun m!1285329 () Bool)

(assert (=> b!1398267 m!1285329))

(assert (=> b!1398267 m!1285325))

(declare-fun m!1285331 () Bool)

(assert (=> b!1398267 m!1285331))

(declare-fun m!1285333 () Bool)

(assert (=> b!1398267 m!1285333))

(declare-fun m!1285335 () Bool)

(assert (=> b!1398261 m!1285335))

(assert (=> b!1398261 m!1285317))

(assert (=> b!1398261 m!1285335))

(declare-fun m!1285337 () Bool)

(assert (=> b!1398261 m!1285337))

(declare-fun m!1285339 () Bool)

(assert (=> b!1398261 m!1285339))

(assert (=> b!1398264 m!1285325))

(assert (=> b!1398264 m!1285325))

(declare-fun m!1285341 () Bool)

(assert (=> b!1398264 m!1285341))

(assert (=> b!1398260 m!1285325))

(assert (=> b!1398260 m!1285325))

(declare-fun m!1285343 () Bool)

(assert (=> b!1398260 m!1285343))

(declare-fun m!1285345 () Bool)

(assert (=> b!1398265 m!1285345))

(assert (=> b!1398265 m!1285345))

(declare-fun m!1285347 () Bool)

(assert (=> b!1398265 m!1285347))

(declare-fun m!1285349 () Bool)

(assert (=> b!1398262 m!1285349))

(declare-fun m!1285351 () Bool)

(assert (=> b!1398263 m!1285351))

(declare-fun m!1285353 () Bool)

(assert (=> start!120096 m!1285353))

(declare-fun m!1285355 () Bool)

(assert (=> start!120096 m!1285355))

(push 1)

