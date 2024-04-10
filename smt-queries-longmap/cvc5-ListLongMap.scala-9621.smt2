; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113828 () Bool)

(assert start!113828)

(declare-fun b!1350267 () Bool)

(declare-fun e!768126 () Bool)

(declare-datatypes ((List!31512 0))(
  ( (Nil!31509) (Cons!31508 (h!32717 (_ BitVec 64)) (t!46170 List!31512)) )
))
(declare-fun noDuplicate!2078 (List!31512) Bool)

(assert (=> b!1350267 (= e!768126 (not (noDuplicate!2078 Nil!31509)))))

(declare-fun b!1350268 () Bool)

(declare-fun res!895727 () Bool)

(assert (=> b!1350268 (=> (not res!895727) (not e!768126))))

(declare-fun acc!759 () List!31512)

(assert (=> b!1350268 (= res!895727 (noDuplicate!2078 acc!759))))

(declare-fun res!895729 () Bool)

(assert (=> start!113828 (=> (not res!895729) (not e!768126))))

(declare-datatypes ((array!92040 0))(
  ( (array!92041 (arr!44471 (Array (_ BitVec 32) (_ BitVec 64))) (size!45021 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92040)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113828 (= res!895729 (and (bvslt (size!45021 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45021 a!3742))))))

(assert (=> start!113828 e!768126))

(declare-fun array_inv!33499 (array!92040) Bool)

(assert (=> start!113828 (array_inv!33499 a!3742)))

(assert (=> start!113828 true))

(declare-fun b!1350269 () Bool)

(declare-fun res!895728 () Bool)

(assert (=> b!1350269 (=> (not res!895728) (not e!768126))))

(assert (=> b!1350269 (= res!895728 (bvsle #b00000000000000000000000000000000 (size!45021 a!3742)))))

(declare-fun b!1350270 () Bool)

(declare-fun res!895725 () Bool)

(assert (=> b!1350270 (=> (not res!895725) (not e!768126))))

(declare-fun contains!9221 (List!31512 (_ BitVec 64)) Bool)

(assert (=> b!1350270 (= res!895725 (not (contains!9221 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350271 () Bool)

(declare-fun res!895726 () Bool)

(assert (=> b!1350271 (=> (not res!895726) (not e!768126))))

(assert (=> b!1350271 (= res!895726 (not (contains!9221 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113828 res!895729) b!1350268))

(assert (= (and b!1350268 res!895727) b!1350270))

(assert (= (and b!1350270 res!895725) b!1350271))

(assert (= (and b!1350271 res!895726) b!1350269))

(assert (= (and b!1350269 res!895728) b!1350267))

(declare-fun m!1237507 () Bool)

(assert (=> b!1350268 m!1237507))

(declare-fun m!1237509 () Bool)

(assert (=> b!1350267 m!1237509))

(declare-fun m!1237511 () Bool)

(assert (=> b!1350271 m!1237511))

(declare-fun m!1237513 () Bool)

(assert (=> b!1350270 m!1237513))

(declare-fun m!1237515 () Bool)

(assert (=> start!113828 m!1237515))

(push 1)

(assert (not b!1350270))

(assert (not b!1350271))

(assert (not start!113828))

(assert (not b!1350267))

(assert (not b!1350268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!144897 () Bool)

(declare-fun lt!596959 () Bool)

(declare-fun content!669 (List!31512) (Set (_ BitVec 64)))

(assert (=> d!144897 (= lt!596959 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!669 acc!759)))))

(declare-fun e!768164 () Bool)

(assert (=> d!144897 (= lt!596959 e!768164)))

(declare-fun res!895784 () Bool)

(assert (=> d!144897 (=> (not res!895784) (not e!768164))))

(assert (=> d!144897 (= res!895784 (is-Cons!31508 acc!759))))

(assert (=> d!144897 (= (contains!9221 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596959)))

(declare-fun b!1350326 () Bool)

(declare-fun e!768165 () Bool)

(assert (=> b!1350326 (= e!768164 e!768165)))

(declare-fun res!895785 () Bool)

(assert (=> b!1350326 (=> res!895785 e!768165)))

(assert (=> b!1350326 (= res!895785 (= (h!32717 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350327 () Bool)

(assert (=> b!1350327 (= e!768165 (contains!9221 (t!46170 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144897 res!895784) b!1350326))

(assert (= (and b!1350326 (not res!895785)) b!1350327))

(declare-fun m!1237555 () Bool)

(assert (=> d!144897 m!1237555))

(declare-fun m!1237557 () Bool)

(assert (=> d!144897 m!1237557))

(declare-fun m!1237559 () Bool)

(assert (=> b!1350327 m!1237559))

(assert (=> b!1350270 d!144897))

(declare-fun d!144907 () Bool)

(declare-fun lt!596963 () Bool)

(assert (=> d!144907 (= lt!596963 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!669 acc!759)))))

(declare-fun e!768172 () Bool)

(assert (=> d!144907 (= lt!596963 e!768172)))

(declare-fun res!895792 () Bool)

(assert (=> d!144907 (=> (not res!895792) (not e!768172))))

(assert (=> d!144907 (= res!895792 (is-Cons!31508 acc!759))))

(assert (=> d!144907 (= (contains!9221 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596963)))

(declare-fun b!1350334 () Bool)

(declare-fun e!768173 () Bool)

(assert (=> b!1350334 (= e!768172 e!768173)))

(declare-fun res!895793 () Bool)

(assert (=> b!1350334 (=> res!895793 e!768173)))

(assert (=> b!1350334 (= res!895793 (= (h!32717 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350335 () Bool)

(assert (=> b!1350335 (= e!768173 (contains!9221 (t!46170 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144907 res!895792) b!1350334))

(assert (= (and b!1350334 (not res!895793)) b!1350335))

(assert (=> d!144907 m!1237555))

(declare-fun m!1237565 () Bool)

(assert (=> d!144907 m!1237565))

(declare-fun m!1237567 () Bool)

(assert (=> b!1350335 m!1237567))

(assert (=> b!1350271 d!144907))

(declare-fun d!144909 () Bool)

(assert (=> d!144909 (= (array_inv!33499 a!3742) (bvsge (size!45021 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113828 d!144909))

(declare-fun d!144911 () Bool)

(declare-fun res!895804 () Bool)

(declare-fun e!768184 () Bool)

