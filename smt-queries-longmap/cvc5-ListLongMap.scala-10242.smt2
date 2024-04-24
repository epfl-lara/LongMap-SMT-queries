; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120696 () Bool)

(assert start!120696)

(declare-fun res!942191 () Bool)

(declare-fun e!795273 () Bool)

(assert (=> start!120696 (=> (not res!942191) (not e!795273))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120696 (= res!942191 (validMask!0 mask!2840))))

(assert (=> start!120696 e!795273))

(assert (=> start!120696 true))

(declare-datatypes ((array!96027 0))(
  ( (array!96028 (arr!46362 (Array (_ BitVec 32) (_ BitVec 64))) (size!46913 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96027)

(declare-fun array_inv!35643 (array!96027) Bool)

(assert (=> start!120696 (array_inv!35643 a!2901)))

(declare-fun b!1404362 () Bool)

(declare-fun res!942189 () Bool)

(assert (=> b!1404362 (=> (not res!942189) (not e!795273))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404362 (= res!942189 (validKeyInArray!0 (select (arr!46362 a!2901) j!112)))))

(declare-fun b!1404363 () Bool)

(declare-fun res!942195 () Bool)

(assert (=> b!1404363 (=> (not res!942195) (not e!795273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96027 (_ BitVec 32)) Bool)

(assert (=> b!1404363 (= res!942195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404364 () Bool)

(declare-fun res!942190 () Bool)

(assert (=> b!1404364 (=> (not res!942190) (not e!795273))))

(declare-datatypes ((List!32868 0))(
  ( (Nil!32865) (Cons!32864 (h!34120 (_ BitVec 64)) (t!47554 List!32868)) )
))
(declare-fun arrayNoDuplicates!0 (array!96027 (_ BitVec 32) List!32868) Bool)

(assert (=> b!1404364 (= res!942190 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32865))))

(declare-fun b!1404365 () Bool)

(declare-fun res!942196 () Bool)

(assert (=> b!1404365 (=> (not res!942196) (not e!795273))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404365 (= res!942196 (and (= (size!46913 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46913 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46913 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404366 () Bool)

(declare-fun res!942193 () Bool)

(assert (=> b!1404366 (=> (not res!942193) (not e!795273))))

(assert (=> b!1404366 (= res!942193 (validKeyInArray!0 (select (arr!46362 a!2901) i!1037)))))

(declare-fun b!1404367 () Bool)

(declare-fun e!795274 () Bool)

(declare-datatypes ((SeekEntryResult!10582 0))(
  ( (MissingZero!10582 (index!44705 (_ BitVec 32))) (Found!10582 (index!44706 (_ BitVec 32))) (Intermediate!10582 (undefined!11394 Bool) (index!44707 (_ BitVec 32)) (x!126468 (_ BitVec 32))) (Undefined!10582) (MissingVacant!10582 (index!44708 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96027 (_ BitVec 32)) SeekEntryResult!10582)

(assert (=> b!1404367 (= e!795274 (= (seekEntryOrOpen!0 (select (arr!46362 a!2901) j!112) a!2901 mask!2840) (Found!10582 j!112)))))

(declare-fun b!1404368 () Bool)

(declare-fun e!795275 () Bool)

(assert (=> b!1404368 (= e!795275 true)))

(declare-fun lt!618717 () SeekEntryResult!10582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96027 (_ BitVec 32)) SeekEntryResult!10582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404368 (= lt!618717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46362 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46362 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96028 (store (arr!46362 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46913 a!2901)) mask!2840))))

(declare-fun b!1404369 () Bool)

(assert (=> b!1404369 (= e!795273 (not e!795275))))

(declare-fun res!942192 () Bool)

(assert (=> b!1404369 (=> res!942192 e!795275)))

(declare-fun lt!618719 () SeekEntryResult!10582)

(assert (=> b!1404369 (= res!942192 (or (not (is-Intermediate!10582 lt!618719)) (undefined!11394 lt!618719)))))

(assert (=> b!1404369 e!795274))

(declare-fun res!942194 () Bool)

(assert (=> b!1404369 (=> (not res!942194) (not e!795274))))

(assert (=> b!1404369 (= res!942194 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47195 0))(
  ( (Unit!47196) )
))
(declare-fun lt!618718 () Unit!47195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47195)

(assert (=> b!1404369 (= lt!618718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404369 (= lt!618719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46362 a!2901) j!112) mask!2840) (select (arr!46362 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120696 res!942191) b!1404365))

(assert (= (and b!1404365 res!942196) b!1404366))

(assert (= (and b!1404366 res!942193) b!1404362))

(assert (= (and b!1404362 res!942189) b!1404363))

(assert (= (and b!1404363 res!942195) b!1404364))

(assert (= (and b!1404364 res!942190) b!1404369))

(assert (= (and b!1404369 res!942194) b!1404367))

(assert (= (and b!1404369 (not res!942192)) b!1404368))

(declare-fun m!1293141 () Bool)

(assert (=> b!1404367 m!1293141))

(assert (=> b!1404367 m!1293141))

(declare-fun m!1293143 () Bool)

(assert (=> b!1404367 m!1293143))

(declare-fun m!1293145 () Bool)

(assert (=> b!1404368 m!1293145))

(declare-fun m!1293147 () Bool)

(assert (=> b!1404368 m!1293147))

(assert (=> b!1404368 m!1293147))

(declare-fun m!1293149 () Bool)

(assert (=> b!1404368 m!1293149))

(assert (=> b!1404368 m!1293149))

(assert (=> b!1404368 m!1293147))

(declare-fun m!1293151 () Bool)

(assert (=> b!1404368 m!1293151))

(assert (=> b!1404369 m!1293141))

(declare-fun m!1293153 () Bool)

(assert (=> b!1404369 m!1293153))

(assert (=> b!1404369 m!1293141))

(declare-fun m!1293155 () Bool)

(assert (=> b!1404369 m!1293155))

(assert (=> b!1404369 m!1293153))

(assert (=> b!1404369 m!1293141))

(declare-fun m!1293157 () Bool)

(assert (=> b!1404369 m!1293157))

(declare-fun m!1293159 () Bool)

(assert (=> b!1404369 m!1293159))

(declare-fun m!1293161 () Bool)

(assert (=> b!1404364 m!1293161))

(assert (=> b!1404362 m!1293141))

(assert (=> b!1404362 m!1293141))

(declare-fun m!1293163 () Bool)

(assert (=> b!1404362 m!1293163))

(declare-fun m!1293165 () Bool)

(assert (=> start!120696 m!1293165))

(declare-fun m!1293167 () Bool)

(assert (=> start!120696 m!1293167))

(declare-fun m!1293169 () Bool)

(assert (=> b!1404366 m!1293169))

(assert (=> b!1404366 m!1293169))

(declare-fun m!1293171 () Bool)

(assert (=> b!1404366 m!1293171))

(declare-fun m!1293173 () Bool)

(assert (=> b!1404363 m!1293173))

(push 1)

(assert (not b!1404362))

(assert (not b!1404367))

(assert (not start!120696))

(assert (not b!1404366))

(assert (not b!1404369))

(assert (not b!1404363))

(assert (not b!1404364))

(assert (not b!1404368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

