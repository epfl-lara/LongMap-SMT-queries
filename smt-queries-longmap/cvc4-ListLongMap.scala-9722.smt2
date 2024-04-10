; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115062 () Bool)

(assert start!115062)

(declare-fun b!1363502 () Bool)

(declare-fun res!907304 () Bool)

(declare-fun e!773284 () Bool)

(assert (=> b!1363502 (=> (not res!907304) (not e!773284))))

(declare-datatypes ((List!31817 0))(
  ( (Nil!31814) (Cons!31813 (h!33022 (_ BitVec 64)) (t!46508 List!31817)) )
))
(declare-fun acc!759 () List!31817)

(declare-fun contains!9526 (List!31817 (_ BitVec 64)) Bool)

(assert (=> b!1363502 (= res!907304 (not (contains!9526 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363503 () Bool)

(declare-fun res!907303 () Bool)

(assert (=> b!1363503 (=> (not res!907303) (not e!773284))))

(assert (=> b!1363503 (= res!907303 (not (contains!9526 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363504 () Bool)

(declare-datatypes ((Unit!44988 0))(
  ( (Unit!44989) )
))
(declare-fun e!773283 () Unit!44988)

(declare-fun lt!600795 () Unit!44988)

(assert (=> b!1363504 (= e!773283 lt!600795)))

(declare-fun lt!600794 () Unit!44988)

(declare-fun lemmaListSubSeqRefl!0 (List!31817) Unit!44988)

(assert (=> b!1363504 (= lt!600794 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!928 (List!31817 List!31817) Bool)

(assert (=> b!1363504 (subseq!928 acc!759 acc!759)))

(declare-datatypes ((array!92689 0))(
  ( (array!92690 (arr!44776 (Array (_ BitVec 32) (_ BitVec 64))) (size!45326 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92689)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92689 List!31817 List!31817 (_ BitVec 32)) Unit!44988)

(declare-fun $colon$colon!931 (List!31817 (_ BitVec 64)) List!31817)

(assert (=> b!1363504 (= lt!600795 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!931 acc!759 (select (arr!44776 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92689 (_ BitVec 32) List!31817) Bool)

(assert (=> b!1363504 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363505 () Bool)

(declare-fun res!907301 () Bool)

(assert (=> b!1363505 (=> (not res!907301) (not e!773284))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363505 (= res!907301 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363506 () Bool)

(declare-fun res!907305 () Bool)

(assert (=> b!1363506 (=> (not res!907305) (not e!773284))))

(assert (=> b!1363506 (= res!907305 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363507 () Bool)

(declare-fun res!907308 () Bool)

(assert (=> b!1363507 (=> (not res!907308) (not e!773284))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363507 (= res!907308 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45326 a!3742))))))

(declare-fun b!1363508 () Bool)

(declare-fun res!907306 () Bool)

(assert (=> b!1363508 (=> (not res!907306) (not e!773284))))

(assert (=> b!1363508 (= res!907306 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31814))))

(declare-fun b!1363509 () Bool)

(declare-fun res!907302 () Bool)

(assert (=> b!1363509 (=> (not res!907302) (not e!773284))))

(declare-fun noDuplicate!2383 (List!31817) Bool)

(assert (=> b!1363509 (= res!907302 (noDuplicate!2383 acc!759))))

(declare-fun b!1363511 () Bool)

(declare-fun e!773282 () Bool)

(assert (=> b!1363511 (= e!773282 false)))

(declare-fun lt!600793 () Bool)

(assert (=> b!1363511 (= lt!600793 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363512 () Bool)

(declare-fun Unit!44990 () Unit!44988)

(assert (=> b!1363512 (= e!773283 Unit!44990)))

(declare-fun b!1363513 () Bool)

(declare-fun res!907300 () Bool)

(assert (=> b!1363513 (=> (not res!907300) (not e!773284))))

(assert (=> b!1363513 (= res!907300 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45326 a!3742)))))

(declare-fun res!907307 () Bool)

(assert (=> start!115062 (=> (not res!907307) (not e!773284))))

(assert (=> start!115062 (= res!907307 (and (bvslt (size!45326 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45326 a!3742))))))

(assert (=> start!115062 e!773284))

(assert (=> start!115062 true))

(declare-fun array_inv!33804 (array!92689) Bool)

(assert (=> start!115062 (array_inv!33804 a!3742)))

(declare-fun b!1363510 () Bool)

(assert (=> b!1363510 (= e!773284 e!773282)))

(declare-fun res!907309 () Bool)

(assert (=> b!1363510 (=> (not res!907309) (not e!773282))))

(declare-fun lt!600792 () Bool)

(assert (=> b!1363510 (= res!907309 (and (not (= from!3120 i!1404)) (not lt!600792) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600796 () Unit!44988)

(assert (=> b!1363510 (= lt!600796 e!773283)))

(declare-fun c!127541 () Bool)

(assert (=> b!1363510 (= c!127541 lt!600792)))

(assert (=> b!1363510 (= lt!600792 (validKeyInArray!0 (select (arr!44776 a!3742) from!3120)))))

(assert (= (and start!115062 res!907307) b!1363509))

(assert (= (and b!1363509 res!907302) b!1363503))

(assert (= (and b!1363503 res!907303) b!1363502))

(assert (= (and b!1363502 res!907304) b!1363508))

(assert (= (and b!1363508 res!907306) b!1363506))

(assert (= (and b!1363506 res!907305) b!1363507))

(assert (= (and b!1363507 res!907308) b!1363505))

(assert (= (and b!1363505 res!907301) b!1363513))

(assert (= (and b!1363513 res!907300) b!1363510))

(assert (= (and b!1363510 c!127541) b!1363504))

(assert (= (and b!1363510 (not c!127541)) b!1363512))

(assert (= (and b!1363510 res!907309) b!1363511))

(declare-fun m!1248297 () Bool)

(assert (=> b!1363504 m!1248297))

(declare-fun m!1248299 () Bool)

(assert (=> b!1363504 m!1248299))

(declare-fun m!1248301 () Bool)

(assert (=> b!1363504 m!1248301))

(declare-fun m!1248303 () Bool)

(assert (=> b!1363504 m!1248303))

(declare-fun m!1248305 () Bool)

(assert (=> b!1363504 m!1248305))

(assert (=> b!1363504 m!1248299))

(assert (=> b!1363504 m!1248301))

(declare-fun m!1248307 () Bool)

(assert (=> b!1363504 m!1248307))

(assert (=> b!1363510 m!1248299))

(assert (=> b!1363510 m!1248299))

(declare-fun m!1248309 () Bool)

(assert (=> b!1363510 m!1248309))

(assert (=> b!1363511 m!1248305))

(declare-fun m!1248311 () Bool)

(assert (=> start!115062 m!1248311))

(declare-fun m!1248313 () Bool)

(assert (=> b!1363509 m!1248313))

(declare-fun m!1248315 () Bool)

(assert (=> b!1363503 m!1248315))

(declare-fun m!1248317 () Bool)

(assert (=> b!1363502 m!1248317))

(declare-fun m!1248319 () Bool)

(assert (=> b!1363508 m!1248319))

(declare-fun m!1248321 () Bool)

(assert (=> b!1363505 m!1248321))

(declare-fun m!1248323 () Bool)

(assert (=> b!1363506 m!1248323))

(push 1)

(assert (not start!115062))

(assert (not b!1363509))

