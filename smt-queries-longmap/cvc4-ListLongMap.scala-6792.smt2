; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85494 () Bool)

(assert start!85494)

(declare-fun b!993621 () Bool)

(declare-fun res!664186 () Bool)

(declare-fun e!560691 () Bool)

(assert (=> b!993621 (=> (not res!664186) (not e!560691))))

(declare-datatypes ((List!20949 0))(
  ( (Nil!20946) (Cons!20945 (h!22107 (_ BitVec 64)) (t!29950 List!20949)) )
))
(declare-fun acc!919 () List!20949)

(declare-fun contains!5810 (List!20949 (_ BitVec 64)) Bool)

(assert (=> b!993621 (= res!664186 (not (contains!5810 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993622 () Bool)

(declare-fun res!664185 () Bool)

(assert (=> b!993622 (=> (not res!664185) (not e!560691))))

(assert (=> b!993622 (= res!664185 (not (contains!5810 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993623 () Bool)

(declare-fun res!664184 () Bool)

(assert (=> b!993623 (=> (not res!664184) (not e!560691))))

(declare-fun noDuplicate!1408 (List!20949) Bool)

(assert (=> b!993623 (= res!664184 (noDuplicate!1408 acc!919))))

(declare-fun res!664188 () Bool)

(assert (=> start!85494 (=> (not res!664188) (not e!560691))))

(declare-datatypes ((array!62775 0))(
  ( (array!62776 (arr!30231 (Array (_ BitVec 32) (_ BitVec 64))) (size!30728 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62775)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85494 (= res!664188 (and (= (size!30728 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62776 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30728 a!4424))))))

(assert (=> start!85494 e!560691))

(declare-fun array_inv!23355 (array!62775) Bool)

(assert (=> start!85494 (array_inv!23355 a!4424)))

(assert (=> start!85494 true))

(declare-fun b!993624 () Bool)

(assert (=> b!993624 (= e!560691 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62775 (_ BitVec 32) List!20949) Bool)

(assert (=> b!993624 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32932 0))(
  ( (Unit!32933) )
))
(declare-fun lt!440581 () Unit!32932)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62775 (_ BitVec 32) (_ BitVec 32) List!20949) Unit!32932)

(assert (=> b!993624 (= lt!440581 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993625 () Bool)

(declare-fun res!664187 () Bool)

(assert (=> b!993625 (=> (not res!664187) (not e!560691))))

(assert (=> b!993625 (= res!664187 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30728 a!4424))))))

(assert (= (and start!85494 res!664188) b!993622))

(assert (= (and b!993622 res!664185) b!993621))

(assert (= (and b!993621 res!664186) b!993623))

(assert (= (and b!993623 res!664184) b!993625))

(assert (= (and b!993625 res!664187) b!993624))

(declare-fun m!921307 () Bool)

(assert (=> b!993624 m!921307))

(declare-fun m!921309 () Bool)

(assert (=> b!993624 m!921309))

(declare-fun m!921311 () Bool)

(assert (=> b!993622 m!921311))

(declare-fun m!921313 () Bool)

(assert (=> b!993621 m!921313))

(declare-fun m!921315 () Bool)

(assert (=> b!993623 m!921315))

(declare-fun m!921317 () Bool)

(assert (=> start!85494 m!921317))

(push 1)

(assert (not b!993623))

(assert (not b!993622))

(assert (not start!85494))

(assert (not b!993624))

(assert (not b!993621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

