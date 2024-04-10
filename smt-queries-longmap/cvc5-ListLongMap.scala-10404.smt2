; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122586 () Bool)

(assert start!122586)

(declare-fun b!1419830 () Bool)

(declare-fun res!955268 () Bool)

(declare-fun e!803234 () Bool)

(assert (=> b!1419830 (=> (not res!955268) (not e!803234))))

(declare-datatypes ((array!96951 0))(
  ( (array!96952 (arr!46793 (Array (_ BitVec 32) (_ BitVec 64))) (size!47343 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96951)

(declare-datatypes ((List!33303 0))(
  ( (Nil!33300) (Cons!33299 (h!34601 (_ BitVec 64)) (t!47997 List!33303)) )
))
(declare-fun arrayNoDuplicates!0 (array!96951 (_ BitVec 32) List!33303) Bool)

(assert (=> b!1419830 (= res!955268 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33300))))

(declare-fun b!1419831 () Bool)

(assert (=> b!1419831 (= e!803234 false)))

(declare-datatypes ((SeekEntryResult!11078 0))(
  ( (MissingZero!11078 (index!46704 (_ BitVec 32))) (Found!11078 (index!46705 (_ BitVec 32))) (Intermediate!11078 (undefined!11890 Bool) (index!46706 (_ BitVec 32)) (x!128376 (_ BitVec 32))) (Undefined!11078) (MissingVacant!11078 (index!46707 (_ BitVec 32))) )
))
(declare-fun lt!625857 () SeekEntryResult!11078)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96951 (_ BitVec 32)) SeekEntryResult!11078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419831 (= lt!625857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46793 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46793 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96952 (store (arr!46793 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47343 a!2831)) mask!2608))))

(declare-fun b!1419832 () Bool)

(declare-fun res!955264 () Bool)

(assert (=> b!1419832 (=> (not res!955264) (not e!803234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419832 (= res!955264 (validKeyInArray!0 (select (arr!46793 a!2831) j!81)))))

(declare-fun res!955266 () Bool)

(assert (=> start!122586 (=> (not res!955266) (not e!803234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122586 (= res!955266 (validMask!0 mask!2608))))

(assert (=> start!122586 e!803234))

(assert (=> start!122586 true))

(declare-fun array_inv!35821 (array!96951) Bool)

(assert (=> start!122586 (array_inv!35821 a!2831)))

(declare-fun b!1419833 () Bool)

(declare-fun res!955265 () Bool)

(assert (=> b!1419833 (=> (not res!955265) (not e!803234))))

(assert (=> b!1419833 (= res!955265 (validKeyInArray!0 (select (arr!46793 a!2831) i!982)))))

(declare-fun b!1419834 () Bool)

(declare-fun res!955263 () Bool)

(assert (=> b!1419834 (=> (not res!955263) (not e!803234))))

(assert (=> b!1419834 (= res!955263 (and (= (size!47343 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47343 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47343 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419835 () Bool)

(declare-fun res!955269 () Bool)

(assert (=> b!1419835 (=> (not res!955269) (not e!803234))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419835 (= res!955269 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47343 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47343 a!2831))))))

(declare-fun b!1419836 () Bool)

(declare-fun res!955270 () Bool)

(assert (=> b!1419836 (=> (not res!955270) (not e!803234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96951 (_ BitVec 32)) Bool)

(assert (=> b!1419836 (= res!955270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419837 () Bool)

(declare-fun res!955267 () Bool)

(assert (=> b!1419837 (=> (not res!955267) (not e!803234))))

(assert (=> b!1419837 (= res!955267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46793 a!2831) j!81) mask!2608) (select (arr!46793 a!2831) j!81) a!2831 mask!2608) (Intermediate!11078 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122586 res!955266) b!1419834))

(assert (= (and b!1419834 res!955263) b!1419833))

(assert (= (and b!1419833 res!955265) b!1419832))

(assert (= (and b!1419832 res!955264) b!1419836))

(assert (= (and b!1419836 res!955270) b!1419830))

(assert (= (and b!1419830 res!955268) b!1419835))

(assert (= (and b!1419835 res!955269) b!1419837))

(assert (= (and b!1419837 res!955267) b!1419831))

(declare-fun m!1310289 () Bool)

(assert (=> b!1419833 m!1310289))

(assert (=> b!1419833 m!1310289))

(declare-fun m!1310291 () Bool)

(assert (=> b!1419833 m!1310291))

(declare-fun m!1310293 () Bool)

(assert (=> b!1419832 m!1310293))

(assert (=> b!1419832 m!1310293))

(declare-fun m!1310295 () Bool)

(assert (=> b!1419832 m!1310295))

(declare-fun m!1310297 () Bool)

(assert (=> b!1419830 m!1310297))

(declare-fun m!1310299 () Bool)

(assert (=> start!122586 m!1310299))

(declare-fun m!1310301 () Bool)

(assert (=> start!122586 m!1310301))

(declare-fun m!1310303 () Bool)

(assert (=> b!1419836 m!1310303))

(assert (=> b!1419837 m!1310293))

(assert (=> b!1419837 m!1310293))

(declare-fun m!1310305 () Bool)

(assert (=> b!1419837 m!1310305))

(assert (=> b!1419837 m!1310305))

(assert (=> b!1419837 m!1310293))

(declare-fun m!1310307 () Bool)

(assert (=> b!1419837 m!1310307))

(declare-fun m!1310309 () Bool)

(assert (=> b!1419831 m!1310309))

(declare-fun m!1310311 () Bool)

(assert (=> b!1419831 m!1310311))

(assert (=> b!1419831 m!1310311))

(declare-fun m!1310313 () Bool)

(assert (=> b!1419831 m!1310313))

(assert (=> b!1419831 m!1310313))

(assert (=> b!1419831 m!1310311))

(declare-fun m!1310315 () Bool)

(assert (=> b!1419831 m!1310315))

(push 1)

(assert (not b!1419830))

(assert (not b!1419832))

(assert (not b!1419836))

(assert (not b!1419837))

(assert (not b!1419831))

(assert (not b!1419833))

(assert (not start!122586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

