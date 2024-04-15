; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117954 () Bool)

(assert start!117954)

(declare-fun res!923422 () Bool)

(declare-fun e!783250 () Bool)

(assert (=> start!117954 (=> (not res!923422) (not e!783250))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117954 (= res!923422 (validMask!0 mask!3034))))

(assert (=> start!117954 e!783250))

(assert (=> start!117954 true))

(declare-datatypes ((array!94297 0))(
  ( (array!94298 (arr!45531 (Array (_ BitVec 32) (_ BitVec 64))) (size!46083 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94297)

(declare-fun array_inv!34764 (array!94297) Bool)

(assert (=> start!117954 (array_inv!34764 a!2971)))

(declare-fun b!1381750 () Bool)

(declare-fun res!923421 () Bool)

(assert (=> b!1381750 (=> (not res!923421) (not e!783250))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381750 (= res!923421 (validKeyInArray!0 (select (arr!45531 a!2971) i!1094)))))

(declare-fun b!1381751 () Bool)

(declare-fun res!923420 () Bool)

(assert (=> b!1381751 (=> (not res!923420) (not e!783250))))

(declare-datatypes ((List!32143 0))(
  ( (Nil!32140) (Cons!32139 (h!33348 (_ BitVec 64)) (t!46829 List!32143)) )
))
(declare-fun arrayNoDuplicates!0 (array!94297 (_ BitVec 32) List!32143) Bool)

(assert (=> b!1381751 (= res!923420 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32140))))

(declare-fun b!1381752 () Bool)

(assert (=> b!1381752 (= e!783250 false)))

(declare-fun lt!608111 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94297 (_ BitVec 32)) Bool)

(assert (=> b!1381752 (= lt!608111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381749 () Bool)

(declare-fun res!923423 () Bool)

(assert (=> b!1381749 (=> (not res!923423) (not e!783250))))

(assert (=> b!1381749 (= res!923423 (and (= (size!46083 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46083 a!2971))))))

(assert (= (and start!117954 res!923422) b!1381749))

(assert (= (and b!1381749 res!923423) b!1381750))

(assert (= (and b!1381750 res!923421) b!1381751))

(assert (= (and b!1381751 res!923420) b!1381752))

(declare-fun m!1266495 () Bool)

(assert (=> start!117954 m!1266495))

(declare-fun m!1266497 () Bool)

(assert (=> start!117954 m!1266497))

(declare-fun m!1266499 () Bool)

(assert (=> b!1381750 m!1266499))

(assert (=> b!1381750 m!1266499))

(declare-fun m!1266501 () Bool)

(assert (=> b!1381750 m!1266501))

(declare-fun m!1266503 () Bool)

(assert (=> b!1381751 m!1266503))

(declare-fun m!1266505 () Bool)

(assert (=> b!1381752 m!1266505))

(push 1)

(assert (not b!1381750))

(assert (not b!1381752))

(assert (not start!117954))

(assert (not b!1381751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

