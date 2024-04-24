; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122688 () Bool)

(assert start!122688)

(declare-fun b!1420262 () Bool)

(declare-fun e!803722 () Bool)

(assert (=> b!1420262 (= e!803722 false)))

(declare-fun lt!626129 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97014 0))(
  ( (array!97015 (arr!46824 (Array (_ BitVec 32) (_ BitVec 64))) (size!47375 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97014)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420262 (= lt!626129 (toIndex!0 (select (store (arr!46824 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420263 () Bool)

(declare-fun res!955100 () Bool)

(assert (=> b!1420263 (=> (not res!955100) (not e!803722))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11011 0))(
  ( (MissingZero!11011 (index!46436 (_ BitVec 32))) (Found!11011 (index!46437 (_ BitVec 32))) (Intermediate!11011 (undefined!11823 Bool) (index!46438 (_ BitVec 32)) (x!128258 (_ BitVec 32))) (Undefined!11011) (MissingVacant!11011 (index!46439 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97014 (_ BitVec 32)) SeekEntryResult!11011)

(assert (=> b!1420263 (= res!955100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46824 a!2831) j!81) mask!2608) (select (arr!46824 a!2831) j!81) a!2831 mask!2608) (Intermediate!11011 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420264 () Bool)

(declare-fun res!955102 () Bool)

(assert (=> b!1420264 (=> (not res!955102) (not e!803722))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1420264 (= res!955102 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47375 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47375 a!2831))))))

(declare-fun res!955098 () Bool)

(assert (=> start!122688 (=> (not res!955098) (not e!803722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122688 (= res!955098 (validMask!0 mask!2608))))

(assert (=> start!122688 e!803722))

(assert (=> start!122688 true))

(declare-fun array_inv!36105 (array!97014) Bool)

(assert (=> start!122688 (array_inv!36105 a!2831)))

(declare-fun b!1420265 () Bool)

(declare-fun res!955105 () Bool)

(assert (=> b!1420265 (=> (not res!955105) (not e!803722))))

(declare-datatypes ((List!33321 0))(
  ( (Nil!33318) (Cons!33317 (h!34624 (_ BitVec 64)) (t!48007 List!33321)) )
))
(declare-fun arrayNoDuplicates!0 (array!97014 (_ BitVec 32) List!33321) Bool)

(assert (=> b!1420265 (= res!955105 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33318))))

(declare-fun b!1420266 () Bool)

(declare-fun res!955101 () Bool)

(assert (=> b!1420266 (=> (not res!955101) (not e!803722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97014 (_ BitVec 32)) Bool)

(assert (=> b!1420266 (= res!955101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420267 () Bool)

(declare-fun res!955103 () Bool)

(assert (=> b!1420267 (=> (not res!955103) (not e!803722))))

(assert (=> b!1420267 (= res!955103 (and (= (size!47375 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47375 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47375 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420268 () Bool)

(declare-fun res!955104 () Bool)

(assert (=> b!1420268 (=> (not res!955104) (not e!803722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420268 (= res!955104 (validKeyInArray!0 (select (arr!46824 a!2831) i!982)))))

(declare-fun b!1420269 () Bool)

(declare-fun res!955099 () Bool)

(assert (=> b!1420269 (=> (not res!955099) (not e!803722))))

(assert (=> b!1420269 (= res!955099 (validKeyInArray!0 (select (arr!46824 a!2831) j!81)))))

(assert (= (and start!122688 res!955098) b!1420267))

(assert (= (and b!1420267 res!955103) b!1420268))

(assert (= (and b!1420268 res!955104) b!1420269))

(assert (= (and b!1420269 res!955099) b!1420266))

(assert (= (and b!1420266 res!955101) b!1420265))

(assert (= (and b!1420265 res!955105) b!1420264))

(assert (= (and b!1420264 res!955102) b!1420263))

(assert (= (and b!1420263 res!955100) b!1420262))

(declare-fun m!1310995 () Bool)

(assert (=> b!1420263 m!1310995))

(assert (=> b!1420263 m!1310995))

(declare-fun m!1310997 () Bool)

(assert (=> b!1420263 m!1310997))

(assert (=> b!1420263 m!1310997))

(assert (=> b!1420263 m!1310995))

(declare-fun m!1310999 () Bool)

(assert (=> b!1420263 m!1310999))

(declare-fun m!1311001 () Bool)

(assert (=> b!1420262 m!1311001))

(declare-fun m!1311003 () Bool)

(assert (=> b!1420262 m!1311003))

(assert (=> b!1420262 m!1311003))

(declare-fun m!1311005 () Bool)

(assert (=> b!1420262 m!1311005))

(declare-fun m!1311007 () Bool)

(assert (=> b!1420268 m!1311007))

(assert (=> b!1420268 m!1311007))

(declare-fun m!1311009 () Bool)

(assert (=> b!1420268 m!1311009))

(declare-fun m!1311011 () Bool)

(assert (=> start!122688 m!1311011))

(declare-fun m!1311013 () Bool)

(assert (=> start!122688 m!1311013))

(declare-fun m!1311015 () Bool)

(assert (=> b!1420266 m!1311015))

(declare-fun m!1311017 () Bool)

(assert (=> b!1420265 m!1311017))

(assert (=> b!1420269 m!1310995))

(assert (=> b!1420269 m!1310995))

(declare-fun m!1311019 () Bool)

(assert (=> b!1420269 m!1311019))

(push 1)

(assert (not b!1420269))

(assert (not b!1420266))

(assert (not b!1420262))

(assert (not b!1420265))

(assert (not b!1420268))

(assert (not b!1420263))

(assert (not start!122688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

