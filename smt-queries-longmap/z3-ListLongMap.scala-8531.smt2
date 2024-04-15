; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104054 () Bool)

(assert start!104054)

(declare-fun res!830315 () Bool)

(declare-fun e!705584 () Bool)

(assert (=> start!104054 (=> (not res!830315) (not e!705584))))

(declare-datatypes ((array!80000 0))(
  ( (array!80001 (arr!38591 (Array (_ BitVec 32) (_ BitVec 64))) (size!39129 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80000)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104054 (= res!830315 (and (bvslt (size!39129 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39129 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39129 a!3892))))))

(assert (=> start!104054 e!705584))

(declare-fun array_inv!29574 (array!80000) Bool)

(assert (=> start!104054 (array_inv!29574 a!3892)))

(assert (=> start!104054 true))

(declare-fun b!1244718 () Bool)

(declare-fun res!830316 () Bool)

(assert (=> b!1244718 (=> (not res!830316) (not e!705584))))

(declare-datatypes ((List!27495 0))(
  ( (Nil!27492) (Cons!27491 (h!28700 (_ BitVec 64)) (t!40955 List!27495)) )
))
(declare-fun arrayNoDuplicates!0 (array!80000 (_ BitVec 32) List!27495) Bool)

(assert (=> b!1244718 (= res!830316 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27492))))

(declare-fun b!1244719 () Bool)

(assert (=> b!1244719 (= e!705584 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39129 a!3892)) (= newFrom!287 (size!39129 a!3892)) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104054 res!830315) b!1244718))

(assert (= (and b!1244718 res!830316) b!1244719))

(declare-fun m!1146507 () Bool)

(assert (=> start!104054 m!1146507))

(declare-fun m!1146509 () Bool)

(assert (=> b!1244718 m!1146509))

(check-sat (not start!104054) (not b!1244718))
(check-sat)
