; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93714 () Bool)

(assert start!93714)

(declare-fun res!707800 () Bool)

(declare-fun e!603216 () Bool)

(assert (=> start!93714 (=> (not res!707800) (not e!603216))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66832 0))(
  ( (array!66833 (arr!32128 (Array (_ BitVec 32) (_ BitVec 64))) (size!32665 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66832)

(assert (=> start!93714 (= res!707800 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32665 a!3475)) (bvslt (size!32665 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93714 e!603216))

(assert (=> start!93714 true))

(declare-fun array_inv!24910 (array!66832) Bool)

(assert (=> start!93714 (array_inv!24910 a!3475)))

(declare-fun b!1060031 () Bool)

(declare-fun res!707801 () Bool)

(assert (=> b!1060031 (=> (not res!707801) (not e!603216))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060031 (= res!707801 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1060032 () Bool)

(assert (=> b!1060032 (= e!603216 (and (not (= (select (arr!32128 a!3475) from!2850) k0!2741)) (or (bvslt (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) (size!32665 a!3475)))))))

(assert (= (and start!93714 res!707800) b!1060031))

(assert (= (and b!1060031 res!707801) b!1060032))

(declare-fun m!980045 () Bool)

(assert (=> start!93714 m!980045))

(declare-fun m!980047 () Bool)

(assert (=> b!1060031 m!980047))

(declare-fun m!980049 () Bool)

(assert (=> b!1060032 m!980049))

(check-sat (not start!93714) (not b!1060031))
(check-sat)
(get-model)

(declare-fun d!129081 () Bool)

(assert (=> d!129081 (= (array_inv!24910 a!3475) (bvsge (size!32665 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93714 d!129081))

(declare-fun d!129083 () Bool)

(declare-fun res!707818 () Bool)

(declare-fun e!603234 () Bool)

(assert (=> d!129083 (=> res!707818 e!603234)))

(assert (=> d!129083 (= res!707818 (= (select (arr!32128 a!3475) from!2850) k0!2741))))

(assert (=> d!129083 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!603234)))

(declare-fun b!1060049 () Bool)

(declare-fun e!603235 () Bool)

(assert (=> b!1060049 (= e!603234 e!603235)))

(declare-fun res!707819 () Bool)

(assert (=> b!1060049 (=> (not res!707819) (not e!603235))))

(assert (=> b!1060049 (= res!707819 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32665 a!3475)))))

(declare-fun b!1060050 () Bool)

(assert (=> b!1060050 (= e!603235 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!129083 (not res!707818)) b!1060049))

(assert (= (and b!1060049 res!707819) b!1060050))

(assert (=> d!129083 m!980049))

(declare-fun m!980063 () Bool)

(assert (=> b!1060050 m!980063))

(assert (=> b!1060031 d!129083))

(check-sat (not b!1060050))
(check-sat)
