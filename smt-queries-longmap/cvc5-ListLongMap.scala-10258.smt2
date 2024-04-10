; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120600 () Bool)

(assert start!120600)

(declare-fun res!942700 () Bool)

(declare-fun e!794956 () Bool)

(assert (=> start!120600 (=> (not res!942700) (not e!794956))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120600 (= res!942700 (validMask!0 mask!2840))))

(assert (=> start!120600 e!794956))

(assert (=> start!120600 true))

(declare-datatypes ((array!96009 0))(
  ( (array!96010 (arr!46355 (Array (_ BitVec 32) (_ BitVec 64))) (size!46905 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96009)

(declare-fun array_inv!35383 (array!96009) Bool)

(assert (=> start!120600 (array_inv!35383 a!2901)))

(declare-fun b!1404187 () Bool)

(declare-fun res!942703 () Bool)

(assert (=> b!1404187 (=> (not res!942703) (not e!794956))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404187 (= res!942703 (validKeyInArray!0 (select (arr!46355 a!2901) i!1037)))))

(declare-fun b!1404188 () Bool)

(declare-fun res!942701 () Bool)

(assert (=> b!1404188 (=> (not res!942701) (not e!794956))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404188 (= res!942701 (validKeyInArray!0 (select (arr!46355 a!2901) j!112)))))

(declare-fun b!1404189 () Bool)

(declare-fun res!942702 () Bool)

(assert (=> b!1404189 (=> (not res!942702) (not e!794956))))

(assert (=> b!1404189 (= res!942702 (and (= (size!46905 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46905 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46905 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404190 () Bool)

(assert (=> b!1404190 (= e!794956 false)))

(declare-datatypes ((SeekEntryResult!10666 0))(
  ( (MissingZero!10666 (index!45041 (_ BitVec 32))) (Found!10666 (index!45042 (_ BitVec 32))) (Intermediate!10666 (undefined!11478 Bool) (index!45043 (_ BitVec 32)) (x!126661 (_ BitVec 32))) (Undefined!10666) (MissingVacant!10666 (index!45044 (_ BitVec 32))) )
))
(declare-fun lt!618603 () SeekEntryResult!10666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96009 (_ BitVec 32)) SeekEntryResult!10666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404190 (= lt!618603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46355 a!2901) j!112) mask!2840) (select (arr!46355 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404191 () Bool)

(declare-fun res!942699 () Bool)

(assert (=> b!1404191 (=> (not res!942699) (not e!794956))))

(declare-datatypes ((List!32874 0))(
  ( (Nil!32871) (Cons!32870 (h!34118 (_ BitVec 64)) (t!47568 List!32874)) )
))
(declare-fun arrayNoDuplicates!0 (array!96009 (_ BitVec 32) List!32874) Bool)

(assert (=> b!1404191 (= res!942699 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32871))))

(declare-fun b!1404192 () Bool)

(declare-fun res!942698 () Bool)

(assert (=> b!1404192 (=> (not res!942698) (not e!794956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96009 (_ BitVec 32)) Bool)

(assert (=> b!1404192 (= res!942698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120600 res!942700) b!1404189))

(assert (= (and b!1404189 res!942702) b!1404187))

(assert (= (and b!1404187 res!942703) b!1404188))

(assert (= (and b!1404188 res!942701) b!1404192))

(assert (= (and b!1404192 res!942698) b!1404191))

(assert (= (and b!1404191 res!942699) b!1404190))

(declare-fun m!1292997 () Bool)

(assert (=> b!1404188 m!1292997))

(assert (=> b!1404188 m!1292997))

(declare-fun m!1292999 () Bool)

(assert (=> b!1404188 m!1292999))

(declare-fun m!1293001 () Bool)

(assert (=> b!1404191 m!1293001))

(declare-fun m!1293003 () Bool)

(assert (=> b!1404192 m!1293003))

(declare-fun m!1293005 () Bool)

(assert (=> start!120600 m!1293005))

(declare-fun m!1293007 () Bool)

(assert (=> start!120600 m!1293007))

(declare-fun m!1293009 () Bool)

(assert (=> b!1404187 m!1293009))

(assert (=> b!1404187 m!1293009))

(declare-fun m!1293011 () Bool)

(assert (=> b!1404187 m!1293011))

(assert (=> b!1404190 m!1292997))

(assert (=> b!1404190 m!1292997))

(declare-fun m!1293013 () Bool)

(assert (=> b!1404190 m!1293013))

(assert (=> b!1404190 m!1293013))

(assert (=> b!1404190 m!1292997))

(declare-fun m!1293015 () Bool)

(assert (=> b!1404190 m!1293015))

(push 1)

(assert (not b!1404192))

(assert (not b!1404187))

(assert (not b!1404188))

(assert (not start!120600))

(assert (not b!1404190))

(assert (not b!1404191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

