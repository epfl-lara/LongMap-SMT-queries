; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104190 () Bool)

(assert start!104190)

(declare-fun res!830781 () Bool)

(declare-fun e!706055 () Bool)

(assert (=> start!104190 (=> (not res!830781) (not e!706055))))

(declare-datatypes ((array!80139 0))(
  ( (array!80140 (arr!38654 (Array (_ BitVec 32) (_ BitVec 64))) (size!39190 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80139)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104190 (= res!830781 (and (bvslt (size!39190 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39190 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39190 a!3892))))))

(assert (=> start!104190 e!706055))

(declare-fun array_inv!29502 (array!80139) Bool)

(assert (=> start!104190 (array_inv!29502 a!3892)))

(assert (=> start!104190 true))

(declare-fun b!1245298 () Bool)

(declare-fun res!830782 () Bool)

(assert (=> b!1245298 (=> (not res!830782) (not e!706055))))

(declare-datatypes ((List!27457 0))(
  ( (Nil!27454) (Cons!27453 (h!28662 (_ BitVec 64)) (t!40926 List!27457)) )
))
(declare-fun arrayNoDuplicates!0 (array!80139 (_ BitVec 32) List!27457) Bool)

(assert (=> b!1245298 (= res!830782 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27454))))

(declare-fun b!1245299 () Bool)

(assert (=> b!1245299 (= e!706055 (and (not (= from!3270 newFrom!287)) (bvsge from!3270 (size!39190 a!3892))))))

(assert (= (and start!104190 res!830781) b!1245298))

(assert (= (and b!1245298 res!830782) b!1245299))

(declare-fun m!1147377 () Bool)

(assert (=> start!104190 m!1147377))

(declare-fun m!1147379 () Bool)

(assert (=> b!1245298 m!1147379))

(push 1)

(assert (not b!1245298))

(assert (not start!104190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

