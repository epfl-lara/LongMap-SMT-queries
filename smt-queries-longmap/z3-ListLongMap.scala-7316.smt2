; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93752 () Bool)

(assert start!93752)

(declare-fun res!707905 () Bool)

(declare-fun e!603312 () Bool)

(assert (=> start!93752 (=> (not res!707905) (not e!603312))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66854 0))(
  ( (array!66855 (arr!32137 (Array (_ BitVec 32) (_ BitVec 64))) (size!32674 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66854)

(assert (=> start!93752 (= res!707905 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32674 a!3475)) (bvslt (size!32674 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93752 e!603312))

(assert (=> start!93752 true))

(declare-fun array_inv!24919 (array!66854) Bool)

(assert (=> start!93752 (array_inv!24919 a!3475)))

(declare-fun b!1060136 () Bool)

(declare-fun res!707906 () Bool)

(assert (=> b!1060136 (=> (not res!707906) (not e!603312))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060136 (= res!707906 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1060137 () Bool)

(assert (=> b!1060137 (= e!603312 (and (not (= (select (arr!32137 a!3475) from!2850) k0!2741)) (bvsge (bvsub (size!32674 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) (bvsub (size!32674 a!3475) from!2850))))))

(assert (= (and start!93752 res!707905) b!1060136))

(assert (= (and b!1060136 res!707906) b!1060137))

(declare-fun m!980119 () Bool)

(assert (=> start!93752 m!980119))

(declare-fun m!980121 () Bool)

(assert (=> b!1060136 m!980121))

(declare-fun m!980123 () Bool)

(assert (=> b!1060137 m!980123))

(check-sat (not start!93752) (not b!1060136))
(check-sat)
