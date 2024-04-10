; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104128 () Bool)

(assert start!104128)

(declare-fun res!830580 () Bool)

(declare-fun e!705854 () Bool)

(assert (=> start!104128 (=> (not res!830580) (not e!705854))))

(declare-datatypes ((array!80113 0))(
  ( (array!80114 (arr!38644 (Array (_ BitVec 32) (_ BitVec 64))) (size!39180 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80113)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104128 (= res!830580 (and (bvslt (size!39180 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39180 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39180 a!3892))))))

(assert (=> start!104128 e!705854))

(declare-fun array_inv!29492 (array!80113) Bool)

(assert (=> start!104128 (array_inv!29492 a!3892)))

(assert (=> start!104128 true))

(declare-fun b!1245061 () Bool)

(declare-fun res!830581 () Bool)

(assert (=> b!1245061 (=> (not res!830581) (not e!705854))))

(declare-datatypes ((List!27447 0))(
  ( (Nil!27444) (Cons!27443 (h!28652 (_ BitVec 64)) (t!40916 List!27447)) )
))
(declare-fun arrayNoDuplicates!0 (array!80113 (_ BitVec 32) List!27447) Bool)

(assert (=> b!1245061 (= res!830581 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27444))))

(declare-fun b!1245062 () Bool)

(assert (=> b!1245062 (= e!705854 (and (= from!3270 newFrom!287) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104128 res!830580) b!1245061))

(assert (= (and b!1245061 res!830581) b!1245062))

(declare-fun m!1147211 () Bool)

(assert (=> start!104128 m!1147211))

(declare-fun m!1147213 () Bool)

(assert (=> b!1245061 m!1147213))

(push 1)

(assert (not start!104128))

(assert (not b!1245061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

