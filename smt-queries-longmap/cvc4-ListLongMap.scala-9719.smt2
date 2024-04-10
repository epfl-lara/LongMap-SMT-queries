; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114990 () Bool)

(assert start!114990)

(declare-fun b!1363035 () Bool)

(declare-fun res!906921 () Bool)

(declare-fun e!773047 () Bool)

(assert (=> b!1363035 (=> (not res!906921) (not e!773047))))

(declare-datatypes ((List!31808 0))(
  ( (Nil!31805) (Cons!31804 (h!33013 (_ BitVec 64)) (t!46496 List!31808)) )
))
(declare-fun acc!759 () List!31808)

(declare-fun noDuplicate!2374 (List!31808) Bool)

(assert (=> b!1363035 (= res!906921 (noDuplicate!2374 acc!759))))

(declare-fun b!1363036 () Bool)

(declare-fun res!906924 () Bool)

(assert (=> b!1363036 (=> (not res!906924) (not e!773047))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92668 0))(
  ( (array!92669 (arr!44767 (Array (_ BitVec 32) (_ BitVec 64))) (size!45317 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92668)

(assert (=> b!1363036 (= res!906924 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45317 a!3742)))))

(declare-fun b!1363038 () Bool)

(declare-datatypes ((Unit!44961 0))(
  ( (Unit!44962) )
))
(declare-fun e!773045 () Unit!44961)

(declare-fun lt!600657 () Unit!44961)

(assert (=> b!1363038 (= e!773045 lt!600657)))

(declare-fun lt!600658 () Unit!44961)

(declare-fun lemmaListSubSeqRefl!0 (List!31808) Unit!44961)

(assert (=> b!1363038 (= lt!600658 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!919 (List!31808 List!31808) Bool)

(assert (=> b!1363038 (subseq!919 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92668 List!31808 List!31808 (_ BitVec 32)) Unit!44961)

(declare-fun $colon$colon!922 (List!31808 (_ BitVec 64)) List!31808)

(assert (=> b!1363038 (= lt!600657 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!922 acc!759 (select (arr!44767 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92668 (_ BitVec 32) List!31808) Bool)

(assert (=> b!1363038 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363039 () Bool)

(declare-fun res!906918 () Bool)

(assert (=> b!1363039 (=> (not res!906918) (not e!773047))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363039 (= res!906918 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363040 () Bool)

(declare-fun res!906917 () Bool)

(assert (=> b!1363040 (=> (not res!906917) (not e!773047))))

(assert (=> b!1363040 (= res!906917 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31805))))

(declare-fun b!1363041 () Bool)

(declare-fun res!906925 () Bool)

(assert (=> b!1363041 (=> (not res!906925) (not e!773047))))

(assert (=> b!1363041 (= res!906925 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363042 () Bool)

(assert (=> b!1363042 (= e!773047 false)))

(declare-fun lt!600656 () Unit!44961)

(assert (=> b!1363042 (= lt!600656 e!773045)))

(declare-fun c!127499 () Bool)

(assert (=> b!1363042 (= c!127499 (validKeyInArray!0 (select (arr!44767 a!3742) from!3120)))))

(declare-fun b!1363043 () Bool)

(declare-fun Unit!44963 () Unit!44961)

(assert (=> b!1363043 (= e!773045 Unit!44963)))

(declare-fun res!906919 () Bool)

(assert (=> start!114990 (=> (not res!906919) (not e!773047))))

(assert (=> start!114990 (= res!906919 (and (bvslt (size!45317 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45317 a!3742))))))

(assert (=> start!114990 e!773047))

(assert (=> start!114990 true))

(declare-fun array_inv!33795 (array!92668) Bool)

(assert (=> start!114990 (array_inv!33795 a!3742)))

(declare-fun b!1363037 () Bool)

(declare-fun res!906922 () Bool)

(assert (=> b!1363037 (=> (not res!906922) (not e!773047))))

(declare-fun contains!9517 (List!31808 (_ BitVec 64)) Bool)

(assert (=> b!1363037 (= res!906922 (not (contains!9517 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363044 () Bool)

(declare-fun res!906920 () Bool)

(assert (=> b!1363044 (=> (not res!906920) (not e!773047))))

(assert (=> b!1363044 (= res!906920 (not (contains!9517 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363045 () Bool)

(declare-fun res!906923 () Bool)

(assert (=> b!1363045 (=> (not res!906923) (not e!773047))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363045 (= res!906923 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45317 a!3742))))))

(assert (= (and start!114990 res!906919) b!1363035))

(assert (= (and b!1363035 res!906921) b!1363037))

(assert (= (and b!1363037 res!906922) b!1363044))

(assert (= (and b!1363044 res!906920) b!1363040))

(assert (= (and b!1363040 res!906917) b!1363041))

(assert (= (and b!1363041 res!906925) b!1363045))

(assert (= (and b!1363045 res!906923) b!1363039))

(assert (= (and b!1363039 res!906918) b!1363036))

(assert (= (and b!1363036 res!906924) b!1363042))

(assert (= (and b!1363042 c!127499) b!1363038))

(assert (= (and b!1363042 (not c!127499)) b!1363043))

(declare-fun m!1247919 () Bool)

(assert (=> b!1363041 m!1247919))

(declare-fun m!1247921 () Bool)

(assert (=> b!1363042 m!1247921))

(assert (=> b!1363042 m!1247921))

(declare-fun m!1247923 () Bool)

(assert (=> b!1363042 m!1247923))

(declare-fun m!1247925 () Bool)

(assert (=> b!1363035 m!1247925))

(declare-fun m!1247927 () Bool)

(assert (=> start!114990 m!1247927))

(declare-fun m!1247929 () Bool)

(assert (=> b!1363040 m!1247929))

(declare-fun m!1247931 () Bool)

(assert (=> b!1363037 m!1247931))

(declare-fun m!1247933 () Bool)

(assert (=> b!1363039 m!1247933))

(declare-fun m!1247935 () Bool)

(assert (=> b!1363044 m!1247935))

(declare-fun m!1247937 () Bool)

(assert (=> b!1363038 m!1247937))

(assert (=> b!1363038 m!1247921))

(declare-fun m!1247939 () Bool)

(assert (=> b!1363038 m!1247939))

(declare-fun m!1247941 () Bool)

(assert (=> b!1363038 m!1247941))

(declare-fun m!1247943 () Bool)

(assert (=> b!1363038 m!1247943))

(assert (=> b!1363038 m!1247921))

(assert (=> b!1363038 m!1247939))

(declare-fun m!1247945 () Bool)

(assert (=> b!1363038 m!1247945))

(push 1)

(assert (not b!1363038))

(assert (not b!1363041))

(assert (not b!1363039))

(assert (not start!114990))

(assert (not b!1363044))

(assert (not b!1363035))

(assert (not b!1363042))

(assert (not b!1363040))

(assert (not b!1363037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

