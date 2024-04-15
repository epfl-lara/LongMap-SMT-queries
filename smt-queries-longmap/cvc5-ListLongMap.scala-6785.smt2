; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85434 () Bool)

(assert start!85434)

(declare-fun res!663834 () Bool)

(declare-fun e!560416 () Bool)

(assert (=> start!85434 (=> (not res!663834) (not e!560416))))

(declare-datatypes ((array!62670 0))(
  ( (array!62671 (arr!30179 (Array (_ BitVec 32) (_ BitVec 64))) (size!30677 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62670)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85434 (= res!663834 (and (= (size!30677 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62671 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30677 a!4424))))))

(assert (=> start!85434 e!560416))

(declare-fun array_inv!23322 (array!62670) Bool)

(assert (=> start!85434 (array_inv!23322 a!4424)))

(assert (=> start!85434 true))

(declare-fun b!993141 () Bool)

(declare-fun res!663833 () Bool)

(assert (=> b!993141 (=> (not res!663833) (not e!560416))))

(declare-datatypes ((List!20963 0))(
  ( (Nil!20960) (Cons!20959 (h!22121 (_ BitVec 64)) (t!29955 List!20963)) )
))
(declare-fun acc!919 () List!20963)

(declare-fun contains!5762 (List!20963 (_ BitVec 64)) Bool)

(assert (=> b!993141 (= res!663833 (not (contains!5762 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993142 () Bool)

(declare-fun res!663835 () Bool)

(assert (=> b!993142 (=> (not res!663835) (not e!560416))))

(assert (=> b!993142 (= res!663835 (not (contains!5762 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993143 () Bool)

(assert (=> b!993143 (= e!560416 false)))

(declare-fun lt!440282 () Bool)

(declare-fun noDuplicate!1395 (List!20963) Bool)

(assert (=> b!993143 (= lt!440282 (noDuplicate!1395 acc!919))))

(assert (= (and start!85434 res!663834) b!993141))

(assert (= (and b!993141 res!663833) b!993142))

(assert (= (and b!993142 res!663835) b!993143))

(declare-fun m!920349 () Bool)

(assert (=> start!85434 m!920349))

(declare-fun m!920351 () Bool)

(assert (=> b!993141 m!920351))

(declare-fun m!920353 () Bool)

(assert (=> b!993142 m!920353))

(declare-fun m!920355 () Bool)

(assert (=> b!993143 m!920355))

(push 1)

(assert (not start!85434))

(assert (not b!993143))

(assert (not b!993142))

(assert (not b!993141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

