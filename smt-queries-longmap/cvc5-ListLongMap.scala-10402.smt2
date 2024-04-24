; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122766 () Bool)

(assert start!122766)

(declare-fun res!955615 () Bool)

(declare-fun e!803948 () Bool)

(assert (=> start!122766 (=> (not res!955615) (not e!803948))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122766 (= res!955615 (validMask!0 mask!2608))))

(assert (=> start!122766 e!803948))

(assert (=> start!122766 true))

(declare-datatypes ((array!97053 0))(
  ( (array!97054 (arr!46842 (Array (_ BitVec 32) (_ BitVec 64))) (size!47393 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97053)

(declare-fun array_inv!36123 (array!97053) Bool)

(assert (=> start!122766 (array_inv!36123 a!2831)))

(declare-fun b!1420865 () Bool)

(declare-fun res!955616 () Bool)

(assert (=> b!1420865 (=> (not res!955616) (not e!803948))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420865 (= res!955616 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47393 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47393 a!2831))))))

(declare-fun b!1420866 () Bool)

(declare-fun res!955617 () Bool)

(assert (=> b!1420866 (=> (not res!955617) (not e!803948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97053 (_ BitVec 32)) Bool)

(assert (=> b!1420866 (= res!955617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420867 () Bool)

(declare-fun res!955621 () Bool)

(assert (=> b!1420867 (=> (not res!955621) (not e!803948))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420867 (= res!955621 (validKeyInArray!0 (select (arr!46842 a!2831) j!81)))))

(declare-fun b!1420868 () Bool)

(declare-fun res!955620 () Bool)

(assert (=> b!1420868 (=> (not res!955620) (not e!803948))))

(declare-datatypes ((List!33339 0))(
  ( (Nil!33336) (Cons!33335 (h!34645 (_ BitVec 64)) (t!48025 List!33339)) )
))
(declare-fun arrayNoDuplicates!0 (array!97053 (_ BitVec 32) List!33339) Bool)

(assert (=> b!1420868 (= res!955620 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33336))))

(declare-fun b!1420869 () Bool)

(declare-fun res!955619 () Bool)

(assert (=> b!1420869 (=> (not res!955619) (not e!803948))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420869 (= res!955619 (validKeyInArray!0 (select (arr!46842 a!2831) i!982)))))

(declare-fun b!1420870 () Bool)

(declare-fun res!955614 () Bool)

(assert (=> b!1420870 (=> (not res!955614) (not e!803948))))

(declare-datatypes ((SeekEntryResult!11029 0))(
  ( (MissingZero!11029 (index!46508 (_ BitVec 32))) (Found!11029 (index!46509 (_ BitVec 32))) (Intermediate!11029 (undefined!11841 Bool) (index!46510 (_ BitVec 32)) (x!128330 (_ BitVec 32))) (Undefined!11029) (MissingVacant!11029 (index!46511 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97053 (_ BitVec 32)) SeekEntryResult!11029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420870 (= res!955614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46842 a!2831) j!81) mask!2608) (select (arr!46842 a!2831) j!81) a!2831 mask!2608) (Intermediate!11029 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420871 () Bool)

(declare-fun res!955618 () Bool)

(assert (=> b!1420871 (=> (not res!955618) (not e!803948))))

(assert (=> b!1420871 (= res!955618 (and (= (size!47393 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47393 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47393 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420872 () Bool)

(assert (=> b!1420872 (= e!803948 false)))

(declare-fun lt!626252 () SeekEntryResult!11029)

(assert (=> b!1420872 (= lt!626252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46842 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46842 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97054 (store (arr!46842 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47393 a!2831)) mask!2608))))

(assert (= (and start!122766 res!955615) b!1420871))

(assert (= (and b!1420871 res!955618) b!1420869))

(assert (= (and b!1420869 res!955619) b!1420867))

(assert (= (and b!1420867 res!955621) b!1420866))

(assert (= (and b!1420866 res!955617) b!1420868))

(assert (= (and b!1420868 res!955620) b!1420865))

(assert (= (and b!1420865 res!955616) b!1420870))

(assert (= (and b!1420870 res!955614) b!1420872))

(declare-fun m!1311545 () Bool)

(assert (=> start!122766 m!1311545))

(declare-fun m!1311547 () Bool)

(assert (=> start!122766 m!1311547))

(declare-fun m!1311549 () Bool)

(assert (=> b!1420868 m!1311549))

(declare-fun m!1311551 () Bool)

(assert (=> b!1420870 m!1311551))

(assert (=> b!1420870 m!1311551))

(declare-fun m!1311553 () Bool)

(assert (=> b!1420870 m!1311553))

(assert (=> b!1420870 m!1311553))

(assert (=> b!1420870 m!1311551))

(declare-fun m!1311555 () Bool)

(assert (=> b!1420870 m!1311555))

(declare-fun m!1311557 () Bool)

(assert (=> b!1420866 m!1311557))

(declare-fun m!1311559 () Bool)

(assert (=> b!1420872 m!1311559))

(declare-fun m!1311561 () Bool)

(assert (=> b!1420872 m!1311561))

(assert (=> b!1420872 m!1311561))

(declare-fun m!1311563 () Bool)

(assert (=> b!1420872 m!1311563))

(assert (=> b!1420872 m!1311563))

(assert (=> b!1420872 m!1311561))

(declare-fun m!1311565 () Bool)

(assert (=> b!1420872 m!1311565))

(assert (=> b!1420867 m!1311551))

(assert (=> b!1420867 m!1311551))

(declare-fun m!1311567 () Bool)

(assert (=> b!1420867 m!1311567))

(declare-fun m!1311569 () Bool)

(assert (=> b!1420869 m!1311569))

(assert (=> b!1420869 m!1311569))

(declare-fun m!1311571 () Bool)

(assert (=> b!1420869 m!1311571))

(push 1)

(assert (not b!1420870))

(assert (not b!1420872))

(assert (not b!1420867))

(assert (not b!1420866))

(assert (not start!122766))

(assert (not b!1420868))

(assert (not b!1420869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

