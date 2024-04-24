; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123506 () Bool)

(assert start!123506)

(declare-fun b!1430859 () Bool)

(declare-fun e!808055 () Bool)

(declare-fun e!808057 () Bool)

(assert (=> b!1430859 (= e!808055 e!808057)))

(declare-fun res!964607 () Bool)

(assert (=> b!1430859 (=> (not res!964607) (not e!808057))))

(declare-datatypes ((SeekEntryResult!11258 0))(
  ( (MissingZero!11258 (index!47424 (_ BitVec 32))) (Found!11258 (index!47425 (_ BitVec 32))) (Intermediate!11258 (undefined!12070 Bool) (index!47426 (_ BitVec 32)) (x!129221 (_ BitVec 32))) (Undefined!11258) (MissingVacant!11258 (index!47427 (_ BitVec 32))) )
))
(declare-fun lt!629884 () SeekEntryResult!11258)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97538 0))(
  ( (array!97539 (arr!47077 (Array (_ BitVec 32) (_ BitVec 64))) (size!47628 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97538)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97538 (_ BitVec 32)) SeekEntryResult!11258)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430859 (= res!964607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47077 a!2831) j!81) mask!2608) (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!629884))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1430859 (= lt!629884 (Intermediate!11258 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430860 () Bool)

(declare-fun res!964606 () Bool)

(assert (=> b!1430860 (=> (not res!964606) (not e!808055))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1430860 (= res!964606 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47628 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47628 a!2831))))))

(declare-fun b!1430861 () Bool)

(declare-fun res!964603 () Bool)

