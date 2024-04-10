; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122328 () Bool)

(assert start!122328)

(declare-fun b!1418116 () Bool)

(declare-fun res!953795 () Bool)

(declare-fun e!802559 () Bool)

(assert (=> b!1418116 (=> (not res!953795) (not e!802559))))

(declare-datatypes ((array!96831 0))(
  ( (array!96832 (arr!46739 (Array (_ BitVec 32) (_ BitVec 64))) (size!47289 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96831)

(declare-datatypes ((List!33249 0))(
  ( (Nil!33246) (Cons!33245 (h!34538 (_ BitVec 64)) (t!47943 List!33249)) )
))
(declare-fun arrayNoDuplicates!0 (array!96831 (_ BitVec 32) List!33249) Bool)

(assert (=> b!1418116 (= res!953795 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33246))))

(declare-fun b!1418117 () Bool)

(declare-fun res!953796 () Bool)

(assert (=> b!1418117 (=> (not res!953796) (not e!802559))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418117 (= res!953796 (validKeyInArray!0 (select (arr!46739 a!2831) j!81)))))

(declare-fun res!953797 () Bool)

(assert (=> start!122328 (=> (not res!953797) (not e!802559))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122328 (= res!953797 (validMask!0 mask!2608))))

(assert (=> start!122328 e!802559))

(assert (=> start!122328 true))

(declare-fun array_inv!35767 (array!96831) Bool)

(assert (=> start!122328 (array_inv!35767 a!2831)))

(declare-fun b!1418118 () Bool)

(declare-fun res!953793 () Bool)

(assert (=> b!1418118 (=> (not res!953793) (not e!802559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96831 (_ BitVec 32)) Bool)

(assert (=> b!1418118 (= res!953793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418119 () Bool)

(declare-fun res!953794 () Bool)

(assert (=> b!1418119 (=> (not res!953794) (not e!802559))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418119 (= res!953794 (and (= (size!47289 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47289 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47289 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418120 () Bool)

(declare-fun res!953792 () Bool)

(assert (=> b!1418120 (=> (not res!953792) (not e!802559))))

(assert (=> b!1418120 (= res!953792 (validKeyInArray!0 (select (arr!46739 a!2831) i!982)))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1418121 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418121 (= e!802559 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47289 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47289 a!2831)) (bvslt mask!2608 #b00000000000000000000000000000000)))))

(assert (= (and start!122328 res!953797) b!1418119))

(assert (= (and b!1418119 res!953794) b!1418120))

(assert (= (and b!1418120 res!953792) b!1418117))

(assert (= (and b!1418117 res!953796) b!1418118))

(assert (= (and b!1418118 res!953793) b!1418116))

(assert (= (and b!1418116 res!953795) b!1418121))

(declare-fun m!1308867 () Bool)

(assert (=> b!1418120 m!1308867))

(assert (=> b!1418120 m!1308867))

(declare-fun m!1308869 () Bool)

(assert (=> b!1418120 m!1308869))

(declare-fun m!1308871 () Bool)

(assert (=> b!1418118 m!1308871))

(declare-fun m!1308873 () Bool)

(assert (=> b!1418116 m!1308873))

(declare-fun m!1308875 () Bool)

(assert (=> b!1418117 m!1308875))

(assert (=> b!1418117 m!1308875))

(declare-fun m!1308877 () Bool)

(assert (=> b!1418117 m!1308877))

(declare-fun m!1308879 () Bool)

(assert (=> start!122328 m!1308879))

(declare-fun m!1308881 () Bool)

(assert (=> start!122328 m!1308881))

(push 1)

(assert (not b!1418118))

(assert (not b!1418120))

(assert (not b!1418116))

(assert (not b!1418117))

(assert (not start!122328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

