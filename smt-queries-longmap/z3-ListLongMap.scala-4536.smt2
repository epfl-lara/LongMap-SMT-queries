; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63022 () Bool)

(assert start!63022)

(declare-fun res!473304 () Bool)

(declare-fun e!399581 () Bool)

(assert (=> start!63022 (=> (not res!473304) (not e!399581))))

(declare-datatypes ((array!40374 0))(
  ( (array!40375 (arr!19333 (Array (_ BitVec 32) (_ BitVec 64))) (size!19730 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40374)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63022 (= res!473304 (and (bvslt (size!19730 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19730 a!3591))))))

(assert (=> start!63022 e!399581))

(assert (=> start!63022 true))

(declare-fun array_inv!15192 (array!40374) Bool)

(assert (=> start!63022 (array_inv!15192 a!3591)))

(declare-fun b!709921 () Bool)

(declare-fun res!473299 () Bool)

(assert (=> b!709921 (=> (not res!473299) (not e!399581))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709921 (= res!473299 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709922 () Bool)

(declare-fun res!473292 () Bool)

(assert (=> b!709922 (=> (not res!473292) (not e!399581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709922 (= res!473292 (validKeyInArray!0 (select (arr!19333 a!3591) from!2969)))))

(declare-fun b!709923 () Bool)

(declare-fun res!473311 () Bool)

(assert (=> b!709923 (=> (not res!473311) (not e!399581))))

(declare-datatypes ((List!13281 0))(
  ( (Nil!13278) (Cons!13277 (h!14325 (_ BitVec 64)) (t!19570 List!13281)) )
))
(declare-fun acc!652 () List!13281)

(declare-fun newAcc!49 () List!13281)

(declare-fun subseq!401 (List!13281 List!13281) Bool)

(assert (=> b!709923 (= res!473311 (subseq!401 acc!652 newAcc!49))))

(declare-fun b!709924 () Bool)

(declare-fun e!399580 () Bool)

(assert (=> b!709924 (= e!399580 false)))

(declare-fun lt!318368 () Bool)

(declare-fun lt!318369 () List!13281)

(declare-fun contains!3933 (List!13281 (_ BitVec 64)) Bool)

(assert (=> b!709924 (= lt!318368 (contains!3933 lt!318369 k0!2824))))

(declare-fun b!709925 () Bool)

(declare-fun res!473303 () Bool)

(assert (=> b!709925 (=> (not res!473303) (not e!399581))))

(assert (=> b!709925 (= res!473303 (contains!3933 newAcc!49 k0!2824))))

(declare-fun b!709926 () Bool)

(declare-fun res!473296 () Bool)

(assert (=> b!709926 (=> (not res!473296) (not e!399580))))

(assert (=> b!709926 (= res!473296 (not (contains!3933 lt!318369 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709927 () Bool)

(declare-fun res!473301 () Bool)

(assert (=> b!709927 (=> (not res!473301) (not e!399581))))

(declare-fun noDuplicate!1207 (List!13281) Bool)

(assert (=> b!709927 (= res!473301 (noDuplicate!1207 acc!652))))

(declare-fun b!709928 () Bool)

(declare-fun res!473305 () Bool)

(assert (=> b!709928 (=> (not res!473305) (not e!399581))))

(assert (=> b!709928 (= res!473305 (not (contains!3933 acc!652 k0!2824)))))

(declare-fun b!709929 () Bool)

(declare-fun res!473310 () Bool)

(assert (=> b!709929 (=> (not res!473310) (not e!399581))))

(assert (=> b!709929 (= res!473310 (noDuplicate!1207 newAcc!49))))

(declare-fun b!709930 () Bool)

(declare-fun res!473308 () Bool)

(assert (=> b!709930 (=> (not res!473308) (not e!399580))))

(declare-fun $colon$colon!509 (List!13281 (_ BitVec 64)) List!13281)

(assert (=> b!709930 (= res!473308 (noDuplicate!1207 ($colon$colon!509 newAcc!49 (select (arr!19333 a!3591) from!2969))))))

(declare-fun b!709931 () Bool)

(declare-fun res!473291 () Bool)

(assert (=> b!709931 (=> (not res!473291) (not e!399581))))

(declare-fun arrayNoDuplicates!0 (array!40374 (_ BitVec 32) List!13281) Bool)

(assert (=> b!709931 (= res!473291 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709932 () Bool)

(declare-fun res!473307 () Bool)

(assert (=> b!709932 (=> (not res!473307) (not e!399580))))

(assert (=> b!709932 (= res!473307 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709933 () Bool)

(declare-fun res!473294 () Bool)

(assert (=> b!709933 (=> (not res!473294) (not e!399581))))

(assert (=> b!709933 (= res!473294 (not (contains!3933 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709934 () Bool)

(declare-fun res!473302 () Bool)

(assert (=> b!709934 (=> (not res!473302) (not e!399581))))

(assert (=> b!709934 (= res!473302 (not (contains!3933 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709935 () Bool)

(declare-fun res!473295 () Bool)

(assert (=> b!709935 (=> (not res!473295) (not e!399581))))

(assert (=> b!709935 (= res!473295 (not (contains!3933 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709936 () Bool)

(declare-fun res!473300 () Bool)

(assert (=> b!709936 (=> (not res!473300) (not e!399581))))

(assert (=> b!709936 (= res!473300 (validKeyInArray!0 k0!2824))))

(declare-fun b!709937 () Bool)

(assert (=> b!709937 (= e!399581 e!399580)))

(declare-fun res!473309 () Bool)

(assert (=> b!709937 (=> (not res!473309) (not e!399580))))

(assert (=> b!709937 (= res!473309 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!709937 (= lt!318369 ($colon$colon!509 acc!652 (select (arr!19333 a!3591) from!2969)))))

(declare-fun b!709938 () Bool)

(declare-fun res!473298 () Bool)

(assert (=> b!709938 (=> (not res!473298) (not e!399581))))

(assert (=> b!709938 (= res!473298 (not (contains!3933 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709939 () Bool)

(declare-fun res!473293 () Bool)

(assert (=> b!709939 (=> (not res!473293) (not e!399581))))

(assert (=> b!709939 (= res!473293 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19730 a!3591)))))

(declare-fun b!709940 () Bool)

(declare-fun res!473297 () Bool)

(assert (=> b!709940 (=> (not res!473297) (not e!399580))))

(assert (=> b!709940 (= res!473297 (not (contains!3933 lt!318369 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709941 () Bool)

(declare-fun res!473290 () Bool)

(assert (=> b!709941 (=> (not res!473290) (not e!399580))))

(assert (=> b!709941 (= res!473290 (noDuplicate!1207 lt!318369))))

(declare-fun b!709942 () Bool)

(declare-fun res!473306 () Bool)

(assert (=> b!709942 (=> (not res!473306) (not e!399581))))

(declare-fun -!365 (List!13281 (_ BitVec 64)) List!13281)

(assert (=> b!709942 (= res!473306 (= (-!365 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!63022 res!473304) b!709927))

(assert (= (and b!709927 res!473301) b!709929))

(assert (= (and b!709929 res!473310) b!709934))

(assert (= (and b!709934 res!473302) b!709935))

(assert (= (and b!709935 res!473295) b!709921))

(assert (= (and b!709921 res!473299) b!709928))

(assert (= (and b!709928 res!473305) b!709936))

(assert (= (and b!709936 res!473300) b!709931))

(assert (= (and b!709931 res!473291) b!709923))

(assert (= (and b!709923 res!473311) b!709925))

(assert (= (and b!709925 res!473303) b!709942))

(assert (= (and b!709942 res!473306) b!709933))

(assert (= (and b!709933 res!473294) b!709938))

(assert (= (and b!709938 res!473298) b!709939))

(assert (= (and b!709939 res!473293) b!709922))

(assert (= (and b!709922 res!473292) b!709937))

(assert (= (and b!709937 res!473309) b!709941))

(assert (= (and b!709941 res!473290) b!709930))

(assert (= (and b!709930 res!473308) b!709940))

(assert (= (and b!709940 res!473297) b!709926))

(assert (= (and b!709926 res!473296) b!709932))

(assert (= (and b!709932 res!473307) b!709924))

(declare-fun m!667689 () Bool)

(assert (=> b!709928 m!667689))

(declare-fun m!667691 () Bool)

(assert (=> b!709935 m!667691))

(declare-fun m!667693 () Bool)

(assert (=> start!63022 m!667693))

(declare-fun m!667695 () Bool)

(assert (=> b!709942 m!667695))

(declare-fun m!667697 () Bool)

(assert (=> b!709937 m!667697))

(assert (=> b!709937 m!667697))

(declare-fun m!667699 () Bool)

(assert (=> b!709937 m!667699))

(declare-fun m!667701 () Bool)

(assert (=> b!709927 m!667701))

(declare-fun m!667703 () Bool)

(assert (=> b!709934 m!667703))

(declare-fun m!667705 () Bool)

(assert (=> b!709940 m!667705))

(declare-fun m!667707 () Bool)

(assert (=> b!709931 m!667707))

(declare-fun m!667709 () Bool)

(assert (=> b!709923 m!667709))

(declare-fun m!667711 () Bool)

(assert (=> b!709929 m!667711))

(declare-fun m!667713 () Bool)

(assert (=> b!709936 m!667713))

(declare-fun m!667715 () Bool)

(assert (=> b!709921 m!667715))

(declare-fun m!667717 () Bool)

(assert (=> b!709924 m!667717))

(assert (=> b!709930 m!667697))

(assert (=> b!709930 m!667697))

(declare-fun m!667719 () Bool)

(assert (=> b!709930 m!667719))

(assert (=> b!709930 m!667719))

(declare-fun m!667721 () Bool)

(assert (=> b!709930 m!667721))

(declare-fun m!667723 () Bool)

(assert (=> b!709925 m!667723))

(declare-fun m!667725 () Bool)

(assert (=> b!709932 m!667725))

(declare-fun m!667727 () Bool)

(assert (=> b!709933 m!667727))

(declare-fun m!667729 () Bool)

(assert (=> b!709941 m!667729))

(assert (=> b!709922 m!667697))

(assert (=> b!709922 m!667697))

(declare-fun m!667731 () Bool)

(assert (=> b!709922 m!667731))

(declare-fun m!667733 () Bool)

(assert (=> b!709926 m!667733))

(declare-fun m!667735 () Bool)

(assert (=> b!709938 m!667735))

(check-sat (not b!709937) (not start!63022) (not b!709935) (not b!709938) (not b!709923) (not b!709926) (not b!709921) (not b!709940) (not b!709931) (not b!709933) (not b!709925) (not b!709932) (not b!709929) (not b!709942) (not b!709928) (not b!709936) (not b!709930) (not b!709922) (not b!709934) (not b!709941) (not b!709924) (not b!709927))
(check-sat)
