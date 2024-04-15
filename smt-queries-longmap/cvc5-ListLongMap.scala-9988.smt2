; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117936 () Bool)

(assert start!117936)

(declare-fun res!923313 () Bool)

(declare-fun e!783196 () Bool)

(assert (=> start!117936 (=> (not res!923313) (not e!783196))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117936 (= res!923313 (validMask!0 mask!3034))))

(assert (=> start!117936 e!783196))

(assert (=> start!117936 true))

(declare-datatypes ((array!94279 0))(
  ( (array!94280 (arr!45522 (Array (_ BitVec 32) (_ BitVec 64))) (size!46074 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94279)

(declare-fun array_inv!34755 (array!94279) Bool)

(assert (=> start!117936 (array_inv!34755 a!2971)))

(declare-fun b!1381643 () Bool)

(declare-fun res!923312 () Bool)

(assert (=> b!1381643 (=> (not res!923312) (not e!783196))))

(declare-datatypes ((List!32134 0))(
  ( (Nil!32131) (Cons!32130 (h!33339 (_ BitVec 64)) (t!46820 List!32134)) )
))
(declare-fun arrayNoDuplicates!0 (array!94279 (_ BitVec 32) List!32134) Bool)

(assert (=> b!1381643 (= res!923312 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32131))))

(declare-fun b!1381641 () Bool)

(declare-fun res!923314 () Bool)

(assert (=> b!1381641 (=> (not res!923314) (not e!783196))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381641 (= res!923314 (and (= (size!46074 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46074 a!2971))))))

(declare-fun b!1381644 () Bool)

(assert (=> b!1381644 (= e!783196 false)))

(declare-fun lt!608084 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94279 (_ BitVec 32)) Bool)

(assert (=> b!1381644 (= lt!608084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381642 () Bool)

(declare-fun res!923315 () Bool)

(assert (=> b!1381642 (=> (not res!923315) (not e!783196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381642 (= res!923315 (validKeyInArray!0 (select (arr!45522 a!2971) i!1094)))))

(assert (= (and start!117936 res!923313) b!1381641))

(assert (= (and b!1381641 res!923314) b!1381642))

(assert (= (and b!1381642 res!923315) b!1381643))

(assert (= (and b!1381643 res!923312) b!1381644))

(declare-fun m!1266387 () Bool)

(assert (=> start!117936 m!1266387))

(declare-fun m!1266389 () Bool)

(assert (=> start!117936 m!1266389))

(declare-fun m!1266391 () Bool)

(assert (=> b!1381643 m!1266391))

(declare-fun m!1266393 () Bool)

(assert (=> b!1381644 m!1266393))

(declare-fun m!1266395 () Bool)

(assert (=> b!1381642 m!1266395))

(assert (=> b!1381642 m!1266395))

(declare-fun m!1266397 () Bool)

(assert (=> b!1381642 m!1266397))

(push 1)

(assert (not b!1381644))

(assert (not b!1381642))

(assert (not start!117936))

(assert (not b!1381643))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

