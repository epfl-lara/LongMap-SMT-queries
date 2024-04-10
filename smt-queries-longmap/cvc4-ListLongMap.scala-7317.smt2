; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93526 () Bool)

(assert start!93526)

(declare-fun res!707421 () Bool)

(declare-fun e!602488 () Bool)

(assert (=> start!93526 (=> (not res!707421) (not e!602488))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66816 0))(
  ( (array!66817 (arr!32124 (Array (_ BitVec 32) (_ BitVec 64))) (size!32660 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66816)

(assert (=> start!93526 (= res!707421 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32660 a!3475)) (bvslt (size!32660 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93526 e!602488))

(assert (=> start!93526 true))

(declare-fun array_inv!24904 (array!66816) Bool)

(assert (=> start!93526 (array_inv!24904 a!3475)))

(declare-fun b!1058847 () Bool)

(declare-fun res!707423 () Bool)

(assert (=> b!1058847 (=> (not res!707423) (not e!602488))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058847 (= res!707423 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058848 () Bool)

(declare-fun res!707422 () Bool)

(assert (=> b!1058848 (=> (not res!707422) (not e!602488))))

(assert (=> b!1058848 (= res!707422 (not (= (select (arr!32124 a!3475) from!2850) k!2741)))))

(declare-fun b!1058849 () Bool)

(assert (=> b!1058849 (= e!602488 false)))

(declare-fun lt!467049 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66816 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058849 (= lt!467049 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93526 res!707421) b!1058847))

(assert (= (and b!1058847 res!707423) b!1058848))

(assert (= (and b!1058848 res!707422) b!1058849))

(declare-fun m!978481 () Bool)

(assert (=> start!93526 m!978481))

(declare-fun m!978483 () Bool)

(assert (=> b!1058847 m!978483))

(declare-fun m!978485 () Bool)

(assert (=> b!1058848 m!978485))

(declare-fun m!978487 () Bool)

(assert (=> b!1058849 m!978487))

(push 1)

(assert (not start!93526))

(assert (not b!1058849))

(assert (not b!1058847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

