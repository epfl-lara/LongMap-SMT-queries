; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116560 () Bool)

(assert start!116560)

(declare-fun res!917811 () Bool)

(declare-fun e!778740 () Bool)

(assert (=> start!116560 (=> (not res!917811) (not e!778740))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93260 0))(
  ( (array!93261 (arr!45036 (Array (_ BitVec 32) (_ BitVec 64))) (size!45586 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93260)

(assert (=> start!116560 (= res!917811 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45586 a!4142))))))

(assert (=> start!116560 e!778740))

(assert (=> start!116560 true))

(declare-fun array_inv!34064 (array!93260) Bool)

(assert (=> start!116560 (array_inv!34064 a!4142)))

(declare-fun b!1374626 () Bool)

(declare-fun res!917812 () Bool)

(assert (=> b!1374626 (=> (not res!917812) (not e!778740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374626 (= res!917812 (validKeyInArray!0 (select (arr!45036 a!4142) i!1457)))))

(declare-fun b!1374627 () Bool)

(declare-fun res!917810 () Bool)

(assert (=> b!1374627 (=> (not res!917810) (not e!778740))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374627 (= res!917810 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374628 () Bool)

(assert (=> b!1374628 (= e!778740 (and (bvslt (size!45586 a!4142) #b01111111111111111111111111111111) (bvsgt i!1457 (size!45586 a!4142))))))

(assert (= (and start!116560 res!917811) b!1374626))

(assert (= (and b!1374626 res!917812) b!1374627))

(assert (= (and b!1374627 res!917810) b!1374628))

(declare-fun m!1258185 () Bool)

(assert (=> start!116560 m!1258185))

(declare-fun m!1258187 () Bool)

(assert (=> b!1374626 m!1258187))

(assert (=> b!1374626 m!1258187))

(declare-fun m!1258189 () Bool)

(assert (=> b!1374626 m!1258189))

(declare-fun m!1258191 () Bool)

(assert (=> b!1374627 m!1258191))

(check-sat (not b!1374627) (not b!1374626) (not start!116560))
(check-sat)
