; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104060 () Bool)

(assert start!104060)

(declare-fun res!830355 () Bool)

(declare-fun e!705629 () Bool)

(assert (=> start!104060 (=> (not res!830355) (not e!705629))))

(declare-datatypes ((array!80080 0))(
  ( (array!80081 (arr!38630 (Array (_ BitVec 32) (_ BitVec 64))) (size!39166 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80080)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104060 (= res!830355 (and (bvslt (size!39166 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39166 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39166 a!3892))))))

(assert (=> start!104060 e!705629))

(declare-fun array_inv!29478 (array!80080) Bool)

(assert (=> start!104060 (array_inv!29478 a!3892)))

(assert (=> start!104060 true))

(declare-fun b!1244800 () Bool)

(declare-fun res!830356 () Bool)

(assert (=> b!1244800 (=> (not res!830356) (not e!705629))))

(declare-datatypes ((List!27433 0))(
  ( (Nil!27430) (Cons!27429 (h!28638 (_ BitVec 64)) (t!40902 List!27433)) )
))
(declare-fun arrayNoDuplicates!0 (array!80080 (_ BitVec 32) List!27433) Bool)

(assert (=> b!1244800 (= res!830356 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27430))))

(declare-fun b!1244801 () Bool)

(assert (=> b!1244801 (= e!705629 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39166 a!3892)) (= newFrom!287 (size!39166 a!3892)) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104060 res!830355) b!1244800))

(assert (= (and b!1244800 res!830356) b!1244801))

(declare-fun m!1147037 () Bool)

(assert (=> start!104060 m!1147037))

(declare-fun m!1147039 () Bool)

(assert (=> b!1244800 m!1147039))

(push 1)

(assert (not start!104060))

(assert (not b!1244800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

