; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117888 () Bool)

(assert start!117888)

(declare-fun res!923043 () Bool)

(declare-fun e!783052 () Bool)

(assert (=> start!117888 (=> (not res!923043) (not e!783052))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117888 (= res!923043 (validMask!0 mask!3034))))

(assert (=> start!117888 e!783052))

(assert (=> start!117888 true))

(declare-datatypes ((array!94231 0))(
  ( (array!94232 (arr!45498 (Array (_ BitVec 32) (_ BitVec 64))) (size!46050 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94231)

(declare-fun array_inv!34731 (array!94231) Bool)

(assert (=> start!117888 (array_inv!34731 a!2971)))

(declare-fun b!1381372 () Bool)

(declare-fun res!923045 () Bool)

(assert (=> b!1381372 (=> (not res!923045) (not e!783052))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381372 (= res!923045 (and (= (size!46050 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46050 a!2971))))))

(declare-fun b!1381373 () Bool)

(declare-fun res!923044 () Bool)

(assert (=> b!1381373 (=> (not res!923044) (not e!783052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381373 (= res!923044 (validKeyInArray!0 (select (arr!45498 a!2971) i!1094)))))

(declare-fun b!1381374 () Bool)

(assert (=> b!1381374 (= e!783052 false)))

(declare-fun lt!608021 () Bool)

(declare-datatypes ((List!32110 0))(
  ( (Nil!32107) (Cons!32106 (h!33315 (_ BitVec 64)) (t!46796 List!32110)) )
))
(declare-fun arrayNoDuplicates!0 (array!94231 (_ BitVec 32) List!32110) Bool)

(assert (=> b!1381374 (= lt!608021 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32107))))

(assert (= (and start!117888 res!923043) b!1381372))

(assert (= (and b!1381372 res!923045) b!1381373))

(assert (= (and b!1381373 res!923044) b!1381374))

(declare-fun m!1266119 () Bool)

(assert (=> start!117888 m!1266119))

(declare-fun m!1266121 () Bool)

(assert (=> start!117888 m!1266121))

(declare-fun m!1266123 () Bool)

(assert (=> b!1381373 m!1266123))

(assert (=> b!1381373 m!1266123))

(declare-fun m!1266125 () Bool)

(assert (=> b!1381373 m!1266125))

(declare-fun m!1266127 () Bool)

(assert (=> b!1381374 m!1266127))

(push 1)

(assert (not b!1381374))

(assert (not start!117888))

(assert (not b!1381373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

