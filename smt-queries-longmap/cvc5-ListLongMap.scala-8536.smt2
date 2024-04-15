; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104130 () Bool)

(assert start!104130)

(declare-fun res!830550 () Bool)

(declare-fun e!705827 () Bool)

(assert (=> start!104130 (=> (not res!830550) (not e!705827))))

(declare-datatypes ((array!80040 0))(
  ( (array!80041 (arr!38608 (Array (_ BitVec 32) (_ BitVec 64))) (size!39146 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80040)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104130 (= res!830550 (and (bvslt (size!39146 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39146 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39146 a!3892))))))

(assert (=> start!104130 e!705827))

(declare-fun array_inv!29591 (array!80040) Bool)

(assert (=> start!104130 (array_inv!29591 a!3892)))

(assert (=> start!104130 true))

(declare-fun b!1244989 () Bool)

(assert (=> b!1244989 (= e!705827 false)))

(declare-fun lt!562689 () Bool)

(declare-datatypes ((List!27512 0))(
  ( (Nil!27509) (Cons!27508 (h!28717 (_ BitVec 64)) (t!40972 List!27512)) )
))
(declare-fun arrayNoDuplicates!0 (array!80040 (_ BitVec 32) List!27512) Bool)

(assert (=> b!1244989 (= lt!562689 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27509))))

(assert (= (and start!104130 res!830550) b!1244989))

(declare-fun m!1146701 () Bool)

(assert (=> start!104130 m!1146701))

(declare-fun m!1146703 () Bool)

(assert (=> b!1244989 m!1146703))

(push 1)

(assert (not b!1244989))

(assert (not start!104130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

