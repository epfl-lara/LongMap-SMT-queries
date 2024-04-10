; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85490 () Bool)

(assert start!85490)

(declare-fun res!664158 () Bool)

(declare-fun e!560679 () Bool)

(assert (=> start!85490 (=> (not res!664158) (not e!560679))))

(declare-datatypes ((array!62771 0))(
  ( (array!62772 (arr!30229 (Array (_ BitVec 32) (_ BitVec 64))) (size!30726 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62771)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85490 (= res!664158 (and (= (size!30726 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62772 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30726 a!4424))))))

(assert (=> start!85490 e!560679))

(declare-fun array_inv!23353 (array!62771) Bool)

(assert (=> start!85490 (array_inv!23353 a!4424)))

(assert (=> start!85490 true))

(declare-fun b!993591 () Bool)

(declare-fun res!664156 () Bool)

(assert (=> b!993591 (=> (not res!664156) (not e!560679))))

(declare-datatypes ((List!20947 0))(
  ( (Nil!20944) (Cons!20943 (h!22105 (_ BitVec 64)) (t!29948 List!20947)) )
))
(declare-fun acc!919 () List!20947)

(declare-fun contains!5808 (List!20947 (_ BitVec 64)) Bool)

(assert (=> b!993591 (= res!664156 (not (contains!5808 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993592 () Bool)

(assert (=> b!993592 (= e!560679 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62771 (_ BitVec 32) List!20947) Bool)

(assert (=> b!993592 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32928 0))(
  ( (Unit!32929) )
))
(declare-fun lt!440575 () Unit!32928)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62771 (_ BitVec 32) (_ BitVec 32) List!20947) Unit!32928)

(assert (=> b!993592 (= lt!440575 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993593 () Bool)

(declare-fun res!664155 () Bool)

(assert (=> b!993593 (=> (not res!664155) (not e!560679))))

(assert (=> b!993593 (= res!664155 (not (contains!5808 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993594 () Bool)

(declare-fun res!664154 () Bool)

(assert (=> b!993594 (=> (not res!664154) (not e!560679))))

(declare-fun noDuplicate!1406 (List!20947) Bool)

(assert (=> b!993594 (= res!664154 (noDuplicate!1406 acc!919))))

(declare-fun b!993595 () Bool)

(declare-fun res!664157 () Bool)

(assert (=> b!993595 (=> (not res!664157) (not e!560679))))

(assert (=> b!993595 (= res!664157 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30726 a!4424))))))

(assert (= (and start!85490 res!664158) b!993591))

(assert (= (and b!993591 res!664156) b!993593))

(assert (= (and b!993593 res!664155) b!993594))

(assert (= (and b!993594 res!664154) b!993595))

(assert (= (and b!993595 res!664157) b!993592))

(declare-fun m!921283 () Bool)

(assert (=> b!993594 m!921283))

(declare-fun m!921285 () Bool)

(assert (=> b!993592 m!921285))

(declare-fun m!921287 () Bool)

(assert (=> b!993592 m!921287))

(declare-fun m!921289 () Bool)

(assert (=> b!993591 m!921289))

(declare-fun m!921291 () Bool)

(assert (=> b!993593 m!921291))

(declare-fun m!921293 () Bool)

(assert (=> start!85490 m!921293))

(push 1)

(assert (not start!85490))

(assert (not b!993592))

(assert (not b!993593))

(assert (not b!993594))

(assert (not b!993591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

