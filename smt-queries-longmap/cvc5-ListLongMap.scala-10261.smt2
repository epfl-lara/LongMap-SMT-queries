; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120618 () Bool)

(assert start!120618)

(declare-fun b!1404349 () Bool)

(declare-fun res!942861 () Bool)

(declare-fun e!795010 () Bool)

(assert (=> b!1404349 (=> (not res!942861) (not e!795010))))

(declare-datatypes ((array!96027 0))(
  ( (array!96028 (arr!46364 (Array (_ BitVec 32) (_ BitVec 64))) (size!46914 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96027)

(declare-datatypes ((List!32883 0))(
  ( (Nil!32880) (Cons!32879 (h!34127 (_ BitVec 64)) (t!47577 List!32883)) )
))
(declare-fun arrayNoDuplicates!0 (array!96027 (_ BitVec 32) List!32883) Bool)

(assert (=> b!1404349 (= res!942861 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32880))))

(declare-fun b!1404350 () Bool)

(declare-fun res!942865 () Bool)

(assert (=> b!1404350 (=> (not res!942865) (not e!795010))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404350 (= res!942865 (validKeyInArray!0 (select (arr!46364 a!2901) j!112)))))

(declare-fun b!1404351 () Bool)

(declare-fun res!942863 () Bool)

(assert (=> b!1404351 (=> (not res!942863) (not e!795010))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404351 (= res!942863 (and (= (size!46914 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46914 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46914 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404352 () Bool)

(declare-fun res!942862 () Bool)

(assert (=> b!1404352 (=> (not res!942862) (not e!795010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96027 (_ BitVec 32)) Bool)

(assert (=> b!1404352 (= res!942862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942860 () Bool)

(assert (=> start!120618 (=> (not res!942860) (not e!795010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120618 (= res!942860 (validMask!0 mask!2840))))

(assert (=> start!120618 e!795010))

(assert (=> start!120618 true))

(declare-fun array_inv!35392 (array!96027) Bool)

(assert (=> start!120618 (array_inv!35392 a!2901)))

(declare-fun b!1404353 () Bool)

(declare-fun res!942864 () Bool)

(assert (=> b!1404353 (=> (not res!942864) (not e!795010))))

(assert (=> b!1404353 (= res!942864 (validKeyInArray!0 (select (arr!46364 a!2901) i!1037)))))

(declare-fun b!1404354 () Bool)

(assert (=> b!1404354 (= e!795010 false)))

(declare-datatypes ((SeekEntryResult!10675 0))(
  ( (MissingZero!10675 (index!45077 (_ BitVec 32))) (Found!10675 (index!45078 (_ BitVec 32))) (Intermediate!10675 (undefined!11487 Bool) (index!45079 (_ BitVec 32)) (x!126694 (_ BitVec 32))) (Undefined!10675) (MissingVacant!10675 (index!45080 (_ BitVec 32))) )
))
(declare-fun lt!618630 () SeekEntryResult!10675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96027 (_ BitVec 32)) SeekEntryResult!10675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404354 (= lt!618630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46364 a!2901) j!112) mask!2840) (select (arr!46364 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120618 res!942860) b!1404351))

(assert (= (and b!1404351 res!942863) b!1404353))

(assert (= (and b!1404353 res!942864) b!1404350))

(assert (= (and b!1404350 res!942865) b!1404352))

(assert (= (and b!1404352 res!942862) b!1404349))

(assert (= (and b!1404349 res!942861) b!1404354))

(declare-fun m!1293177 () Bool)

(assert (=> b!1404353 m!1293177))

(assert (=> b!1404353 m!1293177))

(declare-fun m!1293179 () Bool)

(assert (=> b!1404353 m!1293179))

(declare-fun m!1293181 () Bool)

(assert (=> b!1404354 m!1293181))

(assert (=> b!1404354 m!1293181))

(declare-fun m!1293183 () Bool)

(assert (=> b!1404354 m!1293183))

(assert (=> b!1404354 m!1293183))

(assert (=> b!1404354 m!1293181))

(declare-fun m!1293185 () Bool)

(assert (=> b!1404354 m!1293185))

(declare-fun m!1293187 () Bool)

(assert (=> start!120618 m!1293187))

(declare-fun m!1293189 () Bool)

(assert (=> start!120618 m!1293189))

(declare-fun m!1293191 () Bool)

(assert (=> b!1404349 m!1293191))

(assert (=> b!1404350 m!1293181))

(assert (=> b!1404350 m!1293181))

(declare-fun m!1293193 () Bool)

(assert (=> b!1404350 m!1293193))

(declare-fun m!1293195 () Bool)

(assert (=> b!1404352 m!1293195))

(push 1)

(assert (not b!1404350))

(assert (not b!1404353))

(assert (not start!120618))

(assert (not b!1404354))

(assert (not b!1404352))

(assert (not b!1404349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

