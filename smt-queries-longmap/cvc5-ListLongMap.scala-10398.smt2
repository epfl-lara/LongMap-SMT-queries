; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122700 () Bool)

(assert start!122700)

(declare-fun b!1420406 () Bool)

(declare-fun res!955244 () Bool)

(declare-fun e!803758 () Bool)

(assert (=> b!1420406 (=> (not res!955244) (not e!803758))))

(declare-datatypes ((array!97026 0))(
  ( (array!97027 (arr!46830 (Array (_ BitVec 32) (_ BitVec 64))) (size!47381 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97026)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97026 (_ BitVec 32)) Bool)

(assert (=> b!1420406 (= res!955244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420407 () Bool)

(declare-fun res!955245 () Bool)

(assert (=> b!1420407 (=> (not res!955245) (not e!803758))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420407 (= res!955245 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47381 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47381 a!2831))))))

(declare-fun b!1420408 () Bool)

(declare-fun res!955248 () Bool)

(assert (=> b!1420408 (=> (not res!955248) (not e!803758))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420408 (= res!955248 (and (= (size!47381 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47381 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47381 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420409 () Bool)

(declare-fun res!955249 () Bool)

(assert (=> b!1420409 (=> (not res!955249) (not e!803758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420409 (= res!955249 (validKeyInArray!0 (select (arr!46830 a!2831) i!982)))))

(declare-fun b!1420410 () Bool)

(declare-fun res!955242 () Bool)

(assert (=> b!1420410 (=> (not res!955242) (not e!803758))))

(assert (=> b!1420410 (= res!955242 (validKeyInArray!0 (select (arr!46830 a!2831) j!81)))))

(declare-fun b!1420411 () Bool)

(declare-fun res!955246 () Bool)

(assert (=> b!1420411 (=> (not res!955246) (not e!803758))))

(declare-datatypes ((SeekEntryResult!11017 0))(
  ( (MissingZero!11017 (index!46460 (_ BitVec 32))) (Found!11017 (index!46461 (_ BitVec 32))) (Intermediate!11017 (undefined!11829 Bool) (index!46462 (_ BitVec 32)) (x!128280 (_ BitVec 32))) (Undefined!11017) (MissingVacant!11017 (index!46463 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97026 (_ BitVec 32)) SeekEntryResult!11017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420411 (= res!955246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46830 a!2831) j!81) mask!2608) (select (arr!46830 a!2831) j!81) a!2831 mask!2608) (Intermediate!11017 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955243 () Bool)

(assert (=> start!122700 (=> (not res!955243) (not e!803758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122700 (= res!955243 (validMask!0 mask!2608))))

(assert (=> start!122700 e!803758))

(assert (=> start!122700 true))

(declare-fun array_inv!36111 (array!97026) Bool)

(assert (=> start!122700 (array_inv!36111 a!2831)))

(declare-fun b!1420412 () Bool)

(assert (=> b!1420412 (= e!803758 false)))

(declare-fun lt!626147 () (_ BitVec 32))

(assert (=> b!1420412 (= lt!626147 (toIndex!0 (select (store (arr!46830 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420413 () Bool)

(declare-fun res!955247 () Bool)

(assert (=> b!1420413 (=> (not res!955247) (not e!803758))))

(declare-datatypes ((List!33327 0))(
  ( (Nil!33324) (Cons!33323 (h!34630 (_ BitVec 64)) (t!48013 List!33327)) )
))
(declare-fun arrayNoDuplicates!0 (array!97026 (_ BitVec 32) List!33327) Bool)

(assert (=> b!1420413 (= res!955247 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33324))))

(assert (= (and start!122700 res!955243) b!1420408))

(assert (= (and b!1420408 res!955248) b!1420409))

(assert (= (and b!1420409 res!955249) b!1420410))

(assert (= (and b!1420410 res!955242) b!1420406))

(assert (= (and b!1420406 res!955244) b!1420413))

(assert (= (and b!1420413 res!955247) b!1420407))

(assert (= (and b!1420407 res!955245) b!1420411))

(assert (= (and b!1420411 res!955246) b!1420412))

(declare-fun m!1311151 () Bool)

(assert (=> b!1420406 m!1311151))

(declare-fun m!1311153 () Bool)

(assert (=> b!1420410 m!1311153))

(assert (=> b!1420410 m!1311153))

(declare-fun m!1311155 () Bool)

(assert (=> b!1420410 m!1311155))

(declare-fun m!1311157 () Bool)

(assert (=> start!122700 m!1311157))

(declare-fun m!1311159 () Bool)

(assert (=> start!122700 m!1311159))

(declare-fun m!1311161 () Bool)

(assert (=> b!1420409 m!1311161))

(assert (=> b!1420409 m!1311161))

(declare-fun m!1311163 () Bool)

(assert (=> b!1420409 m!1311163))

(declare-fun m!1311165 () Bool)

(assert (=> b!1420413 m!1311165))

(declare-fun m!1311167 () Bool)

(assert (=> b!1420412 m!1311167))

(declare-fun m!1311169 () Bool)

(assert (=> b!1420412 m!1311169))

(assert (=> b!1420412 m!1311169))

(declare-fun m!1311171 () Bool)

(assert (=> b!1420412 m!1311171))

(assert (=> b!1420411 m!1311153))

(assert (=> b!1420411 m!1311153))

(declare-fun m!1311173 () Bool)

(assert (=> b!1420411 m!1311173))

(assert (=> b!1420411 m!1311173))

(assert (=> b!1420411 m!1311153))

(declare-fun m!1311175 () Bool)

(assert (=> b!1420411 m!1311175))

(push 1)

(assert (not b!1420409))

(assert (not b!1420412))

(assert (not b!1420413))

(assert (not start!122700))

(assert (not b!1420410))

(assert (not b!1420411))

(assert (not b!1420406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

