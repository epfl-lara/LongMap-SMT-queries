; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62564 () Bool)

(assert start!62564)

(declare-fun b!705432 () Bool)

(declare-fun res!469250 () Bool)

(declare-fun e!397831 () Bool)

(assert (=> b!705432 (=> (not res!469250) (not e!397831))))

(declare-datatypes ((List!13319 0))(
  ( (Nil!13316) (Cons!13315 (h!14360 (_ BitVec 64)) (t!19601 List!13319)) )
))
(declare-fun acc!652 () List!13319)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3896 (List!13319 (_ BitVec 64)) Bool)

(assert (=> b!705432 (= res!469250 (not (contains!3896 acc!652 k!2824)))))

(declare-fun b!705433 () Bool)

(declare-fun res!469246 () Bool)

(assert (=> b!705433 (=> (not res!469246) (not e!397831))))

(declare-datatypes ((array!40243 0))(
  ( (array!40244 (arr!19278 (Array (_ BitVec 32) (_ BitVec 64))) (size!19663 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40243)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705433 (= res!469246 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705434 () Bool)

(declare-fun res!469259 () Bool)

(assert (=> b!705434 (=> (not res!469259) (not e!397831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705434 (= res!469259 (validKeyInArray!0 k!2824))))

(declare-fun b!705435 () Bool)

(declare-fun res!469242 () Bool)

(assert (=> b!705435 (=> (not res!469242) (not e!397831))))

(declare-fun arrayNoDuplicates!0 (array!40243 (_ BitVec 32) List!13319) Bool)

(assert (=> b!705435 (= res!469242 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705436 () Bool)

(declare-fun res!469256 () Bool)

(assert (=> b!705436 (=> (not res!469256) (not e!397831))))

(assert (=> b!705436 (= res!469256 (not (contains!3896 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705437 () Bool)

(declare-fun res!469255 () Bool)

(assert (=> b!705437 (=> (not res!469255) (not e!397831))))

(declare-fun newAcc!49 () List!13319)

(assert (=> b!705437 (= res!469255 (not (contains!3896 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705438 () Bool)

(declare-fun res!469258 () Bool)

(assert (=> b!705438 (=> (not res!469258) (not e!397831))))

(assert (=> b!705438 (= res!469258 (not (contains!3896 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469244 () Bool)

(assert (=> start!62564 (=> (not res!469244) (not e!397831))))

(assert (=> start!62564 (= res!469244 (and (bvslt (size!19663 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19663 a!3591))))))

(assert (=> start!62564 e!397831))

(assert (=> start!62564 true))

(declare-fun array_inv!15074 (array!40243) Bool)

(assert (=> start!62564 (array_inv!15074 a!3591)))

(declare-fun b!705439 () Bool)

(declare-fun res!469260 () Bool)

(assert (=> b!705439 (=> (not res!469260) (not e!397831))))

(assert (=> b!705439 (= res!469260 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705440 () Bool)

(declare-fun res!469253 () Bool)

(assert (=> b!705440 (=> (not res!469253) (not e!397831))))

(assert (=> b!705440 (= res!469253 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705441 () Bool)

(assert (=> b!705441 (= e!397831 (not (bvsle from!2969 (size!19663 a!3591))))))

(assert (=> b!705441 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24606 0))(
  ( (Unit!24607) )
))
(declare-fun lt!317898 () Unit!24606)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40243 (_ BitVec 64) (_ BitVec 32) List!13319 List!13319) Unit!24606)

(assert (=> b!705441 (= lt!317898 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705442 () Bool)

(declare-fun res!469251 () Bool)

(assert (=> b!705442 (=> (not res!469251) (not e!397831))))

(declare-fun subseq!341 (List!13319 List!13319) Bool)

(assert (=> b!705442 (= res!469251 (subseq!341 acc!652 newAcc!49))))

(declare-fun b!705443 () Bool)

(declare-fun res!469243 () Bool)

(assert (=> b!705443 (=> (not res!469243) (not e!397831))))

(assert (=> b!705443 (= res!469243 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19663 a!3591)))))

(declare-fun b!705444 () Bool)

(declare-fun res!469248 () Bool)

(assert (=> b!705444 (=> (not res!469248) (not e!397831))))

(assert (=> b!705444 (= res!469248 (not (contains!3896 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705445 () Bool)

(declare-fun res!469252 () Bool)

(assert (=> b!705445 (=> (not res!469252) (not e!397831))))

(declare-fun noDuplicate!1143 (List!13319) Bool)

(assert (=> b!705445 (= res!469252 (noDuplicate!1143 newAcc!49))))

(declare-fun b!705446 () Bool)

(declare-fun res!469249 () Bool)

(assert (=> b!705446 (=> (not res!469249) (not e!397831))))

(assert (=> b!705446 (= res!469249 (not (validKeyInArray!0 (select (arr!19278 a!3591) from!2969))))))

(declare-fun b!705447 () Bool)

(declare-fun res!469257 () Bool)

(assert (=> b!705447 (=> (not res!469257) (not e!397831))))

(assert (=> b!705447 (= res!469257 (noDuplicate!1143 acc!652))))

(declare-fun b!705448 () Bool)

(declare-fun res!469247 () Bool)

(assert (=> b!705448 (=> (not res!469247) (not e!397831))))

(assert (=> b!705448 (= res!469247 (contains!3896 newAcc!49 k!2824))))

(declare-fun b!705449 () Bool)

(declare-fun res!469245 () Bool)

(assert (=> b!705449 (=> (not res!469245) (not e!397831))))

(assert (=> b!705449 (= res!469245 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705450 () Bool)

(declare-fun res!469254 () Bool)

(assert (=> b!705450 (=> (not res!469254) (not e!397831))))

(declare-fun -!306 (List!13319 (_ BitVec 64)) List!13319)

(assert (=> b!705450 (= res!469254 (= (-!306 newAcc!49 k!2824) acc!652))))

(assert (= (and start!62564 res!469244) b!705447))

(assert (= (and b!705447 res!469257) b!705445))

(assert (= (and b!705445 res!469252) b!705444))

(assert (= (and b!705444 res!469248) b!705436))

(assert (= (and b!705436 res!469256) b!705433))

(assert (= (and b!705433 res!469246) b!705432))

(assert (= (and b!705432 res!469250) b!705434))

(assert (= (and b!705434 res!469259) b!705449))

(assert (= (and b!705449 res!469245) b!705442))

(assert (= (and b!705442 res!469251) b!705448))

(assert (= (and b!705448 res!469247) b!705450))

(assert (= (and b!705450 res!469254) b!705437))

(assert (= (and b!705437 res!469255) b!705438))

(assert (= (and b!705438 res!469258) b!705443))

(assert (= (and b!705443 res!469243) b!705446))

(assert (= (and b!705446 res!469249) b!705440))

(assert (= (and b!705440 res!469253) b!705439))

(assert (= (and b!705439 res!469260) b!705435))

(assert (= (and b!705435 res!469242) b!705441))

(declare-fun m!663595 () Bool)

(assert (=> b!705450 m!663595))

(declare-fun m!663597 () Bool)

(assert (=> b!705447 m!663597))

(declare-fun m!663599 () Bool)

(assert (=> b!705432 m!663599))

(declare-fun m!663601 () Bool)

(assert (=> b!705437 m!663601))

(declare-fun m!663603 () Bool)

(assert (=> b!705445 m!663603))

(declare-fun m!663605 () Bool)

(assert (=> b!705439 m!663605))

(declare-fun m!663607 () Bool)

(assert (=> b!705438 m!663607))

(declare-fun m!663609 () Bool)

(assert (=> b!705446 m!663609))

(assert (=> b!705446 m!663609))

(declare-fun m!663611 () Bool)

(assert (=> b!705446 m!663611))

(declare-fun m!663613 () Bool)

(assert (=> b!705442 m!663613))

(declare-fun m!663615 () Bool)

(assert (=> b!705433 m!663615))

(declare-fun m!663617 () Bool)

(assert (=> b!705448 m!663617))

(declare-fun m!663619 () Bool)

(assert (=> b!705449 m!663619))

(declare-fun m!663621 () Bool)

(assert (=> b!705435 m!663621))

(declare-fun m!663623 () Bool)

(assert (=> b!705434 m!663623))

(declare-fun m!663625 () Bool)

(assert (=> b!705444 m!663625))

(declare-fun m!663627 () Bool)

(assert (=> b!705441 m!663627))

(declare-fun m!663629 () Bool)

(assert (=> b!705441 m!663629))

(declare-fun m!663631 () Bool)

(assert (=> b!705436 m!663631))

(declare-fun m!663633 () Bool)

(assert (=> start!62564 m!663633))

(push 1)

(assert (not start!62564))

(assert (not b!705445))

(assert (not b!705446))

(assert (not b!705438))

(assert (not b!705442))

(assert (not b!705439))

(assert (not b!705441))

(assert (not b!705448))

(assert (not b!705432))

(assert (not b!705450))

(assert (not b!705434))

(assert (not b!705444))

(assert (not b!705433))

(assert (not b!705435))

(assert (not b!705449))

(assert (not b!705436))

(assert (not b!705437))

(assert (not b!705447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

