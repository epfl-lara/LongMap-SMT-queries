; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93524 () Bool)

(assert start!93524)

(declare-fun res!707414 () Bool)

(declare-fun e!602482 () Bool)

(assert (=> start!93524 (=> (not res!707414) (not e!602482))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66814 0))(
  ( (array!66815 (arr!32123 (Array (_ BitVec 32) (_ BitVec 64))) (size!32659 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66814)

(assert (=> start!93524 (= res!707414 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32659 a!3475)) (bvslt (size!32659 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93524 e!602482))

(assert (=> start!93524 true))

(declare-fun array_inv!24903 (array!66814) Bool)

(assert (=> start!93524 (array_inv!24903 a!3475)))

(declare-fun b!1058838 () Bool)

(declare-fun res!707412 () Bool)

(assert (=> b!1058838 (=> (not res!707412) (not e!602482))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058838 (= res!707412 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058839 () Bool)

(declare-fun res!707413 () Bool)

(assert (=> b!1058839 (=> (not res!707413) (not e!602482))))

(assert (=> b!1058839 (= res!707413 (not (= (select (arr!32123 a!3475) from!2850) k0!2741)))))

(declare-fun b!1058840 () Bool)

(assert (=> b!1058840 (= e!602482 false)))

(declare-fun lt!467046 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66814 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058840 (= lt!467046 (arrayScanForKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93524 res!707414) b!1058838))

(assert (= (and b!1058838 res!707412) b!1058839))

(assert (= (and b!1058839 res!707413) b!1058840))

(declare-fun m!978473 () Bool)

(assert (=> start!93524 m!978473))

(declare-fun m!978475 () Bool)

(assert (=> b!1058838 m!978475))

(declare-fun m!978477 () Bool)

(assert (=> b!1058839 m!978477))

(declare-fun m!978479 () Bool)

(assert (=> b!1058840 m!978479))

(check-sat (not start!93524) (not b!1058840) (not b!1058838))
