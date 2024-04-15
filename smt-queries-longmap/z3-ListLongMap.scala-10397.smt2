; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122498 () Bool)

(assert start!122498)

(declare-fun b!1419065 () Bool)

(declare-fun res!954640 () Bool)

(declare-fun e!802952 () Bool)

(assert (=> b!1419065 (=> (not res!954640) (not e!802952))))

(declare-datatypes ((array!96855 0))(
  ( (array!96856 (arr!46747 (Array (_ BitVec 32) (_ BitVec 64))) (size!47299 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96855)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419065 (= res!954640 (validKeyInArray!0 (select (arr!46747 a!2831) j!81)))))

(declare-fun b!1419066 () Bool)

(declare-fun res!954641 () Bool)

(assert (=> b!1419066 (=> (not res!954641) (not e!802952))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419066 (= res!954641 (and (= (size!47299 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47299 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47299 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419067 () Bool)

(declare-fun res!954642 () Bool)

(assert (=> b!1419067 (=> (not res!954642) (not e!802952))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1419067 (= res!954642 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47299 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47299 a!2831))))))

(declare-fun b!1419069 () Bool)

(assert (=> b!1419069 (= e!802952 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!625544 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419069 (= lt!625544 (toIndex!0 (select (store (arr!46747 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419070 () Bool)

(declare-fun res!954638 () Bool)

(assert (=> b!1419070 (=> (not res!954638) (not e!802952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96855 (_ BitVec 32)) Bool)

(assert (=> b!1419070 (= res!954638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419071 () Bool)

(declare-fun res!954639 () Bool)

(assert (=> b!1419071 (=> (not res!954639) (not e!802952))))

(declare-datatypes ((List!33335 0))(
  ( (Nil!33332) (Cons!33331 (h!34630 (_ BitVec 64)) (t!48021 List!33335)) )
))
(declare-fun arrayNoDuplicates!0 (array!96855 (_ BitVec 32) List!33335) Bool)

(assert (=> b!1419071 (= res!954639 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33332))))

(declare-fun b!1419072 () Bool)

(declare-fun res!954637 () Bool)

(assert (=> b!1419072 (=> (not res!954637) (not e!802952))))

(assert (=> b!1419072 (= res!954637 (validKeyInArray!0 (select (arr!46747 a!2831) i!982)))))

(declare-fun res!954643 () Bool)

(assert (=> start!122498 (=> (not res!954643) (not e!802952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122498 (= res!954643 (validMask!0 mask!2608))))

(assert (=> start!122498 e!802952))

(assert (=> start!122498 true))

(declare-fun array_inv!35980 (array!96855) Bool)

(assert (=> start!122498 (array_inv!35980 a!2831)))

(declare-fun b!1419068 () Bool)

(declare-fun res!954636 () Bool)

(assert (=> b!1419068 (=> (not res!954636) (not e!802952))))

(declare-datatypes ((SeekEntryResult!11059 0))(
  ( (MissingZero!11059 (index!46628 (_ BitVec 32))) (Found!11059 (index!46629 (_ BitVec 32))) (Intermediate!11059 (undefined!11871 Bool) (index!46630 (_ BitVec 32)) (x!128292 (_ BitVec 32))) (Undefined!11059) (MissingVacant!11059 (index!46631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96855 (_ BitVec 32)) SeekEntryResult!11059)

(assert (=> b!1419068 (= res!954636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46747 a!2831) j!81) mask!2608) (select (arr!46747 a!2831) j!81) a!2831 mask!2608) (Intermediate!11059 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122498 res!954643) b!1419066))

(assert (= (and b!1419066 res!954641) b!1419072))

(assert (= (and b!1419072 res!954637) b!1419065))

(assert (= (and b!1419065 res!954640) b!1419070))

(assert (= (and b!1419070 res!954638) b!1419071))

(assert (= (and b!1419071 res!954639) b!1419067))

(assert (= (and b!1419067 res!954642) b!1419068))

(assert (= (and b!1419068 res!954636) b!1419069))

(declare-fun m!1309101 () Bool)

(assert (=> start!122498 m!1309101))

(declare-fun m!1309103 () Bool)

(assert (=> start!122498 m!1309103))

(declare-fun m!1309105 () Bool)

(assert (=> b!1419065 m!1309105))

(assert (=> b!1419065 m!1309105))

(declare-fun m!1309107 () Bool)

(assert (=> b!1419065 m!1309107))

(declare-fun m!1309109 () Bool)

(assert (=> b!1419071 m!1309109))

(declare-fun m!1309111 () Bool)

(assert (=> b!1419070 m!1309111))

(assert (=> b!1419068 m!1309105))

(assert (=> b!1419068 m!1309105))

(declare-fun m!1309113 () Bool)

(assert (=> b!1419068 m!1309113))

(assert (=> b!1419068 m!1309113))

(assert (=> b!1419068 m!1309105))

(declare-fun m!1309115 () Bool)

(assert (=> b!1419068 m!1309115))

(declare-fun m!1309117 () Bool)

(assert (=> b!1419069 m!1309117))

(declare-fun m!1309119 () Bool)

(assert (=> b!1419069 m!1309119))

(assert (=> b!1419069 m!1309119))

(declare-fun m!1309121 () Bool)

(assert (=> b!1419069 m!1309121))

(declare-fun m!1309123 () Bool)

(assert (=> b!1419072 m!1309123))

(assert (=> b!1419072 m!1309123))

(declare-fun m!1309125 () Bool)

(assert (=> b!1419072 m!1309125))

(check-sat (not b!1419069) (not b!1419068) (not b!1419072) (not b!1419071) (not b!1419065) (not b!1419070) (not start!122498))
(check-sat)
