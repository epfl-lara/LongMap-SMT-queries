; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122584 () Bool)

(assert start!122584)

(declare-fun b!1419805 () Bool)

(declare-fun res!955240 () Bool)

(declare-fun e!803227 () Bool)

(assert (=> b!1419805 (=> (not res!955240) (not e!803227))))

(declare-datatypes ((array!96949 0))(
  ( (array!96950 (arr!46792 (Array (_ BitVec 32) (_ BitVec 64))) (size!47342 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96949)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419805 (= res!955240 (validKeyInArray!0 (select (arr!46792 a!2831) j!81)))))

(declare-fun res!955242 () Bool)

(assert (=> start!122584 (=> (not res!955242) (not e!803227))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122584 (= res!955242 (validMask!0 mask!2608))))

(assert (=> start!122584 e!803227))

(assert (=> start!122584 true))

(declare-fun array_inv!35820 (array!96949) Bool)

(assert (=> start!122584 (array_inv!35820 a!2831)))

(declare-fun b!1419806 () Bool)

(declare-fun res!955246 () Bool)

(assert (=> b!1419806 (=> (not res!955246) (not e!803227))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419806 (= res!955246 (validKeyInArray!0 (select (arr!46792 a!2831) i!982)))))

(declare-fun b!1419807 () Bool)

(declare-fun res!955241 () Bool)

(assert (=> b!1419807 (=> (not res!955241) (not e!803227))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11077 0))(
  ( (MissingZero!11077 (index!46700 (_ BitVec 32))) (Found!11077 (index!46701 (_ BitVec 32))) (Intermediate!11077 (undefined!11889 Bool) (index!46702 (_ BitVec 32)) (x!128367 (_ BitVec 32))) (Undefined!11077) (MissingVacant!11077 (index!46703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96949 (_ BitVec 32)) SeekEntryResult!11077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419807 (= res!955241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46792 a!2831) j!81) mask!2608) (select (arr!46792 a!2831) j!81) a!2831 mask!2608) (Intermediate!11077 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419808 () Bool)

(declare-fun res!955239 () Bool)

(assert (=> b!1419808 (=> (not res!955239) (not e!803227))))

(declare-datatypes ((List!33302 0))(
  ( (Nil!33299) (Cons!33298 (h!34600 (_ BitVec 64)) (t!47996 List!33302)) )
))
(declare-fun arrayNoDuplicates!0 (array!96949 (_ BitVec 32) List!33302) Bool)

(assert (=> b!1419808 (= res!955239 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33299))))

(declare-fun b!1419809 () Bool)

(declare-fun res!955245 () Bool)

(assert (=> b!1419809 (=> (not res!955245) (not e!803227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96949 (_ BitVec 32)) Bool)

(assert (=> b!1419809 (= res!955245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419810 () Bool)

(declare-fun res!955243 () Bool)

(assert (=> b!1419810 (=> (not res!955243) (not e!803227))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419810 (= res!955243 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47342 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47342 a!2831))))))

(declare-fun b!1419811 () Bool)

(declare-fun res!955238 () Bool)

(assert (=> b!1419811 (=> (not res!955238) (not e!803227))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1419811 (= res!955238 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46792 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46792 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96950 (store (arr!46792 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47342 a!2831)) mask!2608) (Intermediate!11077 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419812 () Bool)

(assert (=> b!1419812 (= e!803227 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1419813 () Bool)

(declare-fun res!955244 () Bool)

(assert (=> b!1419813 (=> (not res!955244) (not e!803227))))

(assert (=> b!1419813 (= res!955244 (and (= (size!47342 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47342 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47342 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122584 res!955242) b!1419813))

(assert (= (and b!1419813 res!955244) b!1419806))

(assert (= (and b!1419806 res!955246) b!1419805))

(assert (= (and b!1419805 res!955240) b!1419809))

(assert (= (and b!1419809 res!955245) b!1419808))

(assert (= (and b!1419808 res!955239) b!1419810))

(assert (= (and b!1419810 res!955243) b!1419807))

(assert (= (and b!1419807 res!955241) b!1419811))

(assert (= (and b!1419811 res!955238) b!1419812))

(declare-fun m!1310261 () Bool)

(assert (=> b!1419811 m!1310261))

(declare-fun m!1310263 () Bool)

(assert (=> b!1419811 m!1310263))

(assert (=> b!1419811 m!1310263))

(declare-fun m!1310265 () Bool)

(assert (=> b!1419811 m!1310265))

(assert (=> b!1419811 m!1310265))

(assert (=> b!1419811 m!1310263))

(declare-fun m!1310267 () Bool)

(assert (=> b!1419811 m!1310267))

(declare-fun m!1310269 () Bool)

(assert (=> b!1419808 m!1310269))

(declare-fun m!1310271 () Bool)

(assert (=> b!1419806 m!1310271))

(assert (=> b!1419806 m!1310271))

(declare-fun m!1310273 () Bool)

(assert (=> b!1419806 m!1310273))

(declare-fun m!1310275 () Bool)

(assert (=> start!122584 m!1310275))

(declare-fun m!1310277 () Bool)

(assert (=> start!122584 m!1310277))

(declare-fun m!1310279 () Bool)

(assert (=> b!1419807 m!1310279))

(assert (=> b!1419807 m!1310279))

(declare-fun m!1310281 () Bool)

(assert (=> b!1419807 m!1310281))

(assert (=> b!1419807 m!1310281))

(assert (=> b!1419807 m!1310279))

(declare-fun m!1310283 () Bool)

(assert (=> b!1419807 m!1310283))

(declare-fun m!1310285 () Bool)

(assert (=> b!1419809 m!1310285))

(assert (=> b!1419805 m!1310279))

(assert (=> b!1419805 m!1310279))

(declare-fun m!1310287 () Bool)

(assert (=> b!1419805 m!1310287))

(push 1)

(assert (not start!122584))

(assert (not b!1419805))

(assert (not b!1419806))

(assert (not b!1419807))

(assert (not b!1419808))

(assert (not b!1419811))

(assert (not b!1419809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