(assert (=> b!1430861 (=> (not res!964603) (not e!808055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430861 (= res!964603 (validKeyInArray!0 (select (arr!47077 a!2831) j!81)))))

(declare-fun b!1430862 () Bool)

(declare-fun res!964611 () Bool)

(assert (=> b!1430862 (=> (not res!964611) (not e!808055))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430862 (= res!964611 (validKeyInArray!0 (select (arr!47077 a!2831) i!982)))))

(declare-fun res!964608 () Bool)

(assert (=> start!123506 (=> (not res!964608) (not e!808055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123506 (= res!964608 (validMask!0 mask!2608))))

(assert (=> start!123506 e!808055))

(assert (=> start!123506 true))

(declare-fun array_inv!36358 (array!97538) Bool)

(assert (=> start!123506 (array_inv!36358 a!2831)))

(declare-fun b!1430863 () Bool)

(declare-fun res!964610 () Bool)

(declare-fun e!808058 () Bool)

(assert (=> b!1430863 (=> (not res!964610) (not e!808058))))

(declare-fun lt!629885 () array!97538)

(declare-fun lt!629886 () SeekEntryResult!11258)

(declare-fun lt!629887 () (_ BitVec 64))

(assert (=> b!1430863 (= res!964610 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629887 lt!629885 mask!2608) lt!629886))))

(declare-fun b!1430864 () Bool)

(assert (=> b!1430864 (= e!808058 (not true))))

(declare-fun e!808054 () Bool)

(assert (=> b!1430864 e!808054))

(declare-fun res!964605 () Bool)

(assert (=> b!1430864 (=> (not res!964605) (not e!808054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97538 (_ BitVec 32)) Bool)

(assert (=> b!1430864 (= res!964605 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48293 0))(
  ( (Unit!48294) )
))
(declare-fun lt!629888 () Unit!48293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48293)

(assert (=> b!1430864 (= lt!629888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430865 () Bool)

(declare-fun res!964614 () Bool)

(assert (=> b!1430865 (=> (not res!964614) (not e!808055))))

(assert (=> b!1430865 (= res!964614 (and (= (size!47628 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47628 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47628 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430866 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97538 (_ BitVec 32)) SeekEntryResult!11258)

(assert (=> b!1430866 (= e!808054 (= (seekEntryOrOpen!0 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) (Found!11258 j!81)))))

(declare-fun b!1430867 () Bool)

(declare-fun res!964615 () Bool)

(assert (=> b!1430867 (=> (not res!964615) (not e!808055))))

(assert (=> b!1430867 (= res!964615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430868 () Bool)

(declare-fun res!964613 () Bool)

(assert (=> b!1430868 (=> (not res!964613) (not e!808058))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430868 (= res!964613 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430869 () Bool)

(assert (=> b!1430869 (= e!808057 e!808058)))

(declare-fun res!964604 () Bool)

(assert (=> b!1430869 (=> (not res!964604) (not e!808058))))

(assert (=> b!1430869 (= res!964604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629887 mask!2608) lt!629887 lt!629885 mask!2608) lt!629886))))

(assert (=> b!1430869 (= lt!629886 (Intermediate!11258 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430869 (= lt!629887 (select (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430869 (= lt!629885 (array!97539 (store (arr!47077 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47628 a!2831)))))

(declare-fun b!1430870 () Bool)

(declare-fun res!964612 () Bool)

(assert (=> b!1430870 (=> (not res!964612) (not e!808055))))

(declare-datatypes ((List!33574 0))(
  ( (Nil!33571) (Cons!33570 (h!34895 (_ BitVec 64)) (t!48260 List!33574)) )
))
(declare-fun arrayNoDuplicates!0 (array!97538 (_ BitVec 32) List!33574) Bool)

(assert (=> b!1430870 (= res!964612 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33571))))

(declare-fun b!1430871 () Bool)

(declare-fun res!964609 () Bool)

(assert (=> b!1430871 (=> (not res!964609) (not e!808058))))

(assert (=> b!1430871 (= res!964609 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47077 a!2831) j!81) a!2831 mask!2608) lt!629884))))

(assert (= (and start!123506 res!964608) b!1430865))

(assert (= (and b!1430865 res!964614) b!1430862))

(assert (= (and b!1430862 res!964611) b!1430861))

(assert (= (and b!1430861 res!964603) b!1430867))

(assert (= (and b!1430867 res!964615) b!1430870))

(assert (= (and b!1430870 res!964612) b!1430860))

(assert (= (and b!1430860 res!964606) b!1430859))

(assert (= (and b!1430859 res!964607) b!1430869))

(assert (= (and b!1430869 res!964604) b!1430871))

(assert (= (and b!1430871 res!964609) b!1430863))

(assert (= (and b!1430863 res!964610) b!1430868))

(assert (= (and b!1430868 res!964613) b!1430864))

(assert (= (and b!1430864 res!964605) b!1430866))

(declare-fun m!1321077 () Bool)

(assert (=> b!1430861 m!1321077))

(assert (=> b!1430861 m!1321077))

(declare-fun m!1321079 () Bool)

(assert (=> b!1430861 m!1321079))

(declare-fun m!1321081 () Bool)

(assert (=> b!1430864 m!1321081))

(declare-fun m!1321083 () Bool)

(assert (=> b!1430864 m!1321083))

(declare-fun m!1321085 () Bool)

(assert (=> start!123506 m!1321085))

(declare-fun m!1321087 () Bool)

(assert (=> start!123506 m!1321087))

(declare-fun m!1321089 () Bool)

(assert (=> b!1430867 m!1321089))

(declare-fun m!1321091 () Bool)

(assert (=> b!1430863 m!1321091))

(assert (=> b!1430871 m!1321077))

(assert (=> b!1430871 m!1321077))

(declare-fun m!1321093 () Bool)

(assert (=> b!1430871 m!1321093))

(declare-fun m!1321095 () Bool)

(assert (=> b!1430862 m!1321095))

(assert (=> b!1430862 m!1321095))

(declare-fun m!1321097 () Bool)

(assert (=> b!1430862 m!1321097))

(assert (=> b!1430866 m!1321077))

(assert (=> b!1430866 m!1321077))

(declare-fun m!1321099 () Bool)

(assert (=> b!1430866 m!1321099))

(assert (=> b!1430859 m!1321077))

(assert (=> b!1430859 m!1321077))

(declare-fun m!1321101 () Bool)

(assert (=> b!1430859 m!1321101))

(assert (=> b!1430859 m!1321101))

(assert (=> b!1430859 m!1321077))

(declare-fun m!1321103 () Bool)

(assert (=> b!1430859 m!1321103))

(declare-fun m!1321105 () Bool)

(assert (=> b!1430869 m!1321105))

(assert (=> b!1430869 m!1321105))

(declare-fun m!1321107 () Bool)

(assert (=> b!1430869 m!1321107))

(declare-fun m!1321109 () Bool)

(assert (=> b!1430869 m!1321109))

(declare-fun m!1321111 () Bool)

(assert (=> b!1430869 m!1321111))

(declare-fun m!1321113 () Bool)

(assert (=> b!1430870 m!1321113))

(check-sat (not b!1430869) (not b!1430866) (not b!1430870) (not b!1430864) (not b!1430859) (not b!1430862) (not start!123506) (not b!1430861) (not b!1430863) (not b!1430867) (not b!1430871))
(check-sat)
