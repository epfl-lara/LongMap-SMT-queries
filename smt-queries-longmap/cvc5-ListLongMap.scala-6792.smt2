; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85476 () Bool)

(assert start!85476)

(declare-fun b!993382 () Bool)

(declare-fun res!664076 () Bool)

(declare-fun e!560542 () Bool)

(assert (=> b!993382 (=> (not res!664076) (not e!560542))))

(declare-datatypes ((array!62712 0))(
  ( (array!62713 (arr!30200 (Array (_ BitVec 32) (_ BitVec 64))) (size!30698 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62712)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993382 (= res!664076 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30698 a!4424))))))

(declare-fun b!993383 () Bool)

(declare-fun res!664074 () Bool)

(assert (=> b!993383 (=> (not res!664074) (not e!560542))))

(declare-datatypes ((List!20984 0))(
  ( (Nil!20981) (Cons!20980 (h!22142 (_ BitVec 64)) (t!29976 List!20984)) )
))
(declare-fun acc!919 () List!20984)

(declare-fun contains!5783 (List!20984 (_ BitVec 64)) Bool)

(assert (=> b!993383 (= res!664074 (not (contains!5783 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664078 () Bool)

(assert (=> start!85476 (=> (not res!664078) (not e!560542))))

(assert (=> start!85476 (= res!664078 (and (= (size!30698 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62713 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30698 a!4424))))))

(assert (=> start!85476 e!560542))

(declare-fun array_inv!23343 (array!62712) Bool)

(assert (=> start!85476 (array_inv!23343 a!4424)))

(assert (=> start!85476 true))

(declare-fun b!993384 () Bool)

(assert (=> b!993384 (= e!560542 (not true))))

(declare-fun arrayNoDuplicates!0 (array!62712 (_ BitVec 32) List!20984) Bool)

(assert (=> b!993384 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32805 0))(
  ( (Unit!32806) )
))
(declare-fun lt!440345 () Unit!32805)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62712 (_ BitVec 32) (_ BitVec 32) List!20984) Unit!32805)

(assert (=> b!993384 (= lt!440345 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993385 () Bool)

(declare-fun res!664075 () Bool)

(assert (=> b!993385 (=> (not res!664075) (not e!560542))))

(declare-fun noDuplicate!1416 (List!20984) Bool)

(assert (=> b!993385 (= res!664075 (noDuplicate!1416 acc!919))))

(declare-fun b!993386 () Bool)

(declare-fun res!664077 () Bool)

(assert (=> b!993386 (=> (not res!664077) (not e!560542))))

(assert (=> b!993386 (= res!664077 (not (contains!5783 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85476 res!664078) b!993386))

(assert (= (and b!993386 res!664077) b!993383))

(assert (= (and b!993383 res!664074) b!993385))

(assert (= (and b!993385 res!664075) b!993382))

(assert (= (and b!993382 res!664076) b!993384))

(declare-fun m!920549 () Bool)

(assert (=> b!993384 m!920549))

(declare-fun m!920551 () Bool)

(assert (=> b!993384 m!920551))

(declare-fun m!920553 () Bool)

(assert (=> b!993386 m!920553))

(declare-fun m!920555 () Bool)

(assert (=> b!993385 m!920555))

(declare-fun m!920557 () Bool)

(assert (=> b!993383 m!920557))

(declare-fun m!920559 () Bool)

(assert (=> start!85476 m!920559))

(push 1)

(assert (not b!993384))

(assert (not start!85476))

(assert (not b!993383))

(assert (not b!993385))

(assert (not b!993386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

