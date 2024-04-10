; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115452 () Bool)

(assert start!115452)

(declare-fun b!1365377 () Bool)

(declare-fun res!908951 () Bool)

(declare-fun e!774199 () Bool)

(assert (=> b!1365377 (=> (not res!908951) (not e!774199))))

(declare-datatypes ((List!31883 0))(
  ( (Nil!31880) (Cons!31879 (h!33088 (_ BitVec 64)) (t!46577 List!31883)) )
))
(declare-fun lt!601273 () List!31883)

(declare-fun noDuplicate!2422 (List!31883) Bool)

(assert (=> b!1365377 (= res!908951 (noDuplicate!2422 lt!601273))))

(declare-fun b!1365378 () Bool)

(declare-fun res!908965 () Bool)

(declare-fun e!774196 () Bool)

(assert (=> b!1365378 (=> (not res!908965) (not e!774196))))

(declare-fun acc!866 () List!31883)

(assert (=> b!1365378 (= res!908965 (noDuplicate!2422 acc!866))))

(declare-fun b!1365379 () Bool)

(declare-fun res!908967 () Bool)

(assert (=> b!1365379 (=> (not res!908967) (not e!774196))))

(declare-fun newAcc!98 () List!31883)

(declare-fun contains!9565 (List!31883 (_ BitVec 64)) Bool)

