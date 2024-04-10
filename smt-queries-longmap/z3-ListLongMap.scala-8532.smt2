; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104068 () Bool)

(assert start!104068)

(declare-fun res!830374 () Bool)

(declare-fun e!705653 () Bool)

(assert (=> start!104068 (=> (not res!830374) (not e!705653))))

(declare-datatypes ((array!80088 0))(
  ( (array!80089 (arr!38634 (Array (_ BitVec 32) (_ BitVec 64))) (size!39170 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80088)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104068 (= res!830374 (and (bvslt (size!39170 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39170 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39170 a!3892))))))

(assert (=> start!104068 e!705653))

(declare-fun array_inv!29482 (array!80088) Bool)

(assert (=> start!104068 (array_inv!29482 a!3892)))

(assert (=> start!104068 true))

(declare-fun b!1244819 () Bool)

(assert (=> b!1244819 (= e!705653 false)))

(declare-fun lt!562844 () Bool)

(declare-datatypes ((List!27437 0))(
  ( (Nil!27434) (Cons!27433 (h!28642 (_ BitVec 64)) (t!40906 List!27437)) )
))
(declare-fun arrayNoDuplicates!0 (array!80088 (_ BitVec 32) List!27437) Bool)

(assert (=> b!1244819 (= lt!562844 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27434))))

(assert (= (and start!104068 res!830374) b!1244819))

(declare-fun m!1147053 () Bool)

(assert (=> start!104068 m!1147053))

(declare-fun m!1147055 () Bool)

(assert (=> b!1244819 m!1147055))

(check-sat (not start!104068) (not b!1244819))
