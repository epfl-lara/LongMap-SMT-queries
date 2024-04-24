; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85660 () Bool)

(assert start!85660)

(declare-fun b!994509 () Bool)

(declare-fun res!664516 () Bool)

(declare-fun e!561266 () Bool)

(assert (=> b!994509 (=> (not res!664516) (not e!561266))))

(declare-datatypes ((array!62818 0))(
  ( (array!62819 (arr!30248 (Array (_ BitVec 32) (_ BitVec 64))) (size!30745 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62818)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> b!994509 (= res!664516 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30745 a!4424))))))

(declare-fun res!664514 () Bool)

(assert (=> start!85660 (=> (not res!664514) (not e!561266))))

(assert (=> start!85660 (= res!664514 (and (= (size!30745 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62819 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30745 a!4424))))))

(assert (=> start!85660 e!561266))

(declare-fun array_inv!23384 (array!62818) Bool)

(assert (=> start!85660 (array_inv!23384 a!4424)))

(assert (=> start!85660 true))

(declare-fun b!994510 () Bool)

(declare-fun res!664515 () Bool)

(assert (=> b!994510 (=> (not res!664515) (not e!561266))))

(declare-datatypes ((List!20937 0))(
  ( (Nil!20934) (Cons!20933 (h!22101 (_ BitVec 64)) (t!29930 List!20937)) )
))
(declare-fun acc!919 () List!20937)

(declare-fun contains!5831 (List!20937 (_ BitVec 64)) Bool)

(assert (=> b!994510 (= res!664515 (not (contains!5831 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994511 () Bool)

(declare-fun res!664513 () Bool)

(assert (=> b!994511 (=> (not res!664513) (not e!561266))))

(declare-fun noDuplicate!1416 (List!20937) Bool)

(assert (=> b!994511 (= res!664513 (noDuplicate!1416 acc!919))))

(declare-fun b!994512 () Bool)

(assert (=> b!994512 (= e!561266 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62818 (_ BitVec 32) List!20937) Bool)

(assert (=> b!994512 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32919 0))(
  ( (Unit!32920) )
))
(declare-fun lt!440939 () Unit!32919)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62818 (_ BitVec 32) (_ BitVec 32) List!20937) Unit!32919)

(assert (=> b!994512 (= lt!440939 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!994513 () Bool)

(declare-fun res!664517 () Bool)

(assert (=> b!994513 (=> (not res!664517) (not e!561266))))

(assert (=> b!994513 (= res!664517 (not (contains!5831 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85660 res!664514) b!994513))

(assert (= (and b!994513 res!664517) b!994510))

(assert (= (and b!994510 res!664515) b!994511))

(assert (= (and b!994511 res!664513) b!994509))

(assert (= (and b!994509 res!664516) b!994512))

(declare-fun m!922589 () Bool)

(assert (=> start!85660 m!922589))

(declare-fun m!922591 () Bool)

(assert (=> b!994512 m!922591))

(declare-fun m!922593 () Bool)

(assert (=> b!994512 m!922593))

(declare-fun m!922595 () Bool)

(assert (=> b!994513 m!922595))

(declare-fun m!922597 () Bool)

(assert (=> b!994510 m!922597))

(declare-fun m!922599 () Bool)

(assert (=> b!994511 m!922599))

(push 1)

(assert (not start!85660))

(assert (not b!994511))

(assert (not b!994513))

(assert (not b!994512))

(assert (not b!994510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

