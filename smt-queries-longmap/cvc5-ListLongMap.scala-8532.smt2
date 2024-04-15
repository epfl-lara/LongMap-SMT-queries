; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104064 () Bool)

(assert start!104064)

(declare-fun res!830337 () Bool)

(declare-fun e!705614 () Bool)

(assert (=> start!104064 (=> (not res!830337) (not e!705614))))

(declare-datatypes ((array!80010 0))(
  ( (array!80011 (arr!38596 (Array (_ BitVec 32) (_ BitVec 64))) (size!39134 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80010)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104064 (= res!830337 (and (bvslt (size!39134 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39134 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39134 a!3892))))))

(assert (=> start!104064 e!705614))

(declare-fun array_inv!29579 (array!80010) Bool)

(assert (=> start!104064 (array_inv!29579 a!3892)))

(assert (=> start!104064 true))

(declare-fun b!1244740 () Bool)

(assert (=> b!1244740 (= e!705614 false)))

(declare-fun lt!562668 () Bool)

(declare-datatypes ((List!27500 0))(
  ( (Nil!27497) (Cons!27496 (h!28705 (_ BitVec 64)) (t!40960 List!27500)) )
))
(declare-fun arrayNoDuplicates!0 (array!80010 (_ BitVec 32) List!27500) Bool)

(assert (=> b!1244740 (= lt!562668 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27497))))

(assert (= (and start!104064 res!830337) b!1244740))

(declare-fun m!1146527 () Bool)

(assert (=> start!104064 m!1146527))

(declare-fun m!1146529 () Bool)

(assert (=> b!1244740 m!1146529))

(push 1)

(assert (not b!1244740))

(assert (not start!104064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

