; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116458 () Bool)

(assert start!116458)

(declare-fun b!1373932 () Bool)

(declare-fun e!778345 () Bool)

(assert (=> b!1373932 (= e!778345 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93158 0))(
  ( (array!93159 (arr!44985 (Array (_ BitVec 32) (_ BitVec 64))) (size!45535 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93158)

(declare-fun lt!603154 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93158 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373932 (= lt!603154 (arrayCountValidKeys!0 (array!93159 (store (arr!44985 a!4142) i!1457 k0!2959) (size!45535 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603153 () (_ BitVec 32))

(assert (=> b!1373932 (= lt!603153 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373929 () Bool)

(declare-fun res!917115 () Bool)

(assert (=> b!1373929 (=> (not res!917115) (not e!778345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373929 (= res!917115 (validKeyInArray!0 (select (arr!44985 a!4142) i!1457)))))

(declare-fun b!1373931 () Bool)

(declare-fun res!917113 () Bool)

(assert (=> b!1373931 (=> (not res!917113) (not e!778345))))

(assert (=> b!1373931 (= res!917113 (and (bvslt (size!45535 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45535 a!4142))))))

(declare-fun res!917116 () Bool)

(assert (=> start!116458 (=> (not res!917116) (not e!778345))))

(assert (=> start!116458 (= res!917116 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45535 a!4142))))))

(assert (=> start!116458 e!778345))

(assert (=> start!116458 true))

(declare-fun array_inv!34013 (array!93158) Bool)

(assert (=> start!116458 (array_inv!34013 a!4142)))

(declare-fun b!1373930 () Bool)

(declare-fun res!917114 () Bool)

(assert (=> b!1373930 (=> (not res!917114) (not e!778345))))

(assert (=> b!1373930 (= res!917114 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116458 res!917116) b!1373929))

(assert (= (and b!1373929 res!917115) b!1373930))

(assert (= (and b!1373930 res!917114) b!1373931))

(assert (= (and b!1373931 res!917113) b!1373932))

(declare-fun m!1257117 () Bool)

(assert (=> b!1373932 m!1257117))

(declare-fun m!1257119 () Bool)

(assert (=> b!1373932 m!1257119))

(declare-fun m!1257121 () Bool)

(assert (=> b!1373932 m!1257121))

(declare-fun m!1257123 () Bool)

(assert (=> b!1373929 m!1257123))

(assert (=> b!1373929 m!1257123))

(declare-fun m!1257125 () Bool)

(assert (=> b!1373929 m!1257125))

(declare-fun m!1257127 () Bool)

(assert (=> start!116458 m!1257127))

(declare-fun m!1257129 () Bool)

(assert (=> b!1373930 m!1257129))

(check-sat (not b!1373932) (not b!1373930) (not b!1373929) (not start!116458))
