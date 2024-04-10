; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104124 () Bool)

(assert start!104124)

(declare-fun res!830568 () Bool)

(declare-fun e!705842 () Bool)

(assert (=> start!104124 (=> (not res!830568) (not e!705842))))

(declare-datatypes ((array!80109 0))(
  ( (array!80110 (arr!38642 (Array (_ BitVec 32) (_ BitVec 64))) (size!39178 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80109)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104124 (= res!830568 (and (bvslt (size!39178 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39178 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39178 a!3892))))))

(assert (=> start!104124 e!705842))

(declare-fun array_inv!29490 (array!80109) Bool)

(assert (=> start!104124 (array_inv!29490 a!3892)))

(assert (=> start!104124 true))

(declare-fun b!1245049 () Bool)

(declare-fun res!830569 () Bool)

(assert (=> b!1245049 (=> (not res!830569) (not e!705842))))

(declare-datatypes ((List!27445 0))(
  ( (Nil!27442) (Cons!27441 (h!28650 (_ BitVec 64)) (t!40914 List!27445)) )
))
(declare-fun arrayNoDuplicates!0 (array!80109 (_ BitVec 32) List!27445) Bool)

(assert (=> b!1245049 (= res!830569 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27442))))

(declare-fun b!1245050 () Bool)

(assert (=> b!1245050 (= e!705842 (and (= from!3270 newFrom!287) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104124 res!830568) b!1245049))

(assert (= (and b!1245049 res!830569) b!1245050))

(declare-fun m!1147203 () Bool)

(assert (=> start!104124 m!1147203))

(declare-fun m!1147205 () Bool)

(assert (=> b!1245049 m!1147205))

(push 1)

(assert (not b!1245049))

(assert (not start!104124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

