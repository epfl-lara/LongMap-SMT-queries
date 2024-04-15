; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136738 () Bool)

(assert start!136738)

(declare-fun res!1078454 () Bool)

(declare-fun e!880318 () Bool)

(assert (=> start!136738 (=> (not res!1078454) (not e!880318))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105701 0))(
  ( (array!105702 (arr!50960 (Array (_ BitVec 32) (_ BitVec 64))) (size!51512 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105701)

(assert (=> start!136738 (= res!1078454 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51512 a!3559)) (bvslt (size!51512 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136738 e!880318))

(assert (=> start!136738 true))

(declare-fun array_inv!39896 (array!105701) Bool)

(assert (=> start!136738 (array_inv!39896 a!3559)))

(declare-fun b!1578331 () Bool)

(declare-fun res!1078455 () Bool)

(assert (=> b!1578331 (=> (not res!1078455) (not e!880318))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578331 (= res!1078455 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578332 () Bool)

(assert (=> b!1578332 (= e!880318 (and (bvsle from!2937 #b00000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!51512 a!3559))))))

(assert (= (and start!136738 res!1078454) b!1578331))

(assert (= (and b!1578331 res!1078455) b!1578332))

(declare-fun m!1449831 () Bool)

(assert (=> start!136738 m!1449831))

(declare-fun m!1449833 () Bool)

(assert (=> b!1578331 m!1449833))

(check-sat (not start!136738) (not b!1578331))
(check-sat)
