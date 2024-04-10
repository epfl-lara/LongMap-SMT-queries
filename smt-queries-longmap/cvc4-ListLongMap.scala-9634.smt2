; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113946 () Bool)

(assert start!113946)

(declare-fun b!1351691 () Bool)

(declare-fun e!768560 () Bool)

(assert (=> b!1351691 (= e!768560 true)))

(declare-fun lt!597295 () Bool)

(declare-datatypes ((List!31553 0))(
  ( (Nil!31550) (Cons!31549 (h!32758 (_ BitVec 64)) (t!46211 List!31553)) )
))
(declare-fun lt!597298 () List!31553)

(declare-datatypes ((array!92128 0))(
  ( (array!92129 (arr!44512 (Array (_ BitVec 32) (_ BitVec 64))) (size!45062 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92128)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92128 (_ BitVec 32) List!31553) Bool)

(assert (=> b!1351691 (= lt!597295 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597298))))

(declare-datatypes ((Unit!44278 0))(
  ( (Unit!44279) )
))
(declare-fun lt!597296 () Unit!44278)

(declare-fun acc!759 () List!31553)

(declare-fun noDuplicateSubseq!133 (List!31553 List!31553) Unit!44278)

(assert (=> b!1351691 (= lt!597296 (noDuplicateSubseq!133 acc!759 lt!597298))))

(declare-fun b!1351692 () Bool)

(declare-fun res!897162 () Bool)

(declare-fun e!768561 () Bool)

(assert (=> b!1351692 (=> (not res!897162) (not e!768561))))

(declare-fun contains!9262 (List!31553 (_ BitVec 64)) Bool)

(assert (=> b!1351692 (= res!897162 (not (contains!9262 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351693 () Bool)

(declare-fun res!897154 () Bool)

(assert (=> b!1351693 (=> res!897154 e!768560)))

(declare-fun noDuplicate!2119 (List!31553) Bool)

(assert (=> b!1351693 (= res!897154 (not (noDuplicate!2119 lt!597298)))))

(declare-fun b!1351694 () Bool)

(declare-fun res!897150 () Bool)

(assert (=> b!1351694 (=> (not res!897150) (not e!768561))))

(assert (=> b!1351694 (= res!897150 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31550))))

(declare-fun b!1351695 () Bool)

(declare-fun res!897155 () Bool)

(assert (=> b!1351695 (=> res!897155 e!768560)))

(assert (=> b!1351695 (= res!897155 (contains!9262 lt!597298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351696 () Bool)

(declare-fun res!897157 () Bool)

(assert (=> b!1351696 (=> (not res!897157) (not e!768561))))

(assert (=> b!1351696 (= res!897157 (not (contains!9262 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351697 () Bool)

(declare-fun res!897159 () Bool)

(assert (=> b!1351697 (=> (not res!897159) (not e!768561))))

(assert (=> b!1351697 (= res!897159 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351698 () Bool)

(declare-fun res!897149 () Bool)

(assert (=> b!1351698 (=> (not res!897149) (not e!768561))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351698 (= res!897149 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351700 () Bool)

(declare-fun res!897163 () Bool)

(assert (=> b!1351700 (=> res!897163 e!768560)))

(assert (=> b!1351700 (= res!897163 (contains!9262 lt!597298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351701 () Bool)

(declare-fun res!897152 () Bool)

(assert (=> b!1351701 (=> (not res!897152) (not e!768561))))

(assert (=> b!1351701 (= res!897152 (noDuplicate!2119 acc!759))))

(declare-fun b!1351702 () Bool)

(declare-fun res!897151 () Bool)

(assert (=> b!1351702 (=> (not res!897151) (not e!768561))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351702 (= res!897151 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45062 a!3742))))))

(declare-fun b!1351703 () Bool)

(declare-fun res!897153 () Bool)

(assert (=> b!1351703 (=> (not res!897153) (not e!768561))))

(assert (=> b!1351703 (= res!897153 (validKeyInArray!0 (select (arr!44512 a!3742) from!3120)))))

(declare-fun res!897160 () Bool)

(assert (=> start!113946 (=> (not res!897160) (not e!768561))))

(assert (=> start!113946 (= res!897160 (and (bvslt (size!45062 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45062 a!3742))))))

(assert (=> start!113946 e!768561))

(assert (=> start!113946 true))

(declare-fun array_inv!33540 (array!92128) Bool)

(assert (=> start!113946 (array_inv!33540 a!3742)))

(declare-fun b!1351699 () Bool)

(assert (=> b!1351699 (= e!768561 (not e!768560))))

(declare-fun res!897158 () Bool)

(assert (=> b!1351699 (=> res!897158 e!768560)))

(assert (=> b!1351699 (= res!897158 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!697 (List!31553 (_ BitVec 64)) List!31553)

(assert (=> b!1351699 (= lt!597298 ($colon$colon!697 acc!759 (select (arr!44512 a!3742) from!3120)))))

(declare-fun subseq!682 (List!31553 List!31553) Bool)

(assert (=> b!1351699 (subseq!682 acc!759 acc!759)))

(declare-fun lt!597297 () Unit!44278)

(declare-fun lemmaListSubSeqRefl!0 (List!31553) Unit!44278)

(assert (=> b!1351699 (= lt!597297 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351704 () Bool)

(declare-fun res!897156 () Bool)

(assert (=> b!1351704 (=> res!897156 e!768560)))

(assert (=> b!1351704 (= res!897156 (not (subseq!682 acc!759 lt!597298)))))

(declare-fun b!1351705 () Bool)

(declare-fun res!897161 () Bool)

(assert (=> b!1351705 (=> (not res!897161) (not e!768561))))

(assert (=> b!1351705 (= res!897161 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45062 a!3742)))))

(assert (= (and start!113946 res!897160) b!1351701))

(assert (= (and b!1351701 res!897152) b!1351692))

(assert (= (and b!1351692 res!897162) b!1351696))

(assert (= (and b!1351696 res!897157) b!1351694))

(assert (= (and b!1351694 res!897150) b!1351697))

(assert (= (and b!1351697 res!897159) b!1351702))

(assert (= (and b!1351702 res!897151) b!1351698))

(assert (= (and b!1351698 res!897149) b!1351705))

(assert (= (and b!1351705 res!897161) b!1351703))

(assert (= (and b!1351703 res!897153) b!1351699))

(assert (= (and b!1351699 (not res!897158)) b!1351693))

(assert (= (and b!1351693 (not res!897154)) b!1351700))

(assert (= (and b!1351700 (not res!897163)) b!1351695))

(assert (= (and b!1351695 (not res!897155)) b!1351704))

(assert (= (and b!1351704 (not res!897156)) b!1351691))

(declare-fun m!1238665 () Bool)

(assert (=> b!1351691 m!1238665))

(declare-fun m!1238667 () Bool)

(assert (=> b!1351691 m!1238667))

(declare-fun m!1238669 () Bool)

(assert (=> b!1351697 m!1238669))

(declare-fun m!1238671 () Bool)

(assert (=> b!1351699 m!1238671))

(assert (=> b!1351699 m!1238671))

(declare-fun m!1238673 () Bool)

(assert (=> b!1351699 m!1238673))

(declare-fun m!1238675 () Bool)

(assert (=> b!1351699 m!1238675))

(declare-fun m!1238677 () Bool)

(assert (=> b!1351699 m!1238677))

(declare-fun m!1238679 () Bool)

(assert (=> b!1351695 m!1238679))

(declare-fun m!1238681 () Bool)

(assert (=> b!1351700 m!1238681))

(declare-fun m!1238683 () Bool)

(assert (=> b!1351696 m!1238683))

(declare-fun m!1238685 () Bool)

(assert (=> b!1351693 m!1238685))

(declare-fun m!1238687 () Bool)

(assert (=> b!1351698 m!1238687))

(declare-fun m!1238689 () Bool)

(assert (=> start!113946 m!1238689))

(declare-fun m!1238691 () Bool)

(assert (=> b!1351701 m!1238691))

(assert (=> b!1351703 m!1238671))

(assert (=> b!1351703 m!1238671))

(declare-fun m!1238693 () Bool)

(assert (=> b!1351703 m!1238693))

(declare-fun m!1238695 () Bool)

(assert (=> b!1351694 m!1238695))

(declare-fun m!1238697 () Bool)

(assert (=> b!1351692 m!1238697))

(declare-fun m!1238699 () Bool)

(assert (=> b!1351704 m!1238699))

(push 1)

(assert (not b!1351698))

(assert (not b!1351703))

(assert (not b!1351691))

(assert (not b!1351697))

(assert (not b!1351700))

(assert (not b!1351692))

(assert (not b!1351704))

(assert (not b!1351695))

(assert (not start!113946))

(assert (not b!1351701))

(assert (not b!1351696))

(assert (not b!1351699))

(assert (not b!1351693))

(assert (not b!1351694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

