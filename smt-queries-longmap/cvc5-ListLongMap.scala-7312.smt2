; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93476 () Bool)

(assert start!93476)

(declare-fun res!707218 () Bool)

(declare-fun e!602276 () Bool)

(assert (=> start!93476 (=> (not res!707218) (not e!602276))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66720 0))(
  ( (array!66721 (arr!32078 (Array (_ BitVec 32) (_ BitVec 64))) (size!32616 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66720)

(assert (=> start!93476 (= res!707218 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32616 a!3488)) (bvslt (size!32616 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93476 e!602276))

(assert (=> start!93476 true))

(declare-fun array_inv!24861 (array!66720) Bool)

(assert (=> start!93476 (array_inv!24861 a!3488)))

(declare-fun b!1058560 () Bool)

(assert (=> b!1058560 (= e!602276 false)))

(declare-fun lt!466840 () Bool)

(declare-datatypes ((List!22449 0))(
  ( (Nil!22446) (Cons!22445 (h!23654 (_ BitVec 64)) (t!31747 List!22449)) )
))
(declare-fun arrayNoDuplicates!0 (array!66720 (_ BitVec 32) List!22449) Bool)

(assert (=> b!1058560 (= lt!466840 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22446))))

(assert (= (and start!93476 res!707218) b!1058560))

(declare-fun m!977749 () Bool)

(assert (=> start!93476 m!977749))

(declare-fun m!977751 () Bool)

(assert (=> b!1058560 m!977751))

(push 1)

(assert (not start!93476))

(assert (not b!1058560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

