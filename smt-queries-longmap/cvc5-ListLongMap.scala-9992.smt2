; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117960 () Bool)

(assert start!117960)

(declare-fun b!1381787 () Bool)

(declare-fun res!923457 () Bool)

(declare-fun e!783268 () Bool)

(assert (=> b!1381787 (=> (not res!923457) (not e!783268))))

(declare-datatypes ((array!94303 0))(
  ( (array!94304 (arr!45534 (Array (_ BitVec 32) (_ BitVec 64))) (size!46086 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94303)

(declare-datatypes ((List!32146 0))(
  ( (Nil!32143) (Cons!32142 (h!33351 (_ BitVec 64)) (t!46832 List!32146)) )
))
(declare-fun arrayNoDuplicates!0 (array!94303 (_ BitVec 32) List!32146) Bool)

(assert (=> b!1381787 (= res!923457 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32143))))

(declare-fun res!923459 () Bool)

(assert (=> start!117960 (=> (not res!923459) (not e!783268))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117960 (= res!923459 (validMask!0 mask!3034))))

(assert (=> start!117960 e!783268))

(assert (=> start!117960 true))

(declare-fun array_inv!34767 (array!94303) Bool)

(assert (=> start!117960 (array_inv!34767 a!2971)))

(declare-fun b!1381785 () Bool)

(declare-fun res!923456 () Bool)

(assert (=> b!1381785 (=> (not res!923456) (not e!783268))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381785 (= res!923456 (and (= (size!46086 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46086 a!2971))))))

(declare-fun b!1381788 () Bool)

(assert (=> b!1381788 (= e!783268 false)))

(declare-fun lt!608120 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94303 (_ BitVec 32)) Bool)

(assert (=> b!1381788 (= lt!608120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381786 () Bool)

(declare-fun res!923458 () Bool)

(assert (=> b!1381786 (=> (not res!923458) (not e!783268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381786 (= res!923458 (validKeyInArray!0 (select (arr!45534 a!2971) i!1094)))))

(assert (= (and start!117960 res!923459) b!1381785))

(assert (= (and b!1381785 res!923456) b!1381786))

(assert (= (and b!1381786 res!923458) b!1381787))

(assert (= (and b!1381787 res!923457) b!1381788))

(declare-fun m!1266531 () Bool)

(assert (=> b!1381787 m!1266531))

(declare-fun m!1266533 () Bool)

(assert (=> start!117960 m!1266533))

(declare-fun m!1266535 () Bool)

(assert (=> start!117960 m!1266535))

(declare-fun m!1266537 () Bool)

(assert (=> b!1381788 m!1266537))

(declare-fun m!1266539 () Bool)

(assert (=> b!1381786 m!1266539))

(assert (=> b!1381786 m!1266539))

(declare-fun m!1266541 () Bool)

(assert (=> b!1381786 m!1266541))

(push 1)

(assert (not b!1381788))

(assert (not b!1381786))

(assert (not start!117960))

(assert (not b!1381787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

