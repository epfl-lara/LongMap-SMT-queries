; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118046 () Bool)

(assert start!118046)

(declare-fun res!923932 () Bool)

(declare-fun e!783524 () Bool)

(assert (=> start!118046 (=> (not res!923932) (not e!783524))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118046 (= res!923932 (validMask!0 mask!3034))))

(assert (=> start!118046 e!783524))

(assert (=> start!118046 true))

(declare-datatypes ((array!94410 0))(
  ( (array!94411 (arr!45586 (Array (_ BitVec 32) (_ BitVec 64))) (size!46136 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94410)

(declare-fun array_inv!34614 (array!94410) Bool)

(assert (=> start!118046 (array_inv!34614 a!2971)))

(declare-fun b!1382342 () Bool)

(declare-fun res!923934 () Bool)

(assert (=> b!1382342 (=> (not res!923934) (not e!783524))))

(declare-datatypes ((List!32120 0))(
  ( (Nil!32117) (Cons!32116 (h!33325 (_ BitVec 64)) (t!46814 List!32120)) )
))
(declare-fun arrayNoDuplicates!0 (array!94410 (_ BitVec 32) List!32120) Bool)

(assert (=> b!1382342 (= res!923934 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32117))))

(declare-fun b!1382341 () Bool)

(declare-fun res!923935 () Bool)

(assert (=> b!1382341 (=> (not res!923935) (not e!783524))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382341 (= res!923935 (validKeyInArray!0 (select (arr!45586 a!2971) i!1094)))))

(declare-fun b!1382343 () Bool)

(assert (=> b!1382343 (= e!783524 false)))

(declare-fun lt!608403 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94410 (_ BitVec 32)) Bool)

(assert (=> b!1382343 (= lt!608403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382340 () Bool)

(declare-fun res!923933 () Bool)

(assert (=> b!1382340 (=> (not res!923933) (not e!783524))))

(assert (=> b!1382340 (= res!923933 (and (= (size!46136 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46136 a!2971))))))

(assert (= (and start!118046 res!923932) b!1382340))

(assert (= (and b!1382340 res!923933) b!1382341))

(assert (= (and b!1382341 res!923935) b!1382342))

(assert (= (and b!1382342 res!923934) b!1382343))

(declare-fun m!1267479 () Bool)

(assert (=> start!118046 m!1267479))

(declare-fun m!1267481 () Bool)

(assert (=> start!118046 m!1267481))

(declare-fun m!1267483 () Bool)

(assert (=> b!1382342 m!1267483))

(declare-fun m!1267485 () Bool)

(assert (=> b!1382341 m!1267485))

(assert (=> b!1382341 m!1267485))

(declare-fun m!1267487 () Bool)

(assert (=> b!1382341 m!1267487))

(declare-fun m!1267489 () Bool)

(assert (=> b!1382343 m!1267489))

(push 1)

(assert (not start!118046))

(assert (not b!1382342))

(assert (not b!1382343))

(assert (not b!1382341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

