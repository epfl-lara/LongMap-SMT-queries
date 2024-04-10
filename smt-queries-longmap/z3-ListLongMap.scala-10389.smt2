; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122378 () Bool)

(assert start!122378)

(declare-fun b!1418391 () Bool)

(declare-fun res!954037 () Bool)

(declare-fun e!802681 () Bool)

(assert (=> b!1418391 (=> (not res!954037) (not e!802681))))

(declare-datatypes ((array!96854 0))(
  ( (array!96855 (arr!46749 (Array (_ BitVec 32) (_ BitVec 64))) (size!47299 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96854)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418391 (= res!954037 (validKeyInArray!0 (select (arr!46749 a!2831) j!81)))))

(declare-fun res!954036 () Bool)

(assert (=> start!122378 (=> (not res!954036) (not e!802681))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122378 (= res!954036 (validMask!0 mask!2608))))

(assert (=> start!122378 e!802681))

(assert (=> start!122378 true))

(declare-fun array_inv!35777 (array!96854) Bool)

(assert (=> start!122378 (array_inv!35777 a!2831)))

(declare-fun b!1418392 () Bool)

(declare-fun res!954031 () Bool)

(assert (=> b!1418392 (=> (not res!954031) (not e!802681))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418392 (= res!954031 (validKeyInArray!0 (select (arr!46749 a!2831) i!982)))))

(declare-fun b!1418393 () Bool)

(declare-fun res!954035 () Bool)

(assert (=> b!1418393 (=> (not res!954035) (not e!802681))))

(assert (=> b!1418393 (= res!954035 (and (= (size!47299 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47299 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47299 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418394 () Bool)

(declare-fun res!954033 () Bool)

(assert (=> b!1418394 (=> (not res!954033) (not e!802681))))

(declare-datatypes ((List!33259 0))(
  ( (Nil!33256) (Cons!33255 (h!34548 (_ BitVec 64)) (t!47953 List!33259)) )
))
(declare-fun arrayNoDuplicates!0 (array!96854 (_ BitVec 32) List!33259) Bool)

(assert (=> b!1418394 (= res!954033 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33256))))

(declare-fun b!1418395 () Bool)

(declare-fun res!954032 () Bool)

(assert (=> b!1418395 (=> (not res!954032) (not e!802681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96854 (_ BitVec 32)) Bool)

(assert (=> b!1418395 (= res!954032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418396 () Bool)

(declare-fun res!954034 () Bool)

(assert (=> b!1418396 (=> (not res!954034) (not e!802681))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418396 (= res!954034 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47299 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47299 a!2831))))))

(declare-fun b!1418397 () Bool)

(assert (=> b!1418397 (= e!802681 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625575 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418397 (= lt!625575 (toIndex!0 (select (arr!46749 a!2831) j!81) mask!2608))))

(assert (= (and start!122378 res!954036) b!1418393))

(assert (= (and b!1418393 res!954035) b!1418392))

(assert (= (and b!1418392 res!954031) b!1418391))

(assert (= (and b!1418391 res!954037) b!1418395))

(assert (= (and b!1418395 res!954032) b!1418394))

(assert (= (and b!1418394 res!954033) b!1418396))

(assert (= (and b!1418396 res!954034) b!1418397))

(declare-fun m!1309083 () Bool)

(assert (=> b!1418391 m!1309083))

(assert (=> b!1418391 m!1309083))

(declare-fun m!1309085 () Bool)

(assert (=> b!1418391 m!1309085))

(declare-fun m!1309087 () Bool)

(assert (=> b!1418392 m!1309087))

(assert (=> b!1418392 m!1309087))

(declare-fun m!1309089 () Bool)

(assert (=> b!1418392 m!1309089))

(declare-fun m!1309091 () Bool)

(assert (=> start!122378 m!1309091))

(declare-fun m!1309093 () Bool)

(assert (=> start!122378 m!1309093))

(declare-fun m!1309095 () Bool)

(assert (=> b!1418394 m!1309095))

(assert (=> b!1418397 m!1309083))

(assert (=> b!1418397 m!1309083))

(declare-fun m!1309097 () Bool)

(assert (=> b!1418397 m!1309097))

(declare-fun m!1309099 () Bool)

(assert (=> b!1418395 m!1309099))

(check-sat (not b!1418397) (not b!1418395) (not b!1418394) (not b!1418391) (not b!1418392) (not start!122378))
(check-sat)
