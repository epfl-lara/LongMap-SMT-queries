; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117946 () Bool)

(assert start!117946)

(declare-fun b!1381761 () Bool)

(declare-fun e!783251 () Bool)

(assert (=> b!1381761 (= e!783251 false)))

(declare-fun lt!608280 () Bool)

(declare-datatypes ((array!94337 0))(
  ( (array!94338 (arr!45551 (Array (_ BitVec 32) (_ BitVec 64))) (size!46101 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94337)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94337 (_ BitVec 32)) Bool)

(assert (=> b!1381761 (= lt!608280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381758 () Bool)

(declare-fun res!923386 () Bool)

(assert (=> b!1381758 (=> (not res!923386) (not e!783251))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381758 (= res!923386 (and (= (size!46101 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46101 a!2971))))))

(declare-fun b!1381760 () Bool)

(declare-fun res!923389 () Bool)

(assert (=> b!1381760 (=> (not res!923389) (not e!783251))))

(declare-datatypes ((List!32085 0))(
  ( (Nil!32082) (Cons!32081 (h!33290 (_ BitVec 64)) (t!46779 List!32085)) )
))
(declare-fun arrayNoDuplicates!0 (array!94337 (_ BitVec 32) List!32085) Bool)

(assert (=> b!1381760 (= res!923389 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32082))))

(declare-fun res!923388 () Bool)

(assert (=> start!117946 (=> (not res!923388) (not e!783251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117946 (= res!923388 (validMask!0 mask!3034))))

(assert (=> start!117946 e!783251))

(assert (=> start!117946 true))

(declare-fun array_inv!34579 (array!94337) Bool)

(assert (=> start!117946 (array_inv!34579 a!2971)))

(declare-fun b!1381759 () Bool)

(declare-fun res!923387 () Bool)

(assert (=> b!1381759 (=> (not res!923387) (not e!783251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381759 (= res!923387 (validKeyInArray!0 (select (arr!45551 a!2971) i!1094)))))

(assert (= (and start!117946 res!923388) b!1381758))

(assert (= (and b!1381758 res!923386) b!1381759))

(assert (= (and b!1381759 res!923387) b!1381760))

(assert (= (and b!1381760 res!923389) b!1381761))

(declare-fun m!1266939 () Bool)

(assert (=> b!1381761 m!1266939))

(declare-fun m!1266941 () Bool)

(assert (=> b!1381760 m!1266941))

(declare-fun m!1266943 () Bool)

(assert (=> start!117946 m!1266943))

(declare-fun m!1266945 () Bool)

(assert (=> start!117946 m!1266945))

(declare-fun m!1266947 () Bool)

(assert (=> b!1381759 m!1266947))

(assert (=> b!1381759 m!1266947))

(declare-fun m!1266949 () Bool)

(assert (=> b!1381759 m!1266949))

(push 1)

(assert (not b!1381761))

(assert (not b!1381759))

(assert (not start!117946))

(assert (not b!1381760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

