; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117966 () Bool)

(assert start!117966)

(declare-fun res!923516 () Bool)

(declare-fun e!783310 () Bool)

(assert (=> start!117966 (=> (not res!923516) (not e!783310))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117966 (= res!923516 (validMask!0 mask!3034))))

(assert (=> start!117966 e!783310))

(assert (=> start!117966 true))

(declare-datatypes ((array!94357 0))(
  ( (array!94358 (arr!45561 (Array (_ BitVec 32) (_ BitVec 64))) (size!46111 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94357)

(declare-fun array_inv!34589 (array!94357) Bool)

(assert (=> start!117966 (array_inv!34589 a!2971)))

(declare-fun b!1381888 () Bool)

(declare-fun res!923517 () Bool)

(assert (=> b!1381888 (=> (not res!923517) (not e!783310))))

(declare-datatypes ((List!32095 0))(
  ( (Nil!32092) (Cons!32091 (h!33300 (_ BitVec 64)) (t!46789 List!32095)) )
))
(declare-fun arrayNoDuplicates!0 (array!94357 (_ BitVec 32) List!32095) Bool)

(assert (=> b!1381888 (= res!923517 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32092))))

(declare-fun b!1381889 () Bool)

(declare-fun res!923518 () Bool)

(assert (=> b!1381889 (=> (not res!923518) (not e!783310))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381889 (= res!923518 (validKeyInArray!0 (select (arr!45561 a!2971) i!1094)))))

(declare-fun b!1381890 () Bool)

(declare-fun res!923519 () Bool)

(assert (=> b!1381890 (=> (not res!923519) (not e!783310))))

(assert (=> b!1381890 (= res!923519 (and (= (size!46111 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46111 a!2971))))))

(declare-fun b!1381891 () Bool)

(declare-fun res!923520 () Bool)

(assert (=> b!1381891 (=> (not res!923520) (not e!783310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94357 (_ BitVec 32)) Bool)

(assert (=> b!1381891 (= res!923520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381892 () Bool)

(declare-fun res!923521 () Bool)

(assert (=> b!1381892 (=> (not res!923521) (not e!783310))))

(assert (=> b!1381892 (= res!923521 (and (not (= (select (arr!45561 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45561 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46111 a!2971))))))

(declare-fun b!1381893 () Bool)

(assert (=> b!1381893 (= e!783310 (not true))))

(assert (=> b!1381893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94358 (store (arr!45561 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46111 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46025 0))(
  ( (Unit!46026) )
))
(declare-fun lt!608310 () Unit!46025)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46025)

(assert (=> b!1381893 (= lt!608310 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(assert (= (and start!117966 res!923516) b!1381890))

(assert (= (and b!1381890 res!923519) b!1381889))

(assert (= (and b!1381889 res!923518) b!1381888))

(assert (= (and b!1381888 res!923517) b!1381891))

(assert (= (and b!1381891 res!923520) b!1381892))

(assert (= (and b!1381892 res!923521) b!1381893))

(declare-fun m!1267065 () Bool)

(assert (=> b!1381891 m!1267065))

(declare-fun m!1267067 () Bool)

(assert (=> start!117966 m!1267067))

(declare-fun m!1267069 () Bool)

(assert (=> start!117966 m!1267069))

(declare-fun m!1267071 () Bool)

(assert (=> b!1381888 m!1267071))

(declare-fun m!1267073 () Bool)

(assert (=> b!1381893 m!1267073))

(declare-fun m!1267075 () Bool)

(assert (=> b!1381893 m!1267075))

(declare-fun m!1267077 () Bool)

(assert (=> b!1381893 m!1267077))

(declare-fun m!1267079 () Bool)

(assert (=> b!1381892 m!1267079))

(assert (=> b!1381889 m!1267079))

(assert (=> b!1381889 m!1267079))

(declare-fun m!1267081 () Bool)

(assert (=> b!1381889 m!1267081))

(check-sat (not b!1381889) (not b!1381891) (not b!1381893) (not b!1381888) (not start!117966))
(check-sat)
