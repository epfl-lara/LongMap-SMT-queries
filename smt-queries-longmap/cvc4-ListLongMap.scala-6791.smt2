; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85488 () Bool)

(assert start!85488)

(declare-fun b!993576 () Bool)

(declare-fun e!560672 () Bool)

(declare-datatypes ((array!62769 0))(
  ( (array!62770 (arr!30228 (Array (_ BitVec 32) (_ BitVec 64))) (size!30725 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62769)

(assert (=> b!993576 (= e!560672 (not (bvslt (size!30725 a!4424) #b01111111111111111111111111111111)))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-datatypes ((List!20946 0))(
  ( (Nil!20943) (Cons!20942 (h!22104 (_ BitVec 64)) (t!29947 List!20946)) )
))
(declare-fun acc!919 () List!20946)

(declare-fun arrayNoDuplicates!0 (array!62769 (_ BitVec 32) List!20946) Bool)

(assert (=> b!993576 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32926 0))(
  ( (Unit!32927) )
))
(declare-fun lt!440572 () Unit!32926)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62769 (_ BitVec 32) (_ BitVec 32) List!20946) Unit!32926)

(assert (=> b!993576 (= lt!440572 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993577 () Bool)

(declare-fun res!664142 () Bool)

(assert (=> b!993577 (=> (not res!664142) (not e!560672))))

(declare-fun noDuplicate!1405 (List!20946) Bool)

(assert (=> b!993577 (= res!664142 (noDuplicate!1405 acc!919))))

(declare-fun res!664140 () Bool)

(assert (=> start!85488 (=> (not res!664140) (not e!560672))))

(assert (=> start!85488 (= res!664140 (and (= (size!30725 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62770 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30725 a!4424))))))

(assert (=> start!85488 e!560672))

(declare-fun array_inv!23352 (array!62769) Bool)

(assert (=> start!85488 (array_inv!23352 a!4424)))

(assert (=> start!85488 true))

(declare-fun b!993578 () Bool)

(declare-fun res!664143 () Bool)

(assert (=> b!993578 (=> (not res!664143) (not e!560672))))

(declare-fun contains!5807 (List!20946 (_ BitVec 64)) Bool)

(assert (=> b!993578 (= res!664143 (not (contains!5807 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993579 () Bool)

(declare-fun res!664139 () Bool)

(assert (=> b!993579 (=> (not res!664139) (not e!560672))))

(assert (=> b!993579 (= res!664139 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30725 a!4424))))))

(declare-fun b!993580 () Bool)

(declare-fun res!664141 () Bool)

(assert (=> b!993580 (=> (not res!664141) (not e!560672))))

(assert (=> b!993580 (= res!664141 (not (contains!5807 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85488 res!664140) b!993580))

(assert (= (and b!993580 res!664141) b!993578))

(assert (= (and b!993578 res!664143) b!993577))

(assert (= (and b!993577 res!664142) b!993579))

(assert (= (and b!993579 res!664139) b!993576))

(declare-fun m!921271 () Bool)

(assert (=> b!993580 m!921271))

(declare-fun m!921273 () Bool)

(assert (=> start!85488 m!921273))

(declare-fun m!921275 () Bool)

(assert (=> b!993577 m!921275))

(declare-fun m!921277 () Bool)

(assert (=> b!993576 m!921277))

(declare-fun m!921279 () Bool)

(assert (=> b!993576 m!921279))

(declare-fun m!921281 () Bool)

(assert (=> b!993578 m!921281))

(push 1)

(assert (not b!993580))

(assert (not b!993576))

(assert (not b!993578))

(assert (not start!85488))

(assert (not b!993577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

