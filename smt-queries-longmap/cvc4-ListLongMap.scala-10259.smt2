; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120610 () Bool)

(assert start!120610)

(declare-fun b!1404277 () Bool)

(declare-fun e!794987 () Bool)

(declare-datatypes ((array!96019 0))(
  ( (array!96020 (arr!46360 (Array (_ BitVec 32) (_ BitVec 64))) (size!46910 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96019)

(assert (=> b!1404277 (= e!794987 (bvsgt #b00000000000000000000000000000000 (size!46910 a!2901)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10671 0))(
  ( (MissingZero!10671 (index!45061 (_ BitVec 32))) (Found!10671 (index!45062 (_ BitVec 32))) (Intermediate!10671 (undefined!11483 Bool) (index!45063 (_ BitVec 32)) (x!126674 (_ BitVec 32))) (Undefined!10671) (MissingVacant!10671 (index!45064 (_ BitVec 32))) )
))
(declare-fun lt!618618 () SeekEntryResult!10671)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96019 (_ BitVec 32)) SeekEntryResult!10671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404277 (= lt!618618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46360 a!2901) j!112) mask!2840) (select (arr!46360 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404278 () Bool)

(declare-fun res!942793 () Bool)

(assert (=> b!1404278 (=> (not res!942793) (not e!794987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96019 (_ BitVec 32)) Bool)

(assert (=> b!1404278 (= res!942793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404279 () Bool)

(declare-fun res!942788 () Bool)

(assert (=> b!1404279 (=> (not res!942788) (not e!794987))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404279 (= res!942788 (validKeyInArray!0 (select (arr!46360 a!2901) i!1037)))))

(declare-fun b!1404280 () Bool)

(declare-fun res!942789 () Bool)

(assert (=> b!1404280 (=> (not res!942789) (not e!794987))))

(declare-datatypes ((List!32879 0))(
  ( (Nil!32876) (Cons!32875 (h!34123 (_ BitVec 64)) (t!47573 List!32879)) )
))
(declare-fun arrayNoDuplicates!0 (array!96019 (_ BitVec 32) List!32879) Bool)

(assert (=> b!1404280 (= res!942789 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32876))))

(declare-fun b!1404281 () Bool)

(declare-fun res!942792 () Bool)

(assert (=> b!1404281 (=> (not res!942792) (not e!794987))))

(assert (=> b!1404281 (= res!942792 (validKeyInArray!0 (select (arr!46360 a!2901) j!112)))))

(declare-fun b!1404282 () Bool)

(declare-fun res!942791 () Bool)

(assert (=> b!1404282 (=> (not res!942791) (not e!794987))))

(assert (=> b!1404282 (= res!942791 (and (= (size!46910 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46910 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46910 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942790 () Bool)

(assert (=> start!120610 (=> (not res!942790) (not e!794987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120610 (= res!942790 (validMask!0 mask!2840))))

(assert (=> start!120610 e!794987))

(assert (=> start!120610 true))

(declare-fun array_inv!35388 (array!96019) Bool)

(assert (=> start!120610 (array_inv!35388 a!2901)))

(assert (= (and start!120610 res!942790) b!1404282))

(assert (= (and b!1404282 res!942791) b!1404279))

(assert (= (and b!1404279 res!942788) b!1404281))

(assert (= (and b!1404281 res!942792) b!1404278))

(assert (= (and b!1404278 res!942793) b!1404280))

(assert (= (and b!1404280 res!942789) b!1404277))

(declare-fun m!1293097 () Bool)

(assert (=> b!1404280 m!1293097))

(declare-fun m!1293099 () Bool)

(assert (=> start!120610 m!1293099))

(declare-fun m!1293101 () Bool)

(assert (=> start!120610 m!1293101))

(declare-fun m!1293103 () Bool)

(assert (=> b!1404277 m!1293103))

(assert (=> b!1404277 m!1293103))

(declare-fun m!1293105 () Bool)

(assert (=> b!1404277 m!1293105))

(assert (=> b!1404277 m!1293105))

(assert (=> b!1404277 m!1293103))

(declare-fun m!1293107 () Bool)

(assert (=> b!1404277 m!1293107))

(declare-fun m!1293109 () Bool)

(assert (=> b!1404279 m!1293109))

(assert (=> b!1404279 m!1293109))

(declare-fun m!1293111 () Bool)

(assert (=> b!1404279 m!1293111))

(declare-fun m!1293113 () Bool)

(assert (=> b!1404278 m!1293113))

(assert (=> b!1404281 m!1293103))

(assert (=> b!1404281 m!1293103))

(declare-fun m!1293115 () Bool)

(assert (=> b!1404281 m!1293115))

(push 1)

(assert (not b!1404278))

(assert (not b!1404279))

(assert (not b!1404280))

(assert (not b!1404277))

(assert (not b!1404281))

(assert (not start!120610))

(check-sat)

