; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122508 () Bool)

(assert start!122508)

(declare-fun res!954741 () Bool)

(declare-fun e!803009 () Bool)

(assert (=> start!122508 (=> (not res!954741) (not e!803009))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122508 (= res!954741 (validMask!0 mask!2608))))

(assert (=> start!122508 e!803009))

(assert (=> start!122508 true))

(declare-datatypes ((array!96912 0))(
  ( (array!96913 (arr!46775 (Array (_ BitVec 32) (_ BitVec 64))) (size!47325 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96912)

(declare-fun array_inv!35803 (array!96912) Bool)

(assert (=> start!122508 (array_inv!35803 a!2831)))

(declare-fun b!1419218 () Bool)

(declare-fun res!954745 () Bool)

(assert (=> b!1419218 (=> (not res!954745) (not e!803009))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419218 (= res!954745 (validKeyInArray!0 (select (arr!46775 a!2831) i!982)))))

(declare-fun b!1419219 () Bool)

(declare-fun res!954739 () Bool)

(assert (=> b!1419219 (=> (not res!954739) (not e!803009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96912 (_ BitVec 32)) Bool)

(assert (=> b!1419219 (= res!954739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419220 () Bool)

(assert (=> b!1419220 (= e!803009 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!625743 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419220 (= lt!625743 (toIndex!0 (select (store (arr!46775 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419221 () Bool)

(declare-fun res!954738 () Bool)

(assert (=> b!1419221 (=> (not res!954738) (not e!803009))))

(declare-datatypes ((List!33285 0))(
  ( (Nil!33282) (Cons!33281 (h!34580 (_ BitVec 64)) (t!47979 List!33285)) )
))
(declare-fun arrayNoDuplicates!0 (array!96912 (_ BitVec 32) List!33285) Bool)

(assert (=> b!1419221 (= res!954738 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33282))))

(declare-fun b!1419222 () Bool)

(declare-fun res!954742 () Bool)

(assert (=> b!1419222 (=> (not res!954742) (not e!803009))))

(assert (=> b!1419222 (= res!954742 (and (= (size!47325 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47325 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47325 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419223 () Bool)

(declare-fun res!954743 () Bool)

(assert (=> b!1419223 (=> (not res!954743) (not e!803009))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419223 (= res!954743 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47325 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47325 a!2831))))))

(declare-fun b!1419224 () Bool)

(declare-fun res!954740 () Bool)

(assert (=> b!1419224 (=> (not res!954740) (not e!803009))))

(declare-datatypes ((SeekEntryResult!11060 0))(
  ( (MissingZero!11060 (index!46632 (_ BitVec 32))) (Found!11060 (index!46633 (_ BitVec 32))) (Intermediate!11060 (undefined!11872 Bool) (index!46634 (_ BitVec 32)) (x!128304 (_ BitVec 32))) (Undefined!11060) (MissingVacant!11060 (index!46635 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96912 (_ BitVec 32)) SeekEntryResult!11060)

(assert (=> b!1419224 (= res!954740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46775 a!2831) j!81) mask!2608) (select (arr!46775 a!2831) j!81) a!2831 mask!2608) (Intermediate!11060 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419225 () Bool)

(declare-fun res!954744 () Bool)

(assert (=> b!1419225 (=> (not res!954744) (not e!803009))))

(assert (=> b!1419225 (= res!954744 (validKeyInArray!0 (select (arr!46775 a!2831) j!81)))))

(assert (= (and start!122508 res!954741) b!1419222))

(assert (= (and b!1419222 res!954742) b!1419218))

(assert (= (and b!1419218 res!954745) b!1419225))

(assert (= (and b!1419225 res!954744) b!1419219))

(assert (= (and b!1419219 res!954739) b!1419221))

(assert (= (and b!1419221 res!954738) b!1419223))

(assert (= (and b!1419223 res!954743) b!1419224))

(assert (= (and b!1419224 res!954740) b!1419220))

(declare-fun m!1309731 () Bool)

(assert (=> b!1419224 m!1309731))

(assert (=> b!1419224 m!1309731))

(declare-fun m!1309733 () Bool)

(assert (=> b!1419224 m!1309733))

(assert (=> b!1419224 m!1309733))

(assert (=> b!1419224 m!1309731))

(declare-fun m!1309735 () Bool)

(assert (=> b!1419224 m!1309735))

(declare-fun m!1309737 () Bool)

(assert (=> b!1419220 m!1309737))

(declare-fun m!1309739 () Bool)

(assert (=> b!1419220 m!1309739))

(assert (=> b!1419220 m!1309739))

(declare-fun m!1309741 () Bool)

(assert (=> b!1419220 m!1309741))

(declare-fun m!1309743 () Bool)

(assert (=> b!1419218 m!1309743))

(assert (=> b!1419218 m!1309743))

(declare-fun m!1309745 () Bool)

(assert (=> b!1419218 m!1309745))

(declare-fun m!1309747 () Bool)

(assert (=> b!1419221 m!1309747))

(declare-fun m!1309749 () Bool)

(assert (=> b!1419219 m!1309749))

(assert (=> b!1419225 m!1309731))

(assert (=> b!1419225 m!1309731))

(declare-fun m!1309751 () Bool)

(assert (=> b!1419225 m!1309751))

(declare-fun m!1309753 () Bool)

(assert (=> start!122508 m!1309753))

(declare-fun m!1309755 () Bool)

(assert (=> start!122508 m!1309755))

(push 1)

(assert (not start!122508))

(assert (not b!1419224))

(assert (not b!1419225))

(assert (not b!1419219))

(assert (not b!1419220))

(assert (not b!1419221))

(assert (not b!1419218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

