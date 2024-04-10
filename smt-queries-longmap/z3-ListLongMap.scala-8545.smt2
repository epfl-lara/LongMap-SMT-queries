; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104228 () Bool)

(assert start!104228)

(declare-fun res!830872 () Bool)

(declare-fun e!706169 () Bool)

(assert (=> start!104228 (=> (not res!830872) (not e!706169))))

(declare-datatypes ((array!80177 0))(
  ( (array!80178 (arr!38673 (Array (_ BitVec 32) (_ BitVec 64))) (size!39209 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80177)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104228 (= res!830872 (and (bvslt (size!39209 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39209 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39209 a!3892))))))

(assert (=> start!104228 e!706169))

(declare-fun array_inv!29521 (array!80177) Bool)

(assert (=> start!104228 (array_inv!29521 a!3892)))

(assert (=> start!104228 true))

(declare-fun b!1245389 () Bool)

(assert (=> b!1245389 (= e!706169 false)))

(declare-fun lt!562922 () Bool)

(declare-datatypes ((List!27476 0))(
  ( (Nil!27473) (Cons!27472 (h!28681 (_ BitVec 64)) (t!40945 List!27476)) )
))
(declare-fun arrayNoDuplicates!0 (array!80177 (_ BitVec 32) List!27476) Bool)

(assert (=> b!1245389 (= lt!562922 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27473))))

(assert (= (and start!104228 res!830872) b!1245389))

(declare-fun m!1147465 () Bool)

(assert (=> start!104228 m!1147465))

(declare-fun m!1147467 () Bool)

(assert (=> b!1245389 m!1147467))

(check-sat (not b!1245389) (not start!104228))
