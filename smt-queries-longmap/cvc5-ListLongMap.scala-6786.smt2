; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85440 () Bool)

(assert start!85440)

(declare-fun res!663861 () Bool)

(declare-fun e!560435 () Bool)

(assert (=> start!85440 (=> (not res!663861) (not e!560435))))

(declare-datatypes ((array!62676 0))(
  ( (array!62677 (arr!30182 (Array (_ BitVec 32) (_ BitVec 64))) (size!30680 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62676)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85440 (= res!663861 (and (= (size!30680 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62677 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30680 a!4424))))))

(assert (=> start!85440 e!560435))

(declare-fun array_inv!23325 (array!62676) Bool)

(assert (=> start!85440 (array_inv!23325 a!4424)))

(assert (=> start!85440 true))

(declare-fun b!993168 () Bool)

(declare-fun res!663860 () Bool)

(assert (=> b!993168 (=> (not res!663860) (not e!560435))))

(declare-datatypes ((List!20966 0))(
  ( (Nil!20963) (Cons!20962 (h!22124 (_ BitVec 64)) (t!29958 List!20966)) )
))
(declare-fun acc!919 () List!20966)

(declare-fun contains!5765 (List!20966 (_ BitVec 64)) Bool)

(assert (=> b!993168 (= res!663860 (not (contains!5765 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993169 () Bool)

(declare-fun res!663862 () Bool)

(assert (=> b!993169 (=> (not res!663862) (not e!560435))))

(assert (=> b!993169 (= res!663862 (not (contains!5765 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993170 () Bool)

(assert (=> b!993170 (= e!560435 false)))

(declare-fun lt!440291 () Bool)

(declare-fun noDuplicate!1398 (List!20966) Bool)

(assert (=> b!993170 (= lt!440291 (noDuplicate!1398 acc!919))))

(assert (= (and start!85440 res!663861) b!993168))

(assert (= (and b!993168 res!663860) b!993169))

(assert (= (and b!993169 res!663862) b!993170))

(declare-fun m!920373 () Bool)

(assert (=> start!85440 m!920373))

(declare-fun m!920375 () Bool)

(assert (=> b!993168 m!920375))

(declare-fun m!920377 () Bool)

(assert (=> b!993169 m!920377))

(declare-fun m!920379 () Bool)

(assert (=> b!993170 m!920379))

(push 1)

(assert (not b!993168))

(assert (not start!85440))

(assert (not b!993170))

(assert (not b!993169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

