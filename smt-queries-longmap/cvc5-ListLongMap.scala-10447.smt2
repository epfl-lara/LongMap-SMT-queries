; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122844 () Bool)

(assert start!122844)

(declare-fun b!1424873 () Bool)

(declare-fun e!805205 () Bool)

(assert (=> b!1424873 (= e!805205 false)))

(declare-fun lt!627738 () Bool)

(declare-datatypes ((array!97209 0))(
  ( (array!97210 (arr!46922 (Array (_ BitVec 32) (_ BitVec 64))) (size!47472 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97209)

(declare-datatypes ((List!33432 0))(
  ( (Nil!33429) (Cons!33428 (h!34730 (_ BitVec 64)) (t!48126 List!33432)) )
))
(declare-fun arrayNoDuplicates!0 (array!97209 (_ BitVec 32) List!33432) Bool)

(assert (=> b!1424873 (= lt!627738 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33429))))

(declare-fun res!960307 () Bool)

(assert (=> start!122844 (=> (not res!960307) (not e!805205))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122844 (= res!960307 (validMask!0 mask!2608))))

(assert (=> start!122844 e!805205))

(assert (=> start!122844 true))

(declare-fun array_inv!35950 (array!97209) Bool)

(assert (=> start!122844 (array_inv!35950 a!2831)))

(declare-fun b!1424874 () Bool)

(declare-fun res!960306 () Bool)

(assert (=> b!1424874 (=> (not res!960306) (not e!805205))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424874 (= res!960306 (validKeyInArray!0 (select (arr!46922 a!2831) i!982)))))

(declare-fun b!1424875 () Bool)

(declare-fun res!960309 () Bool)

(assert (=> b!1424875 (=> (not res!960309) (not e!805205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97209 (_ BitVec 32)) Bool)

(assert (=> b!1424875 (= res!960309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424876 () Bool)

(declare-fun res!960308 () Bool)

(assert (=> b!1424876 (=> (not res!960308) (not e!805205))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1424876 (= res!960308 (validKeyInArray!0 (select (arr!46922 a!2831) j!81)))))

(declare-fun b!1424877 () Bool)

(declare-fun res!960310 () Bool)

(assert (=> b!1424877 (=> (not res!960310) (not e!805205))))

(assert (=> b!1424877 (= res!960310 (and (= (size!47472 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47472 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47472 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122844 res!960307) b!1424877))

(assert (= (and b!1424877 res!960310) b!1424874))

(assert (= (and b!1424874 res!960306) b!1424876))

(assert (= (and b!1424876 res!960308) b!1424875))

(assert (= (and b!1424875 res!960309) b!1424873))

(declare-fun m!1315443 () Bool)

(assert (=> b!1424874 m!1315443))

(assert (=> b!1424874 m!1315443))

(declare-fun m!1315445 () Bool)

(assert (=> b!1424874 m!1315445))

(declare-fun m!1315447 () Bool)

(assert (=> b!1424876 m!1315447))

(assert (=> b!1424876 m!1315447))

(declare-fun m!1315449 () Bool)

(assert (=> b!1424876 m!1315449))

(declare-fun m!1315451 () Bool)

(assert (=> b!1424875 m!1315451))

(declare-fun m!1315453 () Bool)

(assert (=> b!1424873 m!1315453))

(declare-fun m!1315455 () Bool)

(assert (=> start!122844 m!1315455))

(declare-fun m!1315457 () Bool)

(assert (=> start!122844 m!1315457))

(push 1)

(assert (not start!122844))

(assert (not b!1424874))

(assert (not b!1424875))

(assert (not b!1424873))

(assert (not b!1424876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

