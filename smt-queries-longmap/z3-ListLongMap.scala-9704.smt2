; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114898 () Bool)

(assert start!114898)

(declare-fun b!1361664 () Bool)

(declare-datatypes ((Unit!44759 0))(
  ( (Unit!44760) )
))
(declare-fun e!772635 () Unit!44759)

(declare-fun lt!600339 () Unit!44759)

(assert (=> b!1361664 (= e!772635 lt!600339)))

(declare-fun lt!600341 () Unit!44759)

(declare-datatypes ((List!31801 0))(
  ( (Nil!31798) (Cons!31797 (h!33015 (_ BitVec 64)) (t!46469 List!31801)) )
))
(declare-fun acc!759 () List!31801)

(declare-fun lemmaListSubSeqRefl!0 (List!31801) Unit!44759)

(assert (=> b!1361664 (= lt!600341 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!872 (List!31801 List!31801) Bool)

(assert (=> b!1361664 (subseq!872 acc!759 acc!759)))

(declare-datatypes ((array!92677 0))(
  ( (array!92678 (arr!44773 (Array (_ BitVec 32) (_ BitVec 64))) (size!45324 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92677)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92677 List!31801 List!31801 (_ BitVec 32)) Unit!44759)

(declare-fun $colon$colon!874 (List!31801 (_ BitVec 64)) List!31801)

(assert (=> b!1361664 (= lt!600339 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!874 acc!759 (select (arr!44773 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92677 (_ BitVec 32) List!31801) Bool)

(assert (=> b!1361664 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361665 () Bool)

(declare-fun res!905191 () Bool)

(declare-fun e!772634 () Bool)

(assert (=> b!1361665 (=> (not res!905191) (not e!772634))))

(assert (=> b!1361665 (= res!905191 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31798))))

(declare-fun b!1361666 () Bool)

(declare-fun res!905197 () Bool)

(assert (=> b!1361666 (=> (not res!905197) (not e!772634))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361666 (= res!905197 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45324 a!3742))))))

(declare-fun b!1361667 () Bool)

(declare-fun res!905194 () Bool)

(assert (=> b!1361667 (=> (not res!905194) (not e!772634))))

(declare-fun noDuplicate!2344 (List!31801) Bool)

(assert (=> b!1361667 (= res!905194 (noDuplicate!2344 acc!759))))

(declare-fun b!1361668 () Bool)

(declare-fun res!905198 () Bool)

(assert (=> b!1361668 (=> (not res!905198) (not e!772634))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361668 (= res!905198 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361670 () Bool)

(declare-fun Unit!44761 () Unit!44759)

(assert (=> b!1361670 (= e!772635 Unit!44761)))

(declare-fun b!1361671 () Bool)

(declare-fun res!905195 () Bool)

(assert (=> b!1361671 (=> (not res!905195) (not e!772634))))

(assert (=> b!1361671 (= res!905195 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361672 () Bool)

(declare-fun res!905193 () Bool)

(assert (=> b!1361672 (=> (not res!905193) (not e!772634))))

(declare-fun contains!9513 (List!31801 (_ BitVec 64)) Bool)

(assert (=> b!1361672 (= res!905193 (not (contains!9513 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361673 () Bool)

(declare-fun res!905199 () Bool)

(assert (=> b!1361673 (=> (not res!905199) (not e!772634))))

(assert (=> b!1361673 (= res!905199 (not (contains!9513 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361674 () Bool)

(declare-fun lt!600342 () Bool)

(assert (=> b!1361674 (= e!772634 (and (not (= from!3120 i!1404)) lt!600342 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600340 () Unit!44759)

(assert (=> b!1361674 (= lt!600340 e!772635)))

(declare-fun c!127684 () Bool)

(assert (=> b!1361674 (= c!127684 lt!600342)))

(assert (=> b!1361674 (= lt!600342 (validKeyInArray!0 (select (arr!44773 a!3742) from!3120)))))

(declare-fun res!905192 () Bool)

(assert (=> start!114898 (=> (not res!905192) (not e!772634))))

(assert (=> start!114898 (= res!905192 (and (bvslt (size!45324 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45324 a!3742))))))

(assert (=> start!114898 e!772634))

(assert (=> start!114898 true))

(declare-fun array_inv!34054 (array!92677) Bool)

(assert (=> start!114898 (array_inv!34054 a!3742)))

(declare-fun b!1361669 () Bool)

(declare-fun res!905196 () Bool)

(assert (=> b!1361669 (=> (not res!905196) (not e!772634))))

(assert (=> b!1361669 (= res!905196 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45324 a!3742)))))

(assert (= (and start!114898 res!905192) b!1361667))

(assert (= (and b!1361667 res!905194) b!1361673))

(assert (= (and b!1361673 res!905199) b!1361672))

(assert (= (and b!1361672 res!905193) b!1361665))

(assert (= (and b!1361665 res!905191) b!1361671))

(assert (= (and b!1361671 res!905195) b!1361666))

(assert (= (and b!1361666 res!905197) b!1361668))

(assert (= (and b!1361668 res!905198) b!1361669))

(assert (= (and b!1361669 res!905196) b!1361674))

(assert (= (and b!1361674 c!127684) b!1361664))

(assert (= (and b!1361674 (not c!127684)) b!1361670))

(declare-fun m!1247245 () Bool)

(assert (=> b!1361671 m!1247245))

(declare-fun m!1247247 () Bool)

(assert (=> b!1361673 m!1247247))

(declare-fun m!1247249 () Bool)

(assert (=> b!1361665 m!1247249))

(declare-fun m!1247251 () Bool)

(assert (=> b!1361668 m!1247251))

(declare-fun m!1247253 () Bool)

(assert (=> start!114898 m!1247253))

(declare-fun m!1247255 () Bool)

(assert (=> b!1361674 m!1247255))

(assert (=> b!1361674 m!1247255))

(declare-fun m!1247257 () Bool)

(assert (=> b!1361674 m!1247257))

(declare-fun m!1247259 () Bool)

(assert (=> b!1361672 m!1247259))

(declare-fun m!1247261 () Bool)

(assert (=> b!1361667 m!1247261))

(declare-fun m!1247263 () Bool)

(assert (=> b!1361664 m!1247263))

(assert (=> b!1361664 m!1247255))

(declare-fun m!1247265 () Bool)

(assert (=> b!1361664 m!1247265))

(declare-fun m!1247267 () Bool)

(assert (=> b!1361664 m!1247267))

(declare-fun m!1247269 () Bool)

(assert (=> b!1361664 m!1247269))

(assert (=> b!1361664 m!1247255))

(assert (=> b!1361664 m!1247265))

(declare-fun m!1247271 () Bool)

(assert (=> b!1361664 m!1247271))

(check-sat (not b!1361668) (not b!1361673) (not b!1361665) (not b!1361672) (not b!1361664) (not start!114898) (not b!1361667) (not b!1361674) (not b!1361671))
(check-sat)
