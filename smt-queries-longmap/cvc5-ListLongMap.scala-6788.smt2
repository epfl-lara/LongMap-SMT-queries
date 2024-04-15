; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85452 () Bool)

(assert start!85452)

(declare-fun res!663914 () Bool)

(declare-fun e!560471 () Bool)

(assert (=> start!85452 (=> (not res!663914) (not e!560471))))

(declare-datatypes ((array!62688 0))(
  ( (array!62689 (arr!30188 (Array (_ BitVec 32) (_ BitVec 64))) (size!30686 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62688)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85452 (= res!663914 (and (= (size!30686 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62689 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30686 a!4424))))))

(assert (=> start!85452 e!560471))

(declare-fun array_inv!23331 (array!62688) Bool)

(assert (=> start!85452 (array_inv!23331 a!4424)))

(assert (=> start!85452 true))

(declare-fun b!993222 () Bool)

(declare-fun res!663916 () Bool)

(assert (=> b!993222 (=> (not res!663916) (not e!560471))))

(declare-datatypes ((List!20972 0))(
  ( (Nil!20969) (Cons!20968 (h!22130 (_ BitVec 64)) (t!29964 List!20972)) )
))
(declare-fun acc!919 () List!20972)

(declare-fun contains!5771 (List!20972 (_ BitVec 64)) Bool)

(assert (=> b!993222 (= res!663916 (not (contains!5771 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993223 () Bool)

(declare-fun res!663915 () Bool)

(assert (=> b!993223 (=> (not res!663915) (not e!560471))))

(assert (=> b!993223 (= res!663915 (not (contains!5771 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993224 () Bool)

(assert (=> b!993224 (= e!560471 false)))

(declare-fun lt!440309 () Bool)

(declare-fun noDuplicate!1404 (List!20972) Bool)

(assert (=> b!993224 (= lt!440309 (noDuplicate!1404 acc!919))))

(assert (= (and start!85452 res!663914) b!993222))

(assert (= (and b!993222 res!663916) b!993223))

(assert (= (and b!993223 res!663915) b!993224))

(declare-fun m!920421 () Bool)

(assert (=> start!85452 m!920421))

(declare-fun m!920423 () Bool)

(assert (=> b!993222 m!920423))

(declare-fun m!920425 () Bool)

(assert (=> b!993223 m!920425))

(declare-fun m!920427 () Bool)

(assert (=> b!993224 m!920427))

(push 1)

(assert (not start!85452))

(assert (not b!993224))

(assert (not b!993223))

(assert (not b!993222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

