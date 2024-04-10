; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120606 () Bool)

(assert start!120606)

(declare-fun b!1404241 () Bool)

(declare-fun res!942756 () Bool)

(declare-fun e!794975 () Bool)

(assert (=> b!1404241 (=> (not res!942756) (not e!794975))))

(declare-datatypes ((array!96015 0))(
  ( (array!96016 (arr!46358 (Array (_ BitVec 32) (_ BitVec 64))) (size!46908 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96015)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404241 (= res!942756 (validKeyInArray!0 (select (arr!46358 a!2901) j!112)))))

(declare-fun b!1404243 () Bool)

(declare-fun res!942752 () Bool)

(assert (=> b!1404243 (=> (not res!942752) (not e!794975))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404243 (= res!942752 (validKeyInArray!0 (select (arr!46358 a!2901) i!1037)))))

(declare-fun b!1404244 () Bool)

(assert (=> b!1404244 (= e!794975 (bvsgt #b00000000000000000000000000000000 (size!46908 a!2901)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10669 0))(
  ( (MissingZero!10669 (index!45053 (_ BitVec 32))) (Found!10669 (index!45054 (_ BitVec 32))) (Intermediate!10669 (undefined!11481 Bool) (index!45055 (_ BitVec 32)) (x!126672 (_ BitVec 32))) (Undefined!10669) (MissingVacant!10669 (index!45056 (_ BitVec 32))) )
))
(declare-fun lt!618612 () SeekEntryResult!10669)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96015 (_ BitVec 32)) SeekEntryResult!10669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404244 (= lt!618612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46358 a!2901) j!112) mask!2840) (select (arr!46358 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404245 () Bool)

(declare-fun res!942754 () Bool)

(assert (=> b!1404245 (=> (not res!942754) (not e!794975))))

(assert (=> b!1404245 (= res!942754 (and (= (size!46908 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46908 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46908 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404246 () Bool)

(declare-fun res!942755 () Bool)

(assert (=> b!1404246 (=> (not res!942755) (not e!794975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96015 (_ BitVec 32)) Bool)

(assert (=> b!1404246 (= res!942755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942757 () Bool)

(assert (=> start!120606 (=> (not res!942757) (not e!794975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120606 (= res!942757 (validMask!0 mask!2840))))

(assert (=> start!120606 e!794975))

(assert (=> start!120606 true))

(declare-fun array_inv!35386 (array!96015) Bool)

(assert (=> start!120606 (array_inv!35386 a!2901)))

(declare-fun b!1404242 () Bool)

(declare-fun res!942753 () Bool)

(assert (=> b!1404242 (=> (not res!942753) (not e!794975))))

(declare-datatypes ((List!32877 0))(
  ( (Nil!32874) (Cons!32873 (h!34121 (_ BitVec 64)) (t!47571 List!32877)) )
))
(declare-fun arrayNoDuplicates!0 (array!96015 (_ BitVec 32) List!32877) Bool)

(assert (=> b!1404242 (= res!942753 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32874))))

(assert (= (and start!120606 res!942757) b!1404245))

(assert (= (and b!1404245 res!942754) b!1404243))

(assert (= (and b!1404243 res!942752) b!1404241))

(assert (= (and b!1404241 res!942756) b!1404246))

(assert (= (and b!1404246 res!942755) b!1404242))

(assert (= (and b!1404242 res!942753) b!1404244))

(declare-fun m!1293057 () Bool)

(assert (=> b!1404244 m!1293057))

(assert (=> b!1404244 m!1293057))

(declare-fun m!1293059 () Bool)

(assert (=> b!1404244 m!1293059))

(assert (=> b!1404244 m!1293059))

(assert (=> b!1404244 m!1293057))

(declare-fun m!1293061 () Bool)

(assert (=> b!1404244 m!1293061))

(declare-fun m!1293063 () Bool)

(assert (=> b!1404243 m!1293063))

(assert (=> b!1404243 m!1293063))

(declare-fun m!1293065 () Bool)

(assert (=> b!1404243 m!1293065))

(declare-fun m!1293067 () Bool)

(assert (=> b!1404246 m!1293067))

(declare-fun m!1293069 () Bool)

(assert (=> start!120606 m!1293069))

(declare-fun m!1293071 () Bool)

(assert (=> start!120606 m!1293071))

(assert (=> b!1404241 m!1293057))

(assert (=> b!1404241 m!1293057))

(declare-fun m!1293073 () Bool)

(assert (=> b!1404241 m!1293073))

(declare-fun m!1293075 () Bool)

(assert (=> b!1404242 m!1293075))

(push 1)

