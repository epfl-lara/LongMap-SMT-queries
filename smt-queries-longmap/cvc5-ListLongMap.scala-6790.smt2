; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85464 () Bool)

(assert start!85464)

(declare-fun b!993292 () Bool)

(declare-fun res!663984 () Bool)

(declare-fun e!560506 () Bool)

(assert (=> b!993292 (=> (not res!663984) (not e!560506))))

(declare-datatypes ((array!62700 0))(
  ( (array!62701 (arr!30194 (Array (_ BitVec 32) (_ BitVec 64))) (size!30692 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62700)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993292 (= res!663984 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30692 a!4424))))))

(declare-fun b!993293 () Bool)

(declare-fun res!663987 () Bool)

(assert (=> b!993293 (=> (not res!663987) (not e!560506))))

(declare-datatypes ((List!20978 0))(
  ( (Nil!20975) (Cons!20974 (h!22136 (_ BitVec 64)) (t!29970 List!20978)) )
))
(declare-fun acc!919 () List!20978)

(declare-fun contains!5777 (List!20978 (_ BitVec 64)) Bool)

(assert (=> b!993293 (= res!663987 (not (contains!5777 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993294 () Bool)

(declare-fun res!663985 () Bool)

(assert (=> b!993294 (=> (not res!663985) (not e!560506))))

(declare-fun noDuplicate!1410 (List!20978) Bool)

(assert (=> b!993294 (= res!663985 (noDuplicate!1410 acc!919))))

(declare-fun b!993295 () Bool)

(assert (=> b!993295 (= e!560506 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62700 (_ BitVec 32) List!20978) Bool)

(assert (=> b!993295 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32793 0))(
  ( (Unit!32794) )
))
(declare-fun lt!440327 () Unit!32793)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62700 (_ BitVec 32) (_ BitVec 32) List!20978) Unit!32793)

(assert (=> b!993295 (= lt!440327 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993296 () Bool)

(declare-fun res!663988 () Bool)

(assert (=> b!993296 (=> (not res!663988) (not e!560506))))

(assert (=> b!993296 (= res!663988 (not (contains!5777 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!663986 () Bool)

(assert (=> start!85464 (=> (not res!663986) (not e!560506))))

(assert (=> start!85464 (= res!663986 (and (= (size!30692 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62701 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30692 a!4424))))))

(assert (=> start!85464 e!560506))

(declare-fun array_inv!23337 (array!62700) Bool)

(assert (=> start!85464 (array_inv!23337 a!4424)))

(assert (=> start!85464 true))

(assert (= (and start!85464 res!663986) b!993293))

(assert (= (and b!993293 res!663987) b!993296))

(assert (= (and b!993296 res!663988) b!993294))

(assert (= (and b!993294 res!663985) b!993292))

(assert (= (and b!993292 res!663984) b!993295))

(declare-fun m!920477 () Bool)

(assert (=> start!85464 m!920477))

(declare-fun m!920479 () Bool)

(assert (=> b!993295 m!920479))

(declare-fun m!920481 () Bool)

(assert (=> b!993295 m!920481))

(declare-fun m!920483 () Bool)

(assert (=> b!993296 m!920483))

(declare-fun m!920485 () Bool)

(assert (=> b!993294 m!920485))

(declare-fun m!920487 () Bool)

(assert (=> b!993293 m!920487))

(push 1)

(assert (not b!993295))

(assert (not b!993293))

(assert (not b!993296))

(assert (not b!993294))

(assert (not start!85464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

