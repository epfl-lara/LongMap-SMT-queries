; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62568 () Bool)

(assert start!62568)

(declare-fun b!705546 () Bool)

(declare-fun res!469360 () Bool)

(declare-fun e!397843 () Bool)

(assert (=> b!705546 (=> (not res!469360) (not e!397843))))

(declare-datatypes ((List!13321 0))(
  ( (Nil!13318) (Cons!13317 (h!14362 (_ BitVec 64)) (t!19603 List!13321)) )
))
(declare-fun acc!652 () List!13321)

(declare-fun contains!3898 (List!13321 (_ BitVec 64)) Bool)

(assert (=> b!705546 (= res!469360 (not (contains!3898 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705547 () Bool)

(declare-fun res!469370 () Bool)

(assert (=> b!705547 (=> (not res!469370) (not e!397843))))

(declare-fun noDuplicate!1145 (List!13321) Bool)

(assert (=> b!705547 (= res!469370 (noDuplicate!1145 acc!652))))

(declare-fun b!705548 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40247 0))(
  ( (array!40248 (arr!19280 (Array (_ BitVec 32) (_ BitVec 64))) (size!19665 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40247)

(assert (=> b!705548 (= e!397843 (not (bvsle from!2969 (size!19665 a!3591))))))

(declare-fun newAcc!49 () List!13321)

(declare-fun arrayNoDuplicates!0 (array!40247 (_ BitVec 32) List!13321) Bool)

(assert (=> b!705548 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun k!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24610 0))(
  ( (Unit!24611) )
))
(declare-fun lt!317904 () Unit!24610)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40247 (_ BitVec 64) (_ BitVec 32) List!13321 List!13321) Unit!24610)

(assert (=> b!705548 (= lt!317904 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705549 () Bool)

(declare-fun res!469366 () Bool)

(assert (=> b!705549 (=> (not res!469366) (not e!397843))))

(assert (=> b!705549 (= res!469366 (not (contains!3898 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705550 () Bool)

(declare-fun res!469372 () Bool)

(assert (=> b!705550 (=> (not res!469372) (not e!397843))))

(assert (=> b!705550 (= res!469372 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19665 a!3591)))))

(declare-fun b!705551 () Bool)

(declare-fun res!469367 () Bool)

(assert (=> b!705551 (=> (not res!469367) (not e!397843))))

(assert (=> b!705551 (= res!469367 (noDuplicate!1145 newAcc!49))))

(declare-fun b!705552 () Bool)

(declare-fun res!469363 () Bool)

(assert (=> b!705552 (=> (not res!469363) (not e!397843))))

(assert (=> b!705552 (= res!469363 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!469371 () Bool)

(assert (=> start!62568 (=> (not res!469371) (not e!397843))))

(assert (=> start!62568 (= res!469371 (and (bvslt (size!19665 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19665 a!3591))))))

(assert (=> start!62568 e!397843))

(assert (=> start!62568 true))

(declare-fun array_inv!15076 (array!40247) Bool)

(assert (=> start!62568 (array_inv!15076 a!3591)))

(declare-fun b!705553 () Bool)

(declare-fun res!469358 () Bool)

(assert (=> b!705553 (=> (not res!469358) (not e!397843))))

(assert (=> b!705553 (= res!469358 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705554 () Bool)

(declare-fun res!469364 () Bool)

(assert (=> b!705554 (=> (not res!469364) (not e!397843))))

(declare-fun subseq!343 (List!13321 List!13321) Bool)

(assert (=> b!705554 (= res!469364 (subseq!343 acc!652 newAcc!49))))

(declare-fun b!705555 () Bool)

(declare-fun res!469357 () Bool)

(assert (=> b!705555 (=> (not res!469357) (not e!397843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705555 (= res!469357 (validKeyInArray!0 k!2824))))

(declare-fun b!705556 () Bool)

(declare-fun res!469359 () Bool)

(assert (=> b!705556 (=> (not res!469359) (not e!397843))))

(assert (=> b!705556 (= res!469359 (not (contains!3898 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705557 () Bool)

(declare-fun res!469369 () Bool)

(assert (=> b!705557 (=> (not res!469369) (not e!397843))))

(assert (=> b!705557 (= res!469369 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705558 () Bool)

(declare-fun res!469365 () Bool)

(assert (=> b!705558 (=> (not res!469365) (not e!397843))))

(assert (=> b!705558 (= res!469365 (not (contains!3898 acc!652 k!2824)))))

(declare-fun b!705559 () Bool)

(declare-fun res!469356 () Bool)

(assert (=> b!705559 (=> (not res!469356) (not e!397843))))

(assert (=> b!705559 (= res!469356 (not (contains!3898 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705560 () Bool)

(declare-fun res!469361 () Bool)

(assert (=> b!705560 (=> (not res!469361) (not e!397843))))

(declare-fun -!308 (List!13321 (_ BitVec 64)) List!13321)

(assert (=> b!705560 (= res!469361 (= (-!308 newAcc!49 k!2824) acc!652))))

(declare-fun b!705561 () Bool)

(declare-fun res!469373 () Bool)

(assert (=> b!705561 (=> (not res!469373) (not e!397843))))

(declare-fun arrayContainsKey!0 (array!40247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705561 (= res!469373 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705562 () Bool)

(declare-fun res!469362 () Bool)

(assert (=> b!705562 (=> (not res!469362) (not e!397843))))

(assert (=> b!705562 (= res!469362 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705563 () Bool)

(declare-fun res!469368 () Bool)

(assert (=> b!705563 (=> (not res!469368) (not e!397843))))

(assert (=> b!705563 (= res!469368 (not (validKeyInArray!0 (select (arr!19280 a!3591) from!2969))))))

(declare-fun b!705564 () Bool)

(declare-fun res!469374 () Bool)

(assert (=> b!705564 (=> (not res!469374) (not e!397843))))

(assert (=> b!705564 (= res!469374 (contains!3898 newAcc!49 k!2824))))

(assert (= (and start!62568 res!469371) b!705547))

(assert (= (and b!705547 res!469370) b!705551))

(assert (= (and b!705551 res!469367) b!705559))

(assert (= (and b!705559 res!469356) b!705546))

(assert (= (and b!705546 res!469360) b!705561))

(assert (= (and b!705561 res!469373) b!705558))

(assert (= (and b!705558 res!469365) b!705555))

(assert (= (and b!705555 res!469357) b!705553))

(assert (= (and b!705553 res!469358) b!705554))

(assert (= (and b!705554 res!469364) b!705564))

(assert (= (and b!705564 res!469374) b!705560))

(assert (= (and b!705560 res!469361) b!705549))

(assert (= (and b!705549 res!469366) b!705556))

(assert (= (and b!705556 res!469359) b!705550))

(assert (= (and b!705550 res!469372) b!705563))

(assert (= (and b!705563 res!469368) b!705552))

(assert (= (and b!705552 res!469363) b!705562))

(assert (= (and b!705562 res!469362) b!705557))

(assert (= (and b!705557 res!469369) b!705548))

(declare-fun m!663675 () Bool)

(assert (=> b!705553 m!663675))

(declare-fun m!663677 () Bool)

(assert (=> b!705549 m!663677))

(declare-fun m!663679 () Bool)

(assert (=> b!705561 m!663679))

(declare-fun m!663681 () Bool)

(assert (=> b!705548 m!663681))

(declare-fun m!663683 () Bool)

(assert (=> b!705548 m!663683))

(declare-fun m!663685 () Bool)

(assert (=> b!705559 m!663685))

(declare-fun m!663687 () Bool)

(assert (=> b!705557 m!663687))

(declare-fun m!663689 () Bool)

(assert (=> b!705558 m!663689))

(declare-fun m!663691 () Bool)

(assert (=> b!705556 m!663691))

(declare-fun m!663693 () Bool)

(assert (=> b!705554 m!663693))

(declare-fun m!663695 () Bool)

(assert (=> b!705562 m!663695))

(declare-fun m!663697 () Bool)

(assert (=> b!705547 m!663697))

(declare-fun m!663699 () Bool)

(assert (=> b!705546 m!663699))

(declare-fun m!663701 () Bool)

(assert (=> b!705563 m!663701))

(assert (=> b!705563 m!663701))

(declare-fun m!663703 () Bool)

(assert (=> b!705563 m!663703))

(declare-fun m!663705 () Bool)

(assert (=> b!705560 m!663705))

(declare-fun m!663707 () Bool)

(assert (=> b!705551 m!663707))

(declare-fun m!663709 () Bool)

(assert (=> b!705564 m!663709))

(declare-fun m!663711 () Bool)

(assert (=> start!62568 m!663711))

(declare-fun m!663713 () Bool)

(assert (=> b!705555 m!663713))

(push 1)

(assert (not b!705554))

(assert (not b!705561))

(assert (not b!705555))

(assert (not b!705564))

(assert (not b!705551))

(assert (not b!705547))

(assert (not b!705562))

(assert (not b!705549))

(assert (not b!705559))

(assert (not b!705556))

(assert (not b!705560))

(assert (not start!62568))

(assert (not b!705548))

(assert (not b!705546))

(assert (not b!705557))

(assert (not b!705553))

(assert (not b!705558))

(assert (not b!705563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

