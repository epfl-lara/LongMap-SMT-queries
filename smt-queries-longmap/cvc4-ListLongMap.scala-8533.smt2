; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104076 () Bool)

(assert start!104076)

(declare-fun res!830404 () Bool)

(declare-fun e!705677 () Bool)

(assert (=> start!104076 (=> (not res!830404) (not e!705677))))

(declare-datatypes ((array!80096 0))(
  ( (array!80097 (arr!38638 (Array (_ BitVec 32) (_ BitVec 64))) (size!39174 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80096)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104076 (= res!830404 (and (bvslt (size!39174 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39174 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39174 a!3892))))))

(assert (=> start!104076 e!705677))

(declare-fun array_inv!29486 (array!80096) Bool)

(assert (=> start!104076 (array_inv!29486 a!3892)))

(assert (=> start!104076 true))

(declare-fun b!1244847 () Bool)

(declare-fun res!830402 () Bool)

(assert (=> b!1244847 (=> (not res!830402) (not e!705677))))

(declare-datatypes ((List!27441 0))(
  ( (Nil!27438) (Cons!27437 (h!28646 (_ BitVec 64)) (t!40910 List!27441)) )
))
(declare-fun arrayNoDuplicates!0 (array!80096 (_ BitVec 32) List!27441) Bool)

(assert (=> b!1244847 (= res!830402 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27438))))

(declare-fun b!1244848 () Bool)

(declare-fun res!830403 () Bool)

(assert (=> b!1244848 (=> (not res!830403) (not e!705677))))

(assert (=> b!1244848 (= res!830403 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39174 a!3892)) (= newFrom!287 (size!39174 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244849 () Bool)

(declare-fun noDuplicate!2013 (List!27441) Bool)

(assert (=> b!1244849 (= e!705677 (not (noDuplicate!2013 Nil!27438)))))

(assert (= (and start!104076 res!830404) b!1244847))

(assert (= (and b!1244847 res!830402) b!1244848))

(assert (= (and b!1244848 res!830403) b!1244849))

(declare-fun m!1147073 () Bool)

(assert (=> start!104076 m!1147073))

(declare-fun m!1147075 () Bool)

(assert (=> b!1244847 m!1147075))

(declare-fun m!1147077 () Bool)

(assert (=> b!1244849 m!1147077))

(push 1)

(assert (not b!1244849))

(assert (not b!1244847))

(assert (not start!104076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

