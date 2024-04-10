; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104212 () Bool)

(assert start!104212)

(declare-fun res!830821 () Bool)

(declare-fun e!706121 () Bool)

(assert (=> start!104212 (=> (not res!830821) (not e!706121))))

(declare-datatypes ((array!80161 0))(
  ( (array!80162 (arr!38665 (Array (_ BitVec 32) (_ BitVec 64))) (size!39201 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80161)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104212 (= res!830821 (and (bvslt (size!39201 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39201 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39201 a!3892))))))

(assert (=> start!104212 e!706121))

(declare-fun array_inv!29513 (array!80161) Bool)

(assert (=> start!104212 (array_inv!29513 a!3892)))

(assert (=> start!104212 true))

(declare-fun b!1245338 () Bool)

(assert (=> b!1245338 (= e!706121 false)))

(declare-fun lt!562907 () Bool)

(declare-datatypes ((List!27468 0))(
  ( (Nil!27465) (Cons!27464 (h!28673 (_ BitVec 64)) (t!40937 List!27468)) )
))
(declare-fun arrayNoDuplicates!0 (array!80161 (_ BitVec 32) List!27468) Bool)

(assert (=> b!1245338 (= lt!562907 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27465))))

(assert (= (and start!104212 res!830821) b!1245338))

(declare-fun m!1147421 () Bool)

(assert (=> start!104212 m!1147421))

(declare-fun m!1147423 () Bool)

(assert (=> b!1245338 m!1147423))

(push 1)

(assert (not start!104212))

(assert (not b!1245338))

(check-sat)

