; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130720 () Bool)

(assert start!130720)

(declare-fun b!1533094 () Bool)

(declare-fun res!1050180 () Bool)

(declare-fun e!854140 () Bool)

(assert (=> b!1533094 (=> (not res!1050180) (not e!854140))))

(declare-datatypes ((array!101818 0))(
  ( (array!101819 (arr!49125 (Array (_ BitVec 32) (_ BitVec 64))) (size!49675 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101818)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533094 (= res!1050180 (and (= (size!49675 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49675 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49675 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533095 () Bool)

(declare-fun res!1050182 () Bool)

(assert (=> b!1533095 (=> (not res!1050182) (not e!854140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533095 (= res!1050182 (validKeyInArray!0 (select (arr!49125 a!2792) i!951)))))

(declare-fun res!1050183 () Bool)

(assert (=> start!130720 (=> (not res!1050183) (not e!854140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130720 (= res!1050183 (validMask!0 mask!2480))))

(assert (=> start!130720 e!854140))

(assert (=> start!130720 true))

(declare-fun array_inv!38153 (array!101818) Bool)

(assert (=> start!130720 (array_inv!38153 a!2792)))

(declare-fun b!1533096 () Bool)

(declare-fun res!1050181 () Bool)

(assert (=> b!1533096 (=> (not res!1050181) (not e!854140))))

(assert (=> b!1533096 (= res!1050181 (validKeyInArray!0 (select (arr!49125 a!2792) j!64)))))

(declare-fun b!1533097 () Bool)

(declare-fun res!1050184 () Bool)

(assert (=> b!1533097 (=> (not res!1050184) (not e!854140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101818 (_ BitVec 32)) Bool)

(assert (=> b!1533097 (= res!1050184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533098 () Bool)

(assert (=> b!1533098 (= e!854140 false)))

(declare-fun lt!663772 () Bool)

(declare-datatypes ((List!35599 0))(
  ( (Nil!35596) (Cons!35595 (h!37040 (_ BitVec 64)) (t!50293 List!35599)) )
))
(declare-fun arrayNoDuplicates!0 (array!101818 (_ BitVec 32) List!35599) Bool)

(assert (=> b!1533098 (= lt!663772 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35596))))

(assert (= (and start!130720 res!1050183) b!1533094))

(assert (= (and b!1533094 res!1050180) b!1533095))

(assert (= (and b!1533095 res!1050182) b!1533096))

(assert (= (and b!1533096 res!1050181) b!1533097))

(assert (= (and b!1533097 res!1050184) b!1533098))

(declare-fun m!1415809 () Bool)

(assert (=> b!1533095 m!1415809))

(assert (=> b!1533095 m!1415809))

(declare-fun m!1415811 () Bool)

(assert (=> b!1533095 m!1415811))

(declare-fun m!1415813 () Bool)

(assert (=> start!130720 m!1415813))

(declare-fun m!1415815 () Bool)

(assert (=> start!130720 m!1415815))

(declare-fun m!1415817 () Bool)

(assert (=> b!1533098 m!1415817))

(declare-fun m!1415819 () Bool)

(assert (=> b!1533097 m!1415819))

(declare-fun m!1415821 () Bool)

(assert (=> b!1533096 m!1415821))

(assert (=> b!1533096 m!1415821))

(declare-fun m!1415823 () Bool)

(assert (=> b!1533096 m!1415823))

(check-sat (not b!1533098) (not b!1533097) (not b!1533096) (not start!130720) (not b!1533095))
