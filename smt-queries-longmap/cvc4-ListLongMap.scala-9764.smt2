; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115710 () Bool)

(assert start!115710)

(declare-fun b!1368246 () Bool)

(declare-fun res!911760 () Bool)

(declare-fun e!775281 () Bool)

(assert (=> b!1368246 (=> (not res!911760) (not e!775281))))

(declare-datatypes ((List!31943 0))(
  ( (Nil!31940) (Cons!31939 (h!33148 (_ BitVec 64)) (t!46637 List!31943)) )
))
(declare-fun newAcc!98 () List!31943)

(declare-fun contains!9625 (List!31943 (_ BitVec 64)) Bool)

(assert (=> b!1368246 (= res!911760 (not (contains!9625 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368247 () Bool)

(declare-fun res!911758 () Bool)

(assert (=> b!1368247 (=> (not res!911758) (not e!775281))))

(declare-fun acc!866 () List!31943)

(declare-fun noDuplicate!2482 (List!31943) Bool)

(assert (=> b!1368247 (= res!911758 (noDuplicate!2482 acc!866))))

(declare-fun b!1368248 () Bool)

(declare-fun e!775282 () Bool)

(assert (=> b!1368248 (= e!775281 e!775282)))

(declare-fun res!911755 () Bool)

(assert (=> b!1368248 (=> (not res!911755) (not e!775282))))

(declare-datatypes ((array!92902 0))(
  ( (array!92903 (arr!44875 (Array (_ BitVec 32) (_ BitVec 64))) (size!45425 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92902)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92902 (_ BitVec 32) List!31943) Bool)

(assert (=> b!1368248 (= res!911755 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45187 0))(
  ( (Unit!45188) )
))
(declare-fun lt!602031 () Unit!45187)

(declare-fun noDuplicateSubseq!214 (List!31943 List!31943) Unit!45187)

(assert (=> b!1368248 (= lt!602031 (noDuplicateSubseq!214 newAcc!98 acc!866))))

(declare-fun b!1368249 () Bool)

(declare-fun res!911764 () Bool)

(assert (=> b!1368249 (=> (not res!911764) (not e!775281))))

(declare-fun subseq!1027 (List!31943 List!31943) Bool)

(assert (=> b!1368249 (= res!911764 (subseq!1027 newAcc!98 acc!866))))

(declare-fun b!1368250 () Bool)

(declare-fun res!911763 () Bool)

(assert (=> b!1368250 (=> (not res!911763) (not e!775281))))

(assert (=> b!1368250 (= res!911763 (not (contains!9625 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368251 () Bool)

(declare-fun res!911756 () Bool)

(assert (=> b!1368251 (=> (not res!911756) (not e!775282))))

(assert (=> b!1368251 (= res!911756 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368252 () Bool)

(declare-fun res!911757 () Bool)

(assert (=> b!1368252 (=> (not res!911757) (not e!775282))))

(assert (=> b!1368252 (= res!911757 (bvslt from!3239 (size!45425 a!3861)))))

(declare-fun b!1368253 () Bool)

(declare-fun res!911762 () Bool)

(assert (=> b!1368253 (=> (not res!911762) (not e!775282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368253 (= res!911762 (not (validKeyInArray!0 (select (arr!44875 a!3861) from!3239))))))

(declare-fun b!1368254 () Bool)

(assert (=> b!1368254 (= e!775282 false)))

(declare-fun lt!602032 () Bool)

(assert (=> b!1368254 (= lt!602032 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368255 () Bool)

(declare-fun res!911761 () Bool)

(assert (=> b!1368255 (=> (not res!911761) (not e!775281))))

(assert (=> b!1368255 (= res!911761 (not (contains!9625 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368256 () Bool)

(declare-fun res!911759 () Bool)

(assert (=> b!1368256 (=> (not res!911759) (not e!775281))))

(assert (=> b!1368256 (= res!911759 (not (contains!9625 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911754 () Bool)

(assert (=> start!115710 (=> (not res!911754) (not e!775281))))

(assert (=> start!115710 (= res!911754 (and (bvslt (size!45425 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45425 a!3861))))))

(assert (=> start!115710 e!775281))

(declare-fun array_inv!33903 (array!92902) Bool)

(assert (=> start!115710 (array_inv!33903 a!3861)))

(assert (=> start!115710 true))

(assert (= (and start!115710 res!911754) b!1368247))

(assert (= (and b!1368247 res!911758) b!1368255))

(assert (= (and b!1368255 res!911761) b!1368250))

(assert (= (and b!1368250 res!911763) b!1368256))

(assert (= (and b!1368256 res!911759) b!1368246))

(assert (= (and b!1368246 res!911760) b!1368249))

(assert (= (and b!1368249 res!911764) b!1368248))

(assert (= (and b!1368248 res!911755) b!1368252))

(assert (= (and b!1368252 res!911757) b!1368253))

(assert (= (and b!1368253 res!911762) b!1368251))

(assert (= (and b!1368251 res!911756) b!1368254))

(declare-fun m!1252267 () Bool)

(assert (=> b!1368246 m!1252267))

(declare-fun m!1252269 () Bool)

(assert (=> b!1368247 m!1252269))

(declare-fun m!1252271 () Bool)

(assert (=> b!1368250 m!1252271))

(declare-fun m!1252273 () Bool)

(assert (=> start!115710 m!1252273))

(declare-fun m!1252275 () Bool)

(assert (=> b!1368253 m!1252275))

(assert (=> b!1368253 m!1252275))

(declare-fun m!1252277 () Bool)

(assert (=> b!1368253 m!1252277))

(declare-fun m!1252279 () Bool)

(assert (=> b!1368255 m!1252279))

(declare-fun m!1252281 () Bool)

(assert (=> b!1368256 m!1252281))

(declare-fun m!1252283 () Bool)

(assert (=> b!1368249 m!1252283))

(declare-fun m!1252285 () Bool)

(assert (=> b!1368254 m!1252285))

(declare-fun m!1252287 () Bool)

(assert (=> b!1368248 m!1252287))

(declare-fun m!1252289 () Bool)

(assert (=> b!1368248 m!1252289))

(push 1)

(assert (not start!115710))

(assert (not b!1368255))

(assert (not b!1368248))

