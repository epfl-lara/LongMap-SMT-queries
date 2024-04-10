; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117974 () Bool)

(assert start!117974)

(declare-fun b!1381960 () Bool)

(declare-fun res!923590 () Bool)

(declare-fun e!783335 () Bool)

(assert (=> b!1381960 (=> (not res!923590) (not e!783335))))

(declare-datatypes ((array!94365 0))(
  ( (array!94366 (arr!45565 (Array (_ BitVec 32) (_ BitVec 64))) (size!46115 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94365)

(declare-datatypes ((List!32099 0))(
  ( (Nil!32096) (Cons!32095 (h!33304 (_ BitVec 64)) (t!46793 List!32099)) )
))
(declare-fun arrayNoDuplicates!0 (array!94365 (_ BitVec 32) List!32099) Bool)

(assert (=> b!1381960 (= res!923590 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32096))))

(declare-fun b!1381961 () Bool)

(declare-fun res!923592 () Bool)

(assert (=> b!1381961 (=> (not res!923592) (not e!783335))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94365 (_ BitVec 32)) Bool)

(assert (=> b!1381961 (= res!923592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923588 () Bool)

(assert (=> start!117974 (=> (not res!923588) (not e!783335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117974 (= res!923588 (validMask!0 mask!3034))))

(assert (=> start!117974 e!783335))

(assert (=> start!117974 true))

(declare-fun array_inv!34593 (array!94365) Bool)

(assert (=> start!117974 (array_inv!34593 a!2971)))

(declare-fun b!1381962 () Bool)

(declare-fun res!923593 () Bool)

(assert (=> b!1381962 (=> (not res!923593) (not e!783335))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381962 (= res!923593 (and (= (size!46115 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46115 a!2971))))))

(declare-fun b!1381963 () Bool)

(declare-fun res!923591 () Bool)

(assert (=> b!1381963 (=> (not res!923591) (not e!783335))))

(assert (=> b!1381963 (= res!923591 (and (not (= (select (arr!45565 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45565 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46115 a!2971))))))

(declare-fun b!1381964 () Bool)

(declare-fun res!923589 () Bool)

(assert (=> b!1381964 (=> (not res!923589) (not e!783335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381964 (= res!923589 (validKeyInArray!0 (select (arr!45565 a!2971) i!1094)))))

(declare-fun b!1381965 () Bool)

(assert (=> b!1381965 (= e!783335 (not true))))

(assert (=> b!1381965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94366 (store (arr!45565 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46115 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46033 0))(
  ( (Unit!46034) )
))
(declare-fun lt!608322 () Unit!46033)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46033)

(assert (=> b!1381965 (= lt!608322 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(assert (= (and start!117974 res!923588) b!1381962))

(assert (= (and b!1381962 res!923593) b!1381964))

(assert (= (and b!1381964 res!923589) b!1381960))

(assert (= (and b!1381960 res!923590) b!1381961))

(assert (= (and b!1381961 res!923592) b!1381963))

(assert (= (and b!1381963 res!923591) b!1381965))

(declare-fun m!1267137 () Bool)

(assert (=> b!1381965 m!1267137))

(declare-fun m!1267139 () Bool)

(assert (=> b!1381965 m!1267139))

(declare-fun m!1267141 () Bool)

(assert (=> b!1381965 m!1267141))

(declare-fun m!1267143 () Bool)

(assert (=> b!1381964 m!1267143))

(assert (=> b!1381964 m!1267143))

(declare-fun m!1267145 () Bool)

(assert (=> b!1381964 m!1267145))

(declare-fun m!1267147 () Bool)

(assert (=> b!1381960 m!1267147))

(declare-fun m!1267149 () Bool)

(assert (=> b!1381961 m!1267149))

(declare-fun m!1267151 () Bool)

(assert (=> start!117974 m!1267151))

(declare-fun m!1267153 () Bool)

(assert (=> start!117974 m!1267153))

(assert (=> b!1381963 m!1267143))

(push 1)

(assert (not start!117974))

(assert (not b!1381960))

(assert (not b!1381964))

(assert (not b!1381965))

(assert (not b!1381961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

