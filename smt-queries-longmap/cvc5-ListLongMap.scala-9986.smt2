; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117924 () Bool)

(assert start!117924)

(declare-fun b!1381570 () Bool)

(declare-fun res!923243 () Bool)

(declare-fun e!783159 () Bool)

(assert (=> b!1381570 (=> (not res!923243) (not e!783159))))

(declare-datatypes ((array!94267 0))(
  ( (array!94268 (arr!45516 (Array (_ BitVec 32) (_ BitVec 64))) (size!46068 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94267)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381570 (= res!923243 (validKeyInArray!0 (select (arr!45516 a!2971) i!1094)))))

(declare-fun b!1381571 () Bool)

(declare-fun res!923242 () Bool)

(assert (=> b!1381571 (=> (not res!923242) (not e!783159))))

(declare-datatypes ((List!32128 0))(
  ( (Nil!32125) (Cons!32124 (h!33333 (_ BitVec 64)) (t!46814 List!32128)) )
))
(declare-fun arrayNoDuplicates!0 (array!94267 (_ BitVec 32) List!32128) Bool)

(assert (=> b!1381571 (= res!923242 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32125))))

(declare-fun res!923240 () Bool)

(assert (=> start!117924 (=> (not res!923240) (not e!783159))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117924 (= res!923240 (validMask!0 mask!3034))))

(assert (=> start!117924 e!783159))

(assert (=> start!117924 true))

(declare-fun array_inv!34749 (array!94267) Bool)

(assert (=> start!117924 (array_inv!34749 a!2971)))

(declare-fun b!1381572 () Bool)

(assert (=> b!1381572 (= e!783159 false)))

(declare-fun lt!608066 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94267 (_ BitVec 32)) Bool)

(assert (=> b!1381572 (= lt!608066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381569 () Bool)

(declare-fun res!923241 () Bool)

(assert (=> b!1381569 (=> (not res!923241) (not e!783159))))

(assert (=> b!1381569 (= res!923241 (and (= (size!46068 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46068 a!2971))))))

(assert (= (and start!117924 res!923240) b!1381569))

(assert (= (and b!1381569 res!923241) b!1381570))

(assert (= (and b!1381570 res!923243) b!1381571))

(assert (= (and b!1381571 res!923242) b!1381572))

(declare-fun m!1266315 () Bool)

(assert (=> b!1381570 m!1266315))

(assert (=> b!1381570 m!1266315))

(declare-fun m!1266317 () Bool)

(assert (=> b!1381570 m!1266317))

(declare-fun m!1266319 () Bool)

(assert (=> b!1381571 m!1266319))

(declare-fun m!1266321 () Bool)

(assert (=> start!117924 m!1266321))

(declare-fun m!1266323 () Bool)

(assert (=> start!117924 m!1266323))

(declare-fun m!1266325 () Bool)

(assert (=> b!1381572 m!1266325))

(push 1)

(assert (not b!1381572))

(assert (not start!117924))

(assert (not b!1381571))

(assert (not b!1381570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

