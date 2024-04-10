; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114058 () Bool)

(assert start!114058)

(declare-fun b!1353946 () Bool)

(declare-fun res!899074 () Bool)

(declare-fun e!769283 () Bool)

(assert (=> b!1353946 (=> (not res!899074) (not e!769283))))

(declare-datatypes ((List!31609 0))(
  ( (Nil!31606) (Cons!31605 (h!32814 (_ BitVec 64)) (t!46267 List!31609)) )
))
(declare-fun lt!598071 () List!31609)

(declare-fun contains!9318 (List!31609 (_ BitVec 64)) Bool)

(assert (=> b!1353946 (= res!899074 (not (contains!9318 lt!598071 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353947 () Bool)

(declare-fun res!899082 () Bool)

(declare-fun e!769281 () Bool)

(assert (=> b!1353947 (=> (not res!899082) (not e!769281))))

(declare-datatypes ((array!92240 0))(
  ( (array!92241 (arr!44568 (Array (_ BitVec 32) (_ BitVec 64))) (size!45118 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92240)

(declare-fun arrayNoDuplicates!0 (array!92240 (_ BitVec 32) List!31609) Bool)

(assert (=> b!1353947 (= res!899082 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31606))))

(declare-fun b!1353948 () Bool)

(declare-fun res!899083 () Bool)

(assert (=> b!1353948 (=> (not res!899083) (not e!769281))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1353948 (= res!899083 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45118 a!3742)))))

(declare-fun b!1353949 () Bool)

(declare-fun res!899081 () Bool)

(assert (=> b!1353949 (=> (not res!899081) (not e!769281))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353949 (= res!899081 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45118 a!3742))))))

(declare-fun b!1353950 () Bool)

(declare-fun res!899076 () Bool)

(assert (=> b!1353950 (=> (not res!899076) (not e!769281))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353950 (= res!899076 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353951 () Bool)

(declare-fun res!899078 () Bool)

(assert (=> b!1353951 (=> (not res!899078) (not e!769281))))

(declare-fun acc!759 () List!31609)

(declare-fun noDuplicate!2175 (List!31609) Bool)

(assert (=> b!1353951 (= res!899078 (noDuplicate!2175 acc!759))))

(declare-fun b!1353952 () Bool)

(declare-fun res!899073 () Bool)

(assert (=> b!1353952 (=> (not res!899073) (not e!769281))))

(assert (=> b!1353952 (= res!899073 (not (contains!9318 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353953 () Bool)

(declare-fun res!899072 () Bool)

(assert (=> b!1353953 (=> (not res!899072) (not e!769281))))

(assert (=> b!1353953 (= res!899072 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353955 () Bool)

(assert (=> b!1353955 (= e!769283 false)))

(declare-fun lt!598072 () Bool)

(assert (=> b!1353955 (= lt!598072 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598071))))

(declare-fun b!1353956 () Bool)

(declare-datatypes ((Unit!44445 0))(
  ( (Unit!44446) )
))
(declare-fun e!769284 () Unit!44445)

(declare-fun lt!598069 () Unit!44445)

(assert (=> b!1353956 (= e!769284 lt!598069)))

(declare-fun lt!598067 () Unit!44445)

(declare-fun lemmaListSubSeqRefl!0 (List!31609) Unit!44445)

(assert (=> b!1353956 (= lt!598067 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!738 (List!31609 List!31609) Bool)

(assert (=> b!1353956 (subseq!738 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92240 List!31609 List!31609 (_ BitVec 32)) Unit!44445)

(declare-fun $colon$colon!753 (List!31609 (_ BitVec 64)) List!31609)

(assert (=> b!1353956 (= lt!598069 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!753 acc!759 (select (arr!44568 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353956 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353957 () Bool)

(declare-fun Unit!44447 () Unit!44445)

(assert (=> b!1353957 (= e!769284 Unit!44447)))

(declare-fun b!1353958 () Bool)

(declare-fun e!769285 () Bool)

(assert (=> b!1353958 (= e!769281 e!769285)))

(declare-fun res!899070 () Bool)

(assert (=> b!1353958 (=> (not res!899070) (not e!769285))))

(declare-fun lt!598070 () Bool)

(assert (=> b!1353958 (= res!899070 (and (not (= from!3120 i!1404)) lt!598070))))

(declare-fun lt!598068 () Unit!44445)

(assert (=> b!1353958 (= lt!598068 e!769284)))

(declare-fun c!126878 () Bool)

(assert (=> b!1353958 (= c!126878 lt!598070)))

(assert (=> b!1353958 (= lt!598070 (validKeyInArray!0 (select (arr!44568 a!3742) from!3120)))))

(declare-fun b!1353959 () Bool)

(declare-fun res!899080 () Bool)

(assert (=> b!1353959 (=> (not res!899080) (not e!769281))))

(assert (=> b!1353959 (= res!899080 (not (contains!9318 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353960 () Bool)

(declare-fun res!899075 () Bool)

(assert (=> b!1353960 (=> (not res!899075) (not e!769283))))

(assert (=> b!1353960 (= res!899075 (not (contains!9318 lt!598071 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353961 () Bool)

(declare-fun res!899079 () Bool)

(assert (=> b!1353961 (=> (not res!899079) (not e!769283))))

(assert (=> b!1353961 (= res!899079 (noDuplicate!2175 lt!598071))))

(declare-fun b!1353954 () Bool)

(assert (=> b!1353954 (= e!769285 e!769283)))

(declare-fun res!899071 () Bool)

(assert (=> b!1353954 (=> (not res!899071) (not e!769283))))

(assert (=> b!1353954 (= res!899071 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353954 (= lt!598071 ($colon$colon!753 acc!759 (select (arr!44568 a!3742) from!3120)))))

(declare-fun res!899077 () Bool)

(assert (=> start!114058 (=> (not res!899077) (not e!769281))))

(assert (=> start!114058 (= res!899077 (and (bvslt (size!45118 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45118 a!3742))))))

(assert (=> start!114058 e!769281))

(assert (=> start!114058 true))

(declare-fun array_inv!33596 (array!92240) Bool)

(assert (=> start!114058 (array_inv!33596 a!3742)))

(assert (= (and start!114058 res!899077) b!1353951))

(assert (= (and b!1353951 res!899078) b!1353959))

(assert (= (and b!1353959 res!899080) b!1353952))

(assert (= (and b!1353952 res!899073) b!1353947))

(assert (= (and b!1353947 res!899082) b!1353953))

(assert (= (and b!1353953 res!899072) b!1353949))

(assert (= (and b!1353949 res!899081) b!1353950))

(assert (= (and b!1353950 res!899076) b!1353948))

(assert (= (and b!1353948 res!899083) b!1353958))

(assert (= (and b!1353958 c!126878) b!1353956))

(assert (= (and b!1353958 (not c!126878)) b!1353957))

(assert (= (and b!1353958 res!899070) b!1353954))

(assert (= (and b!1353954 res!899071) b!1353961))

(assert (= (and b!1353961 res!899079) b!1353946))

(assert (= (and b!1353946 res!899074) b!1353960))

(assert (= (and b!1353960 res!899075) b!1353955))

(declare-fun m!1240441 () Bool)

(assert (=> b!1353950 m!1240441))

(declare-fun m!1240443 () Bool)

(assert (=> b!1353954 m!1240443))

(assert (=> b!1353954 m!1240443))

(declare-fun m!1240445 () Bool)

(assert (=> b!1353954 m!1240445))

(declare-fun m!1240447 () Bool)

(assert (=> b!1353953 m!1240447))

(declare-fun m!1240449 () Bool)

(assert (=> b!1353952 m!1240449))

(declare-fun m!1240451 () Bool)

(assert (=> b!1353955 m!1240451))

(declare-fun m!1240453 () Bool)

(assert (=> b!1353959 m!1240453))

(declare-fun m!1240455 () Bool)

(assert (=> b!1353960 m!1240455))

(declare-fun m!1240457 () Bool)

(assert (=> start!114058 m!1240457))

(declare-fun m!1240459 () Bool)

(assert (=> b!1353951 m!1240459))

(declare-fun m!1240461 () Bool)

(assert (=> b!1353956 m!1240461))

(assert (=> b!1353956 m!1240443))

(assert (=> b!1353956 m!1240445))

(declare-fun m!1240463 () Bool)

(assert (=> b!1353956 m!1240463))

(declare-fun m!1240465 () Bool)

(assert (=> b!1353956 m!1240465))

(assert (=> b!1353956 m!1240443))

(assert (=> b!1353956 m!1240445))

(declare-fun m!1240467 () Bool)

(assert (=> b!1353956 m!1240467))

(declare-fun m!1240469 () Bool)

(assert (=> b!1353961 m!1240469))

(assert (=> b!1353958 m!1240443))

(assert (=> b!1353958 m!1240443))

(declare-fun m!1240471 () Bool)

(assert (=> b!1353958 m!1240471))

(declare-fun m!1240473 () Bool)

(assert (=> b!1353947 m!1240473))

(declare-fun m!1240475 () Bool)

(assert (=> b!1353946 m!1240475))

(check-sat (not start!114058) (not b!1353961) (not b!1353953) (not b!1353958) (not b!1353960) (not b!1353955) (not b!1353951) (not b!1353959) (not b!1353950) (not b!1353952) (not b!1353947) (not b!1353946) (not b!1353956) (not b!1353954))
(check-sat)
