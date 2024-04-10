; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104222 () Bool)

(assert start!104222)

(declare-fun b!1245369 () Bool)

(declare-fun res!830851 () Bool)

(declare-fun e!706152 () Bool)

(assert (=> b!1245369 (=> (not res!830851) (not e!706152))))

(declare-datatypes ((array!80171 0))(
  ( (array!80172 (arr!38670 (Array (_ BitVec 32) (_ BitVec 64))) (size!39206 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80171)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245369 (= res!830851 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39206 a!3892)) (not (= newFrom!287 (size!39206 a!3892)))))))

(declare-fun b!1245371 () Bool)

(assert (=> b!1245371 (= e!706152 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1245370 () Bool)

(declare-fun res!830854 () Bool)

(assert (=> b!1245370 (=> (not res!830854) (not e!706152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245370 (= res!830854 (validKeyInArray!0 (select (arr!38670 a!3892) from!3270)))))

(declare-fun res!830852 () Bool)

(assert (=> start!104222 (=> (not res!830852) (not e!706152))))

(assert (=> start!104222 (= res!830852 (and (bvslt (size!39206 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39206 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39206 a!3892))))))

(assert (=> start!104222 e!706152))

(declare-fun array_inv!29518 (array!80171) Bool)

(assert (=> start!104222 (array_inv!29518 a!3892)))

(assert (=> start!104222 true))

(declare-fun b!1245368 () Bool)

(declare-fun res!830853 () Bool)

(assert (=> b!1245368 (=> (not res!830853) (not e!706152))))

(declare-datatypes ((List!27473 0))(
  ( (Nil!27470) (Cons!27469 (h!28678 (_ BitVec 64)) (t!40942 List!27473)) )
))
(declare-fun arrayNoDuplicates!0 (array!80171 (_ BitVec 32) List!27473) Bool)

(assert (=> b!1245368 (= res!830853 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27470))))

(assert (= (and start!104222 res!830852) b!1245368))

(assert (= (and b!1245368 res!830853) b!1245369))

(assert (= (and b!1245369 res!830851) b!1245370))

(assert (= (and b!1245370 res!830854) b!1245371))

(declare-fun m!1147445 () Bool)

(assert (=> b!1245370 m!1147445))

(assert (=> b!1245370 m!1147445))

(declare-fun m!1147447 () Bool)

(assert (=> b!1245370 m!1147447))

(declare-fun m!1147449 () Bool)

(assert (=> start!104222 m!1147449))

(declare-fun m!1147451 () Bool)

(assert (=> b!1245368 m!1147451))

(check-sat (not b!1245370) (not start!104222) (not b!1245368))
(check-sat)
