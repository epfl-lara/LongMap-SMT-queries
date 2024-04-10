; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85482 () Bool)

(assert start!85482)

(declare-fun b!993531 () Bool)

(declare-fun res!664095 () Bool)

(declare-fun e!560655 () Bool)

(assert (=> b!993531 (=> (not res!664095) (not e!560655))))

(declare-datatypes ((List!20943 0))(
  ( (Nil!20940) (Cons!20939 (h!22101 (_ BitVec 64)) (t!29944 List!20943)) )
))
(declare-fun acc!919 () List!20943)

(declare-fun noDuplicate!1402 (List!20943) Bool)

(assert (=> b!993531 (= res!664095 (noDuplicate!1402 acc!919))))

(declare-fun b!993532 () Bool)

(declare-fun res!664094 () Bool)

(assert (=> b!993532 (=> (not res!664094) (not e!560655))))

(declare-fun contains!5804 (List!20943 (_ BitVec 64)) Bool)

(assert (=> b!993532 (= res!664094 (not (contains!5804 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993533 () Bool)

(declare-fun res!664098 () Bool)

(assert (=> b!993533 (=> (not res!664098) (not e!560655))))

(assert (=> b!993533 (= res!664098 (not (contains!5804 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993534 () Bool)

(assert (=> b!993534 (= e!560655 (not true))))

(declare-datatypes ((array!62763 0))(
  ( (array!62764 (arr!30225 (Array (_ BitVec 32) (_ BitVec 64))) (size!30722 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62763)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!62763 (_ BitVec 32) List!20943) Bool)

(assert (=> b!993534 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32920 0))(
  ( (Unit!32921) )
))
(declare-fun lt!440563 () Unit!32920)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62763 (_ BitVec 32) (_ BitVec 32) List!20943) Unit!32920)

(assert (=> b!993534 (= lt!440563 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664096 () Bool)

(assert (=> start!85482 (=> (not res!664096) (not e!560655))))

(assert (=> start!85482 (= res!664096 (and (= (size!30722 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62764 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30722 a!4424))))))

(assert (=> start!85482 e!560655))

(declare-fun array_inv!23349 (array!62763) Bool)

(assert (=> start!85482 (array_inv!23349 a!4424)))

(assert (=> start!85482 true))

(declare-fun b!993535 () Bool)

(declare-fun res!664097 () Bool)

(assert (=> b!993535 (=> (not res!664097) (not e!560655))))

(assert (=> b!993535 (= res!664097 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30722 a!4424))))))

(assert (= (and start!85482 res!664096) b!993533))

(assert (= (and b!993533 res!664098) b!993532))

(assert (= (and b!993532 res!664094) b!993531))

(assert (= (and b!993531 res!664095) b!993535))

(assert (= (and b!993535 res!664097) b!993534))

(declare-fun m!921235 () Bool)

(assert (=> b!993534 m!921235))

(declare-fun m!921237 () Bool)

(assert (=> b!993534 m!921237))

(declare-fun m!921239 () Bool)

(assert (=> b!993531 m!921239))

(declare-fun m!921241 () Bool)

(assert (=> b!993532 m!921241))

(declare-fun m!921243 () Bool)

(assert (=> start!85482 m!921243))

(declare-fun m!921245 () Bool)

(assert (=> b!993533 m!921245))

(push 1)

(assert (not b!993532))

(assert (not b!993534))

(assert (not b!993533))

(assert (not b!993531))

(assert (not start!85482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

