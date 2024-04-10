; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117922 () Bool)

(assert start!117922)

(declare-fun b!1381616 () Bool)

(declare-fun res!923243 () Bool)

(declare-fun e!783179 () Bool)

(assert (=> b!1381616 (=> (not res!923243) (not e!783179))))

(declare-datatypes ((array!94313 0))(
  ( (array!94314 (arr!45539 (Array (_ BitVec 32) (_ BitVec 64))) (size!46089 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94313)

(declare-datatypes ((List!32073 0))(
  ( (Nil!32070) (Cons!32069 (h!33278 (_ BitVec 64)) (t!46767 List!32073)) )
))
(declare-fun arrayNoDuplicates!0 (array!94313 (_ BitVec 32) List!32073) Bool)

(assert (=> b!1381616 (= res!923243 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32070))))

(declare-fun res!923242 () Bool)

(assert (=> start!117922 (=> (not res!923242) (not e!783179))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117922 (= res!923242 (validMask!0 mask!3034))))

(assert (=> start!117922 e!783179))

(assert (=> start!117922 true))

(declare-fun array_inv!34567 (array!94313) Bool)

(assert (=> start!117922 (array_inv!34567 a!2971)))

(declare-fun b!1381615 () Bool)

(declare-fun res!923245 () Bool)

(assert (=> b!1381615 (=> (not res!923245) (not e!783179))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381615 (= res!923245 (validKeyInArray!0 (select (arr!45539 a!2971) i!1094)))))

(declare-fun b!1381614 () Bool)

(declare-fun res!923244 () Bool)

(assert (=> b!1381614 (=> (not res!923244) (not e!783179))))

(assert (=> b!1381614 (= res!923244 (and (= (size!46089 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46089 a!2971))))))

(declare-fun b!1381617 () Bool)

(assert (=> b!1381617 (= e!783179 false)))

(declare-fun lt!608244 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94313 (_ BitVec 32)) Bool)

(assert (=> b!1381617 (= lt!608244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117922 res!923242) b!1381614))

(assert (= (and b!1381614 res!923244) b!1381615))

(assert (= (and b!1381615 res!923245) b!1381616))

(assert (= (and b!1381616 res!923243) b!1381617))

(declare-fun m!1266795 () Bool)

(assert (=> b!1381616 m!1266795))

(declare-fun m!1266797 () Bool)

(assert (=> start!117922 m!1266797))

(declare-fun m!1266799 () Bool)

(assert (=> start!117922 m!1266799))

(declare-fun m!1266801 () Bool)

(assert (=> b!1381615 m!1266801))

(assert (=> b!1381615 m!1266801))

(declare-fun m!1266803 () Bool)

(assert (=> b!1381615 m!1266803))

(declare-fun m!1266805 () Bool)

(assert (=> b!1381617 m!1266805))

(push 1)

(assert (not b!1381617))

(assert (not b!1381615))

(assert (not start!117922))

(assert (not b!1381616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

