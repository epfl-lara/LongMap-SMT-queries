; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118034 () Bool)

(assert start!118034)

(declare-fun res!923862 () Bool)

(declare-fun e!783488 () Bool)

(assert (=> start!118034 (=> (not res!923862) (not e!783488))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118034 (= res!923862 (validMask!0 mask!3034))))

(assert (=> start!118034 e!783488))

(assert (=> start!118034 true))

(declare-datatypes ((array!94398 0))(
  ( (array!94399 (arr!45580 (Array (_ BitVec 32) (_ BitVec 64))) (size!46130 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94398)

(declare-fun array_inv!34608 (array!94398) Bool)

(assert (=> start!118034 (array_inv!34608 a!2971)))

(declare-fun b!1382268 () Bool)

(declare-fun res!923861 () Bool)

(assert (=> b!1382268 (=> (not res!923861) (not e!783488))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382268 (= res!923861 (and (= (size!46130 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46130 a!2971))))))

(declare-fun b!1382270 () Bool)

(declare-fun res!923863 () Bool)

(assert (=> b!1382270 (=> (not res!923863) (not e!783488))))

(declare-datatypes ((List!32114 0))(
  ( (Nil!32111) (Cons!32110 (h!33319 (_ BitVec 64)) (t!46808 List!32114)) )
))
(declare-fun arrayNoDuplicates!0 (array!94398 (_ BitVec 32) List!32114) Bool)

(assert (=> b!1382270 (= res!923863 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32111))))

(declare-fun b!1382271 () Bool)

(assert (=> b!1382271 (= e!783488 false)))

(declare-fun lt!608385 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94398 (_ BitVec 32)) Bool)

(assert (=> b!1382271 (= lt!608385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382269 () Bool)

(declare-fun res!923860 () Bool)

(assert (=> b!1382269 (=> (not res!923860) (not e!783488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382269 (= res!923860 (validKeyInArray!0 (select (arr!45580 a!2971) i!1094)))))

(assert (= (and start!118034 res!923862) b!1382268))

(assert (= (and b!1382268 res!923861) b!1382269))

(assert (= (and b!1382269 res!923860) b!1382270))

(assert (= (and b!1382270 res!923863) b!1382271))

(declare-fun m!1267407 () Bool)

(assert (=> start!118034 m!1267407))

(declare-fun m!1267409 () Bool)

(assert (=> start!118034 m!1267409))

(declare-fun m!1267411 () Bool)

(assert (=> b!1382270 m!1267411))

(declare-fun m!1267413 () Bool)

(assert (=> b!1382271 m!1267413))

(declare-fun m!1267415 () Bool)

(assert (=> b!1382269 m!1267415))

(assert (=> b!1382269 m!1267415))

(declare-fun m!1267417 () Bool)

(assert (=> b!1382269 m!1267417))

(push 1)

(assert (not b!1382271))

(assert (not b!1382269))

(assert (not b!1382270))

(assert (not start!118034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

