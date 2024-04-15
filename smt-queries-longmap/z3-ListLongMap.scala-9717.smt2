; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114974 () Bool)

(assert start!114974)

(declare-fun res!906678 () Bool)

(declare-fun e!772940 () Bool)

(assert (=> start!114974 (=> (not res!906678) (not e!772940))))

(declare-datatypes ((array!92601 0))(
  ( (array!92602 (arr!44734 (Array (_ BitVec 32) (_ BitVec 64))) (size!45286 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92601)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114974 (= res!906678 (and (bvslt (size!45286 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45286 a!3742))))))

(assert (=> start!114974 e!772940))

(assert (=> start!114974 true))

(declare-fun array_inv!33967 (array!92601) Bool)

(assert (=> start!114974 (array_inv!33967 a!3742)))

(declare-fun b!1362701 () Bool)

(declare-datatypes ((Unit!44778 0))(
  ( (Unit!44779) )
))
(declare-fun e!772941 () Unit!44778)

(declare-fun lt!600400 () Unit!44778)

(assert (=> b!1362701 (= e!772941 lt!600400)))

(declare-fun lt!600398 () Unit!44778)

(declare-datatypes ((List!31853 0))(
  ( (Nil!31850) (Cons!31849 (h!33058 (_ BitVec 64)) (t!46533 List!31853)) )
))
(declare-fun acc!759 () List!31853)

(declare-fun lemmaListSubSeqRefl!0 (List!31853) Unit!44778)

(assert (=> b!1362701 (= lt!600398 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!911 (List!31853 List!31853) Bool)

(assert (=> b!1362701 (subseq!911 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92601 List!31853 List!31853 (_ BitVec 32)) Unit!44778)

(declare-fun $colon$colon!916 (List!31853 (_ BitVec 64)) List!31853)

(assert (=> b!1362701 (= lt!600400 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!916 acc!759 (select (arr!44734 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92601 (_ BitVec 32) List!31853) Bool)

(assert (=> b!1362701 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362702 () Bool)

(declare-fun res!906680 () Bool)

(assert (=> b!1362702 (=> (not res!906680) (not e!772940))))

(declare-fun contains!9473 (List!31853 (_ BitVec 64)) Bool)

(assert (=> b!1362702 (= res!906680 (not (contains!9473 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362703 () Bool)

(declare-fun res!906674 () Bool)

(assert (=> b!1362703 (=> (not res!906674) (not e!772940))))

(assert (=> b!1362703 (= res!906674 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45286 a!3742)))))

(declare-fun b!1362704 () Bool)

(declare-fun res!906676 () Bool)

(assert (=> b!1362704 (=> (not res!906676) (not e!772940))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362704 (= res!906676 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45286 a!3742))))))

(declare-fun b!1362705 () Bool)

(assert (=> b!1362705 (= e!772940 false)))

(declare-fun lt!600399 () Unit!44778)

(assert (=> b!1362705 (= lt!600399 e!772941)))

(declare-fun c!127457 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362705 (= c!127457 (validKeyInArray!0 (select (arr!44734 a!3742) from!3120)))))

(declare-fun b!1362706 () Bool)

(declare-fun Unit!44780 () Unit!44778)

(assert (=> b!1362706 (= e!772941 Unit!44780)))

(declare-fun b!1362707 () Bool)

(declare-fun res!906673 () Bool)

(assert (=> b!1362707 (=> (not res!906673) (not e!772940))))

(assert (=> b!1362707 (= res!906673 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362708 () Bool)

(declare-fun res!906677 () Bool)

(assert (=> b!1362708 (=> (not res!906677) (not e!772940))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362708 (= res!906677 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362709 () Bool)

(declare-fun res!906675 () Bool)

(assert (=> b!1362709 (=> (not res!906675) (not e!772940))))

(declare-fun noDuplicate!2388 (List!31853) Bool)

(assert (=> b!1362709 (= res!906675 (noDuplicate!2388 acc!759))))

(declare-fun b!1362710 () Bool)

(declare-fun res!906672 () Bool)

(assert (=> b!1362710 (=> (not res!906672) (not e!772940))))

(assert (=> b!1362710 (= res!906672 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31850))))

(declare-fun b!1362711 () Bool)

(declare-fun res!906679 () Bool)

(assert (=> b!1362711 (=> (not res!906679) (not e!772940))))

(assert (=> b!1362711 (= res!906679 (not (contains!9473 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114974 res!906678) b!1362709))

(assert (= (and b!1362709 res!906675) b!1362702))

(assert (= (and b!1362702 res!906680) b!1362711))

(assert (= (and b!1362711 res!906679) b!1362710))

(assert (= (and b!1362710 res!906672) b!1362707))

(assert (= (and b!1362707 res!906673) b!1362704))

(assert (= (and b!1362704 res!906676) b!1362708))

(assert (= (and b!1362708 res!906677) b!1362703))

(assert (= (and b!1362703 res!906674) b!1362705))

(assert (= (and b!1362705 c!127457) b!1362701))

(assert (= (and b!1362705 (not c!127457)) b!1362706))

(declare-fun m!1247179 () Bool)

(assert (=> b!1362708 m!1247179))

(declare-fun m!1247181 () Bool)

(assert (=> b!1362707 m!1247181))

(declare-fun m!1247183 () Bool)

(assert (=> start!114974 m!1247183))

(declare-fun m!1247185 () Bool)

(assert (=> b!1362701 m!1247185))

(declare-fun m!1247187 () Bool)

(assert (=> b!1362701 m!1247187))

(declare-fun m!1247189 () Bool)

(assert (=> b!1362701 m!1247189))

(declare-fun m!1247191 () Bool)

(assert (=> b!1362701 m!1247191))

(declare-fun m!1247193 () Bool)

(assert (=> b!1362701 m!1247193))

(assert (=> b!1362701 m!1247187))

(assert (=> b!1362701 m!1247189))

(declare-fun m!1247195 () Bool)

(assert (=> b!1362701 m!1247195))

(assert (=> b!1362705 m!1247187))

(assert (=> b!1362705 m!1247187))

(declare-fun m!1247197 () Bool)

(assert (=> b!1362705 m!1247197))

(declare-fun m!1247199 () Bool)

(assert (=> b!1362711 m!1247199))

(declare-fun m!1247201 () Bool)

(assert (=> b!1362709 m!1247201))

(declare-fun m!1247203 () Bool)

(assert (=> b!1362710 m!1247203))

(declare-fun m!1247205 () Bool)

(assert (=> b!1362702 m!1247205))

(check-sat (not b!1362708) (not b!1362701) (not b!1362709) (not b!1362707) (not b!1362710) (not b!1362705) (not b!1362702) (not start!114974) (not b!1362711))
(check-sat)
