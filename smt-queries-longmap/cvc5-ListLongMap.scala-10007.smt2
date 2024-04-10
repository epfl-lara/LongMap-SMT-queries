; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118078 () Bool)

(assert start!118078)

(declare-fun b!1382544 () Bool)

(declare-fun e!783619 () Bool)

(assert (=> b!1382544 (= e!783619 false)))

(declare-fun lt!608442 () Bool)

(declare-datatypes ((array!94442 0))(
  ( (array!94443 (arr!45602 (Array (_ BitVec 32) (_ BitVec 64))) (size!46152 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94442)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94442 (_ BitVec 32)) Bool)

(assert (=> b!1382544 (= lt!608442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382543 () Bool)

(declare-fun res!924136 () Bool)

(assert (=> b!1382543 (=> (not res!924136) (not e!783619))))

(declare-datatypes ((List!32136 0))(
  ( (Nil!32133) (Cons!32132 (h!33341 (_ BitVec 64)) (t!46830 List!32136)) )
))
(declare-fun arrayNoDuplicates!0 (array!94442 (_ BitVec 32) List!32136) Bool)

(assert (=> b!1382543 (= res!924136 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32133))))

(declare-fun res!924133 () Bool)

(assert (=> start!118078 (=> (not res!924133) (not e!783619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118078 (= res!924133 (validMask!0 mask!3034))))

(assert (=> start!118078 e!783619))

(assert (=> start!118078 true))

(declare-fun array_inv!34630 (array!94442) Bool)

(assert (=> start!118078 (array_inv!34630 a!2971)))

(declare-fun b!1382542 () Bool)

(declare-fun res!924134 () Bool)

(assert (=> b!1382542 (=> (not res!924134) (not e!783619))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382542 (= res!924134 (validKeyInArray!0 (select (arr!45602 a!2971) i!1094)))))

(declare-fun b!1382541 () Bool)

(declare-fun res!924135 () Bool)

(assert (=> b!1382541 (=> (not res!924135) (not e!783619))))

(assert (=> b!1382541 (= res!924135 (and (= (size!46152 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46152 a!2971))))))

(assert (= (and start!118078 res!924133) b!1382541))

(assert (= (and b!1382541 res!924135) b!1382542))

(assert (= (and b!1382542 res!924134) b!1382543))

(assert (= (and b!1382543 res!924136) b!1382544))

(declare-fun m!1267671 () Bool)

(assert (=> b!1382544 m!1267671))

(declare-fun m!1267673 () Bool)

(assert (=> b!1382543 m!1267673))

(declare-fun m!1267675 () Bool)

(assert (=> start!118078 m!1267675))

(declare-fun m!1267677 () Bool)

(assert (=> start!118078 m!1267677))

(declare-fun m!1267679 () Bool)

(assert (=> b!1382542 m!1267679))

(assert (=> b!1382542 m!1267679))

(declare-fun m!1267681 () Bool)

(assert (=> b!1382542 m!1267681))

(push 1)

(assert (not b!1382542))

(assert (not b!1382544))

(assert (not start!118078))

(assert (not b!1382543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

