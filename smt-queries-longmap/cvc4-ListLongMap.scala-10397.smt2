; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122506 () Bool)

(assert start!122506)

(declare-fun b!1419195 () Bool)

(declare-fun res!954717 () Bool)

(declare-fun e!803002 () Bool)

(assert (=> b!1419195 (=> (not res!954717) (not e!803002))))

(declare-datatypes ((array!96910 0))(
  ( (array!96911 (arr!46774 (Array (_ BitVec 32) (_ BitVec 64))) (size!47324 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96910)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96910 (_ BitVec 32)) Bool)

(assert (=> b!1419195 (= res!954717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419196 () Bool)

(declare-fun res!954718 () Bool)

(assert (=> b!1419196 (=> (not res!954718) (not e!803002))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419196 (= res!954718 (and (= (size!47324 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47324 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47324 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419197 () Bool)

(assert (=> b!1419197 (= e!803002 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625740 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419197 (= lt!625740 (toIndex!0 (select (store (arr!46774 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419198 () Bool)

(declare-fun res!954716 () Bool)

(assert (=> b!1419198 (=> (not res!954716) (not e!803002))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419198 (= res!954716 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47324 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47324 a!2831))))))

(declare-fun b!1419199 () Bool)

(declare-fun res!954719 () Bool)

(assert (=> b!1419199 (=> (not res!954719) (not e!803002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419199 (= res!954719 (validKeyInArray!0 (select (arr!46774 a!2831) i!982)))))

(declare-fun b!1419200 () Bool)

(declare-fun res!954720 () Bool)

(assert (=> b!1419200 (=> (not res!954720) (not e!803002))))

(declare-datatypes ((List!33284 0))(
  ( (Nil!33281) (Cons!33280 (h!34579 (_ BitVec 64)) (t!47978 List!33284)) )
))
(declare-fun arrayNoDuplicates!0 (array!96910 (_ BitVec 32) List!33284) Bool)

(assert (=> b!1419200 (= res!954720 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33281))))

(declare-fun b!1419201 () Bool)

(declare-fun res!954715 () Bool)

(assert (=> b!1419201 (=> (not res!954715) (not e!803002))))

(declare-datatypes ((SeekEntryResult!11059 0))(
  ( (MissingZero!11059 (index!46628 (_ BitVec 32))) (Found!11059 (index!46629 (_ BitVec 32))) (Intermediate!11059 (undefined!11871 Bool) (index!46630 (_ BitVec 32)) (x!128295 (_ BitVec 32))) (Undefined!11059) (MissingVacant!11059 (index!46631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96910 (_ BitVec 32)) SeekEntryResult!11059)

(assert (=> b!1419201 (= res!954715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46774 a!2831) j!81) mask!2608) (select (arr!46774 a!2831) j!81) a!2831 mask!2608) (Intermediate!11059 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419194 () Bool)

(declare-fun res!954714 () Bool)

(assert (=> b!1419194 (=> (not res!954714) (not e!803002))))

(assert (=> b!1419194 (= res!954714 (validKeyInArray!0 (select (arr!46774 a!2831) j!81)))))

(declare-fun res!954721 () Bool)

(assert (=> start!122506 (=> (not res!954721) (not e!803002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122506 (= res!954721 (validMask!0 mask!2608))))

(assert (=> start!122506 e!803002))

(assert (=> start!122506 true))

(declare-fun array_inv!35802 (array!96910) Bool)

(assert (=> start!122506 (array_inv!35802 a!2831)))

(assert (= (and start!122506 res!954721) b!1419196))

(assert (= (and b!1419196 res!954718) b!1419199))

(assert (= (and b!1419199 res!954719) b!1419194))

(assert (= (and b!1419194 res!954714) b!1419195))

(assert (= (and b!1419195 res!954717) b!1419200))

(assert (= (and b!1419200 res!954720) b!1419198))

(assert (= (and b!1419198 res!954716) b!1419201))

(assert (= (and b!1419201 res!954715) b!1419197))

(declare-fun m!1309705 () Bool)

(assert (=> b!1419201 m!1309705))

(assert (=> b!1419201 m!1309705))

(declare-fun m!1309707 () Bool)

(assert (=> b!1419201 m!1309707))

(assert (=> b!1419201 m!1309707))

(assert (=> b!1419201 m!1309705))

(declare-fun m!1309709 () Bool)

(assert (=> b!1419201 m!1309709))

(declare-fun m!1309711 () Bool)

(assert (=> b!1419195 m!1309711))

(declare-fun m!1309713 () Bool)

(assert (=> start!122506 m!1309713))

(declare-fun m!1309715 () Bool)

(assert (=> start!122506 m!1309715))

(declare-fun m!1309717 () Bool)

(assert (=> b!1419197 m!1309717))

(declare-fun m!1309719 () Bool)

(assert (=> b!1419197 m!1309719))

(assert (=> b!1419197 m!1309719))

(declare-fun m!1309721 () Bool)

(assert (=> b!1419197 m!1309721))

(declare-fun m!1309723 () Bool)

(assert (=> b!1419199 m!1309723))

(assert (=> b!1419199 m!1309723))

(declare-fun m!1309725 () Bool)

(assert (=> b!1419199 m!1309725))

(assert (=> b!1419194 m!1309705))

(assert (=> b!1419194 m!1309705))

(declare-fun m!1309727 () Bool)

(assert (=> b!1419194 m!1309727))

(declare-fun m!1309729 () Bool)

(assert (=> b!1419200 m!1309729))

(push 1)

(assert (not b!1419197))

(assert (not b!1419201))

(assert (not b!1419195))

(assert (not start!122506))

(assert (not b!1419199))

(assert (not b!1419194))

(assert (not b!1419200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

