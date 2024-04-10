; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136762 () Bool)

(assert start!136762)

(declare-fun b!1578588 () Bool)

(declare-fun res!1078527 () Bool)

(declare-fun e!880486 () Bool)

(assert (=> b!1578588 (=> (not res!1078527) (not e!880486))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105760 0))(
  ( (array!105761 (arr!50990 (Array (_ BitVec 32) (_ BitVec 64))) (size!51540 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105760)

(declare-fun arrayContainsKey!0 (array!105760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578588 (= res!1078527 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578589 () Bool)

(declare-fun res!1078530 () Bool)

(assert (=> b!1578589 (=> (not res!1078530) (not e!880486))))

(assert (=> b!1578589 (= res!1078530 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51540 a!3559))))))

(declare-fun res!1078528 () Bool)

(assert (=> start!136762 (=> (not res!1078528) (not e!880486))))

(assert (=> start!136762 (= res!1078528 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51540 a!3559)) (bvslt (size!51540 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136762 e!880486))

(assert (=> start!136762 true))

(declare-fun array_inv!39717 (array!105760) Bool)

(assert (=> start!136762 (array_inv!39717 a!3559)))

(declare-fun b!1578591 () Bool)

(assert (=> b!1578591 (= e!880486 (not (bvslt #b00000000000000000000000000000000 (size!51540 a!3559))))))

(assert (=> b!1578591 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52182 0))(
  ( (Unit!52183) )
))
(declare-fun lt!676309 () Unit!52182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105760 (_ BitVec 64) (_ BitVec 32)) Unit!52182)

(assert (=> b!1578591 (= lt!676309 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578590 () Bool)

(declare-fun res!1078529 () Bool)

(assert (=> b!1578590 (=> (not res!1078529) (not e!880486))))

(assert (=> b!1578590 (= res!1078529 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136762 res!1078528) b!1578588))

(assert (= (and b!1578588 res!1078527) b!1578589))

(assert (= (and b!1578589 res!1078530) b!1578590))

(assert (= (and b!1578590 res!1078529) b!1578591))

(declare-fun m!1450661 () Bool)

(assert (=> b!1578588 m!1450661))

(declare-fun m!1450663 () Bool)

(assert (=> start!136762 m!1450663))

(declare-fun m!1450665 () Bool)

(assert (=> b!1578591 m!1450665))

(declare-fun m!1450667 () Bool)

(assert (=> b!1578591 m!1450667))

(declare-fun m!1450669 () Bool)

(assert (=> b!1578590 m!1450669))

(check-sat (not b!1578591) (not start!136762) (not b!1578590) (not b!1578588))
(check-sat)
