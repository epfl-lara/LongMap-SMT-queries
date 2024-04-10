; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85448 () Bool)

(assert start!85448)

(declare-fun res!663926 () Bool)

(declare-fun e!560553 () Bool)

(assert (=> start!85448 (=> (not res!663926) (not e!560553))))

(declare-datatypes ((array!62729 0))(
  ( (array!62730 (arr!30208 (Array (_ BitVec 32) (_ BitVec 64))) (size!30705 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62729)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85448 (= res!663926 (and (= (size!30705 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62730 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30705 a!4424))))))

(assert (=> start!85448 e!560553))

(declare-fun array_inv!23332 (array!62729) Bool)

(assert (=> start!85448 (array_inv!23332 a!4424)))

(assert (=> start!85448 true))

(declare-fun b!993362 () Bool)

(declare-fun res!663925 () Bool)

(assert (=> b!993362 (=> (not res!663925) (not e!560553))))

(declare-datatypes ((List!20926 0))(
  ( (Nil!20923) (Cons!20922 (h!22084 (_ BitVec 64)) (t!29927 List!20926)) )
))
(declare-fun acc!919 () List!20926)

(declare-fun contains!5787 (List!20926 (_ BitVec 64)) Bool)

(assert (=> b!993362 (= res!663925 (not (contains!5787 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993363 () Bool)

(declare-fun res!663927 () Bool)

(assert (=> b!993363 (=> (not res!663927) (not e!560553))))

(assert (=> b!993363 (= res!663927 (not (contains!5787 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993364 () Bool)

(assert (=> b!993364 (= e!560553 false)))

(declare-fun lt!440512 () Bool)

(declare-fun noDuplicate!1385 (List!20926) Bool)

(assert (=> b!993364 (= lt!440512 (noDuplicate!1385 acc!919))))

(assert (= (and start!85448 res!663926) b!993362))

(assert (= (and b!993362 res!663925) b!993363))

(assert (= (and b!993363 res!663927) b!993364))

(declare-fun m!921091 () Bool)

(assert (=> start!85448 m!921091))

(declare-fun m!921093 () Bool)

(assert (=> b!993362 m!921093))

(declare-fun m!921095 () Bool)

(assert (=> b!993363 m!921095))

(declare-fun m!921097 () Bool)

(assert (=> b!993364 m!921097))

(push 1)

(assert (not b!993363))

(assert (not start!85448))

(assert (not b!993362))

(assert (not b!993364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

