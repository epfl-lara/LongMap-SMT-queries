; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93480 () Bool)

(assert start!93480)

(declare-fun res!707290 () Bool)

(declare-fun e!602373 () Bool)

(assert (=> start!93480 (=> (not res!707290) (not e!602373))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66783 0))(
  ( (array!66784 (arr!32110 (Array (_ BitVec 32) (_ BitVec 64))) (size!32646 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66783)

(assert (=> start!93480 (= res!707290 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32646 a!3475)) (bvslt (size!32646 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93480 e!602373))

(assert (=> start!93480 true))

(declare-fun array_inv!24890 (array!66783) Bool)

(assert (=> start!93480 (array_inv!24890 a!3475)))

(declare-fun b!1058716 () Bool)

(declare-fun res!707291 () Bool)

(assert (=> b!1058716 (=> (not res!707291) (not e!602373))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058716 (= res!707291 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058717 () Bool)

(assert (=> b!1058717 (= e!602373 (and (not (= (select (arr!32110 a!3475) from!2850) k!2741)) (or (bvslt (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) (size!32646 a!3475)))))))

(assert (= (and start!93480 res!707290) b!1058716))

(assert (= (and b!1058716 res!707291) b!1058717))

(declare-fun m!978377 () Bool)

(assert (=> start!93480 m!978377))

(declare-fun m!978379 () Bool)

(assert (=> b!1058716 m!978379))

(declare-fun m!978381 () Bool)

(assert (=> b!1058717 m!978381))

(push 1)

(assert (not start!93480))

(assert (not b!1058716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

