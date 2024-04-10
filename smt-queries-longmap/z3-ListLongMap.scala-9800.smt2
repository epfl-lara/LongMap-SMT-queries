; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116452 () Bool)

(assert start!116452)

(declare-fun b!1373895 () Bool)

(declare-fun res!917080 () Bool)

(declare-fun e!778326 () Bool)

(assert (=> b!1373895 (=> (not res!917080) (not e!778326))))

(declare-datatypes ((array!93152 0))(
  ( (array!93153 (arr!44982 (Array (_ BitVec 32) (_ BitVec 64))) (size!45532 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93152)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373895 (= res!917080 (and (bvslt (size!45532 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45532 a!4142))))))

(declare-fun b!1373893 () Bool)

(declare-fun res!917079 () Bool)

(assert (=> b!1373893 (=> (not res!917079) (not e!778326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373893 (= res!917079 (validKeyInArray!0 (select (arr!44982 a!4142) i!1457)))))

(declare-fun b!1373896 () Bool)

(assert (=> b!1373896 (= e!778326 false)))

(declare-fun lt!603135 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93152 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373896 (= lt!603135 (arrayCountValidKeys!0 (array!93153 (store (arr!44982 a!4142) i!1457 k0!2959) (size!45532 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603136 () (_ BitVec 32))

(assert (=> b!1373896 (= lt!603136 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917077 () Bool)

(assert (=> start!116452 (=> (not res!917077) (not e!778326))))

(assert (=> start!116452 (= res!917077 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45532 a!4142))))))

(assert (=> start!116452 e!778326))

(assert (=> start!116452 true))

(declare-fun array_inv!34010 (array!93152) Bool)

(assert (=> start!116452 (array_inv!34010 a!4142)))

(declare-fun b!1373894 () Bool)

(declare-fun res!917078 () Bool)

(assert (=> b!1373894 (=> (not res!917078) (not e!778326))))

(assert (=> b!1373894 (= res!917078 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116452 res!917077) b!1373893))

(assert (= (and b!1373893 res!917079) b!1373894))

(assert (= (and b!1373894 res!917078) b!1373895))

(assert (= (and b!1373895 res!917080) b!1373896))

(declare-fun m!1257075 () Bool)

(assert (=> b!1373893 m!1257075))

(assert (=> b!1373893 m!1257075))

(declare-fun m!1257077 () Bool)

(assert (=> b!1373893 m!1257077))

(declare-fun m!1257079 () Bool)

(assert (=> b!1373896 m!1257079))

(declare-fun m!1257081 () Bool)

(assert (=> b!1373896 m!1257081))

(declare-fun m!1257083 () Bool)

(assert (=> b!1373896 m!1257083))

(declare-fun m!1257085 () Bool)

(assert (=> start!116452 m!1257085))

(declare-fun m!1257087 () Bool)

(assert (=> b!1373894 m!1257087))

(check-sat (not start!116452) (not b!1373896) (not b!1373894) (not b!1373893))
