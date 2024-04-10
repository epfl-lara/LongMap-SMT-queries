; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104200 () Bool)

(assert start!104200)

(declare-fun res!830803 () Bool)

(declare-fun e!706085 () Bool)

(assert (=> start!104200 (=> (not res!830803) (not e!706085))))

(declare-datatypes ((array!80149 0))(
  ( (array!80150 (arr!38659 (Array (_ BitVec 32) (_ BitVec 64))) (size!39195 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80149)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104200 (= res!830803 (and (bvslt (size!39195 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39195 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39195 a!3892))))))

(assert (=> start!104200 e!706085))

(declare-fun array_inv!29507 (array!80149) Bool)

(assert (=> start!104200 (array_inv!29507 a!3892)))

(assert (=> start!104200 true))

(declare-fun b!1245320 () Bool)

(assert (=> b!1245320 (= e!706085 false)))

(declare-fun lt!562889 () Bool)

(declare-datatypes ((List!27462 0))(
  ( (Nil!27459) (Cons!27458 (h!28667 (_ BitVec 64)) (t!40931 List!27462)) )
))
(declare-fun arrayNoDuplicates!0 (array!80149 (_ BitVec 32) List!27462) Bool)

(assert (=> b!1245320 (= lt!562889 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27459))))

(assert (= (and start!104200 res!830803) b!1245320))

(declare-fun m!1147397 () Bool)

(assert (=> start!104200 m!1147397))

(declare-fun m!1147399 () Bool)

(assert (=> b!1245320 m!1147399))

(push 1)

(assert (not start!104200))

(assert (not b!1245320))

(check-sat)

