; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117950 () Bool)

(assert start!117950)

(declare-fun b!1381782 () Bool)

(declare-fun res!923411 () Bool)

(declare-fun e!783263 () Bool)

(assert (=> b!1381782 (=> (not res!923411) (not e!783263))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94341 0))(
  ( (array!94342 (arr!45553 (Array (_ BitVec 32) (_ BitVec 64))) (size!46103 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94341)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381782 (= res!923411 (and (= (size!46103 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46103 a!2971))))))

(declare-fun b!1381784 () Bool)

(declare-fun res!923412 () Bool)

(assert (=> b!1381784 (=> (not res!923412) (not e!783263))))

(declare-datatypes ((List!32087 0))(
  ( (Nil!32084) (Cons!32083 (h!33292 (_ BitVec 64)) (t!46781 List!32087)) )
))
(declare-fun arrayNoDuplicates!0 (array!94341 (_ BitVec 32) List!32087) Bool)

(assert (=> b!1381784 (= res!923412 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32084))))

(declare-fun b!1381783 () Bool)

(declare-fun res!923413 () Bool)

(assert (=> b!1381783 (=> (not res!923413) (not e!783263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381783 (= res!923413 (validKeyInArray!0 (select (arr!45553 a!2971) i!1094)))))

(declare-fun b!1381785 () Bool)

(assert (=> b!1381785 (= e!783263 false)))

(declare-fun lt!608286 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94341 (_ BitVec 32)) Bool)

(assert (=> b!1381785 (= lt!608286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923410 () Bool)

(assert (=> start!117950 (=> (not res!923410) (not e!783263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117950 (= res!923410 (validMask!0 mask!3034))))

(assert (=> start!117950 e!783263))

(assert (=> start!117950 true))

(declare-fun array_inv!34581 (array!94341) Bool)

(assert (=> start!117950 (array_inv!34581 a!2971)))

(assert (= (and start!117950 res!923410) b!1381782))

(assert (= (and b!1381782 res!923411) b!1381783))

(assert (= (and b!1381783 res!923413) b!1381784))

(assert (= (and b!1381784 res!923412) b!1381785))

(declare-fun m!1266963 () Bool)

(assert (=> b!1381784 m!1266963))

(declare-fun m!1266965 () Bool)

(assert (=> b!1381783 m!1266965))

(assert (=> b!1381783 m!1266965))

(declare-fun m!1266967 () Bool)

(assert (=> b!1381783 m!1266967))

(declare-fun m!1266969 () Bool)

(assert (=> b!1381785 m!1266969))

(declare-fun m!1266971 () Bool)

(assert (=> start!117950 m!1266971))

(declare-fun m!1266973 () Bool)

(assert (=> start!117950 m!1266973))

(push 1)

(assert (not b!1381785))

(assert (not start!117950))

(assert (not b!1381784))

(assert (not b!1381783))

(check-sat)

