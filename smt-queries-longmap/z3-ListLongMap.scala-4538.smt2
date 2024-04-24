; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63088 () Bool)

(assert start!63088)

(declare-fun b!710597 () Bool)

(declare-fun res!473912 () Bool)

(declare-fun e!399874 () Bool)

(assert (=> b!710597 (=> (not res!473912) (not e!399874))))

(declare-datatypes ((List!13287 0))(
  ( (Nil!13284) (Cons!13283 (h!14331 (_ BitVec 64)) (t!19579 List!13287)) )
))
(declare-fun acc!652 () List!13287)

(declare-fun contains!3939 (List!13287 (_ BitVec 64)) Bool)

(assert (=> b!710597 (= res!473912 (not (contains!3939 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710598 () Bool)

(declare-fun res!473925 () Bool)

(assert (=> b!710598 (=> (not res!473925) (not e!399874))))

(declare-fun noDuplicate!1213 (List!13287) Bool)

(assert (=> b!710598 (= res!473925 (noDuplicate!1213 acc!652))))

(declare-fun b!710599 () Bool)

(declare-fun res!473923 () Bool)

(assert (=> b!710599 (=> (not res!473923) (not e!399874))))

(assert (=> b!710599 (= res!473923 (not (contains!3939 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710600 () Bool)

(declare-fun res!473920 () Bool)

(declare-fun e!399875 () Bool)

(assert (=> b!710600 (=> (not res!473920) (not e!399875))))

(declare-fun lt!318437 () List!13287)

(assert (=> b!710600 (= res!473920 (not (contains!3939 lt!318437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473911 () Bool)

(assert (=> start!63088 (=> (not res!473911) (not e!399874))))

(declare-datatypes ((array!40389 0))(
  ( (array!40390 (arr!19339 (Array (_ BitVec 32) (_ BitVec 64))) (size!19738 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40389)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63088 (= res!473911 (and (bvslt (size!19738 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19738 a!3591))))))

(assert (=> start!63088 e!399874))

(assert (=> start!63088 true))

(declare-fun array_inv!15198 (array!40389) Bool)

(assert (=> start!63088 (array_inv!15198 a!3591)))

(declare-fun b!710601 () Bool)

(declare-fun res!473909 () Bool)

(assert (=> b!710601 (=> (not res!473909) (not e!399875))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710601 (= res!473909 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710602 () Bool)

(assert (=> b!710602 (= e!399874 e!399875)))

(declare-fun res!473918 () Bool)

(assert (=> b!710602 (=> (not res!473918) (not e!399875))))

(assert (=> b!710602 (= res!473918 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13287)

(declare-fun lt!318438 () List!13287)

(declare-fun $colon$colon!515 (List!13287 (_ BitVec 64)) List!13287)

(assert (=> b!710602 (= lt!318438 ($colon$colon!515 newAcc!49 (select (arr!19339 a!3591) from!2969)))))

(assert (=> b!710602 (= lt!318437 ($colon$colon!515 acc!652 (select (arr!19339 a!3591) from!2969)))))

(declare-fun b!710603 () Bool)

(declare-fun res!473915 () Bool)

(assert (=> b!710603 (=> (not res!473915) (not e!399874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710603 (= res!473915 (validKeyInArray!0 (select (arr!19339 a!3591) from!2969)))))

(declare-fun b!710604 () Bool)

(declare-fun res!473921 () Bool)

(assert (=> b!710604 (=> (not res!473921) (not e!399874))))

(assert (=> b!710604 (= res!473921 (noDuplicate!1213 newAcc!49))))

(declare-fun b!710605 () Bool)

(declare-fun res!473917 () Bool)

(assert (=> b!710605 (=> (not res!473917) (not e!399875))))

(declare-fun arrayNoDuplicates!0 (array!40389 (_ BitVec 32) List!13287) Bool)

(assert (=> b!710605 (= res!473917 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318437))))

(declare-fun b!710606 () Bool)

(declare-fun res!473928 () Bool)

(assert (=> b!710606 (=> (not res!473928) (not e!399874))))

(assert (=> b!710606 (= res!473928 (contains!3939 newAcc!49 k0!2824))))

(declare-fun b!710607 () Bool)

(declare-fun res!473929 () Bool)

(assert (=> b!710607 (=> (not res!473929) (not e!399875))))

(assert (=> b!710607 (= res!473929 (noDuplicate!1213 lt!318437))))

(declare-fun b!710608 () Bool)

(declare-fun res!473922 () Bool)

(assert (=> b!710608 (=> (not res!473922) (not e!399874))))

(assert (=> b!710608 (= res!473922 (not (contains!3939 acc!652 k0!2824)))))

(declare-fun b!710609 () Bool)

(declare-fun res!473907 () Bool)

(assert (=> b!710609 (=> (not res!473907) (not e!399874))))

(assert (=> b!710609 (= res!473907 (validKeyInArray!0 k0!2824))))

(declare-fun b!710610 () Bool)

(declare-fun res!473914 () Bool)

(assert (=> b!710610 (=> (not res!473914) (not e!399875))))

(assert (=> b!710610 (= res!473914 (noDuplicate!1213 lt!318438))))

(declare-fun b!710611 () Bool)

(declare-fun res!473919 () Bool)

(assert (=> b!710611 (=> (not res!473919) (not e!399874))))

(assert (=> b!710611 (= res!473919 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19738 a!3591)))))

(declare-fun b!710612 () Bool)

(declare-fun res!473924 () Bool)

(assert (=> b!710612 (=> (not res!473924) (not e!399874))))

(declare-fun -!371 (List!13287 (_ BitVec 64)) List!13287)

(assert (=> b!710612 (= res!473924 (= (-!371 newAcc!49 k0!2824) acc!652))))

(declare-fun b!710613 () Bool)

(declare-fun subseq!407 (List!13287 List!13287) Bool)

(assert (=> b!710613 (= e!399875 (not (subseq!407 lt!318437 lt!318438)))))

(declare-fun b!710614 () Bool)

(declare-fun res!473916 () Bool)

(assert (=> b!710614 (=> (not res!473916) (not e!399874))))

(assert (=> b!710614 (= res!473916 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710615 () Bool)

(declare-fun res!473913 () Bool)

(assert (=> b!710615 (=> (not res!473913) (not e!399875))))

(assert (=> b!710615 (= res!473913 (not (contains!3939 lt!318437 k0!2824)))))

(declare-fun b!710616 () Bool)

(declare-fun res!473926 () Bool)

(assert (=> b!710616 (=> (not res!473926) (not e!399874))))

(assert (=> b!710616 (= res!473926 (subseq!407 acc!652 newAcc!49))))

(declare-fun b!710617 () Bool)

(declare-fun res!473927 () Bool)

(assert (=> b!710617 (=> (not res!473927) (not e!399874))))

(assert (=> b!710617 (= res!473927 (not (contains!3939 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710618 () Bool)

(declare-fun res!473908 () Bool)

(assert (=> b!710618 (=> (not res!473908) (not e!399875))))

(assert (=> b!710618 (= res!473908 (not (contains!3939 lt!318437 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710619 () Bool)

(declare-fun res!473906 () Bool)

(assert (=> b!710619 (=> (not res!473906) (not e!399874))))

(assert (=> b!710619 (= res!473906 (not (contains!3939 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710620 () Bool)

(declare-fun res!473910 () Bool)

(assert (=> b!710620 (=> (not res!473910) (not e!399874))))

(assert (=> b!710620 (= res!473910 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!63088 res!473911) b!710598))

(assert (= (and b!710598 res!473925) b!710604))

(assert (= (and b!710604 res!473921) b!710599))

(assert (= (and b!710599 res!473923) b!710597))

(assert (= (and b!710597 res!473912) b!710620))

(assert (= (and b!710620 res!473910) b!710608))

(assert (= (and b!710608 res!473922) b!710609))

(assert (= (and b!710609 res!473907) b!710614))

(assert (= (and b!710614 res!473916) b!710616))

(assert (= (and b!710616 res!473926) b!710606))

(assert (= (and b!710606 res!473928) b!710612))

(assert (= (and b!710612 res!473924) b!710617))

(assert (= (and b!710617 res!473927) b!710619))

(assert (= (and b!710619 res!473906) b!710611))

(assert (= (and b!710611 res!473919) b!710603))

(assert (= (and b!710603 res!473915) b!710602))

(assert (= (and b!710602 res!473918) b!710607))

(assert (= (and b!710607 res!473929) b!710610))

(assert (= (and b!710610 res!473914) b!710600))

(assert (= (and b!710600 res!473920) b!710618))

(assert (= (and b!710618 res!473908) b!710601))

(assert (= (and b!710601 res!473909) b!710615))

(assert (= (and b!710615 res!473913) b!710605))

(assert (= (and b!710605 res!473917) b!710613))

(declare-fun m!668247 () Bool)

(assert (=> b!710604 m!668247))

(declare-fun m!668249 () Bool)

(assert (=> b!710608 m!668249))

(declare-fun m!668251 () Bool)

(assert (=> b!710617 m!668251))

(declare-fun m!668253 () Bool)

(assert (=> b!710607 m!668253))

(declare-fun m!668255 () Bool)

(assert (=> b!710618 m!668255))

(declare-fun m!668257 () Bool)

(assert (=> b!710599 m!668257))

(declare-fun m!668259 () Bool)

(assert (=> b!710613 m!668259))

(declare-fun m!668261 () Bool)

(assert (=> b!710619 m!668261))

(declare-fun m!668263 () Bool)

(assert (=> b!710615 m!668263))

(declare-fun m!668265 () Bool)

(assert (=> b!710602 m!668265))

(assert (=> b!710602 m!668265))

(declare-fun m!668267 () Bool)

(assert (=> b!710602 m!668267))

(assert (=> b!710602 m!668265))

(declare-fun m!668269 () Bool)

(assert (=> b!710602 m!668269))

(declare-fun m!668271 () Bool)

(assert (=> b!710609 m!668271))

(declare-fun m!668273 () Bool)

(assert (=> b!710616 m!668273))

(declare-fun m!668275 () Bool)

(assert (=> b!710598 m!668275))

(declare-fun m!668277 () Bool)

(assert (=> b!710614 m!668277))

(declare-fun m!668279 () Bool)

(assert (=> b!710620 m!668279))

(declare-fun m!668281 () Bool)

(assert (=> b!710601 m!668281))

(declare-fun m!668283 () Bool)

(assert (=> b!710605 m!668283))

(assert (=> b!710603 m!668265))

(assert (=> b!710603 m!668265))

(declare-fun m!668285 () Bool)

(assert (=> b!710603 m!668285))

(declare-fun m!668287 () Bool)

(assert (=> b!710597 m!668287))

(declare-fun m!668289 () Bool)

(assert (=> b!710600 m!668289))

(declare-fun m!668291 () Bool)

(assert (=> b!710612 m!668291))

(declare-fun m!668293 () Bool)

(assert (=> b!710606 m!668293))

(declare-fun m!668295 () Bool)

(assert (=> b!710610 m!668295))

(declare-fun m!668297 () Bool)

(assert (=> start!63088 m!668297))

(check-sat (not b!710613) (not start!63088) (not b!710617) (not b!710598) (not b!710604) (not b!710608) (not b!710618) (not b!710612) (not b!710606) (not b!710616) (not b!710615) (not b!710620) (not b!710614) (not b!710607) (not b!710619) (not b!710602) (not b!710597) (not b!710600) (not b!710610) (not b!710599) (not b!710603) (not b!710605) (not b!710609) (not b!710601))
(check-sat)
(get-model)

(declare-fun d!97517 () Bool)

(declare-fun lt!318453 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!350 (List!13287) (InoxSet (_ BitVec 64)))

(assert (=> d!97517 (= lt!318453 (select (content!350 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399900 () Bool)

(assert (=> d!97517 (= lt!318453 e!399900)))

(declare-fun res!474079 () Bool)

(assert (=> d!97517 (=> (not res!474079) (not e!399900))))

(get-info :version)

(assert (=> d!97517 (= res!474079 ((_ is Cons!13283) acc!652))))

(assert (=> d!97517 (= (contains!3939 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318453)))

(declare-fun b!710769 () Bool)

(declare-fun e!399899 () Bool)

(assert (=> b!710769 (= e!399900 e!399899)))

(declare-fun res!474078 () Bool)

(assert (=> b!710769 (=> res!474078 e!399899)))

(assert (=> b!710769 (= res!474078 (= (h!14331 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710770 () Bool)

(assert (=> b!710770 (= e!399899 (contains!3939 (t!19579 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97517 res!474079) b!710769))

(assert (= (and b!710769 (not res!474078)) b!710770))

(declare-fun m!668403 () Bool)

(assert (=> d!97517 m!668403))

(declare-fun m!668405 () Bool)

(assert (=> d!97517 m!668405))

(declare-fun m!668407 () Bool)

(assert (=> b!710770 m!668407))

(assert (=> b!710599 d!97517))

(declare-fun d!97519 () Bool)

(declare-fun res!474084 () Bool)

(declare-fun e!399905 () Bool)

(assert (=> d!97519 (=> res!474084 e!399905)))

(assert (=> d!97519 (= res!474084 (= (select (arr!19339 a!3591) from!2969) k0!2824))))

(assert (=> d!97519 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399905)))

(declare-fun b!710775 () Bool)

(declare-fun e!399906 () Bool)

(assert (=> b!710775 (= e!399905 e!399906)))

(declare-fun res!474085 () Bool)

(assert (=> b!710775 (=> (not res!474085) (not e!399906))))

(assert (=> b!710775 (= res!474085 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19738 a!3591)))))

(declare-fun b!710776 () Bool)

(assert (=> b!710776 (= e!399906 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97519 (not res!474084)) b!710775))

(assert (= (and b!710775 res!474085) b!710776))

(assert (=> d!97519 m!668265))

(declare-fun m!668409 () Bool)

(assert (=> b!710776 m!668409))

(assert (=> b!710620 d!97519))

(declare-fun d!97521 () Bool)

(declare-fun lt!318454 () Bool)

(assert (=> d!97521 (= lt!318454 (select (content!350 lt!318437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399908 () Bool)

(assert (=> d!97521 (= lt!318454 e!399908)))

(declare-fun res!474087 () Bool)

(assert (=> d!97521 (=> (not res!474087) (not e!399908))))

(assert (=> d!97521 (= res!474087 ((_ is Cons!13283) lt!318437))))

(assert (=> d!97521 (= (contains!3939 lt!318437 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318454)))

(declare-fun b!710777 () Bool)

(declare-fun e!399907 () Bool)

(assert (=> b!710777 (= e!399908 e!399907)))

(declare-fun res!474086 () Bool)

(assert (=> b!710777 (=> res!474086 e!399907)))

(assert (=> b!710777 (= res!474086 (= (h!14331 lt!318437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710778 () Bool)

(assert (=> b!710778 (= e!399907 (contains!3939 (t!19579 lt!318437) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97521 res!474087) b!710777))

(assert (= (and b!710777 (not res!474086)) b!710778))

(declare-fun m!668411 () Bool)

(assert (=> d!97521 m!668411))

(declare-fun m!668413 () Bool)

(assert (=> d!97521 m!668413))

(declare-fun m!668415 () Bool)

(assert (=> b!710778 m!668415))

(assert (=> b!710600 d!97521))

(declare-fun d!97523 () Bool)

(declare-fun lt!318455 () Bool)

(assert (=> d!97523 (= lt!318455 (select (content!350 lt!318437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399910 () Bool)

(assert (=> d!97523 (= lt!318455 e!399910)))

(declare-fun res!474089 () Bool)

(assert (=> d!97523 (=> (not res!474089) (not e!399910))))

(assert (=> d!97523 (= res!474089 ((_ is Cons!13283) lt!318437))))

(assert (=> d!97523 (= (contains!3939 lt!318437 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318455)))

(declare-fun b!710779 () Bool)

(declare-fun e!399909 () Bool)

(assert (=> b!710779 (= e!399910 e!399909)))

(declare-fun res!474088 () Bool)

(assert (=> b!710779 (=> res!474088 e!399909)))

(assert (=> b!710779 (= res!474088 (= (h!14331 lt!318437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710780 () Bool)

(assert (=> b!710780 (= e!399909 (contains!3939 (t!19579 lt!318437) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97523 res!474089) b!710779))

(assert (= (and b!710779 (not res!474088)) b!710780))

(assert (=> d!97523 m!668411))

(declare-fun m!668417 () Bool)

(assert (=> d!97523 m!668417))

(declare-fun m!668419 () Bool)

(assert (=> b!710780 m!668419))

(assert (=> b!710618 d!97523))

(declare-fun d!97525 () Bool)

(declare-fun lt!318456 () Bool)

(assert (=> d!97525 (= lt!318456 (select (content!350 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399912 () Bool)

(assert (=> d!97525 (= lt!318456 e!399912)))

(declare-fun res!474091 () Bool)

(assert (=> d!97525 (=> (not res!474091) (not e!399912))))

(assert (=> d!97525 (= res!474091 ((_ is Cons!13283) newAcc!49))))

(assert (=> d!97525 (= (contains!3939 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318456)))

(declare-fun b!710781 () Bool)

(declare-fun e!399911 () Bool)

(assert (=> b!710781 (= e!399912 e!399911)))

(declare-fun res!474090 () Bool)

(assert (=> b!710781 (=> res!474090 e!399911)))

(assert (=> b!710781 (= res!474090 (= (h!14331 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710782 () Bool)

(assert (=> b!710782 (= e!399911 (contains!3939 (t!19579 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97525 res!474091) b!710781))

(assert (= (and b!710781 (not res!474090)) b!710782))

(declare-fun m!668421 () Bool)

(assert (=> d!97525 m!668421))

(declare-fun m!668423 () Bool)

(assert (=> d!97525 m!668423))

(declare-fun m!668425 () Bool)

(assert (=> b!710782 m!668425))

(assert (=> b!710617 d!97525))

(declare-fun d!97527 () Bool)

(declare-fun lt!318457 () Bool)

(assert (=> d!97527 (= lt!318457 (select (content!350 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399914 () Bool)

(assert (=> d!97527 (= lt!318457 e!399914)))

(declare-fun res!474093 () Bool)

(assert (=> d!97527 (=> (not res!474093) (not e!399914))))

(assert (=> d!97527 (= res!474093 ((_ is Cons!13283) newAcc!49))))

(assert (=> d!97527 (= (contains!3939 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318457)))

(declare-fun b!710783 () Bool)

(declare-fun e!399913 () Bool)

(assert (=> b!710783 (= e!399914 e!399913)))

(declare-fun res!474092 () Bool)

(assert (=> b!710783 (=> res!474092 e!399913)))

(assert (=> b!710783 (= res!474092 (= (h!14331 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710784 () Bool)

(assert (=> b!710784 (= e!399913 (contains!3939 (t!19579 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97527 res!474093) b!710783))

(assert (= (and b!710783 (not res!474092)) b!710784))

(assert (=> d!97527 m!668421))

(declare-fun m!668427 () Bool)

(assert (=> d!97527 m!668427))

(declare-fun m!668429 () Bool)

(assert (=> b!710784 m!668429))

(assert (=> b!710619 d!97527))

(declare-fun d!97529 () Bool)

(declare-fun res!474098 () Bool)

(declare-fun e!399919 () Bool)

(assert (=> d!97529 (=> res!474098 e!399919)))

(assert (=> d!97529 (= res!474098 ((_ is Nil!13284) acc!652))))

(assert (=> d!97529 (= (noDuplicate!1213 acc!652) e!399919)))

(declare-fun b!710789 () Bool)

(declare-fun e!399920 () Bool)

(assert (=> b!710789 (= e!399919 e!399920)))

(declare-fun res!474099 () Bool)

(assert (=> b!710789 (=> (not res!474099) (not e!399920))))

(assert (=> b!710789 (= res!474099 (not (contains!3939 (t!19579 acc!652) (h!14331 acc!652))))))

(declare-fun b!710790 () Bool)

(assert (=> b!710790 (= e!399920 (noDuplicate!1213 (t!19579 acc!652)))))

(assert (= (and d!97529 (not res!474098)) b!710789))

(assert (= (and b!710789 res!474099) b!710790))

(declare-fun m!668431 () Bool)

(assert (=> b!710789 m!668431))

(declare-fun m!668433 () Bool)

(assert (=> b!710790 m!668433))

(assert (=> b!710598 d!97529))

(declare-fun d!97531 () Bool)

(declare-fun lt!318458 () Bool)

(assert (=> d!97531 (= lt!318458 (select (content!350 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399922 () Bool)

(assert (=> d!97531 (= lt!318458 e!399922)))

(declare-fun res!474101 () Bool)

(assert (=> d!97531 (=> (not res!474101) (not e!399922))))

(assert (=> d!97531 (= res!474101 ((_ is Cons!13283) acc!652))))

(assert (=> d!97531 (= (contains!3939 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318458)))

(declare-fun b!710791 () Bool)

(declare-fun e!399921 () Bool)

(assert (=> b!710791 (= e!399922 e!399921)))

(declare-fun res!474100 () Bool)

(assert (=> b!710791 (=> res!474100 e!399921)))

(assert (=> b!710791 (= res!474100 (= (h!14331 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710792 () Bool)

(assert (=> b!710792 (= e!399921 (contains!3939 (t!19579 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97531 res!474101) b!710791))

(assert (= (and b!710791 (not res!474100)) b!710792))

(assert (=> d!97531 m!668403))

(declare-fun m!668435 () Bool)

(assert (=> d!97531 m!668435))

(declare-fun m!668437 () Bool)

(assert (=> b!710792 m!668437))

(assert (=> b!710597 d!97531))

(declare-fun d!97533 () Bool)

(declare-fun res!474102 () Bool)

(declare-fun e!399923 () Bool)

(assert (=> d!97533 (=> res!474102 e!399923)))

(assert (=> d!97533 (= res!474102 ((_ is Nil!13284) newAcc!49))))

(assert (=> d!97533 (= (noDuplicate!1213 newAcc!49) e!399923)))

(declare-fun b!710793 () Bool)

(declare-fun e!399924 () Bool)

(assert (=> b!710793 (= e!399923 e!399924)))

(declare-fun res!474103 () Bool)

(assert (=> b!710793 (=> (not res!474103) (not e!399924))))

(assert (=> b!710793 (= res!474103 (not (contains!3939 (t!19579 newAcc!49) (h!14331 newAcc!49))))))

(declare-fun b!710794 () Bool)

(assert (=> b!710794 (= e!399924 (noDuplicate!1213 (t!19579 newAcc!49)))))

(assert (= (and d!97533 (not res!474102)) b!710793))

(assert (= (and b!710793 res!474103) b!710794))

(declare-fun m!668439 () Bool)

(assert (=> b!710793 m!668439))

(declare-fun m!668441 () Bool)

(assert (=> b!710794 m!668441))

(assert (=> b!710604 d!97533))

(declare-fun d!97535 () Bool)

(declare-fun lt!318459 () Bool)

(assert (=> d!97535 (= lt!318459 (select (content!350 newAcc!49) k0!2824))))

(declare-fun e!399926 () Bool)

(assert (=> d!97535 (= lt!318459 e!399926)))

(declare-fun res!474105 () Bool)

(assert (=> d!97535 (=> (not res!474105) (not e!399926))))

(assert (=> d!97535 (= res!474105 ((_ is Cons!13283) newAcc!49))))

(assert (=> d!97535 (= (contains!3939 newAcc!49 k0!2824) lt!318459)))

(declare-fun b!710795 () Bool)

(declare-fun e!399925 () Bool)

(assert (=> b!710795 (= e!399926 e!399925)))

(declare-fun res!474104 () Bool)

(assert (=> b!710795 (=> res!474104 e!399925)))

(assert (=> b!710795 (= res!474104 (= (h!14331 newAcc!49) k0!2824))))

(declare-fun b!710796 () Bool)

(assert (=> b!710796 (= e!399925 (contains!3939 (t!19579 newAcc!49) k0!2824))))

(assert (= (and d!97535 res!474105) b!710795))

(assert (= (and b!710795 (not res!474104)) b!710796))

(assert (=> d!97535 m!668421))

(declare-fun m!668443 () Bool)

(assert (=> d!97535 m!668443))

(declare-fun m!668445 () Bool)

(assert (=> b!710796 m!668445))

(assert (=> b!710606 d!97535))

(declare-fun b!710809 () Bool)

(declare-fun e!399938 () Bool)

(declare-fun e!399937 () Bool)

(assert (=> b!710809 (= e!399938 e!399937)))

(declare-fun res!474114 () Bool)

(assert (=> b!710809 (=> (not res!474114) (not e!399937))))

(declare-fun e!399939 () Bool)

(assert (=> b!710809 (= res!474114 (not e!399939))))

(declare-fun res!474115 () Bool)

(assert (=> b!710809 (=> (not res!474115) (not e!399939))))

(assert (=> b!710809 (= res!474115 (validKeyInArray!0 (select (arr!19339 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun c!78716 () Bool)

(declare-fun bm!34479 () Bool)

(declare-fun call!34482 () Bool)

(assert (=> bm!34479 (= call!34482 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78716 (Cons!13283 (select (arr!19339 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318437) lt!318437)))))

(declare-fun d!97537 () Bool)

(declare-fun res!474116 () Bool)

(assert (=> d!97537 (=> res!474116 e!399938)))

(assert (=> d!97537 (= res!474116 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19738 a!3591)))))

(assert (=> d!97537 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318437) e!399938)))

(declare-fun b!710810 () Bool)

(declare-fun e!399940 () Bool)

(assert (=> b!710810 (= e!399940 call!34482)))

(declare-fun b!710811 () Bool)

(assert (=> b!710811 (= e!399940 call!34482)))

(declare-fun b!710812 () Bool)

(assert (=> b!710812 (= e!399939 (contains!3939 lt!318437 (select (arr!19339 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710813 () Bool)

(assert (=> b!710813 (= e!399937 e!399940)))

(assert (=> b!710813 (= c!78716 (validKeyInArray!0 (select (arr!19339 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97537 (not res!474116)) b!710809))

(assert (= (and b!710809 res!474115) b!710812))

(assert (= (and b!710809 res!474114) b!710813))

(assert (= (and b!710813 c!78716) b!710811))

(assert (= (and b!710813 (not c!78716)) b!710810))

(assert (= (or b!710811 b!710810) bm!34479))

(declare-fun m!668447 () Bool)

(assert (=> b!710809 m!668447))

(assert (=> b!710809 m!668447))

(declare-fun m!668449 () Bool)

(assert (=> b!710809 m!668449))

(assert (=> bm!34479 m!668447))

(declare-fun m!668451 () Bool)

(assert (=> bm!34479 m!668451))

(assert (=> b!710812 m!668447))

(assert (=> b!710812 m!668447))

(declare-fun m!668453 () Bool)

(assert (=> b!710812 m!668453))

(assert (=> b!710813 m!668447))

(assert (=> b!710813 m!668447))

(assert (=> b!710813 m!668449))

(assert (=> b!710605 d!97537))

(declare-fun d!97543 () Bool)

(assert (=> d!97543 (= ($colon$colon!515 newAcc!49 (select (arr!19339 a!3591) from!2969)) (Cons!13283 (select (arr!19339 a!3591) from!2969) newAcc!49))))

(assert (=> b!710602 d!97543))

(declare-fun d!97547 () Bool)

(assert (=> d!97547 (= ($colon$colon!515 acc!652 (select (arr!19339 a!3591) from!2969)) (Cons!13283 (select (arr!19339 a!3591) from!2969) acc!652))))

(assert (=> b!710602 d!97547))

(declare-fun d!97549 () Bool)

(declare-fun res!474127 () Bool)

(declare-fun e!399953 () Bool)

(assert (=> d!97549 (=> res!474127 e!399953)))

(assert (=> d!97549 (= res!474127 (= (select (arr!19339 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97549 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399953)))

(declare-fun b!710828 () Bool)

(declare-fun e!399954 () Bool)

(assert (=> b!710828 (= e!399953 e!399954)))

(declare-fun res!474128 () Bool)

(assert (=> b!710828 (=> (not res!474128) (not e!399954))))

(assert (=> b!710828 (= res!474128 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19738 a!3591)))))

(declare-fun b!710829 () Bool)

(assert (=> b!710829 (= e!399954 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97549 (not res!474127)) b!710828))

(assert (= (and b!710828 res!474128) b!710829))

(assert (=> d!97549 m!668447))

(declare-fun m!668461 () Bool)

(assert (=> b!710829 m!668461))

(assert (=> b!710601 d!97549))

(declare-fun d!97551 () Bool)

(assert (=> d!97551 (= (validKeyInArray!0 (select (arr!19339 a!3591) from!2969)) (and (not (= (select (arr!19339 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19339 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710603 d!97551))

(declare-fun d!97553 () Bool)

(declare-fun res!474133 () Bool)

(declare-fun e!399959 () Bool)

(assert (=> d!97553 (=> res!474133 e!399959)))

(assert (=> d!97553 (= res!474133 ((_ is Nil!13284) lt!318438))))

(assert (=> d!97553 (= (noDuplicate!1213 lt!318438) e!399959)))

(declare-fun b!710834 () Bool)

(declare-fun e!399960 () Bool)

(assert (=> b!710834 (= e!399959 e!399960)))

(declare-fun res!474134 () Bool)

(assert (=> b!710834 (=> (not res!474134) (not e!399960))))

(assert (=> b!710834 (= res!474134 (not (contains!3939 (t!19579 lt!318438) (h!14331 lt!318438))))))

(declare-fun b!710835 () Bool)

(assert (=> b!710835 (= e!399960 (noDuplicate!1213 (t!19579 lt!318438)))))

(assert (= (and d!97553 (not res!474133)) b!710834))

(assert (= (and b!710834 res!474134) b!710835))

(declare-fun m!668463 () Bool)

(assert (=> b!710834 m!668463))

(declare-fun m!668465 () Bool)

(assert (=> b!710835 m!668465))

(assert (=> b!710610 d!97553))

(declare-fun d!97555 () Bool)

(assert (=> d!97555 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710609 d!97555))

(declare-fun d!97557 () Bool)

(assert (=> d!97557 (= (array_inv!15198 a!3591) (bvsge (size!19738 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63088 d!97557))

(declare-fun d!97559 () Bool)

(declare-fun res!474140 () Bool)

(declare-fun e!399967 () Bool)

(assert (=> d!97559 (=> res!474140 e!399967)))

(assert (=> d!97559 (= res!474140 ((_ is Nil!13284) lt!318437))))

(assert (=> d!97559 (= (noDuplicate!1213 lt!318437) e!399967)))

(declare-fun b!710843 () Bool)

(declare-fun e!399968 () Bool)

(assert (=> b!710843 (= e!399967 e!399968)))

(declare-fun res!474141 () Bool)

(assert (=> b!710843 (=> (not res!474141) (not e!399968))))

(assert (=> b!710843 (= res!474141 (not (contains!3939 (t!19579 lt!318437) (h!14331 lt!318437))))))

(declare-fun b!710844 () Bool)

(assert (=> b!710844 (= e!399968 (noDuplicate!1213 (t!19579 lt!318437)))))

(assert (= (and d!97559 (not res!474140)) b!710843))

(assert (= (and b!710843 res!474141) b!710844))

(declare-fun m!668477 () Bool)

(assert (=> b!710843 m!668477))

(declare-fun m!668479 () Bool)

(assert (=> b!710844 m!668479))

(assert (=> b!710607 d!97559))

(declare-fun d!97563 () Bool)

(declare-fun lt!318464 () Bool)

(assert (=> d!97563 (= lt!318464 (select (content!350 acc!652) k0!2824))))

(declare-fun e!399972 () Bool)

(assert (=> d!97563 (= lt!318464 e!399972)))

(declare-fun res!474145 () Bool)

(assert (=> d!97563 (=> (not res!474145) (not e!399972))))

(assert (=> d!97563 (= res!474145 ((_ is Cons!13283) acc!652))))

(assert (=> d!97563 (= (contains!3939 acc!652 k0!2824) lt!318464)))

(declare-fun b!710847 () Bool)

(declare-fun e!399971 () Bool)

(assert (=> b!710847 (= e!399972 e!399971)))

(declare-fun res!474144 () Bool)

(assert (=> b!710847 (=> res!474144 e!399971)))

(assert (=> b!710847 (= res!474144 (= (h!14331 acc!652) k0!2824))))

(declare-fun b!710848 () Bool)

(assert (=> b!710848 (= e!399971 (contains!3939 (t!19579 acc!652) k0!2824))))

(assert (= (and d!97563 res!474145) b!710847))

(assert (= (and b!710847 (not res!474144)) b!710848))

(assert (=> d!97563 m!668403))

(declare-fun m!668489 () Bool)

(assert (=> d!97563 m!668489))

(declare-fun m!668491 () Bool)

(assert (=> b!710848 m!668491))

(assert (=> b!710608 d!97563))

(declare-fun d!97569 () Bool)

(declare-fun lt!318465 () Bool)

(assert (=> d!97569 (= lt!318465 (select (content!350 lt!318437) k0!2824))))

(declare-fun e!399974 () Bool)

(assert (=> d!97569 (= lt!318465 e!399974)))

(declare-fun res!474147 () Bool)

(assert (=> d!97569 (=> (not res!474147) (not e!399974))))

(assert (=> d!97569 (= res!474147 ((_ is Cons!13283) lt!318437))))

(assert (=> d!97569 (= (contains!3939 lt!318437 k0!2824) lt!318465)))

(declare-fun b!710849 () Bool)

(declare-fun e!399973 () Bool)

(assert (=> b!710849 (= e!399974 e!399973)))

(declare-fun res!474146 () Bool)

(assert (=> b!710849 (=> res!474146 e!399973)))

(assert (=> b!710849 (= res!474146 (= (h!14331 lt!318437) k0!2824))))

(declare-fun b!710850 () Bool)

(assert (=> b!710850 (= e!399973 (contains!3939 (t!19579 lt!318437) k0!2824))))

(assert (= (and d!97569 res!474147) b!710849))

(assert (= (and b!710849 (not res!474146)) b!710850))

(assert (=> d!97569 m!668411))

(declare-fun m!668493 () Bool)

(assert (=> d!97569 m!668493))

(declare-fun m!668495 () Bool)

(assert (=> b!710850 m!668495))

(assert (=> b!710615 d!97569))

(declare-fun d!97571 () Bool)

(declare-fun res!474175 () Bool)

(declare-fun e!400006 () Bool)

(assert (=> d!97571 (=> res!474175 e!400006)))

(assert (=> d!97571 (= res!474175 ((_ is Nil!13284) acc!652))))

(assert (=> d!97571 (= (subseq!407 acc!652 newAcc!49) e!400006)))

(declare-fun b!710884 () Bool)

(declare-fun e!400008 () Bool)

(assert (=> b!710884 (= e!400006 e!400008)))

(declare-fun res!474176 () Bool)

(assert (=> b!710884 (=> (not res!474176) (not e!400008))))

(assert (=> b!710884 (= res!474176 ((_ is Cons!13283) newAcc!49))))

(declare-fun b!710888 () Bool)

(declare-fun e!400007 () Bool)

(assert (=> b!710888 (= e!400007 (subseq!407 (t!19579 acc!652) (t!19579 newAcc!49)))))

(declare-fun b!710885 () Bool)

(declare-fun e!400009 () Bool)

(assert (=> b!710885 (= e!400008 e!400009)))

(declare-fun res!474174 () Bool)

(assert (=> b!710885 (=> res!474174 e!400009)))

(assert (=> b!710885 (= res!474174 e!400007)))

(declare-fun res!474173 () Bool)

(assert (=> b!710885 (=> (not res!474173) (not e!400007))))

(assert (=> b!710885 (= res!474173 (= (h!14331 acc!652) (h!14331 newAcc!49)))))

(declare-fun b!710889 () Bool)

(assert (=> b!710889 (= e!400009 (subseq!407 acc!652 (t!19579 newAcc!49)))))

(assert (= (and d!97571 (not res!474175)) b!710884))

(assert (= (and b!710884 res!474176) b!710885))

(assert (= (and b!710885 res!474173) b!710888))

(assert (= (and b!710885 (not res!474174)) b!710889))

(declare-fun m!668501 () Bool)

(assert (=> b!710888 m!668501))

(declare-fun m!668503 () Bool)

(assert (=> b!710889 m!668503))

(assert (=> b!710616 d!97571))

(declare-fun d!97575 () Bool)

(declare-fun e!400040 () Bool)

(assert (=> d!97575 e!400040))

(declare-fun res!474198 () Bool)

(assert (=> d!97575 (=> (not res!474198) (not e!400040))))

(declare-fun lt!318474 () List!13287)

(declare-fun size!19742 (List!13287) Int)

(assert (=> d!97575 (= res!474198 (<= (size!19742 lt!318474) (size!19742 newAcc!49)))))

(declare-fun e!400041 () List!13287)

(assert (=> d!97575 (= lt!318474 e!400041)))

(declare-fun c!78733 () Bool)

(assert (=> d!97575 (= c!78733 ((_ is Cons!13283) newAcc!49))))

(assert (=> d!97575 (= (-!371 newAcc!49 k0!2824) lt!318474)))

(declare-fun b!710927 () Bool)

(declare-fun e!400042 () List!13287)

(declare-fun call!34494 () List!13287)

(assert (=> b!710927 (= e!400042 (Cons!13283 (h!14331 newAcc!49) call!34494))))

(declare-fun b!710928 () Bool)

(assert (=> b!710928 (= e!400041 e!400042)))

(declare-fun c!78734 () Bool)

(assert (=> b!710928 (= c!78734 (= k0!2824 (h!14331 newAcc!49)))))

(declare-fun b!710929 () Bool)

(assert (=> b!710929 (= e!400042 call!34494)))

(declare-fun bm!34491 () Bool)

(assert (=> bm!34491 (= call!34494 (-!371 (t!19579 newAcc!49) k0!2824))))

(declare-fun b!710930 () Bool)

(assert (=> b!710930 (= e!400041 Nil!13284)))

(declare-fun b!710931 () Bool)

(assert (=> b!710931 (= e!400040 (= (content!350 lt!318474) ((_ map and) (content!350 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!97575 c!78733) b!710928))

(assert (= (and d!97575 (not c!78733)) b!710930))

(assert (= (and b!710928 c!78734) b!710929))

(assert (= (and b!710928 (not c!78734)) b!710927))

(assert (= (or b!710929 b!710927) bm!34491))

(assert (= (and d!97575 res!474198) b!710931))

(declare-fun m!668529 () Bool)

(assert (=> d!97575 m!668529))

(declare-fun m!668531 () Bool)

(assert (=> d!97575 m!668531))

(declare-fun m!668533 () Bool)

(assert (=> bm!34491 m!668533))

(declare-fun m!668535 () Bool)

(assert (=> b!710931 m!668535))

(assert (=> b!710931 m!668421))

(declare-fun m!668537 () Bool)

(assert (=> b!710931 m!668537))

(assert (=> b!710612 d!97575))

(declare-fun b!710932 () Bool)

(declare-fun e!400044 () Bool)

(declare-fun e!400043 () Bool)

(assert (=> b!710932 (= e!400044 e!400043)))

(declare-fun res!474199 () Bool)

(assert (=> b!710932 (=> (not res!474199) (not e!400043))))

(declare-fun e!400045 () Bool)

(assert (=> b!710932 (= res!474199 (not e!400045))))

(declare-fun res!474200 () Bool)

(assert (=> b!710932 (=> (not res!474200) (not e!400045))))

(assert (=> b!710932 (= res!474200 (validKeyInArray!0 (select (arr!19339 a!3591) from!2969)))))

(declare-fun c!78735 () Bool)

(declare-fun bm!34492 () Bool)

(declare-fun call!34495 () Bool)

(assert (=> bm!34492 (= call!34495 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78735 (Cons!13283 (select (arr!19339 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!97585 () Bool)

(declare-fun res!474201 () Bool)

(assert (=> d!97585 (=> res!474201 e!400044)))

(assert (=> d!97585 (= res!474201 (bvsge from!2969 (size!19738 a!3591)))))

(assert (=> d!97585 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400044)))

(declare-fun b!710933 () Bool)

(declare-fun e!400046 () Bool)

(assert (=> b!710933 (= e!400046 call!34495)))

(declare-fun b!710934 () Bool)

(assert (=> b!710934 (= e!400046 call!34495)))

(declare-fun b!710935 () Bool)

(assert (=> b!710935 (= e!400045 (contains!3939 acc!652 (select (arr!19339 a!3591) from!2969)))))

(declare-fun b!710936 () Bool)

(assert (=> b!710936 (= e!400043 e!400046)))

(assert (=> b!710936 (= c!78735 (validKeyInArray!0 (select (arr!19339 a!3591) from!2969)))))

(assert (= (and d!97585 (not res!474201)) b!710932))

(assert (= (and b!710932 res!474200) b!710935))

(assert (= (and b!710932 res!474199) b!710936))

(assert (= (and b!710936 c!78735) b!710934))

(assert (= (and b!710936 (not c!78735)) b!710933))

(assert (= (or b!710934 b!710933) bm!34492))

(assert (=> b!710932 m!668265))

(assert (=> b!710932 m!668265))

(assert (=> b!710932 m!668285))

(assert (=> bm!34492 m!668265))

(declare-fun m!668539 () Bool)

(assert (=> bm!34492 m!668539))

(assert (=> b!710935 m!668265))

(assert (=> b!710935 m!668265))

(declare-fun m!668541 () Bool)

(assert (=> b!710935 m!668541))

(assert (=> b!710936 m!668265))

(assert (=> b!710936 m!668265))

(assert (=> b!710936 m!668285))

(assert (=> b!710614 d!97585))

(declare-fun d!97589 () Bool)

(declare-fun res!474204 () Bool)

(declare-fun e!400047 () Bool)

(assert (=> d!97589 (=> res!474204 e!400047)))

(assert (=> d!97589 (= res!474204 ((_ is Nil!13284) lt!318437))))

(assert (=> d!97589 (= (subseq!407 lt!318437 lt!318438) e!400047)))

(declare-fun b!710937 () Bool)

(declare-fun e!400049 () Bool)

(assert (=> b!710937 (= e!400047 e!400049)))

(declare-fun res!474205 () Bool)

(assert (=> b!710937 (=> (not res!474205) (not e!400049))))

(assert (=> b!710937 (= res!474205 ((_ is Cons!13283) lt!318438))))

(declare-fun b!710939 () Bool)

(declare-fun e!400048 () Bool)

(assert (=> b!710939 (= e!400048 (subseq!407 (t!19579 lt!318437) (t!19579 lt!318438)))))

(declare-fun b!710938 () Bool)

(declare-fun e!400050 () Bool)

(assert (=> b!710938 (= e!400049 e!400050)))

(declare-fun res!474203 () Bool)

(assert (=> b!710938 (=> res!474203 e!400050)))

(assert (=> b!710938 (= res!474203 e!400048)))

(declare-fun res!474202 () Bool)

(assert (=> b!710938 (=> (not res!474202) (not e!400048))))

(assert (=> b!710938 (= res!474202 (= (h!14331 lt!318437) (h!14331 lt!318438)))))

(declare-fun b!710940 () Bool)

(assert (=> b!710940 (= e!400050 (subseq!407 lt!318437 (t!19579 lt!318438)))))

(assert (= (and d!97589 (not res!474204)) b!710937))

(assert (= (and b!710937 res!474205) b!710938))

(assert (= (and b!710938 res!474202) b!710939))

(assert (= (and b!710938 (not res!474203)) b!710940))

(declare-fun m!668543 () Bool)

(assert (=> b!710939 m!668543))

(declare-fun m!668545 () Bool)

(assert (=> b!710940 m!668545))

(assert (=> b!710613 d!97589))

(check-sat (not b!710780) (not b!710812) (not b!710789) (not b!710770) (not d!97525) (not b!710848) (not b!710776) (not b!710829) (not bm!34479) (not b!710834) (not b!710931) (not b!710843) (not b!710784) (not d!97563) (not b!710888) (not b!710835) (not b!710850) (not d!97531) (not d!97527) (not d!97517) (not d!97523) (not d!97575) (not bm!34491) (not b!710793) (not b!710782) (not b!710778) (not b!710794) (not d!97569) (not b!710940) (not bm!34492) (not b!710889) (not b!710932) (not b!710939) (not b!710813) (not b!710935) (not d!97535) (not b!710844) (not b!710796) (not b!710809) (not b!710936) (not b!710790) (not b!710792) (not d!97521))
(check-sat)
