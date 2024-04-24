; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104442 () Bool)

(assert start!104442)

(declare-fun res!831342 () Bool)

(declare-fun e!706968 () Bool)

(assert (=> start!104442 (=> (not res!831342) (not e!706968))))

(declare-datatypes ((array!80193 0))(
  ( (array!80194 (arr!38676 (Array (_ BitVec 32) (_ BitVec 64))) (size!39213 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80193)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104442 (= res!831342 (and (bvslt (size!39213 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39213 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39213 a!3892))))))

(assert (=> start!104442 e!706968))

(declare-fun array_inv!29614 (array!80193) Bool)

(assert (=> start!104442 (array_inv!29614 a!3892)))

(assert (=> start!104442 true))

(declare-fun b!1246648 () Bool)

(assert (=> b!1246648 (= e!706968 false)))

(declare-fun lt!563390 () Bool)

(declare-datatypes ((List!27492 0))(
  ( (Nil!27489) (Cons!27488 (h!28706 (_ BitVec 64)) (t!40953 List!27492)) )
))
(declare-fun arrayNoDuplicates!0 (array!80193 (_ BitVec 32) List!27492) Bool)

(assert (=> b!1246648 (= lt!563390 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27489))))

(assert (= (and start!104442 res!831342) b!1246648))

(declare-fun m!1149041 () Bool)

(assert (=> start!104442 m!1149041))

(declare-fun m!1149043 () Bool)

(assert (=> b!1246648 m!1149043))

(push 1)

(assert (not b!1246648))

(assert (not start!104442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

