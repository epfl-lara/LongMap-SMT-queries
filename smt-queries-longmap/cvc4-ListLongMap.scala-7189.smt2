; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92140 () Bool)

(assert start!92140)

(declare-fun res!697184 () Bool)

(declare-fun e!594321 () Bool)

(assert (=> start!92140 (=> (not res!697184) (not e!594321))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65992 0))(
  ( (array!65993 (arr!31740 (Array (_ BitVec 32) (_ BitVec 64))) (size!32276 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65992)

(assert (=> start!92140 (= res!697184 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32276 a!3488)) (bvslt (size!32276 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32276 a!3488))))))

(assert (=> start!92140 e!594321))

(assert (=> start!92140 true))

(declare-fun array_inv!24520 (array!65992) Bool)

(assert (=> start!92140 (array_inv!24520 a!3488)))

(declare-fun b!1048022 () Bool)

(declare-datatypes ((List!22052 0))(
  ( (Nil!22049) (Cons!22048 (h!23257 (_ BitVec 64)) (t!31359 List!22052)) )
))
(declare-fun noDuplicate!1487 (List!22052) Bool)

(assert (=> b!1048022 (= e!594321 (not (noDuplicate!1487 Nil!22049)))))

(assert (= (and start!92140 res!697184) b!1048022))

(declare-fun m!969065 () Bool)

(assert (=> start!92140 m!969065))

(declare-fun m!969067 () Bool)

(assert (=> b!1048022 m!969067))

(push 1)

(assert (not start!92140))

(assert (not b!1048022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

