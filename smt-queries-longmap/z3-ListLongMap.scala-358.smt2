; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6960 () Bool)

(assert start!6960)

(declare-fun res!26559 () Bool)

(declare-fun e!28698 () Bool)

(assert (=> start!6960 (=> (not res!26559) (not e!28698))))

(declare-datatypes ((array!2971 0))(
  ( (array!2972 (arr!1429 (Array (_ BitVec 32) (_ BitVec 64))) (size!1647 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2971)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!6960 (= res!26559 (and (bvslt (size!1647 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1647 a!4412)) (= (size!1647 a!4412) size!30) (= a!4412 (array!2972 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1429 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1647 a!4412))))))

(assert (=> start!6960 e!28698))

(declare-fun array_inv!841 (array!2971) Bool)

(assert (=> start!6960 (array_inv!841 a!4412)))

(assert (=> start!6960 true))

(declare-fun b!45268 () Bool)

(assert (=> b!45268 (= e!28698 (not true))))

(declare-fun arrayCountValidKeys!0 (array!2971 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45268 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1263 0))(
  ( (Unit!1264) )
))
(declare-fun lt!20081 () Unit!1263)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2971 (_ BitVec 32) (_ BitVec 32)) Unit!1263)

(assert (=> b!45268 (= lt!20081 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6960 res!26559) b!45268))

(declare-fun m!39721 () Bool)

(assert (=> start!6960 m!39721))

(declare-fun m!39723 () Bool)

(assert (=> start!6960 m!39723))

(declare-fun m!39725 () Bool)

(assert (=> b!45268 m!39725))

(declare-fun m!39727 () Bool)

(assert (=> b!45268 m!39727))

(check-sat (not start!6960) (not b!45268))
