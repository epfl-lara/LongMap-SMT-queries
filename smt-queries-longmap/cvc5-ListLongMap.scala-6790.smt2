; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85650 () Bool)

(assert start!85650)

(declare-fun res!664441 () Bool)

(declare-fun e!561236 () Bool)

(assert (=> start!85650 (=> (not res!664441) (not e!561236))))

(declare-datatypes ((array!62808 0))(
  ( (array!62809 (arr!30243 (Array (_ BitVec 32) (_ BitVec 64))) (size!30740 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62808)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85650 (= res!664441 (and (= (size!30740 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62809 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30740 a!4424))))))

(assert (=> start!85650 e!561236))

(declare-fun array_inv!23379 (array!62808) Bool)

(assert (=> start!85650 (array_inv!23379 a!4424)))

(assert (=> start!85650 true))

(declare-fun b!994434 () Bool)

(declare-fun res!664440 () Bool)

(assert (=> b!994434 (=> (not res!664440) (not e!561236))))

(assert (=> b!994434 (= res!664440 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30740 a!4424))))))

(declare-fun b!994435 () Bool)

(declare-fun res!664438 () Bool)

(assert (=> b!994435 (=> (not res!664438) (not e!561236))))

(declare-datatypes ((List!20932 0))(
  ( (Nil!20929) (Cons!20928 (h!22096 (_ BitVec 64)) (t!29925 List!20932)) )
))
(declare-fun acc!919 () List!20932)

(declare-fun contains!5826 (List!20932 (_ BitVec 64)) Bool)

(assert (=> b!994435 (= res!664438 (not (contains!5826 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994436 () Bool)

(declare-fun res!664442 () Bool)

(assert (=> b!994436 (=> (not res!664442) (not e!561236))))

(assert (=> b!994436 (= res!664442 (not (contains!5826 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994437 () Bool)

(assert (=> b!994437 (= e!561236 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62808 (_ BitVec 32) List!20932) Bool)

(assert (=> b!994437 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32909 0))(
  ( (Unit!32910) )
))
(declare-fun lt!440924 () Unit!32909)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62808 (_ BitVec 32) (_ BitVec 32) List!20932) Unit!32909)

(assert (=> b!994437 (= lt!440924 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!994438 () Bool)

(declare-fun res!664439 () Bool)

(assert (=> b!994438 (=> (not res!664439) (not e!561236))))

(declare-fun noDuplicate!1411 (List!20932) Bool)

(assert (=> b!994438 (= res!664439 (noDuplicate!1411 acc!919))))

(assert (= (and start!85650 res!664441) b!994435))

(assert (= (and b!994435 res!664438) b!994436))

(assert (= (and b!994436 res!664442) b!994438))

(assert (= (and b!994438 res!664439) b!994434))

(assert (= (and b!994434 res!664440) b!994437))

(declare-fun m!922529 () Bool)

(assert (=> b!994436 m!922529))

(declare-fun m!922531 () Bool)

(assert (=> b!994438 m!922531))

(declare-fun m!922533 () Bool)

(assert (=> b!994437 m!922533))

(declare-fun m!922535 () Bool)

(assert (=> b!994437 m!922535))

(declare-fun m!922537 () Bool)

(assert (=> start!85650 m!922537))

(declare-fun m!922539 () Bool)

(assert (=> b!994435 m!922539))

(push 1)

(assert (not b!994436))

(assert (not b!994437))

(assert (not b!994435))

(assert (not b!994438))

(assert (not start!85650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

