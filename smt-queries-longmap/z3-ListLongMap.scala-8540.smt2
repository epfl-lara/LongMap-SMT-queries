; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104198 () Bool)

(assert start!104198)

(declare-fun res!830800 () Bool)

(declare-fun e!706079 () Bool)

(assert (=> start!104198 (=> (not res!830800) (not e!706079))))

(declare-datatypes ((array!80147 0))(
  ( (array!80148 (arr!38658 (Array (_ BitVec 32) (_ BitVec 64))) (size!39194 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80147)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104198 (= res!830800 (and (bvslt (size!39194 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39194 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39194 a!3892))))))

(assert (=> start!104198 e!706079))

(declare-fun array_inv!29506 (array!80147) Bool)

(assert (=> start!104198 (array_inv!29506 a!3892)))

(assert (=> start!104198 true))

(declare-fun b!1245317 () Bool)

(assert (=> b!1245317 (= e!706079 false)))

(declare-fun lt!562886 () Bool)

(declare-datatypes ((List!27461 0))(
  ( (Nil!27458) (Cons!27457 (h!28666 (_ BitVec 64)) (t!40930 List!27461)) )
))
(declare-fun arrayNoDuplicates!0 (array!80147 (_ BitVec 32) List!27461) Bool)

(assert (=> b!1245317 (= lt!562886 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27458))))

(assert (= (and start!104198 res!830800) b!1245317))

(declare-fun m!1147393 () Bool)

(assert (=> start!104198 m!1147393))

(declare-fun m!1147395 () Bool)

(assert (=> b!1245317 m!1147395))

(check-sat (not b!1245317) (not start!104198))
