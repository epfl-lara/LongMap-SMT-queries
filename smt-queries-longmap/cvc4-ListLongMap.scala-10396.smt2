; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122500 () Bool)

(assert start!122500)

(declare-fun b!1419122 () Bool)

(declare-fun res!954646 () Bool)

(declare-fun e!802985 () Bool)

(assert (=> b!1419122 (=> (not res!954646) (not e!802985))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96904 0))(
  ( (array!96905 (arr!46771 (Array (_ BitVec 32) (_ BitVec 64))) (size!47321 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96904)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419122 (= res!954646 (and (= (size!47321 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47321 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47321 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419123 () Bool)

(declare-fun res!954648 () Bool)

(assert (=> b!1419123 (=> (not res!954648) (not e!802985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419123 (= res!954648 (validKeyInArray!0 (select (arr!46771 a!2831) j!81)))))

(declare-fun b!1419124 () Bool)

(declare-fun res!954649 () Bool)

(assert (=> b!1419124 (=> (not res!954649) (not e!802985))))

(declare-datatypes ((List!33281 0))(
  ( (Nil!33278) (Cons!33277 (h!34576 (_ BitVec 64)) (t!47975 List!33281)) )
))
(declare-fun arrayNoDuplicates!0 (array!96904 (_ BitVec 32) List!33281) Bool)

(assert (=> b!1419124 (= res!954649 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33278))))

(declare-fun res!954645 () Bool)

(assert (=> start!122500 (=> (not res!954645) (not e!802985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122500 (= res!954645 (validMask!0 mask!2608))))

(assert (=> start!122500 e!802985))

(assert (=> start!122500 true))

(declare-fun array_inv!35799 (array!96904) Bool)

(assert (=> start!122500 (array_inv!35799 a!2831)))

(declare-fun b!1419125 () Bool)

(declare-fun res!954644 () Bool)

(assert (=> b!1419125 (=> (not res!954644) (not e!802985))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11056 0))(
  ( (MissingZero!11056 (index!46616 (_ BitVec 32))) (Found!11056 (index!46617 (_ BitVec 32))) (Intermediate!11056 (undefined!11868 Bool) (index!46618 (_ BitVec 32)) (x!128284 (_ BitVec 32))) (Undefined!11056) (MissingVacant!11056 (index!46619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96904 (_ BitVec 32)) SeekEntryResult!11056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419125 (= res!954644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46771 a!2831) j!81) mask!2608) (select (arr!46771 a!2831) j!81) a!2831 mask!2608) (Intermediate!11056 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419126 () Bool)

(assert (=> b!1419126 (= e!802985 false)))

(declare-fun lt!625731 () (_ BitVec 32))

(assert (=> b!1419126 (= lt!625731 (toIndex!0 (select (store (arr!46771 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419127 () Bool)

(declare-fun res!954647 () Bool)

(assert (=> b!1419127 (=> (not res!954647) (not e!802985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96904 (_ BitVec 32)) Bool)

(assert (=> b!1419127 (= res!954647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419128 () Bool)

(declare-fun res!954643 () Bool)

(assert (=> b!1419128 (=> (not res!954643) (not e!802985))))

(assert (=> b!1419128 (= res!954643 (validKeyInArray!0 (select (arr!46771 a!2831) i!982)))))

(declare-fun b!1419129 () Bool)

(declare-fun res!954642 () Bool)

(assert (=> b!1419129 (=> (not res!954642) (not e!802985))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419129 (= res!954642 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47321 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47321 a!2831))))))

(assert (= (and start!122500 res!954645) b!1419122))

(assert (= (and b!1419122 res!954646) b!1419128))

(assert (= (and b!1419128 res!954643) b!1419123))

(assert (= (and b!1419123 res!954648) b!1419127))

(assert (= (and b!1419127 res!954647) b!1419124))

(assert (= (and b!1419124 res!954649) b!1419129))

(assert (= (and b!1419129 res!954642) b!1419125))

(assert (= (and b!1419125 res!954644) b!1419126))

(declare-fun m!1309627 () Bool)

(assert (=> b!1419126 m!1309627))

(declare-fun m!1309629 () Bool)

(assert (=> b!1419126 m!1309629))

(assert (=> b!1419126 m!1309629))

(declare-fun m!1309631 () Bool)

(assert (=> b!1419126 m!1309631))

(declare-fun m!1309633 () Bool)

(assert (=> b!1419123 m!1309633))

(assert (=> b!1419123 m!1309633))

(declare-fun m!1309635 () Bool)

(assert (=> b!1419123 m!1309635))

(declare-fun m!1309637 () Bool)

(assert (=> b!1419128 m!1309637))

(assert (=> b!1419128 m!1309637))

(declare-fun m!1309639 () Bool)

(assert (=> b!1419128 m!1309639))

(declare-fun m!1309641 () Bool)

(assert (=> b!1419124 m!1309641))

(assert (=> b!1419125 m!1309633))

(assert (=> b!1419125 m!1309633))

(declare-fun m!1309643 () Bool)

(assert (=> b!1419125 m!1309643))

(assert (=> b!1419125 m!1309643))

(assert (=> b!1419125 m!1309633))

(declare-fun m!1309645 () Bool)

(assert (=> b!1419125 m!1309645))

(declare-fun m!1309647 () Bool)

(assert (=> b!1419127 m!1309647))

(declare-fun m!1309649 () Bool)

(assert (=> start!122500 m!1309649))

(declare-fun m!1309651 () Bool)

(assert (=> start!122500 m!1309651))

(push 1)

(assert (not b!1419126))

(assert (not b!1419125))

(assert (not b!1419123))

(assert (not b!1419128))

(assert (not start!122500))

(assert (not b!1419127))

(assert (not b!1419124))

(check-sat)

(pop 1)

(push 1)

