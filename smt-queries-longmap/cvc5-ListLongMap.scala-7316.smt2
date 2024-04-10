; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93516 () Bool)

(assert start!93516)

(declare-fun res!707383 () Bool)

(declare-fun e!602457 () Bool)

(assert (=> start!93516 (=> (not res!707383) (not e!602457))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66806 0))(
  ( (array!66807 (arr!32119 (Array (_ BitVec 32) (_ BitVec 64))) (size!32655 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66806)

(assert (=> start!93516 (= res!707383 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32655 a!3475)) (bvslt (size!32655 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93516 e!602457))

(assert (=> start!93516 true))

(declare-fun array_inv!24899 (array!66806) Bool)

(assert (=> start!93516 (array_inv!24899 a!3475)))

(declare-fun b!1058809 () Bool)

(declare-fun res!707384 () Bool)

(assert (=> b!1058809 (=> (not res!707384) (not e!602457))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058809 (= res!707384 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058810 () Bool)

(assert (=> b!1058810 (= e!602457 (and (not (= (select (arr!32119 a!3475) from!2850) k!2741)) (bvsge (bvsub (size!32655 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) (bvsub (size!32655 a!3475) from!2850))))))

(assert (= (and start!93516 res!707383) b!1058809))

(assert (= (and b!1058809 res!707384) b!1058810))

(declare-fun m!978447 () Bool)

(assert (=> start!93516 m!978447))

(declare-fun m!978449 () Bool)

(assert (=> b!1058809 m!978449))

(declare-fun m!978451 () Bool)

(assert (=> b!1058810 m!978451))

(push 1)

(assert (not b!1058809))

(assert (not start!93516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

