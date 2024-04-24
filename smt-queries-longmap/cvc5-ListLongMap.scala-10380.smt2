; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122394 () Bool)

(assert start!122394)

(declare-fun b!1418817 () Bool)

(declare-fun res!953864 () Bool)

(declare-fun e!803050 () Bool)

(assert (=> b!1418817 (=> (not res!953864) (not e!803050))))

(declare-datatypes ((array!96900 0))(
  ( (array!96901 (arr!46776 (Array (_ BitVec 32) (_ BitVec 64))) (size!47327 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96900)

(declare-datatypes ((List!33282 0))(
  ( (Nil!33279) (Cons!33278 (h!34579 (_ BitVec 64)) (t!47968 List!33282)) )
))
(declare-fun arrayNoDuplicates!0 (array!96900 (_ BitVec 32) List!33282) Bool)

(assert (=> b!1418817 (= res!953864 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33279))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!803049 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1418818 () Bool)

(declare-datatypes ((SeekEntryResult!10990 0))(
  ( (MissingZero!10990 (index!46352 (_ BitVec 32))) (Found!10990 (index!46353 (_ BitVec 32))) (Intermediate!10990 (undefined!11802 Bool) (index!46354 (_ BitVec 32)) (x!128100 (_ BitVec 32))) (Undefined!10990) (MissingVacant!10990 (index!46355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96900 (_ BitVec 32)) SeekEntryResult!10990)

(assert (=> b!1418818 (= e!803049 (= (seekEntryOrOpen!0 (select (arr!46776 a!2901) j!112) a!2901 mask!2840) (Found!10990 j!112)))))

(declare-fun b!1418819 () Bool)

(declare-fun res!953866 () Bool)

(assert (=> b!1418819 (=> (not res!953866) (not e!803050))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1418819 (= res!953866 (and (= (size!47327 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47327 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47327 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418820 () Bool)

(declare-fun res!953869 () Bool)

(assert (=> b!1418820 (=> (not res!953869) (not e!803050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96900 (_ BitVec 32)) Bool)

(assert (=> b!1418820 (= res!953869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953863 () Bool)

(assert (=> start!122394 (=> (not res!953863) (not e!803050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122394 (= res!953863 (validMask!0 mask!2840))))

(assert (=> start!122394 e!803050))

(assert (=> start!122394 true))

(declare-fun array_inv!36057 (array!96900) Bool)

(assert (=> start!122394 (array_inv!36057 a!2901)))

(declare-fun b!1418821 () Bool)

(assert (=> b!1418821 (= e!803050 (not true))))

(assert (=> b!1418821 e!803049))

(declare-fun res!953867 () Bool)

(assert (=> b!1418821 (=> (not res!953867) (not e!803049))))

(assert (=> b!1418821 (= res!953867 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47981 0))(
  ( (Unit!47982) )
))
(declare-fun lt!625837 () Unit!47981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47981)

(assert (=> b!1418821 (= lt!625837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625838 () SeekEntryResult!10990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96900 (_ BitVec 32)) SeekEntryResult!10990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418821 (= lt!625838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46776 a!2901) j!112) mask!2840) (select (arr!46776 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418822 () Bool)

(declare-fun res!953865 () Bool)

(assert (=> b!1418822 (=> (not res!953865) (not e!803050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418822 (= res!953865 (validKeyInArray!0 (select (arr!46776 a!2901) j!112)))))

(declare-fun b!1418823 () Bool)

(declare-fun res!953868 () Bool)

(assert (=> b!1418823 (=> (not res!953868) (not e!803050))))

(assert (=> b!1418823 (= res!953868 (validKeyInArray!0 (select (arr!46776 a!2901) i!1037)))))

(assert (= (and start!122394 res!953863) b!1418819))

(assert (= (and b!1418819 res!953866) b!1418823))

(assert (= (and b!1418823 res!953868) b!1418822))

(assert (= (and b!1418822 res!953865) b!1418820))

(assert (= (and b!1418820 res!953869) b!1418817))

(assert (= (and b!1418817 res!953864) b!1418821))

(assert (= (and b!1418821 res!953867) b!1418818))

(declare-fun m!1309823 () Bool)

(assert (=> b!1418823 m!1309823))

(assert (=> b!1418823 m!1309823))

(declare-fun m!1309825 () Bool)

(assert (=> b!1418823 m!1309825))

(declare-fun m!1309827 () Bool)

(assert (=> start!122394 m!1309827))

(declare-fun m!1309829 () Bool)

(assert (=> start!122394 m!1309829))

(declare-fun m!1309831 () Bool)

(assert (=> b!1418820 m!1309831))

(declare-fun m!1309833 () Bool)

(assert (=> b!1418817 m!1309833))

(declare-fun m!1309835 () Bool)

(assert (=> b!1418821 m!1309835))

(declare-fun m!1309837 () Bool)

(assert (=> b!1418821 m!1309837))

(assert (=> b!1418821 m!1309835))

(declare-fun m!1309839 () Bool)

(assert (=> b!1418821 m!1309839))

(assert (=> b!1418821 m!1309837))

(assert (=> b!1418821 m!1309835))

(declare-fun m!1309841 () Bool)

(assert (=> b!1418821 m!1309841))

(declare-fun m!1309843 () Bool)

(assert (=> b!1418821 m!1309843))

(assert (=> b!1418822 m!1309835))

(assert (=> b!1418822 m!1309835))

(declare-fun m!1309845 () Bool)

(assert (=> b!1418822 m!1309845))

(assert (=> b!1418818 m!1309835))

(assert (=> b!1418818 m!1309835))

(declare-fun m!1309847 () Bool)

(assert (=> b!1418818 m!1309847))

(push 1)

(assert (not b!1418821))

(assert (not b!1418823))

(assert (not b!1418818))

(assert (not b!1418817))

(assert (not b!1418822))

(assert (not start!122394))

(assert (not b!1418820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

