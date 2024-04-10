; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104210 () Bool)

(assert start!104210)

(declare-fun res!830818 () Bool)

(declare-fun e!706115 () Bool)

(assert (=> start!104210 (=> (not res!830818) (not e!706115))))

(declare-datatypes ((array!80159 0))(
  ( (array!80160 (arr!38664 (Array (_ BitVec 32) (_ BitVec 64))) (size!39200 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80159)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104210 (= res!830818 (and (bvslt (size!39200 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39200 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39200 a!3892))))))

(assert (=> start!104210 e!706115))

(declare-fun array_inv!29512 (array!80159) Bool)

(assert (=> start!104210 (array_inv!29512 a!3892)))

(assert (=> start!104210 true))

(declare-fun b!1245335 () Bool)

(assert (=> b!1245335 (= e!706115 false)))

(declare-fun lt!562904 () Bool)

(declare-datatypes ((List!27467 0))(
  ( (Nil!27464) (Cons!27463 (h!28672 (_ BitVec 64)) (t!40936 List!27467)) )
))
(declare-fun arrayNoDuplicates!0 (array!80159 (_ BitVec 32) List!27467) Bool)

(assert (=> b!1245335 (= lt!562904 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27464))))

(assert (= (and start!104210 res!830818) b!1245335))

(declare-fun m!1147417 () Bool)

(assert (=> start!104210 m!1147417))

(declare-fun m!1147419 () Bool)

(assert (=> b!1245335 m!1147419))

(check-sat (not b!1245335) (not start!104210))
