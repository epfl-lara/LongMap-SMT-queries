; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117964 () Bool)

(assert start!117964)

(declare-fun res!923498 () Bool)

(declare-fun e!783305 () Bool)

(assert (=> start!117964 (=> (not res!923498) (not e!783305))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117964 (= res!923498 (validMask!0 mask!3034))))

(assert (=> start!117964 e!783305))

(assert (=> start!117964 true))

(declare-datatypes ((array!94355 0))(
  ( (array!94356 (arr!45560 (Array (_ BitVec 32) (_ BitVec 64))) (size!46110 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94355)

(declare-fun array_inv!34588 (array!94355) Bool)

(assert (=> start!117964 (array_inv!34588 a!2971)))

(declare-fun b!1381870 () Bool)

(declare-fun res!923499 () Bool)

(assert (=> b!1381870 (=> (not res!923499) (not e!783305))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381870 (= res!923499 (and (not (= (select (arr!45560 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45560 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46110 a!2971))))))

(declare-fun b!1381871 () Bool)

(assert (=> b!1381871 (= e!783305 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94355 (_ BitVec 32)) Bool)

(assert (=> b!1381871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94356 (store (arr!45560 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46110 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46023 0))(
  ( (Unit!46024) )
))
(declare-fun lt!608307 () Unit!46023)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46023)

(assert (=> b!1381871 (= lt!608307 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1381872 () Bool)

(declare-fun res!923502 () Bool)

(assert (=> b!1381872 (=> (not res!923502) (not e!783305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381872 (= res!923502 (validKeyInArray!0 (select (arr!45560 a!2971) i!1094)))))

(declare-fun b!1381873 () Bool)

(declare-fun res!923500 () Bool)

(assert (=> b!1381873 (=> (not res!923500) (not e!783305))))

(assert (=> b!1381873 (= res!923500 (and (= (size!46110 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46110 a!2971))))))

(declare-fun b!1381874 () Bool)

(declare-fun res!923503 () Bool)

(assert (=> b!1381874 (=> (not res!923503) (not e!783305))))

(assert (=> b!1381874 (= res!923503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381875 () Bool)

(declare-fun res!923501 () Bool)

(assert (=> b!1381875 (=> (not res!923501) (not e!783305))))

(declare-datatypes ((List!32094 0))(
  ( (Nil!32091) (Cons!32090 (h!33299 (_ BitVec 64)) (t!46788 List!32094)) )
))
(declare-fun arrayNoDuplicates!0 (array!94355 (_ BitVec 32) List!32094) Bool)

(assert (=> b!1381875 (= res!923501 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32091))))

(assert (= (and start!117964 res!923498) b!1381873))

(assert (= (and b!1381873 res!923500) b!1381872))

(assert (= (and b!1381872 res!923502) b!1381875))

(assert (= (and b!1381875 res!923501) b!1381874))

(assert (= (and b!1381874 res!923503) b!1381870))

(assert (= (and b!1381870 res!923499) b!1381871))

(declare-fun m!1267047 () Bool)

(assert (=> b!1381870 m!1267047))

(declare-fun m!1267049 () Bool)

(assert (=> b!1381874 m!1267049))

(declare-fun m!1267051 () Bool)

(assert (=> b!1381875 m!1267051))

(declare-fun m!1267053 () Bool)

(assert (=> start!117964 m!1267053))

(declare-fun m!1267055 () Bool)

(assert (=> start!117964 m!1267055))

(declare-fun m!1267057 () Bool)

(assert (=> b!1381871 m!1267057))

(declare-fun m!1267059 () Bool)

(assert (=> b!1381871 m!1267059))

(declare-fun m!1267061 () Bool)

(assert (=> b!1381871 m!1267061))

(assert (=> b!1381872 m!1267047))

(assert (=> b!1381872 m!1267047))

(declare-fun m!1267063 () Bool)

(assert (=> b!1381872 m!1267063))

(push 1)

(assert (not b!1381871))

(assert (not b!1381874))

(assert (not b!1381872))

(assert (not b!1381875))

(assert (not start!117964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

