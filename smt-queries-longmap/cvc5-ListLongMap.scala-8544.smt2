; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104220 () Bool)

(assert start!104220)

(declare-fun b!1245358 () Bool)

(declare-fun res!830841 () Bool)

(declare-fun e!706146 () Bool)

(assert (=> b!1245358 (=> (not res!830841) (not e!706146))))

(declare-datatypes ((array!80169 0))(
  ( (array!80170 (arr!38669 (Array (_ BitVec 32) (_ BitVec 64))) (size!39205 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80169)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245358 (= res!830841 (validKeyInArray!0 (select (arr!38669 a!3892) from!3270)))))

(declare-fun b!1245359 () Bool)

(assert (=> b!1245359 (= e!706146 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1245356 () Bool)

(declare-fun res!830839 () Bool)

(assert (=> b!1245356 (=> (not res!830839) (not e!706146))))

(declare-datatypes ((List!27472 0))(
  ( (Nil!27469) (Cons!27468 (h!28677 (_ BitVec 64)) (t!40941 List!27472)) )
))
(declare-fun arrayNoDuplicates!0 (array!80169 (_ BitVec 32) List!27472) Bool)

(assert (=> b!1245356 (= res!830839 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27469))))

(declare-fun res!830842 () Bool)

(assert (=> start!104220 (=> (not res!830842) (not e!706146))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104220 (= res!830842 (and (bvslt (size!39205 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39205 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39205 a!3892))))))

(assert (=> start!104220 e!706146))

(declare-fun array_inv!29517 (array!80169) Bool)

(assert (=> start!104220 (array_inv!29517 a!3892)))

(assert (=> start!104220 true))

(declare-fun b!1245357 () Bool)

(declare-fun res!830840 () Bool)

(assert (=> b!1245357 (=> (not res!830840) (not e!706146))))

(assert (=> b!1245357 (= res!830840 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39205 a!3892)) (not (= newFrom!287 (size!39205 a!3892)))))))

(assert (= (and start!104220 res!830842) b!1245356))

(assert (= (and b!1245356 res!830839) b!1245357))

(assert (= (and b!1245357 res!830840) b!1245358))

(assert (= (and b!1245358 res!830841) b!1245359))

(declare-fun m!1147437 () Bool)

(assert (=> b!1245358 m!1147437))

(assert (=> b!1245358 m!1147437))

(declare-fun m!1147439 () Bool)

(assert (=> b!1245358 m!1147439))

(declare-fun m!1147441 () Bool)

(assert (=> b!1245356 m!1147441))

(declare-fun m!1147443 () Bool)

(assert (=> start!104220 m!1147443))

(push 1)

(assert (not b!1245358))

(assert (not start!104220))

(assert (not b!1245356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

