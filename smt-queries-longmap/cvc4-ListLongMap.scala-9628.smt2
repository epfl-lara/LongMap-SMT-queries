; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113910 () Bool)

(assert start!113910)

(declare-fun b!1350881 () Bool)

(declare-fun res!896349 () Bool)

(declare-fun e!768399 () Bool)

(assert (=> b!1350881 (=> (not res!896349) (not e!768399))))

(declare-datatypes ((List!31535 0))(
  ( (Nil!31532) (Cons!31531 (h!32740 (_ BitVec 64)) (t!46193 List!31535)) )
))
(declare-fun acc!759 () List!31535)

(declare-fun contains!9244 (List!31535 (_ BitVec 64)) Bool)

(assert (=> b!1350881 (= res!896349 (not (contains!9244 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350882 () Bool)

(declare-fun res!896353 () Bool)

(assert (=> b!1350882 (=> (not res!896353) (not e!768399))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92092 0))(
  ( (array!92093 (arr!44494 (Array (_ BitVec 32) (_ BitVec 64))) (size!45044 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92092)

(assert (=> b!1350882 (= res!896353 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45044 a!3742)))))

(declare-fun b!1350883 () Bool)

(declare-fun res!896341 () Bool)

(assert (=> b!1350883 (=> (not res!896341) (not e!768399))))

(assert (=> b!1350883 (= res!896341 (not (contains!9244 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350884 () Bool)

(declare-fun e!768400 () Bool)

(assert (=> b!1350884 (= e!768400 true)))

(declare-fun lt!597081 () List!31535)

(declare-fun lt!597079 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92092 (_ BitVec 32) List!31535) Bool)

(assert (=> b!1350884 (= lt!597079 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597081))))

(declare-datatypes ((Unit!44242 0))(
  ( (Unit!44243) )
))
(declare-fun lt!597080 () Unit!44242)

(declare-fun noDuplicateSubseq!115 (List!31535 List!31535) Unit!44242)

(assert (=> b!1350884 (= lt!597080 (noDuplicateSubseq!115 acc!759 lt!597081))))

(declare-fun b!1350885 () Bool)

(declare-fun res!896340 () Bool)

(assert (=> b!1350885 (=> (not res!896340) (not e!768399))))

(assert (=> b!1350885 (= res!896340 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350887 () Bool)

(declare-fun res!896342 () Bool)

(assert (=> b!1350887 (=> res!896342 e!768400)))

(declare-fun subseq!664 (List!31535 List!31535) Bool)

(assert (=> b!1350887 (= res!896342 (not (subseq!664 acc!759 lt!597081)))))

(declare-fun b!1350888 () Bool)

(declare-fun res!896345 () Bool)

(assert (=> b!1350888 (=> res!896345 e!768400)))

(assert (=> b!1350888 (= res!896345 (contains!9244 lt!597081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350889 () Bool)

(declare-fun res!896344 () Bool)

(assert (=> b!1350889 (=> (not res!896344) (not e!768399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350889 (= res!896344 (validKeyInArray!0 (select (arr!44494 a!3742) from!3120)))))

(declare-fun b!1350890 () Bool)

(assert (=> b!1350890 (= e!768399 (not e!768400))))

(declare-fun res!896347 () Bool)

(assert (=> b!1350890 (=> res!896347 e!768400)))

(assert (=> b!1350890 (= res!896347 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!679 (List!31535 (_ BitVec 64)) List!31535)

(assert (=> b!1350890 (= lt!597081 ($colon$colon!679 acc!759 (select (arr!44494 a!3742) from!3120)))))

(assert (=> b!1350890 (subseq!664 acc!759 acc!759)))

(declare-fun lt!597082 () Unit!44242)

(declare-fun lemmaListSubSeqRefl!0 (List!31535) Unit!44242)

(assert (=> b!1350890 (= lt!597082 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350891 () Bool)

(declare-fun res!896339 () Bool)

(assert (=> b!1350891 (=> (not res!896339) (not e!768399))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350891 (= res!896339 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45044 a!3742))))))

(declare-fun b!1350892 () Bool)

(declare-fun res!896351 () Bool)

(assert (=> b!1350892 (=> res!896351 e!768400)))

(declare-fun noDuplicate!2101 (List!31535) Bool)

(assert (=> b!1350892 (= res!896351 (not (noDuplicate!2101 lt!597081)))))

(declare-fun b!1350893 () Bool)

(declare-fun res!896346 () Bool)

(assert (=> b!1350893 (=> res!896346 e!768400)))

(assert (=> b!1350893 (= res!896346 (contains!9244 lt!597081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350886 () Bool)

(declare-fun res!896352 () Bool)

(assert (=> b!1350886 (=> (not res!896352) (not e!768399))))

(assert (=> b!1350886 (= res!896352 (noDuplicate!2101 acc!759))))

(declare-fun res!896348 () Bool)

(assert (=> start!113910 (=> (not res!896348) (not e!768399))))

(assert (=> start!113910 (= res!896348 (and (bvslt (size!45044 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45044 a!3742))))))

(assert (=> start!113910 e!768399))

(assert (=> start!113910 true))

(declare-fun array_inv!33522 (array!92092) Bool)

(assert (=> start!113910 (array_inv!33522 a!3742)))

(declare-fun b!1350894 () Bool)

(declare-fun res!896350 () Bool)

(assert (=> b!1350894 (=> (not res!896350) (not e!768399))))

(assert (=> b!1350894 (= res!896350 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31532))))

(declare-fun b!1350895 () Bool)

(declare-fun res!896343 () Bool)

(assert (=> b!1350895 (=> (not res!896343) (not e!768399))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1350895 (= res!896343 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113910 res!896348) b!1350886))

(assert (= (and b!1350886 res!896352) b!1350881))

(assert (= (and b!1350881 res!896349) b!1350883))

(assert (= (and b!1350883 res!896341) b!1350894))

(assert (= (and b!1350894 res!896350) b!1350885))

(assert (= (and b!1350885 res!896340) b!1350891))

(assert (= (and b!1350891 res!896339) b!1350895))

(assert (= (and b!1350895 res!896343) b!1350882))

(assert (= (and b!1350882 res!896353) b!1350889))

(assert (= (and b!1350889 res!896344) b!1350890))

(assert (= (and b!1350890 (not res!896347)) b!1350892))

(assert (= (and b!1350892 (not res!896351)) b!1350893))

(assert (= (and b!1350893 (not res!896346)) b!1350888))

(assert (= (and b!1350888 (not res!896345)) b!1350887))

(assert (= (and b!1350887 (not res!896342)) b!1350884))

(declare-fun m!1238017 () Bool)

(assert (=> start!113910 m!1238017))

(declare-fun m!1238019 () Bool)

(assert (=> b!1350894 m!1238019))

(declare-fun m!1238021 () Bool)

(assert (=> b!1350895 m!1238021))

(declare-fun m!1238023 () Bool)

(assert (=> b!1350889 m!1238023))

(assert (=> b!1350889 m!1238023))

(declare-fun m!1238025 () Bool)

(assert (=> b!1350889 m!1238025))

(declare-fun m!1238027 () Bool)

(assert (=> b!1350884 m!1238027))

(declare-fun m!1238029 () Bool)

(assert (=> b!1350884 m!1238029))

(declare-fun m!1238031 () Bool)

(assert (=> b!1350885 m!1238031))

(declare-fun m!1238033 () Bool)

(assert (=> b!1350881 m!1238033))

(declare-fun m!1238035 () Bool)

(assert (=> b!1350887 m!1238035))

(declare-fun m!1238037 () Bool)

(assert (=> b!1350893 m!1238037))

(declare-fun m!1238039 () Bool)

(assert (=> b!1350883 m!1238039))

(assert (=> b!1350890 m!1238023))

(assert (=> b!1350890 m!1238023))

(declare-fun m!1238041 () Bool)

(assert (=> b!1350890 m!1238041))

(declare-fun m!1238043 () Bool)

(assert (=> b!1350890 m!1238043))

(declare-fun m!1238045 () Bool)

(assert (=> b!1350890 m!1238045))

(declare-fun m!1238047 () Bool)

(assert (=> b!1350888 m!1238047))

(declare-fun m!1238049 () Bool)

(assert (=> b!1350886 m!1238049))

(declare-fun m!1238051 () Bool)

(assert (=> b!1350892 m!1238051))

(push 1)

(assert (not b!1350883))

(assert (not b!1350895))

(assert (not b!1350884))

(assert (not start!113910))

(assert (not b!1350892))

(assert (not b!1350894))

(assert (not b!1350887))

(assert (not b!1350885))

(assert (not b!1350890))

(assert (not b!1350893))

(assert (not b!1350888))

(assert (not b!1350889))

(assert (not b!1350881))

(assert (not b!1350886))

(check-sat)

