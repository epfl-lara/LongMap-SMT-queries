; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118072 () Bool)

(assert start!118072)

(declare-fun res!924099 () Bool)

(declare-fun e!783601 () Bool)

(assert (=> start!118072 (=> (not res!924099) (not e!783601))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118072 (= res!924099 (validMask!0 mask!3034))))

(assert (=> start!118072 e!783601))

(assert (=> start!118072 true))

(declare-datatypes ((array!94436 0))(
  ( (array!94437 (arr!45599 (Array (_ BitVec 32) (_ BitVec 64))) (size!46149 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94436)

(declare-fun array_inv!34627 (array!94436) Bool)

(assert (=> start!118072 (array_inv!34627 a!2971)))

(declare-fun b!1382508 () Bool)

(assert (=> b!1382508 (= e!783601 false)))

(declare-fun lt!608433 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94436 (_ BitVec 32)) Bool)

(assert (=> b!1382508 (= lt!608433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382507 () Bool)

(declare-fun res!924100 () Bool)

(assert (=> b!1382507 (=> (not res!924100) (not e!783601))))

(declare-datatypes ((List!32133 0))(
  ( (Nil!32130) (Cons!32129 (h!33338 (_ BitVec 64)) (t!46827 List!32133)) )
))
(declare-fun arrayNoDuplicates!0 (array!94436 (_ BitVec 32) List!32133) Bool)

(assert (=> b!1382507 (= res!924100 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32130))))

(declare-fun b!1382506 () Bool)

(declare-fun res!924098 () Bool)

(assert (=> b!1382506 (=> (not res!924098) (not e!783601))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382506 (= res!924098 (validKeyInArray!0 (select (arr!45599 a!2971) i!1094)))))

(declare-fun b!1382505 () Bool)

(declare-fun res!924097 () Bool)

(assert (=> b!1382505 (=> (not res!924097) (not e!783601))))

(assert (=> b!1382505 (= res!924097 (and (= (size!46149 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46149 a!2971))))))

(assert (= (and start!118072 res!924099) b!1382505))

(assert (= (and b!1382505 res!924097) b!1382506))

(assert (= (and b!1382506 res!924098) b!1382507))

(assert (= (and b!1382507 res!924100) b!1382508))

(declare-fun m!1267635 () Bool)

(assert (=> start!118072 m!1267635))

(declare-fun m!1267637 () Bool)

(assert (=> start!118072 m!1267637))

(declare-fun m!1267639 () Bool)

(assert (=> b!1382508 m!1267639))

(declare-fun m!1267641 () Bool)

(assert (=> b!1382507 m!1267641))

(declare-fun m!1267643 () Bool)

(assert (=> b!1382506 m!1267643))

(assert (=> b!1382506 m!1267643))

(declare-fun m!1267645 () Bool)

(assert (=> b!1382506 m!1267645))

(push 1)

(assert (not start!118072))

(assert (not b!1382507))

(assert (not b!1382506))

(assert (not b!1382508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

