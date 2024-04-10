; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118060 () Bool)

(assert start!118060)

(declare-fun res!924017 () Bool)

(declare-fun e!783565 () Bool)

(assert (=> start!118060 (=> (not res!924017) (not e!783565))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118060 (= res!924017 (validMask!0 mask!3034))))

(assert (=> start!118060 e!783565))

(assert (=> start!118060 true))

(declare-datatypes ((array!94424 0))(
  ( (array!94425 (arr!45593 (Array (_ BitVec 32) (_ BitVec 64))) (size!46143 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94424)

(declare-fun array_inv!34621 (array!94424) Bool)

(assert (=> start!118060 (array_inv!34621 a!2971)))

(declare-fun b!1382424 () Bool)

(declare-fun res!924016 () Bool)

(assert (=> b!1382424 (=> (not res!924016) (not e!783565))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382424 (= res!924016 (and (= (size!46143 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46143 a!2971))))))

(declare-fun b!1382427 () Bool)

(assert (=> b!1382427 (= e!783565 false)))

(declare-fun lt!608424 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94424 (_ BitVec 32)) Bool)

(assert (=> b!1382427 (= lt!608424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382426 () Bool)

(declare-fun res!924018 () Bool)

(assert (=> b!1382426 (=> (not res!924018) (not e!783565))))

(declare-datatypes ((List!32127 0))(
  ( (Nil!32124) (Cons!32123 (h!33332 (_ BitVec 64)) (t!46821 List!32127)) )
))
(declare-fun arrayNoDuplicates!0 (array!94424 (_ BitVec 32) List!32127) Bool)

(assert (=> b!1382426 (= res!924018 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32124))))

(declare-fun b!1382425 () Bool)

(declare-fun res!924019 () Bool)

(assert (=> b!1382425 (=> (not res!924019) (not e!783565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382425 (= res!924019 (validKeyInArray!0 (select (arr!45593 a!2971) i!1094)))))

(assert (= (and start!118060 res!924017) b!1382424))

(assert (= (and b!1382424 res!924016) b!1382425))

(assert (= (and b!1382425 res!924019) b!1382426))

(assert (= (and b!1382426 res!924018) b!1382427))

(declare-fun m!1267563 () Bool)

(assert (=> start!118060 m!1267563))

(declare-fun m!1267565 () Bool)

(assert (=> start!118060 m!1267565))

(declare-fun m!1267567 () Bool)

(assert (=> b!1382427 m!1267567))

(declare-fun m!1267569 () Bool)

(assert (=> b!1382426 m!1267569))

(declare-fun m!1267571 () Bool)

(assert (=> b!1382425 m!1267571))

(assert (=> b!1382425 m!1267571))

(declare-fun m!1267573 () Bool)

(assert (=> b!1382425 m!1267573))

(push 1)

(assert (not b!1382425))

(assert (not b!1382427))

(assert (not start!118060))

(assert (not b!1382426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

