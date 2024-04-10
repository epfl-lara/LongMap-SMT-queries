; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122570 () Bool)

(assert start!122570)

(declare-fun b!1419625 () Bool)

(declare-fun res!955058 () Bool)

(declare-fun e!803181 () Bool)

(assert (=> b!1419625 (=> (not res!955058) (not e!803181))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96935 0))(
  ( (array!96936 (arr!46785 (Array (_ BitVec 32) (_ BitVec 64))) (size!47335 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96935)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419625 (= res!955058 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47335 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47335 a!2831))))))

(declare-fun b!1419626 () Bool)

(declare-fun res!955062 () Bool)

(assert (=> b!1419626 (=> (not res!955062) (not e!803181))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419626 (= res!955062 (validKeyInArray!0 (select (arr!46785 a!2831) j!81)))))

(declare-fun b!1419627 () Bool)

(declare-fun res!955061 () Bool)

(assert (=> b!1419627 (=> (not res!955061) (not e!803181))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11070 0))(
  ( (MissingZero!11070 (index!46672 (_ BitVec 32))) (Found!11070 (index!46673 (_ BitVec 32))) (Intermediate!11070 (undefined!11882 Bool) (index!46674 (_ BitVec 32)) (x!128344 (_ BitVec 32))) (Undefined!11070) (MissingVacant!11070 (index!46675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96935 (_ BitVec 32)) SeekEntryResult!11070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419627 (= res!955061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46785 a!2831) j!81) mask!2608) (select (arr!46785 a!2831) j!81) a!2831 mask!2608) (Intermediate!11070 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419628 () Bool)

(declare-fun res!955060 () Bool)

(assert (=> b!1419628 (=> (not res!955060) (not e!803181))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419628 (= res!955060 (validKeyInArray!0 (select (arr!46785 a!2831) i!982)))))

(declare-fun b!1419629 () Bool)

(declare-fun e!803182 () Bool)

(assert (=> b!1419629 (= e!803181 e!803182)))

(declare-fun res!955065 () Bool)

(assert (=> b!1419629 (=> (not res!955065) (not e!803182))))

(declare-fun lt!625842 () (_ BitVec 32))

(assert (=> b!1419629 (= res!955065 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge lt!625842 #b00000000000000000000000000000000) (bvslt lt!625842 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(assert (=> b!1419629 (= lt!625842 (toIndex!0 (select (store (arr!46785 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419630 () Bool)

(declare-fun res!955059 () Bool)

(assert (=> b!1419630 (=> (not res!955059) (not e!803181))))

(assert (=> b!1419630 (= res!955059 (and (= (size!47335 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47335 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47335 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419631 () Bool)

(declare-fun res!955066 () Bool)

(assert (=> b!1419631 (=> (not res!955066) (not e!803181))))

(declare-datatypes ((List!33295 0))(
  ( (Nil!33292) (Cons!33291 (h!34593 (_ BitVec 64)) (t!47989 List!33295)) )
))
(declare-fun arrayNoDuplicates!0 (array!96935 (_ BitVec 32) List!33295) Bool)

(assert (=> b!1419631 (= res!955066 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33292))))

(declare-fun b!1419632 () Bool)

(assert (=> b!1419632 (= e!803182 (not (validKeyInArray!0 (select (store (arr!46785 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun res!955063 () Bool)

(assert (=> start!122570 (=> (not res!955063) (not e!803181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122570 (= res!955063 (validMask!0 mask!2608))))

(assert (=> start!122570 e!803181))

(assert (=> start!122570 true))

(declare-fun array_inv!35813 (array!96935) Bool)

(assert (=> start!122570 (array_inv!35813 a!2831)))

(declare-fun b!1419633 () Bool)

(declare-fun res!955064 () Bool)

(assert (=> b!1419633 (=> (not res!955064) (not e!803181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96935 (_ BitVec 32)) Bool)

(assert (=> b!1419633 (= res!955064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122570 res!955063) b!1419630))

(assert (= (and b!1419630 res!955059) b!1419628))

(assert (= (and b!1419628 res!955060) b!1419626))

(assert (= (and b!1419626 res!955062) b!1419633))

(assert (= (and b!1419633 res!955064) b!1419631))

(assert (= (and b!1419631 res!955066) b!1419625))

(assert (= (and b!1419625 res!955058) b!1419627))

(assert (= (and b!1419627 res!955061) b!1419629))

(assert (= (and b!1419629 res!955065) b!1419632))

(declare-fun m!1310065 () Bool)

(assert (=> b!1419628 m!1310065))

(assert (=> b!1419628 m!1310065))

(declare-fun m!1310067 () Bool)

(assert (=> b!1419628 m!1310067))

(declare-fun m!1310069 () Bool)

(assert (=> start!122570 m!1310069))

(declare-fun m!1310071 () Bool)

(assert (=> start!122570 m!1310071))

(declare-fun m!1310073 () Bool)

(assert (=> b!1419631 m!1310073))

(declare-fun m!1310075 () Bool)

(assert (=> b!1419633 m!1310075))

(declare-fun m!1310077 () Bool)

(assert (=> b!1419627 m!1310077))

(assert (=> b!1419627 m!1310077))

(declare-fun m!1310079 () Bool)

(assert (=> b!1419627 m!1310079))

(assert (=> b!1419627 m!1310079))

(assert (=> b!1419627 m!1310077))

(declare-fun m!1310081 () Bool)

(assert (=> b!1419627 m!1310081))

(declare-fun m!1310083 () Bool)

(assert (=> b!1419632 m!1310083))

(declare-fun m!1310085 () Bool)

(assert (=> b!1419632 m!1310085))

(assert (=> b!1419632 m!1310085))

(declare-fun m!1310087 () Bool)

(assert (=> b!1419632 m!1310087))

(assert (=> b!1419629 m!1310083))

(assert (=> b!1419629 m!1310085))

(assert (=> b!1419629 m!1310085))

(declare-fun m!1310089 () Bool)

(assert (=> b!1419629 m!1310089))

(assert (=> b!1419626 m!1310077))

(assert (=> b!1419626 m!1310077))

(declare-fun m!1310091 () Bool)

(assert (=> b!1419626 m!1310091))

(check-sat (not b!1419626) (not b!1419627) (not start!122570) (not b!1419632) (not b!1419633) (not b!1419629) (not b!1419631) (not b!1419628))
(check-sat)
