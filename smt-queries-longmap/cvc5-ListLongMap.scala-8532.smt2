; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104066 () Bool)

(assert start!104066)

(declare-fun res!830371 () Bool)

(declare-fun e!705647 () Bool)

(assert (=> start!104066 (=> (not res!830371) (not e!705647))))

(declare-datatypes ((array!80086 0))(
  ( (array!80087 (arr!38633 (Array (_ BitVec 32) (_ BitVec 64))) (size!39169 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80086)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104066 (= res!830371 (and (bvslt (size!39169 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39169 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39169 a!3892))))))

(assert (=> start!104066 e!705647))

(declare-fun array_inv!29481 (array!80086) Bool)

(assert (=> start!104066 (array_inv!29481 a!3892)))

(assert (=> start!104066 true))

(declare-fun b!1244816 () Bool)

(assert (=> b!1244816 (= e!705647 false)))

(declare-fun lt!562841 () Bool)

(declare-datatypes ((List!27436 0))(
  ( (Nil!27433) (Cons!27432 (h!28641 (_ BitVec 64)) (t!40905 List!27436)) )
))
(declare-fun arrayNoDuplicates!0 (array!80086 (_ BitVec 32) List!27436) Bool)

(assert (=> b!1244816 (= lt!562841 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27433))))

(assert (= (and start!104066 res!830371) b!1244816))

(declare-fun m!1147049 () Bool)

(assert (=> start!104066 m!1147049))

(declare-fun m!1147051 () Bool)

(assert (=> b!1244816 m!1147051))

(push 1)

(assert (not b!1244816))

(assert (not start!104066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

