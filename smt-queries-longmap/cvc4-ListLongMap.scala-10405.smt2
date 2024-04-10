; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122596 () Bool)

(assert start!122596)

(declare-fun b!1419958 () Bool)

(declare-fun e!803264 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419958 (= e!803264 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1419959 () Bool)

(declare-fun res!955397 () Bool)

(assert (=> b!1419959 (=> (not res!955397) (not e!803264))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96961 0))(
  ( (array!96962 (arr!46798 (Array (_ BitVec 32) (_ BitVec 64))) (size!47348 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96961)

(declare-datatypes ((SeekEntryResult!11083 0))(
  ( (MissingZero!11083 (index!46724 (_ BitVec 32))) (Found!11083 (index!46725 (_ BitVec 32))) (Intermediate!11083 (undefined!11895 Bool) (index!46726 (_ BitVec 32)) (x!128389 (_ BitVec 32))) (Undefined!11083) (MissingVacant!11083 (index!46727 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96961 (_ BitVec 32)) SeekEntryResult!11083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419959 (= res!955397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46798 a!2831) j!81) mask!2608) (select (arr!46798 a!2831) j!81) a!2831 mask!2608) (Intermediate!11083 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419960 () Bool)

(declare-fun res!955395 () Bool)

(assert (=> b!1419960 (=> (not res!955395) (not e!803264))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419960 (= res!955395 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47348 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47348 a!2831))))))

(declare-fun b!1419961 () Bool)

(declare-fun res!955391 () Bool)

(assert (=> b!1419961 (=> (not res!955391) (not e!803264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419961 (= res!955391 (validKeyInArray!0 (select (arr!46798 a!2831) j!81)))))

(declare-fun b!1419962 () Bool)

(declare-fun res!955396 () Bool)

(assert (=> b!1419962 (=> (not res!955396) (not e!803264))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419962 (= res!955396 (and (= (size!47348 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47348 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47348 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419963 () Bool)

(declare-fun res!955394 () Bool)

(assert (=> b!1419963 (=> (not res!955394) (not e!803264))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1419963 (= res!955394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46798 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46798 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96962 (store (arr!46798 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47348 a!2831)) mask!2608) (Intermediate!11083 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419964 () Bool)

(declare-fun res!955392 () Bool)

(assert (=> b!1419964 (=> (not res!955392) (not e!803264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96961 (_ BitVec 32)) Bool)

(assert (=> b!1419964 (= res!955392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419965 () Bool)

(declare-fun res!955399 () Bool)

(assert (=> b!1419965 (=> (not res!955399) (not e!803264))))

(declare-datatypes ((List!33308 0))(
  ( (Nil!33305) (Cons!33304 (h!34606 (_ BitVec 64)) (t!48002 List!33308)) )
))
(declare-fun arrayNoDuplicates!0 (array!96961 (_ BitVec 32) List!33308) Bool)

(assert (=> b!1419965 (= res!955399 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33305))))

(declare-fun res!955393 () Bool)

(assert (=> start!122596 (=> (not res!955393) (not e!803264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122596 (= res!955393 (validMask!0 mask!2608))))

(assert (=> start!122596 e!803264))

(assert (=> start!122596 true))

(declare-fun array_inv!35826 (array!96961) Bool)

(assert (=> start!122596 (array_inv!35826 a!2831)))

(declare-fun b!1419966 () Bool)

(declare-fun res!955398 () Bool)

(assert (=> b!1419966 (=> (not res!955398) (not e!803264))))

(assert (=> b!1419966 (= res!955398 (validKeyInArray!0 (select (arr!46798 a!2831) i!982)))))

(assert (= (and start!122596 res!955393) b!1419962))

(assert (= (and b!1419962 res!955396) b!1419966))

(assert (= (and b!1419966 res!955398) b!1419961))

(assert (= (and b!1419961 res!955391) b!1419964))

(assert (= (and b!1419964 res!955392) b!1419965))

(assert (= (and b!1419965 res!955399) b!1419960))

(assert (= (and b!1419960 res!955395) b!1419959))

(assert (= (and b!1419959 res!955397) b!1419963))

(assert (= (and b!1419963 res!955394) b!1419958))

(declare-fun m!1310429 () Bool)

(assert (=> b!1419966 m!1310429))

(assert (=> b!1419966 m!1310429))

(declare-fun m!1310431 () Bool)

(assert (=> b!1419966 m!1310431))

(declare-fun m!1310433 () Bool)

(assert (=> b!1419964 m!1310433))

(declare-fun m!1310435 () Bool)

(assert (=> b!1419965 m!1310435))

(declare-fun m!1310437 () Bool)

(assert (=> b!1419959 m!1310437))

(assert (=> b!1419959 m!1310437))

(declare-fun m!1310439 () Bool)

(assert (=> b!1419959 m!1310439))

(assert (=> b!1419959 m!1310439))

(assert (=> b!1419959 m!1310437))

(declare-fun m!1310441 () Bool)

(assert (=> b!1419959 m!1310441))

(declare-fun m!1310443 () Bool)

(assert (=> start!122596 m!1310443))

(declare-fun m!1310445 () Bool)

(assert (=> start!122596 m!1310445))

(assert (=> b!1419961 m!1310437))

(assert (=> b!1419961 m!1310437))

(declare-fun m!1310447 () Bool)

(assert (=> b!1419961 m!1310447))

(declare-fun m!1310449 () Bool)

(assert (=> b!1419963 m!1310449))

(declare-fun m!1310451 () Bool)

(assert (=> b!1419963 m!1310451))

(assert (=> b!1419963 m!1310451))

(declare-fun m!1310453 () Bool)

(assert (=> b!1419963 m!1310453))

(assert (=> b!1419963 m!1310453))

(assert (=> b!1419963 m!1310451))

(declare-fun m!1310455 () Bool)

(assert (=> b!1419963 m!1310455))

(push 1)

(assert (not b!1419964))

(assert (not b!1419959))

(assert (not b!1419966))

(assert (not b!1419961))

(assert (not b!1419965))

(assert (not start!122596))

(assert (not b!1419963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

