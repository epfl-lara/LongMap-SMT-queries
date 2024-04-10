; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114984 () Bool)

(assert start!114984)

(declare-fun b!1362936 () Bool)

(declare-fun res!906844 () Bool)

(declare-fun e!773018 () Bool)

(assert (=> b!1362936 (=> (not res!906844) (not e!773018))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362936 (= res!906844 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362937 () Bool)

(declare-datatypes ((Unit!44952 0))(
  ( (Unit!44953) )
))
(declare-fun e!773019 () Unit!44952)

(declare-fun Unit!44954 () Unit!44952)

(assert (=> b!1362937 (= e!773019 Unit!44954)))

(declare-fun b!1362938 () Bool)

(declare-fun res!906837 () Bool)

(assert (=> b!1362938 (=> (not res!906837) (not e!773018))))

(declare-datatypes ((List!31805 0))(
  ( (Nil!31802) (Cons!31801 (h!33010 (_ BitVec 64)) (t!46493 List!31805)) )
))
(declare-fun acc!759 () List!31805)

(declare-fun noDuplicate!2371 (List!31805) Bool)

(assert (=> b!1362938 (= res!906837 (noDuplicate!2371 acc!759))))

(declare-fun res!906841 () Bool)

(assert (=> start!114984 (=> (not res!906841) (not e!773018))))

(declare-datatypes ((array!92662 0))(
  ( (array!92663 (arr!44764 (Array (_ BitVec 32) (_ BitVec 64))) (size!45314 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92662)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114984 (= res!906841 (and (bvslt (size!45314 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45314 a!3742))))))

(assert (=> start!114984 e!773018))

(assert (=> start!114984 true))

(declare-fun array_inv!33792 (array!92662) Bool)

(assert (=> start!114984 (array_inv!33792 a!3742)))

(declare-fun b!1362939 () Bool)

(declare-fun res!906836 () Bool)

(assert (=> b!1362939 (=> (not res!906836) (not e!773018))))

(declare-fun contains!9514 (List!31805 (_ BitVec 64)) Bool)

(assert (=> b!1362939 (= res!906836 (not (contains!9514 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362940 () Bool)

(declare-fun lt!600631 () Unit!44952)

(assert (=> b!1362940 (= e!773019 lt!600631)))

(declare-fun lt!600630 () Unit!44952)

(declare-fun lemmaListSubSeqRefl!0 (List!31805) Unit!44952)

(assert (=> b!1362940 (= lt!600630 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!916 (List!31805 List!31805) Bool)

(assert (=> b!1362940 (subseq!916 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92662 List!31805 List!31805 (_ BitVec 32)) Unit!44952)

(declare-fun $colon$colon!919 (List!31805 (_ BitVec 64)) List!31805)

(assert (=> b!1362940 (= lt!600631 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!919 acc!759 (select (arr!44764 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92662 (_ BitVec 32) List!31805) Bool)

(assert (=> b!1362940 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362941 () Bool)

(declare-fun res!906842 () Bool)

(assert (=> b!1362941 (=> (not res!906842) (not e!773018))))

(assert (=> b!1362941 (= res!906842 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45314 a!3742)))))

(declare-fun b!1362942 () Bool)

(assert (=> b!1362942 (= e!773018 false)))

(declare-fun lt!600629 () Unit!44952)

(assert (=> b!1362942 (= lt!600629 e!773019)))

(declare-fun c!127490 () Bool)

(assert (=> b!1362942 (= c!127490 (validKeyInArray!0 (select (arr!44764 a!3742) from!3120)))))

(declare-fun b!1362943 () Bool)

(declare-fun res!906840 () Bool)

(assert (=> b!1362943 (=> (not res!906840) (not e!773018))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362943 (= res!906840 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45314 a!3742))))))

(declare-fun b!1362944 () Bool)

(declare-fun res!906838 () Bool)

(assert (=> b!1362944 (=> (not res!906838) (not e!773018))))

(assert (=> b!1362944 (= res!906838 (not (contains!9514 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362945 () Bool)

(declare-fun res!906843 () Bool)

(assert (=> b!1362945 (=> (not res!906843) (not e!773018))))

(assert (=> b!1362945 (= res!906843 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362946 () Bool)

(declare-fun res!906839 () Bool)

(assert (=> b!1362946 (=> (not res!906839) (not e!773018))))

(assert (=> b!1362946 (= res!906839 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31802))))

(assert (= (and start!114984 res!906841) b!1362938))

(assert (= (and b!1362938 res!906837) b!1362944))

(assert (= (and b!1362944 res!906838) b!1362939))

(assert (= (and b!1362939 res!906836) b!1362946))

(assert (= (and b!1362946 res!906839) b!1362945))

(assert (= (and b!1362945 res!906843) b!1362943))

(assert (= (and b!1362943 res!906840) b!1362936))

(assert (= (and b!1362936 res!906844) b!1362941))

(assert (= (and b!1362941 res!906842) b!1362942))

(assert (= (and b!1362942 c!127490) b!1362940))

(assert (= (and b!1362942 (not c!127490)) b!1362937))

(declare-fun m!1247835 () Bool)

(assert (=> b!1362938 m!1247835))

(declare-fun m!1247837 () Bool)

(assert (=> b!1362942 m!1247837))

(assert (=> b!1362942 m!1247837))

(declare-fun m!1247839 () Bool)

(assert (=> b!1362942 m!1247839))

(declare-fun m!1247841 () Bool)

(assert (=> b!1362946 m!1247841))

(declare-fun m!1247843 () Bool)

(assert (=> b!1362936 m!1247843))

(declare-fun m!1247845 () Bool)

(assert (=> start!114984 m!1247845))

(declare-fun m!1247847 () Bool)

(assert (=> b!1362945 m!1247847))

(declare-fun m!1247849 () Bool)

(assert (=> b!1362940 m!1247849))

(assert (=> b!1362940 m!1247837))

(declare-fun m!1247851 () Bool)

(assert (=> b!1362940 m!1247851))

(declare-fun m!1247853 () Bool)

(assert (=> b!1362940 m!1247853))

(declare-fun m!1247855 () Bool)

(assert (=> b!1362940 m!1247855))

(assert (=> b!1362940 m!1247837))

(assert (=> b!1362940 m!1247851))

(declare-fun m!1247857 () Bool)

(assert (=> b!1362940 m!1247857))

(declare-fun m!1247859 () Bool)

(assert (=> b!1362939 m!1247859))

(declare-fun m!1247861 () Bool)

(assert (=> b!1362944 m!1247861))

(push 1)

(assert (not b!1362942))

(assert (not start!114984))

(assert (not b!1362936))

(assert (not b!1362938))

(assert (not b!1362944))

(assert (not b!1362945))

(assert (not b!1362946))

(assert (not b!1362940))

(assert (not b!1362939))

(check-sat)

