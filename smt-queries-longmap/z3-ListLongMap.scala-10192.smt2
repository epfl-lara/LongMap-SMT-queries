; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120266 () Bool)

(assert start!120266)

(declare-fun b!1399153 () Bool)

(declare-fun e!792190 () Bool)

(declare-fun e!792191 () Bool)

(assert (=> b!1399153 (= e!792190 (not e!792191))))

(declare-fun res!937383 () Bool)

(assert (=> b!1399153 (=> res!937383 e!792191)))

(declare-datatypes ((SeekEntryResult!10430 0))(
  ( (MissingZero!10430 (index!44091 (_ BitVec 32))) (Found!10430 (index!44092 (_ BitVec 32))) (Intermediate!10430 (undefined!11242 Bool) (index!44093 (_ BitVec 32)) (x!125895 (_ BitVec 32))) (Undefined!10430) (MissingVacant!10430 (index!44094 (_ BitVec 32))) )
))
(declare-fun lt!615049 () SeekEntryResult!10430)

(get-info :version)

(assert (=> b!1399153 (= res!937383 (or (not ((_ is Intermediate!10430) lt!615049)) (undefined!11242 lt!615049)))))

(declare-fun e!792189 () Bool)

(assert (=> b!1399153 e!792189))

(declare-fun res!937386 () Bool)

(assert (=> b!1399153 (=> (not res!937386) (not e!792189))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95717 0))(
  ( (array!95718 (arr!46210 (Array (_ BitVec 32) (_ BitVec 64))) (size!46761 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95717)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95717 (_ BitVec 32)) Bool)

(assert (=> b!1399153 (= res!937386 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46891 0))(
  ( (Unit!46892) )
))
(declare-fun lt!615045 () Unit!46891)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46891)

