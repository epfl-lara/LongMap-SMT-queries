; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104214 () Bool)

(assert start!104214)

(declare-fun res!830790 () Bool)

(declare-fun e!706094 () Bool)

(assert (=> start!104214 (=> (not res!830790) (not e!706094))))

(declare-datatypes ((array!80088 0))(
  ( (array!80089 (arr!38629 (Array (_ BitVec 32) (_ BitVec 64))) (size!39167 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80088)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104214 (= res!830790 (and (bvslt (size!39167 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39167 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39167 a!3892))))))

(assert (=> start!104214 e!706094))

(declare-fun array_inv!29612 (array!80088) Bool)

(assert (=> start!104214 (array_inv!29612 a!3892)))

(assert (=> start!104214 true))

(declare-fun b!1245265 () Bool)

(assert (=> b!1245265 (= e!706094 false)))

(declare-fun lt!562737 () Bool)

(declare-datatypes ((List!27533 0))(
  ( (Nil!27530) (Cons!27529 (h!28738 (_ BitVec 64)) (t!40993 List!27533)) )
))
(declare-fun arrayNoDuplicates!0 (array!80088 (_ BitVec 32) List!27533) Bool)

(assert (=> b!1245265 (= lt!562737 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27530))))

(assert (= (and start!104214 res!830790) b!1245265))

(declare-fun m!1146911 () Bool)

(assert (=> start!104214 m!1146911))

(declare-fun m!1146913 () Bool)

(assert (=> b!1245265 m!1146913))

(push 1)

(assert (not b!1245265))

(assert (not start!104214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

