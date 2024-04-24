; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92442 () Bool)

(assert start!92442)

(declare-fun b!1049536 () Bool)

(declare-fun e!595351 () Bool)

(declare-fun e!595352 () Bool)

(assert (=> b!1049536 (= e!595351 e!595352)))

(declare-fun res!697895 () Bool)

(assert (=> b!1049536 (=> (not res!697895) (not e!595352))))

(declare-fun lt!463657 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049536 (= res!697895 (not (= lt!463657 i!1381)))))

(declare-datatypes ((array!66085 0))(
  ( (array!66086 (arr!31777 (Array (_ BitVec 32) (_ BitVec 64))) (size!32314 (_ BitVec 32))) )
))
(declare-fun lt!463658 () array!66085)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66085 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049536 (= lt!463657 (arrayScanForKey!0 lt!463658 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049537 () Bool)

(declare-fun res!697896 () Bool)

(declare-fun e!595353 () Bool)

(assert (=> b!1049537 (=> (not res!697896) (not e!595353))))

(declare-fun a!3488 () array!66085)

(declare-datatypes ((List!22059 0))(
  ( (Nil!22056) (Cons!22055 (h!23273 (_ BitVec 64)) (t!31358 List!22059)) )
))
(declare-fun arrayNoDuplicates!0 (array!66085 (_ BitVec 32) List!22059) Bool)

(assert (=> b!1049537 (= res!697896 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22056))))

(declare-fun b!1049538 () Bool)

(assert (=> b!1049538 (= e!595353 e!595351)))

(declare-fun res!697893 () Bool)

(assert (=> b!1049538 (=> (not res!697893) (not e!595351))))

(declare-fun arrayContainsKey!0 (array!66085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049538 (= res!697893 (arrayContainsKey!0 lt!463658 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049538 (= lt!463658 (array!66086 (store (arr!31777 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32314 a!3488)))))

(declare-fun res!697894 () Bool)

(assert (=> start!92442 (=> (not res!697894) (not e!595353))))

(assert (=> start!92442 (= res!697894 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32314 a!3488)) (bvslt (size!32314 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92442 e!595353))

(assert (=> start!92442 true))

(declare-fun array_inv!24559 (array!66085) Bool)

(assert (=> start!92442 (array_inv!24559 a!3488)))

(declare-fun b!1049539 () Bool)

(assert (=> b!1049539 (= e!595352 (not (or (bvsle lt!463657 i!1381) (bvsge lt!463657 #b00000000000000000000000000000000))))))

(assert (=> b!1049539 (= (select (store (arr!31777 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463657) k0!2747)))

(declare-fun b!1049540 () Bool)

(declare-fun res!697898 () Bool)

(assert (=> b!1049540 (=> (not res!697898) (not e!595353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049540 (= res!697898 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049541 () Bool)

(declare-fun res!697897 () Bool)

(assert (=> b!1049541 (=> (not res!697897) (not e!595353))))

(assert (=> b!1049541 (= res!697897 (= (select (arr!31777 a!3488) i!1381) k0!2747))))

(assert (= (and start!92442 res!697894) b!1049537))

(assert (= (and b!1049537 res!697896) b!1049540))

(assert (= (and b!1049540 res!697898) b!1049541))

(assert (= (and b!1049541 res!697897) b!1049538))

(assert (= (and b!1049538 res!697893) b!1049536))

(assert (= (and b!1049536 res!697895) b!1049539))

(declare-fun m!970907 () Bool)

(assert (=> b!1049537 m!970907))

(declare-fun m!970909 () Bool)

(assert (=> start!92442 m!970909))

(declare-fun m!970911 () Bool)

(assert (=> b!1049538 m!970911))

(declare-fun m!970913 () Bool)

(assert (=> b!1049538 m!970913))

(declare-fun m!970915 () Bool)

(assert (=> b!1049536 m!970915))

(declare-fun m!970917 () Bool)

(assert (=> b!1049540 m!970917))

(assert (=> b!1049539 m!970913))

(declare-fun m!970919 () Bool)

(assert (=> b!1049539 m!970919))

(declare-fun m!970921 () Bool)

(assert (=> b!1049541 m!970921))

(check-sat (not b!1049538) (not b!1049537) (not b!1049536) (not b!1049540) (not start!92442))
(check-sat)
