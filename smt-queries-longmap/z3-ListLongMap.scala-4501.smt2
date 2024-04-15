; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62462 () Bool)

(assert start!62462)

(declare-fun b!702635 () Bool)

(declare-fun res!466618 () Bool)

(declare-fun e!397372 () Bool)

(assert (=> b!702635 (=> (not res!466618) (not e!397372))))

(declare-datatypes ((List!13312 0))(
  ( (Nil!13309) (Cons!13308 (h!14353 (_ BitVec 64)) (t!19585 List!13312)) )
))
(declare-fun lt!317497 () List!13312)

(declare-fun noDuplicate!1103 (List!13312) Bool)

(assert (=> b!702635 (= res!466618 (noDuplicate!1103 lt!317497))))

(declare-fun b!702636 () Bool)

(declare-fun res!466625 () Bool)

(declare-fun e!397371 () Bool)

(assert (=> b!702636 (=> (not res!466625) (not e!397371))))

(declare-fun newAcc!49 () List!13312)

(declare-fun contains!3834 (List!13312 (_ BitVec 64)) Bool)

(assert (=> b!702636 (= res!466625 (not (contains!3834 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702637 () Bool)

(declare-fun res!466627 () Bool)

(assert (=> b!702637 (=> (not res!466627) (not e!397371))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13312)

(declare-fun -!261 (List!13312 (_ BitVec 64)) List!13312)

(assert (=> b!702637 (= res!466627 (= (-!261 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702638 () Bool)

(declare-fun res!466631 () Bool)

(assert (=> b!702638 (=> (not res!466631) (not e!397371))))

(declare-datatypes ((array!40152 0))(
  ( (array!40153 (arr!19232 (Array (_ BitVec 32) (_ BitVec 64))) (size!19614 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40152)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702638 (= res!466631 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702639 () Bool)

(assert (=> b!702639 (= e!397371 e!397372)))

(declare-fun res!466629 () Bool)

(assert (=> b!702639 (=> (not res!466629) (not e!397372))))

(assert (=> b!702639 (= res!466629 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!493 (List!13312 (_ BitVec 64)) List!13312)

(assert (=> b!702639 (= lt!317497 ($colon$colon!493 newAcc!49 (select (arr!19232 a!3591) from!2969)))))

(declare-fun lt!317499 () List!13312)

(assert (=> b!702639 (= lt!317499 ($colon$colon!493 acc!652 (select (arr!19232 a!3591) from!2969)))))

(declare-fun b!702640 () Bool)

(declare-fun res!466613 () Bool)

(assert (=> b!702640 (=> (not res!466613) (not e!397371))))

(assert (=> b!702640 (= res!466613 (noDuplicate!1103 newAcc!49))))

(declare-fun b!702641 () Bool)

(declare-fun res!466615 () Bool)

(assert (=> b!702641 (=> (not res!466615) (not e!397371))))

(declare-fun arrayNoDuplicates!0 (array!40152 (_ BitVec 32) List!13312) Bool)

(assert (=> b!702641 (= res!466615 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!466626 () Bool)

(assert (=> start!62462 (=> (not res!466626) (not e!397371))))

(assert (=> start!62462 (= res!466626 (and (bvslt (size!19614 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19614 a!3591))))))

(assert (=> start!62462 e!397371))

(assert (=> start!62462 true))

(declare-fun array_inv!15115 (array!40152) Bool)

(assert (=> start!62462 (array_inv!15115 a!3591)))

(declare-fun b!702642 () Bool)

(declare-fun res!466609 () Bool)

(assert (=> b!702642 (=> (not res!466609) (not e!397372))))

(assert (=> b!702642 (= res!466609 (contains!3834 lt!317497 k0!2824))))

(declare-fun b!702643 () Bool)

(declare-fun res!466619 () Bool)

(assert (=> b!702643 (=> (not res!466619) (not e!397372))))

(assert (=> b!702643 (= res!466619 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702644 () Bool)

(declare-fun res!466633 () Bool)

(assert (=> b!702644 (=> (not res!466633) (not e!397372))))

(assert (=> b!702644 (= res!466633 (not (contains!3834 lt!317499 k0!2824)))))

(declare-fun b!702645 () Bool)

(declare-fun res!466612 () Bool)

(assert (=> b!702645 (=> (not res!466612) (not e!397371))))

(assert (=> b!702645 (= res!466612 (not (contains!3834 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702646 () Bool)

(declare-fun res!466621 () Bool)

(assert (=> b!702646 (=> (not res!466621) (not e!397372))))

(declare-fun subseq!296 (List!13312 List!13312) Bool)

(assert (=> b!702646 (= res!466621 (subseq!296 lt!317499 lt!317497))))

(declare-fun b!702647 () Bool)

(declare-fun res!466622 () Bool)

(assert (=> b!702647 (=> (not res!466622) (not e!397372))))

(assert (=> b!702647 (= res!466622 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317499))))

(declare-fun b!702648 () Bool)

(assert (=> b!702648 (= e!397372 (not true))))

(assert (=> b!702648 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317497)))

(declare-datatypes ((Unit!24578 0))(
  ( (Unit!24579) )
))
(declare-fun lt!317498 () Unit!24578)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40152 (_ BitVec 64) (_ BitVec 32) List!13312 List!13312) Unit!24578)

(assert (=> b!702648 (= lt!317498 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317499 lt!317497))))

(declare-fun b!702649 () Bool)

(declare-fun res!466620 () Bool)

(assert (=> b!702649 (=> (not res!466620) (not e!397372))))

(assert (=> b!702649 (= res!466620 (not (contains!3834 lt!317497 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702650 () Bool)

(declare-fun res!466617 () Bool)

(assert (=> b!702650 (=> (not res!466617) (not e!397371))))

(assert (=> b!702650 (= res!466617 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19614 a!3591)))))

(declare-fun b!702651 () Bool)

(declare-fun res!466608 () Bool)

(assert (=> b!702651 (=> (not res!466608) (not e!397371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702651 (= res!466608 (validKeyInArray!0 k0!2824))))

(declare-fun b!702652 () Bool)

(declare-fun res!466606 () Bool)

(assert (=> b!702652 (=> (not res!466606) (not e!397371))))

(assert (=> b!702652 (= res!466606 (validKeyInArray!0 (select (arr!19232 a!3591) from!2969)))))

(declare-fun b!702653 () Bool)

(declare-fun res!466628 () Bool)

(assert (=> b!702653 (=> (not res!466628) (not e!397372))))

(assert (=> b!702653 (= res!466628 (noDuplicate!1103 lt!317499))))

(declare-fun b!702654 () Bool)

(declare-fun res!466630 () Bool)

(assert (=> b!702654 (=> (not res!466630) (not e!397371))))

(assert (=> b!702654 (= res!466630 (not (contains!3834 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702655 () Bool)

(declare-fun res!466610 () Bool)

(assert (=> b!702655 (=> (not res!466610) (not e!397371))))

(assert (=> b!702655 (= res!466610 (noDuplicate!1103 acc!652))))

(declare-fun b!702656 () Bool)

(declare-fun res!466623 () Bool)

(assert (=> b!702656 (=> (not res!466623) (not e!397371))))

(assert (=> b!702656 (= res!466623 (not (contains!3834 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702657 () Bool)

(declare-fun res!466624 () Bool)

(assert (=> b!702657 (=> (not res!466624) (not e!397371))))

(assert (=> b!702657 (= res!466624 (not (contains!3834 acc!652 k0!2824)))))

(declare-fun b!702658 () Bool)

(declare-fun res!466605 () Bool)

(assert (=> b!702658 (=> (not res!466605) (not e!397372))))

(assert (=> b!702658 (= res!466605 (not (contains!3834 lt!317499 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702659 () Bool)

(declare-fun res!466616 () Bool)

(assert (=> b!702659 (=> (not res!466616) (not e!397371))))

(assert (=> b!702659 (= res!466616 (subseq!296 acc!652 newAcc!49))))

(declare-fun b!702660 () Bool)

(declare-fun res!466607 () Bool)

(assert (=> b!702660 (=> (not res!466607) (not e!397372))))

(assert (=> b!702660 (= res!466607 (= (-!261 lt!317497 k0!2824) lt!317499))))

(declare-fun b!702661 () Bool)

(declare-fun res!466632 () Bool)

(assert (=> b!702661 (=> (not res!466632) (not e!397371))))

(assert (=> b!702661 (= res!466632 (contains!3834 newAcc!49 k0!2824))))

(declare-fun b!702662 () Bool)

(declare-fun res!466611 () Bool)

(assert (=> b!702662 (=> (not res!466611) (not e!397372))))

(assert (=> b!702662 (= res!466611 (not (contains!3834 lt!317497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702663 () Bool)

(declare-fun res!466614 () Bool)

(assert (=> b!702663 (=> (not res!466614) (not e!397372))))

(assert (=> b!702663 (= res!466614 (not (contains!3834 lt!317499 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62462 res!466626) b!702655))

(assert (= (and b!702655 res!466610) b!702640))

(assert (= (and b!702640 res!466613) b!702645))

(assert (= (and b!702645 res!466612) b!702654))

(assert (= (and b!702654 res!466630) b!702638))

(assert (= (and b!702638 res!466631) b!702657))

(assert (= (and b!702657 res!466624) b!702651))

(assert (= (and b!702651 res!466608) b!702641))

(assert (= (and b!702641 res!466615) b!702659))

(assert (= (and b!702659 res!466616) b!702661))

(assert (= (and b!702661 res!466632) b!702637))

(assert (= (and b!702637 res!466627) b!702656))

(assert (= (and b!702656 res!466623) b!702636))

(assert (= (and b!702636 res!466625) b!702650))

(assert (= (and b!702650 res!466617) b!702652))

(assert (= (and b!702652 res!466606) b!702639))

(assert (= (and b!702639 res!466629) b!702653))

(assert (= (and b!702653 res!466628) b!702635))

(assert (= (and b!702635 res!466618) b!702658))

(assert (= (and b!702658 res!466605) b!702663))

(assert (= (and b!702663 res!466614) b!702643))

(assert (= (and b!702643 res!466619) b!702644))

(assert (= (and b!702644 res!466633) b!702647))

(assert (= (and b!702647 res!466622) b!702646))

(assert (= (and b!702646 res!466621) b!702642))

(assert (= (and b!702642 res!466609) b!702660))

(assert (= (and b!702660 res!466607) b!702662))

(assert (= (and b!702662 res!466611) b!702649))

(assert (= (and b!702649 res!466620) b!702648))

(declare-fun m!661131 () Bool)

(assert (=> b!702659 m!661131))

(declare-fun m!661133 () Bool)

(assert (=> b!702644 m!661133))

(declare-fun m!661135 () Bool)

(assert (=> b!702656 m!661135))

(declare-fun m!661137 () Bool)

(assert (=> b!702643 m!661137))

(declare-fun m!661139 () Bool)

(assert (=> b!702651 m!661139))

(declare-fun m!661141 () Bool)

(assert (=> b!702654 m!661141))

(declare-fun m!661143 () Bool)

(assert (=> b!702658 m!661143))

(declare-fun m!661145 () Bool)

(assert (=> b!702642 m!661145))

(declare-fun m!661147 () Bool)

(assert (=> b!702646 m!661147))

(declare-fun m!661149 () Bool)

(assert (=> b!702662 m!661149))

(declare-fun m!661151 () Bool)

(assert (=> b!702636 m!661151))

(declare-fun m!661153 () Bool)

(assert (=> b!702645 m!661153))

(declare-fun m!661155 () Bool)

(assert (=> b!702641 m!661155))

(declare-fun m!661157 () Bool)

(assert (=> b!702635 m!661157))

(declare-fun m!661159 () Bool)

(assert (=> b!702649 m!661159))

(declare-fun m!661161 () Bool)

(assert (=> start!62462 m!661161))

(declare-fun m!661163 () Bool)

(assert (=> b!702655 m!661163))

(declare-fun m!661165 () Bool)

(assert (=> b!702657 m!661165))

(declare-fun m!661167 () Bool)

(assert (=> b!702640 m!661167))

(declare-fun m!661169 () Bool)

(assert (=> b!702660 m!661169))

(declare-fun m!661171 () Bool)

(assert (=> b!702638 m!661171))

(declare-fun m!661173 () Bool)

(assert (=> b!702637 m!661173))

(declare-fun m!661175 () Bool)

(assert (=> b!702652 m!661175))

(assert (=> b!702652 m!661175))

(declare-fun m!661177 () Bool)

(assert (=> b!702652 m!661177))

(declare-fun m!661179 () Bool)

(assert (=> b!702653 m!661179))

(declare-fun m!661181 () Bool)

(assert (=> b!702648 m!661181))

(declare-fun m!661183 () Bool)

(assert (=> b!702648 m!661183))

(declare-fun m!661185 () Bool)

(assert (=> b!702647 m!661185))

(declare-fun m!661187 () Bool)

(assert (=> b!702663 m!661187))

(declare-fun m!661189 () Bool)

(assert (=> b!702661 m!661189))

(assert (=> b!702639 m!661175))

(assert (=> b!702639 m!661175))

(declare-fun m!661191 () Bool)

(assert (=> b!702639 m!661191))

(assert (=> b!702639 m!661175))

(declare-fun m!661193 () Bool)

(assert (=> b!702639 m!661193))

(check-sat (not b!702648) (not b!702635) (not b!702647) (not b!702640) (not b!702662) (not b!702652) (not b!702643) (not b!702644) (not b!702638) (not b!702651) (not b!702655) (not b!702639) (not b!702646) (not b!702649) (not b!702656) (not b!702636) (not b!702645) (not b!702641) (not b!702642) (not b!702637) (not b!702653) (not b!702654) (not start!62462) (not b!702659) (not b!702657) (not b!702663) (not b!702661) (not b!702660) (not b!702658))
(check-sat)
