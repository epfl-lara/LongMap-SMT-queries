; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62470 () Bool)

(assert start!62470)

(declare-fun b!700567 () Bool)

(declare-fun res!464281 () Bool)

(declare-fun e!397400 () Bool)

(assert (=> b!700567 (=> (not res!464281) (not e!397400))))

(declare-datatypes ((List!13146 0))(
  ( (Nil!13143) (Cons!13142 (h!14190 (_ BitVec 64)) (t!19420 List!13146)) )
))
(declare-fun acc!652 () List!13146)

(declare-fun contains!3798 (List!13146 (_ BitVec 64)) Bool)

(assert (=> b!700567 (= res!464281 (not (contains!3798 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700568 () Bool)

(declare-fun res!464295 () Bool)

(declare-fun e!397399 () Bool)

(assert (=> b!700568 (=> (not res!464295) (not e!397399))))

(declare-fun lt!317578 () List!13146)

(declare-fun noDuplicate!1072 (List!13146) Bool)

(assert (=> b!700568 (= res!464295 (noDuplicate!1072 lt!317578))))

(declare-fun b!700569 () Bool)

(declare-fun res!464287 () Bool)

(assert (=> b!700569 (=> (not res!464287) (not e!397400))))

(declare-fun newAcc!49 () List!13146)

(assert (=> b!700569 (= res!464287 (not (contains!3798 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700570 () Bool)

(declare-fun res!464285 () Bool)

(assert (=> b!700570 (=> (not res!464285) (not e!397399))))

(declare-fun lt!317580 () List!13146)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!230 (List!13146 (_ BitVec 64)) List!13146)

(assert (=> b!700570 (= res!464285 (= (-!230 lt!317578 k0!2824) lt!317580))))

(declare-fun b!700571 () Bool)

(declare-fun res!464291 () Bool)

(assert (=> b!700571 (=> (not res!464291) (not e!397400))))

(assert (=> b!700571 (= res!464291 (noDuplicate!1072 newAcc!49))))

(declare-fun b!700572 () Bool)

(declare-fun res!464280 () Bool)

(assert (=> b!700572 (=> (not res!464280) (not e!397400))))

(assert (=> b!700572 (= res!464280 (not (contains!3798 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700573 () Bool)

(assert (=> b!700573 (= e!397400 e!397399)))

(declare-fun res!464297 () Bool)

(assert (=> b!700573 (=> (not res!464297) (not e!397399))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!700573 (= res!464297 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((array!40089 0))(
  ( (array!40090 (arr!19198 (Array (_ BitVec 32) (_ BitVec 64))) (size!19581 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40089)

(declare-fun $colon$colon!461 (List!13146 (_ BitVec 64)) List!13146)

(assert (=> b!700573 (= lt!317578 ($colon$colon!461 newAcc!49 (select (arr!19198 a!3591) from!2969)))))

(assert (=> b!700573 (= lt!317580 ($colon$colon!461 acc!652 (select (arr!19198 a!3591) from!2969)))))

(declare-fun b!700574 () Bool)

(declare-fun res!464305 () Bool)

(assert (=> b!700574 (=> (not res!464305) (not e!397400))))

(assert (=> b!700574 (= res!464305 (not (contains!3798 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700575 () Bool)

(declare-fun res!464294 () Bool)

(assert (=> b!700575 (=> (not res!464294) (not e!397400))))

(assert (=> b!700575 (= res!464294 (contains!3798 newAcc!49 k0!2824))))

(declare-fun b!700576 () Bool)

(assert (=> b!700576 (= e!397399 false)))

(declare-fun lt!317579 () Bool)

(assert (=> b!700576 (= lt!317579 (contains!3798 lt!317578 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!700577 () Bool)

(declare-fun res!464298 () Bool)

(assert (=> b!700577 (=> (not res!464298) (not e!397400))))

(assert (=> b!700577 (= res!464298 (noDuplicate!1072 acc!652))))

(declare-fun b!700578 () Bool)

(declare-fun res!464302 () Bool)

(assert (=> b!700578 (=> (not res!464302) (not e!397399))))

(assert (=> b!700578 (= res!464302 (not (contains!3798 lt!317578 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700579 () Bool)

(declare-fun res!464284 () Bool)

(assert (=> b!700579 (=> (not res!464284) (not e!397399))))

(assert (=> b!700579 (= res!464284 (not (contains!3798 lt!317580 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700580 () Bool)

(declare-fun res!464304 () Bool)

(assert (=> b!700580 (=> (not res!464304) (not e!397399))))

(declare-fun subseq!266 (List!13146 List!13146) Bool)

(assert (=> b!700580 (= res!464304 (subseq!266 lt!317580 lt!317578))))

(declare-fun b!700581 () Bool)

(declare-fun res!464286 () Bool)

(assert (=> b!700581 (=> (not res!464286) (not e!397399))))

(declare-fun arrayNoDuplicates!0 (array!40089 (_ BitVec 32) List!13146) Bool)

(assert (=> b!700581 (= res!464286 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317580))))

(declare-fun b!700582 () Bool)

(declare-fun res!464303 () Bool)

(assert (=> b!700582 (=> (not res!464303) (not e!397399))))

(declare-fun arrayContainsKey!0 (array!40089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700582 (= res!464303 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700583 () Bool)

(declare-fun res!464292 () Bool)

(assert (=> b!700583 (=> (not res!464292) (not e!397400))))

(assert (=> b!700583 (= res!464292 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19581 a!3591)))))

(declare-fun b!700584 () Bool)

(declare-fun res!464288 () Bool)

(assert (=> b!700584 (=> (not res!464288) (not e!397400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700584 (= res!464288 (validKeyInArray!0 k0!2824))))

(declare-fun b!700585 () Bool)

(declare-fun res!464299 () Bool)

(assert (=> b!700585 (=> (not res!464299) (not e!397400))))

(assert (=> b!700585 (= res!464299 (not (contains!3798 acc!652 k0!2824)))))

(declare-fun b!700586 () Bool)

(declare-fun res!464282 () Bool)

(assert (=> b!700586 (=> (not res!464282) (not e!397400))))

(assert (=> b!700586 (= res!464282 (subseq!266 acc!652 newAcc!49))))

(declare-fun b!700587 () Bool)

(declare-fun res!464290 () Bool)

(assert (=> b!700587 (=> (not res!464290) (not e!397400))))

(assert (=> b!700587 (= res!464290 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!700588 () Bool)

(declare-fun res!464296 () Bool)

(assert (=> b!700588 (=> (not res!464296) (not e!397399))))

(assert (=> b!700588 (= res!464296 (contains!3798 lt!317578 k0!2824))))

(declare-fun b!700589 () Bool)

(declare-fun res!464289 () Bool)

(assert (=> b!700589 (=> (not res!464289) (not e!397399))))

(assert (=> b!700589 (= res!464289 (not (contains!3798 lt!317580 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700590 () Bool)

(declare-fun res!464300 () Bool)

(assert (=> b!700590 (=> (not res!464300) (not e!397399))))

(assert (=> b!700590 (= res!464300 (noDuplicate!1072 lt!317580))))

(declare-fun b!700591 () Bool)

(declare-fun res!464279 () Bool)

(assert (=> b!700591 (=> (not res!464279) (not e!397400))))

(assert (=> b!700591 (= res!464279 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!700592 () Bool)

(declare-fun res!464283 () Bool)

(assert (=> b!700592 (=> (not res!464283) (not e!397400))))

(assert (=> b!700592 (= res!464283 (= (-!230 newAcc!49 k0!2824) acc!652))))

(declare-fun res!464293 () Bool)

(assert (=> start!62470 (=> (not res!464293) (not e!397400))))

(assert (=> start!62470 (= res!464293 (and (bvslt (size!19581 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19581 a!3591))))))

(assert (=> start!62470 e!397400))

(assert (=> start!62470 true))

(declare-fun array_inv!15057 (array!40089) Bool)

(assert (=> start!62470 (array_inv!15057 a!3591)))

(declare-fun b!700593 () Bool)

(declare-fun res!464301 () Bool)

(assert (=> b!700593 (=> (not res!464301) (not e!397400))))

(assert (=> b!700593 (= res!464301 (validKeyInArray!0 (select (arr!19198 a!3591) from!2969)))))

(declare-fun b!700594 () Bool)

(declare-fun res!464278 () Bool)

(assert (=> b!700594 (=> (not res!464278) (not e!397399))))

(assert (=> b!700594 (= res!464278 (not (contains!3798 lt!317580 k0!2824)))))

(assert (= (and start!62470 res!464293) b!700577))

(assert (= (and b!700577 res!464298) b!700571))

(assert (= (and b!700571 res!464291) b!700574))

(assert (= (and b!700574 res!464305) b!700567))

(assert (= (and b!700567 res!464281) b!700591))

(assert (= (and b!700591 res!464279) b!700585))

(assert (= (and b!700585 res!464299) b!700584))

(assert (= (and b!700584 res!464288) b!700587))

(assert (= (and b!700587 res!464290) b!700586))

(assert (= (and b!700586 res!464282) b!700575))

(assert (= (and b!700575 res!464294) b!700592))

(assert (= (and b!700592 res!464283) b!700572))

(assert (= (and b!700572 res!464280) b!700569))

(assert (= (and b!700569 res!464287) b!700583))

(assert (= (and b!700583 res!464292) b!700593))

(assert (= (and b!700593 res!464301) b!700573))

(assert (= (and b!700573 res!464297) b!700590))

(assert (= (and b!700590 res!464300) b!700568))

(assert (= (and b!700568 res!464295) b!700589))

(assert (= (and b!700589 res!464289) b!700579))

(assert (= (and b!700579 res!464284) b!700582))

(assert (= (and b!700582 res!464303) b!700594))

(assert (= (and b!700594 res!464278) b!700581))

(assert (= (and b!700581 res!464286) b!700580))

(assert (= (and b!700580 res!464304) b!700588))

(assert (= (and b!700588 res!464296) b!700570))

(assert (= (and b!700570 res!464285) b!700578))

(assert (= (and b!700578 res!464302) b!700576))

(declare-fun m!660711 () Bool)

(assert (=> b!700591 m!660711))

(declare-fun m!660713 () Bool)

(assert (=> b!700572 m!660713))

(declare-fun m!660715 () Bool)

(assert (=> b!700570 m!660715))

(declare-fun m!660717 () Bool)

(assert (=> b!700578 m!660717))

(declare-fun m!660719 () Bool)

(assert (=> b!700592 m!660719))

(declare-fun m!660721 () Bool)

(assert (=> b!700580 m!660721))

(declare-fun m!660723 () Bool)

(assert (=> b!700575 m!660723))

(declare-fun m!660725 () Bool)

(assert (=> b!700590 m!660725))

(declare-fun m!660727 () Bool)

(assert (=> b!700588 m!660727))

(declare-fun m!660729 () Bool)

(assert (=> b!700589 m!660729))

(declare-fun m!660731 () Bool)

(assert (=> b!700581 m!660731))

(declare-fun m!660733 () Bool)

(assert (=> b!700569 m!660733))

(declare-fun m!660735 () Bool)

(assert (=> b!700571 m!660735))

(declare-fun m!660737 () Bool)

(assert (=> start!62470 m!660737))

(declare-fun m!660739 () Bool)

(assert (=> b!700579 m!660739))

(declare-fun m!660741 () Bool)

(assert (=> b!700573 m!660741))

(assert (=> b!700573 m!660741))

(declare-fun m!660743 () Bool)

(assert (=> b!700573 m!660743))

(assert (=> b!700573 m!660741))

(declare-fun m!660745 () Bool)

(assert (=> b!700573 m!660745))

(declare-fun m!660747 () Bool)

(assert (=> b!700567 m!660747))

(declare-fun m!660749 () Bool)

(assert (=> b!700568 m!660749))

(declare-fun m!660751 () Bool)

(assert (=> b!700584 m!660751))

(declare-fun m!660753 () Bool)

(assert (=> b!700594 m!660753))

(declare-fun m!660755 () Bool)

(assert (=> b!700586 m!660755))

(declare-fun m!660757 () Bool)

(assert (=> b!700576 m!660757))

(declare-fun m!660759 () Bool)

(assert (=> b!700577 m!660759))

(declare-fun m!660761 () Bool)

(assert (=> b!700582 m!660761))

(assert (=> b!700593 m!660741))

(assert (=> b!700593 m!660741))

(declare-fun m!660763 () Bool)

(assert (=> b!700593 m!660763))

(declare-fun m!660765 () Bool)

(assert (=> b!700585 m!660765))

(declare-fun m!660767 () Bool)

(assert (=> b!700587 m!660767))

(declare-fun m!660769 () Bool)

(assert (=> b!700574 m!660769))

(check-sat (not b!700579) (not b!700589) (not b!700592) (not b!700571) (not b!700591) (not b!700567) (not b!700575) (not b!700576) (not b!700577) (not b!700584) (not b!700594) (not b!700570) (not b!700574) (not b!700578) (not b!700593) (not start!62470) (not b!700587) (not b!700581) (not b!700569) (not b!700573) (not b!700588) (not b!700586) (not b!700582) (not b!700580) (not b!700590) (not b!700572) (not b!700585) (not b!700568))
(check-sat)
