; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93468 () Bool)

(assert start!93468)

(declare-fun res!707206 () Bool)

(declare-fun e!602252 () Bool)

(assert (=> start!93468 (=> (not res!707206) (not e!602252))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66712 0))(
  ( (array!66713 (arr!32074 (Array (_ BitVec 32) (_ BitVec 64))) (size!32612 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66712)

(assert (=> start!93468 (= res!707206 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32612 a!3488)) (bvslt (size!32612 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93468 e!602252))

(assert (=> start!93468 true))

(declare-fun array_inv!24857 (array!66712) Bool)

(assert (=> start!93468 (array_inv!24857 a!3488)))

(declare-fun b!1058548 () Bool)

(assert (=> b!1058548 (= e!602252 false)))

(declare-fun lt!466828 () Bool)

(declare-datatypes ((List!22445 0))(
  ( (Nil!22442) (Cons!22441 (h!23650 (_ BitVec 64)) (t!31743 List!22445)) )
))
(declare-fun arrayNoDuplicates!0 (array!66712 (_ BitVec 32) List!22445) Bool)

(assert (=> b!1058548 (= lt!466828 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22442))))

(assert (= (and start!93468 res!707206) b!1058548))

(declare-fun m!977733 () Bool)

(assert (=> start!93468 m!977733))

(declare-fun m!977735 () Bool)

(assert (=> b!1058548 m!977735))

(push 1)

(assert (not start!93468))

(assert (not b!1058548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

