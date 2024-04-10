; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114808 () Bool)

(assert start!114808)

(declare-fun b!1361189 () Bool)

(declare-fun res!905367 () Bool)

(declare-fun e!772256 () Bool)

(assert (=> b!1361189 (=> (not res!905367) (not e!772256))))

(declare-datatypes ((array!92594 0))(
  ( (array!92595 (arr!44733 (Array (_ BitVec 32) (_ BitVec 64))) (size!45283 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92594)

(declare-datatypes ((List!31774 0))(
  ( (Nil!31771) (Cons!31770 (h!32979 (_ BitVec 64)) (t!46456 List!31774)) )
))
(declare-fun arrayNoDuplicates!0 (array!92594 (_ BitVec 32) List!31774) Bool)

(assert (=> b!1361189 (= res!905367 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31771))))

(declare-fun b!1361190 () Bool)

(declare-fun e!772255 () Bool)

(declare-fun e!772257 () Bool)

(assert (=> b!1361190 (= e!772255 e!772257)))

(declare-fun res!905360 () Bool)

(assert (=> b!1361190 (=> (not res!905360) (not e!772257))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361190 (= res!905360 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31774)

(declare-fun lt!600096 () List!31774)

(declare-fun $colon$colon!888 (List!31774 (_ BitVec 64)) List!31774)

(assert (=> b!1361190 (= lt!600096 ($colon$colon!888 acc!759 (select (arr!44733 a!3742) from!3120)))))

(declare-fun b!1361191 () Bool)

(assert (=> b!1361191 (= e!772256 e!772255)))

(declare-fun res!905363 () Bool)

(assert (=> b!1361191 (=> (not res!905363) (not e!772255))))

(declare-fun lt!600097 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361191 (= res!905363 (and (not (= from!3120 i!1404)) lt!600097))))

(declare-datatypes ((Unit!44859 0))(
  ( (Unit!44860) )
))
(declare-fun lt!600100 () Unit!44859)

(declare-fun e!772258 () Unit!44859)

(assert (=> b!1361191 (= lt!600100 e!772258)))

(declare-fun c!127355 () Bool)

(assert (=> b!1361191 (= c!127355 lt!600097)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361191 (= lt!600097 (validKeyInArray!0 (select (arr!44733 a!3742) from!3120)))))

(declare-fun b!1361192 () Bool)

(declare-fun res!905369 () Bool)

(assert (=> b!1361192 (=> (not res!905369) (not e!772257))))

(declare-fun noDuplicate!2340 (List!31774) Bool)

(assert (=> b!1361192 (= res!905369 (noDuplicate!2340 lt!600096))))

(declare-fun b!1361193 () Bool)

(declare-fun res!905365 () Bool)

(assert (=> b!1361193 (=> (not res!905365) (not e!772256))))

(declare-fun contains!9483 (List!31774 (_ BitVec 64)) Bool)

(assert (=> b!1361193 (= res!905365 (not (contains!9483 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361194 () Bool)

(declare-fun res!905362 () Bool)

(assert (=> b!1361194 (=> (not res!905362) (not e!772256))))

(assert (=> b!1361194 (= res!905362 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45283 a!3742)))))

(declare-fun b!1361195 () Bool)

(declare-fun res!905371 () Bool)

(assert (=> b!1361195 (=> (not res!905371) (not e!772256))))

(assert (=> b!1361195 (= res!905371 (noDuplicate!2340 acc!759))))

(declare-fun b!1361196 () Bool)

(declare-fun res!905366 () Bool)

(assert (=> b!1361196 (=> (not res!905366) (not e!772256))))

(assert (=> b!1361196 (= res!905366 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361197 () Bool)

(declare-fun res!905359 () Bool)

(assert (=> b!1361197 (=> (not res!905359) (not e!772256))))

(assert (=> b!1361197 (= res!905359 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45283 a!3742))))))

(declare-fun b!1361198 () Bool)

(declare-fun lt!600095 () Unit!44859)

(assert (=> b!1361198 (= e!772258 lt!600095)))

(declare-fun lt!600098 () Unit!44859)

(declare-fun lemmaListSubSeqRefl!0 (List!31774) Unit!44859)

(assert (=> b!1361198 (= lt!600098 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!885 (List!31774 List!31774) Bool)

(assert (=> b!1361198 (subseq!885 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92594 List!31774 List!31774 (_ BitVec 32)) Unit!44859)

(assert (=> b!1361198 (= lt!600095 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!888 acc!759 (select (arr!44733 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361198 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361199 () Bool)

(declare-fun res!905364 () Bool)

(assert (=> b!1361199 (=> (not res!905364) (not e!772256))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361199 (= res!905364 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361200 () Bool)

(declare-fun Unit!44861 () Unit!44859)

(assert (=> b!1361200 (= e!772258 Unit!44861)))

(declare-fun res!905370 () Bool)

(assert (=> start!114808 (=> (not res!905370) (not e!772256))))

(assert (=> start!114808 (= res!905370 (and (bvslt (size!45283 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45283 a!3742))))))

(assert (=> start!114808 e!772256))

(assert (=> start!114808 true))

(declare-fun array_inv!33761 (array!92594) Bool)

(assert (=> start!114808 (array_inv!33761 a!3742)))

(declare-fun b!1361201 () Bool)

(assert (=> b!1361201 (= e!772257 false)))

(declare-fun lt!600099 () Bool)

(assert (=> b!1361201 (= lt!600099 (contains!9483 lt!600096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361202 () Bool)

(declare-fun res!905361 () Bool)

(assert (=> b!1361202 (=> (not res!905361) (not e!772256))))

(assert (=> b!1361202 (= res!905361 (not (contains!9483 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361203 () Bool)

(declare-fun res!905368 () Bool)

(assert (=> b!1361203 (=> (not res!905368) (not e!772257))))

(assert (=> b!1361203 (= res!905368 (not (contains!9483 lt!600096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114808 res!905370) b!1361195))

(assert (= (and b!1361195 res!905371) b!1361202))

(assert (= (and b!1361202 res!905361) b!1361193))

(assert (= (and b!1361193 res!905365) b!1361189))

(assert (= (and b!1361189 res!905367) b!1361196))

(assert (= (and b!1361196 res!905366) b!1361197))

(assert (= (and b!1361197 res!905359) b!1361199))

(assert (= (and b!1361199 res!905364) b!1361194))

(assert (= (and b!1361194 res!905362) b!1361191))

(assert (= (and b!1361191 c!127355) b!1361198))

(assert (= (and b!1361191 (not c!127355)) b!1361200))

(assert (= (and b!1361191 res!905363) b!1361190))

(assert (= (and b!1361190 res!905360) b!1361192))

(assert (= (and b!1361192 res!905369) b!1361203))

(assert (= (and b!1361203 res!905368) b!1361201))

(declare-fun m!1246349 () Bool)

(assert (=> b!1361189 m!1246349))

(declare-fun m!1246351 () Bool)

(assert (=> b!1361202 m!1246351))

(declare-fun m!1246353 () Bool)

(assert (=> b!1361199 m!1246353))

(declare-fun m!1246355 () Bool)

(assert (=> b!1361198 m!1246355))

(declare-fun m!1246357 () Bool)

(assert (=> b!1361198 m!1246357))

(declare-fun m!1246359 () Bool)

(assert (=> b!1361198 m!1246359))

(declare-fun m!1246361 () Bool)

(assert (=> b!1361198 m!1246361))

(declare-fun m!1246363 () Bool)

(assert (=> b!1361198 m!1246363))

(assert (=> b!1361198 m!1246357))

(assert (=> b!1361198 m!1246359))

(declare-fun m!1246365 () Bool)

(assert (=> b!1361198 m!1246365))

(assert (=> b!1361190 m!1246357))

(assert (=> b!1361190 m!1246357))

(assert (=> b!1361190 m!1246359))

(declare-fun m!1246367 () Bool)

(assert (=> b!1361193 m!1246367))

(declare-fun m!1246369 () Bool)

(assert (=> b!1361192 m!1246369))

(declare-fun m!1246371 () Bool)

(assert (=> start!114808 m!1246371))

(declare-fun m!1246373 () Bool)

(assert (=> b!1361196 m!1246373))

(assert (=> b!1361191 m!1246357))

(assert (=> b!1361191 m!1246357))

(declare-fun m!1246375 () Bool)

(assert (=> b!1361191 m!1246375))

(declare-fun m!1246377 () Bool)

(assert (=> b!1361201 m!1246377))

(declare-fun m!1246379 () Bool)

(assert (=> b!1361203 m!1246379))

(declare-fun m!1246381 () Bool)

(assert (=> b!1361195 m!1246381))

(check-sat (not b!1361195) (not b!1361190) (not b!1361198) (not b!1361202) (not b!1361201) (not b!1361203) (not b!1361196) (not b!1361192) (not b!1361199) (not start!114808) (not b!1361189) (not b!1361191) (not b!1361193))
(check-sat)
