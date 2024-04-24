; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114310 () Bool)

(assert start!114310)

(declare-fun b!1355928 () Bool)

(declare-fun e!770334 () Bool)

(declare-fun e!770338 () Bool)

(assert (=> b!1355928 (= e!770334 e!770338)))

(declare-fun res!900188 () Bool)

(assert (=> b!1355928 (=> (not res!900188) (not e!770338))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598798 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355928 (= res!900188 (and (not (= from!3120 i!1404)) lt!598798))))

(declare-datatypes ((Unit!44426 0))(
  ( (Unit!44427) )
))
(declare-fun lt!598799 () Unit!44426)

(declare-fun e!770337 () Unit!44426)

(assert (=> b!1355928 (= lt!598799 e!770337)))

(declare-fun c!127318 () Bool)

(assert (=> b!1355928 (= c!127318 lt!598798)))

(declare-datatypes ((array!92383 0))(
  ( (array!92384 (arr!44635 (Array (_ BitVec 32) (_ BitVec 64))) (size!45186 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92383)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355928 (= lt!598798 (validKeyInArray!0 (select (arr!44635 a!3742) from!3120)))))

(declare-fun b!1355929 () Bool)

(declare-fun res!900190 () Bool)

(assert (=> b!1355929 (=> (not res!900190) (not e!770334))))

(declare-datatypes ((List!31663 0))(
  ( (Nil!31660) (Cons!31659 (h!32877 (_ BitVec 64)) (t!46313 List!31663)) )
))
(declare-fun arrayNoDuplicates!0 (array!92383 (_ BitVec 32) List!31663) Bool)

(assert (=> b!1355929 (= res!900190 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31660))))

(declare-fun b!1355930 () Bool)

(declare-fun res!900187 () Bool)

(assert (=> b!1355930 (=> (not res!900187) (not e!770334))))

(assert (=> b!1355930 (= res!900187 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45186 a!3742)))))

(declare-fun b!1355931 () Bool)

(declare-fun res!900189 () Bool)

(assert (=> b!1355931 (=> (not res!900189) (not e!770334))))

(declare-fun acc!759 () List!31663)

(declare-fun noDuplicate!2206 (List!31663) Bool)

(assert (=> b!1355931 (= res!900189 (noDuplicate!2206 acc!759))))

(declare-fun b!1355932 () Bool)

(declare-fun res!900192 () Bool)

(declare-fun e!770336 () Bool)

(assert (=> b!1355932 (=> (not res!900192) (not e!770336))))

(declare-fun lt!598795 () List!31663)

(assert (=> b!1355932 (= res!900192 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598795))))

(declare-fun b!1355933 () Bool)

(declare-fun res!900193 () Bool)

(assert (=> b!1355933 (=> (not res!900193) (not e!770334))))

(declare-fun contains!9375 (List!31663 (_ BitVec 64)) Bool)

