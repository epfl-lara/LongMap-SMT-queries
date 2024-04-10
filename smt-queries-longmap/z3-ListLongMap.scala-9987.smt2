; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117930 () Bool)

(assert start!117930)

(declare-fun b!1381662 () Bool)

(declare-fun res!923293 () Bool)

(declare-fun e!783202 () Bool)

(assert (=> b!1381662 (=> (not res!923293) (not e!783202))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94321 0))(
  ( (array!94322 (arr!45543 (Array (_ BitVec 32) (_ BitVec 64))) (size!46093 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94321)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381662 (= res!923293 (and (= (size!46093 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46093 a!2971))))))

(declare-fun res!923291 () Bool)

(assert (=> start!117930 (=> (not res!923291) (not e!783202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117930 (= res!923291 (validMask!0 mask!3034))))

(assert (=> start!117930 e!783202))

(assert (=> start!117930 true))

(declare-fun array_inv!34571 (array!94321) Bool)

(assert (=> start!117930 (array_inv!34571 a!2971)))

(declare-fun b!1381665 () Bool)

(assert (=> b!1381665 (= e!783202 false)))

(declare-fun lt!608256 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94321 (_ BitVec 32)) Bool)

(assert (=> b!1381665 (= lt!608256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381663 () Bool)

(declare-fun res!923292 () Bool)

(assert (=> b!1381663 (=> (not res!923292) (not e!783202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381663 (= res!923292 (validKeyInArray!0 (select (arr!45543 a!2971) i!1094)))))

(declare-fun b!1381664 () Bool)

(declare-fun res!923290 () Bool)

(assert (=> b!1381664 (=> (not res!923290) (not e!783202))))

(declare-datatypes ((List!32077 0))(
  ( (Nil!32074) (Cons!32073 (h!33282 (_ BitVec 64)) (t!46771 List!32077)) )
))
(declare-fun arrayNoDuplicates!0 (array!94321 (_ BitVec 32) List!32077) Bool)

(assert (=> b!1381664 (= res!923290 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32074))))

(assert (= (and start!117930 res!923291) b!1381662))

(assert (= (and b!1381662 res!923293) b!1381663))

(assert (= (and b!1381663 res!923292) b!1381664))

(assert (= (and b!1381664 res!923290) b!1381665))

(declare-fun m!1266843 () Bool)

(assert (=> start!117930 m!1266843))

(declare-fun m!1266845 () Bool)

(assert (=> start!117930 m!1266845))

(declare-fun m!1266847 () Bool)

(assert (=> b!1381665 m!1266847))

(declare-fun m!1266849 () Bool)

(assert (=> b!1381663 m!1266849))

(assert (=> b!1381663 m!1266849))

(declare-fun m!1266851 () Bool)

(assert (=> b!1381663 m!1266851))

(declare-fun m!1266853 () Bool)

(assert (=> b!1381664 m!1266853))

(check-sat (not start!117930) (not b!1381664) (not b!1381665) (not b!1381663))
(check-sat)
