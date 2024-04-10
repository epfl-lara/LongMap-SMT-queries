; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115706 () Bool)

(assert start!115706)

(declare-fun b!1368180 () Bool)

(declare-fun res!911693 () Bool)

(declare-fun e!775262 () Bool)

(assert (=> b!1368180 (=> (not res!911693) (not e!775262))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1368180 (= res!911693 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368181 () Bool)

(declare-fun res!911695 () Bool)

(declare-fun e!775263 () Bool)

(assert (=> b!1368181 (=> (not res!911695) (not e!775263))))

(declare-datatypes ((List!31941 0))(
  ( (Nil!31938) (Cons!31937 (h!33146 (_ BitVec 64)) (t!46635 List!31941)) )
))
(declare-fun acc!866 () List!31941)

(declare-fun contains!9623 (List!31941 (_ BitVec 64)) Bool)

(assert (=> b!1368181 (= res!911695 (not (contains!9623 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368182 () Bool)

(declare-fun res!911688 () Bool)

(assert (=> b!1368182 (=> (not res!911688) (not e!775262))))

(declare-datatypes ((array!92898 0))(
  ( (array!92899 (arr!44873 (Array (_ BitVec 32) (_ BitVec 64))) (size!45423 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92898)

(assert (=> b!1368182 (= res!911688 (bvslt from!3239 (size!45423 a!3861)))))

(declare-fun b!1368183 () Bool)

(assert (=> b!1368183 (= e!775262 false)))

(declare-fun lt!602019 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92898 (_ BitVec 32) List!31941) Bool)

(assert (=> b!1368183 (= lt!602019 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368184 () Bool)

(declare-fun res!911690 () Bool)

(assert (=> b!1368184 (=> (not res!911690) (not e!775263))))

(declare-fun newAcc!98 () List!31941)

(declare-fun subseq!1025 (List!31941 List!31941) Bool)

(assert (=> b!1368184 (= res!911690 (subseq!1025 newAcc!98 acc!866))))

(declare-fun b!1368185 () Bool)

(assert (=> b!1368185 (= e!775263 e!775262)))

(declare-fun res!911697 () Bool)

(assert (=> b!1368185 (=> (not res!911697) (not e!775262))))

(assert (=> b!1368185 (= res!911697 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45183 0))(
  ( (Unit!45184) )
))
(declare-fun lt!602020 () Unit!45183)

(declare-fun noDuplicateSubseq!212 (List!31941 List!31941) Unit!45183)

(assert (=> b!1368185 (= lt!602020 (noDuplicateSubseq!212 newAcc!98 acc!866))))

(declare-fun b!1368187 () Bool)

(declare-fun res!911698 () Bool)

(assert (=> b!1368187 (=> (not res!911698) (not e!775263))))

(assert (=> b!1368187 (= res!911698 (not (contains!9623 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368188 () Bool)

(declare-fun res!911692 () Bool)

(assert (=> b!1368188 (=> (not res!911692) (not e!775263))))

(declare-fun noDuplicate!2480 (List!31941) Bool)

(assert (=> b!1368188 (= res!911692 (noDuplicate!2480 acc!866))))

(declare-fun b!1368189 () Bool)

(declare-fun res!911691 () Bool)

(assert (=> b!1368189 (=> (not res!911691) (not e!775262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368189 (= res!911691 (not (validKeyInArray!0 (select (arr!44873 a!3861) from!3239))))))

(declare-fun b!1368190 () Bool)

(declare-fun res!911696 () Bool)

(assert (=> b!1368190 (=> (not res!911696) (not e!775263))))

(assert (=> b!1368190 (= res!911696 (not (contains!9623 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368186 () Bool)

(declare-fun res!911689 () Bool)

(assert (=> b!1368186 (=> (not res!911689) (not e!775263))))

(assert (=> b!1368186 (= res!911689 (not (contains!9623 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911694 () Bool)

(assert (=> start!115706 (=> (not res!911694) (not e!775263))))

(assert (=> start!115706 (= res!911694 (and (bvslt (size!45423 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45423 a!3861))))))

(assert (=> start!115706 e!775263))

(declare-fun array_inv!33901 (array!92898) Bool)

(assert (=> start!115706 (array_inv!33901 a!3861)))

(assert (=> start!115706 true))

(assert (= (and start!115706 res!911694) b!1368188))

(assert (= (and b!1368188 res!911692) b!1368181))

(assert (= (and b!1368181 res!911695) b!1368186))

(assert (= (and b!1368186 res!911689) b!1368190))

(assert (= (and b!1368190 res!911696) b!1368187))

(assert (= (and b!1368187 res!911698) b!1368184))

(assert (= (and b!1368184 res!911690) b!1368185))

(assert (= (and b!1368185 res!911697) b!1368182))

(assert (= (and b!1368182 res!911688) b!1368189))

(assert (= (and b!1368189 res!911691) b!1368180))

(assert (= (and b!1368180 res!911693) b!1368183))

(declare-fun m!1252219 () Bool)

(assert (=> start!115706 m!1252219))

(declare-fun m!1252221 () Bool)

(assert (=> b!1368184 m!1252221))

(declare-fun m!1252223 () Bool)

(assert (=> b!1368190 m!1252223))

(declare-fun m!1252225 () Bool)

(assert (=> b!1368189 m!1252225))

(assert (=> b!1368189 m!1252225))

(declare-fun m!1252227 () Bool)

(assert (=> b!1368189 m!1252227))

(declare-fun m!1252229 () Bool)

(assert (=> b!1368188 m!1252229))

(declare-fun m!1252231 () Bool)

(assert (=> b!1368187 m!1252231))

(declare-fun m!1252233 () Bool)

(assert (=> b!1368185 m!1252233))

(declare-fun m!1252235 () Bool)

(assert (=> b!1368185 m!1252235))

(declare-fun m!1252237 () Bool)

(assert (=> b!1368183 m!1252237))

(declare-fun m!1252239 () Bool)

(assert (=> b!1368181 m!1252239))

(declare-fun m!1252241 () Bool)

(assert (=> b!1368186 m!1252241))

(push 1)

