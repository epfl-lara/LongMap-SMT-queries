; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85484 () Bool)

(assert start!85484)

(declare-fun b!993546 () Bool)

(declare-fun res!664110 () Bool)

(declare-fun e!560660 () Bool)

(assert (=> b!993546 (=> (not res!664110) (not e!560660))))

(declare-datatypes ((List!20944 0))(
  ( (Nil!20941) (Cons!20940 (h!22102 (_ BitVec 64)) (t!29945 List!20944)) )
))
(declare-fun acc!919 () List!20944)

(declare-fun contains!5805 (List!20944 (_ BitVec 64)) Bool)

(assert (=> b!993546 (= res!664110 (not (contains!5805 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993547 () Bool)

(declare-datatypes ((array!62765 0))(
  ( (array!62766 (arr!30226 (Array (_ BitVec 32) (_ BitVec 64))) (size!30723 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62765)

(assert (=> b!993547 (= e!560660 (not (bvslt (size!30723 a!4424) #b01111111111111111111111111111111)))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!62765 (_ BitVec 32) List!20944) Bool)

(assert (=> b!993547 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32922 0))(
  ( (Unit!32923) )
))
(declare-fun lt!440566 () Unit!32922)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62765 (_ BitVec 32) (_ BitVec 32) List!20944) Unit!32922)

(assert (=> b!993547 (= lt!440566 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993548 () Bool)

(declare-fun res!664112 () Bool)

(assert (=> b!993548 (=> (not res!664112) (not e!560660))))

(declare-fun noDuplicate!1403 (List!20944) Bool)

(assert (=> b!993548 (= res!664112 (noDuplicate!1403 acc!919))))

(declare-fun res!664109 () Bool)

(assert (=> start!85484 (=> (not res!664109) (not e!560660))))

(assert (=> start!85484 (= res!664109 (and (= (size!30723 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62766 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30723 a!4424))))))

(assert (=> start!85484 e!560660))

(declare-fun array_inv!23350 (array!62765) Bool)

(assert (=> start!85484 (array_inv!23350 a!4424)))

(assert (=> start!85484 true))

(declare-fun b!993549 () Bool)

(declare-fun res!664111 () Bool)

(assert (=> b!993549 (=> (not res!664111) (not e!560660))))

(assert (=> b!993549 (= res!664111 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30723 a!4424))))))

(declare-fun b!993550 () Bool)

(declare-fun res!664113 () Bool)

(assert (=> b!993550 (=> (not res!664113) (not e!560660))))

(assert (=> b!993550 (= res!664113 (not (contains!5805 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85484 res!664109) b!993550))

(assert (= (and b!993550 res!664113) b!993546))

(assert (= (and b!993546 res!664110) b!993548))

(assert (= (and b!993548 res!664112) b!993549))

(assert (= (and b!993549 res!664111) b!993547))

(declare-fun m!921247 () Bool)

(assert (=> b!993548 m!921247))

(declare-fun m!921249 () Bool)

(assert (=> start!85484 m!921249))

(declare-fun m!921251 () Bool)

(assert (=> b!993546 m!921251))

(declare-fun m!921253 () Bool)

(assert (=> b!993547 m!921253))

(declare-fun m!921255 () Bool)

(assert (=> b!993547 m!921255))

(declare-fun m!921257 () Bool)

(assert (=> b!993550 m!921257))

(push 1)

(assert (not b!993550))

(assert (not b!993546))

(assert (not b!993548))

