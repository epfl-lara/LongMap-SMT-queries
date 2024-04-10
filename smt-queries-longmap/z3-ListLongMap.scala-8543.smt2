; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104216 () Bool)

(assert start!104216)

(declare-fun res!830827 () Bool)

(declare-fun e!706133 () Bool)

(assert (=> start!104216 (=> (not res!830827) (not e!706133))))

(declare-datatypes ((array!80165 0))(
  ( (array!80166 (arr!38667 (Array (_ BitVec 32) (_ BitVec 64))) (size!39203 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80165)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104216 (= res!830827 (and (bvslt (size!39203 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39203 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39203 a!3892))))))

(assert (=> start!104216 e!706133))

(declare-fun array_inv!29515 (array!80165) Bool)

(assert (=> start!104216 (array_inv!29515 a!3892)))

(assert (=> start!104216 true))

(declare-fun b!1245344 () Bool)

(assert (=> b!1245344 (= e!706133 false)))

(declare-fun lt!562913 () Bool)

(declare-datatypes ((List!27470 0))(
  ( (Nil!27467) (Cons!27466 (h!28675 (_ BitVec 64)) (t!40939 List!27470)) )
))
(declare-fun arrayNoDuplicates!0 (array!80165 (_ BitVec 32) List!27470) Bool)

(assert (=> b!1245344 (= lt!562913 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27467))))

(assert (= (and start!104216 res!830827) b!1245344))

(declare-fun m!1147429 () Bool)

(assert (=> start!104216 m!1147429))

(declare-fun m!1147431 () Bool)

(assert (=> b!1245344 m!1147431))

(check-sat (not start!104216) (not b!1245344))
