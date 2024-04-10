; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93512 () Bool)

(assert start!93512)

(declare-fun res!707371 () Bool)

(declare-fun e!602445 () Bool)

(assert (=> start!93512 (=> (not res!707371) (not e!602445))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66802 0))(
  ( (array!66803 (arr!32117 (Array (_ BitVec 32) (_ BitVec 64))) (size!32653 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66802)

(assert (=> start!93512 (= res!707371 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32653 a!3475)) (bvslt (size!32653 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93512 e!602445))

(assert (=> start!93512 true))

(declare-fun array_inv!24897 (array!66802) Bool)

(assert (=> start!93512 (array_inv!24897 a!3475)))

(declare-fun b!1058797 () Bool)

(declare-fun res!707372 () Bool)

(assert (=> b!1058797 (=> (not res!707372) (not e!602445))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058797 (= res!707372 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058798 () Bool)

(assert (=> b!1058798 (= e!602445 (bvslt (bvsub (size!32653 a!3475) from!2850) #b00000000000000000000000000000000))))

(assert (= (and start!93512 res!707371) b!1058797))

(assert (= (and b!1058797 res!707372) b!1058798))

(declare-fun m!978439 () Bool)

(assert (=> start!93512 m!978439))

(declare-fun m!978441 () Bool)

(assert (=> b!1058797 m!978441))

(check-sat (not b!1058797) (not start!93512))
(check-sat)
