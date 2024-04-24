; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122790 () Bool)

(assert start!122790)

(declare-fun b!1421171 () Bool)

(declare-fun e!804019 () Bool)

(assert (=> b!1421171 (= e!804019 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97077 0))(
  ( (array!97078 (arr!46854 (Array (_ BitVec 32) (_ BitVec 64))) (size!47405 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97077)

(declare-datatypes ((SeekEntryResult!11041 0))(
  ( (MissingZero!11041 (index!46556 (_ BitVec 32))) (Found!11041 (index!46557 (_ BitVec 32))) (Intermediate!11041 (undefined!11853 Bool) (index!46558 (_ BitVec 32)) (x!128374 (_ BitVec 32))) (Undefined!11041) (MissingVacant!11041 (index!46559 (_ BitVec 32))) )
))
(declare-fun lt!626270 () SeekEntryResult!11041)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97077 (_ BitVec 32)) SeekEntryResult!11041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421171 (= lt!626270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97078 (store (arr!46854 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47405 a!2831)) mask!2608))))

(declare-fun b!1421172 () Bool)

(declare-fun res!955927 () Bool)

(assert (=> b!1421172 (=> (not res!955927) (not e!804019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97077 (_ BitVec 32)) Bool)

(assert (=> b!1421172 (= res!955927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421173 () Bool)

(declare-fun res!955922 () Bool)

(assert (=> b!1421173 (=> (not res!955922) (not e!804019))))

(assert (=> b!1421173 (= res!955922 (and (= (size!47405 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47405 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47405 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421175 () Bool)

(declare-fun res!955925 () Bool)

(assert (=> b!1421175 (=> (not res!955925) (not e!804019))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421175 (= res!955925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46854 a!2831) j!81) mask!2608) (select (arr!46854 a!2831) j!81) a!2831 mask!2608) (Intermediate!11041 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1421176 () Bool)

(declare-fun res!955921 () Bool)

(assert (=> b!1421176 (=> (not res!955921) (not e!804019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421176 (= res!955921 (validKeyInArray!0 (select (arr!46854 a!2831) j!81)))))

(declare-fun b!1421177 () Bool)

(declare-fun res!955923 () Bool)

(assert (=> b!1421177 (=> (not res!955923) (not e!804019))))

(assert (=> b!1421177 (= res!955923 (validKeyInArray!0 (select (arr!46854 a!2831) i!982)))))

(declare-fun b!1421178 () Bool)

(declare-fun res!955924 () Bool)

(assert (=> b!1421178 (=> (not res!955924) (not e!804019))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421178 (= res!955924 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47405 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47405 a!2831))))))

(declare-fun b!1421174 () Bool)

(declare-fun res!955920 () Bool)

(assert (=> b!1421174 (=> (not res!955920) (not e!804019))))

(declare-datatypes ((List!33351 0))(
  ( (Nil!33348) (Cons!33347 (h!34657 (_ BitVec 64)) (t!48037 List!33351)) )
))
(declare-fun arrayNoDuplicates!0 (array!97077 (_ BitVec 32) List!33351) Bool)

(assert (=> b!1421174 (= res!955920 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33348))))

(declare-fun res!955926 () Bool)

(assert (=> start!122790 (=> (not res!955926) (not e!804019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122790 (= res!955926 (validMask!0 mask!2608))))

(assert (=> start!122790 e!804019))

(assert (=> start!122790 true))

(declare-fun array_inv!36135 (array!97077) Bool)

(assert (=> start!122790 (array_inv!36135 a!2831)))

(assert (= (and start!122790 res!955926) b!1421173))

(assert (= (and b!1421173 res!955922) b!1421177))

(assert (= (and b!1421177 res!955923) b!1421176))

(assert (= (and b!1421176 res!955921) b!1421172))

(assert (= (and b!1421172 res!955927) b!1421174))

(assert (= (and b!1421174 res!955920) b!1421178))

(assert (= (and b!1421178 res!955924) b!1421175))

(assert (= (and b!1421175 res!955925) b!1421171))

(declare-fun m!1311881 () Bool)

(assert (=> b!1421175 m!1311881))

(assert (=> b!1421175 m!1311881))

(declare-fun m!1311883 () Bool)

(assert (=> b!1421175 m!1311883))

(assert (=> b!1421175 m!1311883))

(assert (=> b!1421175 m!1311881))

(declare-fun m!1311885 () Bool)

(assert (=> b!1421175 m!1311885))

(declare-fun m!1311887 () Bool)

(assert (=> start!122790 m!1311887))

(declare-fun m!1311889 () Bool)

(assert (=> start!122790 m!1311889))

(declare-fun m!1311891 () Bool)

(assert (=> b!1421171 m!1311891))

(declare-fun m!1311893 () Bool)

(assert (=> b!1421171 m!1311893))

(assert (=> b!1421171 m!1311893))

(declare-fun m!1311895 () Bool)

(assert (=> b!1421171 m!1311895))

(assert (=> b!1421171 m!1311895))

(assert (=> b!1421171 m!1311893))

(declare-fun m!1311897 () Bool)

(assert (=> b!1421171 m!1311897))

(declare-fun m!1311899 () Bool)

(assert (=> b!1421172 m!1311899))

(assert (=> b!1421176 m!1311881))

(assert (=> b!1421176 m!1311881))

(declare-fun m!1311901 () Bool)

(assert (=> b!1421176 m!1311901))

(declare-fun m!1311903 () Bool)

(assert (=> b!1421177 m!1311903))

(assert (=> b!1421177 m!1311903))

(declare-fun m!1311905 () Bool)

(assert (=> b!1421177 m!1311905))

(declare-fun m!1311907 () Bool)

(assert (=> b!1421174 m!1311907))

(push 1)

(assert (not b!1421176))

(assert (not b!1421177))

(assert (not b!1421174))

(assert (not b!1421171))

(assert (not start!122790))

(assert (not b!1421175))

(assert (not b!1421172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

