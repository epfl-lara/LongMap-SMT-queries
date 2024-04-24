; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92706 () Bool)

(assert start!92706)

(declare-fun b!1052773 () Bool)

(declare-fun e!597707 () Bool)

(declare-fun e!597709 () Bool)

(assert (=> b!1052773 (= e!597707 e!597709)))

(declare-fun res!701102 () Bool)

(assert (=> b!1052773 (=> (not res!701102) (not e!597709))))

(declare-fun lt!464794 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052773 (= res!701102 (not (= lt!464794 i!1381)))))

(declare-datatypes ((array!66322 0))(
  ( (array!66323 (arr!31894 (Array (_ BitVec 32) (_ BitVec 64))) (size!32431 (_ BitVec 32))) )
))
(declare-fun lt!464795 () array!66322)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66322 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052773 (= lt!464794 (arrayScanForKey!0 lt!464795 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052774 () Bool)

(declare-fun res!701096 () Bool)

(declare-fun e!597710 () Bool)

(assert (=> b!1052774 (=> (not res!701096) (not e!597710))))

(declare-fun a!3488 () array!66322)

(assert (=> b!1052774 (= res!701096 (= (select (arr!31894 a!3488) i!1381) k0!2747))))

(declare-fun res!701095 () Bool)

(assert (=> start!92706 (=> (not res!701095) (not e!597710))))

(assert (=> start!92706 (= res!701095 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32431 a!3488)) (bvslt (size!32431 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92706 e!597710))

(assert (=> start!92706 true))

(declare-fun array_inv!24676 (array!66322) Bool)

(assert (=> start!92706 (array_inv!24676 a!3488)))

(declare-fun b!1052775 () Bool)

(declare-fun e!597706 () Bool)

(declare-fun arrayContainsKey!0 (array!66322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052775 (= e!597706 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052776 () Bool)

(declare-fun res!701098 () Bool)

(assert (=> b!1052776 (=> (not res!701098) (not e!597710))))

(declare-datatypes ((List!22176 0))(
  ( (Nil!22173) (Cons!22172 (h!23390 (_ BitVec 64)) (t!31475 List!22176)) )
))
(declare-fun arrayNoDuplicates!0 (array!66322 (_ BitVec 32) List!22176) Bool)

(assert (=> b!1052776 (= res!701098 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22173))))

(declare-fun b!1052777 () Bool)

(declare-fun e!597711 () Bool)

(assert (=> b!1052777 (= e!597711 e!597706)))

(declare-fun res!701100 () Bool)

(assert (=> b!1052777 (=> res!701100 e!597706)))

(assert (=> b!1052777 (= res!701100 (or (bvsgt lt!464794 i!1381) (bvsle i!1381 lt!464794)))))

(declare-fun b!1052778 () Bool)

(declare-fun e!597712 () Bool)

(assert (=> b!1052778 (= e!597712 true)))

(assert (=> b!1052778 (arrayNoDuplicates!0 a!3488 lt!464794 Nil!22173)))

(declare-datatypes ((Unit!34429 0))(
  ( (Unit!34430) )
))
(declare-fun lt!464793 () Unit!34429)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66322 (_ BitVec 32) (_ BitVec 32)) Unit!34429)

(assert (=> b!1052778 (= lt!464793 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464794))))

(declare-fun b!1052779 () Bool)

(declare-fun res!701101 () Bool)

(assert (=> b!1052779 (=> (not res!701101) (not e!597710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052779 (= res!701101 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052780 () Bool)

(assert (=> b!1052780 (= e!597710 e!597707)))

(declare-fun res!701097 () Bool)

(assert (=> b!1052780 (=> (not res!701097) (not e!597707))))

(assert (=> b!1052780 (= res!701097 (arrayContainsKey!0 lt!464795 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052780 (= lt!464795 (array!66323 (store (arr!31894 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32431 a!3488)))))

(declare-fun b!1052781 () Bool)

(assert (=> b!1052781 (= e!597709 (not e!597712))))

(declare-fun res!701094 () Bool)

(assert (=> b!1052781 (=> res!701094 e!597712)))

(assert (=> b!1052781 (= res!701094 (or (bvsgt lt!464794 i!1381) (bvsle i!1381 lt!464794)))))

(assert (=> b!1052781 e!597711))

(declare-fun res!701099 () Bool)

(assert (=> b!1052781 (=> (not res!701099) (not e!597711))))

(assert (=> b!1052781 (= res!701099 (= (select (store (arr!31894 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464794) k0!2747))))

(assert (= (and start!92706 res!701095) b!1052776))

(assert (= (and b!1052776 res!701098) b!1052779))

(assert (= (and b!1052779 res!701101) b!1052774))

(assert (= (and b!1052774 res!701096) b!1052780))

(assert (= (and b!1052780 res!701097) b!1052773))

(assert (= (and b!1052773 res!701102) b!1052781))

(assert (= (and b!1052781 res!701099) b!1052777))

(assert (= (and b!1052777 (not res!701100)) b!1052775))

(assert (= (and b!1052781 (not res!701094)) b!1052778))

(declare-fun m!973625 () Bool)

(assert (=> b!1052776 m!973625))

(declare-fun m!973627 () Bool)

(assert (=> b!1052775 m!973627))

(declare-fun m!973629 () Bool)

(assert (=> b!1052773 m!973629))

(declare-fun m!973631 () Bool)

(assert (=> start!92706 m!973631))

(declare-fun m!973633 () Bool)

(assert (=> b!1052781 m!973633))

(declare-fun m!973635 () Bool)

(assert (=> b!1052781 m!973635))

(declare-fun m!973637 () Bool)

(assert (=> b!1052780 m!973637))

(assert (=> b!1052780 m!973633))

(declare-fun m!973639 () Bool)

(assert (=> b!1052779 m!973639))

(declare-fun m!973641 () Bool)

(assert (=> b!1052778 m!973641))

(declare-fun m!973643 () Bool)

(assert (=> b!1052778 m!973643))

(declare-fun m!973645 () Bool)

(assert (=> b!1052774 m!973645))

(check-sat (not b!1052778) (not b!1052780) (not b!1052779) (not b!1052773) (not b!1052775) (not b!1052776) (not start!92706))
(check-sat)
