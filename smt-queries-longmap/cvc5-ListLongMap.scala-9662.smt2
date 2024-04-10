; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114110 () Bool)

(assert start!114110)

(declare-fun b!1355186 () Bool)

(declare-fun res!900160 () Bool)

(declare-fun e!769660 () Bool)

(assert (=> b!1355186 (=> (not res!900160) (not e!769660))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355186 (= res!900160 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900162 () Bool)

(assert (=> start!114110 (=> (not res!900162) (not e!769660))))

(declare-datatypes ((array!92292 0))(
  ( (array!92293 (arr!44594 (Array (_ BitVec 32) (_ BitVec 64))) (size!45144 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92292)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114110 (= res!900162 (and (bvslt (size!45144 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45144 a!3742))))))

(assert (=> start!114110 e!769660))

(assert (=> start!114110 true))

(declare-fun array_inv!33622 (array!92292) Bool)

(assert (=> start!114110 (array_inv!33622 a!3742)))

(declare-fun b!1355187 () Bool)

(declare-datatypes ((Unit!44523 0))(
  ( (Unit!44524) )
))
(declare-fun e!769663 () Unit!44523)

(declare-fun lt!598524 () Unit!44523)

(assert (=> b!1355187 (= e!769663 lt!598524)))

(declare-fun lt!598526 () Unit!44523)

(declare-datatypes ((List!31635 0))(
  ( (Nil!31632) (Cons!31631 (h!32840 (_ BitVec 64)) (t!46293 List!31635)) )
))
(declare-fun acc!759 () List!31635)

(declare-fun lemmaListSubSeqRefl!0 (List!31635) Unit!44523)

(assert (=> b!1355187 (= lt!598526 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!764 (List!31635 List!31635) Bool)

(assert (=> b!1355187 (subseq!764 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92292 List!31635 List!31635 (_ BitVec 32)) Unit!44523)

(declare-fun $colon$colon!779 (List!31635 (_ BitVec 64)) List!31635)

(assert (=> b!1355187 (= lt!598524 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!779 acc!759 (select (arr!44594 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92292 (_ BitVec 32) List!31635) Bool)

(assert (=> b!1355187 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355188 () Bool)

(declare-fun res!900157 () Bool)

(assert (=> b!1355188 (=> (not res!900157) (not e!769660))))

(declare-fun noDuplicate!2201 (List!31635) Bool)

(assert (=> b!1355188 (= res!900157 (noDuplicate!2201 acc!759))))

(declare-fun b!1355189 () Bool)

(declare-fun e!769661 () Bool)

(assert (=> b!1355189 (= e!769661 false)))

(declare-fun lt!598525 () Bool)

(assert (=> b!1355189 (= lt!598525 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355190 () Bool)

(declare-fun res!900154 () Bool)

(assert (=> b!1355190 (=> (not res!900154) (not e!769660))))

(assert (=> b!1355190 (= res!900154 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355191 () Bool)

(declare-fun res!900159 () Bool)

(assert (=> b!1355191 (=> (not res!900159) (not e!769660))))

(declare-fun contains!9344 (List!31635 (_ BitVec 64)) Bool)

(assert (=> b!1355191 (= res!900159 (not (contains!9344 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355192 () Bool)

(declare-fun res!900155 () Bool)

(assert (=> b!1355192 (=> (not res!900155) (not e!769660))))

(assert (=> b!1355192 (= res!900155 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45144 a!3742)))))

(declare-fun b!1355193 () Bool)

(assert (=> b!1355193 (= e!769660 e!769661)))

(declare-fun res!900156 () Bool)

(assert (=> b!1355193 (=> (not res!900156) (not e!769661))))

(declare-fun lt!598527 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355193 (= res!900156 (and (not (= from!3120 i!1404)) (not lt!598527) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598528 () Unit!44523)

(assert (=> b!1355193 (= lt!598528 e!769663)))

(declare-fun c!126956 () Bool)

(assert (=> b!1355193 (= c!126956 lt!598527)))

(assert (=> b!1355193 (= lt!598527 (validKeyInArray!0 (select (arr!44594 a!3742) from!3120)))))

(declare-fun b!1355194 () Bool)

(declare-fun res!900158 () Bool)

(assert (=> b!1355194 (=> (not res!900158) (not e!769660))))

(assert (=> b!1355194 (= res!900158 (not (contains!9344 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355195 () Bool)

(declare-fun res!900161 () Bool)

(assert (=> b!1355195 (=> (not res!900161) (not e!769660))))

(assert (=> b!1355195 (= res!900161 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45144 a!3742))))))

(declare-fun b!1355196 () Bool)

(declare-fun res!900163 () Bool)

(assert (=> b!1355196 (=> (not res!900163) (not e!769660))))

(assert (=> b!1355196 (= res!900163 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31632))))

(declare-fun b!1355197 () Bool)

(declare-fun Unit!44525 () Unit!44523)

(assert (=> b!1355197 (= e!769663 Unit!44525)))

(assert (= (and start!114110 res!900162) b!1355188))

(assert (= (and b!1355188 res!900157) b!1355191))

(assert (= (and b!1355191 res!900159) b!1355194))

(assert (= (and b!1355194 res!900158) b!1355196))

(assert (= (and b!1355196 res!900163) b!1355190))

(assert (= (and b!1355190 res!900154) b!1355195))

(assert (= (and b!1355195 res!900161) b!1355186))

(assert (= (and b!1355186 res!900160) b!1355192))

(assert (= (and b!1355192 res!900155) b!1355193))

(assert (= (and b!1355193 c!126956) b!1355187))

(assert (= (and b!1355193 (not c!126956)) b!1355197))

(assert (= (and b!1355193 res!900156) b!1355189))

(declare-fun m!1241425 () Bool)

(assert (=> b!1355188 m!1241425))

(declare-fun m!1241427 () Bool)

(assert (=> b!1355189 m!1241427))

(declare-fun m!1241429 () Bool)

(assert (=> b!1355191 m!1241429))

(declare-fun m!1241431 () Bool)

(assert (=> b!1355187 m!1241431))

(declare-fun m!1241433 () Bool)

(assert (=> b!1355187 m!1241433))

(declare-fun m!1241435 () Bool)

(assert (=> b!1355187 m!1241435))

(declare-fun m!1241437 () Bool)

(assert (=> b!1355187 m!1241437))

(assert (=> b!1355187 m!1241427))

(assert (=> b!1355187 m!1241433))

(assert (=> b!1355187 m!1241435))

(declare-fun m!1241439 () Bool)

(assert (=> b!1355187 m!1241439))

(declare-fun m!1241441 () Bool)

(assert (=> b!1355190 m!1241441))

(assert (=> b!1355193 m!1241433))

(assert (=> b!1355193 m!1241433))

(declare-fun m!1241443 () Bool)

(assert (=> b!1355193 m!1241443))

(declare-fun m!1241445 () Bool)

(assert (=> start!114110 m!1241445))

(declare-fun m!1241447 () Bool)

(assert (=> b!1355194 m!1241447))

(declare-fun m!1241449 () Bool)

(assert (=> b!1355186 m!1241449))

(declare-fun m!1241451 () Bool)

(assert (=> b!1355196 m!1241451))

(push 1)

