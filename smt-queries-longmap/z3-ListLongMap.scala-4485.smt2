; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62366 () Bool)

(assert start!62366)

(declare-fun b!698574 () Bool)

(declare-fun res!462552 () Bool)

(declare-fun e!396941 () Bool)

(assert (=> b!698574 (=> (not res!462552) (not e!396941))))

(declare-datatypes ((List!13264 0))(
  ( (Nil!13261) (Cons!13260 (h!14305 (_ BitVec 64)) (t!19537 List!13264)) )
))
(declare-fun lt!317067 () List!13264)

(declare-fun contains!3786 (List!13264 (_ BitVec 64)) Bool)

(assert (=> b!698574 (= res!462552 (not (contains!3786 lt!317067 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698575 () Bool)

(declare-fun res!462567 () Bool)

(declare-fun e!396940 () Bool)

(assert (=> b!698575 (=> (not res!462567) (not e!396940))))

(declare-fun acc!652 () List!13264)

(assert (=> b!698575 (= res!462567 (not (contains!3786 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698576 () Bool)

(declare-fun res!462566 () Bool)

(assert (=> b!698576 (=> (not res!462566) (not e!396940))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40056 0))(
  ( (array!40057 (arr!19184 (Array (_ BitVec 32) (_ BitVec 64))) (size!19566 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40056)

(assert (=> b!698576 (= res!462566 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19566 a!3591)))))

(declare-fun b!698577 () Bool)

(declare-fun res!462563 () Bool)

(assert (=> b!698577 (=> (not res!462563) (not e!396940))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!698577 (= res!462563 (validKeyInArray!0 k0!2824))))

(declare-fun b!698578 () Bool)

(declare-fun res!462553 () Bool)

(assert (=> b!698578 (=> (not res!462553) (not e!396941))))

(declare-fun arrayContainsKey!0 (array!40056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698578 (= res!462553 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!698579 () Bool)

(declare-fun res!462545 () Bool)

(assert (=> b!698579 (=> (not res!462545) (not e!396940))))

(declare-fun newAcc!49 () List!13264)

(declare-fun -!213 (List!13264 (_ BitVec 64)) List!13264)

(assert (=> b!698579 (= res!462545 (= (-!213 newAcc!49 k0!2824) acc!652))))

(declare-fun b!698580 () Bool)

(declare-fun res!462550 () Bool)

(assert (=> b!698580 (=> (not res!462550) (not e!396940))))

(assert (=> b!698580 (= res!462550 (not (contains!3786 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698581 () Bool)

(declare-fun res!462557 () Bool)

(assert (=> b!698581 (=> (not res!462557) (not e!396941))))

(declare-fun lt!317065 () List!13264)

(declare-fun noDuplicate!1055 (List!13264) Bool)

(assert (=> b!698581 (= res!462557 (noDuplicate!1055 lt!317065))))

(declare-fun b!698582 () Bool)

(declare-fun res!462558 () Bool)

(assert (=> b!698582 (=> (not res!462558) (not e!396941))))

(assert (=> b!698582 (= res!462558 (contains!3786 lt!317065 k0!2824))))

(declare-fun b!698583 () Bool)

(declare-fun res!462562 () Bool)

(assert (=> b!698583 (=> (not res!462562) (not e!396940))))

(declare-fun subseq!248 (List!13264 List!13264) Bool)

(assert (=> b!698583 (= res!462562 (subseq!248 acc!652 newAcc!49))))

(declare-fun res!462554 () Bool)

(assert (=> start!62366 (=> (not res!462554) (not e!396940))))

(assert (=> start!62366 (= res!462554 (and (bvslt (size!19566 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19566 a!3591))))))

(assert (=> start!62366 e!396940))

(assert (=> start!62366 true))

(declare-fun array_inv!15067 (array!40056) Bool)

(assert (=> start!62366 (array_inv!15067 a!3591)))

(declare-fun b!698584 () Bool)

(declare-fun res!462544 () Bool)

(assert (=> b!698584 (=> (not res!462544) (not e!396940))))

(declare-fun arrayNoDuplicates!0 (array!40056 (_ BitVec 32) List!13264) Bool)

(assert (=> b!698584 (= res!462544 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!698585 () Bool)

(declare-fun res!462555 () Bool)

(assert (=> b!698585 (=> (not res!462555) (not e!396940))))

(assert (=> b!698585 (= res!462555 (contains!3786 newAcc!49 k0!2824))))

(declare-fun b!698586 () Bool)

(declare-fun res!462547 () Bool)

(assert (=> b!698586 (=> (not res!462547) (not e!396940))))

(assert (=> b!698586 (= res!462547 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698587 () Bool)

(declare-fun res!462565 () Bool)

(assert (=> b!698587 (=> (not res!462565) (not e!396940))))

(assert (=> b!698587 (= res!462565 (noDuplicate!1055 acc!652))))

(declare-fun b!698588 () Bool)

(declare-fun res!462564 () Bool)

(assert (=> b!698588 (=> (not res!462564) (not e!396941))))

(assert (=> b!698588 (= res!462564 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317067))))

(declare-fun b!698589 () Bool)

(declare-fun res!462560 () Bool)

(assert (=> b!698589 (=> (not res!462560) (not e!396940))))

(assert (=> b!698589 (= res!462560 (validKeyInArray!0 (select (arr!19184 a!3591) from!2969)))))

(declare-fun b!698590 () Bool)

(declare-fun res!462551 () Bool)

(assert (=> b!698590 (=> (not res!462551) (not e!396941))))

(assert (=> b!698590 (= res!462551 (not (contains!3786 lt!317065 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698591 () Bool)

(declare-fun res!462546 () Bool)

(assert (=> b!698591 (=> (not res!462546) (not e!396940))))

(assert (=> b!698591 (= res!462546 (noDuplicate!1055 newAcc!49))))

(declare-fun b!698592 () Bool)

(declare-fun res!462570 () Bool)

(assert (=> b!698592 (=> (not res!462570) (not e!396940))))

(assert (=> b!698592 (= res!462570 (not (contains!3786 acc!652 k0!2824)))))

(declare-fun b!698593 () Bool)

(declare-fun res!462559 () Bool)

(assert (=> b!698593 (=> (not res!462559) (not e!396941))))

(assert (=> b!698593 (= res!462559 (subseq!248 lt!317067 lt!317065))))

(declare-fun b!698594 () Bool)

(declare-fun res!462561 () Bool)

(assert (=> b!698594 (=> (not res!462561) (not e!396940))))

(assert (=> b!698594 (= res!462561 (not (contains!3786 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698595 () Bool)

(assert (=> b!698595 (= e!396940 e!396941)))

(declare-fun res!462571 () Bool)

(assert (=> b!698595 (=> (not res!462571) (not e!396941))))

(assert (=> b!698595 (= res!462571 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!445 (List!13264 (_ BitVec 64)) List!13264)

(assert (=> b!698595 (= lt!317065 ($colon$colon!445 newAcc!49 (select (arr!19184 a!3591) from!2969)))))

(assert (=> b!698595 (= lt!317067 ($colon$colon!445 acc!652 (select (arr!19184 a!3591) from!2969)))))

(declare-fun b!698596 () Bool)

(declare-fun res!462548 () Bool)

(assert (=> b!698596 (=> (not res!462548) (not e!396941))))

(assert (=> b!698596 (= res!462548 (noDuplicate!1055 lt!317067))))

(declare-fun b!698597 () Bool)

(declare-fun res!462556 () Bool)

(assert (=> b!698597 (=> (not res!462556) (not e!396941))))

(assert (=> b!698597 (= res!462556 (not (contains!3786 lt!317067 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698598 () Bool)

(assert (=> b!698598 (= e!396941 false)))

(declare-fun lt!317066 () Bool)

(assert (=> b!698598 (= lt!317066 (contains!3786 lt!317065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698599 () Bool)

(declare-fun res!462568 () Bool)

(assert (=> b!698599 (=> (not res!462568) (not e!396941))))

(assert (=> b!698599 (= res!462568 (not (contains!3786 lt!317067 k0!2824)))))

(declare-fun b!698600 () Bool)

(declare-fun res!462549 () Bool)

(assert (=> b!698600 (=> (not res!462549) (not e!396941))))

(assert (=> b!698600 (= res!462549 (= (-!213 lt!317065 k0!2824) lt!317067))))

(declare-fun b!698601 () Bool)

(declare-fun res!462569 () Bool)

(assert (=> b!698601 (=> (not res!462569) (not e!396940))))

(assert (=> b!698601 (= res!462569 (not (contains!3786 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62366 res!462554) b!698587))

(assert (= (and b!698587 res!462565) b!698591))

(assert (= (and b!698591 res!462546) b!698575))

(assert (= (and b!698575 res!462567) b!698580))

(assert (= (and b!698580 res!462550) b!698586))

(assert (= (and b!698586 res!462547) b!698592))

(assert (= (and b!698592 res!462570) b!698577))

(assert (= (and b!698577 res!462563) b!698584))

(assert (= (and b!698584 res!462544) b!698583))

(assert (= (and b!698583 res!462562) b!698585))

(assert (= (and b!698585 res!462555) b!698579))

(assert (= (and b!698579 res!462545) b!698594))

(assert (= (and b!698594 res!462561) b!698601))

(assert (= (and b!698601 res!462569) b!698576))

(assert (= (and b!698576 res!462566) b!698589))

(assert (= (and b!698589 res!462560) b!698595))

(assert (= (and b!698595 res!462571) b!698596))

(assert (= (and b!698596 res!462548) b!698581))

(assert (= (and b!698581 res!462557) b!698574))

(assert (= (and b!698574 res!462552) b!698597))

(assert (= (and b!698597 res!462556) b!698578))

(assert (= (and b!698578 res!462553) b!698599))

(assert (= (and b!698599 res!462568) b!698588))

(assert (= (and b!698588 res!462564) b!698593))

(assert (= (and b!698593 res!462559) b!698582))

(assert (= (and b!698582 res!462558) b!698600))

(assert (= (and b!698600 res!462549) b!698590))

(assert (= (and b!698590 res!462551) b!698598))

(declare-fun m!658215 () Bool)

(assert (=> b!698584 m!658215))

(declare-fun m!658217 () Bool)

(assert (=> b!698579 m!658217))

(declare-fun m!658219 () Bool)

(assert (=> b!698574 m!658219))

(declare-fun m!658221 () Bool)

(assert (=> b!698589 m!658221))

(assert (=> b!698589 m!658221))

(declare-fun m!658223 () Bool)

(assert (=> b!698589 m!658223))

(declare-fun m!658225 () Bool)

(assert (=> b!698601 m!658225))

(declare-fun m!658227 () Bool)

(assert (=> b!698578 m!658227))

(declare-fun m!658229 () Bool)

(assert (=> b!698586 m!658229))

(declare-fun m!658231 () Bool)

(assert (=> b!698596 m!658231))

(declare-fun m!658233 () Bool)

(assert (=> b!698580 m!658233))

(declare-fun m!658235 () Bool)

(assert (=> b!698575 m!658235))

(declare-fun m!658237 () Bool)

(assert (=> b!698587 m!658237))

(declare-fun m!658239 () Bool)

(assert (=> b!698592 m!658239))

(declare-fun m!658241 () Bool)

(assert (=> b!698599 m!658241))

(declare-fun m!658243 () Bool)

(assert (=> b!698597 m!658243))

(declare-fun m!658245 () Bool)

(assert (=> b!698582 m!658245))

(declare-fun m!658247 () Bool)

(assert (=> b!698583 m!658247))

(declare-fun m!658249 () Bool)

(assert (=> b!698577 m!658249))

(declare-fun m!658251 () Bool)

(assert (=> b!698600 m!658251))

(declare-fun m!658253 () Bool)

(assert (=> b!698585 m!658253))

(declare-fun m!658255 () Bool)

(assert (=> b!698591 m!658255))

(assert (=> b!698595 m!658221))

(assert (=> b!698595 m!658221))

(declare-fun m!658257 () Bool)

(assert (=> b!698595 m!658257))

(assert (=> b!698595 m!658221))

(declare-fun m!658259 () Bool)

(assert (=> b!698595 m!658259))

(declare-fun m!658261 () Bool)

(assert (=> start!62366 m!658261))

(declare-fun m!658263 () Bool)

(assert (=> b!698581 m!658263))

(declare-fun m!658265 () Bool)

(assert (=> b!698588 m!658265))

(declare-fun m!658267 () Bool)

(assert (=> b!698590 m!658267))

(declare-fun m!658269 () Bool)

(assert (=> b!698593 m!658269))

(declare-fun m!658271 () Bool)

(assert (=> b!698598 m!658271))

(declare-fun m!658273 () Bool)

(assert (=> b!698594 m!658273))

(check-sat (not b!698592) (not b!698593) (not b!698601) (not b!698584) (not b!698587) (not b!698591) (not start!62366) (not b!698590) (not b!698586) (not b!698599) (not b!698579) (not b!698582) (not b!698598) (not b!698580) (not b!698597) (not b!698588) (not b!698600) (not b!698583) (not b!698594) (not b!698595) (not b!698577) (not b!698574) (not b!698596) (not b!698575) (not b!698589) (not b!698585) (not b!698578) (not b!698581))
(check-sat)
