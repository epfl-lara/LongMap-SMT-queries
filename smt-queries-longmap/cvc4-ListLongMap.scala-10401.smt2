; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122572 () Bool)

(assert start!122572)

(declare-fun b!1419653 () Bool)

(declare-fun res!955086 () Bool)

(declare-fun e!803191 () Bool)

(assert (=> b!1419653 (=> (not res!955086) (not e!803191))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96937 0))(
  ( (array!96938 (arr!46786 (Array (_ BitVec 32) (_ BitVec 64))) (size!47336 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96937)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419653 (= res!955086 (and (= (size!47336 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47336 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47336 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419654 () Bool)

(declare-fun e!803190 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419654 (= e!803190 (not (validKeyInArray!0 (select (store (arr!46786 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1419655 () Bool)

(declare-fun res!955090 () Bool)

(assert (=> b!1419655 (=> (not res!955090) (not e!803191))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419655 (= res!955090 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47336 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47336 a!2831))))))

(declare-fun b!1419656 () Bool)

(declare-fun res!955088 () Bool)

(assert (=> b!1419656 (=> (not res!955088) (not e!803191))))

(declare-datatypes ((SeekEntryResult!11071 0))(
  ( (MissingZero!11071 (index!46676 (_ BitVec 32))) (Found!11071 (index!46677 (_ BitVec 32))) (Intermediate!11071 (undefined!11883 Bool) (index!46678 (_ BitVec 32)) (x!128345 (_ BitVec 32))) (Undefined!11071) (MissingVacant!11071 (index!46679 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96937 (_ BitVec 32)) SeekEntryResult!11071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419656 (= res!955088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46786 a!2831) j!81) mask!2608) (select (arr!46786 a!2831) j!81) a!2831 mask!2608) (Intermediate!11071 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419657 () Bool)

(declare-fun res!955085 () Bool)

(assert (=> b!1419657 (=> (not res!955085) (not e!803191))))

(assert (=> b!1419657 (= res!955085 (validKeyInArray!0 (select (arr!46786 a!2831) j!81)))))

(declare-fun b!1419658 () Bool)

(declare-fun res!955091 () Bool)

(assert (=> b!1419658 (=> (not res!955091) (not e!803191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96937 (_ BitVec 32)) Bool)

(assert (=> b!1419658 (= res!955091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419659 () Bool)

(assert (=> b!1419659 (= e!803191 e!803190)))

(declare-fun res!955093 () Bool)

(assert (=> b!1419659 (=> (not res!955093) (not e!803190))))

(declare-fun lt!625845 () (_ BitVec 32))

(assert (=> b!1419659 (= res!955093 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge lt!625845 #b00000000000000000000000000000000) (bvslt lt!625845 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(assert (=> b!1419659 (= lt!625845 (toIndex!0 (select (store (arr!46786 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419660 () Bool)

(declare-fun res!955087 () Bool)

(assert (=> b!1419660 (=> (not res!955087) (not e!803191))))

(declare-datatypes ((List!33296 0))(
  ( (Nil!33293) (Cons!33292 (h!34594 (_ BitVec 64)) (t!47990 List!33296)) )
))
(declare-fun arrayNoDuplicates!0 (array!96937 (_ BitVec 32) List!33296) Bool)

(assert (=> b!1419660 (= res!955087 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33293))))

(declare-fun res!955092 () Bool)

(assert (=> start!122572 (=> (not res!955092) (not e!803191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122572 (= res!955092 (validMask!0 mask!2608))))

(assert (=> start!122572 e!803191))

(assert (=> start!122572 true))

(declare-fun array_inv!35814 (array!96937) Bool)

(assert (=> start!122572 (array_inv!35814 a!2831)))

(declare-fun b!1419652 () Bool)

(declare-fun res!955089 () Bool)

(assert (=> b!1419652 (=> (not res!955089) (not e!803191))))

(assert (=> b!1419652 (= res!955089 (validKeyInArray!0 (select (arr!46786 a!2831) i!982)))))

(assert (= (and start!122572 res!955092) b!1419653))

(assert (= (and b!1419653 res!955086) b!1419652))

(assert (= (and b!1419652 res!955089) b!1419657))

(assert (= (and b!1419657 res!955085) b!1419658))

(assert (= (and b!1419658 res!955091) b!1419660))

(assert (= (and b!1419660 res!955087) b!1419655))

(assert (= (and b!1419655 res!955090) b!1419656))

(assert (= (and b!1419656 res!955088) b!1419659))

(assert (= (and b!1419659 res!955093) b!1419654))

(declare-fun m!1310093 () Bool)

(assert (=> b!1419652 m!1310093))

(assert (=> b!1419652 m!1310093))

(declare-fun m!1310095 () Bool)

(assert (=> b!1419652 m!1310095))

(declare-fun m!1310097 () Bool)

(assert (=> b!1419658 m!1310097))

(declare-fun m!1310099 () Bool)

(assert (=> b!1419656 m!1310099))

(assert (=> b!1419656 m!1310099))

(declare-fun m!1310101 () Bool)

(assert (=> b!1419656 m!1310101))

(assert (=> b!1419656 m!1310101))

(assert (=> b!1419656 m!1310099))

(declare-fun m!1310103 () Bool)

(assert (=> b!1419656 m!1310103))

(declare-fun m!1310105 () Bool)

(assert (=> start!122572 m!1310105))

(declare-fun m!1310107 () Bool)

(assert (=> start!122572 m!1310107))

(declare-fun m!1310109 () Bool)

(assert (=> b!1419660 m!1310109))

(declare-fun m!1310111 () Bool)

(assert (=> b!1419654 m!1310111))

(declare-fun m!1310113 () Bool)

(assert (=> b!1419654 m!1310113))

(assert (=> b!1419654 m!1310113))

(declare-fun m!1310115 () Bool)

(assert (=> b!1419654 m!1310115))

(assert (=> b!1419657 m!1310099))

(assert (=> b!1419657 m!1310099))

(declare-fun m!1310117 () Bool)

(assert (=> b!1419657 m!1310117))

(assert (=> b!1419659 m!1310111))

(assert (=> b!1419659 m!1310113))

(assert (=> b!1419659 m!1310113))

(declare-fun m!1310119 () Bool)

(assert (=> b!1419659 m!1310119))

(push 1)

(assert (not b!1419652))

(assert (not b!1419656))

(assert (not start!122572))

(assert (not b!1419658))

(assert (not b!1419659))

(assert (not b!1419660))

(assert (not b!1419657))

(assert (not b!1419654))

(check-sat)

(pop 1)

