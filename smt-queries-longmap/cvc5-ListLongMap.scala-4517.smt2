; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62562 () Bool)

(assert start!62562)

(declare-fun b!705429 () Bool)

(declare-fun res!469415 () Bool)

(declare-fun e!397678 () Bool)

(assert (=> b!705429 (=> (not res!469415) (not e!397678))))

(declare-datatypes ((array!40252 0))(
  ( (array!40253 (arr!19282 (Array (_ BitVec 32) (_ BitVec 64))) (size!19664 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40252)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705429 (= res!469415 (not (validKeyInArray!0 (select (arr!19282 a!3591) from!2969))))))

(declare-fun b!705430 () Bool)

(declare-fun res!469414 () Bool)

(assert (=> b!705430 (=> (not res!469414) (not e!397678))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705430 (= res!469414 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705431 () Bool)

(declare-fun res!469404 () Bool)

(assert (=> b!705431 (=> (not res!469404) (not e!397678))))

(assert (=> b!705431 (= res!469404 (validKeyInArray!0 k!2824))))

(declare-fun b!705432 () Bool)

(declare-fun res!469412 () Bool)

(assert (=> b!705432 (=> (not res!469412) (not e!397678))))

(declare-datatypes ((List!13362 0))(
  ( (Nil!13359) (Cons!13358 (h!14403 (_ BitVec 64)) (t!19635 List!13362)) )
))
(declare-fun acc!652 () List!13362)

(declare-fun noDuplicate!1153 (List!13362) Bool)

(assert (=> b!705432 (= res!469412 (noDuplicate!1153 acc!652))))

(declare-fun b!705433 () Bool)

(declare-fun res!469401 () Bool)

(assert (=> b!705433 (=> (not res!469401) (not e!397678))))

(declare-fun contains!3884 (List!13362 (_ BitVec 64)) Bool)

(assert (=> b!705433 (= res!469401 (not (contains!3884 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705434 () Bool)

(assert (=> b!705434 (= e!397678 (not true))))

(declare-fun newAcc!49 () List!13362)

(declare-fun arrayNoDuplicates!0 (array!40252 (_ BitVec 32) List!13362) Bool)

(assert (=> b!705434 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24594 0))(
  ( (Unit!24595) )
))
(declare-fun lt!317661 () Unit!24594)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40252 (_ BitVec 64) (_ BitVec 32) List!13362 List!13362) Unit!24594)

(assert (=> b!705434 (= lt!317661 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705435 () Bool)

(declare-fun res!469408 () Bool)

(assert (=> b!705435 (=> (not res!469408) (not e!397678))))

(declare-fun subseq!346 (List!13362 List!13362) Bool)

(assert (=> b!705435 (= res!469408 (subseq!346 acc!652 newAcc!49))))

(declare-fun b!705436 () Bool)

(declare-fun res!469411 () Bool)

(assert (=> b!705436 (=> (not res!469411) (not e!397678))))

(assert (=> b!705436 (= res!469411 (noDuplicate!1153 newAcc!49))))

(declare-fun b!705437 () Bool)

(declare-fun res!469400 () Bool)

(assert (=> b!705437 (=> (not res!469400) (not e!397678))))

(assert (=> b!705437 (= res!469400 (not (contains!3884 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705438 () Bool)

(declare-fun res!469413 () Bool)

(assert (=> b!705438 (=> (not res!469413) (not e!397678))))

(assert (=> b!705438 (= res!469413 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705439 () Bool)

(declare-fun res!469399 () Bool)

(assert (=> b!705439 (=> (not res!469399) (not e!397678))))

(assert (=> b!705439 (= res!469399 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705440 () Bool)

(declare-fun res!469407 () Bool)

(assert (=> b!705440 (=> (not res!469407) (not e!397678))))

(declare-fun -!311 (List!13362 (_ BitVec 64)) List!13362)

(assert (=> b!705440 (= res!469407 (= (-!311 newAcc!49 k!2824) acc!652))))

(declare-fun b!705442 () Bool)

(declare-fun res!469409 () Bool)

(assert (=> b!705442 (=> (not res!469409) (not e!397678))))

(assert (=> b!705442 (= res!469409 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19664 a!3591)))))

(declare-fun b!705443 () Bool)

(declare-fun res!469402 () Bool)

(assert (=> b!705443 (=> (not res!469402) (not e!397678))))

(assert (=> b!705443 (= res!469402 (not (contains!3884 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705444 () Bool)

(declare-fun res!469417 () Bool)

(assert (=> b!705444 (=> (not res!469417) (not e!397678))))

(assert (=> b!705444 (= res!469417 (not (contains!3884 acc!652 k!2824)))))

(declare-fun b!705445 () Bool)

(declare-fun res!469405 () Bool)

(assert (=> b!705445 (=> (not res!469405) (not e!397678))))

(assert (=> b!705445 (= res!469405 (not (contains!3884 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705446 () Bool)

(declare-fun res!469416 () Bool)

(assert (=> b!705446 (=> (not res!469416) (not e!397678))))

(assert (=> b!705446 (= res!469416 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705447 () Bool)

(declare-fun res!469406 () Bool)

(assert (=> b!705447 (=> (not res!469406) (not e!397678))))

(assert (=> b!705447 (= res!469406 (contains!3884 newAcc!49 k!2824))))

(declare-fun b!705441 () Bool)

(declare-fun res!469410 () Bool)

(assert (=> b!705441 (=> (not res!469410) (not e!397678))))

(assert (=> b!705441 (= res!469410 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!469403 () Bool)

(assert (=> start!62562 (=> (not res!469403) (not e!397678))))

(assert (=> start!62562 (= res!469403 (and (bvslt (size!19664 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19664 a!3591))))))

(assert (=> start!62562 e!397678))

(assert (=> start!62562 true))

(declare-fun array_inv!15165 (array!40252) Bool)

(assert (=> start!62562 (array_inv!15165 a!3591)))

(assert (= (and start!62562 res!469403) b!705432))

(assert (= (and b!705432 res!469412) b!705436))

(assert (= (and b!705436 res!469411) b!705443))

(assert (= (and b!705443 res!469402) b!705433))

(assert (= (and b!705433 res!469401) b!705430))

(assert (= (and b!705430 res!469414) b!705444))

(assert (= (and b!705444 res!469417) b!705431))

(assert (= (and b!705431 res!469404) b!705439))

(assert (= (and b!705439 res!469399) b!705435))

(assert (= (and b!705435 res!469408) b!705447))

(assert (= (and b!705447 res!469406) b!705440))

(assert (= (and b!705440 res!469407) b!705437))

(assert (= (and b!705437 res!469400) b!705445))

(assert (= (and b!705445 res!469405) b!705442))

(assert (= (and b!705442 res!469409) b!705429))

(assert (= (and b!705429 res!469415) b!705438))

(assert (= (and b!705438 res!469413) b!705441))

(assert (= (and b!705441 res!469410) b!705446))

(assert (= (and b!705446 res!469416) b!705434))

(declare-fun m!663035 () Bool)

(assert (=> b!705437 m!663035))

(declare-fun m!663037 () Bool)

(assert (=> b!705431 m!663037))

(declare-fun m!663039 () Bool)

(assert (=> b!705444 m!663039))

(declare-fun m!663041 () Bool)

(assert (=> b!705446 m!663041))

(declare-fun m!663043 () Bool)

(assert (=> b!705433 m!663043))

(declare-fun m!663045 () Bool)

(assert (=> b!705441 m!663045))

(declare-fun m!663047 () Bool)

(assert (=> b!705430 m!663047))

(declare-fun m!663049 () Bool)

(assert (=> b!705439 m!663049))

(declare-fun m!663051 () Bool)

(assert (=> b!705434 m!663051))

(declare-fun m!663053 () Bool)

(assert (=> b!705434 m!663053))

(declare-fun m!663055 () Bool)

(assert (=> b!705436 m!663055))

(declare-fun m!663057 () Bool)

(assert (=> start!62562 m!663057))

(declare-fun m!663059 () Bool)

(assert (=> b!705429 m!663059))

(assert (=> b!705429 m!663059))

(declare-fun m!663061 () Bool)

(assert (=> b!705429 m!663061))

(declare-fun m!663063 () Bool)

(assert (=> b!705443 m!663063))

(declare-fun m!663065 () Bool)

(assert (=> b!705447 m!663065))

(declare-fun m!663067 () Bool)

(assert (=> b!705445 m!663067))

(declare-fun m!663069 () Bool)

(assert (=> b!705440 m!663069))

(declare-fun m!663071 () Bool)

(assert (=> b!705435 m!663071))

(declare-fun m!663073 () Bool)

(assert (=> b!705432 m!663073))

(push 1)

(assert (not b!705441))

(assert (not b!705435))

(assert (not b!705444))

(assert (not b!705447))

(assert (not b!705445))

(assert (not b!705440))

(assert (not b!705437))

(assert (not b!705446))

(assert (not b!705432))

(assert (not b!705431))

(assert (not start!62562))

(assert (not b!705443))

(assert (not b!705433))

(assert (not b!705434))

(assert (not b!705436))

(assert (not b!705429))

(assert (not b!705439))

(assert (not b!705430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

