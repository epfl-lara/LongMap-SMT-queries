; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63346 () Bool)

(assert start!63346)

(declare-fun b!713404 () Bool)

(declare-fun res!476493 () Bool)

(declare-fun e!401249 () Bool)

(assert (=> b!713404 (=> (not res!476493) (not e!401249))))

(declare-datatypes ((List!13406 0))(
  ( (Nil!13403) (Cons!13402 (h!14447 (_ BitVec 64)) (t!19721 List!13406)) )
))
(declare-fun newAcc!49 () List!13406)

(declare-fun contains!3983 (List!13406 (_ BitVec 64)) Bool)

(assert (=> b!713404 (= res!476493 (not (contains!3983 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713405 () Bool)

(declare-fun res!476497 () Bool)

(assert (=> b!713405 (=> (not res!476497) (not e!401249))))

(declare-datatypes ((array!40450 0))(
  ( (array!40451 (arr!19365 (Array (_ BitVec 32) (_ BitVec 64))) (size!19776 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40450)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13406)

(declare-fun arrayNoDuplicates!0 (array!40450 (_ BitVec 32) List!13406) Bool)

(assert (=> b!713405 (= res!476497 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713406 () Bool)

(declare-fun res!476500 () Bool)

(assert (=> b!713406 (=> (not res!476500) (not e!401249))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713406 (= res!476500 (validKeyInArray!0 k!2824))))

(declare-fun b!713407 () Bool)

(declare-fun res!476501 () Bool)

(assert (=> b!713407 (=> (not res!476501) (not e!401249))))

(declare-fun arrayContainsKey!0 (array!40450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713407 (= res!476501 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713408 () Bool)

(declare-fun res!476494 () Bool)

(assert (=> b!713408 (=> (not res!476494) (not e!401249))))

(assert (=> b!713408 (= res!476494 (not (contains!3983 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713409 () Bool)

(declare-fun res!476491 () Bool)

(assert (=> b!713409 (=> (not res!476491) (not e!401249))))

(assert (=> b!713409 (= res!476491 (not (contains!3983 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713410 () Bool)

(declare-fun res!476498 () Bool)

(assert (=> b!713410 (=> (not res!476498) (not e!401249))))

(assert (=> b!713410 (= res!476498 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19776 a!3591)))))

(declare-fun b!713411 () Bool)

(declare-fun res!476503 () Bool)

(assert (=> b!713411 (=> (not res!476503) (not e!401249))))

(assert (=> b!713411 (= res!476503 (contains!3983 newAcc!49 k!2824))))

(declare-fun b!713412 () Bool)

(declare-fun res!476489 () Bool)

(assert (=> b!713412 (=> (not res!476489) (not e!401249))))

(assert (=> b!713412 (= res!476489 (not (contains!3983 acc!652 k!2824)))))

(declare-fun res!476492 () Bool)

(assert (=> start!63346 (=> (not res!476492) (not e!401249))))

(assert (=> start!63346 (= res!476492 (and (bvslt (size!19776 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19776 a!3591))))))

(assert (=> start!63346 e!401249))

(assert (=> start!63346 true))

(declare-fun array_inv!15161 (array!40450) Bool)

(assert (=> start!63346 (array_inv!15161 a!3591)))

(declare-fun b!713413 () Bool)

(declare-fun res!476499 () Bool)

(assert (=> b!713413 (=> (not res!476499) (not e!401249))))

(declare-fun subseq!428 (List!13406 List!13406) Bool)

(assert (=> b!713413 (= res!476499 (subseq!428 acc!652 newAcc!49))))

(declare-fun b!713414 () Bool)

(declare-fun res!476495 () Bool)

(assert (=> b!713414 (=> (not res!476495) (not e!401249))))

(declare-fun -!393 (List!13406 (_ BitVec 64)) List!13406)

(assert (=> b!713414 (= res!476495 (= (-!393 newAcc!49 k!2824) acc!652))))

(declare-fun b!713415 () Bool)

(assert (=> b!713415 (= e!401249 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!713416 () Bool)

(declare-fun res!476496 () Bool)

(assert (=> b!713416 (=> (not res!476496) (not e!401249))))

(assert (=> b!713416 (= res!476496 (not (validKeyInArray!0 (select (arr!19365 a!3591) from!2969))))))

(declare-fun b!713417 () Bool)

(declare-fun res!476490 () Bool)

(assert (=> b!713417 (=> (not res!476490) (not e!401249))))

(declare-fun noDuplicate!1230 (List!13406) Bool)

(assert (=> b!713417 (= res!476490 (noDuplicate!1230 acc!652))))

(declare-fun b!713418 () Bool)

(declare-fun res!476502 () Bool)

(assert (=> b!713418 (=> (not res!476502) (not e!401249))))

(assert (=> b!713418 (= res!476502 (noDuplicate!1230 newAcc!49))))

(declare-fun b!713419 () Bool)

(declare-fun res!476488 () Bool)

(assert (=> b!713419 (=> (not res!476488) (not e!401249))))

(assert (=> b!713419 (= res!476488 (not (contains!3983 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63346 res!476492) b!713417))

(assert (= (and b!713417 res!476490) b!713418))

(assert (= (and b!713418 res!476502) b!713408))

(assert (= (and b!713408 res!476494) b!713419))

(assert (= (and b!713419 res!476488) b!713407))

(assert (= (and b!713407 res!476501) b!713412))

(assert (= (and b!713412 res!476489) b!713406))

(assert (= (and b!713406 res!476500) b!713405))

(assert (= (and b!713405 res!476497) b!713413))

(assert (= (and b!713413 res!476499) b!713411))

(assert (= (and b!713411 res!476503) b!713414))

(assert (= (and b!713414 res!476495) b!713409))

(assert (= (and b!713409 res!476491) b!713404))

(assert (= (and b!713404 res!476493) b!713410))

(assert (= (and b!713410 res!476498) b!713416))

(assert (= (and b!713416 res!476496) b!713415))

(declare-fun m!670219 () Bool)

(assert (=> b!713416 m!670219))

(assert (=> b!713416 m!670219))

(declare-fun m!670221 () Bool)

(assert (=> b!713416 m!670221))

(declare-fun m!670223 () Bool)

(assert (=> b!713406 m!670223))

(declare-fun m!670225 () Bool)

(assert (=> b!713413 m!670225))

(declare-fun m!670227 () Bool)

(assert (=> b!713412 m!670227))

(declare-fun m!670229 () Bool)

(assert (=> b!713409 m!670229))

(declare-fun m!670231 () Bool)

(assert (=> b!713404 m!670231))

(declare-fun m!670233 () Bool)

(assert (=> b!713419 m!670233))

(declare-fun m!670235 () Bool)

(assert (=> start!63346 m!670235))

(declare-fun m!670237 () Bool)

(assert (=> b!713417 m!670237))

(declare-fun m!670239 () Bool)

(assert (=> b!713414 m!670239))

(declare-fun m!670241 () Bool)

(assert (=> b!713405 m!670241))

(declare-fun m!670243 () Bool)

(assert (=> b!713408 m!670243))

(declare-fun m!670245 () Bool)

(assert (=> b!713418 m!670245))

(declare-fun m!670247 () Bool)

(assert (=> b!713407 m!670247))

(declare-fun m!670249 () Bool)

(assert (=> b!713411 m!670249))

(push 1)

