; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104224 () Bool)

(assert start!104224)

(declare-fun b!1245383 () Bool)

(declare-fun e!706157 () Bool)

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245383 (= e!706157 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun res!830866 () Bool)

(assert (=> start!104224 (=> (not res!830866) (not e!706157))))

(declare-datatypes ((array!80173 0))(
  ( (array!80174 (arr!38671 (Array (_ BitVec 32) (_ BitVec 64))) (size!39207 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80173)

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104224 (= res!830866 (and (bvslt (size!39207 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39207 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39207 a!3892))))))

(assert (=> start!104224 e!706157))

(declare-fun array_inv!29519 (array!80173) Bool)

(assert (=> start!104224 (array_inv!29519 a!3892)))

(assert (=> start!104224 true))

(declare-fun b!1245380 () Bool)

(declare-fun res!830863 () Bool)

(assert (=> b!1245380 (=> (not res!830863) (not e!706157))))

(declare-datatypes ((List!27474 0))(
  ( (Nil!27471) (Cons!27470 (h!28679 (_ BitVec 64)) (t!40943 List!27474)) )
))
(declare-fun arrayNoDuplicates!0 (array!80173 (_ BitVec 32) List!27474) Bool)

(assert (=> b!1245380 (= res!830863 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27471))))

(declare-fun b!1245382 () Bool)

(declare-fun res!830864 () Bool)

(assert (=> b!1245382 (=> (not res!830864) (not e!706157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245382 (= res!830864 (validKeyInArray!0 (select (arr!38671 a!3892) from!3270)))))

(declare-fun b!1245381 () Bool)

(declare-fun res!830865 () Bool)

(assert (=> b!1245381 (=> (not res!830865) (not e!706157))))

(assert (=> b!1245381 (= res!830865 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39207 a!3892)) (not (= newFrom!287 (size!39207 a!3892)))))))

(assert (= (and start!104224 res!830866) b!1245380))

(assert (= (and b!1245380 res!830863) b!1245381))

(assert (= (and b!1245381 res!830865) b!1245382))

(assert (= (and b!1245382 res!830864) b!1245383))

(declare-fun m!1147453 () Bool)

(assert (=> start!104224 m!1147453))

(declare-fun m!1147455 () Bool)

(assert (=> b!1245380 m!1147455))

(declare-fun m!1147457 () Bool)

(assert (=> b!1245382 m!1147457))

(assert (=> b!1245382 m!1147457))

(declare-fun m!1147459 () Bool)

(assert (=> b!1245382 m!1147459))

(push 1)

(assert (not start!104224))

(assert (not b!1245380))