(assert (=> b!1365379 (= res!908967 (not (contains!9565 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365380 () Bool)

(declare-fun e!774197 () Bool)

(assert (=> b!1365380 (= e!774196 e!774197)))

(declare-fun res!908961 () Bool)

(assert (=> b!1365380 (=> (not res!908961) (not e!774197))))

(declare-datatypes ((array!92773 0))(
  ( (array!92774 (arr!44815 (Array (_ BitVec 32) (_ BitVec 64))) (size!45365 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92773)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92773 (_ BitVec 32) List!31883) Bool)

(assert (=> b!1365380 (= res!908961 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45067 0))(
  ( (Unit!45068) )
))
(declare-fun lt!601272 () Unit!45067)

(declare-fun noDuplicateSubseq!154 (List!31883 List!31883) Unit!45067)

(assert (=> b!1365380 (= lt!601272 (noDuplicateSubseq!154 newAcc!98 acc!866))))

(declare-fun b!1365381 () Bool)

(assert (=> b!1365381 (= e!774199 false)))

(declare-fun lt!601270 () Bool)

(assert (=> b!1365381 (= lt!601270 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601273))))

(declare-fun lt!601269 () Unit!45067)

(declare-fun lt!601271 () List!31883)

(assert (=> b!1365381 (= lt!601269 (noDuplicateSubseq!154 lt!601271 lt!601273))))

(declare-fun b!1365382 () Bool)

(declare-fun res!908953 () Bool)

(assert (=> b!1365382 (=> (not res!908953) (not e!774196))))

(assert (=> b!1365382 (= res!908953 (not (contains!9565 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365383 () Bool)

(declare-fun res!908956 () Bool)

(assert (=> b!1365383 (=> (not res!908956) (not e!774199))))

(assert (=> b!1365383 (= res!908956 (not (contains!9565 lt!601271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365384 () Bool)

(assert (=> b!1365384 (= e!774197 e!774199)))

(declare-fun res!908954 () Bool)

(assert (=> b!1365384 (=> (not res!908954) (not e!774199))))

(assert (=> b!1365384 (= res!908954 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365384 (= lt!601271 (Cons!31879 (select (arr!44815 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365384 (= lt!601273 (Cons!31879 (select (arr!44815 a!3861) from!3239) acc!866))))

(declare-fun b!1365385 () Bool)

(declare-fun res!908960 () Bool)

(assert (=> b!1365385 (=> (not res!908960) (not e!774199))))

(assert (=> b!1365385 (= res!908960 (not (contains!9565 lt!601273 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365386 () Bool)

(declare-fun res!908966 () Bool)

(assert (=> b!1365386 (=> (not res!908966) (not e!774197))))

(assert (=> b!1365386 (= res!908966 (bvslt from!3239 (size!45365 a!3861)))))

(declare-fun b!1365387 () Bool)

(declare-fun res!908968 () Bool)

(assert (=> b!1365387 (=> (not res!908968) (not e!774196))))

(assert (=> b!1365387 (= res!908968 (not (contains!9565 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365388 () Bool)

(declare-fun res!908958 () Bool)

(assert (=> b!1365388 (=> (not res!908958) (not e!774197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365388 (= res!908958 (validKeyInArray!0 (select (arr!44815 a!3861) from!3239)))))

(declare-fun b!1365389 () Bool)

(declare-fun res!908952 () Bool)

(assert (=> b!1365389 (=> (not res!908952) (not e!774197))))

(assert (=> b!1365389 (= res!908952 (not (contains!9565 acc!866 (select (arr!44815 a!3861) from!3239))))))

(declare-fun b!1365390 () Bool)

(declare-fun res!908964 () Bool)

(assert (=> b!1365390 (=> (not res!908964) (not e!774199))))

(assert (=> b!1365390 (= res!908964 (not (contains!9565 lt!601271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908959 () Bool)

(assert (=> start!115452 (=> (not res!908959) (not e!774196))))

(assert (=> start!115452 (= res!908959 (and (bvslt (size!45365 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45365 a!3861))))))

(assert (=> start!115452 e!774196))

(declare-fun array_inv!33843 (array!92773) Bool)

(assert (=> start!115452 (array_inv!33843 a!3861)))

(assert (=> start!115452 true))

(declare-fun b!1365391 () Bool)

(declare-fun res!908962 () Bool)

(assert (=> b!1365391 (=> (not res!908962) (not e!774196))))

(assert (=> b!1365391 (= res!908962 (not (contains!9565 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365392 () Bool)

(declare-fun res!908955 () Bool)

(assert (=> b!1365392 (=> (not res!908955) (not e!774199))))

(declare-fun subseq!967 (List!31883 List!31883) Bool)

(assert (=> b!1365392 (= res!908955 (subseq!967 lt!601271 lt!601273))))

(declare-fun b!1365393 () Bool)

(declare-fun res!908963 () Bool)

(assert (=> b!1365393 (=> (not res!908963) (not e!774196))))

(assert (=> b!1365393 (= res!908963 (subseq!967 newAcc!98 acc!866))))

(declare-fun b!1365394 () Bool)

(declare-fun res!908957 () Bool)

(assert (=> b!1365394 (=> (not res!908957) (not e!774199))))

(assert (=> b!1365394 (= res!908957 (not (contains!9565 lt!601273 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115452 res!908959) b!1365378))

(assert (= (and b!1365378 res!908965) b!1365382))

(assert (= (and b!1365382 res!908953) b!1365391))

(assert (= (and b!1365391 res!908962) b!1365387))

(assert (= (and b!1365387 res!908968) b!1365379))

(assert (= (and b!1365379 res!908967) b!1365393))

(assert (= (and b!1365393 res!908963) b!1365380))

(assert (= (and b!1365380 res!908961) b!1365386))

(assert (= (and b!1365386 res!908966) b!1365388))

(assert (= (and b!1365388 res!908958) b!1365389))

(assert (= (and b!1365389 res!908952) b!1365384))

(assert (= (and b!1365384 res!908954) b!1365377))

(assert (= (and b!1365377 res!908951) b!1365385))

(assert (= (and b!1365385 res!908960) b!1365394))

(assert (= (and b!1365394 res!908957) b!1365383))

(assert (= (and b!1365383 res!908956) b!1365390))

(assert (= (and b!1365390 res!908964) b!1365392))

(assert (= (and b!1365392 res!908955) b!1365381))

(declare-fun m!1249941 () Bool)

(assert (=> b!1365378 m!1249941))

(declare-fun m!1249943 () Bool)

(assert (=> b!1365393 m!1249943))

(declare-fun m!1249945 () Bool)

(assert (=> b!1365382 m!1249945))

(declare-fun m!1249947 () Bool)

(assert (=> b!1365391 m!1249947))

(declare-fun m!1249949 () Bool)

(assert (=> b!1365387 m!1249949))

(declare-fun m!1249951 () Bool)

(assert (=> b!1365379 m!1249951))

(declare-fun m!1249953 () Bool)

(assert (=> b!1365383 m!1249953))

(declare-fun m!1249955 () Bool)

(assert (=> b!1365388 m!1249955))

(assert (=> b!1365388 m!1249955))

(declare-fun m!1249957 () Bool)

(assert (=> b!1365388 m!1249957))

(declare-fun m!1249959 () Bool)

(assert (=> b!1365394 m!1249959))

(declare-fun m!1249961 () Bool)

(assert (=> b!1365381 m!1249961))

(declare-fun m!1249963 () Bool)

(assert (=> b!1365381 m!1249963))

(declare-fun m!1249965 () Bool)

(assert (=> b!1365392 m!1249965))

(declare-fun m!1249967 () Bool)

(assert (=> b!1365377 m!1249967))

(declare-fun m!1249969 () Bool)

(assert (=> b!1365390 m!1249969))

(declare-fun m!1249971 () Bool)

(assert (=> b!1365380 m!1249971))

(declare-fun m!1249973 () Bool)

(assert (=> b!1365380 m!1249973))

(declare-fun m!1249975 () Bool)

(assert (=> b!1365385 m!1249975))

(assert (=> b!1365384 m!1249955))

(assert (=> b!1365389 m!1249955))

(assert (=> b!1365389 m!1249955))

(declare-fun m!1249977 () Bool)

(assert (=> b!1365389 m!1249977))

(declare-fun m!1249979 () Bool)

(assert (=> start!115452 m!1249979))

(push 1)

