; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122442 () Bool)

(assert start!122442)

(declare-fun b!1418768 () Bool)

(declare-fun res!954375 () Bool)

(declare-fun e!802829 () Bool)

(assert (=> b!1418768 (=> (not res!954375) (not e!802829))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96885 0))(
  ( (array!96886 (arr!46763 (Array (_ BitVec 32) (_ BitVec 64))) (size!47313 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96885)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418768 (= res!954375 (and (= (size!47313 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47313 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47313 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!954377 () Bool)

(assert (=> start!122442 (=> (not res!954377) (not e!802829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122442 (= res!954377 (validMask!0 mask!2608))))

(assert (=> start!122442 e!802829))

(assert (=> start!122442 true))

(declare-fun array_inv!35791 (array!96885) Bool)

(assert (=> start!122442 (array_inv!35791 a!2831)))

(declare-fun b!1418769 () Bool)

(declare-fun res!954376 () Bool)

(assert (=> b!1418769 (=> (not res!954376) (not e!802829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418769 (= res!954376 (validKeyInArray!0 (select (arr!46763 a!2831) i!982)))))

(declare-fun b!1418770 () Bool)

(declare-fun res!954381 () Bool)

(assert (=> b!1418770 (=> (not res!954381) (not e!802829))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11048 0))(
  ( (MissingZero!11048 (index!46584 (_ BitVec 32))) (Found!11048 (index!46585 (_ BitVec 32))) (Intermediate!11048 (undefined!11860 Bool) (index!46586 (_ BitVec 32)) (x!128254 (_ BitVec 32))) (Undefined!11048) (MissingVacant!11048 (index!46587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96885 (_ BitVec 32)) SeekEntryResult!11048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418770 (= res!954381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46763 a!2831) j!81) mask!2608) (select (arr!46763 a!2831) j!81) a!2831 mask!2608) (Intermediate!11048 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418771 () Bool)

(declare-fun res!954379 () Bool)

(assert (=> b!1418771 (=> (not res!954379) (not e!802829))))

(assert (=> b!1418771 (= res!954379 (validKeyInArray!0 (select (arr!46763 a!2831) j!81)))))

(declare-fun b!1418772 () Bool)

(declare-fun res!954382 () Bool)

(assert (=> b!1418772 (=> (not res!954382) (not e!802829))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418772 (= res!954382 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47313 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47313 a!2831))))))

(declare-fun b!1418773 () Bool)

(declare-fun res!954378 () Bool)

(assert (=> b!1418773 (=> (not res!954378) (not e!802829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96885 (_ BitVec 32)) Bool)

(assert (=> b!1418773 (= res!954378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418774 () Bool)

(assert (=> b!1418774 (= e!802829 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1418775 () Bool)

(declare-fun res!954380 () Bool)

(assert (=> b!1418775 (=> (not res!954380) (not e!802829))))

(declare-datatypes ((List!33273 0))(
  ( (Nil!33270) (Cons!33269 (h!34565 (_ BitVec 64)) (t!47967 List!33273)) )
))
(declare-fun arrayNoDuplicates!0 (array!96885 (_ BitVec 32) List!33273) Bool)

(assert (=> b!1418775 (= res!954380 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33270))))

(assert (= (and start!122442 res!954377) b!1418768))

(assert (= (and b!1418768 res!954375) b!1418769))

(assert (= (and b!1418769 res!954376) b!1418771))

(assert (= (and b!1418771 res!954379) b!1418773))

(assert (= (and b!1418773 res!954378) b!1418775))

(assert (= (and b!1418775 res!954380) b!1418772))

(assert (= (and b!1418772 res!954382) b!1418770))

(assert (= (and b!1418770 res!954381) b!1418774))

(declare-fun m!1309383 () Bool)

(assert (=> b!1418773 m!1309383))

(declare-fun m!1309385 () Bool)

(assert (=> b!1418770 m!1309385))

(assert (=> b!1418770 m!1309385))

(declare-fun m!1309387 () Bool)

(assert (=> b!1418770 m!1309387))

(assert (=> b!1418770 m!1309387))

(assert (=> b!1418770 m!1309385))

(declare-fun m!1309389 () Bool)

(assert (=> b!1418770 m!1309389))

(declare-fun m!1309391 () Bool)

(assert (=> b!1418775 m!1309391))

(declare-fun m!1309393 () Bool)

(assert (=> b!1418769 m!1309393))

(assert (=> b!1418769 m!1309393))

(declare-fun m!1309395 () Bool)

(assert (=> b!1418769 m!1309395))

(assert (=> b!1418771 m!1309385))

(assert (=> b!1418771 m!1309385))

(declare-fun m!1309397 () Bool)

(assert (=> b!1418771 m!1309397))

(declare-fun m!1309399 () Bool)

(assert (=> start!122442 m!1309399))

(declare-fun m!1309401 () Bool)

(assert (=> start!122442 m!1309401))

(push 1)

(assert (not b!1418773))

(assert (not b!1418769))

(assert (not b!1418770))

(assert (not b!1418771))

(assert (not start!122442))

(assert (not b!1418775))

