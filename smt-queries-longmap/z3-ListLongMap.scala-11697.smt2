; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136768 () Bool)

(assert start!136768)

(declare-fun b!1578423 () Bool)

(declare-fun res!1078547 () Bool)

(declare-fun e!880396 () Bool)

(assert (=> b!1578423 (=> (not res!1078547) (not e!880396))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105722 0))(
  ( (array!105723 (arr!50969 (Array (_ BitVec 32) (_ BitVec 64))) (size!51521 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105722)

(assert (=> b!1578423 (= res!1078547 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51521 a!3559))))))

(declare-fun b!1578425 () Bool)

(assert (=> b!1578425 (= e!880396 (bvsge (bvsub from!2937 #b00000000000000000000000000000001) from!2937))))

(declare-fun b!1578424 () Bool)

(declare-fun res!1078546 () Bool)

(assert (=> b!1578424 (=> (not res!1078546) (not e!880396))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578424 (= res!1078546 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078545 () Bool)

(assert (=> start!136768 (=> (not res!1078545) (not e!880396))))

(assert (=> start!136768 (= res!1078545 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51521 a!3559)) (bvslt (size!51521 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136768 e!880396))

(assert (=> start!136768 true))

(declare-fun array_inv!39905 (array!105722) Bool)

(assert (=> start!136768 (array_inv!39905 a!3559)))

(declare-fun b!1578422 () Bool)

(declare-fun res!1078548 () Bool)

(assert (=> b!1578422 (=> (not res!1078548) (not e!880396))))

(assert (=> b!1578422 (= res!1078548 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(assert (= (and start!136768 res!1078545) b!1578422))

(assert (= (and b!1578422 res!1078548) b!1578423))

(assert (= (and b!1578423 res!1078547) b!1578424))

(assert (= (and b!1578424 res!1078546) b!1578425))

(declare-fun m!1449897 () Bool)

(assert (=> b!1578424 m!1449897))

(declare-fun m!1449899 () Bool)

(assert (=> start!136768 m!1449899))

(declare-fun m!1449901 () Bool)

(assert (=> b!1578422 m!1449901))

(check-sat (not b!1578424) (not b!1578422) (not start!136768))
(check-sat)
