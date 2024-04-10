; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104070 () Bool)

(assert start!104070)

(declare-fun res!830377 () Bool)

(declare-fun e!705659 () Bool)

(assert (=> start!104070 (=> (not res!830377) (not e!705659))))

(declare-datatypes ((array!80090 0))(
  ( (array!80091 (arr!38635 (Array (_ BitVec 32) (_ BitVec 64))) (size!39171 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80090)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104070 (= res!830377 (and (bvslt (size!39171 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39171 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39171 a!3892))))))

(assert (=> start!104070 e!705659))

(declare-fun array_inv!29483 (array!80090) Bool)

(assert (=> start!104070 (array_inv!29483 a!3892)))

(assert (=> start!104070 true))

(declare-fun b!1244822 () Bool)

(assert (=> b!1244822 (= e!705659 false)))

(declare-fun lt!562847 () Bool)

(declare-datatypes ((List!27438 0))(
  ( (Nil!27435) (Cons!27434 (h!28643 (_ BitVec 64)) (t!40907 List!27438)) )
))
(declare-fun arrayNoDuplicates!0 (array!80090 (_ BitVec 32) List!27438) Bool)

(assert (=> b!1244822 (= lt!562847 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27435))))

(assert (= (and start!104070 res!830377) b!1244822))

(declare-fun m!1147057 () Bool)

(assert (=> start!104070 m!1147057))

(declare-fun m!1147059 () Bool)

(assert (=> b!1244822 m!1147059))

(push 1)

(assert (not start!104070))

(assert (not b!1244822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

