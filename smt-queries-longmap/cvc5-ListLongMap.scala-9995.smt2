; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117976 () Bool)

(assert start!117976)

(declare-fun b!1381978 () Bool)

(declare-fun e!783340 () Bool)

(assert (=> b!1381978 (= e!783340 (not true))))

(declare-datatypes ((array!94367 0))(
  ( (array!94368 (arr!45566 (Array (_ BitVec 32) (_ BitVec 64))) (size!46116 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94367)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94367 (_ BitVec 32)) Bool)

(assert (=> b!1381978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94368 (store (arr!45566 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46116 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46035 0))(
  ( (Unit!46036) )
))
(declare-fun lt!608325 () Unit!46035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46035)

(assert (=> b!1381978 (= lt!608325 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381979 () Bool)

(declare-fun res!923607 () Bool)

(assert (=> b!1381979 (=> (not res!923607) (not e!783340))))

(assert (=> b!1381979 (= res!923607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381980 () Bool)

(declare-fun res!923609 () Bool)

(assert (=> b!1381980 (=> (not res!923609) (not e!783340))))

(assert (=> b!1381980 (= res!923609 (and (= (size!46116 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46116 a!2971))))))

(declare-fun b!1381981 () Bool)

(declare-fun res!923611 () Bool)

(assert (=> b!1381981 (=> (not res!923611) (not e!783340))))

(assert (=> b!1381981 (= res!923611 (and (not (= (select (arr!45566 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45566 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46116 a!2971))))))

(declare-fun b!1381982 () Bool)

(declare-fun res!923610 () Bool)

(assert (=> b!1381982 (=> (not res!923610) (not e!783340))))

(declare-datatypes ((List!32100 0))(
  ( (Nil!32097) (Cons!32096 (h!33305 (_ BitVec 64)) (t!46794 List!32100)) )
))
(declare-fun arrayNoDuplicates!0 (array!94367 (_ BitVec 32) List!32100) Bool)

(assert (=> b!1381982 (= res!923610 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32097))))

(declare-fun res!923608 () Bool)

(assert (=> start!117976 (=> (not res!923608) (not e!783340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117976 (= res!923608 (validMask!0 mask!3034))))

(assert (=> start!117976 e!783340))

(assert (=> start!117976 true))

(declare-fun array_inv!34594 (array!94367) Bool)

(assert (=> start!117976 (array_inv!34594 a!2971)))

(declare-fun b!1381983 () Bool)

(declare-fun res!923606 () Bool)

(assert (=> b!1381983 (=> (not res!923606) (not e!783340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381983 (= res!923606 (validKeyInArray!0 (select (arr!45566 a!2971) i!1094)))))

(assert (= (and start!117976 res!923608) b!1381980))

(assert (= (and b!1381980 res!923609) b!1381983))

(assert (= (and b!1381983 res!923606) b!1381982))

(assert (= (and b!1381982 res!923610) b!1381979))

(assert (= (and b!1381979 res!923607) b!1381981))

(assert (= (and b!1381981 res!923611) b!1381978))

(declare-fun m!1267155 () Bool)

(assert (=> b!1381981 m!1267155))

(declare-fun m!1267157 () Bool)

(assert (=> start!117976 m!1267157))

(declare-fun m!1267159 () Bool)

(assert (=> start!117976 m!1267159))

(declare-fun m!1267161 () Bool)

(assert (=> b!1381978 m!1267161))

(declare-fun m!1267163 () Bool)

(assert (=> b!1381978 m!1267163))

(declare-fun m!1267165 () Bool)

(assert (=> b!1381978 m!1267165))

(declare-fun m!1267167 () Bool)

(assert (=> b!1381979 m!1267167))

(assert (=> b!1381983 m!1267155))

(assert (=> b!1381983 m!1267155))

(declare-fun m!1267169 () Bool)

(assert (=> b!1381983 m!1267169))

(declare-fun m!1267171 () Bool)

(assert (=> b!1381982 m!1267171))

(push 1)

(assert (not b!1381979))

(assert (not b!1381978))

(assert (not b!1381983))

(assert (not b!1381982))

(assert (not start!117976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

