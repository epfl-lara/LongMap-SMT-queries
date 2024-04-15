; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85482 () Bool)

(assert start!85482)

(declare-fun b!993427 () Bool)

(declare-fun res!664120 () Bool)

(declare-fun e!560561 () Bool)

(assert (=> b!993427 (=> (not res!664120) (not e!560561))))

(declare-datatypes ((array!62718 0))(
  ( (array!62719 (arr!30203 (Array (_ BitVec 32) (_ BitVec 64))) (size!30701 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62718)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!993427 (= res!664120 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30701 a!4424))))))

(declare-fun b!993428 () Bool)

(assert (=> b!993428 (= e!560561 (not true))))

(declare-datatypes ((List!20987 0))(
  ( (Nil!20984) (Cons!20983 (h!22145 (_ BitVec 64)) (t!29979 List!20987)) )
))
(declare-fun acc!919 () List!20987)

(declare-fun arrayNoDuplicates!0 (array!62718 (_ BitVec 32) List!20987) Bool)

(assert (=> b!993428 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32811 0))(
  ( (Unit!32812) )
))
(declare-fun lt!440354 () Unit!32811)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62718 (_ BitVec 32) (_ BitVec 32) List!20987) Unit!32811)

(assert (=> b!993428 (= lt!440354 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun b!993429 () Bool)

(declare-fun res!664122 () Bool)

(assert (=> b!993429 (=> (not res!664122) (not e!560561))))

(declare-fun contains!5786 (List!20987 (_ BitVec 64)) Bool)

(assert (=> b!993429 (= res!664122 (not (contains!5786 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664123 () Bool)

(assert (=> start!85482 (=> (not res!664123) (not e!560561))))

(assert (=> start!85482 (= res!664123 (and (= (size!30701 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62719 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30701 a!4424))))))

(assert (=> start!85482 e!560561))

(declare-fun array_inv!23346 (array!62718) Bool)

(assert (=> start!85482 (array_inv!23346 a!4424)))

(assert (=> start!85482 true))

(declare-fun b!993430 () Bool)

(declare-fun res!664121 () Bool)

(assert (=> b!993430 (=> (not res!664121) (not e!560561))))

(assert (=> b!993430 (= res!664121 (not (contains!5786 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993431 () Bool)

(declare-fun res!664119 () Bool)

(assert (=> b!993431 (=> (not res!664119) (not e!560561))))

(declare-fun noDuplicate!1419 (List!20987) Bool)

(assert (=> b!993431 (= res!664119 (noDuplicate!1419 acc!919))))

(assert (= (and start!85482 res!664123) b!993429))

(assert (= (and b!993429 res!664122) b!993430))

(assert (= (and b!993430 res!664121) b!993431))

(assert (= (and b!993431 res!664119) b!993427))

(assert (= (and b!993427 res!664120) b!993428))

(declare-fun m!920585 () Bool)

(assert (=> b!993429 m!920585))

(declare-fun m!920587 () Bool)

(assert (=> b!993430 m!920587))

(declare-fun m!920589 () Bool)

(assert (=> b!993431 m!920589))

(declare-fun m!920591 () Bool)

(assert (=> b!993428 m!920591))

(declare-fun m!920593 () Bool)

(assert (=> b!993428 m!920593))

(declare-fun m!920595 () Bool)

(assert (=> start!85482 m!920595))

(push 1)

(assert (not b!993430))

(assert (not b!993428))

(assert (not start!85482))

(assert (not b!993431))

(assert (not b!993429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

