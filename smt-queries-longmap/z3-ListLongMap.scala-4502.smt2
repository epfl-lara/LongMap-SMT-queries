; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62536 () Bool)

(assert start!62536)

(declare-fun b!703355 () Bool)

(declare-fun res!467067 () Bool)

(declare-fun e!397695 () Bool)

(assert (=> b!703355 (=> (not res!467067) (not e!397695))))

(declare-datatypes ((List!13179 0))(
  ( (Nil!13176) (Cons!13175 (h!14223 (_ BitVec 64)) (t!19453 List!13179)) )
))
(declare-fun acc!652 () List!13179)

(declare-fun contains!3831 (List!13179 (_ BitVec 64)) Bool)

(assert (=> b!703355 (= res!467067 (not (contains!3831 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703356 () Bool)

(declare-fun res!467078 () Bool)

(assert (=> b!703356 (=> (not res!467078) (not e!397695))))

(declare-fun newAcc!49 () List!13179)

(declare-fun subseq!299 (List!13179 List!13179) Bool)

(assert (=> b!703356 (= res!467078 (subseq!299 acc!652 newAcc!49))))

(declare-fun b!703357 () Bool)

(declare-fun res!467072 () Bool)

(assert (=> b!703357 (=> (not res!467072) (not e!397695))))

(declare-datatypes ((array!40155 0))(
  ( (array!40156 (arr!19231 (Array (_ BitVec 32) (_ BitVec 64))) (size!19614 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40155)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703357 (= res!467072 (not (validKeyInArray!0 (select (arr!19231 a!3591) from!2969))))))

(declare-fun b!703358 () Bool)

(declare-fun res!467074 () Bool)

(assert (=> b!703358 (=> (not res!467074) (not e!397695))))

(assert (=> b!703358 (= res!467074 (not (contains!3831 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703359 () Bool)

(declare-fun res!467070 () Bool)

(assert (=> b!703359 (=> (not res!467070) (not e!397695))))

(assert (=> b!703359 (= res!467070 (not (contains!3831 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703360 () Bool)

(declare-fun res!467069 () Bool)

(assert (=> b!703360 (=> (not res!467069) (not e!397695))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703360 (= res!467069 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703361 () Bool)

(declare-fun res!467071 () Bool)

(assert (=> b!703361 (=> (not res!467071) (not e!397695))))

(declare-fun arrayNoDuplicates!0 (array!40155 (_ BitVec 32) List!13179) Bool)

(assert (=> b!703361 (= res!467071 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703362 () Bool)

(declare-fun res!467081 () Bool)

(assert (=> b!703362 (=> (not res!467081) (not e!397695))))

(assert (=> b!703362 (= res!467081 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703363 () Bool)

(declare-fun res!467083 () Bool)

(assert (=> b!703363 (=> (not res!467083) (not e!397695))))

(declare-fun noDuplicate!1105 (List!13179) Bool)

(assert (=> b!703363 (= res!467083 (noDuplicate!1105 newAcc!49))))

(declare-fun b!703364 () Bool)

(declare-fun res!467082 () Bool)

(assert (=> b!703364 (=> (not res!467082) (not e!397695))))

(assert (=> b!703364 (= res!467082 (contains!3831 newAcc!49 k0!2824))))

(declare-fun b!703365 () Bool)

(declare-fun res!467073 () Bool)

(assert (=> b!703365 (=> (not res!467073) (not e!397695))))

(assert (=> b!703365 (= res!467073 (validKeyInArray!0 k0!2824))))

(declare-fun b!703367 () Bool)

(declare-fun res!467077 () Bool)

(assert (=> b!703367 (=> (not res!467077) (not e!397695))))

(assert (=> b!703367 (= res!467077 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19614 a!3591)))))

(declare-fun b!703368 () Bool)

(declare-fun res!467068 () Bool)

(assert (=> b!703368 (=> (not res!467068) (not e!397695))))

(assert (=> b!703368 (= res!467068 (not (contains!3831 acc!652 k0!2824)))))

(declare-fun b!703369 () Bool)

(declare-fun res!467066 () Bool)

(assert (=> b!703369 (=> (not res!467066) (not e!397695))))

(assert (=> b!703369 (= res!467066 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703370 () Bool)

(declare-fun res!467079 () Bool)

(assert (=> b!703370 (=> (not res!467079) (not e!397695))))

(assert (=> b!703370 (= res!467079 (not (contains!3831 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703371 () Bool)

(declare-fun res!467080 () Bool)

(assert (=> b!703371 (=> (not res!467080) (not e!397695))))

(declare-fun -!263 (List!13179 (_ BitVec 64)) List!13179)

(assert (=> b!703371 (= res!467080 (= (-!263 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703372 () Bool)

(assert (=> b!703372 (= e!397695 false)))

(declare-fun lt!317871 () Bool)

(assert (=> b!703372 (= lt!317871 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703366 () Bool)

(declare-fun res!467076 () Bool)

(assert (=> b!703366 (=> (not res!467076) (not e!397695))))

(assert (=> b!703366 (= res!467076 (noDuplicate!1105 acc!652))))

(declare-fun res!467075 () Bool)

(assert (=> start!62536 (=> (not res!467075) (not e!397695))))

(assert (=> start!62536 (= res!467075 (and (bvslt (size!19614 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19614 a!3591))))))

(assert (=> start!62536 e!397695))

(assert (=> start!62536 true))

(declare-fun array_inv!15090 (array!40155) Bool)

(assert (=> start!62536 (array_inv!15090 a!3591)))

(assert (= (and start!62536 res!467075) b!703366))

(assert (= (and b!703366 res!467076) b!703363))

(assert (= (and b!703363 res!467083) b!703358))

(assert (= (and b!703358 res!467074) b!703355))

(assert (= (and b!703355 res!467067) b!703360))

(assert (= (and b!703360 res!467069) b!703368))

(assert (= (and b!703368 res!467068) b!703365))

(assert (= (and b!703365 res!467073) b!703361))

(assert (= (and b!703361 res!467071) b!703356))

(assert (= (and b!703356 res!467078) b!703364))

(assert (= (and b!703364 res!467082) b!703371))

(assert (= (and b!703371 res!467080) b!703359))

(assert (= (and b!703359 res!467070) b!703370))

(assert (= (and b!703370 res!467079) b!703367))

(assert (= (and b!703367 res!467077) b!703357))

(assert (= (and b!703357 res!467072) b!703362))

(assert (= (and b!703362 res!467081) b!703369))

(assert (= (and b!703369 res!467066) b!703372))

(declare-fun m!662739 () Bool)

(assert (=> b!703360 m!662739))

(declare-fun m!662741 () Bool)

(assert (=> start!62536 m!662741))

(declare-fun m!662743 () Bool)

(assert (=> b!703364 m!662743))

(declare-fun m!662745 () Bool)

(assert (=> b!703361 m!662745))

(declare-fun m!662747 () Bool)

(assert (=> b!703356 m!662747))

(declare-fun m!662749 () Bool)

(assert (=> b!703359 m!662749))

(declare-fun m!662751 () Bool)

(assert (=> b!703369 m!662751))

(declare-fun m!662753 () Bool)

(assert (=> b!703363 m!662753))

(declare-fun m!662755 () Bool)

(assert (=> b!703357 m!662755))

(assert (=> b!703357 m!662755))

(declare-fun m!662757 () Bool)

(assert (=> b!703357 m!662757))

(declare-fun m!662759 () Bool)

(assert (=> b!703355 m!662759))

(declare-fun m!662761 () Bool)

(assert (=> b!703368 m!662761))

(declare-fun m!662763 () Bool)

(assert (=> b!703365 m!662763))

(declare-fun m!662765 () Bool)

(assert (=> b!703370 m!662765))

(declare-fun m!662767 () Bool)

(assert (=> b!703366 m!662767))

(declare-fun m!662769 () Bool)

(assert (=> b!703372 m!662769))

(declare-fun m!662771 () Bool)

(assert (=> b!703358 m!662771))

(declare-fun m!662773 () Bool)

(assert (=> b!703371 m!662773))

(check-sat (not b!703361) (not b!703370) (not b!703372) (not b!703357) (not b!703360) (not b!703358) (not b!703368) (not b!703356) (not start!62536) (not b!703365) (not b!703366) (not b!703363) (not b!703355) (not b!703371) (not b!703369) (not b!703359) (not b!703364))
(check-sat)
