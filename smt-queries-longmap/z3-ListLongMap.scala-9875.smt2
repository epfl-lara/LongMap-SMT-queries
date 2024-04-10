; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116938 () Bool)

(assert start!116938)

(declare-fun res!920385 () Bool)

(declare-fun e!780399 () Bool)

(assert (=> start!116938 (=> (not res!920385) (not e!780399))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93607 0))(
  ( (array!93608 (arr!45207 (Array (_ BitVec 32) (_ BitVec 64))) (size!45757 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93607)

(assert (=> start!116938 (= res!920385 (and (bvslt (size!45757 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45757 a!4212))))))

(assert (=> start!116938 e!780399))

(declare-fun array_inv!34235 (array!93607) Bool)

(assert (=> start!116938 (array_inv!34235 a!4212)))

(assert (=> start!116938 true))

(declare-fun b!1377663 () Bool)

(declare-fun res!920386 () Bool)

(assert (=> b!1377663 (=> (not res!920386) (not e!780399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377663 (= res!920386 (not (validKeyInArray!0 (select (arr!45207 a!4212) to!375))))))

(declare-fun b!1377664 () Bool)

(assert (=> b!1377664 (= e!780399 (or (bvslt (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsgt to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(assert (= (and start!116938 res!920385) b!1377663))

(assert (= (and b!1377663 res!920386) b!1377664))

(declare-fun m!1262057 () Bool)

(assert (=> start!116938 m!1262057))

(declare-fun m!1262059 () Bool)

(assert (=> b!1377663 m!1262059))

(assert (=> b!1377663 m!1262059))

(declare-fun m!1262061 () Bool)

(assert (=> b!1377663 m!1262061))

(check-sat (not start!116938) (not b!1377663))
(check-sat)