(assert (=> b!1355933 (= res!900193 (not (contains!9375 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355934 () Bool)

(declare-fun Unit!44428 () Unit!44426)

(assert (=> b!1355934 (= e!770337 Unit!44428)))

(declare-fun b!1355935 () Bool)

(assert (=> b!1355935 (= e!770336 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355935 (arrayNoDuplicates!0 (array!92384 (store (arr!44635 a!3742) i!1404 l!3587) (size!45186 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598795)))

(declare-fun lt!598797 () Unit!44426)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31663) Unit!44426)

(assert (=> b!1355935 (= lt!598797 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598795))))

(declare-fun b!1355936 () Bool)

(declare-fun res!900196 () Bool)

(assert (=> b!1355936 (=> (not res!900196) (not e!770336))))

(assert (=> b!1355936 (= res!900196 (not (contains!9375 lt!598795 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355937 () Bool)

(declare-fun res!900198 () Bool)

(assert (=> b!1355937 (=> (not res!900198) (not e!770336))))

(assert (=> b!1355937 (= res!900198 (not (contains!9375 lt!598795 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355938 () Bool)

(declare-fun res!900199 () Bool)

(assert (=> b!1355938 (=> (not res!900199) (not e!770336))))

(assert (=> b!1355938 (= res!900199 (noDuplicate!2206 lt!598795))))

(declare-fun b!1355939 () Bool)

(declare-fun res!900191 () Bool)

(assert (=> b!1355939 (=> (not res!900191) (not e!770334))))

(assert (=> b!1355939 (= res!900191 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45186 a!3742))))))

(declare-fun b!1355940 () Bool)

(declare-fun res!900200 () Bool)

(assert (=> b!1355940 (=> (not res!900200) (not e!770334))))

(assert (=> b!1355940 (= res!900200 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355941 () Bool)

(declare-fun res!900201 () Bool)

(assert (=> b!1355941 (=> (not res!900201) (not e!770334))))

(assert (=> b!1355941 (= res!900201 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355942 () Bool)

(declare-fun lt!598796 () Unit!44426)

(assert (=> b!1355942 (= e!770337 lt!598796)))

(declare-fun lt!598800 () Unit!44426)

(declare-fun lemmaListSubSeqRefl!0 (List!31663) Unit!44426)

(assert (=> b!1355942 (= lt!598800 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!752 (List!31663 List!31663) Bool)

(assert (=> b!1355942 (subseq!752 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92383 List!31663 List!31663 (_ BitVec 32)) Unit!44426)

(declare-fun $colon$colon!766 (List!31663 (_ BitVec 64)) List!31663)

(assert (=> b!1355942 (= lt!598796 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!766 acc!759 (select (arr!44635 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355942 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!900195 () Bool)

(assert (=> start!114310 (=> (not res!900195) (not e!770334))))

(assert (=> start!114310 (= res!900195 (and (bvslt (size!45186 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45186 a!3742))))))

(assert (=> start!114310 e!770334))

(assert (=> start!114310 true))

(declare-fun array_inv!33916 (array!92383) Bool)

(assert (=> start!114310 (array_inv!33916 a!3742)))

(declare-fun b!1355943 () Bool)

(assert (=> b!1355943 (= e!770338 e!770336)))

(declare-fun res!900194 () Bool)

(assert (=> b!1355943 (=> (not res!900194) (not e!770336))))

(assert (=> b!1355943 (= res!900194 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1355943 (= lt!598795 ($colon$colon!766 acc!759 (select (arr!44635 a!3742) from!3120)))))

(declare-fun b!1355944 () Bool)

(declare-fun res!900197 () Bool)

(assert (=> b!1355944 (=> (not res!900197) (not e!770334))))

(assert (=> b!1355944 (= res!900197 (not (contains!9375 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114310 res!900195) b!1355931))

(assert (= (and b!1355931 res!900189) b!1355933))

(assert (= (and b!1355933 res!900193) b!1355944))

(assert (= (and b!1355944 res!900197) b!1355929))

(assert (= (and b!1355929 res!900190) b!1355940))

(assert (= (and b!1355940 res!900200) b!1355939))

(assert (= (and b!1355939 res!900191) b!1355941))

(assert (= (and b!1355941 res!900201) b!1355930))

(assert (= (and b!1355930 res!900187) b!1355928))

(assert (= (and b!1355928 c!127318) b!1355942))

(assert (= (and b!1355928 (not c!127318)) b!1355934))

(assert (= (and b!1355928 res!900188) b!1355943))

(assert (= (and b!1355943 res!900194) b!1355938))

(assert (= (and b!1355938 res!900199) b!1355937))

(assert (= (and b!1355937 res!900198) b!1355936))

(assert (= (and b!1355936 res!900196) b!1355932))

(assert (= (and b!1355932 res!900192) b!1355935))

(declare-fun m!1242559 () Bool)

(assert (=> b!1355931 m!1242559))

(declare-fun m!1242561 () Bool)

(assert (=> b!1355938 m!1242561))

(declare-fun m!1242563 () Bool)

(assert (=> b!1355929 m!1242563))

(declare-fun m!1242565 () Bool)

(assert (=> b!1355936 m!1242565))

(declare-fun m!1242567 () Bool)

(assert (=> b!1355932 m!1242567))

(declare-fun m!1242569 () Bool)

(assert (=> b!1355937 m!1242569))

(declare-fun m!1242571 () Bool)

(assert (=> b!1355940 m!1242571))

(declare-fun m!1242573 () Bool)

(assert (=> b!1355933 m!1242573))

(declare-fun m!1242575 () Bool)

(assert (=> b!1355935 m!1242575))

(declare-fun m!1242577 () Bool)

(assert (=> b!1355935 m!1242577))

(declare-fun m!1242579 () Bool)

(assert (=> b!1355935 m!1242579))

(declare-fun m!1242581 () Bool)

(assert (=> b!1355941 m!1242581))

(declare-fun m!1242583 () Bool)

(assert (=> b!1355928 m!1242583))

(assert (=> b!1355928 m!1242583))

(declare-fun m!1242585 () Bool)

(assert (=> b!1355928 m!1242585))

(declare-fun m!1242587 () Bool)

(assert (=> b!1355942 m!1242587))

(assert (=> b!1355942 m!1242583))

(declare-fun m!1242589 () Bool)

(assert (=> b!1355942 m!1242589))

(declare-fun m!1242591 () Bool)

(assert (=> b!1355942 m!1242591))

(declare-fun m!1242593 () Bool)

(assert (=> b!1355942 m!1242593))

(assert (=> b!1355942 m!1242583))

(assert (=> b!1355942 m!1242589))

(declare-fun m!1242595 () Bool)

(assert (=> b!1355942 m!1242595))

(declare-fun m!1242597 () Bool)

(assert (=> start!114310 m!1242597))

(declare-fun m!1242599 () Bool)

(assert (=> b!1355944 m!1242599))

(assert (=> b!1355943 m!1242583))

(assert (=> b!1355943 m!1242583))

(assert (=> b!1355943 m!1242589))

(check-sat (not b!1355933) (not b!1355941) (not b!1355937) (not b!1355938) (not start!114310) (not b!1355942) (not b!1355931) (not b!1355929) (not b!1355936) (not b!1355932) (not b!1355943) (not b!1355935) (not b!1355944) (not b!1355928) (not b!1355940))
(check-sat)
