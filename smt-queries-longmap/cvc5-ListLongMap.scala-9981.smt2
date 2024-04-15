; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117894 () Bool)

(assert start!117894)

(declare-fun res!923072 () Bool)

(declare-fun e!783070 () Bool)

(assert (=> start!117894 (=> (not res!923072) (not e!783070))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117894 (= res!923072 (validMask!0 mask!3034))))

(assert (=> start!117894 e!783070))

(assert (=> start!117894 true))

(declare-datatypes ((array!94237 0))(
  ( (array!94238 (arr!45501 (Array (_ BitVec 32) (_ BitVec 64))) (size!46053 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94237)

(declare-fun array_inv!34734 (array!94237) Bool)

(assert (=> start!117894 (array_inv!34734 a!2971)))

(declare-fun b!1381399 () Bool)

(declare-fun res!923070 () Bool)

(assert (=> b!1381399 (=> (not res!923070) (not e!783070))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381399 (= res!923070 (and (= (size!46053 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46053 a!2971))))))

(declare-fun b!1381400 () Bool)

(declare-fun res!923071 () Bool)

(assert (=> b!1381400 (=> (not res!923071) (not e!783070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381400 (= res!923071 (validKeyInArray!0 (select (arr!45501 a!2971) i!1094)))))

(declare-fun b!1381401 () Bool)

(assert (=> b!1381401 (= e!783070 false)))

(declare-fun lt!608030 () Bool)

(declare-datatypes ((List!32113 0))(
  ( (Nil!32110) (Cons!32109 (h!33318 (_ BitVec 64)) (t!46799 List!32113)) )
))
(declare-fun arrayNoDuplicates!0 (array!94237 (_ BitVec 32) List!32113) Bool)

(assert (=> b!1381401 (= lt!608030 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32110))))

(assert (= (and start!117894 res!923072) b!1381399))

(assert (= (and b!1381399 res!923070) b!1381400))

(assert (= (and b!1381400 res!923071) b!1381401))

(declare-fun m!1266149 () Bool)

(assert (=> start!117894 m!1266149))

(declare-fun m!1266151 () Bool)

(assert (=> start!117894 m!1266151))

(declare-fun m!1266153 () Bool)

(assert (=> b!1381400 m!1266153))

(assert (=> b!1381400 m!1266153))

(declare-fun m!1266155 () Bool)

(assert (=> b!1381400 m!1266155))

(declare-fun m!1266157 () Bool)

(assert (=> b!1381401 m!1266157))

(push 1)

(assert (not b!1381401))

(assert (not start!117894))

(assert (not b!1381400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

