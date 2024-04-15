; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117788 () Bool)

(assert start!117788)

(declare-fun res!922821 () Bool)

(declare-fun e!782898 () Bool)

(assert (=> start!117788 (=> (not res!922821) (not e!782898))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117788 (= res!922821 (validMask!0 mask!3034))))

(assert (=> start!117788 e!782898))

(assert (=> start!117788 true))

(declare-datatypes ((array!94194 0))(
  ( (array!94195 (arr!45484 (Array (_ BitVec 32) (_ BitVec 64))) (size!46036 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94194)

(declare-fun array_inv!34717 (array!94194) Bool)

(assert (=> start!117788 (array_inv!34717 a!2971)))

(declare-fun b!1381150 () Bool)

(declare-fun res!922822 () Bool)

(assert (=> b!1381150 (=> (not res!922822) (not e!782898))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381150 (= res!922822 (and (= (size!46036 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46036 a!2971))))))

(declare-fun b!1381151 () Bool)

(declare-fun res!922823 () Bool)

(assert (=> b!1381151 (=> (not res!922823) (not e!782898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381151 (= res!922823 (validKeyInArray!0 (select (arr!45484 a!2971) i!1094)))))

(declare-fun b!1381152 () Bool)

(assert (=> b!1381152 (= e!782898 (bvsgt #b00000000000000000000000000000000 (size!46036 a!2971)))))

(assert (= (and start!117788 res!922821) b!1381150))

(assert (= (and b!1381150 res!922822) b!1381151))

(assert (= (and b!1381151 res!922823) b!1381152))

(declare-fun m!1265925 () Bool)

(assert (=> start!117788 m!1265925))

(declare-fun m!1265927 () Bool)

(assert (=> start!117788 m!1265927))

(declare-fun m!1265929 () Bool)

(assert (=> b!1381151 m!1265929))

(assert (=> b!1381151 m!1265929))

(declare-fun m!1265931 () Bool)

(assert (=> b!1381151 m!1265931))

(check-sat (not start!117788) (not b!1381151))
(check-sat)
