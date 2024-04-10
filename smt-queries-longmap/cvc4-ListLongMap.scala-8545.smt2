; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104230 () Bool)

(assert start!104230)

(declare-fun res!830875 () Bool)

(declare-fun e!706175 () Bool)

(assert (=> start!104230 (=> (not res!830875) (not e!706175))))

(declare-datatypes ((array!80179 0))(
  ( (array!80180 (arr!38674 (Array (_ BitVec 32) (_ BitVec 64))) (size!39210 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80179)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104230 (= res!830875 (and (bvslt (size!39210 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39210 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39210 a!3892))))))

(assert (=> start!104230 e!706175))

(declare-fun array_inv!29522 (array!80179) Bool)

(assert (=> start!104230 (array_inv!29522 a!3892)))

(assert (=> start!104230 true))

(declare-fun b!1245392 () Bool)

(assert (=> b!1245392 (= e!706175 false)))

(declare-fun lt!562925 () Bool)

(declare-datatypes ((List!27477 0))(
  ( (Nil!27474) (Cons!27473 (h!28682 (_ BitVec 64)) (t!40946 List!27477)) )
))
(declare-fun arrayNoDuplicates!0 (array!80179 (_ BitVec 32) List!27477) Bool)

(assert (=> b!1245392 (= lt!562925 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27474))))

(assert (= (and start!104230 res!830875) b!1245392))

(declare-fun m!1147469 () Bool)

(assert (=> start!104230 m!1147469))

(declare-fun m!1147471 () Bool)

(assert (=> b!1245392 m!1147471))

(push 1)

(assert (not start!104230))

(assert (not b!1245392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