(assert (=> b!1399153 (= lt!615045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615048 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95717 (_ BitVec 32)) SeekEntryResult!10430)

(assert (=> b!1399153 (= lt!615049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615048 (select (arr!46210 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399153 (= lt!615048 (toIndex!0 (select (arr!46210 a!2901) j!112) mask!2840))))

(declare-fun b!1399154 () Bool)

(declare-fun res!937382 () Bool)

(assert (=> b!1399154 (=> (not res!937382) (not e!792190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399154 (= res!937382 (validKeyInArray!0 (select (arr!46210 a!2901) j!112)))))

(declare-fun b!1399155 () Bool)

(declare-fun res!937389 () Bool)

(assert (=> b!1399155 (=> (not res!937389) (not e!792190))))

(declare-datatypes ((List!32716 0))(
  ( (Nil!32713) (Cons!32712 (h!33962 (_ BitVec 64)) (t!47402 List!32716)) )
))
(declare-fun arrayNoDuplicates!0 (array!95717 (_ BitVec 32) List!32716) Bool)

(assert (=> b!1399155 (= res!937389 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32713))))

(declare-fun b!1399156 () Bool)

(declare-fun res!937387 () Bool)

(assert (=> b!1399156 (=> (not res!937387) (not e!792190))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399156 (= res!937387 (validKeyInArray!0 (select (arr!46210 a!2901) i!1037)))))

(declare-fun b!1399157 () Bool)

(declare-fun e!792188 () Bool)

(assert (=> b!1399157 (= e!792188 true)))

(declare-fun lt!615050 () SeekEntryResult!10430)

(assert (=> b!1399157 (and (not (undefined!11242 lt!615050)) (= (index!44093 lt!615050) i!1037) (bvslt (x!125895 lt!615050) (x!125895 lt!615049)) (= (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44093 lt!615050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615047 () Unit!46891)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46891)

(assert (=> b!1399157 (= lt!615047 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615048 (x!125895 lt!615049) (index!44093 lt!615049) (x!125895 lt!615050) (index!44093 lt!615050) (undefined!11242 lt!615050) mask!2840))))

(declare-fun b!1399158 () Bool)

(declare-fun res!937388 () Bool)

(assert (=> b!1399158 (=> (not res!937388) (not e!792190))))

(assert (=> b!1399158 (= res!937388 (and (= (size!46761 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46761 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46761 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95717 (_ BitVec 32)) SeekEntryResult!10430)

(assert (=> b!1399159 (= e!792189 (= (seekEntryOrOpen!0 (select (arr!46210 a!2901) j!112) a!2901 mask!2840) (Found!10430 j!112)))))

(declare-fun res!937390 () Bool)

(assert (=> start!120266 (=> (not res!937390) (not e!792190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120266 (= res!937390 (validMask!0 mask!2840))))

(assert (=> start!120266 e!792190))

(assert (=> start!120266 true))

(declare-fun array_inv!35491 (array!95717) Bool)

(assert (=> start!120266 (array_inv!35491 a!2901)))

(declare-fun b!1399160 () Bool)

(assert (=> b!1399160 (= e!792191 e!792188)))

(declare-fun res!937385 () Bool)

(assert (=> b!1399160 (=> res!937385 e!792188)))

(assert (=> b!1399160 (= res!937385 (or (= lt!615049 lt!615050) (not ((_ is Intermediate!10430) lt!615050))))))

(declare-fun lt!615046 () (_ BitVec 64))

(assert (=> b!1399160 (= lt!615050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615046 mask!2840) lt!615046 (array!95718 (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46761 a!2901)) mask!2840))))

(assert (=> b!1399160 (= lt!615046 (select (store (arr!46210 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399161 () Bool)

(declare-fun res!937384 () Bool)

(assert (=> b!1399161 (=> (not res!937384) (not e!792190))))

(assert (=> b!1399161 (= res!937384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120266 res!937390) b!1399158))

(assert (= (and b!1399158 res!937388) b!1399156))

(assert (= (and b!1399156 res!937387) b!1399154))

(assert (= (and b!1399154 res!937382) b!1399161))

(assert (= (and b!1399161 res!937384) b!1399155))

(assert (= (and b!1399155 res!937389) b!1399153))

(assert (= (and b!1399153 res!937386) b!1399159))

(assert (= (and b!1399153 (not res!937383)) b!1399160))

(assert (= (and b!1399160 (not res!937385)) b!1399157))

(declare-fun m!1286347 () Bool)

(assert (=> b!1399154 m!1286347))

(assert (=> b!1399154 m!1286347))

(declare-fun m!1286349 () Bool)

(assert (=> b!1399154 m!1286349))

(declare-fun m!1286351 () Bool)

(assert (=> b!1399155 m!1286351))

(assert (=> b!1399153 m!1286347))

(declare-fun m!1286353 () Bool)

(assert (=> b!1399153 m!1286353))

(assert (=> b!1399153 m!1286347))

(declare-fun m!1286355 () Bool)

(assert (=> b!1399153 m!1286355))

(declare-fun m!1286357 () Bool)

(assert (=> b!1399153 m!1286357))

(assert (=> b!1399153 m!1286347))

(declare-fun m!1286359 () Bool)

(assert (=> b!1399153 m!1286359))

(declare-fun m!1286361 () Bool)

(assert (=> b!1399156 m!1286361))

(assert (=> b!1399156 m!1286361))

(declare-fun m!1286363 () Bool)

(assert (=> b!1399156 m!1286363))

(declare-fun m!1286365 () Bool)

(assert (=> b!1399157 m!1286365))

(declare-fun m!1286367 () Bool)

(assert (=> b!1399157 m!1286367))

(declare-fun m!1286369 () Bool)

(assert (=> b!1399157 m!1286369))

(declare-fun m!1286371 () Bool)

(assert (=> b!1399161 m!1286371))

(declare-fun m!1286373 () Bool)

(assert (=> start!120266 m!1286373))

(declare-fun m!1286375 () Bool)

(assert (=> start!120266 m!1286375))

(assert (=> b!1399159 m!1286347))

(assert (=> b!1399159 m!1286347))

(declare-fun m!1286377 () Bool)

(assert (=> b!1399159 m!1286377))

(declare-fun m!1286379 () Bool)

(assert (=> b!1399160 m!1286379))

(assert (=> b!1399160 m!1286365))

(assert (=> b!1399160 m!1286379))

(declare-fun m!1286381 () Bool)

(assert (=> b!1399160 m!1286381))

(declare-fun m!1286383 () Bool)

(assert (=> b!1399160 m!1286383))

(check-sat (not b!1399153) (not b!1399156) (not b!1399157) (not b!1399154) (not b!1399159) (not b!1399160) (not b!1399155) (not start!120266) (not b!1399161))
(check-sat)
