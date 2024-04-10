; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104062 () Bool)

(assert start!104062)

(declare-fun res!830361 () Bool)

(declare-fun e!705635 () Bool)

(assert (=> start!104062 (=> (not res!830361) (not e!705635))))

(declare-datatypes ((array!80082 0))(
  ( (array!80083 (arr!38631 (Array (_ BitVec 32) (_ BitVec 64))) (size!39167 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80082)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104062 (= res!830361 (and (bvslt (size!39167 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39167 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39167 a!3892))))))

(assert (=> start!104062 e!705635))

(declare-fun array_inv!29479 (array!80082) Bool)

(assert (=> start!104062 (array_inv!29479 a!3892)))

(assert (=> start!104062 true))

(declare-fun b!1244806 () Bool)

(declare-fun res!830362 () Bool)

(assert (=> b!1244806 (=> (not res!830362) (not e!705635))))

(declare-datatypes ((List!27434 0))(
  ( (Nil!27431) (Cons!27430 (h!28639 (_ BitVec 64)) (t!40903 List!27434)) )
))
(declare-fun arrayNoDuplicates!0 (array!80082 (_ BitVec 32) List!27434) Bool)

(assert (=> b!1244806 (= res!830362 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27431))))

(declare-fun b!1244807 () Bool)

(assert (=> b!1244807 (= e!705635 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39167 a!3892)) (= newFrom!287 (size!39167 a!3892)) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104062 res!830361) b!1244806))

(assert (= (and b!1244806 res!830362) b!1244807))

(declare-fun m!1147041 () Bool)

(assert (=> start!104062 m!1147041))

(declare-fun m!1147043 () Bool)

(assert (=> b!1244806 m!1147043))

(check-sat (not start!104062) (not b!1244806))
(check-sat)
