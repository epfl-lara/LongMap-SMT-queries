; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104218 () Bool)

(assert start!104218)

(declare-fun res!830830 () Bool)

(declare-fun e!706139 () Bool)

(assert (=> start!104218 (=> (not res!830830) (not e!706139))))

(declare-datatypes ((array!80167 0))(
  ( (array!80168 (arr!38668 (Array (_ BitVec 32) (_ BitVec 64))) (size!39204 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80167)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104218 (= res!830830 (and (bvslt (size!39204 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39204 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39204 a!3892))))))

(assert (=> start!104218 e!706139))

(declare-fun array_inv!29516 (array!80167) Bool)

(assert (=> start!104218 (array_inv!29516 a!3892)))

(assert (=> start!104218 true))

(declare-fun b!1245347 () Bool)

(assert (=> b!1245347 (= e!706139 false)))

(declare-fun lt!562916 () Bool)

(declare-datatypes ((List!27471 0))(
  ( (Nil!27468) (Cons!27467 (h!28676 (_ BitVec 64)) (t!40940 List!27471)) )
))
(declare-fun arrayNoDuplicates!0 (array!80167 (_ BitVec 32) List!27471) Bool)

(assert (=> b!1245347 (= lt!562916 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27468))))

(assert (= (and start!104218 res!830830) b!1245347))

(declare-fun m!1147433 () Bool)

(assert (=> start!104218 m!1147433))

(declare-fun m!1147435 () Bool)

(assert (=> b!1245347 m!1147435))

(push 1)

(assert (not start!104218))

(assert (not b!1245347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

