; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114700 () Bool)

(assert start!114700)

(declare-fun res!903707 () Bool)

(declare-fun e!771894 () Bool)

(assert (=> start!114700 (=> (not res!903707) (not e!771894))))

(declare-datatypes ((array!92587 0))(
  ( (array!92588 (arr!44731 (Array (_ BitVec 32) (_ BitVec 64))) (size!45282 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92587)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114700 (= res!903707 (and (bvslt (size!45282 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45282 a!3742))))))

(assert (=> start!114700 e!771894))

(assert (=> start!114700 true))

(declare-fun array_inv!34012 (array!92587) Bool)

(assert (=> start!114700 (array_inv!34012 a!3742)))

(declare-fun b!1359852 () Bool)

(declare-fun res!903705 () Bool)

(assert (=> b!1359852 (=> (not res!903705) (not e!771894))))

(declare-datatypes ((List!31759 0))(
  ( (Nil!31756) (Cons!31755 (h!32973 (_ BitVec 64)) (t!46421 List!31759)) )
))
(declare-fun acc!759 () List!31759)

(declare-fun contains!9471 (List!31759 (_ BitVec 64)) Bool)

(assert (=> b!1359852 (= res!903705 (not (contains!9471 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359853 () Bool)

(declare-fun res!903708 () Bool)

(assert (=> b!1359853 (=> (not res!903708) (not e!771894))))

(assert (=> b!1359853 (= res!903708 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45282 a!3742)))))

(declare-fun b!1359854 () Bool)

(declare-fun res!903709 () Bool)

(assert (=> b!1359854 (=> (not res!903709) (not e!771894))))

(assert (=> b!1359854 (= res!903709 (not (contains!9471 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359855 () Bool)

(declare-datatypes ((Unit!44633 0))(
  ( (Unit!44634) )
))
(declare-fun e!771893 () Unit!44633)

(declare-fun lt!599845 () Unit!44633)

(assert (=> b!1359855 (= e!771893 lt!599845)))

(declare-fun lt!599847 () Unit!44633)

(declare-fun lemmaListSubSeqRefl!0 (List!31759) Unit!44633)

(assert (=> b!1359855 (= lt!599847 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!830 (List!31759 List!31759) Bool)

(assert (=> b!1359855 (subseq!830 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92587 List!31759 List!31759 (_ BitVec 32)) Unit!44633)

(declare-fun $colon$colon!832 (List!31759 (_ BitVec 64)) List!31759)

(assert (=> b!1359855 (= lt!599845 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!832 acc!759 (select (arr!44731 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92587 (_ BitVec 32) List!31759) Bool)

(assert (=> b!1359855 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359856 () Bool)

(declare-fun res!903711 () Bool)

(assert (=> b!1359856 (=> (not res!903711) (not e!771894))))

(assert (=> b!1359856 (= res!903711 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31756))))

(declare-fun b!1359857 () Bool)

(declare-fun res!903704 () Bool)

(assert (=> b!1359857 (=> (not res!903704) (not e!771894))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359857 (= res!903704 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45282 a!3742))))))

(declare-fun b!1359858 () Bool)

(declare-fun res!903706 () Bool)

(assert (=> b!1359858 (=> (not res!903706) (not e!771894))))

(assert (=> b!1359858 (= res!903706 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359859 () Bool)

(declare-fun res!903710 () Bool)

(assert (=> b!1359859 (=> (not res!903710) (not e!771894))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359859 (= res!903710 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359860 () Bool)

(declare-fun res!903703 () Bool)

(assert (=> b!1359860 (=> (not res!903703) (not e!771894))))

(declare-fun noDuplicate!2302 (List!31759) Bool)

(assert (=> b!1359860 (= res!903703 (noDuplicate!2302 acc!759))))

(declare-fun b!1359861 () Bool)

(declare-fun Unit!44635 () Unit!44633)

(assert (=> b!1359861 (= e!771893 Unit!44635)))

(declare-fun b!1359862 () Bool)

(assert (=> b!1359862 (= e!771894 (and (= from!3120 i!1404) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599846 () Unit!44633)

(assert (=> b!1359862 (= lt!599846 e!771893)))

(declare-fun c!127522 () Bool)

(assert (=> b!1359862 (= c!127522 (validKeyInArray!0 (select (arr!44731 a!3742) from!3120)))))

(assert (= (and start!114700 res!903707) b!1359860))

(assert (= (and b!1359860 res!903703) b!1359854))

(assert (= (and b!1359854 res!903709) b!1359852))

(assert (= (and b!1359852 res!903705) b!1359856))

(assert (= (and b!1359856 res!903711) b!1359858))

(assert (= (and b!1359858 res!903706) b!1359857))

(assert (= (and b!1359857 res!903704) b!1359859))

(assert (= (and b!1359859 res!903710) b!1359853))

(assert (= (and b!1359853 res!903708) b!1359862))

(assert (= (and b!1359862 c!127522) b!1359855))

(assert (= (and b!1359862 (not c!127522)) b!1359861))

(declare-fun m!1245715 () Bool)

(assert (=> b!1359855 m!1245715))

(declare-fun m!1245717 () Bool)

(assert (=> b!1359855 m!1245717))

(declare-fun m!1245719 () Bool)

(assert (=> b!1359855 m!1245719))

(declare-fun m!1245721 () Bool)

(assert (=> b!1359855 m!1245721))

(declare-fun m!1245723 () Bool)

(assert (=> b!1359855 m!1245723))

(assert (=> b!1359855 m!1245717))

(assert (=> b!1359855 m!1245719))

(declare-fun m!1245725 () Bool)

(assert (=> b!1359855 m!1245725))

(declare-fun m!1245727 () Bool)

(assert (=> b!1359858 m!1245727))

(assert (=> b!1359862 m!1245717))

(assert (=> b!1359862 m!1245717))

(declare-fun m!1245729 () Bool)

(assert (=> b!1359862 m!1245729))

(declare-fun m!1245731 () Bool)

(assert (=> b!1359859 m!1245731))

(declare-fun m!1245733 () Bool)

(assert (=> b!1359854 m!1245733))

(declare-fun m!1245735 () Bool)

(assert (=> b!1359860 m!1245735))

(declare-fun m!1245737 () Bool)

(assert (=> b!1359852 m!1245737))

(declare-fun m!1245739 () Bool)

(assert (=> b!1359856 m!1245739))

(declare-fun m!1245741 () Bool)

(assert (=> start!114700 m!1245741))

(check-sat (not b!1359858) (not b!1359852) (not b!1359862) (not b!1359856) (not b!1359859) (not b!1359855) (not start!114700) (not b!1359854) (not b!1359860))
(check-sat)
