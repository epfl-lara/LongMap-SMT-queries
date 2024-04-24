; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93746 () Bool)

(assert start!93746)

(declare-fun res!707887 () Bool)

(declare-fun e!603294 () Bool)

(assert (=> start!93746 (=> (not res!707887) (not e!603294))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66848 0))(
  ( (array!66849 (arr!32134 (Array (_ BitVec 32) (_ BitVec 64))) (size!32671 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66848)

(assert (=> start!93746 (= res!707887 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32671 a!3475)) (bvslt (size!32671 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93746 e!603294))

(assert (=> start!93746 true))

(declare-fun array_inv!24916 (array!66848) Bool)

(assert (=> start!93746 (array_inv!24916 a!3475)))

(declare-fun b!1060118 () Bool)

(declare-fun res!707888 () Bool)

(assert (=> b!1060118 (=> (not res!707888) (not e!603294))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060118 (= res!707888 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1060119 () Bool)

(assert (=> b!1060119 (= e!603294 (bvslt (bvsub (size!32671 a!3475) from!2850) #b00000000000000000000000000000000))))

(assert (= (and start!93746 res!707887) b!1060118))

(assert (= (and b!1060118 res!707888) b!1060119))

(declare-fun m!980107 () Bool)

(assert (=> start!93746 m!980107))

(declare-fun m!980109 () Bool)

(assert (=> b!1060118 m!980109))

(check-sat (not b!1060118) (not start!93746))
(check-sat)
