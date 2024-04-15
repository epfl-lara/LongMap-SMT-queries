; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123230 () Bool)

(assert start!123230)

(declare-fun res!963424 () Bool)

(declare-fun e!806865 () Bool)

(assert (=> start!123230 (=> (not res!963424) (not e!806865))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123230 (= res!963424 (validMask!0 mask!2608))))

(assert (=> start!123230 e!806865))

(assert (=> start!123230 true))

(declare-datatypes ((array!97344 0))(
  ( (array!97345 (arr!46984 (Array (_ BitVec 32) (_ BitVec 64))) (size!47536 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97344)

(declare-fun array_inv!36217 (array!97344) Bool)

(assert (=> start!123230 (array_inv!36217 a!2831)))

(declare-fun b!1428744 () Bool)

(declare-fun res!963431 () Bool)

(assert (=> b!1428744 (=> (not res!963431) (not e!806865))))

(declare-datatypes ((List!33572 0))(
  ( (Nil!33569) (Cons!33568 (h!34882 (_ BitVec 64)) (t!48258 List!33572)) )
))
(declare-fun arrayNoDuplicates!0 (array!97344 (_ BitVec 32) List!33572) Bool)

(assert (=> b!1428744 (= res!963431 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33569))))

(declare-fun b!1428745 () Bool)

(declare-fun e!806866 () Bool)

(declare-fun e!806864 () Bool)

(assert (=> b!1428745 (= e!806866 e!806864)))

(declare-fun res!963435 () Bool)

(assert (=> b!1428745 (=> (not res!963435) (not e!806864))))

(declare-datatypes ((SeekEntryResult!11290 0))(
  ( (MissingZero!11290 (index!47552 (_ BitVec 32))) (Found!11290 (index!47553 (_ BitVec 32))) (Intermediate!11290 (undefined!12102 Bool) (index!47554 (_ BitVec 32)) (x!129185 (_ BitVec 32))) (Undefined!11290) (MissingVacant!11290 (index!47555 (_ BitVec 32))) )
))
(declare-fun lt!628941 () SeekEntryResult!11290)

(declare-fun lt!628943 () array!97344)

(declare-fun lt!628939 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97344 (_ BitVec 32)) SeekEntryResult!11290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428745 (= res!963435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628939 mask!2608) lt!628939 lt!628943 mask!2608) lt!628941))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428745 (= lt!628941 (Intermediate!11290 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428745 (= lt!628939 (select (store (arr!46984 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428745 (= lt!628943 (array!97345 (store (arr!46984 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47536 a!2831)))))

(declare-fun b!1428746 () Bool)

(declare-fun res!963428 () Bool)

(assert (=> b!1428746 (=> (not res!963428) (not e!806865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428746 (= res!963428 (validKeyInArray!0 (select (arr!46984 a!2831) j!81)))))

(declare-fun b!1428747 () Bool)

(declare-fun res!963436 () Bool)

(assert (=> b!1428747 (=> (not res!963436) (not e!806865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97344 (_ BitVec 32)) Bool)

(assert (=> b!1428747 (= res!963436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428748 () Bool)

(declare-fun res!963429 () Bool)

(assert (=> b!1428748 (=> (not res!963429) (not e!806864))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428748 (= res!963429 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428749 () Bool)

(declare-fun res!963433 () Bool)

(assert (=> b!1428749 (=> (not res!963433) (not e!806864))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428749 (= res!963433 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628939 lt!628943 mask!2608) lt!628941))))

(declare-fun b!1428750 () Bool)

(declare-fun res!963432 () Bool)

(assert (=> b!1428750 (=> (not res!963432) (not e!806864))))

(declare-fun lt!628940 () SeekEntryResult!11290)

(assert (=> b!1428750 (= res!963432 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628940))))

(declare-fun e!806863 () Bool)

(declare-fun b!1428751 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97344 (_ BitVec 32)) SeekEntryResult!11290)

(assert (=> b!1428751 (= e!806863 (= (seekEntryOrOpen!0 (select (arr!46984 a!2831) j!81) a!2831 mask!2608) (Found!11290 j!81)))))

(declare-fun b!1428752 () Bool)

(assert (=> b!1428752 (= e!806864 (not true))))

(assert (=> b!1428752 e!806863))

(declare-fun res!963426 () Bool)

(assert (=> b!1428752 (=> (not res!963426) (not e!806863))))

(assert (=> b!1428752 (= res!963426 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48165 0))(
  ( (Unit!48166) )
))
(declare-fun lt!628942 () Unit!48165)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48165)

(assert (=> b!1428752 (= lt!628942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428753 () Bool)

(declare-fun res!963425 () Bool)

(assert (=> b!1428753 (=> (not res!963425) (not e!806865))))

(assert (=> b!1428753 (= res!963425 (validKeyInArray!0 (select (arr!46984 a!2831) i!982)))))

(declare-fun b!1428754 () Bool)

(declare-fun res!963427 () Bool)

(assert (=> b!1428754 (=> (not res!963427) (not e!806865))))

(assert (=> b!1428754 (= res!963427 (and (= (size!47536 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47536 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47536 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428755 () Bool)

(declare-fun res!963430 () Bool)

(assert (=> b!1428755 (=> (not res!963430) (not e!806865))))

(assert (=> b!1428755 (= res!963430 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47536 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47536 a!2831))))))

(declare-fun b!1428756 () Bool)

(assert (=> b!1428756 (= e!806865 e!806866)))

(declare-fun res!963434 () Bool)

(assert (=> b!1428756 (=> (not res!963434) (not e!806866))))

(assert (=> b!1428756 (= res!963434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46984 a!2831) j!81) mask!2608) (select (arr!46984 a!2831) j!81) a!2831 mask!2608) lt!628940))))

(assert (=> b!1428756 (= lt!628940 (Intermediate!11290 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123230 res!963424) b!1428754))

(assert (= (and b!1428754 res!963427) b!1428753))

(assert (= (and b!1428753 res!963425) b!1428746))

(assert (= (and b!1428746 res!963428) b!1428747))

(assert (= (and b!1428747 res!963436) b!1428744))

(assert (= (and b!1428744 res!963431) b!1428755))

(assert (= (and b!1428755 res!963430) b!1428756))

(assert (= (and b!1428756 res!963434) b!1428745))

(assert (= (and b!1428745 res!963435) b!1428750))

(assert (= (and b!1428750 res!963432) b!1428749))

(assert (= (and b!1428749 res!963433) b!1428748))

(assert (= (and b!1428748 res!963429) b!1428752))

(assert (= (and b!1428752 res!963426) b!1428751))

(declare-fun m!1318389 () Bool)

(assert (=> b!1428752 m!1318389))

(declare-fun m!1318391 () Bool)

(assert (=> b!1428752 m!1318391))

(declare-fun m!1318393 () Bool)

(assert (=> b!1428747 m!1318393))

(declare-fun m!1318395 () Bool)

(assert (=> b!1428746 m!1318395))

(assert (=> b!1428746 m!1318395))

(declare-fun m!1318397 () Bool)

(assert (=> b!1428746 m!1318397))

(declare-fun m!1318399 () Bool)

(assert (=> b!1428753 m!1318399))

(assert (=> b!1428753 m!1318399))

(declare-fun m!1318401 () Bool)

(assert (=> b!1428753 m!1318401))

(declare-fun m!1318403 () Bool)

(assert (=> b!1428745 m!1318403))

(assert (=> b!1428745 m!1318403))

(declare-fun m!1318405 () Bool)

(assert (=> b!1428745 m!1318405))

(declare-fun m!1318407 () Bool)

(assert (=> b!1428745 m!1318407))

(declare-fun m!1318409 () Bool)

(assert (=> b!1428745 m!1318409))

(declare-fun m!1318411 () Bool)

(assert (=> start!123230 m!1318411))

(declare-fun m!1318413 () Bool)

(assert (=> start!123230 m!1318413))

(assert (=> b!1428751 m!1318395))

(assert (=> b!1428751 m!1318395))

(declare-fun m!1318415 () Bool)

(assert (=> b!1428751 m!1318415))

(declare-fun m!1318417 () Bool)

(assert (=> b!1428749 m!1318417))

(declare-fun m!1318419 () Bool)

(assert (=> b!1428744 m!1318419))

(assert (=> b!1428756 m!1318395))

(assert (=> b!1428756 m!1318395))

(declare-fun m!1318421 () Bool)

(assert (=> b!1428756 m!1318421))

(assert (=> b!1428756 m!1318421))

(assert (=> b!1428756 m!1318395))

(declare-fun m!1318423 () Bool)

(assert (=> b!1428756 m!1318423))

(assert (=> b!1428750 m!1318395))

(assert (=> b!1428750 m!1318395))

(declare-fun m!1318425 () Bool)

(assert (=> b!1428750 m!1318425))

(check-sat (not b!1428749) (not b!1428751) (not b!1428746) (not b!1428750) (not b!1428744) (not b!1428745) (not b!1428752) (not start!123230) (not b!1428756) (not b!1428753) (not b!1428747))
(check-sat)
