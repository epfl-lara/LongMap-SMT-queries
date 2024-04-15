; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62340 () Bool)

(assert start!62340)

(declare-fun res!462067 () Bool)

(declare-fun e!396850 () Bool)

(assert (=> start!62340 (=> (not res!462067) (not e!396850))))

(declare-datatypes ((array!40030 0))(
  ( (array!40031 (arr!19171 (Array (_ BitVec 32) (_ BitVec 64))) (size!19553 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40030)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62340 (= res!462067 (and (bvslt (size!19553 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19553 a!3591))))))

(assert (=> start!62340 e!396850))

(assert (=> start!62340 true))

(declare-fun array_inv!15054 (array!40030) Bool)

(assert (=> start!62340 (array_inv!15054 a!3591)))

(declare-fun b!698096 () Bool)

(declare-fun res!462066 () Bool)

(assert (=> b!698096 (=> (not res!462066) (not e!396850))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!698096 (= res!462066 (validKeyInArray!0 k!2824))))

(declare-fun b!698097 () Bool)

(assert (=> b!698097 (= e!396850 (bvsgt from!2969 (size!19553 a!3591)))))

(declare-fun b!698098 () Bool)

(declare-fun res!462073 () Bool)

(assert (=> b!698098 (=> (not res!462073) (not e!396850))))

(declare-datatypes ((List!13251 0))(
  ( (Nil!13248) (Cons!13247 (h!14292 (_ BitVec 64)) (t!19524 List!13251)) )
))
(declare-fun acc!652 () List!13251)

(declare-fun noDuplicate!1042 (List!13251) Bool)

(assert (=> b!698098 (= res!462073 (noDuplicate!1042 acc!652))))

(declare-fun b!698099 () Bool)

(declare-fun res!462072 () Bool)

(assert (=> b!698099 (=> (not res!462072) (not e!396850))))

(declare-fun contains!3773 (List!13251 (_ BitVec 64)) Bool)

(assert (=> b!698099 (= res!462072 (not (contains!3773 acc!652 k!2824)))))

(declare-fun b!698100 () Bool)

(declare-fun res!462068 () Bool)

(assert (=> b!698100 (=> (not res!462068) (not e!396850))))

(declare-fun newAcc!49 () List!13251)

(assert (=> b!698100 (= res!462068 (noDuplicate!1042 newAcc!49))))

(declare-fun b!698101 () Bool)

(declare-fun res!462069 () Bool)

(assert (=> b!698101 (=> (not res!462069) (not e!396850))))

(assert (=> b!698101 (= res!462069 (not (contains!3773 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698102 () Bool)

(declare-fun res!462071 () Bool)

(assert (=> b!698102 (=> (not res!462071) (not e!396850))))

(declare-fun arrayContainsKey!0 (array!40030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698102 (= res!462071 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698103 () Bool)

(declare-fun res!462070 () Bool)

(assert (=> b!698103 (=> (not res!462070) (not e!396850))))

(assert (=> b!698103 (= res!462070 (not (contains!3773 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62340 res!462067) b!698098))

(assert (= (and b!698098 res!462073) b!698100))

(assert (= (and b!698100 res!462068) b!698101))

(assert (= (and b!698101 res!462069) b!698103))

(assert (= (and b!698103 res!462070) b!698102))

(assert (= (and b!698102 res!462071) b!698099))

(assert (= (and b!698099 res!462072) b!698096))

(assert (= (and b!698096 res!462066) b!698097))

(declare-fun m!657893 () Bool)

(assert (=> b!698103 m!657893))

(declare-fun m!657895 () Bool)

(assert (=> b!698101 m!657895))

(declare-fun m!657897 () Bool)

(assert (=> b!698100 m!657897))

(declare-fun m!657899 () Bool)

(assert (=> start!62340 m!657899))

(declare-fun m!657901 () Bool)

(assert (=> b!698096 m!657901))

(declare-fun m!657903 () Bool)

(assert (=> b!698098 m!657903))

(declare-fun m!657905 () Bool)

(assert (=> b!698099 m!657905))

(declare-fun m!657907 () Bool)

(assert (=> b!698102 m!657907))

(push 1)

(assert (not b!698098))

(assert (not b!698096))

(assert (not start!62340))

(assert (not b!698103))

(assert (not b!698101))

(assert (not b!698100))

(assert (not b!698099))

(assert (not b!698102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

