; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92860 () Bool)

(assert start!92860)

(declare-fun res!702695 () Bool)

(declare-fun e!598860 () Bool)

(assert (=> start!92860 (=> (not res!702695) (not e!598860))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66449 0))(
  ( (array!66450 (arr!31956 (Array (_ BitVec 32) (_ BitVec 64))) (size!32493 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66449)

(assert (=> start!92860 (= res!702695 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32493 a!3488)) (bvslt (size!32493 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92860 e!598860))

(assert (=> start!92860 true))

(declare-fun array_inv!24738 (array!66449) Bool)

(assert (=> start!92860 (array_inv!24738 a!3488)))

(declare-fun b!1054410 () Bool)

(assert (=> b!1054410 (= e!598860 false)))

(declare-fun lt!465560 () Bool)

(declare-datatypes ((List!22238 0))(
  ( (Nil!22235) (Cons!22234 (h!23452 (_ BitVec 64)) (t!31537 List!22238)) )
))
(declare-fun arrayNoDuplicates!0 (array!66449 (_ BitVec 32) List!22238) Bool)

(assert (=> b!1054410 (= lt!465560 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22235))))

(assert (= (and start!92860 res!702695) b!1054410))

(declare-fun m!975127 () Bool)

(assert (=> start!92860 m!975127))

(declare-fun m!975129 () Bool)

(assert (=> b!1054410 m!975129))

(push 1)

(assert (not start!92860))

(assert (not b!1054410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

