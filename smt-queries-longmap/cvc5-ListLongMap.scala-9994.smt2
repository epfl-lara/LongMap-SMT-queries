; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118188 () Bool)

(assert start!118188)

(declare-fun res!924111 () Bool)

(declare-fun e!784183 () Bool)

(assert (=> start!118188 (=> (not res!924111) (not e!784183))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118188 (= res!924111 (validMask!0 mask!3034))))

(assert (=> start!118188 e!784183))

(assert (=> start!118188 true))

(declare-datatypes ((array!94475 0))(
  ( (array!94476 (arr!45618 (Array (_ BitVec 32) (_ BitVec 64))) (size!46169 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94475)

(declare-fun array_inv!34899 (array!94475) Bool)

(assert (=> start!118188 (array_inv!34899 a!2971)))

(declare-fun b!1383268 () Bool)

(declare-fun res!924109 () Bool)

(assert (=> b!1383268 (=> (not res!924109) (not e!784183))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383268 (= res!924109 (and (not (= (select (arr!45618 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45618 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46169 a!2971))))))

(declare-fun b!1383269 () Bool)

(assert (=> b!1383269 (= e!784183 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94475 (_ BitVec 32)) Bool)

(assert (=> b!1383269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94476 (store (arr!45618 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46169 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45972 0))(
  ( (Unit!45973) )
))
(declare-fun lt!608802 () Unit!45972)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45972)

(assert (=> b!1383269 (= lt!608802 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1383270 () Bool)

(declare-fun res!924108 () Bool)

(assert (=> b!1383270 (=> (not res!924108) (not e!784183))))

(assert (=> b!1383270 (= res!924108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383271 () Bool)

(declare-fun res!924107 () Bool)

(assert (=> b!1383271 (=> (not res!924107) (not e!784183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383271 (= res!924107 (validKeyInArray!0 (select (arr!45618 a!2971) i!1094)))))

(declare-fun b!1383272 () Bool)

(declare-fun res!924112 () Bool)

(assert (=> b!1383272 (=> (not res!924112) (not e!784183))))

(declare-datatypes ((List!32139 0))(
  ( (Nil!32136) (Cons!32135 (h!33353 (_ BitVec 64)) (t!46825 List!32139)) )
))
(declare-fun arrayNoDuplicates!0 (array!94475 (_ BitVec 32) List!32139) Bool)

(assert (=> b!1383272 (= res!924112 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32136))))

(declare-fun b!1383273 () Bool)

(declare-fun res!924110 () Bool)

(assert (=> b!1383273 (=> (not res!924110) (not e!784183))))

(assert (=> b!1383273 (= res!924110 (and (= (size!46169 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46169 a!2971))))))

(assert (= (and start!118188 res!924111) b!1383273))

(assert (= (and b!1383273 res!924110) b!1383271))

(assert (= (and b!1383271 res!924107) b!1383272))

(assert (= (and b!1383272 res!924112) b!1383270))

(assert (= (and b!1383270 res!924108) b!1383268))

(assert (= (and b!1383268 res!924109) b!1383269))

(declare-fun m!1268769 () Bool)

(assert (=> b!1383271 m!1268769))

(assert (=> b!1383271 m!1268769))

(declare-fun m!1268771 () Bool)

(assert (=> b!1383271 m!1268771))

(declare-fun m!1268773 () Bool)

(assert (=> start!118188 m!1268773))

(declare-fun m!1268775 () Bool)

(assert (=> start!118188 m!1268775))

(assert (=> b!1383268 m!1268769))

(declare-fun m!1268777 () Bool)

(assert (=> b!1383270 m!1268777))

(declare-fun m!1268779 () Bool)

(assert (=> b!1383269 m!1268779))

(declare-fun m!1268781 () Bool)

(assert (=> b!1383269 m!1268781))

(declare-fun m!1268783 () Bool)

(assert (=> b!1383269 m!1268783))

(declare-fun m!1268785 () Bool)

(assert (=> b!1383272 m!1268785))

(push 1)

(assert (not start!118188))

(assert (not b!1383271))

(assert (not b!1383272))

(assert (not b!1383270))

(assert (not b!1383269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

