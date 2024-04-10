; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117854 () Bool)

(assert start!117854)

(declare-fun b!1381369 () Bool)

(declare-fun e!783021 () Bool)

(declare-fun e!783022 () Bool)

(assert (=> b!1381369 (= e!783021 e!783022)))

(declare-fun res!922998 () Bool)

(assert (=> b!1381369 (=> res!922998 e!783022)))

(declare-datatypes ((List!32054 0))(
  ( (Nil!32051) (Cons!32050 (h!33259 (_ BitVec 64)) (t!46748 List!32054)) )
))
(declare-fun contains!9735 (List!32054 (_ BitVec 64)) Bool)

(assert (=> b!1381369 (= res!922998 (contains!9735 Nil!32051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381370 () Bool)

(declare-fun res!922999 () Bool)

(assert (=> b!1381370 (=> (not res!922999) (not e!783021))))

(declare-datatypes ((array!94272 0))(
  ( (array!94273 (arr!45520 (Array (_ BitVec 32) (_ BitVec 64))) (size!46070 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94272)

(assert (=> b!1381370 (= res!922999 (and (bvsle #b00000000000000000000000000000000 (size!46070 a!2971)) (bvslt (size!46070 a!2971) #b01111111111111111111111111111111)))))

(declare-fun b!1381371 () Bool)

(declare-fun res!922997 () Bool)

(assert (=> b!1381371 (=> (not res!922997) (not e!783021))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381371 (= res!922997 (and (= (size!46070 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46070 a!2971))))))

(declare-fun b!1381372 () Bool)

(declare-fun res!923000 () Bool)

(assert (=> b!1381372 (=> (not res!923000) (not e!783021))))

(declare-fun noDuplicate!2593 (List!32054) Bool)

(assert (=> b!1381372 (= res!923000 (noDuplicate!2593 Nil!32051))))

(declare-fun b!1381373 () Bool)

(declare-fun res!923001 () Bool)

(assert (=> b!1381373 (=> (not res!923001) (not e!783021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381373 (= res!923001 (validKeyInArray!0 (select (arr!45520 a!2971) i!1094)))))

(declare-fun b!1381374 () Bool)

(assert (=> b!1381374 (= e!783022 (contains!9735 Nil!32051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!923002 () Bool)

(assert (=> start!117854 (=> (not res!923002) (not e!783021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117854 (= res!923002 (validMask!0 mask!3034))))

(assert (=> start!117854 e!783021))

(assert (=> start!117854 true))

(declare-fun array_inv!34548 (array!94272) Bool)

(assert (=> start!117854 (array_inv!34548 a!2971)))

(assert (= (and start!117854 res!923002) b!1381371))

(assert (= (and b!1381371 res!922997) b!1381373))

(assert (= (and b!1381373 res!923001) b!1381370))

(assert (= (and b!1381370 res!922999) b!1381372))

(assert (= (and b!1381372 res!923000) b!1381369))

(assert (= (and b!1381369 (not res!922998)) b!1381374))

(declare-fun m!1266547 () Bool)

(assert (=> start!117854 m!1266547))

(declare-fun m!1266549 () Bool)

(assert (=> start!117854 m!1266549))

(declare-fun m!1266551 () Bool)

(assert (=> b!1381372 m!1266551))

(declare-fun m!1266553 () Bool)

(assert (=> b!1381374 m!1266553))

(declare-fun m!1266555 () Bool)

(assert (=> b!1381369 m!1266555))

(declare-fun m!1266557 () Bool)

(assert (=> b!1381373 m!1266557))

(assert (=> b!1381373 m!1266557))

(declare-fun m!1266559 () Bool)

(assert (=> b!1381373 m!1266559))

(push 1)

(assert (not b!1381369))

(assert (not start!117854))

(assert (not b!1381373))

(assert (not b!1381374))

(assert (not b!1381372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149081 () Bool)

(declare-fun res!923025 () Bool)

