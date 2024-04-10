; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118054 () Bool)

(assert start!118054)

(declare-fun b!1382389 () Bool)

(declare-fun res!923981 () Bool)

(declare-fun e!783548 () Bool)

(assert (=> b!1382389 (=> (not res!923981) (not e!783548))))

(declare-datatypes ((array!94418 0))(
  ( (array!94419 (arr!45590 (Array (_ BitVec 32) (_ BitVec 64))) (size!46140 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94418)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382389 (= res!923981 (validKeyInArray!0 (select (arr!45590 a!2971) i!1094)))))

(declare-fun b!1382391 () Bool)

(assert (=> b!1382391 (= e!783548 false)))

(declare-fun lt!608415 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94418 (_ BitVec 32)) Bool)

(assert (=> b!1382391 (= lt!608415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382388 () Bool)

(declare-fun res!923983 () Bool)

(assert (=> b!1382388 (=> (not res!923983) (not e!783548))))

(assert (=> b!1382388 (= res!923983 (and (= (size!46140 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46140 a!2971))))))

(declare-fun res!923982 () Bool)

(assert (=> start!118054 (=> (not res!923982) (not e!783548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118054 (= res!923982 (validMask!0 mask!3034))))

(assert (=> start!118054 e!783548))

(assert (=> start!118054 true))

(declare-fun array_inv!34618 (array!94418) Bool)

(assert (=> start!118054 (array_inv!34618 a!2971)))

(declare-fun b!1382390 () Bool)

(declare-fun res!923980 () Bool)

(assert (=> b!1382390 (=> (not res!923980) (not e!783548))))

(declare-datatypes ((List!32124 0))(
  ( (Nil!32121) (Cons!32120 (h!33329 (_ BitVec 64)) (t!46818 List!32124)) )
))
(declare-fun arrayNoDuplicates!0 (array!94418 (_ BitVec 32) List!32124) Bool)

(assert (=> b!1382390 (= res!923980 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32121))))

(assert (= (and start!118054 res!923982) b!1382388))

(assert (= (and b!1382388 res!923983) b!1382389))

(assert (= (and b!1382389 res!923981) b!1382390))

(assert (= (and b!1382390 res!923980) b!1382391))

(declare-fun m!1267527 () Bool)

(assert (=> b!1382389 m!1267527))

(assert (=> b!1382389 m!1267527))

(declare-fun m!1267529 () Bool)

(assert (=> b!1382389 m!1267529))

(declare-fun m!1267531 () Bool)

(assert (=> b!1382391 m!1267531))

(declare-fun m!1267533 () Bool)

(assert (=> start!118054 m!1267533))

(declare-fun m!1267535 () Bool)

(assert (=> start!118054 m!1267535))

(declare-fun m!1267537 () Bool)

(assert (=> b!1382390 m!1267537))

(push 1)

(assert (not b!1382389))

(assert (not b!1382391))

(assert (not start!118054))

(assert (not b!1382390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

