; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93510 () Bool)

(assert start!93510)

(declare-fun res!707314 () Bool)

(declare-fun e!602364 () Bool)

(assert (=> start!93510 (=> (not res!707314) (not e!602364))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66743 0))(
  ( (array!66744 (arr!32088 (Array (_ BitVec 32) (_ BitVec 64))) (size!32626 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66743)

(assert (=> start!93510 (= res!707314 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32626 a!3475)) (bvslt (size!32626 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93510 e!602364))

(assert (=> start!93510 true))

(declare-fun array_inv!24871 (array!66743) Bool)

(assert (=> start!93510 (array_inv!24871 a!3475)))

(declare-fun b!1058656 () Bool)

(declare-fun res!707315 () Bool)

(assert (=> b!1058656 (=> (not res!707315) (not e!602364))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058656 (= res!707315 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058657 () Bool)

(assert (=> b!1058657 (= e!602364 (and (not (= (select (arr!32088 a!3475) from!2850) k0!2741)) (bvsge (bvsub (size!32626 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) (bvsub (size!32626 a!3475) from!2850))))))

(assert (= (and start!93510 res!707314) b!1058656))

(assert (= (and b!1058656 res!707315) b!1058657))

(declare-fun m!977821 () Bool)

(assert (=> start!93510 m!977821))

(declare-fun m!977823 () Bool)

(assert (=> b!1058656 m!977823))

(declare-fun m!977825 () Bool)

(assert (=> b!1058657 m!977825))

(check-sat (not b!1058656) (not start!93510))
(check-sat)
