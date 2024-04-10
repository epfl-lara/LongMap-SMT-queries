; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104192 () Bool)

(assert start!104192)

(declare-fun res!830787 () Bool)

(declare-fun e!706061 () Bool)

(assert (=> start!104192 (=> (not res!830787) (not e!706061))))

(declare-datatypes ((array!80141 0))(
  ( (array!80142 (arr!38655 (Array (_ BitVec 32) (_ BitVec 64))) (size!39191 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80141)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104192 (= res!830787 (and (bvslt (size!39191 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39191 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39191 a!3892))))))

(assert (=> start!104192 e!706061))

(declare-fun array_inv!29503 (array!80141) Bool)

(assert (=> start!104192 (array_inv!29503 a!3892)))

(assert (=> start!104192 true))

(declare-fun b!1245304 () Bool)

(declare-fun res!830788 () Bool)

(assert (=> b!1245304 (=> (not res!830788) (not e!706061))))

(declare-datatypes ((List!27458 0))(
  ( (Nil!27455) (Cons!27454 (h!28663 (_ BitVec 64)) (t!40927 List!27458)) )
))
(declare-fun arrayNoDuplicates!0 (array!80141 (_ BitVec 32) List!27458) Bool)

(assert (=> b!1245304 (= res!830788 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27455))))

(declare-fun b!1245305 () Bool)

(assert (=> b!1245305 (= e!706061 (and (not (= from!3270 newFrom!287)) (bvsge from!3270 (size!39191 a!3892))))))

(assert (= (and start!104192 res!830787) b!1245304))

(assert (= (and b!1245304 res!830788) b!1245305))

(declare-fun m!1147381 () Bool)

(assert (=> start!104192 m!1147381))

(declare-fun m!1147383 () Bool)

(assert (=> b!1245304 m!1147383))

(check-sat (not b!1245304) (not start!104192))
(check-sat)
