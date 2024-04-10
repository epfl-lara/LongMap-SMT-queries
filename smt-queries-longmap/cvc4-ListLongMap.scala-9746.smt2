; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115464 () Bool)

(assert start!115464)

(declare-fun b!1365701 () Bool)

(declare-fun res!909283 () Bool)

(declare-fun e!774268 () Bool)

(assert (=> b!1365701 (=> (not res!909283) (not e!774268))))

(declare-datatypes ((List!31889 0))(
  ( (Nil!31886) (Cons!31885 (h!33094 (_ BitVec 64)) (t!46583 List!31889)) )
))
(declare-fun lt!601361 () List!31889)

(declare-fun contains!9571 (List!31889 (_ BitVec 64)) Bool)

(assert (=> b!1365701 (= res!909283 (not (contains!9571 lt!601361 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365702 () Bool)

(declare-fun res!909291 () Bool)

(assert (=> b!1365702 (=> (not res!909291) (not e!774268))))

(declare-fun lt!601359 () List!31889)

(declare-fun noDuplicate!2428 (List!31889) Bool)

(assert (=> b!1365702 (= res!909291 (noDuplicate!2428 lt!601359))))

(declare-fun b!1365703 () Bool)

(declare-fun res!909279 () Bool)

(declare-fun e!774269 () Bool)

(assert (=> b!1365703 (=> (not res!909279) (not e!774269))))

(declare-fun acc!866 () List!31889)

(assert (=> b!1365703 (= res!909279 (noDuplicate!2428 acc!866))))

(declare-fun b!1365704 () Bool)

(declare-fun res!909277 () Bool)

(assert (=> b!1365704 (=> (not res!909277) (not e!774268))))

(assert (=> b!1365704 (= res!909277 (not (contains!9571 lt!601359 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909280 () Bool)

(assert (=> start!115464 (=> (not res!909280) (not e!774269))))

(declare-datatypes ((array!92785 0))(
  ( (array!92786 (arr!44821 (Array (_ BitVec 32) (_ BitVec 64))) (size!45371 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92785)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115464 (= res!909280 (and (bvslt (size!45371 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45371 a!3861))))))

(assert (=> start!115464 e!774269))

(declare-fun array_inv!33849 (array!92785) Bool)

(assert (=> start!115464 (array_inv!33849 a!3861)))

(assert (=> start!115464 true))

(declare-fun b!1365705 () Bool)

(declare-fun res!909284 () Bool)

(assert (=> b!1365705 (=> (not res!909284) (not e!774269))))

(declare-fun newAcc!98 () List!31889)

(declare-fun subseq!973 (List!31889 List!31889) Bool)

(assert (=> b!1365705 (= res!909284 (subseq!973 newAcc!98 acc!866))))

(declare-fun b!1365706 () Bool)

(declare-fun res!909292 () Bool)

(assert (=> b!1365706 (=> (not res!909292) (not e!774269))))

(assert (=> b!1365706 (= res!909292 (not (contains!9571 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365707 () Bool)

(declare-fun res!909290 () Bool)

(declare-fun e!774271 () Bool)

(assert (=> b!1365707 (=> (not res!909290) (not e!774271))))

(assert (=> b!1365707 (= res!909290 (not (contains!9571 acc!866 (select (arr!44821 a!3861) from!3239))))))

(declare-fun b!1365708 () Bool)

(declare-fun res!909288 () Bool)

(assert (=> b!1365708 (=> (not res!909288) (not e!774269))))

(assert (=> b!1365708 (= res!909288 (not (contains!9571 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365709 () Bool)

(declare-fun res!909285 () Bool)

(assert (=> b!1365709 (=> (not res!909285) (not e!774268))))

(assert (=> b!1365709 (= res!909285 (subseq!973 lt!601361 lt!601359))))

(declare-fun b!1365710 () Bool)

(assert (=> b!1365710 (= e!774268 false)))

(declare-fun lt!601363 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92785 (_ BitVec 32) List!31889) Bool)

(assert (=> b!1365710 (= lt!601363 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601359))))

(declare-datatypes ((Unit!45079 0))(
  ( (Unit!45080) )
))
(declare-fun lt!601360 () Unit!45079)

(declare-fun noDuplicateSubseq!160 (List!31889 List!31889) Unit!45079)

(assert (=> b!1365710 (= lt!601360 (noDuplicateSubseq!160 lt!601361 lt!601359))))

(declare-fun b!1365711 () Bool)

(declare-fun res!909281 () Bool)

(assert (=> b!1365711 (=> (not res!909281) (not e!774269))))

(assert (=> b!1365711 (= res!909281 (not (contains!9571 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365712 () Bool)

(declare-fun res!909275 () Bool)

(assert (=> b!1365712 (=> (not res!909275) (not e!774271))))

(assert (=> b!1365712 (= res!909275 (bvslt from!3239 (size!45371 a!3861)))))

(declare-fun b!1365713 () Bool)

(declare-fun res!909282 () Bool)

(assert (=> b!1365713 (=> (not res!909282) (not e!774268))))

(assert (=> b!1365713 (= res!909282 (not (contains!9571 lt!601361 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365714 () Bool)

(assert (=> b!1365714 (= e!774271 e!774268)))

(declare-fun res!909287 () Bool)

(assert (=> b!1365714 (=> (not res!909287) (not e!774268))))

(assert (=> b!1365714 (= res!909287 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365714 (= lt!601361 (Cons!31885 (select (arr!44821 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365714 (= lt!601359 (Cons!31885 (select (arr!44821 a!3861) from!3239) acc!866))))

(declare-fun b!1365715 () Bool)

(assert (=> b!1365715 (= e!774269 e!774271)))

(declare-fun res!909276 () Bool)

(assert (=> b!1365715 (=> (not res!909276) (not e!774271))))

(assert (=> b!1365715 (= res!909276 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601362 () Unit!45079)

(assert (=> b!1365715 (= lt!601362 (noDuplicateSubseq!160 newAcc!98 acc!866))))

(declare-fun b!1365716 () Bool)

(declare-fun res!909278 () Bool)

(assert (=> b!1365716 (=> (not res!909278) (not e!774269))))

(assert (=> b!1365716 (= res!909278 (not (contains!9571 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365717 () Bool)

(declare-fun res!909286 () Bool)

(assert (=> b!1365717 (=> (not res!909286) (not e!774271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365717 (= res!909286 (validKeyInArray!0 (select (arr!44821 a!3861) from!3239)))))

(declare-fun b!1365718 () Bool)

(declare-fun res!909289 () Bool)

(assert (=> b!1365718 (=> (not res!909289) (not e!774268))))

(assert (=> b!1365718 (= res!909289 (not (contains!9571 lt!601359 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115464 res!909280) b!1365703))

(assert (= (and b!1365703 res!909279) b!1365706))

(assert (= (and b!1365706 res!909292) b!1365711))

(assert (= (and b!1365711 res!909281) b!1365716))

(assert (= (and b!1365716 res!909278) b!1365708))

(assert (= (and b!1365708 res!909288) b!1365705))

(assert (= (and b!1365705 res!909284) b!1365715))

(assert (= (and b!1365715 res!909276) b!1365712))

(assert (= (and b!1365712 res!909275) b!1365717))

(assert (= (and b!1365717 res!909286) b!1365707))

(assert (= (and b!1365707 res!909290) b!1365714))

(assert (= (and b!1365714 res!909287) b!1365702))

(assert (= (and b!1365702 res!909291) b!1365718))

(assert (= (and b!1365718 res!909289) b!1365704))

(assert (= (and b!1365704 res!909277) b!1365701))

(assert (= (and b!1365701 res!909283) b!1365713))

(assert (= (and b!1365713 res!909282) b!1365709))

(assert (= (and b!1365709 res!909285) b!1365710))

(declare-fun m!1250181 () Bool)

(assert (=> b!1365706 m!1250181))

(declare-fun m!1250183 () Bool)

(assert (=> b!1365702 m!1250183))

(declare-fun m!1250185 () Bool)

(assert (=> b!1365716 m!1250185))

(declare-fun m!1250187 () Bool)

(assert (=> b!1365703 m!1250187))

(declare-fun m!1250189 () Bool)

(assert (=> b!1365714 m!1250189))

(declare-fun m!1250191 () Bool)

(assert (=> b!1365701 m!1250191))

(declare-fun m!1250193 () Bool)

(assert (=> b!1365704 m!1250193))

(assert (=> b!1365717 m!1250189))

(assert (=> b!1365717 m!1250189))

(declare-fun m!1250195 () Bool)

(assert (=> b!1365717 m!1250195))

(declare-fun m!1250197 () Bool)

(assert (=> start!115464 m!1250197))

(assert (=> b!1365707 m!1250189))

(assert (=> b!1365707 m!1250189))

(declare-fun m!1250199 () Bool)

(assert (=> b!1365707 m!1250199))

(declare-fun m!1250201 () Bool)

(assert (=> b!1365715 m!1250201))

(declare-fun m!1250203 () Bool)

(assert (=> b!1365715 m!1250203))

(declare-fun m!1250205 () Bool)

(assert (=> b!1365711 m!1250205))

(declare-fun m!1250207 () Bool)

(assert (=> b!1365718 m!1250207))

(declare-fun m!1250209 () Bool)

(assert (=> b!1365709 m!1250209))

(declare-fun m!1250211 () Bool)

(assert (=> b!1365710 m!1250211))

(declare-fun m!1250213 () Bool)

(assert (=> b!1365710 m!1250213))

(declare-fun m!1250215 () Bool)

(assert (=> b!1365705 m!1250215))

(declare-fun m!1250217 () Bool)

(assert (=> b!1365708 m!1250217))

(declare-fun m!1250219 () Bool)

(assert (=> b!1365713 m!1250219))

(push 1)

