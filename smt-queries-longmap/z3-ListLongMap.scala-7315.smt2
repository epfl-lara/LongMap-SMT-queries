; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93504 () Bool)

(assert start!93504)

(declare-fun res!707296 () Bool)

(declare-fun e!602346 () Bool)

(assert (=> start!93504 (=> (not res!707296) (not e!602346))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66737 0))(
  ( (array!66738 (arr!32085 (Array (_ BitVec 32) (_ BitVec 64))) (size!32623 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66737)

(assert (=> start!93504 (= res!707296 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32623 a!3475)) (bvslt (size!32623 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93504 e!602346))

(assert (=> start!93504 true))

(declare-fun array_inv!24868 (array!66737) Bool)

(assert (=> start!93504 (array_inv!24868 a!3475)))

(declare-fun b!1058638 () Bool)

(declare-fun res!707297 () Bool)

(assert (=> b!1058638 (=> (not res!707297) (not e!602346))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058638 (= res!707297 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058639 () Bool)

(assert (=> b!1058639 (= e!602346 (bvslt (bvsub (size!32623 a!3475) from!2850) #b00000000000000000000000000000000))))

(assert (= (and start!93504 res!707296) b!1058638))

(assert (= (and b!1058638 res!707297) b!1058639))

(declare-fun m!977809 () Bool)

(assert (=> start!93504 m!977809))

(declare-fun m!977811 () Bool)

(assert (=> b!1058638 m!977811))

(check-sat (not start!93504) (not b!1058638))
(check-sat)
