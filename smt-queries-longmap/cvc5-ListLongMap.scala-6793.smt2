; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85496 () Bool)

(assert start!85496)

(declare-fun b!993636 () Bool)

(declare-fun e!560697 () Bool)

(assert (=> b!993636 (= e!560697 (not true))))

(declare-datatypes ((array!62777 0))(
  ( (array!62778 (arr!30232 (Array (_ BitVec 32) (_ BitVec 64))) (size!30729 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62777)

(declare-fun from!3778 () (_ BitVec 32))

(declare-datatypes ((List!20950 0))(
  ( (Nil!20947) (Cons!20946 (h!22108 (_ BitVec 64)) (t!29951 List!20950)) )
))
(declare-fun acc!919 () List!20950)

(declare-fun arrayNoDuplicates!0 (array!62777 (_ BitVec 32) List!20950) Bool)

(assert (=> b!993636 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32934 0))(
  ( (Unit!32935) )
))
(declare-fun lt!440584 () Unit!32934)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62777 (_ BitVec 32) (_ BitVec 32) List!20950) Unit!32934)

(assert (=> b!993636 (= lt!440584 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993637 () Bool)

(declare-fun res!664203 () Bool)

(assert (=> b!993637 (=> (not res!664203) (not e!560697))))

(assert (=> b!993637 (= res!664203 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30729 a!4424))))))

(declare-fun b!993638 () Bool)

(declare-fun res!664202 () Bool)

(assert (=> b!993638 (=> (not res!664202) (not e!560697))))

(declare-fun noDuplicate!1409 (List!20950) Bool)

(assert (=> b!993638 (= res!664202 (noDuplicate!1409 acc!919))))

(declare-fun b!993640 () Bool)

(declare-fun res!664200 () Bool)

(assert (=> b!993640 (=> (not res!664200) (not e!560697))))

(declare-fun contains!5811 (List!20950 (_ BitVec 64)) Bool)

(assert (=> b!993640 (= res!664200 (not (contains!5811 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993639 () Bool)

(declare-fun res!664201 () Bool)

(assert (=> b!993639 (=> (not res!664201) (not e!560697))))

(assert (=> b!993639 (= res!664201 (not (contains!5811 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664199 () Bool)

(assert (=> start!85496 (=> (not res!664199) (not e!560697))))

(assert (=> start!85496 (= res!664199 (and (= (size!30729 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62778 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30729 a!4424))))))

(assert (=> start!85496 e!560697))

(declare-fun array_inv!23356 (array!62777) Bool)

(assert (=> start!85496 (array_inv!23356 a!4424)))

(assert (=> start!85496 true))

(assert (= (and start!85496 res!664199) b!993639))

(assert (= (and b!993639 res!664201) b!993640))

(assert (= (and b!993640 res!664200) b!993638))

(assert (= (and b!993638 res!664202) b!993637))

(assert (= (and b!993637 res!664203) b!993636))

(declare-fun m!921319 () Bool)

(assert (=> start!85496 m!921319))

(declare-fun m!921321 () Bool)

(assert (=> b!993640 m!921321))

(declare-fun m!921323 () Bool)

(assert (=> b!993638 m!921323))

(declare-fun m!921325 () Bool)

(assert (=> b!993636 m!921325))

(declare-fun m!921327 () Bool)

(assert (=> b!993636 m!921327))

(declare-fun m!921329 () Bool)

(assert (=> b!993639 m!921329))

(push 1)

(assert (not start!85496))

(assert (not b!993639))

(assert (not b!993640))

(assert (not b!993636))

(assert (not b!993638))

(check-sat)

